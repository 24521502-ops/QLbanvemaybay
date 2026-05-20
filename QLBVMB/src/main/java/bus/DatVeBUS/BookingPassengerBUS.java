package bus.DatVeBUS;

import java.time.LocalDate;
import javax.swing.JOptionPane;

public class BookingPassengerBUS {
    private final dao.DatVeDAO.BookingPassengerDAO passengerDAO = new dao.DatVeDAO.BookingPassengerDAO();

    /**
     * Kiểm tra định dạng thông tin hành khách.
     * 
     * @param name  Họ tên (phải viết hoa không dấu)
     * @param email Email
     * @param phone Số điện thoại
     * @param dob   Ngày sinh
     * @return Thông báo lỗi nếu có, null nếu hợp lệ
     */
    public String validatePassenger(String name, String email, String phone, LocalDate dob, String passport) {
        if (name == null || name.trim().isEmpty()) {
            return "Họ tên không được để trống.";
        }
        if (!name.matches("^[A-Z\\s]+$")) {
            return "Họ tên phải viết hoa không dấu (ví dụ: NGUYEN VAN A).";
        }

        if (email == null || email.trim().isEmpty()) {
            return "Email không được để trống.";
        }
        if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            return "Địa chỉ email không đúng định dạng.";
        }

        if (phone == null || phone.trim().isEmpty()) {
            return "Số điện thoại không được để trống.";
        }
        if (!phone.matches("^\\d{9,11}$")) {
            return "Số điện thoại phải là dãy số từ 9-11 chữ số.";
        }

        if (dob == null) {
            return "Vui lòng chọn ngày sinh.";
        }
        if (dob.isAfter(LocalDate.now())) {
            return "Ngày sinh không thể ở tương lai.";
        }

        if (passport == null || passport.trim().isEmpty()) {
            return "Số Hộ chiếu / CCCD không được để trống.";
        }
        if (!passport.matches("^[A-Z0-9]+$")) {
            return "Số Hộ chiếu / CCCD chỉ được chứa chữ cái in hoa và số.";
        }

        return null; // Hợp lệ
    }

    /**
     * Thêm hành khách vào DB
     */
    public String addPassenger(dto.PassengerDTO p) {
        return passengerDAO.addPassenger(p);
    }

    /**
     * Hiển thị thông báo lỗi (helper method)
     */
    public void showError(String message) {
        JOptionPane.showMessageDialog(null, message, "Lỗi nhập liệu", JOptionPane.ERROR_MESSAGE);
    }
}
