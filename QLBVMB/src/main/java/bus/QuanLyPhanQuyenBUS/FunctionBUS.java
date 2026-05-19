package bus.QuanLyPhanQuyenBUS;

import dto.FunctionDTO;

import java.util.List;

import dao.QuanLyPhanQuyenDAO.FunctionDAO;

public class FunctionBUS {
    private final FunctionDAO dao = new FunctionDAO();

    public List<FunctionDTO> getAll() {
        return dao.getAll();
    }

    public FunctionDTO getByID(String functionID) {
        return dao.getByID(functionID);
    }
}
