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

    // Lấy danh sách Chuyến bay ĐANG MỞ BÁN
    public List<String> layDanhSachChuyenBay() {
        List<String> list = new ArrayList<>();
        String sql = "SELECT f.FlightID, f.FlightNumber, dep.IATACode as DepIATA, arr.IATACode as ArrIATA, TO_CHAR(f.DepartureTime, 'DD/MM/YYYY') as NgayBay "
                + "FROM FLIGHT f "
                + "JOIN ROUTE r ON f.RouteID = r.RouteID "
                + "JOIN AIRPORT dep ON r.DepartureAirportID = dep.AirportID "
                + "JOIN AIRPORT arr ON r.ArrivalAirportID = arr.AirportID "
                + "WHERE f.FlightStatus = 'SCHEDULED' "
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

    // Gọi Procedure SP_CREATE_BOOKING_TRANSACTION để tạo đơn
    public boolean taoDatChoMoi(String customerID, String employeeID, String flightID, String seatID) {
        String sql = "{CALL SP_CREATE_BOOKING_TRANSACTION(?, ?, ?, ?)}";
        try (Connection conn = DBConnection.getConnection();
                java.sql.CallableStatement cst = conn.prepareCall(sql)) {
            cst.setString(1, customerID);
            cst.setString(2, employeeID);
            cst.setString(3, flightID);
            cst.setString(4, seatID);
            cst.execute();
            return true;
        } catch (Exception e) {
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
