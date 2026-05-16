package dao.LoginRegesterDAO;

import util.DBConnection;

import java.sql.*;
import java.util.UUID;

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
        String userID     = "USR-" + UUID.randomUUID().toString().substring(0, 8).toUpperCase();
        String accountID  = "ACC-" + UUID.randomUUID().toString().substring(0, 8).toUpperCase();
        String customerID = "CUS-" + UUID.randomUUID().toString().substring(0, 8).toUpperCase();
        String userName   = email; // dùng email làm username mặc định

        String sqlUser = "INSERT INTO Users (userID, fullName, email, createdAt, isDeleted) "
                       + "VALUES (?, ?, ?, SYSDATE, 0)";
        String sqlAccount = "INSERT INTO Account (accountID, userID, userName, password, status, createdAt, isDeleted) "
                          + "VALUES (?, ?, ?, ?, 'active', SYSDATE, 0)";
        String sqlCustomer = "INSERT INTO Customer (customerID, accountID, fullName, phone, email) "
                           + "VALUES (?, ?, ?, ?, ?)";

        Connection conn = null;
        try {
            conn = DBConnection.getConnection();
            if (conn == null) return false;
            conn.setAutoCommit(false);

            // 1. Insert Users
            try (PreparedStatement ps = conn.prepareStatement(sqlUser)) {
                ps.setString(1, userID);
                ps.setString(2, fullName);
                ps.setString(3, email);
                ps.executeUpdate();
            }

            // 2. Insert Account
            try (PreparedStatement ps = conn.prepareStatement(sqlAccount)) {
                ps.setString(1, accountID);
                ps.setString(2, userID);
                ps.setString(3, userName);
                ps.setString(4, password);
                ps.executeUpdate();
            }

            // 3. Insert Customer
            try (PreparedStatement ps = conn.prepareStatement(sqlCustomer)) {
                ps.setString(1, customerID);
                ps.setString(2, accountID);
                ps.setString(3, fullName);
                ps.setString(4, phone);
                ps.setString(5, email);
                ps.executeUpdate();
            }

            conn.commit();
            return true;

        } catch (SQLException e) {
            System.err.println("[regesterDAO] Lỗi đăng ký: " + e.getMessage());
            try { if (conn != null) conn.rollback(); } catch (SQLException ex) { ex.printStackTrace(); }
        } finally {
            try { if (conn != null) conn.close(); } catch (SQLException ex) { ex.printStackTrace(); }
        }
        return false;
    }
}
