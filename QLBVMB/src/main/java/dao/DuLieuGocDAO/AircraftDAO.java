package dao.DuLieuGocDAO;

import dto.AircraftDTO;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AircraftDAO {

    public List<AircraftDTO> getAll() {
        List<AircraftDTO> list = new ArrayList<>();
        String sql = "SELECT AircraftID, AirlineID, Model, Capacity, ManufactureYear FROM AIRCRAFT ORDER BY AircraftID";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                AircraftDTO dto = new AircraftDTO();
                dto.setAircraftID(rs.getString("AircraftID"));
                dto.setAirlineID(rs.getString("AirlineID"));
                dto.setModel(rs.getString("Model"));
                dto.setCapacity(rs.getInt("Capacity"));
                dto.setManufactureYear(rs.getInt("ManufactureYear"));
                list.add(dto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<AircraftDTO> search(String keyword) {
        List<AircraftDTO> list = new ArrayList<>();
        String sql = "SELECT AircraftID, AirlineID, Model, Capacity, ManufactureYear FROM AIRCRAFT " +
                "WHERE UPPER(AircraftID) LIKE ? OR UPPER(Model) LIKE ? OR UPPER(AirlineID) LIKE ? " +
                "ORDER BY AircraftID";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            String kw = "%" + keyword.toUpperCase() + "%";
            for (int i = 1; i <= 3; i++)
                ps.setString(i, kw);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    AircraftDTO dto = new AircraftDTO();
                    dto.setAircraftID(rs.getString("AircraftID"));
                    dto.setAirlineID(rs.getString("AirlineID"));
                    dto.setModel(rs.getString("Model"));
                    dto.setCapacity(rs.getInt("Capacity"));
                    dto.setManufactureYear(rs.getInt("ManufactureYear"));
                    list.add(dto);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean insert(AircraftDTO dto) {
        String sql = "INSERT INTO AIRCRAFT (AircraftID, AirlineID, Model, Capacity, ManufactureYear) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, dto.getAircraftID());
            ps.setString(2, dto.getAirlineID());
            ps.setString(3, dto.getModel());
            ps.setInt(4, dto.getCapacity());
            ps.setInt(5, dto.getManufactureYear());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean update(AircraftDTO dto) {
        String sql = "UPDATE AIRCRAFT SET AirlineID = ?, Model = ?, Capacity = ?, ManufactureYear = ? WHERE AircraftID = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, dto.getAirlineID());
            ps.setString(2, dto.getModel());
            ps.setInt(3, dto.getCapacity());
            ps.setInt(4, dto.getManufactureYear());
            ps.setString(5, dto.getAircraftID());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean delete(String aircraftID) {
        String sql = "DELETE FROM AIRCRAFT WHERE AircraftID = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, aircraftID);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public int count() {
        String sql = "SELECT COUNT(*) FROM AIRCRAFT";
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
