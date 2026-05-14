package text;

import gui.LoginRegesterGUI.loginGUI;

import javax.swing.*;

/**
 * Entry point của ứng dụng - Mở màn hình đăng nhập.
 *
 * @author Trần Minh Quyền
 */
public class mainlogin {

    public static void main(String[] args) {
        // Áp dụng FlatLaf để hỗ trợ placeholderText, leadingIcon, roundRect...
        try {
            com.formdev.flatlaf.FlatLightLaf.setup();
        } catch (Exception e) {
            e.printStackTrace();
        }

        SwingUtilities.invokeLater(() -> new loginGUI());
    }
}
