package text;

import gui.loginGUI;

import javax.swing.*;

/**
 * Entry point của ứng dụng - Mở màn hình đăng nhập.
 *
 * @author Trần Minh Quyền
 */
public class mainlogin {

    public static void main(String[] args) {
        // Áp dụng Look and Feel hệ thống để trông đẹp hơn trên Windows
        try {
            UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
        } catch (Exception e) {
            e.printStackTrace();
        }

        SwingUtilities.invokeLater(() -> new loginGUI());
    }
}
