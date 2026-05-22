package dao.FrameAdminDAO;

import dto.NotificationDTO;
import dto.SearchResultDTO;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FrameAdminDAO {

    public List<SearchResultDTO> globalSearch(String keyword) {
        List<SearchResultDTO> results = new ArrayList<>();
        if (keyword == null || keyword.trim().isEmpty()) {
            return results;
        }
        
        String kw = "%" + keyword.trim().toLowerCase() + "%";
        
        // 1. Search Flights (Mã chuyến bay)
        String sqlFlight = "SELECT f.FlightID, f.FlightNumber, dep.IATACode as DepIATA, arr.IATACode as ArrIATA, " +
                           "TO_CHAR(f.DepartureTime, 'DD/MM/YYYY HH24:MI') as DepTime " +
                           "FROM FLIGHT f " +
                           "JOIN ROUTE r ON f.RouteID = r.RouteID " +
                           "JOIN AIRPORT dep ON r.DepartureAirportID = dep.AirportID " +
                           "JOIN AIRPORT arr ON r.ArrivalAirportID = arr.AirportID " +
                           "WHERE LOWER(f.FlightNumber) LIKE ? ";
                           
        // 2. Search Customers (Tên hoặc SĐT)
        String sqlCustomer = "SELECT CustomerID, FullName, Phone " +
                             "FROM CUSTOMER " +
                             "WHERE LOWER(FullName) LIKE ? OR LOWER(Phone) LIKE ? ";
                             
        // 3. Search Bookings (Mã đặt chỗ)
        String sqlBooking = "SELECT BookingID, Status, TO_CHAR(BookingDate, 'DD/MM/YYYY') as BDate " +
                            "FROM BOOKING " +
                            "WHERE LOWER(BookingID) LIKE ? ";

        // 4. Search Tickets (Mã vé hoặc Tên hành khách)
        String sqlTicket = "SELECT t.TicketID, t.TicketStatus, p.FullName, TO_CHAR(f.DepartureTime, 'DD/MM/YYYY') as DepDate " +
                           "FROM TICKET t " +
                           "JOIN PASSENGER p ON t.PassengerID = p.PassengerID " +
                           "JOIN FLIGHT f ON t.FlightID = f.FlightID " +
                           "WHERE LOWER(t.TicketID) LIKE ? OR LOWER(p.FullName) LIKE ? ";

        try (Connection conn = DBConnection.getConnection()) {
            // Flights
            try (PreparedStatement ps = conn.prepareStatement(sqlFlight)) {
                ps.setString(1, kw);
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        String id = rs.getString("FlightID");
                        String title = "Chuyến bay: " + rs.getString("FlightNumber");
                        String sub = rs.getString("DepIATA") + " - " + rs.getString("ArrIATA") + " (" + rs.getString("DepTime") + ")";
                        results.add(new SearchResultDTO("FLIGHT", id, title, sub));
                    }
                }
            }
            // Customers
            try (PreparedStatement ps = conn.prepareStatement(sqlCustomer)) {
                ps.setString(1, kw);
                ps.setString(2, kw);
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        String id = rs.getString("CustomerID");
                        String title = "Khách hàng: " + rs.getString("FullName");
                        String sub = "SĐT: " + (rs.getString("Phone") != null ? rs.getString("Phone") : "N/A");
                        results.add(new SearchResultDTO("CUSTOMER", id, title, sub));
                    }
                }
            }
            // Bookings
            try (PreparedStatement ps = conn.prepareStatement(sqlBooking)) {
                ps.setString(1, kw);
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        String id = rs.getString("BookingID");
                        String title = "Đặt chỗ: " + id;
                        String sub = "Trạng thái: " + rs.getString("Status") + " (" + rs.getString("BDate") + ")";
                        results.add(new SearchResultDTO("BOOKING", id, title, sub));
                    }
                }
            }
            // Tickets
            try (PreparedStatement ps = conn.prepareStatement(sqlTicket)) {
                ps.setString(1, kw);
                ps.setString(2, kw);
                try (ResultSet rs = ps.executeQuery()) {
                    while (rs.next()) {
                        String id = rs.getString("TicketID");
                        String title = "Vé: " + id;
                        String sub = "HK: " + rs.getString("FullName") + " (" + rs.getString("TicketStatus") + ")";
                        results.add(new SearchResultDTO("TICKET", id, title, sub));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return results;
    }

    public List<NotificationDTO> getUrgentNotifications() {
        List<NotificationDTO> notifications = new ArrayList<>();
        
        // 1. Chuyến bay sắp khởi hành (trong vòng 2 giờ)
        String sqlFlight = "SELECT FlightID, FlightNumber, " +
                           "ROUND((DepartureTime - SYSDATE) * 24, 1) as HoursLeft " +
                           "FROM FLIGHT " +
                           "WHERE FlightStatus = 'SCHEDULED' " +
                           "AND DepartureTime BETWEEN SYSDATE AND SYSDATE + (2/24)";
                           
        // 2. Đặt chỗ hết hạn (PENDING quá 24h)
        String sqlBooking = "SELECT BookingID, ROUND((SYSDATE - BookingDate) * 24, 1) as HoursPast " +
                            "FROM BOOKING " +
                            "WHERE Status = 'PENDING' AND SYSDATE - BookingDate > 1";

        // 3. Chuyến bay bị Delay
        String sqlDelayed = "SELECT FlightID, FlightNumber, TO_CHAR(DepartureTime, 'HH24:MI DD/MM') as DepTime " +
                            "FROM FLIGHT " +
                            "WHERE FlightStatus = 'DELAYED'";

        // 4. Chuyến bay sắp hết chỗ (Còn <= 10 ghế)
        String sqlLowSeats = "SELECT f.FlightID, f.FlightNumber, " +
                             "(a.Capacity - (SELECT COUNT(*) FROM TICKET WHERE FlightID = f.FlightID AND TicketStatus != 'CANCELLED')) as SeatsLeft " +
                             "FROM FLIGHT f " +
                             "JOIN AIRCRAFT a ON f.AircraftID = a.AircraftID " +
                             "WHERE f.FlightStatus = 'SCHEDULED' AND f.DepartureTime > SYSDATE " +
                             "AND (a.Capacity - (SELECT COUNT(*) FROM TICKET WHERE FlightID = f.FlightID AND TicketStatus != 'CANCELLED')) <= 10";

        // 5. Đặt chỗ mới (Top 3 mới nhất)
        String sqlNewBooking = "SELECT BookingID, TO_CHAR(BookingDate, 'HH24:MI DD/MM') as BDate, TotalAmount " +
                               "FROM BOOKING " +
                               "WHERE Status = 'CONFIRMED' " +
                               "ORDER BY BookingDate DESC " +
                               "FETCH FIRST 3 ROWS ONLY";

        try (Connection conn = DBConnection.getConnection()) {
            // Check flights
            try (PreparedStatement ps = conn.prepareStatement(sqlFlight);
                 ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    String fNum = rs.getString("FlightNumber");
                    double hoursLeft = rs.getDouble("HoursLeft");
                    
                    NotificationDTO noti = new NotificationDTO();
                    noti.setType("FLIGHT_URGENT");
                    noti.setReferenceId(rs.getString("FlightID"));
                    noti.setMessage("Chuyến bay " + fNum + " sắp khởi hành!");
                    noti.setTimeInfo("Khởi hành sau " + hoursLeft + " giờ");
                    notifications.add(noti);
                }
            }
            
            // Check bookings
            try (PreparedStatement ps = conn.prepareStatement(sqlBooking);
                 ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    String bId = rs.getString("BookingID");
                    double hoursPast = rs.getDouble("HoursPast");
                    
                    NotificationDTO noti = new NotificationDTO();
                    noti.setType("BOOKING_EXPIRING");
                    noti.setReferenceId(bId);
                    noti.setMessage("Đặt chỗ " + bId + " quá hạn thanh toán!");
                    noti.setTimeInfo("Đã quá hạn " + hoursPast + " giờ");
                    notifications.add(noti);
                }
            }

            // Check Delayed Flights
            try (PreparedStatement ps = conn.prepareStatement(sqlDelayed);
                 ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    NotificationDTO noti = new NotificationDTO();
                    noti.setType("FLIGHT_DELAYED");
                    noti.setReferenceId(rs.getString("FlightID"));
                    noti.setMessage("Chuyến bay " + rs.getString("FlightNumber") + " đang bị Delay!");
                    noti.setTimeInfo("Dự kiến: " + rs.getString("DepTime"));
                    notifications.add(noti);
                }
            }

            // Check Low Seats
            try (PreparedStatement ps = conn.prepareStatement(sqlLowSeats);
                 ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    NotificationDTO noti = new NotificationDTO();
                    noti.setType("LOW_SEATS");
                    noti.setReferenceId(rs.getString("FlightID"));
                    noti.setMessage("Chuyến bay " + rs.getString("FlightNumber") + " sắp cháy vé!");
                    noti.setTimeInfo("Chỉ còn trống " + rs.getInt("SeatsLeft") + " ghế");
                    notifications.add(noti);
                }
            }

            // Check New Bookings
            try (PreparedStatement ps = conn.prepareStatement(sqlNewBooking);
                 ResultSet rs = ps.executeQuery()) {
                java.text.DecimalFormat formatter = new java.text.DecimalFormat("###,###,###");
                while (rs.next()) {
                    NotificationDTO noti = new NotificationDTO();
                    noti.setType("NEW_BOOKING");
                    noti.setReferenceId(rs.getString("BookingID"));
                    noti.setMessage("Có đơn đặt chỗ mới: " + rs.getString("BookingID"));
                    noti.setTimeInfo("Lúc " + rs.getString("BDate") + " - " + formatter.format(rs.getDouble("TotalAmount")) + " VNĐ");
                    notifications.add(noti);
                }
            }
            
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return notifications;
    }
}
