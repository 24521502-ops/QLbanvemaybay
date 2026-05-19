package dao;

import dto.FlightSearchResultDTO;
import util.DBConnection;

import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookingFlightDAO {

    public List<FlightSearchResultDTO> searchFlights(String depIATA, String arrIATA, String dateStr) {
        java.util.Map<String, FlightSearchResultDTO> flightMap = new java.util.LinkedHashMap<>();
        
        String sql = "{call SP_SEARCH_FLIGHTS(?, ?, ?, ?)}";

        try (Connection conn = DBConnection.getConnection();
             CallableStatement cst = conn.prepareCall(sql)) {
            
            cst.setString(1, depIATA.toUpperCase().trim());
            cst.setString(2, arrIATA.toUpperCase().trim());
            cst.setString(3, dateStr);
            cst.registerOutParameter(4, java.sql.Types.REF_CURSOR);
            
            cst.execute();

            try (ResultSet rs = (ResultSet) cst.getObject(4)) {
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
        String sql = "{call SP_GET_MIN_PRICES_FOR_WEEK(?, ?, ?, ?, ?)}";

        try (Connection conn = DBConnection.getConnection();
             CallableStatement cst = conn.prepareCall(sql)) {
            
            cst.setString(1, depIATA.toUpperCase().trim());
            cst.setString(2, arrIATA.toUpperCase().trim());
            cst.setString(3, startDate.minusDays(3).toString());
            cst.setString(4, startDate.plusDays(3).toString());
            cst.registerOutParameter(5, java.sql.Types.REF_CURSOR);
            
            cst.execute();

            try (ResultSet rs = (ResultSet) cst.getObject(5)) {
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
