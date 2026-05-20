package dao.DatVeDAO;

import dto.MyFlightDTO;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MyFlightDAO {
    public List<MyFlightDTO> getMyFlights(String accountID) {
        List<MyFlightDTO> list = new ArrayList<>();
        String sql = "{call SP_GET_MY_FLIGHTS(?, ?)}";

        try (Connection conn = DBConnection.getConnection();
                java.sql.CallableStatement cst = conn.prepareCall(sql)) {

            cst.setString(1, accountID);
            cst.registerOutParameter(2, java.sql.Types.REF_CURSOR);
            cst.execute();

            try (ResultSet rs = (ResultSet) cst.getObject(2)) {
                while (rs.next()) {
                    MyFlightDTO dto = new MyFlightDTO();
                    dto.setBookingID(rs.getString("BookingID"));
                    dto.setFlightID(rs.getString("FlightID"));
                    dto.setDepartureIATA(rs.getString("DepartureIATA"));
                    dto.setArrivalIATA(rs.getString("ArrivalIATA"));
                    dto.setDepartureCity(rs.getString("DepartureCity"));
                    dto.setArrivalCity(rs.getString("ArrivalCity"));
                    dto.setAirlineName(rs.getString("AirlineName"));
                    dto.setFlightNumber(rs.getString("FlightNumber"));
                    dto.setTicketStatus(rs.getString("TicketStatus"));
                    dto.setDepartureTime(rs.getTimestamp("DepartureTime"));
                    dto.setArrivalTime(rs.getTimestamp("ArrivalTime"));
                    dto.setGate(rs.getString("Gate"));
                    dto.setSeats(rs.getString("Seats"));
                    dto.setEstimatedTime(rs.getInt("EstimatedTime"));
                    list.add(dto);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<dto.MyFlightPassengerDTO> getPassengers(String bookingID, String flightID) {
        List<dto.MyFlightPassengerDTO> list = new ArrayList<>();
        String sql = "SELECT p.FullName, p.PassportNumber, s.SeatNumber, p.DateOfBirth " +
                "FROM TICKET t " +
                "JOIN PASSENGER p ON t.PassengerID = p.PassengerID " +
                "LEFT JOIN SEAT s ON t.SeatID = s.SeatID " +
                "WHERE t.BookingID = ? AND t.FlightID = ?";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pst = conn.prepareStatement(sql)) {

            pst.setString(1, bookingID);
            pst.setString(2, flightID);
            try (ResultSet rs = pst.executeQuery()) {
                while (rs.next()) {
                    dto.MyFlightPassengerDTO dto = new dto.MyFlightPassengerDTO();
                    dto.setFullName(rs.getString("FullName"));
                    dto.setPassportNumber(rs.getString("PassportNumber"));
                    dto.setSeatNumber(rs.getString("SeatNumber"));
                    dto.setDateOfBirth(rs.getDate("DateOfBirth"));
                    list.add(dto);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean checkIn(String bookingID, String flightID) {
        String sql = "UPDATE TICKET SET TicketStatus = 'CHECKED-IN' WHERE BookingID = ? AND FlightID = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement pst = conn.prepareStatement(sql)) {

            pst.setString(1, bookingID);
            pst.setString(2, flightID);

            int rowsAffected = pst.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
