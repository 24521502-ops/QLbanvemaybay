package dao.QuanLyPhanQuyenDAO;

import dto.RoleGroupDTO;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RoleGroupDAO {

    // Lấy tất cả nhóm quyền (không bị xóa)
    public List<RoleGroupDTO> getAll() {
        List<RoleGroupDTO> list = new ArrayList<>();
        String sql = "SELECT RoleGroupID, NameRoleGroup, Created_At, Updated_At, IsDeleted FROM ROLE_GROUP WHERE IsDeleted = 0";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                RoleGroupDTO dto = new RoleGroupDTO();
                dto.setRoleGroupID(rs.getString("RoleGroupID"));
                dto.setNameRoleGroup(rs.getString("NameRoleGroup"));
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

    // Lấy nhóm quyền theo ID
    public RoleGroupDTO getByID(String roleGroupID) {
        String sql = "SELECT RoleGroupID, NameRoleGroup, Created_At, Updated_At, IsDeleted FROM ROLE_GROUP WHERE RoleGroupID = ? AND IsDeleted = 0";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, roleGroupID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    RoleGroupDTO dto = new RoleGroupDTO();
                    dto.setRoleGroupID(rs.getString("RoleGroupID"));
                    dto.setNameRoleGroup(rs.getString("NameRoleGroup"));
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

    // Thêm nhóm quyền mới
    public boolean insert(RoleGroupDTO dto) {
        String sql = "{CALL SP_ADD_ROLE_GROUP(?)}";
        try (Connection conn = DBConnection.getConnection();
             CallableStatement cst = conn.prepareCall(sql)) {
            cst.setString(1, dto.getNameRoleGroup());
            cst.execute();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Cập nhật nhóm quyền
    public boolean update(RoleGroupDTO dto) {
        String sql = "{CALL SP_UPDATE_ROLE_GROUP(?, ?)}";
        try (Connection conn = DBConnection.getConnection();
             CallableStatement cst = conn.prepareCall(sql)) {
            cst.setString(1, dto.getRoleGroupID());
            cst.setString(2, dto.getNameRoleGroup());
            cst.execute();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Xóa mềm nhóm quyền
    public boolean delete(String roleGroupID) {
        String sql = "{CALL SP_DELETE_ROLE_GROUP(?)}";
        try (Connection conn = DBConnection.getConnection();
             CallableStatement cst = conn.prepareCall(sql)) {
            cst.setString(1, roleGroupID);
            cst.execute();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Đếm số người dùng trong nhóm quyền
    public int countUsers(String roleGroupID) {
        String sql = "SELECT COUNT(*) AS cnt FROM ACCOUNT_ASSIGN_ROLE_GROUP WHERE RoleGroupID = ? AND IsDeleted = 0";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, roleGroupID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("cnt");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // Lấy danh sách RoleID đã gán cho nhóm quyền
    public List<String> getAssignedRoleIDs(String roleGroupID) {
        List<String> list = new ArrayList<>();
        String sql = "SELECT RoleID FROM ROLE_GROUP_ASSIGN_ROLE WHERE RoleGroupID = ? AND IsDeleted = 0";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, roleGroupID);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(rs.getString("RoleID"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Gán quyền (role) cho nhóm quyền
    public boolean assignRole(String roleGroupID, String roleID) {
        String sql = "{CALL SP_ASSIGN_ROLE_TO_GROUP(?, ?)}";
        try (Connection conn = DBConnection.getConnection();
             CallableStatement cst = conn.prepareCall(sql)) {
            cst.setString(1, roleGroupID);
            cst.setString(2, roleID);
            cst.execute();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Xóa mềm tất cả quyền đã gán cho nhóm quyền
    public boolean removeAllRoles(String roleGroupID) {
        String sql = "{CALL SP_REMOVE_ALL_ROLES_FROM_GROUP(?)}";
        try (Connection conn = DBConnection.getConnection();
             CallableStatement cst = conn.prepareCall(sql)) {
            cst.setString(1, roleGroupID);
            cst.execute();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Tạo ID mới cho nhóm quyền
    public String generateNewID() {
        String sql = "SELECT 'RG' || LPAD(NVL(MAX(TO_NUMBER(SUBSTR(RoleGroupID, 3))), 0) + 1, 2, '0') AS NewID FROM ROLE_GROUP";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getString("NewID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "RG01";
    }

    // Tìm kiếm nhóm quyền theo tên
    public List<RoleGroupDTO> search(String keyword) {
        List<RoleGroupDTO> list = new ArrayList<>();
        String sql = "SELECT RoleGroupID, NameRoleGroup, Created_At, Updated_At, IsDeleted FROM ROLE_GROUP WHERE IsDeleted = 0 AND LOWER(NameRoleGroup) LIKE ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "%" + keyword.toLowerCase() + "%");
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    RoleGroupDTO dto = new RoleGroupDTO();
                    dto.setRoleGroupID(rs.getString("RoleGroupID"));
                    dto.setNameRoleGroup(rs.getString("NameRoleGroup"));
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
}
