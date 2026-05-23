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

    public boolean insertWithSeats(AircraftDTO dto, int first, int busi, int prem, int eco) {
        String sqlInsert = "{call SP_ADD_AIRCRAFT(?, ?, ?, ?)}";
        String sqlGetId = "SELECT AircraftID FROM AIRCRAFT WHERE AirlineID = ? AND Model = ? ORDER BY AircraftID DESC";
        String sqlInsertSeat = "INSERT INTO SEAT (SeatID, AircraftID, SeatNumber, Class) VALUES (?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection()) {
            conn.setAutoCommit(false); // Bắt đầu transaction
            
            // 1. Thêm máy bay
            try (CallableStatement cs = conn.prepareCall(sqlInsert)) {
                cs.setString(1, dto.getAirlineID());
                cs.setString(2, dto.getModel());
                cs.setInt(3, dto.getCapacity());
                cs.setInt(4, dto.getManufactureYear());
                cs.execute();
            }
            
            // 2. Lấy ID máy bay vừa tạo
            String newAircraftID = null;
            try (PreparedStatement ps = conn.prepareStatement(sqlGetId)) {
                ps.setString(1, dto.getAirlineID());
                ps.setString(2, dto.getModel());
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        newAircraftID = rs.getString("AircraftID");
                    }
                }
            }
            
            // 3. Tạo ghế
            if (newAircraftID != null) {
                int[] currentRow = {1};
                try (PreparedStatement ps = conn.prepareStatement(sqlInsertSeat)) {
                    insertSeatsForClass(ps, newAircraftID, "First Class", first, currentRow);
                    insertSeatsForClass(ps, newAircraftID, "Business", busi, currentRow);
                    insertSeatsForClass(ps, newAircraftID, "Premium Economy", prem, currentRow);
                    insertSeatsForClass(ps, newAircraftID, "Economy", eco, currentRow);
                    ps.executeBatch();
                }
            }
            
            conn.commit();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private void insertSeatsForClass(PreparedStatement ps, String aircraftID, String className, int count, int[] currentRow) throws SQLException {
        if (count <= 0) return;
        String[] columns = {"A", "B", "C", "D", "E", "F"};
        int colIdx = 0;
        for (int i = 0; i < count; i++) {
            String seatName = currentRow[0] + columns[colIdx];
            String seatID = "ST" + java.util.UUID.randomUUID().toString().substring(0, 6).toUpperCase();
            
            ps.setString(1, seatID);
            ps.setString(2, aircraftID);
            ps.setString(3, seatName);
            ps.setString(4, className);
            ps.addBatch();
            
            colIdx++;
            if (colIdx >= columns.length) {
                colIdx = 0;
                currentRow[0]++;
            }
        }
        if (colIdx != 0) {
            currentRow[0]++; // Nhảy sang hàng mới nếu khoang hạng trước bị lẻ ghế
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
