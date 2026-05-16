package gui.QuanLyKhachHangGUI;

import java.awt.*;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import javax.swing.*;
import javax.swing.border.EmptyBorder;

import bus.QuanLyKhachHangBUS.CustomerBUS;
import util.AppColor;

public class ThemKhachHangDialog extends JDialog {
    private JTextField txtName, txtEmail, txtPhone, txtPassport, txtDOB;
    private JComboBox<String> cbxNationality, cbxGender;
    private CustomerBUS customerBUS;

    public ThemKhachHangDialog(Frame parent) {
        super(parent, true);
        customerBUS = new CustomerBUS();
        initComponents();
        setLocationRelativeTo(parent);
    }

    private void initComponents() {
        setTitle("Thêm khách hàng mới");
        setSize(650, 500); // Mở rộng chiều cao form
        setLayout(new BorderLayout());
        getContentPane().setBackground(Color.WHITE);

        // HEADER
        JPanel header = new JPanel(new BorderLayout());
        header.setBackground(Color.WHITE);
        header.setBorder(new EmptyBorder(20, 30, 10, 30));
        JLabel lblTitle = new JLabel("Thêm Hồ Sơ Hành Khách");
        lblTitle.setFont(new Font("Inter", Font.BOLD, 20));
        header.add(lblTitle, BorderLayout.WEST);
        add(header, BorderLayout.NORTH);

        // BODY FORM (4 dòng, 2 cột)
        JPanel body = new JPanel(new GridLayout(4, 2, 20, 20));
        body.setBackground(Color.WHITE);
        body.setBorder(new EmptyBorder(10, 30, 20, 30));

        txtName = createTextField("Nhập họ tên (In hoa không dấu)...");

        txtName.addKeyListener(new KeyAdapter() {
            @Override
            public void keyReleased(KeyEvent e) {
                int pos = txtName.getCaretPosition(); // Lưu vị trí con trỏ chuột
                txtName.setText(txtName.getText().toUpperCase()); // Viết hoa toàn bộ
                txtName.setCaretPosition(pos); // Trả lại vị trí con trỏ để gõ mượt hơn
            }
        });
        cbxGender = new JComboBox<>(new String[] { "Male", "Female", "Other" });
        cbxGender.setBackground(Color.WHITE);

        txtDOB = createTextField("DD/MM/YYYY (VD: 25/12/1990)");
        txtPassport = createTextField("Nhập mã CCCD hoặc Hộ chiếu");

        txtEmail = createTextField("email@domain.com");
        txtPhone = createTextField("VD: 0901234567");

        cbxNationality = new JComboBox<>(new String[] { "Vietnam", "USA", "Japan", "Korea", "Singapore", "Other" });
        cbxNationality.setBackground(Color.WHITE);

        body.add(createInputGroup("HỌ TÊN HÀNH KHÁCH", txtName));
        body.add(createInputGroup("GIỚI TÍNH", cbxGender));
        body.add(createInputGroup("NGÀY SINH", txtDOB));
        body.add(createInputGroup("CCCD / PASSPORT", txtPassport));
        body.add(createInputGroup("SỐ ĐIỆN THOẠI", txtPhone));
        body.add(createInputGroup("EMAIL LIÊN HỆ", txtEmail));
        body.add(createInputGroup("QUỐC TỊCH", cbxNationality));

        add(body, BorderLayout.CENTER);

        // FOOTER BUTTONS
        JPanel footer = new JPanel(new FlowLayout(FlowLayout.RIGHT, 15, 20));
        footer.setBackground(Color.WHITE);
        footer.setBorder(BorderFactory.createMatteBorder(1, 0, 0, 0, AppColor.BORDER));

        JButton btnCancel = makeCustomButton("Hủy", AppColor.ERROR, Color.WHITE);
        btnCancel.addActionListener(e -> dispose());

        JButton btnSave = makeCustomButton("Lưu hồ sơ", AppColor.PRIMARY, Color.WHITE);
        btnSave.addActionListener(e -> saveCustomer());

        footer.add(btnCancel);
        footer.add(btnSave);
        add(footer, BorderLayout.SOUTH);
    }

