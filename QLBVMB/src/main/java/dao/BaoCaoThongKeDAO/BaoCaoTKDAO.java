package dao;

import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BaoCaoTKDAO {
    public List<Object[]> getAllAirlines() {
        List<Object[]> list = new ArrayList<>();
        String sql = "SELECT AirlineID, AirlineName FROM AIRLINE ORDER BY AirlineName";
        try (Connection con = DBConnection.getConnection()) {
            if (con == null) return list;
            try (Statement st = con.createStatement(); ResultSet rs = st.executeQuery(sql)) {
                while (rs.next()) {
                    list.add(new Object[]{ rs.getString("AirlineID"), rs.getString("AirlineName") });
                }
            }
        } catch (SQLException e) { throw new RuntimeException("Lỗi lấy danh sách hãng bay: " + e.getMessage()); }
        return list;
    }

    // ==================== VIEWS (NEW) ====================
    public Object[] getDashboardSummary() {
        // Cột mới: Total_Revenue, Total_Bookings, Completed_Flights, Global_Occupancy_Rate
        String sql = "SELECT Total_Revenue, Total_Bookings, Completed_Flights, Global_Occupancy_Rate FROM VIEW_DASHBOARD_SUMMARY";
        try (Connection con = DBConnection.getConnection()) {
            if (con == null) throw new RuntimeException("Không thể kết nối đến Database (con = null)");
            try (Statement st = con.createStatement(); ResultSet rs = st.executeQuery(sql)) {
                if (rs.next()) {
                    return new Object[]{
                        rs.getDouble("Total_Revenue"),
                        rs.getInt("Total_Bookings"),
                        rs.getInt("Completed_Flights"),
                        rs.getDouble("Global_Occupancy_Rate")
                    };
                }
            }
        } catch (SQLException e) { throw new RuntimeException("Lỗi truy vấn VIEW_DASHBOARD_SUMMARY: " + e.getMessage()); }
        return new Object[]{0.0, 0, 0, 0.0};
    }

    public List<Object[]> getRevenueByClass() {
        List<Object[]> list = new ArrayList<>();
        // Cột: Seat_Class, Total_Revenue, Ticket_Count, Revenue_Percentage
        String sql = "SELECT Seat_Class, Total_Revenue, Ticket_Count, Revenue_Percentage FROM VIEW_REVENUE_BY_CLASS ORDER BY Total_Revenue DESC";
        try (Connection con = DBConnection.getConnection()) {
            if (con == null) throw new RuntimeException("Không thể kết nối đến Database (con = null)");
            try (Statement st = con.createStatement(); ResultSet rs = st.executeQuery(sql)) {
                while (rs.next()) {
                    list.add(new Object[]{
                        rs.getString("Seat_Class"),
                        rs.getDouble("Total_Revenue"),
                        rs.getInt("Ticket_Count"),
                        rs.getDouble("Revenue_Percentage")
                    });
                }
            }
        } catch (SQLException e) { throw new RuntimeException("Lỗi truy vấn VIEW_REVENUE_BY_CLASS: " + e.getMessage()); }
        return list;
    }

    public double[] getRevenueByMonth(int year) {
        double[] result = new double[12];
        // Bỏ lọc theo năm, lấy tất cả dữ liệu có trong View cộng dồn theo tháng để đảm bảo luôn hiện số
        String sql = "SELECT Month_Year, Monthly_Revenue FROM VIEW_REVENUE_BY_MONTH";
        try (Connection con = DBConnection.getConnection()) {
            if (con == null) throw new RuntimeException("Không thể kết nối đến Database (con = null)");
            try (Statement st = con.createStatement();
                 ResultSet rs = st.executeQuery(sql)) {
                while (rs.next()) {
                    String my = rs.getString(1); // Format: YYYY-MM
                    if (my != null && my.length() >= 7) {
                        int month = Integer.parseInt(my.substring(5, 7));
                        result[month - 1] += rs.getDouble(2); // Cộng dồn các năm lại
                    }
                }
            }
        } catch (SQLException e) { throw new RuntimeException("Lỗi truy vấn VIEW_REVENUE_BY_MONTH: " + e.getMessage()); }
        return result;
    }

    public List<Object[]> getBookingStatusStats(Date tuNgay, Date denNgay, String hangBay) {
        List<Object[]> list = new ArrayList<>();
        String sql = "SELECT b.Status, COUNT(*) AS Quantity " +
                     "FROM Booking b " +
                     "JOIN Ticket t ON b.BookingID = t.BookingID " +
                     "JOIN Flight f ON t.FlightID = f.FlightID " +
                     "WHERE b.BookingDate BETWEEN ? AND ? " +
                     "AND (? = 'ALL' OR f.AirlineID = ?) " +
                     "GROUP BY b.Status";
        try (Connection con = DBConnection.getConnection()) {
            if (con == null) return list;
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setDate(1, tuNgay); ps.setDate(2, denNgay);
                ps.setString(3, hangBay); ps.setString(4, hangBay);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    list.add(new Object[]{ rs.getString(1), rs.getDouble(2), 0.0 }); // 0.0 là placeholder cho %
                }
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    // ──────────── Tổng doanh thu (VND) ────────────
    public double getTongDoanhThu(Date tuNgay, Date denNgay, String hangBay) {
        String sql = "SELECT NVL(SUM(p.Amount), 0) FROM Payment p " +
                     "JOIN Booking b ON p.BookingID = b.BookingID " +
                     "JOIN Ticket t ON b.BookingID = t.BookingID " +
                     "JOIN Flight f ON t.FlightID = f.FlightID " +
                     "WHERE p.PaymentDate BETWEEN ? AND ? " +
                     "AND (? = 'ALL' OR f.AirlineID = ?)";
        try (Connection con = DBConnection.getConnection()) {
            if (con == null) return 0;
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setDate(1, tuNgay); ps.setDate(2, denNgay);
                ps.setString(3, hangBay); ps.setString(4, hangBay);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) return rs.getDouble(1);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return 0;
    }

    // ──────────── Tổng số đặt chỗ ────────────
    public int getTongDatCho(Date tuNgay, Date denNgay, String hangBay) {
        String sql = "SELECT COUNT(DISTINCT b.BookingID) FROM Booking b " +
                     "JOIN Ticket t ON b.BookingID = t.BookingID " +
                     "JOIN Flight f ON t.FlightID = f.FlightID " +
                     "WHERE b.BookingDate BETWEEN ? AND ? " +
                     "AND (? = 'ALL' OR f.AirlineID = ?)";
        try (Connection con = DBConnection.getConnection()) {
            if (con == null) return 0;
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setDate(1, tuNgay); ps.setDate(2, denNgay);
                ps.setString(3, hangBay); ps.setString(4, hangBay);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) return rs.getInt(1);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return 0;
    }

    // ──────────── Tỷ lệ lấp đầy ghế (%) ────────────
    public double getTyLeLapDay(Date tuNgay, Date denNgay, String hangBay) {
        String sql = "SELECT ROUND(COUNT(t.TicketID) * 100.0 / NULLIF(COUNT(s.SeatID), 0), 1) " +
                     "FROM Flight f " +
                     "LEFT JOIN Seat s ON s.AircraftID = f.AircraftID " +
                     "LEFT JOIN Ticket t ON t.FlightID = f.FlightID AND t.SeatID = s.SeatID " +
                     "WHERE f.DepartureTime BETWEEN ? AND ? " +
                     "AND (? = 'ALL' OR f.AirlineID = ?)";
        try (Connection con = DBConnection.getConnection()) {
            if (con == null) return 0;
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setDate(1, tuNgay); ps.setDate(2, denNgay);
                ps.setString(3, hangBay); ps.setString(4, hangBay);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) return rs.getDouble(1);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return 0;
    }

    // ──────────── Số chuyến bay hoàn thành ────────────
    public int getSoChuyenBayHoanThanh(Date tuNgay, Date denNgay, String hangBay) {
        String sql = "SELECT COUNT(*) FROM Flight f " +
                     "WHERE f.FlightStatus = 'COMPLETED' " +
                     "AND f.DepartureTime BETWEEN ? AND ? " +
                     "AND (? = 'ALL' OR f.AirlineID = ?)";
        try (Connection con = DBConnection.getConnection()) {
            if (con == null) return 0;
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setDate(1, tuNgay); ps.setDate(2, denNgay);
                ps.setString(3, hangBay); ps.setString(4, hangBay);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) return rs.getInt(1);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return 0;
    }

    // ──────────── Xu hướng doanh thu theo tháng (12 tháng) ────────────
    public double[] getDoanhThuTheoThang(int nam, String hangBay) {
        double[] result = new double[12];
        String sql = "SELECT EXTRACT(MONTH FROM p.PaymentDate) AS thang, " +
                     "       NVL(SUM(p.Amount), 0) AS tong " +
                     "FROM Payment p " +
                     "JOIN Booking b ON p.BookingID = b.BookingID " +
                     "JOIN Ticket t ON b.BookingID = t.BookingID " +
                     "JOIN Flight f ON t.FlightID = f.FlightID " +
                     "WHERE EXTRACT(YEAR FROM p.PaymentDate) = ? " +
                     "AND (? = 'ALL' OR f.AirlineID = ?) " +
                     "GROUP BY EXTRACT(MONTH FROM p.PaymentDate) ORDER BY thang";
        try (Connection con = DBConnection.getConnection()) {
            if (con == null) return result;
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, nam); ps.setString(2, hangBay); ps.setString(3, hangBay);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) result[rs.getInt("thang") - 1] = rs.getDouble("tong");
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return result;
    }

    // ──────────── Doanh thu theo Hạng ghế ────────────
    // Object[]: {tenHang (String), tongTien (Double)}
    public List<Object[]> getDoanhThuTheoHang(Date tuNgay, Date denNgay, String hangBay) {
        List<Object[]> list = new ArrayList<>();
        String sql = "SELECT s.Class, NVL(SUM(p.Amount), 0) AS tong " +
                     "FROM Payment p " +
                     "JOIN Booking b ON p.BookingID = b.BookingID " +
                     "JOIN Ticket t ON b.BookingID = t.BookingID " +
                     "JOIN Seat s ON t.SeatID = s.SeatID " +
                     "JOIN Flight f ON t.FlightID = f.FlightID " +
                     "WHERE p.PaymentDate BETWEEN ? AND ? " +
                     "AND (? = 'ALL' OR f.AirlineID = ?) " +
                     "GROUP BY s.Class ORDER BY s.Class";
        try (Connection con = DBConnection.getConnection()) {
            if (con == null) return list;
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setDate(1, tuNgay); ps.setDate(2, denNgay);
                ps.setString(3, hangBay); ps.setString(4, hangBay);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) list.add(new Object[]{rs.getString(1), rs.getDouble(2)});
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    // ──────────── Số vé theo hạng ghế ────────────
    // Object[]: {tenHang (String), soVe (Integer)}
    public List<Object[]> getSoVeTheoHang(Date tuNgay, Date denNgay, String hangBay) {
        List<Object[]> list = new ArrayList<>();
        String sql = "SELECT s.Class, COUNT(t.TicketID) AS soVe " +
                     "FROM Ticket t " +
                     "JOIN Seat s ON t.SeatID = s.SeatID " +
                     "JOIN Flight f ON t.FlightID = f.FlightID " +
                     "WHERE f.DepartureTime BETWEEN ? AND ? " +
                     "AND (? = 'ALL' OR f.AirlineID = ?) " +
                     "GROUP BY s.Class ORDER BY s.Class";
        try (Connection con = DBConnection.getConnection()) {
            if (con == null) return list;
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setDate(1, tuNgay); ps.setDate(2, denNgay);
                ps.setString(3, hangBay); ps.setString(4, hangBay);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) list.add(new Object[]{rs.getString(1), rs.getInt(2)});
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    // ──────────── Tỷ lệ lấp đầy theo hạng ghế ────────────
    // double[3]: [0]=Phổ thông, [1]=Thương gia, [2]=Hạng nhất (%)
    public double[] getTyLeLapDayTheoHang(Date tuNgay, Date denNgay, String hangBay) {
        double[] result = new double[3];
        String sql = "SELECT s.Class, " +
                     "       ROUND(COUNT(t.TicketID) * 100.0 / NULLIF(COUNT(s2.SeatID), 0), 1) AS tyLe " +
                     "FROM Flight f " +
                     "LEFT JOIN Seat s2 ON s2.AircraftID = f.AircraftID " +
                     "LEFT JOIN Ticket t ON t.FlightID = f.FlightID AND t.SeatID = s2.SeatID " +
                     "LEFT JOIN Seat s ON t.SeatID = s.SeatID " +
                     "WHERE f.DepartureTime BETWEEN ? AND ? " +
                     "AND (? = 'ALL' OR f.AirlineID = ?) " +
                     "GROUP BY s.SeatClass ORDER BY s.SeatClass";
        try (Connection con = DBConnection.getConnection()) {
            if (con == null) return result;
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setDate(1, tuNgay); ps.setDate(2, denNgay);
                ps.setString(3, hangBay); ps.setString(4, hangBay);
                ResultSet rs = ps.executeQuery();
                int i = 0;
                while (rs.next() && i < 3) result[i++] = rs.getDouble("tyLe");
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return result;
    }

    // ──────────── Doanh thu theo tuyến bay ────────────
    // Object[]: {tenTuyen (String), tongTien (Double)}
    public List<Object[]> getDoanhThuTheoTuyen(Date tuNgay, Date denNgay, String hangBay) {
        List<Object[]> list = new ArrayList<>();
        String sql = "SELECT r.DepartureAirportID || ' -> ' || r.ArrivalAirportID AS tuyen, " +
                     "       NVL(SUM(p.Amount), 0) AS tong " +
                     "FROM Payment p " +
                     "JOIN Booking b ON p.BookingID = b.BookingID " +
                     "JOIN Ticket t ON b.BookingID = t.BookingID " +
                     "JOIN Flight f ON t.FlightID = f.FlightID " +
                     "JOIN Route r ON f.RouteID = r.RouteID " +
                     "WHERE p.PaymentDate BETWEEN ? AND ? " +
                     "AND (? = 'ALL' OR f.AirlineID = ?) " +
                     "GROUP BY r.DepartureAirportID, r.ArrivalAirportID " +
                     "ORDER BY tong DESC";
        try (Connection con = DBConnection.getConnection()) {
            if (con == null) return list;
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setDate(1, tuNgay); ps.setDate(2, denNgay);
                ps.setString(3, hangBay); ps.setString(4, hangBay);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) list.add(new Object[]{rs.getString(1), rs.getDouble(2)});
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    // ──────────── Tỷ lệ lấp đầy theo tuyến bay ────────────
    // Object[]: {tenTuyen (String), tyLe (Double)}
    public List<Object[]> getTyLeLapDayTheoTuyen(Date tuNgay, Date denNgay, String hangBay) {
        List<Object[]> list = new ArrayList<>();
        String sql = "SELECT r.DepartureAirportID || ' -> ' || r.ArrivalAirportID AS tuyen, " +
                     "       ROUND(COUNT(t.TicketID) * 100.0 / NULLIF(COUNT(s.SeatID), 0), 1) AS tyLe " +
                     "FROM Flight f " +
                     "JOIN Route r ON f.RouteID = r.RouteID " +
                     "LEFT JOIN Seat s ON s.AircraftID = f.AircraftID " +
                     "LEFT JOIN Ticket t ON t.FlightID = f.FlightID AND t.SeatID = s.SeatID " +
                     "WHERE f.DepartureTime BETWEEN ? AND ? " +
                     "AND (? = 'ALL' OR f.AirlineID = ?) " +
                     "GROUP BY r.DepartureAirportID, r.ArrivalAirportID " +
                     "ORDER BY tyLe DESC";
        try (Connection con = DBConnection.getConnection()) {
            if (con == null) return list;
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setDate(1, tuNgay); ps.setDate(2, denNgay);
                ps.setString(3, hangBay); ps.setString(4, hangBay);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) list.add(new Object[]{rs.getString(1), rs.getDouble(2)});
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    // ──────────── Số chuyến bay theo tuyến ────────────
    // Object[]: {tenTuyen (String), soChuyenBay (Integer)}
    public List<Object[]> getSoChuyenBayTheoTuyen(Date tuNgay, Date denNgay, String hangBay) {
        List<Object[]> list = new ArrayList<>();
        String sql = "SELECT r.DepartureAirportID || ' -> ' || r.ArrivalAirportID AS tuyen, " +
                     "       COUNT(DISTINCT f.FlightID) AS soChuyen " +
                     "FROM Flight f " +
                     "JOIN Route r ON f.RouteID = r.RouteID " +
                     "WHERE f.DepartureTime BETWEEN ? AND ? " +
                     "AND (? = 'ALL' OR f.AirlineID = ?) " +
                     "GROUP BY r.DepartureAirportID, r.ArrivalAirportID " +
                     "ORDER BY soChuyen DESC";
        try (Connection con = DBConnection.getConnection()) {
            if (con == null) return list;
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setDate(1, tuNgay); ps.setDate(2, denNgay);
                ps.setString(3, hangBay); ps.setString(4, hangBay);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) list.add(new Object[]{rs.getString(1), rs.getInt(2)});
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    // ──────────── Thông tin chuyến bay chi tiết ────────────
    // Object[]: {flightID, flightNumber, tuyen, departureTime, soVe, doanhThu, tyLeLapDay, trangThai}
    public List<Object[]> getThongTinChuyenBayChiTiet(Date tuNgay, Date denNgay, String hangBay) {
        List<Object[]> list = new ArrayList<>();
        String sql = "SELECT f.FlightID, f.FlightNumber, " +
                     "       r.DepartureAirportID || ' -> ' || r.ArrivalAirportID AS tuyen, " +
                     "       f.DepartureTime, " +
                     "       COUNT(t.TicketID) AS soVe, " +
                     "       NVL(SUM(p.Amount), 0) AS doanhThu, " +
                     "       ROUND(COUNT(t.TicketID) * 100.0 / NULLIF(" +
                     "         (SELECT COUNT(*) FROM Seat s2 WHERE s2.AircraftID = f.AircraftID), 0), 1) AS tyLe, " +
                     "       f.FlightStatus " +
                     "FROM Flight f " +
                     "JOIN Route r ON f.RouteID = r.RouteID " +
                     "LEFT JOIN Ticket t ON t.FlightID = f.FlightID " +
                     "LEFT JOIN Booking b ON t.BookingID = b.BookingID " +
                     "LEFT JOIN Payment p ON p.BookingID = b.BookingID " +
                     "WHERE f.DepartureTime BETWEEN ? AND ? " +
                     "AND (? = 'ALL' OR f.AirlineID = ?) " +
                     "GROUP BY f.FlightID, f.FlightNumber, r.DepartureAirportID, r.ArrivalAirportID, " +
                     "         f.DepartureTime, f.AircraftID, f.FlightStatus " +
                     "ORDER BY f.DepartureTime";
        try (Connection con = DBConnection.getConnection()) {
            if (con == null) return list;
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setDate(1, tuNgay); ps.setDate(2, denNgay);
                ps.setString(3, hangBay); ps.setString(4, hangBay);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    list.add(new Object[]{
                        rs.getString("FlightID"),
                        rs.getString("FlightNumber"),
                        rs.getString("tuyen"),
                        rs.getTimestamp("DepartureTime"),
                        rs.getInt("soVe"),
                        rs.getDouble("doanhThu"),
                        rs.getDouble("tyLe"),
                        rs.getString("FlightStatus")
                    });
                }
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    // ──────────── Xu hướng doanh thu theo tuyến đường (12 tháng) ────────────
    // double[12]: index 0 = T1, index 11 = T12
    public double[] getDoanhThuTheoTuyenDuong(String tuyenBay, int nam) {
        double[] result = new double[12];
        // tuyenBay dạng "SGN -> HAN"
        String[] parts = tuyenBay.split(" -> ");
        if (parts.length < 2) return result;
        String sql = "SELECT EXTRACT(MONTH FROM p.PaymentDate) AS thang, " +
                     "       NVL(SUM(p.Amount), 0) AS tong " +
                     "FROM Payment p " +
                     "JOIN Booking b ON p.BookingID = b.BookingID " +
                     "JOIN Ticket t ON b.BookingID = t.BookingID " +
                     "JOIN Flight f ON t.FlightID = f.FlightID " +
                     "JOIN Route r ON f.RouteID = r.RouteID " +
                     "WHERE EXTRACT(YEAR FROM p.PaymentDate) = ? " +
                     "AND r.DepartureAirportID = ? AND r.ArrivalAirportID = ? " +
                     "GROUP BY EXTRACT(MONTH FROM p.PaymentDate) ORDER BY thang";
        try (Connection con = DBConnection.getConnection()) {
            if (con == null) return result;
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, nam);
                ps.setString(2, parts[0].trim());
                ps.setString(3, parts[1].trim());
                ResultSet rs = ps.executeQuery();
                while (rs.next()) result[rs.getInt("thang") - 1] = rs.getDouble("tong");
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return result;
    }

    // ──────────── Danh sách hãng bay ────────────
    public List<String> getDanhSachHangBay() {
        List<String> list = new ArrayList<>();
        list.add("ALL");
        String sql = "SELECT AirlineName FROM Airline ORDER BY AirlineName";
        try (Connection con = DBConnection.getConnection()) {
            if (con == null) return list;
            try (Statement st = con.createStatement();
                 ResultSet rs = st.executeQuery(sql)) {
                while (rs.next()) list.add(rs.getString(1));
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    // ──────────── Danh sách tuyến bay ────────────
    public List<String> getDanhSachTuyenBay() {
        List<String> list = new ArrayList<>();
        String sql = "SELECT DISTINCT r.DepartureAirportID || ' -> ' || r.ArrivalAirportID " +
                     "FROM Route r ORDER BY 1";
        try (Connection con = DBConnection.getConnection()) {
            if (con == null) return list;
            try (Statement st = con.createStatement();
                 ResultSet rs = st.executeQuery(sql)) {
                while (rs.next()) list.add(rs.getString(1));
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }
}
