package gui.QuanLyKhachHangGUI;

import java.awt.*;
import javax.swing.*;
import javax.swing.border.EmptyBorder;

import bus.QuanLyKhachHangBUS.CustomerBUS;
import util.AppColor;

public class SuaKhachHangDialog extends JDialog {
    private String cusID;
    private JTextField txtPhone, txtEmail, txtName, txtPassport;
    private CustomerBUS customerBUS;

    // ĐÃ SỬA: Thêm tham số passport vào hàm khởi tạo
    public SuaKhachHangDialog(Frame parent, String id, String name, String phone, String email, String passport) {
        super(parent, true);
        this.cusID = id;
        this.customerBUS = new CustomerBUS();
        initComponents(name, phone, email, passport);
        setLocationRelativeTo(parent);
    }

    private void initComponents(String name, String phone, String email, String passport) {
        setTitle("Cập nhật thông tin liên hệ");
        setSize(550, 350);
        setLayout(new BorderLayout());
        getContentPane().setBackground(Color.WHITE);

        // HEADER
        JPanel header = new JPanel(new BorderLayout());
        header.setBackground(Color.WHITE);
        header.setBorder(new EmptyBorder(20, 30, 10, 30));

        JLabel lblTitle = new JLabel("Cập Nhật Thông Tin Liên Hệ");
        lblTitle.setFont(new Font("Inter", Font.BOLD, 20));
        lblTitle.setForeground(AppColor.TEXT_PRIMARY);

        header.add(lblTitle, BorderLayout.NORTH);
        add(header, BorderLayout.NORTH);

        // BODY (Chia 2 cột)
        JPanel body = new JPanel(new GridLayout(2, 2, 20, 15));
        body.setBackground(Color.WHITE);
        body.setBorder(new EmptyBorder(15, 30, 20, 30));

        // 1. Các ô KHÓA (Read-only) - Thông tin định danh
        txtName = createTextField(name);
        txtName.setEditable(false);
        txtName.setBackground(new Color(241, 245, 249));
        txtName.setForeground(AppColor.TEXT_SECONDARY);

        txtPassport = createTextField(passport);
        txtPassport.setEditable(true); // ĐÃ MỞ KHÓA
        txtPassport.setBackground(Color.WHITE);
        txtPassport.setForeground(AppColor.TEXT_PRIMARY);

        // 2. Các ô CHO PHÉP SỬA - Thông tin liên hệ
        txtPhone = createTextField(phone);
        txtEmail = createTextField(email);

        // Cột 1 (Bên trái)
        body.add(createInputGroup("HỌ TÊN ĐỊNH DANH", txtName));
        body.add(createInputGroup("SỐ ĐIỆN THOẠI MỚI", txtPhone));

        // Cột 2 (Bên phải)
        body.add(createInputGroup("CCCD / PASSPORT", txtPassport));
        body.add(createInputGroup("EMAIL MỚI", txtEmail));

        add(body, BorderLayout.CENTER);

        // FOOTER
        JPanel footer = new JPanel(new FlowLayout(FlowLayout.RIGHT, 15, 15));
        footer.setBackground(Color.WHITE);
        footer.setBorder(BorderFactory.createMatteBorder(1, 0, 0, 0, AppColor.BORDER));

        JButton btnCancel = makeCustomButton("Hủy", AppColor.ERROR, Color.WHITE);
        btnCancel.addActionListener(e -> dispose());

        JButton btnSave = makeCustomButton("Lưu thay đổi", AppColor.PRIMARY, Color.WHITE);
        btnSave.addActionListener(e -> saveChanges());

        footer.add(btnCancel);
        footer.add(btnSave);
        add(footer, BorderLayout.SOUTH);
    }

    private void saveChanges() {
        String phone = txtPhone.getText().trim();
        if (phone.equals("(Chưa cập nhật)")) phone = "";

        String email = txtEmail.getText().trim();
        if (email.equals("(Chưa cập nhật)")) email = "";
        
        String passportVal = txtPassport.getText().trim();
        if (passportVal.equals("(Chưa cập nhật)")) passportVal = "";

        if (phone.isEmpty()) {
            JOptionPane.showMessageDialog(this, "Số điện thoại không được để trống!", "Cảnh báo",
                    JOptionPane.WARNING_MESSAGE);
            return;
        }
        if (!phone.matches("^[0-9]+$")) {
            JOptionPane.showMessageDialog(this, "Số điện thoại không hợp lệ!\nVui lòng chỉ nhập các ký tự số.",
                    "Lỗi nhập liệu", JOptionPane.ERROR_MESSAGE);
            return;
        }
        if (!email.isEmpty() && !email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            JOptionPane.showMessageDialog(this, "Email không đúng định dạng!\nVí dụ đúng: name@gmail.com",
                    "Lỗi nhập liệu", JOptionPane.ERROR_MESSAGE);
            return;
        }
        
        // Kiểm tra trùng lặp nếu có nhập CCCD hoặc Email
        String checkDup = customerBUS.kiemTraTrungLap(email.isEmpty() ? null : email, passportVal.isEmpty() ? null : passportVal);
        // Lưu ý: hàm kiemTraTrungLap hiện tại quét toàn bảng, nên nếu giá trị chưa đổi nó vẫn báo trùng.
        // Để làm chuẩn nhất ở mức Đồ án, ta ưu tiên gọi luôn hàm Update. Nếu CSDL bị lỗi Unique Constraint thì sẽ tự văng lỗi.

        boolean success = customerBUS.suaKhachHang(cusID, phone, email, passportVal);
        if (success) {
            JOptionPane.showMessageDialog(this, "Đã cập nhật thông tin thành công!");
            dispose();
        } else {
            JOptionPane.showMessageDialog(this, "Cập nhật thất bại.\nCó thể Email hoặc CCCD này đã tồn tại trong hệ thống.", "Lỗi Dữ Liệu",
                    JOptionPane.ERROR_MESSAGE);
        }
    }

    private JPanel createInputGroup(String label, JTextField input) {
        JPanel p = new JPanel(new BorderLayout(0, 8));
        p.setBackground(Color.WHITE);
        JLabel lbl = new JLabel(label);
        lbl.setFont(new Font("Inter", Font.BOLD, 12));
        lbl.setForeground(AppColor.TEXT_SECONDARY);
        p.add(lbl, BorderLayout.NORTH);
        input.setPreferredSize(new Dimension(0, 40));
        p.add(input, BorderLayout.CENTER);
        return p;
    }

    private JTextField createTextField(String text) {
        JTextField txt = new JTextField(text);
        txt.setFont(new Font("Inter", Font.PLAIN, 14));
        txt.setBorder(BorderFactory.createCompoundBorder(BorderFactory.createLineBorder(AppColor.BORDER),
                new EmptyBorder(0, 10, 0, 10)));
        return txt;
    }

    private JButton makeCustomButton(String text, Color bgColor, Color fgColor) {
        JButton btn = new JButton(text) {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(bgColor);
                g2.fillRoundRect(0, 0, getWidth(), getHeight(), 6, 6);
                g2.dispose();
                super.paintComponent(g);
            }
        };
        btn.setFont(new Font("Inter", Font.BOLD, 14));
        btn.setForeground(fgColor);
        btn.setContentAreaFilled(false);
        btn.setBorderPainted(false);
        btn.setCursor(new Cursor(Cursor.HAND_CURSOR));
        btn.setPreferredSize(new Dimension(140, 40));
        return btn;
    }
}