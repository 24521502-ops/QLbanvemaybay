/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao.QuanLyDatChoDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import util.DBConnection;

public class BookingDAO {

    // 1. Lấy danh sách Booking để hiển thị lên Bảng
    // 1. Lấy danh sách Booking để hiển thị lên Bảng
    // 1. Lấy danh sách Booking để hiển thị lên Bảng
    public List<Object[]> layDanhSachDatCho() {
        List<Object[]> list = new ArrayList<>();

        // ĐÃ TRẢ LẠI CÂU SQL GỐC: Lấy trực tiếp b.TotalAmount từ bảng BOOKING
        String sql = "WITH FirstTicket AS ("
                + "    SELECT BookingID, FlightID, SeatID, "
                + "           ROW_NUMBER() OVER(PARTITION BY BookingID ORDER BY TicketID) as rn "
                + "    FROM TICKET"
                + ") "
                + "SELECT b.BookingID, c.FullName, c.Email, "
                + "       dep.IATACode || ' -> ' || arr.IATACode AS ChangBay, "
                + "       f.FlightNumber, s.Class, "
                + "       TO_CHAR(f.DepartureTime, 'DD/MM/YYYY HH24:MI') AS NgayDi, "
                + "       b.TotalAmount, " // Cột Tổng tiền có sẵn trong DB
                + "       b.Status "
                + "FROM BOOKING b "
                + "JOIN CUSTOMER c ON b.CustomerID = c.CustomerID "
                + "LEFT JOIN FirstTicket ft ON b.BookingID = ft.BookingID AND ft.rn = 1 "
                + "LEFT JOIN FLIGHT f ON ft.FlightID = f.FlightID "
                + "LEFT JOIN ROUTE r ON f.RouteID = r.RouteID "
                + "LEFT JOIN AIRPORT dep ON r.DepartureAirportID = dep.AirportID "
                + "LEFT JOIN AIRPORT arr ON r.ArrivalAirportID = arr.AirportID "
                + "LEFT JOIN SEAT s ON ft.SeatID = s.SeatID "
                + "WHERE b.Status != 'CANCELLED' "
                + "ORDER BY b.BookingID DESC";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pst = conn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery()) {

            while (rs.next()) {
                list.add(new Object[] {
                        rs.getString("BookingID"), // 0
                        rs.getString("FullName"), // 1
                        rs.getString("Email"), // 2
                        rs.getString("ChangBay"), // 3
                        rs.getString("FlightNumber"), // 4
                        rs.getString("Class"), // 5
                        rs.getString("NgayDi"), // 6
                        rs.getDouble("TotalAmount"), // 7. Lấy chính xác Tổng tiền
                        rs.getString("Status") // 8. Trạng thái
                });
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Lấy danh sách Khách hàng
    public List<String> layDanhSachKhachHang() {
        List<String> list = new ArrayList<>();
        String sql = "SELECT CustomerID, FullName FROM CUSTOMER ORDER BY CustomerID DESC";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pst = conn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery()) {
            while (rs.next()) {
                list.add(rs.getString("CustomerID") + " - " + rs.getString("FullName"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Tìm Khách hàng bằng SĐT
    public String[] timKhachHangBangSdt(String sdt) {
        String sql = "SELECT CustomerID, FullName FROM CUSTOMER WHERE Phone = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, sdt);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    return new String[]{rs.getString("CustomerID"), rs.getString("FullName")};
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // Lấy danh sách Chuyến bay ĐANG MỞ BÁN
    public List<String> layDanhSachChuyenBay() {
        List<String> list = new ArrayList<>();
        String sql = "SELECT f.FlightID, f.FlightNumber, dep.IATACode as DepIATA, arr.IATACode as ArrIATA, TO_CHAR(f.DepartureTime, 'DD/MM/YYYY') as NgayBay "
                + "FROM FLIGHT f "
                + "JOIN ROUTE r ON f.RouteID = r.RouteID "
                + "JOIN AIRPORT dep ON r.DepartureAirportID = dep.AirportID "
                + "JOIN AIRPORT arr ON r.ArrivalAirportID = arr.AirportID "
                + "WHERE f.FlightStatus = 'SCHEDULED' AND f.DepartureTime > SYSDATE "
                + "ORDER BY f.DepartureTime ASC";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pst = conn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery()) {
            while (rs.next()) {
                // Format: FL01 - VN101 (SGN -> HAN) - 12/05/2026
                String display = rs.getString("FlightID") + " - " + rs.getString("FlightNumber")
                        + " (" + rs.getString("DepIATA") + " -> " + rs.getString("ArrIATA") + ") - "
                        + rs.getString("NgayBay");
                list.add(display);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Lấy danh sách GHẾ TRỐNG của 1 chuyến bay cụ thể kèm Giá Tiền
    public List<String> layDanhSachGheTrong(String flightID) {
        List<String> list = new ArrayList<>();
        // Query cực hay: Chỉ lấy ghế thuộc máy bay đó, và loại trừ những ghế đã có vé
        // (TICKET)
        String sql = "SELECT s.SeatID, s.SeatNumber, s.Class, scp.Price "
                + "FROM SEAT s "
                + "JOIN FLIGHT f ON s.AircraftID = f.AircraftID "
                + "JOIN SEATCLASSPRICE scp ON f.FlightID = scp.FlightID AND s.Class = scp.Class "
                + "WHERE f.FlightID = ? "
                + "AND s.SeatID NOT IN (SELECT SeatID FROM TICKET WHERE FlightID = ? AND TicketStatus != 'CANCELLED') "
                + "ORDER BY s.Class, s.SeatNumber";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, flightID);
            pst.setString(2, flightID);
            try (ResultSet rs = pst.executeQuery()) {
                while (rs.next()) {
                    // Format: ST01 - 1A (Thương gia) - 4000000
                    String display = rs.getString("SeatID") + " - " + rs.getString("SeatNumber")
                            + " (" + rs.getString("Class") + ") - " + rs.getInt("Price");
                    list.add(display);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean taoDatChoMoi(String customerID, String tenNguoiDat, String sdtNguoiDat, String employeeID, String flightID, String seatID, String tenNguoiBay, String cccd) {
        String passengerID = null;
        try (Connection conn = DBConnection.getConnection()) {
            conn.setAutoCommit(false);
            
            // 0. Xử lý Người đặt vé (Nếu là khách mới thì Insert)
            if (customerID == null || customerID.trim().isEmpty()) {
                String sqlInsertCustomer = "BEGIN INSERT INTO CUSTOMER (FullName, Phone) VALUES (?, ?) RETURNING CustomerID INTO ?; END;";
                try (java.sql.CallableStatement cstCus = conn.prepareCall(sqlInsertCustomer)) {
                    cstCus.setString(1, tenNguoiDat);
                    cstCus.setString(2, sdtNguoiDat);
                    cstCus.registerOutParameter(3, java.sql.Types.VARCHAR);
                    cstCus.execute();
                    customerID = cstCus.getString(3);
                }
            }
            
            // 1. SP_GET_OR_CREATE_PASSENGER
            String sqlPass = "{CALL SP_GET_OR_CREATE_PASSENGER(?, 'Other', SYSDATE, ?, ?)}";
            try (java.sql.CallableStatement cst = conn.prepareCall(sqlPass)) {
                cst.setString(1, tenNguoiBay);
                cst.setString(2, cccd);
                cst.registerOutParameter(3, java.sql.Types.VARCHAR);
                cst.execute();
                passengerID = cst.getString(3);
            }
            
            // 2. Lấy giá tiền và hạng ghế
            String seatClass = null;
            double price = 0;
            String sqlSeat = "SELECT Class FROM SEAT WHERE SeatID = ?";
            try (PreparedStatement pst = conn.prepareStatement(sqlSeat)) {
                pst.setString(1, seatID);
                try (ResultSet rs = pst.executeQuery()) {
                    if (rs.next()) seatClass = rs.getString("Class");
                }
            }
            String sqlPrice = "SELECT Price FROM SEATCLASSPRICE WHERE FlightID = ? AND Class = ?";
            try (PreparedStatement pst = conn.prepareStatement(sqlPrice)) {
                pst.setString(1, flightID);
                pst.setString(2, seatClass);
                try (ResultSet rs = pst.executeQuery()) {
                    if (rs.next()) price = rs.getDouble("Price");
                }
            }
            
            // 3. Insert BOOKING (BookingID sẽ do Sequence/Trigger xử lý, dùng RETURNING an toàn cho Oracle)
            String sqlBooking = "BEGIN INSERT INTO BOOKING (CustomerID, EmployeeID, Status) VALUES (?, ?, 'PENDING') RETURNING BookingID INTO ?; END;";
            String bookingID = null;
            try (java.sql.CallableStatement cstBooking = conn.prepareCall(sqlBooking)) {
                cstBooking.setString(1, customerID);
                cstBooking.setString(2, employeeID);
                cstBooking.registerOutParameter(3, java.sql.Types.VARCHAR);
                cstBooking.execute();
                bookingID = cstBooking.getString(3);
            }
            
            // 4. Insert TICKET với PassengerID hợp lệ
            String sqlTicket = "INSERT INTO TICKET (BookingID, FlightID, SeatID, PassengerID, Price, TicketStatus) VALUES (?, ?, ?, ?, ?, 'BOOKED')";
            try (PreparedStatement pst = conn.prepareStatement(sqlTicket)) {
                pst.setString(1, bookingID);
                pst.setString(2, flightID);
                pst.setString(3, seatID);
                pst.setString(4, passengerID);
                pst.setDouble(5, price);
                pst.executeUpdate();
            }
            
            conn.commit();
            return true;
        } catch (Exception e) {
            try {
                java.io.PrintWriter pw = new java.io.PrintWriter("error_log.txt");
                e.printStackTrace(pw);
                pw.close();
            } catch (Exception ex) {}
            e.printStackTrace();
            return false;
        }
    }

    // Gọi Procedure SP_CANCEL_BOOKING để hủy đơn và vé
    public boolean huyDatCho(String bookingID, String reason) {
        String sql = "{CALL SP_CANCEL_BOOKING(?, ?)}";
        try (Connection conn = DBConnection.getConnection();
                java.sql.CallableStatement cst = conn.prepareCall(sql)) {
            cst.setString(1, bookingID);
            cst.setString(2, reason);
            cst.execute();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public String layTicketIDTuBooking(String bookingID) {
        String ticketID = "";
        String sql = "SELECT TicketID FROM TICKET WHERE BookingID = ? AND ROWNUM = 1";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, bookingID);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next())
                    ticketID = rs.getString("TicketID");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ticketID;
    }

    // Gọi Procedure SP_CHANGE_FLIGHT_TICKET để đổi chuyến bay / ghế
    public boolean doiChuyenBayVaGhe(String ticketID, String newFlightID, String newSeatID) {
        String sql = "{CALL SP_CHANGE_FLIGHT_TICKET(?, ?, ?)}";
        try (Connection conn = DBConnection.getConnection();
                java.sql.CallableStatement cst = conn.prepareCall(sql)) {
            cst.setString(1, ticketID);
            cst.setString(2, newFlightID);
            cst.setString(3, newSeatID);
            cst.execute();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
