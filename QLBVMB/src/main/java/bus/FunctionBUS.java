package bus;

import dao.FunctionDAO;
import dto.FunctionDTO;

import java.util.List;

public class FunctionBUS {
    private final FunctionDAO dao = new FunctionDAO();

    public List<FunctionDTO> getAll() {
        return dao.getAll();
    }

    public FunctionDTO getByID(String functionID) {
        return dao.getByID(functionID);
    }
}
