package dao;

import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookingAirportDAO {

    public List<String> getAllAirportsForDisplay() {
        List<String> list = new ArrayList<>();
        String sql = "SELECT City, AirportName, IATACode FROM AIRPORT ORDER BY City";

        Connection conn = DBConnection.getConnection();
        if (conn == null) {
            System.err.println("BookingAirportDAO: Không thể kết nối đến Database.");
            return list;
        }

        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                String display = rs.getString("City") + " (" + rs.getString("IATACode") + ")";
                list.add(display);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }
    public String getCityName(String iataCode) {
        String sql = "SELECT City FROM AIRPORT WHERE IATACode = ?";
        Connection conn = DBConnection.getConnection();
        if (conn == null) return iataCode;
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, iataCode);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return rs.getString("City");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
        return iataCode;
    }
}
