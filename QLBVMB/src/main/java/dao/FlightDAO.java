package dao;

import dto.FlightSearchResultDTO;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FlightDAO {

    public List<FlightSearchResultDTO> searchFlights(String depIATA, String arrIATA, String dateStr) {
        java.util.Map<String, FlightSearchResultDTO> flightMap = new java.util.LinkedHashMap<>();
        
        String sql = "SELECT FlightID, AirlineName, AircraftModel, DepCode, ArrCode, DepartureTime, ArrivalTime, ClassName, Price, Seats " +
                     "FROM VIEW_FLIGHT_SEARCH " +
                     "WHERE TRIM(UPPER(DepCode)) = ? AND TRIM(UPPER(ArrCode)) = ? " +
                     "AND TRUNC(DepartureTime) = TO_DATE(?, 'YYYY-MM-DD') " +
                     "AND DepartureTime > SYSDATE " +
                     "ORDER BY DepartureTime ASC, Price ASC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, depIATA.toUpperCase().trim());
            ps.setString(2, arrIATA.toUpperCase().trim());
            ps.setString(3, dateStr);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    String flightID = rs.getString("FlightID");
                    FlightSearchResultDTO dto = flightMap.get(flightID);
                    
                    if (dto == null) {
                        dto = new FlightSearchResultDTO();
                        dto.setFlightID(flightID);
                        dto.setAirlineName(rs.getString("AirlineName"));
                        dto.setAircraftModel(rs.getString("AircraftModel"));
                        dto.setDepartureCode(rs.getString("DepCode"));
                        dto.setArrivalCode(rs.getString("ArrCode"));
                        dto.setDepartureTime(rs.getTimestamp("DepartureTime"));
                        dto.setArrivalTime(rs.getTimestamp("ArrivalTime"));
                        flightMap.put(flightID, dto);
                    }
                    
                    dto.addSeatClass(
                        rs.getString("ClassName"),
                        rs.getDouble("Price"),
                        rs.getInt("Seats")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return new ArrayList<>(flightMap.values());
    }

    public java.util.Map<java.time.LocalDate, Double> getMinPricesForWeek(String depIATA, String arrIATA, java.time.LocalDate startDate) {
        java.util.Map<java.time.LocalDate, Double> prices = new java.util.HashMap<>();
        String sql = "SELECT TRUNC(DepartureTime) as d, MIN(Price) as min_p " +
                     "FROM VIEW_FLIGHT_MIN_PRICES " +
                     "WHERE TRIM(UPPER(DepCode)) = ? AND TRIM(UPPER(ArrCode)) = ? " +
                     "AND TRUNC(DepartureTime) BETWEEN TO_DATE(?, 'YYYY-MM-DD') AND TO_DATE(?, 'YYYY-MM-DD') " +
                     "AND DepartureTime > SYSDATE " +
                     "GROUP BY TRUNC(DepartureTime)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, depIATA.toUpperCase().trim());
            ps.setString(2, arrIATA.toUpperCase().trim());
            ps.setString(3, startDate.minusDays(3).toString());
            ps.setString(4, startDate.plusDays(3).toString());

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    prices.put(rs.getDate("d").toLocalDate(), rs.getDouble("min_p"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return prices;
    }
}
