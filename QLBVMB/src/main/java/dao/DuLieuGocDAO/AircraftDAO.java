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
        String sql = "{call SP_ADD_AIRCRAFT(?, ?, ?, ?)}";
        try (Connection conn = DBConnection.getConnection();
                CallableStatement cs = conn.prepareCall(sql)) {
            cs.setString(1, dto.getAirlineID());
            cs.setString(2, dto.getModel());
            cs.setInt(3, dto.getCapacity());
            cs.setInt(4, dto.getManufactureYear());
            return cs.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean update(AircraftDTO dto) {
        String sql = "{call SP_UPDATE_AIRCRAFT(?, ?, ?, ?, ?)}";
        try (Connection conn = DBConnection.getConnection();
                CallableStatement cs = conn.prepareCall(sql)) {
            cs.setString(1, dto.getAircraftID());
            cs.setString(2, dto.getAirlineID());
            cs.setString(3, dto.getModel());
            cs.setInt(4, dto.getCapacity());
            cs.setInt(5, dto.getManufactureYear());
            return cs.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean delete(String aircraftID) {
        String sql = "{call SP_DELETE_AIRCRAFT(?)}";
        try (Connection conn = DBConnection.getConnection();
                CallableStatement cs = conn.prepareCall(sql)) {
            cs.setString(1, aircraftID);
            return cs.executeUpdate() > 0;
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
