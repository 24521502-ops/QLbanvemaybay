package bus;

import dao.EmployeeDAO;
import dto.EmployeeDTO;

import java.util.List;

public class EmployeeBUS {

    private final EmployeeDAO employeeDAO;

    public EmployeeBUS() {
        this.employeeDAO = new EmployeeDAO();
    }

    /**
     * Lấy toàn bộ danh sách nhân viên
     */
    public List<EmployeeDTO> getAll() {
        return employeeDAO.getAll();
    }

    /**
     * Lấy danh sách nhân viên theo chức vụ
     */
    public List<EmployeeDTO> getByPosition(String position) {
        if (position == null || position.trim().isEmpty()) {
            return getAll();
        }
        return employeeDAO.getByPosition(position);
    }

    /**
     * Tìm kiếm nhân viên theo tên
     */
    public List<EmployeeDTO> searchByName(String keyword) {
        if (keyword == null || keyword.trim().isEmpty()) {
            return getAll();
        }
        return employeeDAO.searchByName(keyword.trim());
    }

    /**
     * Lấy danh sách tất cả chức vụ
     */
    public List<String> getAllPositions() {
        return employeeDAO.getAllPositions();
    }

    /**
     * Đếm tổng số nhân viên
     */
    public int countAll() {
        return employeeDAO.countAll();
    }

    /**
     * Thêm nhân viên mới - Kiểm tra dữ liệu trước khi gọi DAO
     */
    public boolean add(EmployeeDTO emp) {
        // Validate bắt buộc
        if (emp.getFullName() == null || emp.getFullName().trim().isEmpty()) {
            throw new IllegalArgumentException("Họ tên không được để trống!");
        }
        if (emp.getEmail() == null || emp.getEmail().trim().isEmpty()) {
            throw new IllegalArgumentException("Email không được để trống!");
        }
        // Validate email format cơ bản
        if (!emp.getEmail().contains("@")) {
            throw new IllegalArgumentException("Email không hợp lệ!");
        }
        return employeeDAO.add(emp);
    }

    /**
     * Cập nhật thông tin nhân viên
     */
    public boolean update(EmployeeDTO emp) {
        if (emp.getEmployeeID() == null || emp.getEmployeeID().trim().isEmpty()) {
            throw new IllegalArgumentException("Mã nhân viên không hợp lệ!");
        }
        if (emp.getEmail() != null && !emp.getEmail().isEmpty() && !emp.getEmail().contains("@")) {
            throw new IllegalArgumentException("Email không hợp lệ!");
        }
        return employeeDAO.update(emp);
    }

    /**
     * Xóa nhân viên theo ID
     */
    public boolean delete(String employeeID) {
        if (employeeID == null || employeeID.trim().isEmpty()) {
            throw new IllegalArgumentException("Mã nhân viên không hợp lệ!");
        }
        return employeeDAO.delete(employeeID);
    }
}
