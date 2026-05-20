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
}
