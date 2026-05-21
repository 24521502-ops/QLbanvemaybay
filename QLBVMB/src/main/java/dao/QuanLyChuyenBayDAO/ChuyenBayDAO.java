package dao.QuanLyChuyenBayDAO;

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
                list.add(new Object[] {
                        rs.getString("FlightNumber"), rs.getString("Route_IATA"), rs.getTimestamp("DepartureTime"),
                        rs.getTimestamp("ArrivalTime"), rs.getString("AircraftModel"), rs.getString("Gate"),
                        rs.getString("FlightStatus"), rs.getString("FlightID")
                });
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // LẤY CHI TIẾT 1 CHUYẾN BAY ĐỂ ĐỔ LÊN FORM SỬA
    public Object[] layChiTietChuyenBay(String flightID) {
        String sql = "SELECT f.FlightNumber, f.AirlineID, f.AircraftID, r.DepartureAirportID, r.ArrivalAirportID, f.DepartureTime, f.ArrivalTime, f.Gate "
                +
                "FROM FLIGHT f JOIN ROUTE r ON f.RouteID = r.RouteID WHERE f.FlightID = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, flightID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Object[] {
                        rs.getString("FlightNumber"), rs.getString("AirlineID"), rs.getString("AircraftID"),
                        rs.getString("DepartureAirportID"), rs.getString("ArrivalAirportID"),
                        rs.getTimestamp("DepartureTime"), rs.getTimestamp("ArrivalTime"), rs.getString("Gate")
                };
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // LƯU CẬP NHẬT TOÀN BỘ CHUYẾN BAY
    public boolean capNhatToanBoChuyenBay(String flightID, String flightNum, String airlineID, String aircraftID,
            String depAirport, String arrAirport, java.util.Date depTime, java.util.Date arrTime, String gate) {
        String sql = "{CALL SP_UPDATE_FLIGHT_FULL(?, ?, ?, ?, ?, ?, ?, ?, ?)}";
        try (Connection conn = DBConnection.getConnection(); CallableStatement cs = conn.prepareCall(sql)) {
            cs.setString(1, flightID);
            cs.setString(2, flightNum);
            cs.setString(3, airlineID);
            cs.setString(4, aircraftID);
            cs.setString(5, depAirport);
            cs.setString(6, arrAirport);
            cs.setTimestamp(7, new java.sql.Timestamp(depTime.getTime()));
            cs.setTimestamp(8, new java.sql.Timestamp(arrTime.getTime()));
            cs.setString(9, gate);
            cs.execute();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean huyChuyenBay(String flightID) {
        String sql = "{call SP_CANCEL_FLIGHT(?)}";
        try (Connection conn = DBConnection.getConnection(); CallableStatement cs = conn.prepareCall(sql)) {
            cs.setString(1, flightID);
            cs.execute();
            return true;
        } catch (SQLException e) {
            return false;
        }
    }

    public boolean delayChuyenBay(String flightID, java.util.Date newTime) {
        String sql = "{call SP_DELAY_FLIGHT(?, ?)}";
        try (Connection conn = DBConnection.getConnection(); CallableStatement cs = conn.prepareCall(sql)) {
            cs.setString(1, flightID);
            cs.setTimestamp(2, new java.sql.Timestamp(newTime.getTime()));
            cs.execute();
            return true;
        } catch (SQLException e) {
            return false;
        }
    }

    public boolean themChuyenBayUI(FlightDTO flight, String depAirport, String arrAirport) {
        String sql = "{call SP_ADD_FLIGHT_UI(?, ?, ?, ?, ?, ?, ?, ?, ?)}";
        try (Connection conn = DBConnection.getConnection(); CallableStatement cs = conn.prepareCall(sql)) {
            cs.setString(1, flight.getFlightNumber());
            cs.setString(2, flight.getAirlineID());
            cs.setString(3, flight.getAircraftID());
            cs.setString(4, depAirport);
            cs.setString(5, arrAirport);
            cs.setTimestamp(6, new java.sql.Timestamp(flight.getDepartureTime().getTime()));
            cs.setTimestamp(7, new java.sql.Timestamp(flight.getArrivalTime().getTime()));
            cs.setString(8, flight.getGate());
            cs.setString(9, "SCHEDULED");
            cs.execute();
            return true;
        } catch (SQLException e) {
            return false;
        }
    }
}