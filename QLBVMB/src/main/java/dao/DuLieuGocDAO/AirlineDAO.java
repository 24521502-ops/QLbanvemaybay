package dao.DuLieuGocDAO;

import dto.AirlineDTO;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AirlineDAO {

    public List<AirlineDTO> getAll() {
        List<AirlineDTO> list = new ArrayList<>();
        String sql = "SELECT AirlineID, AirlineName, Country, Phone, Email FROM AIRLINE ORDER BY AirlineID";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                AirlineDTO dto = new AirlineDTO();
                dto.setAirlineID(rs.getString("AirlineID"));
                dto.setAirlineName(rs.getString("AirlineName"));
                dto.setCountry(rs.getString("Country"));
                dto.setPhone(rs.getString("Phone"));
                dto.setEmail(rs.getString("Email"));
                list.add(dto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<AirlineDTO> search(String keyword) {
        List<AirlineDTO> list = new ArrayList<>();
        String sql = "SELECT AirlineID, AirlineName, Country, Phone, Email FROM AIRLINE " +
                "WHERE UPPER(AirlineID) LIKE ? OR UPPER(AirlineName) LIKE ? OR UPPER(Country) LIKE ? " +
                "ORDER BY AirlineID";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            String kw = "%" + keyword.toUpperCase() + "%";
            for (int i = 1; i <= 3; i++)
                ps.setString(i, kw);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    AirlineDTO dto = new AirlineDTO();
                    dto.setAirlineID(rs.getString("AirlineID"));
                    dto.setAirlineName(rs.getString("AirlineName"));
                    dto.setCountry(rs.getString("Country"));
                    dto.setPhone(rs.getString("Phone"));
                    dto.setEmail(rs.getString("Email"));
                    list.add(dto);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean insert(AirlineDTO dto) {
        String sql = "{call SP_ADD_AIRLINE(?, ?, ?, ?)}";
        try (Connection conn = DBConnection.getConnection();
                CallableStatement cs = conn.prepareCall(sql)) {
            cs.setString(1, dto.getAirlineName());
            cs.setString(2, dto.getCountry());
            cs.setString(3, dto.getPhone());
            cs.setString(4, dto.getEmail());
            return cs.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean update(AirlineDTO dto) {
        String sql = "{call SP_UPDATE_AIRLINE(?, ?, ?, ?, ?)}";
        try (Connection conn = DBConnection.getConnection();
                CallableStatement cs = conn.prepareCall(sql)) {
            cs.setString(1, dto.getAirlineID());
            cs.setString(2, dto.getAirlineName());
            cs.setString(3, dto.getCountry());
            cs.setString(4, dto.getPhone());
            cs.setString(5, dto.getEmail());
            return cs.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean delete(String airlineID) {
        String sql = "{call SP_DELETE_AIRLINE(?)}";
        try (Connection conn = DBConnection.getConnection();
                CallableStatement cs = conn.prepareCall(sql)) {
            cs.setString(1, airlineID);
            return cs.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public int count() {
        String sql = "SELECT COUNT(*) FROM AIRLINE";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            if (rs.next())
                return rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}
