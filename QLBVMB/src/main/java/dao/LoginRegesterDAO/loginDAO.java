package dao.LoginRegesterDAO;

import dto.AccountDTO;
import util.DBConnection;

import java.sql.*;

/**
 * DAO xử lý truy vấn đăng nhập từ CSDL Oracle.
 *
 * @author Trần Minh Quyền
 */
public class loginDAO {

    /**
     * Tìm tài khoản theo userName và password.
     *
     * @param userName tên đăng nhập
     * @param password mật khẩu (plain-text hoặc hash tuỳ hệ thống)
     * @return AccountDTO nếu tìm thấy, null nếu sai thông tin
     */
    public AccountDTO findAccount(String userName, String password) {
        String sql = "SELECT accountID, userID, userName, password, status "
                   + "FROM Account "
                   + "WHERE userName = ? AND password = ? AND (isDeleted = 0 OR isDeleted IS NULL)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, userName);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    AccountDTO acc = new AccountDTO();
                    acc.setAccountID(rs.getString("accountID"));
                    acc.setUserID(rs.getString("userID"));
                    acc.setUserName(rs.getString("userName"));
                    acc.setPassword(rs.getString("password"));
                    acc.setStatus(rs.getString("status"));
                    return acc;
                }
            }
        } catch (SQLException e) {
            System.err.println("[loginDAO] Lỗi khi truy vấn đăng nhập: " + e.getMessage());
        }
        return null;
    }

    public boolean isUserNameExisted(String userName) {
        String sql = "SELECT 1 FROM Account WHERE userName = ? AND isDeleted = 0";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, userName);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            System.err.println("[loginDAO] Lỗi kiểm tra userName: " + e.getMessage());
        }
        return false;
    }

    /**
     * Lấy tên nhóm quyền của tài khoản.
     */
    public String getRoleGroupName(String accountID) {
        String sql = "SELECT rg.NameRoleGroup " +
                     "FROM ACCOUNT_ASSIGN_ROLE_GROUP aarg " +
                     "JOIN ROLE_GROUP rg ON aarg.RoleGroupID = rg.RoleGroupID " +
                     "WHERE aarg.AccountID = ? AND (aarg.IsDeleted = 0 OR aarg.IsDeleted IS NULL)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, accountID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("NameRoleGroup");
                }
            }
        } catch (SQLException e) {
            System.err.println("[loginDAO] Lỗi lấy nhóm quyền: " + e.getMessage());
        }
        return null;
    }

    /**
     * Lấy CustomerID tương ứng với AccountID của Khách hàng.
     */
    public String getCustomerIDByAccountID(String accountID) {
        String sql = "SELECT CustomerID FROM CUSTOMER WHERE AccountID = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, accountID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("CustomerID");
                }
            }
        } catch (SQLException e) {
            System.err.println("[loginDAO] Lỗi lấy CustomerID: " + e.getMessage());
        }
        return null;
    }
}
