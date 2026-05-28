package bus.QuanLyPhanQuyenBUS;

import dto.RoleGroupDTO;

import java.util.List;

import dao.QuanLyPhanQuyenDAO.RoleGroupDAO;

public class RoleGroupBUS {
    private final RoleGroupDAO dao = new RoleGroupDAO();

    public List<RoleGroupDTO> getAll() {
        return dao.getAll();
    }

    public RoleGroupDTO getByID(String roleGroupID) {
        return dao.getByID(roleGroupID);
    }

    public boolean insert(RoleGroupDTO dto) {
        if (dto.getNameRoleGroup() == null || dto.getNameRoleGroup().trim().isEmpty()) {
            return false;
        }
        return dao.insert(dto);
    }

    public boolean update(RoleGroupDTO dto) {
        if (dto.getNameRoleGroup() == null || dto.getNameRoleGroup().trim().isEmpty()) {
            return false;
        }
        return dao.update(dto);
    }

    public boolean delete(String roleGroupID) {
        return dao.delete(roleGroupID);
    }

    public int countUsers(String roleGroupID) {
        return dao.countUsers(roleGroupID);
    }

    public List<String> getAssignedRoleIDs(String roleGroupID) {
        return dao.getAssignedRoleIDs(roleGroupID);
    }

    public boolean assignRole(String roleGroupID, String roleID) {
        return dao.assignRole(roleGroupID, roleID);
    }

    public boolean removeAllRoles(String roleGroupID) {
        return dao.removeAllRoles(roleGroupID);
    }

    public String generateNewID() {
        return dao.generateNewID();
    }

    public List<RoleGroupDTO> search(String keyword) {
        if (keyword == null || keyword.trim().isEmpty()) {
            return dao.getAll();
        }
        return dao.search(keyword.trim());
    }
}
