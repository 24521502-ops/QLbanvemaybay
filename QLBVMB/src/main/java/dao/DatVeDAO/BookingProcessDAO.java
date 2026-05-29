package dao.DatVeDAO;

import util.DBConnection;
import javax.swing.JOptionPane;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingProcessDAO {

    /**
     * BƯỚC 4: XỬ LÝ TRANSACTION & GIỮ GHẾ (Yêu cầu 3.b)
     * TẠO ĐƠN HÀNG & GIỮ GHẾ (Sử dụng Stored Procedure và Transaction an toàn)
     */
    public String createPendingBooking(String customerID, String flightID, List<String> seatNumbers,
            List<dto.PassengerDTO> passengers,
            double price) {
        String bookingID = null;
        Connection conn = DBConnection.getConnection();

        try {
            // Bước 1: Tắt Auto-Commit để tự quản lý Transaction
            conn.setAutoCommit(false);

            // Bước 2: Xử lý hành khách bằng Stored Procedure
            List<String> passengerIds = new ArrayList<>();
            if (passengers != null && !passengers.isEmpty()) {
                for (dto.PassengerDTO p : passengers) {
                    String pId = null;
                    try (CallableStatement cstP = conn
                            .prepareCall("{call SP_GET_OR_CREATE_PASSENGER(?, ?, ?, ?, ?)}")) {
                        cstP.setString(1, p.getFullName());
                        cstP.setString(2, p.getGender());
                        if (p.getDateOfBirth() != null) {
                            cstP.setDate(3, new java.sql.Date(p.getDateOfBirth().getTime()));
                        } else {
                            cstP.setNull(3, java.sql.Types.DATE);
                        }
                        cstP.setString(4, p.getPassportNumber());
                        cstP.registerOutParameter(5, java.sql.Types.VARCHAR);
                        cstP.execute();
                        pId = cstP.getString(5);
                    }
                    if (pId != null)
                        passengerIds.add(pId);
                }
            }

            // Bước 3: Tạo mã Booking PENDING
            try (CallableStatement cstB = conn.prepareCall("{call SP_INIT_PENDING_BOOKING(?, ?)}")) {
                cstB.setString(1, customerID);
                cstB.registerOutParameter(2, java.sql.Types.VARCHAR);
                cstB.execute();
                bookingID = cstB.getString(2);
            }

            if (bookingID == null)
                throw new SQLException("Không tạo được mã đơn hàng.");

            // Bước 4 & 5: Dọn vé treo cũ và chèn vé mới (Giữ chỗ)
            try (CallableStatement cstT = conn.prepareCall("{call SP_CLEANUP_AND_BOOK_TICKET(?, ?, ?, ?, ?)}")) {
                for (int i = 0; i < seatNumbers.size(); i++) {
                    String seatNum = seatNumbers.get(i).trim();
                    String passId = null;
                    if (passengerIds.size() == 1) {
                        passId = passengerIds.get(0);
                    } else if (i < passengerIds.size()) {
                        passId = passengerIds.get(i);
                    }

                    cstT.setString(1, bookingID);
                    cstT.setString(2, flightID);
                    cstT.setString(3, seatNum);
                    if (passId != null) {
                        cstT.setString(4, passId);
                    } else {
                        cstT.setNull(4, java.sql.Types.VARCHAR);
                    }
                    cstT.setDouble(5, price);
                    cstT.addBatch();
                }
                cstT.executeBatch();
            }

            // Bước 6: Gọi thủ tục PL/SQL để tính toán lại tổng tiền hóa đơn (giá vé + 150k
            // phí/vé)
            try (CallableStatement cstRecalc = conn.prepareCall("{call PROC_RECALCULATE_BOOKING_TOTAL(?)}")) {
                cstRecalc.setString(1, bookingID);
                cstRecalc.execute();
            }

            // Bước 7: Commit toàn bộ nếu thành công
            conn.commit();
            return bookingID;

        } catch (SQLException e) {
            // Rollback ngay lập tức khi xảy ra lỗi
            try {
                if (conn != null)
                    conn.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }

            if (e.getErrorCode() == 1) {
                JOptionPane.showMessageDialog(null, "Ghế hoặc hành khách này đã được đăng ký trên chuyến bay!",
                        "Lỗi Database", JOptionPane.ERROR_MESSAGE);
            } else {
                JOptionPane.showMessageDialog(null, "Lỗi Database: " + e.getMessage(),
                        "Lỗi SQL", JOptionPane.ERROR_MESSAGE);
                e.printStackTrace();
            }
            return null;
        } finally {
            try {
                if (conn != null)
                    conn.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * TẠO ĐƠN HÀNG ĐA CHẶNG & GIỮ GHẾ CHO TOÀN BỘ CÁC CHẶNG BAY (Traveloka Style)
     */
    public String createPendingBookingMulti(String customerID, List<String> flightIDs,
            List<List<String>> multiCitySeats,
            List<String> seatClasses, List<dto.PassengerDTO> passengers, double totalPrice) {
        String bookingID = null;
        Connection conn = DBConnection.getConnection();

        try {
            conn.setAutoCommit(false);

            // ==========================================
            // CẤU HÌNH MỨC CÔ LẬP GIAO DỊCH (DEMO)
            // ==========================================
            // Mở dòng này để demo lỗi Non-Repeatable Read:
            // conn.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);

            // Mở dòng này để sửa lỗi Non-Repeatable Read (Sử dụng Serializable):
            // conn.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);
            // ==========================================

            // 1. Xử lý hành khách bằng Stored Procedure
            List<String> passengerIds = new ArrayList<>();
            if (passengers != null && !passengers.isEmpty()) {
                for (dto.PassengerDTO p : passengers) {
                    String pId = null;
                    try (CallableStatement cstP = conn
                            .prepareCall("{call SP_GET_OR_CREATE_PASSENGER(?, ?, ?, ?, ?)}")) {
                        cstP.setString(1, p.getFullName());
                        cstP.setString(2, p.getGender());
                        if (p.getDateOfBirth() != null) {
                            cstP.setDate(3, new java.sql.Date(p.getDateOfBirth().getTime()));
                        } else {
                            cstP.setNull(3, java.sql.Types.DATE);
                        }
                        cstP.setString(4, p.getPassportNumber());
                        cstP.registerOutParameter(5, java.sql.Types.VARCHAR);
                        cstP.execute();
                        pId = cstP.getString(5);
                    }
                    if (pId != null)
                        passengerIds.add(pId);
                }
            }

            // 2. Khởi tạo Booking PENDING
            try (CallableStatement cstB = conn.prepareCall("{call SP_INIT_PENDING_BOOKING(?, ?)}")) {
                cstB.setString(1, customerID);
                cstB.registerOutParameter(2, java.sql.Types.VARCHAR);
                cstB.execute();
                bookingID = cstB.getString(2);
            }

            if (bookingID == null)
                throw new SQLException("Không tạo được mã đơn hàng.");

            // 3. Giữ ghế và dọn dẹp cho từng chặng bay
            try (CallableStatement cstT = conn.prepareCall("{call SP_CLEANUP_AND_BOOK_TICKET(?, ?, ?, ?, ?)}")) {
                for (int legIdx = 0; legIdx < flightIDs.size(); legIdx++) {
                    String flightID = flightIDs.get(legIdx);
                    List<String> seats = multiCitySeats.get(legIdx);
                    String seatClass = seatClasses.get(legIdx);
                    double legPrice1 = getLegPriceFromDB(conn, flightID, seatClass);

                    try {
                        System.out.println(">>> [DEMO ISO LEVEL] Đọc giá vé lần 1: " + legPrice1 + " VNĐ.");
                        System.out.println(">>> [DEMO ISO LEVEL] Đang sleep 15 giây để chờ Admin cập nhật giá...");
                        Thread.sleep(15000);
                    } catch (InterruptedException ex) {
                        ex.printStackTrace();
                    }

                    double legPrice2 = getLegPriceFromDB(conn, flightID, seatClass);
                    double legPrice = legPrice2;

                    System.out.println(">>> [DEMO ISO LEVEL] Đọc giá vé lần 2: " + legPrice2 + " VNĐ.");
                    if (legPrice1 != legPrice2) {
                        System.out.println(">>> [DEMO ISO LEVEL] PHÁT HIỆN LỖI: Giá vé thay đổi từ " + legPrice1
                                + " -> " + legPrice2 + " (Non-Repeatable Read xảy ra dưới READ COMMITTED)!");
                    } else {
                        System.out.println(">>> [DEMO ISO LEVEL] THÀNH CÔNG: Giá vé giữ nguyên " + legPrice1
                                + " (Tránh lỗi dưới SERIALIZABLE)!");
                    }

                    for (int i = 0; i < seats.size(); i++) {
                        String seatNum = seats.get(i).trim();
                        String passId = null;
                        if (passengerIds.size() == 1) {
                            passId = passengerIds.get(0);
                        } else if (i < passengerIds.size()) {
                            passId = passengerIds.get(i);
                        }

                        cstT.setString(1, bookingID);
                        cstT.setString(2, flightID);
                        cstT.setString(3, seatNum);
                        if (passId != null) {
                            cstT.setString(4, passId);
                        } else {
                            cstT.setNull(4, java.sql.Types.VARCHAR);
                        }
                        cstT.setDouble(5, legPrice);
                        cstT.addBatch();
                    }
                }
                cstT.executeBatch();
            }

            // 4. Tính lại tổng hóa đơn
            try (CallableStatement cstRecalc = conn.prepareCall("{call PROC_RECALCULATE_BOOKING_TOTAL(?)}")) {
                cstRecalc.setString(1, bookingID);
                cstRecalc.execute();
            }

            conn.commit();
            return bookingID;

        } catch (SQLException e) {
            try {
                if (conn != null)
                    conn.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            if (e.getErrorCode() == 1) {
                JOptionPane.showMessageDialog(null, "Ghế hoặc hành khách này đã được đăng ký trên chuyến bay!",
                        "Lỗi Database", JOptionPane.ERROR_MESSAGE);
            } else {
                JOptionPane.showMessageDialog(null, "Lỗi Database: " + e.getMessage(),
                        "Lỗi SQL", JOptionPane.ERROR_MESSAGE);
                e.printStackTrace();
            }
            return null;
        } finally {
            try {
                if (conn != null)
                    conn.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private double getLegPriceFromDB(Connection conn, String flightID, String seatClass) {
        String sql = "SELECT FUNC_GET_DYNAMIC_PRICE(?, ?) AS Price FROM DUAL";
        try (PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, flightID);
            pst.setString(2, seatClass);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    return rs.getDouble("Price");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 1200000; // Mặc định nếu xảy ra sự cố
    }

    /**
     * GIẢI PHÓNG GHẾ (Yêu cầu 4)
     * Gọi Stored Procedure SP_CANCEL_BOOKING có sẵn trong DB để quản lý giao dịch
     * hoàn tiền tự động
     */
    public boolean cancelBooking(String bookingID) {
        if (bookingID == null)
            return false;
        Connection conn = DBConnection.getConnection();
        try {
            conn.setAutoCommit(false);
            try (CallableStatement cst = conn.prepareCall("{call SP_CANCEL_BOOKING(?, ?)}")) {
                cst.setString(1, bookingID);
                cst.setString(2, "Khách hàng yêu cầu hủy giữ chỗ");
                cst.execute();
            }
            conn.commit();
            return true;
        } catch (SQLException e) {
            try {
                if (conn != null)
                    conn.rollback();
            } catch (SQLException ex) {
            }
            return false;
        } finally {
            try {
                if (conn != null)
                    conn.setAutoCommit(true);
            } catch (SQLException e) {
            }
        }
    }

    /**
     * HOÀN TẤT THANH TOÁN (Sử dụng Stored Procedure SP_FINALIZE_BOOKING tối ưu)
     */
    public boolean finalizeBooking(String bookingID, String paymentMethod, double amount) {
        Connection conn = DBConnection.getConnection();
        try {
            conn.setAutoCommit(false);
            try (CallableStatement cst = conn.prepareCall("{call SP_FINALIZE_BOOKING(?, ?, ?)}")) {
                cst.setString(1, bookingID);
                cst.setString(2, paymentMethod);
                cst.setDouble(3, amount);
                cst.execute();
            }
            conn.commit();
            return true;
        } catch (SQLException e) {
            try {
                if (conn != null)
                    conn.rollback();
            } catch (SQLException ex) {
            }
            return false;
        } finally {
            try {
                if (conn != null)
                    conn.setAutoCommit(true);
            } catch (SQLException e) {
            }
        }
    }

    /**
     * CẬP NHẬT THÔNG TIN HÀNH KHÁCH SAU KHI GIỮ GHẾ
     * Gọi Stored Procedure SP_UPDATE_BOOKING_PASSENGER theo Batch
     */
    public boolean updatePassengerInfo(String bookingID, List<dto.PassengerDTO> passengers) {
        if (bookingID == null || passengers == null || passengers.isEmpty())
            return false;
        Connection conn = DBConnection.getConnection();
        try {
            conn.setAutoCommit(false);
            for (int i = 0; i < passengers.size(); i++) {
                dto.PassengerDTO p = passengers.get(i);
                try (CallableStatement cst = conn.prepareCall("{call SP_UPDATE_BOOKING_PASSENGER(?, ?, ?, ?, ?, ?)}")) {
                    cst.setString(1, bookingID);
                    cst.setString(2, p.getFullName());
                    cst.setString(3, p.getGender());
                    if (p.getDateOfBirth() != null) {
                        cst.setDate(4, new java.sql.Date(p.getDateOfBirth().getTime()));
                    } else {
                        cst.setNull(4, java.sql.Types.DATE);
                    }
                    cst.setString(5, p.getPassportNumber());
                    cst.setInt(6, i + 1); // Oracle Index bắt đầu từ 1
                    cst.execute();
                }
            }
            conn.commit();
            return true;
        } catch (SQLException e) {
            try {
                if (conn != null)
                    conn.rollback();
            } catch (SQLException ex) {
            }
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (conn != null)
                    conn.setAutoCommit(true);
            } catch (SQLException e) {
            }
        }
    }

    public double getBookingTotalAmount(String bookingID) {
        String sql = "SELECT TotalAmount FROM BOOKING WHERE BookingID = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, bookingID);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    return rs.getDouble("TotalAmount");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0.0;
    }

    public java.util.Map<String, Double> getTicketPricesByFlight(String bookingID) {
        java.util.Map<String, Double> prices = new java.util.HashMap<>();
        String sql = "SELECT FlightID, MAX(Price) AS Price FROM TICKET WHERE BookingID = ? AND TicketStatus != 'CANCELLED' GROUP BY FlightID";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, bookingID);
            try (ResultSet rs = pst.executeQuery()) {
                while (rs.next()) {
                    prices.put(rs.getString("FlightID"), rs.getDouble("Price"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return prices;
    }
}
