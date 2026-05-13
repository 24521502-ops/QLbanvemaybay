package gui;

import dto.AccountDTO;
import javax.swing.*;
import java.awt.*;

/**
 * Giao diện chính của hệ thống - SkyManage.
 * Sau khi đăng nhập thành công, người dùng sẽ được chuyển đến đây.
 */
public class MainGUI extends JFrame {
    private AccountDTO currentAccount;

    public MainGUI(AccountDTO account) {
        this.currentAccount = account;
        initFrame();
        initComponents();
        setVisible(true);
    }

    private void initFrame() {
        setTitle("Hệ thống Quản lý Vé Máy Bay - TIU AIRLINES");
        setSize(1200, 800);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        setLayout(new BorderLayout());
    }

    private void initComponents() {
        // Thanh trạng thái phía trên
        JPanel topPanel = new JPanel(new BorderLayout());
        topPanel.setBackground(new Color(0x1C2833));
        topPanel.setPreferredSize(new Dimension(getWidth(), 60));
        topPanel.setBorder(BorderFactory.createEmptyBorder(0, 20, 0, 20));

        JLabel lblWelcome = new JLabel("Chào mừng, " + currentAccount.getUserName());
        lblWelcome.setForeground(Color.WHITE);
        lblWelcome.setFont(new Font("Segoe UI", Font.BOLD, 16));
        topPanel.add(lblWelcome, BorderLayout.WEST);

        JButton btnLogout = new JButton("Đăng xuất");
        btnLogout.setFocusPainted(false);
        btnLogout.addActionListener(e -> {
            new loginGUI();
            dispose();
        });
        topPanel.add(btnLogout, BorderLayout.EAST);

        add(topPanel, BorderLayout.NORTH);

        // Nội dung chính (Hiện tại là màn hình chào mừng)
        JPanel contentPanel = new JPanel(new GridBagLayout());
        contentPanel.setBackground(Color.WHITE);
        JLabel lblHero = new JLabel("Chào mừng đến với hệ thống TIU AIRLINES");
        lblHero.setFont(new Font("Segoe UI", Font.BOLD, 24));
        lblHero.setForeground(new Color(0x2E86C1));
        contentPanel.add(lblHero);

        add(contentPanel, BorderLayout.CENTER);
    }
}
