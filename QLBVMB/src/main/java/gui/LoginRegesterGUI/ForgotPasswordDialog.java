package gui.LoginRegesterGUI;

import bus.LoginRegesterBUS.loginBUS;
import com.formdev.flatlaf.FlatClientProperties;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;

public class ForgotPasswordDialog extends JDialog {

    private JTextField txtEmail;
    private JPasswordField txtNewPassword;
    private JPasswordField txtConfirmPassword;
    private JButton btnReset;
    private JButton btnCancel;
    
    private final loginBUS bus = new loginBUS();

    public ForgotPasswordDialog(JFrame parent) {
        super(parent, "Quên mật khẩu", true);
        initComponents();
        setSize(400, 480);
        setLocationRelativeTo(parent);
        setResizable(false);
    }

    private void initComponents() {
        JPanel panel = new JPanel(new MigLayout("wrap, fillx, insets 25 35 25 35", "[fill]", "[]15[]10[]10[]10[]25[]"));
        panel.setBackground(Color.WHITE);

        JLabel lblTitle = new JLabel("Lấy Lại Mật Khẩu");
        lblTitle.putClientProperty(FlatClientProperties.STYLE, "font: bold +8");
        lblTitle.setHorizontalAlignment(SwingConstants.CENTER);
        panel.add(lblTitle);

        JLabel lblDesc = new JLabel("Nhập thông tin tài khoản của bạn để xác minh.");
        lblDesc.putClientProperty(FlatClientProperties.STYLE, "foreground: tint(@foreground, 50%)");
        lblDesc.setHorizontalAlignment(SwingConstants.CENTER);
        panel.add(lblDesc);

        txtEmail = new JTextField();
        txtEmail.putClientProperty(FlatClientProperties.PLACEHOLDER_TEXT, "Email đã đăng ký");
        txtEmail.putClientProperty(FlatClientProperties.STYLE, "showClearButton: true");
        panel.add(new JLabel("Email:"));
        panel.add(txtEmail, "h 35!");

        txtNewPassword = new JPasswordField();
        txtNewPassword.putClientProperty(FlatClientProperties.PLACEHOLDER_TEXT, "Mật khẩu mới");
        txtNewPassword.putClientProperty(FlatClientProperties.STYLE, "showRevealButton: true");
        panel.add(new JLabel("Mật khẩu mới:"));
        panel.add(txtNewPassword, "h 35!");

        txtConfirmPassword = new JPasswordField();
        txtConfirmPassword.putClientProperty(FlatClientProperties.PLACEHOLDER_TEXT, "Xác nhận mật khẩu mới");
        txtConfirmPassword.putClientProperty(FlatClientProperties.STYLE, "showRevealButton: true");
        panel.add(new JLabel("Xác nhận mật khẩu:"));
        panel.add(txtConfirmPassword, "h 35!");

        JPanel btnPanel = new JPanel(new MigLayout("insets 0", "[grow][grow]", "[]"));
        btnPanel.setOpaque(false);

        btnCancel = new JButton("Hủy");
        btnCancel.setCursor(new Cursor(Cursor.HAND_CURSOR));
        btnCancel.addActionListener(e -> dispose());
        btnPanel.add(btnCancel, "growx, h 35!");

        btnReset = new JButton("Đổi mật khẩu");
        btnReset.setCursor(new Cursor(Cursor.HAND_CURSOR));
        btnReset.setBackground(new Color(0x2563EB)); // Blue 600
        btnReset.setForeground(Color.WHITE);
        btnReset.putClientProperty(FlatClientProperties.STYLE, "font: bold; borderWidth: 0; focusWidth: 0; arc: 10");
        btnReset.addActionListener(this::handleResetPassword);
        btnPanel.add(btnReset, "growx, h 35!");

        panel.add(btnPanel);

        add(panel);
    }

    private void handleResetPassword(ActionEvent e) {
        String email = txtEmail.getText();
        String newPass = new String(txtNewPassword.getPassword());
        String confirmPass = new String(txtConfirmPassword.getPassword());

        // Vì tên đăng nhập của Khách hàng cũng chính là Email nên ta truyền email 2 lần.
        String errorMsg = bus.verifyAndResetPassword(email, email, newPass, confirmPass);
        if (errorMsg != null) {
            JOptionPane.showMessageDialog(this, errorMsg, "Lỗi", JOptionPane.ERROR_MESSAGE);
        } else {
            JOptionPane.showMessageDialog(this, "Đổi mật khẩu thành công! Bạn có thể đăng nhập bằng mật khẩu mới.", "Thành công", JOptionPane.INFORMATION_MESSAGE);
            dispose();
        }
    }
}
