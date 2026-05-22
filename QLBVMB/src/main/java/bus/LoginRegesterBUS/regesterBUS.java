package bus.LoginRegesterBUS;

import dao.LoginRegesterDAO.loginDAO;
import dao.LoginRegesterDAO.regesterDAO;

/**
 * Business logic layer cho chức năng đăng ký tài khoản.
 *
 * @author Trần Minh Quyền
 */
public class regesterBUS {

    private final regesterDAO regesterDAO = new regesterDAO();
    private final loginDAO    loginDAO    = new loginDAO();

    /**
     * Thực hiện đăng ký tài khoản mới sau khi đã validate.
     *
     * @return null nếu đăng ký thành công, chuỗi lỗi nếu thất bại
     */
    public String register(String fullName, String email, String phone, String username,
                           String password, String confirmPassword) {

        // ─── Validate input ───
        if (fullName == null || fullName.isBlank())
            return "Vui lòng nhập họ và tên.";
        if (email == null || email.isBlank())
            return "Vui lòng nhập email.";
        if (!email.matches("^[\\w.-]+@[\\w.-]+\\.[a-zA-Z]{2,}$"))
            return "Email không đúng định dạng.";
        if (phone == null || phone.isBlank())
            return "Vui lòng nhập số điện thoại.";
        if (!phone.matches("^(0|\\+84)[0-9]{8,10}$"))
            return "Số điện thoại không hợp lệ (VD: 0912345678).";
        if (username == null || username.isBlank())
            return "Vui lòng nhập tên đăng nhập.";
        if (password == null || password.isBlank())
            return "Vui lòng nhập mật khẩu.";
        if (password.length() < 6)
            return "Mật khẩu phải có ít nhất 6 ký tự.";
        if (!password.equals(confirmPassword))
            return "Mật khẩu xác nhận không khớp.";

        // ─── Kiểm tra trùng lặp ───
        if (loginDAO.isUserNameExisted(username))
            return "Tên đăng nhập đã tồn tại. Vui lòng chọn tên khác.";
        if (regesterDAO.isEmailExisted(email))
            return "Email đã tồn tại trong hệ thống.";
        if (regesterDAO.isPhoneExisted(phone))
            return "Số điện thoại đã được đăng ký bởi tài khoản khác.";

        // ─── Thực hiện INSERT ───
        boolean success = regesterDAO.register(
                fullName.trim(), email.trim(), phone.trim(), username.trim(), password);

        return success ? null : "Đăng ký thất bại. Vui lòng thử lại sau.";
    }
}
