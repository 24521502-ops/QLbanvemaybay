package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.CallableStatement;
import java.util.ArrayList;
import java.util.List;
import util.DBConnection;
import javax.swing.JOptionPane;

public class VeDAO {

    public List<Object[]> layDanhSachVeChoGUI() {
        List<Object[]> list = new ArrayList<>();
        
        // Đã JOIN thêm bảng FLIGHT để lấy FlightNumber và DepartureTime
        String sql = "SELECT t.TicketID, t.BookingID, p.FullName, "
                   + "f.FlightNumber, TO_CHAR(f.DepartureTime, 'DD/MM/YYYY') AS NgayBay, "
                   + "s.Class, t.Price, t.TicketStatus "
                   + "FROM TICKET t "
                   + "LEFT JOIN PASSENGER p ON t.PassengerID = p.PassengerID "
                   + "LEFT JOIN SEAT s ON t.SeatID = s.SeatID "
                   + "LEFT JOIN FLIGHT f ON t.FlightID = f.FlightID "
                   + "ORDER BY t.TicketID DESC"; 

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql);
             ResultSet rs = pst.executeQuery()) {
             
            while (rs.next()) {
                list.add(new Object[]{
                    rs.getString("TicketID"),       // Cột 0
                    rs.getString("BookingID"),      // Cột 1
                    rs.getString("FullName") != null ? rs.getString("FullName") : "Khách vãng lai", // Cột 2
                    rs.getString("FlightNumber"),   // Cột 3 (Mới)
                    rs.getString("NgayBay"),        // Cột 4 (Mới)
                    rs.getString("Class"),          // Cột 5
                    rs.getDouble("Price"),          // Cột 6
                    rs.getString("TicketStatus"),   // Cột 7
                    ""                              // Cột 8 (Nút thao tác)
                });
            }
        } catch (Exception e) {
            System.out.println("Lỗi lấy danh sách vé từ DB: " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }
    
    // ĐÃ SỬA: Gọi Procedure SP_CANCEL_TICKET_FINAL để hủy vé, tính tiền hoàn và lưu lịch sử
    public boolean huyVe(String ticketID) {
        String sql = "{ CALL SP_CANCEL_TICKET_FINAL(?) }";
        try (Connection conn = DBConnection.getConnection();
             CallableStatement cstmt = conn.prepareCall(sql)) {
            
            cstmt.setString(1, ticketID);
            cstmt.execute();
            return true;
            
        } catch (Exception e) {
            System.out.println("Lỗi khi hủy vé: " + e.getMessage());
            e.printStackTrace();
            JOptionPane.showMessageDialog(null, "Lỗi Database khi Hủy vé:\n" + e.getMessage(), "Lỗi Nghiệp Vụ", JOptionPane.ERROR_MESSAGE);
            return false;
        }
    }
    
    // ĐÃ SỬA: Gọi FUNC_CALCULATE_BOARDING_TIME để tính giờ lên máy bay
    public Object[] layThongTinChiTietVe(String ticketID) {
        Object[] data = null;
        String sql = "SELECT "
                   + "t.TicketID, b.BookingID, NVL(p.FullName, 'Khách vãng lai') AS HoTen, "
                   + "s.Class, t.Price, t.TicketStatus, al.AirlineName, "
                   + "dep.IATACode AS DepAirport, arr.IATACode AS ArrAirport, f.FlightNumber, "
                   + "TO_CHAR(f.DepartureTime, 'DD/MM/YYYY') AS NgayBay, "
                   + "TO_CHAR(f.DepartureTime, 'HH24:MI') AS GioKhoiHanh, "
                   + "TO_CHAR(FUNC_CALCULATE_BOARDING_TIME(f.FlightID), 'HH24:MI') AS GioLenMayBay, " // <-- Gọi Function Oracle
                   + "NVL(s.SeatNumber, 'Chưa xếp') AS SeatNo, NVL(f.Gate, 'TBD') AS Gate "
                   + "FROM TICKET t "
                   + "LEFT JOIN BOOKING b ON t.BookingID = b.BookingID "
                   + "LEFT JOIN PASSENGER p ON t.PassengerID = p.PassengerID "
                   + "LEFT JOIN SEAT s ON t.SeatID = s.SeatID "
                   + "LEFT JOIN FLIGHT f ON t.FlightID = f.FlightID "
                   + "LEFT JOIN AIRLINE al ON f.AirlineID = al.AirlineID "
                   + "LEFT JOIN ROUTE r ON f.RouteID = r.RouteID "
                   + "LEFT JOIN AIRPORT dep ON r.DepartureAirportID = dep.AirportID "
                   + "LEFT JOIN AIRPORT arr ON r.ArrivalAirportID = arr.AirportID "
                   + "WHERE t.TicketID = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, ticketID); 
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    data = new Object[15]; 
                    for (int i = 0; i < 15; i++) {
                        data[i] = rs.getObject(i + 1);
                    }
                }
            }
        } catch (Exception e) {
            System.out.println("Lỗi lấy chi tiết vé từ Database thật: " + e.getMessage());
            e.printStackTrace();
        }
        return data;
    }
    
    // 1. LẤY THÔNG TIN CƠ BẢN CỦA VÉ ĐỂ HIỂN THỊ LÊN FORM SỬA
    public Object[] layThongTinVeDeSua(String ticketID) {
        Object[] data = null;
        String sql = "SELECT NVL(p.FullName, 'Khách vãng lai'), t.FlightID " +
                     "FROM TICKET t LEFT JOIN PASSENGER p ON t.PassengerID = p.PassengerID " +
                     "WHERE t.TicketID = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, ticketID);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    data = new Object[]{ rs.getString(1), rs.getString(2) };
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return data;
    }

    // 2. TÌM GHẾ TRỐNG TRÊN CHUYẾN BAY (Loại trừ các ghế đã có người đặt)
    public List<String> layDanhSachGheTrong(String flightID) {
        List<String> list = new ArrayList<>();
        String sql = "SELECT s.SeatID, s.SeatNumber, s.Class " +
                     "FROM SEAT s JOIN FLIGHT f ON s.AircraftID = f.AircraftID " +
                     "WHERE f.FlightID = ? " +
                     "AND s.SeatID NOT IN (SELECT SeatID FROM TICKET WHERE FlightID = ? AND TicketStatus != 'CANCELLED') " +
                     "ORDER BY s.Class, s.SeatNumber";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, flightID);
            pst.setString(2, flightID);
            try (ResultSet rs = pst.executeQuery()) {
                while (rs.next()) {
                    // Dịch tên Hạng ghế cho đẹp
                    String hangGhe = rs.getString("Class");
                    if (hangGhe.equalsIgnoreCase("Economy")) hangGhe = "Phổ thông";
                    else if (hangGhe.equalsIgnoreCase("Business")) hangGhe = "Thương gia";
                    else if (hangGhe.equalsIgnoreCase("Premium Economy")) hangGhe = "Phổ thông đặc biệt";
                    else if (hangGhe.equalsIgnoreCase("First Class")) hangGhe = "Hạng nhất";
                    
                    // Ghép thành chuỗi: "ST01 - 1A - Thương gia"
                    list.add(rs.getString("SeatID") + " - " + rs.getString("SeatNumber") + " - " + hangGhe);
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    // 3. GỌI PROCEDURE ĐỔI VÉ TRONG ORACLE DATABASE
    public boolean doiVeNangHang(String ticketID, String newFlightID, String newSeatID) {
        String sql = "{ CALL SP_CHANGE_FLIGHT_TICKET(?, ?, ?) }";
        try (Connection conn = DBConnection.getConnection();
             CallableStatement cstmt = conn.prepareCall(sql)) {
            
            cstmt.setString(1, ticketID);
            cstmt.setString(2, newFlightID);
            cstmt.setString(3, newSeatID);
            cstmt.execute();
            return true;
            
        } catch (Exception e) {
            // Hứng lỗi (RAISE_APPLICATION_ERROR) từ Oracle và hiển thị cho người dùng
            System.out.println("Lỗi DB khi đổi vé: " + e.getMessage());
            JOptionPane.showMessageDialog(null, 
                "Từ chối thao tác (Database Error):\n" + e.getMessage(), 
                "Lỗi Nghiệp Vụ", 
                JOptionPane.ERROR_MESSAGE);
            return false;
        }
    }
}