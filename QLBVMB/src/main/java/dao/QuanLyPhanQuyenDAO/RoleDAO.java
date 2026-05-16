package dao.QuanLyPhanQuyenDAO;

import dto.RoleDTO;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RoleDAO {

    // Lấy tất cả role (không bị xóa)
    public List<RoleDTO> getAll() {
        List<RoleDTO> list = new ArrayList<>();
        String sql = "SELECT RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, Created_At, Updated_At, IsDeleted FROM ROLE WHERE IsDeleted = 0";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                RoleDTO dto = new RoleDTO();
                dto.setRoleID(rs.getString("RoleID"));
                dto.setFunctionID(rs.getString("FunctionID"));
                dto.setAddPerm(rs.getInt("AddPerm"));
                dto.setEditPerm(rs.getInt("EditPerm"));
                dto.setDeletePerm(rs.getInt("DeletePerm"));
                dto.setDownloadPerm(rs.getInt("DownloadPerm"));
                dto.setViewPerm(rs.getInt("ViewPerm"));
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

    // Lấy role theo FunctionID
    public List<RoleDTO> getByFunctionID(String functionID) {
        List<RoleDTO> list = new ArrayList<>();
        String sql = "SELECT RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, Created_At, Updated_At, IsDeleted FROM ROLE WHERE FunctionID = ? AND IsDeleted = 0";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, functionID);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    RoleDTO dto = new RoleDTO();
                    dto.setRoleID(rs.getString("RoleID"));
                    dto.setFunctionID(rs.getString("FunctionID"));
                    dto.setAddPerm(rs.getInt("AddPerm"));
                    dto.setEditPerm(rs.getInt("EditPerm"));
                    dto.setDeletePerm(rs.getInt("DeletePerm"));
                    dto.setDownloadPerm(rs.getInt("DownloadPerm"));
                    dto.setViewPerm(rs.getInt("ViewPerm"));
                    dto.setCreatedAt(rs.getDate("Created_At"));
                    dto.setUpdatedAt(rs.getDate("Updated_At"));
                    dto.setIsDeleted(rs.getInt("IsDeleted"));
                    list.add(dto);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Lấy role theo ID
    public RoleDTO getByID(String roleID) {
        String sql = "SELECT RoleID, FunctionID, AddPerm, EditPerm, DeletePerm, DownloadPerm, ViewPerm, Created_At, Updated_At, IsDeleted FROM ROLE WHERE RoleID = ? AND IsDeleted = 0";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, roleID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    RoleDTO dto = new RoleDTO();
                    dto.setRoleID(rs.getString("RoleID"));
                    dto.setFunctionID(rs.getString("FunctionID"));
                    dto.setAddPerm(rs.getInt("AddPerm"));
                    dto.setEditPerm(rs.getInt("EditPerm"));
                    dto.setDeletePerm(rs.getInt("DeletePerm"));
                    dto.setDownloadPerm(rs.getInt("DownloadPerm"));
                    dto.setViewPerm(rs.getInt("ViewPerm"));
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