    private void saveCustomer() {
        String name = txtName.getText().trim();
        String dob = txtDOB.getText().trim();
        String phone = txtPhone.getText().trim();
        String email = txtEmail.getText().trim();
        String passport = txtPassport.getText().trim();
        String gender = cbxGender.getSelectedItem().toString();
        String nationality = cbxNationality.getSelectedItem().toString();

        // 1. Kiểm tra rỗng
        if (name.isEmpty() || dob.isEmpty() || phone.isEmpty() || passport.isEmpty()) {
            JOptionPane.showMessageDialog(this, "Vui lòng nhập đầy đủ các trường bắt buộc (*)", "Cảnh báo",
                    JOptionPane.WARNING_MESSAGE);
            return;
        }

        // 2. Bắt lỗi định dạng Ngày sinh (DD/MM/YYYY)
        if (!dob.matches("^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/\\d{4}$")) {
            JOptionPane.showMessageDialog(this, "Ngày sinh không hợp lệ!\nVui lòng nhập theo định dạng DD/MM/YYYY.",
                    "Lỗi nhập liệu", JOptionPane.ERROR_MESSAGE);
            return;
        }

        // 3. Bắt lỗi định dạng Số điện thoại (Chỉ cho phép số)
        if (!phone.matches("^[0-9]+$")) {
            JOptionPane.showMessageDialog(this, "Số điện thoại không hợp lệ!\nVui lòng chỉ nhập các ký tự số.",
                    "Lỗi nhập liệu", JOptionPane.ERROR_MESSAGE);
            return;
        }

        // 4. Bắt lỗi định dạng Email (Nếu có nhập)
        if (!email.isEmpty() && !email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            JOptionPane.showMessageDialog(this, "Email không đúng định dạng!\nVí dụ đúng: name@gmail.com",
                    "Lỗi nhập liệu", JOptionPane.ERROR_MESSAGE);
            return;
        }

        // ========================================================
        // 5. TRƯỚC KHI LƯU: KIỂM TRA TRÙNG LẶP EMAIL / PASSPORT
        // ========================================================
        String checkExist = customerBUS.kiemTraTrungLap(email, passport);
        if (checkExist.equals("BOTH")) {
            JOptionPane.showMessageDialog(this, "Cả Email và CCCD/Passport đều đã tồn tại trong hệ thống!",
                    "Lỗi trùng lặp", JOptionPane.ERROR_MESSAGE);
            return;
        } else if (checkExist.equals("EMAIL")) {
            JOptionPane.showMessageDialog(this, "Email này đã được sử dụng bởi một khách hàng khác!", "Lỗi trùng lặp",
                    JOptionPane.ERROR_MESSAGE);
            return;
        } else if (checkExist.equals("PASSPORT")) {
            JOptionPane.showMessageDialog(this, "Số CCCD/Passport này đã tồn tại trong hệ thống!", "Lỗi trùng lặp",
                    JOptionPane.ERROR_MESSAGE);
            return;
        } else if (checkExist.equals("ERROR")) {
            JOptionPane.showMessageDialog(this, "Lỗi kết nối cơ sở dữ liệu khi kiểm tra thông tin.", "Lỗi hệ thống",
                    JOptionPane.ERROR_MESSAGE);
            return;
        }

        // Vượt qua 5 vòng kiểm duyệt -> Gửi xuống Database
        boolean success = customerBUS.themKhachHang(name, gender, dob, phone, email, passport, nationality);
        if (success) {
            JOptionPane.showMessageDialog(this, "Tạo hồ sơ khách hàng thành công!");
            dispose();
        } else {
            JOptionPane.showMessageDialog(this, "Lưu thất bại do lỗi hệ thống.", "Lỗi Database",
                    JOptionPane.ERROR_MESSAGE);
        }
    }

    private JPanel createInputGroup(String label, JComponent input) {
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

    private JTextField createTextField(String placeholder) {
        JTextField txt = new JTextField();
        txt.putClientProperty("JTextField.placeholderText", placeholder);
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
        btn.setPreferredSize(new Dimension(140, 42));
        return btn;
    }
}