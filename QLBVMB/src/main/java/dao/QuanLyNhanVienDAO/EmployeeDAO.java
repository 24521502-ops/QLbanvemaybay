package dao.QuanLyNhanVienDAO;

import dto.EmployeeDTO;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO {

    /**
     * Lấy toàn bộ danh sách nhân viên
     */
    public List<EmployeeDTO> getAll() {
        List<EmployeeDTO> list = new ArrayList<>();
        String sql = "SELECT EmployeeID, AccountID, FullName, Position, Phone, Email FROM EMPLOYEE ORDER BY EmployeeID";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                EmployeeDTO emp = new EmployeeDTO();
                emp.setEmployeeID(rs.getString("EmployeeID"));
                emp.setAccountID(rs.getString("AccountID"));
                emp.setFullName(rs.getString("FullName"));
                emp.setPosition(rs.getString("Position"));
                emp.setPhone(rs.getString("Phone"));
                emp.setEmail(rs.getString("Email"));
                list.add(emp);
            }
        } catch (SQLException e) {
            System.err.println("EmployeeDAO.getAll() error: " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }

    /**
     * Lấy danh sách nhân viên theo chức vụ (Position)
     */
    public List<EmployeeDTO> getByPosition(String position) {
        List<EmployeeDTO> list = new ArrayList<>();
        String sql = "SELECT EmployeeID, AccountID, FullName, Position, Phone, Email FROM EMPLOYEE WHERE Position = ? ORDER BY EmployeeID";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, position);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    EmployeeDTO emp = new EmployeeDTO();
                    emp.setEmployeeID(rs.getString("EmployeeID"));
                    emp.setAccountID(rs.getString("AccountID"));
                    emp.setFullName(rs.getString("FullName"));
                    emp.setPosition(rs.getString("Position"));
                    emp.setPhone(rs.getString("Phone"));
                    emp.setEmail(rs.getString("Email"));
                    list.add(emp);
                }
            }
        } catch (SQLException e) {
            System.err.println("EmployeeDAO.getByPosition() error: " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }

    /**
     * Tìm kiếm nhân viên theo tên
     */
    public List<EmployeeDTO> searchByName(String keyword) {
        List<EmployeeDTO> list = new ArrayList<>();
        String sql = "SELECT EmployeeID, AccountID, FullName, Position, Phone, Email FROM EMPLOYEE WHERE UPPER(FullName) LIKE UPPER(?) ORDER BY EmployeeID";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "%" + keyword + "%");
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    EmployeeDTO emp = new EmployeeDTO();
                    emp.setEmployeeID(rs.getString("EmployeeID"));
                    emp.setAccountID(rs.getString("AccountID"));
                    emp.setFullName(rs.getString("FullName"));
                    emp.setPosition(rs.getString("Position"));
                    emp.setPhone(rs.getString("Phone"));
                    emp.setEmail(rs.getString("Email"));
                    list.add(emp);
                }
            }
        } catch (SQLException e) {
            System.err.println("EmployeeDAO.searchByName() error: " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }

    /**
     * Lấy danh sách tất cả chức vụ (Position) khác nhau
     */
    public List<String> getAllPositions() {
        List<String> positions = new ArrayList<>();
        String sql = "SELECT DISTINCT Position FROM EMPLOYEE WHERE Position IS NOT NULL ORDER BY Position";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                positions.add(rs.getString("Position"));
            }
        } catch (SQLException e) {
            System.err.println("EmployeeDAO.getAllPositions() error: " + e.getMessage());
            e.printStackTrace();
        }
        return positions;
    }

    /**
     * Đếm tổng số nhân viên
     */
    public int countAll() {
        String sql = "SELECT COUNT(*) FROM EMPLOYEE";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery()) {
            if (rs.next())
                return rs.getInt(1);
        } catch (SQLException e) {
            System.err.println("EmployeeDAO.countAll() error: " + e.getMessage());
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * Thêm nhân viên mới bằng Stored Procedure SP_ADD_EMPLOYEE
     */
    public boolean add(EmployeeDTO emp) {
        String sql = "{CALL SP_ADD_EMPLOYEE(?, ?, ?, ?, ?)}";
        try (Connection conn = DBConnection.getConnection();
                CallableStatement cs = conn.prepareCall(sql)) {
            cs.setString(1, emp.getAccountID());
            cs.setString(2, emp.getFullName());
            cs.setString(3, emp.getPosition());
            cs.setString(4, emp.getPhone());
            cs.setString(5, emp.getEmail());
            cs.execute();
            return true;
        } catch (SQLException e) {
            System.err.println("EmployeeDAO.add() error: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Cập nhật nhân viên bằng Stored Procedure SP_UPDATE_EMPLOYEE
     */
    public boolean update(EmployeeDTO emp) {
        String sql = "{CALL SP_UPDATE_EMPLOYEE(?, ?, ?, ?, ?)}";
        try (Connection conn = DBConnection.getConnection();
                CallableStatement cs = conn.prepareCall(sql)) {
            cs.setString(1, emp.getEmployeeID());
            cs.setString(2, emp.getFullName());
            cs.setString(3, emp.getPosition());
            cs.setString(4, emp.getPhone());
            cs.setString(5, emp.getEmail());
            cs.execute();
            return true;
        } catch (SQLException e) {
            System.err.println("EmployeeDAO.update() error: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Xóa nhân viên bằng Stored Procedure SP_DELETE_EMPLOYEE
     */
    public boolean delete(String employeeID) {
        String sql = "{CALL SP_DELETE_EMPLOYEE(?)}";
        try (Connection conn = DBConnection.getConnection();
                CallableStatement cs = conn.prepareCall(sql)) {
            cs.setString(1, employeeID);
            cs.execute();
            return true;
        } catch (SQLException e) {
            System.err.println("EmployeeDAO.delete() error: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}
