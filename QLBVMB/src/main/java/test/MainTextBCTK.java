package text;

import javax.swing.*;

import gui.BaoCaoThongKeGUI.BaoCaoTKGUI;

public class MainTextBCTK {
    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            JFrame frame = new JFrame("Báo cáo & Thống kê - QLBVMB");
            frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            frame.setSize(1100, 680);
            frame.setLocationRelativeTo(null);
            frame.setContentPane(new BaoCaoTKGUI());
            frame.setVisible(true);
        });
    }
}
