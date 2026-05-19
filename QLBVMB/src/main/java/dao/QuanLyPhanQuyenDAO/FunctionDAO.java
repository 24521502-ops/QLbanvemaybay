package dao.QuanLyPhanQuyenDAO;

import dto.FunctionDTO;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FunctionDAO {

    // Lấy tất cả chức năng (không bị xóa)
    public List<FunctionDTO> getAll() {
        List<FunctionDTO> list = new ArrayList<>();
        String sql = "SELECT FunctionID, NameFunction, Created_At, Updated_At, IsDeleted FROM \"FUNCTION\" WHERE IsDeleted = 0";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                FunctionDTO dto = new FunctionDTO();
                dto.setFunctionID(rs.getString("FunctionID"));
                dto.setNameFunction(rs.getString("NameFunction"));
                dto.setCreatedAt(rs.getDate("Created_At"));
                dto.setUpdatedAt(rs.getDate("Updated_At"));
                dto.setIsDeleted(rs.getInt("IsDeleted"));
                list.add(dto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Lấy chức năng theo ID
    public FunctionDTO getByID(String functionID) {
        String sql = "SELECT FunctionID, NameFunction, Created_At, Updated_At, IsDeleted FROM \"FUNCTION\" WHERE FunctionID = ? AND IsDeleted = 0";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, functionID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    FunctionDTO dto = new FunctionDTO();
                    dto.setFunctionID(rs.getString("FunctionID"));
                    dto.setNameFunction(rs.getString("NameFunction"));
                    dto.setCreatedAt(rs.getDate("Created_At"));
                    dto.setUpdatedAt(rs.getDate("Updated_At"));
                    dto.setIsDeleted(rs.getInt("IsDeleted"));
                    return dto;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
