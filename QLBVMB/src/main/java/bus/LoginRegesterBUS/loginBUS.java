package bus.LoginRegesterBUS;

import dao.LoginRegesterDAO.loginDAO;
import dto.AccountDTO;

/**
 * Business logic layer cho chức năng đăng nhập.
 *
 * @author Trần Minh Quyền
 */
public class loginBUS {

    private final loginDAO loginDAO = new loginDAO();

    /**
     * Xác thực đăng nhập.
     *
     * @param userName tên đăng nhập (email)
     * @param password mật khẩu
     * @return AccountDTO nếu đăng nhập thành công, null nếu thất bại
     */
    public AccountDTO login(String userName, String password) {
        if (userName == null || userName.isBlank()) return null;
        if (password == null || password.isBlank()) return null;
        
        AccountDTO acc = loginDAO.findAccount(userName.trim(), password.trim());
        if (acc != null) {
            // Lấy nhóm quyền của tài khoản này từ CSDL và gán vào session DTO
            String roleGroup = loginDAO.getRoleGroupName(acc.getAccountID());
            acc.setRoleGroup(roleGroup != null ? roleGroup : "STAFF_GROUP"); // dự phòng mặc định là STAFF
            
            // Lấy CustomerID tương ứng nếu có
            String customerID = loginDAO.getCustomerIDByAccountID(acc.getAccountID());
            acc.setCustomerID(customerID);
        }
        return acc;
    }

    /**
     * Validate input trước khi đăng nhập.
     *
     * @return chuỗi lỗi nếu input không hợp lệ, null nếu OK
     */
    public String validate(String userName, String password) {
        if (userName == null || userName.isBlank())
            return "Vui lòng nhập tên đăng nhập.";
        if (password == null || password.isBlank())
            return "Vui lòng nhập mật khẩu.";
        return null;
    }

    /**
     * Xác thực thông tin và đổi mật khẩu mới.
     *
     * @return null nếu thành công, chuỗi lỗi nếu thất bại
     */
    public String verifyAndResetPassword(String userName, String email, String newPassword, String confirmPassword) {
        if (userName == null || userName.isBlank()) return "Vui lòng nhập Tên đăng nhập.";
        if (email == null || email.isBlank()) return "Vui lòng nhập Email.";
        if (newPassword == null || newPassword.isBlank()) return "Vui lòng nhập Mật khẩu mới.";
        if (!newPassword.equals(confirmPassword)) return "Xác nhận mật khẩu không khớp.";
        if (newPassword.length() < 6) return "Mật khẩu phải có ít nhất 6 ký tự.";

        String dbError = loginDAO.resetPassword(userName.trim(), email.trim(), newPassword);
        return dbError; // null nếu thành công, chuỗi lỗi nếu thất bại
    }
}
