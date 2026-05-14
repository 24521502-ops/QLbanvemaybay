package bus.QuanLyPhanQuyenBUS;

import dto.RoleDTO;

import java.util.List;

import dao.QuanLyPhanQuyenDAO.RoleDAO;

public class RoleBUS {
    private final RoleDAO dao = new RoleDAO();

    public List<RoleDTO> getAll() {
        return dao.getAll();
    }

    public List<RoleDTO> getByFunctionID(String functionID) {
        return dao.getByFunctionID(functionID);
    }

    public RoleDTO getByID(String roleID) {
        return dao.getByID(roleID);
    }
}
