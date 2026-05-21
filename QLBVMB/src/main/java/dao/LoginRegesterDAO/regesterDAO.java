package dao.LoginRegesterDAO;

import util.DBConnection;

import java.sql.*;

/**
 * DAO xử lý đăng ký tài khoản mới vào CSDL Oracle.
 * Khi đăng ký, cần INSERT vào 3 bảng: Users, Account, Customer.
 *
 * @author Trần Minh Quyền
 */
public class regesterDAO {

    /**
     * Kiểm tra email đã tồn tại trong bảng Users chưa.
     */
    public boolean isEmailExisted(String email) {
        String sql = "SELECT 1 FROM Users WHERE email = ? AND isDeleted = 0";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            System.err.println("[regesterDAO] Lỗi kiểm tra email: " + e.getMessage());
        }
        return false;
    }

    /**
     * Kiểm tra số điện thoại đã tồn tại trong bảng Customer chưa.
     */
    public boolean isPhoneExisted(String phone) {
        String sql = "SELECT 1 FROM Customer WHERE phone = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, phone);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            System.err.println("[regesterDAO] Lỗi kiểm tra phone: " + e.getMessage());
        }
        return false;
    }

    /**
     * Thực hiện đăng ký: INSERT Users → INSERT Account → INSERT Customer.
     * Sử dụng transaction để đảm bảo tính toàn vẹn dữ liệu.
     *
     * @return true nếu thành công, false nếu thất bại
     */
    public boolean register(String fullName, String email, String phone, String password) {
        String sql = "{call SP_REGISTER_ACCOUNT(?, ?, ?, ?)}";
        try (Connection conn = DBConnection.getConnection();
                CallableStatement cs = conn.prepareCall(sql)) {

            cs.setString(1, fullName);
            cs.setString(2, email);
            cs.setString(3, phone);
            cs.setString(4, password);

            cs.execute();
            return true;

        } catch (SQLException e) {
            System.err.println("[regesterDAO] Lỗi đăng ký: " + e.getMessage());
            return false;
        }
    }
}
