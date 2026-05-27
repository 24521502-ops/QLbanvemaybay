package test;

import com.formdev.flatlaf.FlatLightLaf;

import gui.QuanLyNhanVienGUI.EmployeePanel;

import javax.swing.*;

/**
 * Main test class để chạy thử giao diện quản lý Nhân viên
 */
public class MainTestNV {

    public static void main(String[] args) {
        // Cài đặt FlatLaf Look and Feel
        try {
            FlatLightLaf.setup();
            UIManager.put("Button.arc", 8);
            UIManager.put("Component.arc", 8);
            UIManager.put("TextComponent.arc", 8);
            UIManager.put("ScrollBar.thumbArc", 999);
            UIManager.put("ScrollBar.width", 8);
        } catch (Exception e) {
            e.printStackTrace();
        }

        SwingUtilities.invokeLater(() -> {
            JFrame frame = new JFrame("Quản lý Nhân viên - SkyControl");
            frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            frame.setSize(950, 650);
            frame.setLocationRelativeTo(null);

            // Thêm EmployeePanel vào frame
            EmployeePanel employeePanel = new EmployeePanel();
            frame.setContentPane(employeePanel);

            frame.setVisible(true);
        });
    }
}
