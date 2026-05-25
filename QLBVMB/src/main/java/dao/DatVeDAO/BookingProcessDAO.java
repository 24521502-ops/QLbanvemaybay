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

            // 🛡️ [CÁCH 1]: BẬT DÒNG DƯỚI ĐỂ THIẾT LẬP MỨC CÔ LẬP SERIALIZABLE (ĐỂ SỬA LỖI
            // NON-REPEATABLE READ)
            conn.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);

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
                if (conn != null) {
                    conn.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
                    conn.setAutoCommit(true);
                }
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

            // 🛡️ [CÁCH 1]: BẬT DÒNG DƯỚI ĐỂ THIẾT LẬP MỨC CÔ LẬP SERIALIZABLE (ĐỂ SỬA LỖI
            // NON-REPEATABLE READ)
            // conn.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);

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
                    double legPrice = getLegPriceFromDB(conn, flightID, seatClass);

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

            /*
             * =========================================================================
             * [KHỐI DEMO KHÓA - BẬT DÒNG NÀY ĐỂ THẤY ADMIN BỊ BLOCK KHI UPDATE GIÁ]
             * =========================================================================
             * 
             * Nếu bạn muốn demo cho giáo viên thấy Admin bị block khi sửa giá lúc khách
             * hàng đang đặt vé:
             * Hãy bỏ dấu comment (//) ở dòng JOptionPane dưới. Khi bấm thanh toán, một
             * thông báo sẽ hiện ra
             * và giữ giao dịch mở. Trong lúc thông báo này đang hiện, bạn sang DBeaver chạy
             * lệnh UPDATE.
             * Bạn sẽ thấy DBeaver bị treo (chờ khóa). Khi bấm "OK" trên thông báo này, giao
             * dịch Java sẽ commit
             * và giải phóng khóa, giúp DBeaver lập tức chạy xong!
             */
            javax.swing.JOptionPane.showMessageDialog(null,
                    "[DEMO] Đang giữ khóa FOR UPDATE. Hãy sang DBeaver/SQL Client chạy lệnh:\n" +
                    "  UPDATE SEATCLASSPRICE SET Price = 999 WHERE ...\n" +
                    "Bạn sẽ thấy SQL bị TREO (chờ khóa).\nNhấn OK để Commit và giải phóng khóa.");
            /* ========================================================================= */

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

    private double getLegPriceFromDB(Connection conn, String flightID, String seatClass) throws SQLException {
        /*
         * =========================================================================
         * [KHUNG DEMO VÀ KHẮC PHỤC LỖI CONCURRENCY: NON-REPEATABLE READ]
         * =========================================================================
         * 
         * 🛡️ TRẠNG THÁI 1: BẬT MÃ NÀY ĐỂ KHẮC PHỤC LỖI (Sử dụng khóa FOR UPDATE)
         * (Để kích hoạt sửa lỗi, hãy xóa dấu chú thích /* và * / ở khối dưới)
         */

        String lockSql = "SELECT Price FROM SEATCLASSPRICE WHERE FlightID = ? AND Class = ? FOR UPDATE";
        try (PreparedStatement lockPst = conn.prepareStatement(lockSql)) {
            lockPst.setString(1, flightID);
            lockPst.setString(2, seatClass);
            try (ResultSet lockRs = lockPst.executeQuery()) {
                if (!lockRs.next()) {
                    throw new SQLException(
                            "Không tìm thấy cấu hình giá vé cho chuyến bay: " + flightID + ", hạng: " + seatClass);
                }
            }
        }

        /*
         * 💥 TRẠNG THÁI 2: CHẠY KHÔNG KHÓA ĐỂ DEMO LỖI (Đang kích hoạt mặc định)
         * (Khối này sẽ truy vấn trực tiếp giá động từ DUAL mà không khóa dòng)
         */
        String sql = "SELECT FUNC_GET_DYNAMIC_PRICE(?, ?) AS Price FROM DUAL";
        try (PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, flightID);
            pst.setString(2, seatClass);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    return rs.getDouble("Price");
                }
            }
        }
        throw new SQLException("Lỗi khi lấy giá vé từ cơ sở dữ liệu.");
        /* ========================================================================= */
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
                if (conn != null) {
                    conn.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
                    conn.setAutoCommit(true);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public double getBookingTotalFromDB(String bookingID) {
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
        return 0;
    }

    public java.util.Map<String, Double> getTicketBasePricesByFlight(String bookingID) {
        java.util.Map<String, Double> map = new java.util.HashMap<>();
        String sql = "SELECT FlightID, SUM(Price) as TotalBasePrice FROM TICKET WHERE BookingID = ? AND TicketStatus != 'CANCELLED' GROUP BY FlightID";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, bookingID);
            try (ResultSet rs = pst.executeQuery()) {
                while (rs.next()) {
                    map.put(rs.getString("FlightID"), rs.getDouble("TotalBasePrice"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return map;
    }
}
