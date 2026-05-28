package dao.DuLieuGocDAO;

import dto.AirportDTO;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AirportDAO {

    // Lấy tất cả sân bay
    public List<AirportDTO> getAll() {
        List<AirportDTO> list = new ArrayList<>();
        String sql = "SELECT AirportID, AirportName, City, Country, IATACode FROM AIRPORT ORDER BY AirportID";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                AirportDTO dto = new AirportDTO();
                dto.setAirportID(rs.getString("AirportID"));
                dto.setAirportName(rs.getString("AirportName"));
                dto.setCity(rs.getString("City"));
                dto.setCountry(rs.getString("Country"));
                dto.setIataCode(rs.getString("IATACode"));
                list.add(dto);
            }
        } catch (SQLException e) {
            System.err.println("!!! LỖI TRUY VẤN SÂN BAY: " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }

    // Tìm kiếm sân bay theo từ khóa
    public List<AirportDTO> search(String keyword) {
        List<AirportDTO> list = new ArrayList<>();
        String sql = "SELECT AirportID, AirportName, City, Country, IATACode FROM AIRPORT " +
                "WHERE UPPER(AirportID) LIKE ? OR UPPER(AirportName) LIKE ? OR UPPER(City) LIKE ? " +
                "OR UPPER(Country) LIKE ? OR UPPER(IATACode) LIKE ? ORDER BY AirportID";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            String kw = "%" + keyword.toUpperCase() + "%";
            for (int i = 1; i <= 5; i++)
                ps.setString(i, kw);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    AirportDTO dto = new AirportDTO();
                    dto.setAirportID(rs.getString("AirportID"));
                    dto.setAirportName(rs.getString("AirportName"));
                    dto.setCity(rs.getString("City"));
                    dto.setCountry(rs.getString("Country"));
                    dto.setIataCode(rs.getString("IATACode"));
                    list.add(dto);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Thêm sân bay
    public boolean insert(AirportDTO dto) {
        String sql = "{call SP_ADD_AIRPORT(?, ?, ?, ?)}";
        try (Connection conn = DBConnection.getConnection();
                CallableStatement cs = conn.prepareCall(sql)) {
            cs.setString(1, dto.getAirportName());
            cs.setString(2, dto.getCity());
            cs.setString(3, dto.getCountry());
            cs.setString(4, dto.getIataCode());
            return cs.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Cập nhật sân bay
    public boolean update(AirportDTO dto) {
        String sql = "{call SP_UPDATE_AIRPORT(?, ?, ?, ?, ?)}";
        try (Connection conn = DBConnection.getConnection();
                CallableStatement cs = conn.prepareCall(sql)) {
            cs.setString(1, dto.getAirportID());
            cs.setString(2, dto.getAirportName());
            cs.setString(3, dto.getCity());
            cs.setString(4, dto.getCountry());
            cs.setString(5, dto.getIataCode());
            return cs.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Xóa sân bay
    public boolean delete(String airportID) {
        String sql = "{call SP_DELETE_AIRPORT(?)}";
        try (Connection conn = DBConnection.getConnection();
                CallableStatement cs = conn.prepareCall(sql)) {
            cs.setString(1, airportID);
            return cs.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Đếm tổng số sân bay
    public int count() {
        String sql = "SELECT COUNT(*) FROM AIRPORT";
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
