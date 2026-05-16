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

    /**
     * Kiểm tra userName đã tồn tại chưa (dùng khi đăng ký).
     */
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
}
