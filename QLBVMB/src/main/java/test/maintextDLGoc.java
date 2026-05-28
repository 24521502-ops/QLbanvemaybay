package test;

import javax.swing.*;

import gui.DuLieuGocGUI.DuLieuGocPanel;

import java.awt.*;

public class maintextDLGoc {
    public static void main(String[] args) {
        System.out.println("=== KHỞI ĐỘNG HỆ THỐNG ===");

        // Thử cài đặt giao diện đẹp (FlatLaf) bằng Reflection để không lỗi nếu thiếu
        // lib
        try {
            System.out.println("Đang cấu hình giao diện...");
            UIManager.setLookAndFeel("com.formdev.flatlaf.FlatLightLaf");
            UIManager.put("Button.arc", 8);
            UIManager.put("Component.arc", 8);
            UIManager.put("TextComponent.arc", 8);
            System.out.println("Cấu hình FlatLaf thành công.");
        } catch (Throwable t) {
            System.out.println("Không dùng được FlatLaf, chuyển sang giao diện hệ thống: " + t.getMessage());
            try {
                UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        SwingUtilities.invokeLater(() -> {
            try {
                System.out.println("Đang khởi tạo Frame...");
                JFrame frame = new JFrame("Quản lý bán vé máy bay - Dữ liệu gốc");
                frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
                frame.setSize(1100, 700);
                frame.setMinimumSize(new Dimension(900, 550));
                frame.setLocationRelativeTo(null);

                System.out.println("Đang nạp DuLieuGocPanel...");
                DuLieuGocPanel panel = new DuLieuGocPanel();
                frame.add(panel);

                System.out.println("Đang hiển thị Frame...");
                frame.setVisible(true);
                System.out.println("Giao diện đã hiển thị thành công.");
            } catch (Throwable t) {
                System.err.println("LỖI NGHIÊM TRỌNG:");
                t.printStackTrace();
                JOptionPane.showMessageDialog(null, "Lỗi: " + t.toString(), "Lỗi Hệ Thống", JOptionPane.ERROR_MESSAGE);
            }
        });
    }
}
