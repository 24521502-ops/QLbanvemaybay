package test;

import com.formdev.flatlaf.FlatLightLaf;

import gui.QuanLyPhanQuyenGUI.PhanQuyenGUI;

import javax.swing.*;
import java.awt.*;

/**
 * Main test class để chạy thử giao diện Phân quyền (Vai trò & Quyền hạn).
 * Chạy file này trực tiếp để xem giao diện.
 */
public class MainTestPhanQuyen {
    public static void main(String[] args) {
        // Cài đặt FlatLaf Look and Feel
        try {
            UIManager.setLookAndFeel(new FlatLightLaf());
            UIManager.put("Button.arc", 8);
            UIManager.put("TextComponent.arc", 8);
            UIManager.put("ScrollBar.width", 8);
            UIManager.put("ScrollBar.thumbArc", 999);
            UIManager.put("ScrollBar.thumbInsets", new Insets(2, 2, 2, 2));
        } catch (Exception e) {
            e.printStackTrace();
        }

        SwingUtilities.invokeLater(() -> {
            JFrame frame = new JFrame("SkyManage - Quản lý Phân quyền");
            frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            frame.setSize(950, 650);
            frame.setMinimumSize(new Dimension(800, 500));
            frame.setLocationRelativeTo(null);

            // Thêm panel PhanQuyenGUI
            PhanQuyenGUI panel = new PhanQuyenGUI();
            frame.setContentPane(panel);

            frame.setVisible(true);
        });
    }
}
