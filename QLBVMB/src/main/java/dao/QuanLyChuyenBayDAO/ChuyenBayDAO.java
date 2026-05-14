package dao;

import dto.FlightDTO;
import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ChuyenBayDAO {

    public List<Object[]> layDanhSachChuyenBay() {
        List<Object[]> list = new ArrayList<>();
        String sql = "SELECT FlightNumber, Route_IATA, DepartureTime, ArrivalTime, AircraftModel, Gate, FlightStatus, FlightID FROM VW_FLIGHT_LIST";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new Object[]{
                    rs.getString("FlightNumber"), rs.getString("Route_IATA"), rs.getTimestamp("DepartureTime"), 
                    rs.getTimestamp("ArrivalTime"), rs.getString("AircraftModel"), rs.getString("Gate"), 
                    rs.getString("FlightStatus"), rs.getString("FlightID")
                });
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    // LẤY CHI TIẾT 1 CHUYẾN BAY ĐỂ ĐỔ LÊN FORM SỬA
    public Object[] layChiTietChuyenBay(String flightID) {
        String sql = "SELECT f.FlightNumber, f.AirlineID, f.AircraftID, r.DepartureAirportID, r.ArrivalAirportID, f.DepartureTime, f.ArrivalTime, f.Gate " +
                     "FROM FLIGHT f JOIN ROUTE r ON f.RouteID = r.RouteID WHERE f.FlightID = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, flightID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Object[]{
                    rs.getString("FlightNumber"), rs.getString("AirlineID"), rs.getString("AircraftID"),
                    rs.getString("DepartureAirportID"), rs.getString("ArrivalAirportID"),
                    rs.getTimestamp("DepartureTime"), rs.getTimestamp("ArrivalTime"), rs.getString("Gate")
                };
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return null;
    }

    // LƯU CẬP NHẬT TOÀN BỘ CHUYẾN BAY
    public boolean capNhatToanBoChuyenBay(String flightID, String flightNum, String airlineID, String aircraftID, String depAirport, String arrAirport, java.util.Date depTime, java.util.Date arrTime, String gate) {
        Connection conn = null;
        try {
            conn = DBConnection.getConnection();
            conn.setAutoCommit(false); // Dùng Transaction cho an toàn
            String routeID = null;

            // 1. Tìm Tuyến bay cũ
            String sqlRoute = "SELECT RouteID FROM ROUTE WHERE DepartureAirportID = ? AND ArrivalAirportID = ? AND ROWNUM = 1";
            try(PreparedStatement ps = conn.prepareStatement(sqlRoute)){
                ps.setString(1, depAirport); ps.setString(2, arrAirport);
                ResultSet rs = ps.executeQuery();
                if(rs.next()) routeID = rs.getString(1);
            }

            // 2. Nếu Tuyến bay chưa có, tự tạo Tuyến bay mới
            if(routeID == null){
                String insertRoute = "INSERT INTO ROUTE (DepartureAirportID, ArrivalAirportID) VALUES (?, ?)";
                try(PreparedStatement ps = conn.prepareStatement(insertRoute, new String[]{"ROUTEID"})){
                    ps.setString(1, depAirport); ps.setString(2, arrAirport);
                    ps.executeUpdate();
                    ResultSet rs = ps.getGeneratedKeys();
                    if(rs.next()) routeID = rs.getString(1);
                }
            }

            // 3. Cập nhật vào chuyến bay
            String sqlUpd = "UPDATE FLIGHT SET FlightNumber=?, AirlineID=?, AircraftID=?, RouteID=?, DepartureTime=?, ArrivalTime=?, Gate=? WHERE FlightID=?";
            try(PreparedStatement ps = conn.prepareStatement(sqlUpd)){
                ps.setString(1, flightNum); ps.setString(2, airlineID); ps.setString(3, aircraftID); ps.setString(4, routeID);
                ps.setTimestamp(5, new java.sql.Timestamp(depTime.getTime()));
                ps.setTimestamp(6, new java.sql.Timestamp(arrTime.getTime()));
                ps.setString(7, gate); ps.setString(8, flightID);
                ps.executeUpdate();
            }

            conn.commit();
            return true;
        } catch(Exception e) {
            if(conn != null) try{ conn.rollback(); }catch(Exception ex){}
            e.printStackTrace(); return false;
        } finally {
            if(conn != null) try{ conn.setAutoCommit(true); conn.close(); }catch(Exception ex){}
        }
    }

    public boolean huyChuyenBay(String flightID) {
        String sql = "{call SP_CANCEL_FLIGHT(?)}";
        try (Connection conn = DBConnection.getConnection(); CallableStatement cs = conn.prepareCall(sql)) {
            cs.setString(1, flightID); cs.execute(); return true;
        } catch (SQLException e) { return false; }
    }

    public boolean delayChuyenBay(String flightID, java.util.Date newTime) {
        String sql = "{call SP_DELAY_FLIGHT(?, ?)}";
        try (Connection conn = DBConnection.getConnection(); CallableStatement cs = conn.prepareCall(sql)) {
            cs.setString(1, flightID); cs.setTimestamp(2, new java.sql.Timestamp(newTime.getTime())); cs.execute(); return true;
        } catch (SQLException e) { return false; }
    }

    public boolean themChuyenBayUI(FlightDTO flight, String depAirport, String arrAirport) {
        String sql = "{call SP_ADD_FLIGHT_UI(?, ?, ?, ?, ?, ?, ?, ?, ?)}";
        try (Connection conn = DBConnection.getConnection(); CallableStatement cs = conn.prepareCall(sql)) {
            cs.setString(1, flight.getFlightNumber()); cs.setString(2, flight.getAirlineID()); cs.setString(3, flight.getAircraftID());
            cs.setString(4, depAirport); cs.setString(5, arrAirport);
            cs.setTimestamp(6, new java.sql.Timestamp(flight.getDepartureTime().getTime()));
            cs.setTimestamp(7, new java.sql.Timestamp(flight.getArrivalTime().getTime()));
            cs.setString(8, flight.getGate()); cs.setString(9, "SCHEDULED"); 
            cs.execute(); return true;
        } catch (SQLException e) { return false; }
    }
}