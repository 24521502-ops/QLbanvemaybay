package gui;

import com.formdev.flatlaf.FlatLightLaf;
import util.AppColor;

import javax.swing.*;
import javax.swing.border.*;
import java.awt.*;
import java.awt.event.*;
import java.awt.geom.*;

/**
 * MainFrame - Khung chính của ứng dụng Aviation Manager
 * Gồm: Sidebar (trái), TopBar (trên), ContentArea (giữa)
 */
public class MainFrame extends JFrame {

    private JPanel contentPanel;
    private JPanel sidebarPanel;
    private JButton selectedMenuButton;
    private String currentUser = "Admin";

    // Sidebar dimensions
    private static final int SIDEBAR_WIDTH = 220;
    private static final int TOPBAR_HEIGHT = 56;

    // Menu items config: {text, iconType}
    private static final String[][] MENU_ITEMS = {
        {"Chuyến bay", "flight"},
        {"Đặt chỗ", "booking"},
        {"Vé", "ticket"},
        {"Nhân viên", "employee"},
        {"Khách hàng", "customer"},
        {"Báo cáo", "report"},
        {"Phân quyền", "permission"},
        {"Dữ liệu gốc", "data"}
    };

    public MainFrame() {
        setTitle("Aviation Manager - SkyAdmin");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setMinimumSize(new Dimension(1100, 700));
        setSize(1280, 780);
        setLocationRelativeTo(null);
        setLayout(new BorderLayout(0, 0));

        initComponents();
    }

    private void initComponents() {
        // ===== SIDEBAR =====
        sidebarPanel = createSidebar();
        add(sidebarPanel, BorderLayout.WEST);

        // ===== RIGHT SIDE (TopBar + Content) =====
        JPanel rightPanel = new JPanel(new BorderLayout(0, 0));
        rightPanel.setBackground(AppColor.BACKGROUND);

        // Top Bar
        JPanel topBar = createTopBar();
        rightPanel.add(topBar, BorderLayout.NORTH);

        // Content Area
        contentPanel = new JPanel(new BorderLayout());
        contentPanel.setBackground(AppColor.BACKGROUND);
        contentPanel.setBorder(BorderFactory.createEmptyBorder(0, 0, 0, 0));
        rightPanel.add(contentPanel, BorderLayout.CENTER);

        add(rightPanel, BorderLayout.CENTER);
    }

    // ==================== SIDEBAR ====================
    private JPanel createSidebar() {
        JPanel sidebar = new JPanel(new BorderLayout(0, 0));
        sidebar.setPreferredSize(new Dimension(SIDEBAR_WIDTH, 0));
        sidebar.setBackground(AppColor.SIDEBAR_BG);

        // --- Logo Section ---
        JPanel logoPanel = new JPanel(new BorderLayout(12, 0));
        logoPanel.setOpaque(false);
        logoPanel.setBorder(BorderFactory.createEmptyBorder(20, 20, 16, 20));

        // Airplane icon
        JLabel lblIcon = new JLabel() {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                // Circle background
                g2.setColor(new Color(56, 189, 248)); // Sky 400
                g2.fillOval(0, 0, 40, 40);
                // Airplane icon
                g2.setColor(Color.WHITE);
                g2.setStroke(new BasicStroke(1.8f));
                int cx = 20, cy = 20;
                // Simple airplane shape
                GeneralPath plane = new GeneralPath();
                plane.moveTo(cx - 4, cy + 8);
                plane.lineTo(cx, cy - 10);
                plane.lineTo(cx + 4, cy + 8);
                plane.closePath();
                g2.fill(plane);
                // Wings
                g2.setStroke(new BasicStroke(2.5f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND));
                g2.drawLine(cx - 12, cy + 2, cx + 12, cy + 2);
                // Tail
                g2.drawLine(cx - 5, cy + 7, cx + 5, cy + 7);
                g2.dispose();
            }
        };
        lblIcon.setPreferredSize(new Dimension(40, 40));
        logoPanel.add(lblIcon, BorderLayout.WEST);

        JPanel logoTextPanel = new JPanel();
        logoTextPanel.setLayout(new BoxLayout(logoTextPanel, BoxLayout.Y_AXIS));
        logoTextPanel.setOpaque(false);

        JLabel lblTitle = new JLabel("SkyAdmin");
        lblTitle.setFont(new Font("Segoe UI", Font.BOLD, 16));
        lblTitle.setForeground(Color.WHITE);
        lblTitle.setAlignmentX(Component.LEFT_ALIGNMENT);
        logoTextPanel.add(lblTitle);

        JLabel lblSub = new JLabel("Aviation System");
        lblSub.setFont(new Font("Segoe UI", Font.PLAIN, 11));
        lblSub.setForeground(new Color(148, 163, 184)); // Slate 400
        lblSub.setAlignmentX(Component.LEFT_ALIGNMENT);
        logoTextPanel.add(lblSub);

        logoPanel.add(logoTextPanel, BorderLayout.CENTER);
        sidebar.add(logoPanel, BorderLayout.NORTH);

        // --- Menu Section ---
        JPanel menuWrapper = new JPanel(new BorderLayout(0, 0));
        menuWrapper.setOpaque(false);

        JPanel menuPanel = new JPanel();
        menuPanel.setLayout(new BoxLayout(menuPanel, BoxLayout.Y_AXIS));
        menuPanel.setOpaque(false);
        menuPanel.setBorder(BorderFactory.createEmptyBorder(4, 12, 4, 12));

        // Menu items
        for (String[] item : MENU_ITEMS) {
            JButton btn = createMenuButton(item[0], item[1]);
            menuPanel.add(btn);
            menuPanel.add(Box.createVerticalStrut(2));
        }

        menuWrapper.add(menuPanel, BorderLayout.NORTH);
        sidebar.add(menuWrapper, BorderLayout.CENTER);

        // --- Bottom Section (Settings + Logout) ---
        JPanel bottomPanel = new JPanel();
        bottomPanel.setLayout(new BoxLayout(bottomPanel, BoxLayout.Y_AXIS));
        bottomPanel.setOpaque(false);
        bottomPanel.setBorder(BorderFactory.createEmptyBorder(8, 12, 16, 12));

        // Separator
        JSeparator sep = new JSeparator();
        sep.setForeground(new Color(51, 65, 85)); // Slate 700
        sep.setMaximumSize(new Dimension(Integer.MAX_VALUE, 1));
        sep.setAlignmentX(Component.LEFT_ALIGNMENT);
        bottomPanel.add(sep);
        bottomPanel.add(Box.createVerticalStrut(8));

        JButton btnSettings = createMenuButton("Settings", "settings");
        bottomPanel.add(btnSettings);
        bottomPanel.add(Box.createVerticalStrut(2));

        JButton btnLogout = createMenuButton("Logout", "logout");
        bottomPanel.add(btnLogout);

        sidebar.add(bottomPanel, BorderLayout.SOUTH);

        // Select "Báo cáo" by default
        selectDefaultMenu(menuPanel);

        return sidebar;
    }

    private void selectDefaultMenu(JPanel menuPanel) {
        for (Component c : menuPanel.getComponents()) {
            if (c instanceof JButton btn) {
                if ("Báo cáo".equals(btn.getText().trim())) {
                    setSelectedButton(btn);
                    break;
                }
            }
        }
    }

    // ==================== TOP BAR ====================
    private JPanel createTopBar() {
        JPanel topBar = new JPanel(new BorderLayout(0, 0));
        topBar.setPreferredSize(new Dimension(0, TOPBAR_HEIGHT));
        topBar.setBackground(AppColor.SURFACE);
        topBar.setBorder(BorderFactory.createCompoundBorder(
            BorderFactory.createMatteBorder(0, 0, 1, 0, AppColor.BORDER),
            BorderFactory.createEmptyBorder(0, 24, 0, 24)
        ));

        // Left: Title
        JLabel lblAppTitle = new JLabel("Aviation Manager");
        lblAppTitle.setFont(new Font("Segoe UI", Font.BOLD, 16));
        lblAppTitle.setForeground(AppColor.TEXT_PRIMARY);
        topBar.add(lblAppTitle, BorderLayout.WEST);

        // Center: Search bar
        JPanel searchPanel = new JPanel(new FlowLayout(FlowLayout.CENTER, 0, 0));
        searchPanel.setOpaque(false);
        searchPanel.setBorder(BorderFactory.createEmptyBorder(10, 0, 10, 0));

        JTextField txtSearch = new JTextField() {
            @Override
            protected void paintComponent(Graphics g) {
                super.paintComponent(g);
                if (getText().isEmpty()) {
                    Graphics2D g2 = (Graphics2D) g.create();
                    g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                    // Search icon
                    g2.setColor(new Color(156, 163, 175));
                    g2.setStroke(new BasicStroke(1.5f));
                    g2.drawOval(12, 10, 12, 12);
                    g2.drawLine(22, 20, 26, 24);
                    // Placeholder text
                    g2.setFont(new Font("Segoe UI", Font.PLAIN, 13));
                    g2.drawString("Search system...", 34, 21);
                    g2.dispose();
                }
            }
        };
        txtSearch.setPreferredSize(new Dimension(300, 36));
        txtSearch.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        txtSearch.setBorder(BorderFactory.createCompoundBorder(
            BorderFactory.createLineBorder(AppColor.BORDER, 1, true),
            BorderFactory.createEmptyBorder(4, 34, 4, 12)
        ));
        txtSearch.setBackground(new Color(249, 250, 251)); // Gray 50
        searchPanel.add(txtSearch);
        topBar.add(searchPanel, BorderLayout.CENTER);

        // Right: Icons
        JPanel iconsPanel = new JPanel(new FlowLayout(FlowLayout.RIGHT, 12, 0));
        iconsPanel.setOpaque(false);
        iconsPanel.setBorder(BorderFactory.createEmptyBorder(10, 0, 10, 0));

        iconsPanel.add(createTopBarIcon("bell"));
        iconsPanel.add(createTopBarIcon("help"));
        iconsPanel.add(createAvatarButton());

        topBar.add(iconsPanel, BorderLayout.EAST);

        return topBar;
    }

    // ==================== COMPONENT FACTORIES ====================

    private JButton createMenuButton(String text, String iconType) {
        JButton btn = new JButton(text) {
            private boolean isHovered = false;

            {
                addMouseListener(new MouseAdapter() {
                    @Override
                    public void mouseEntered(MouseEvent e) { isHovered = true; repaint(); }
                    @Override
                    public void mouseExited(MouseEvent e) { isHovered = false; repaint(); }
                });
            }

            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

                boolean isSelected = (MainFrame.this.selectedMenuButton == this);

                // Background
                if (isSelected) {
                    g2.setColor(AppColor.SIDEBAR_ACTIVE);
                    g2.fill(new RoundRectangle2D.Double(0, 0, getWidth(), getHeight(), 8, 8));
                } else if (isHovered) {
                    g2.setColor(AppColor.SIDEBAR_HOVER);
                    g2.fill(new RoundRectangle2D.Double(0, 0, getWidth(), getHeight(), 8, 8));
                }

                // Icon
                g2.setColor(isSelected ? Color.WHITE : new Color(148, 163, 184));
                drawMenuIcon(g2, iconType, 14, (getHeight() - 18) / 2, 18);

                // Text
                g2.setColor(isSelected ? Color.WHITE : new Color(203, 213, 225));
                g2.setFont(getFont());
                FontMetrics fm = g2.getFontMetrics();
                g2.drawString(getText(), 44, (getHeight() - fm.getHeight()) / 2 + fm.getAscent());

                g2.dispose();
            }
        };
        btn.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        btn.setMaximumSize(new Dimension(Integer.MAX_VALUE, 42));
        btn.setPreferredSize(new Dimension(SIDEBAR_WIDTH - 24, 42));
        btn.setContentAreaFilled(false);
        btn.setBorderPainted(false);
        btn.setFocusPainted(false);
        btn.setHorizontalAlignment(SwingConstants.LEFT);
        btn.setAlignmentX(Component.LEFT_ALIGNMENT);
        btn.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));

        btn.addActionListener(e -> {
            setSelectedButton(btn);
            onMenuClicked(text);
        });

        return btn;
    }

    private void setSelectedButton(JButton btn) {
        if (selectedMenuButton != null) selectedMenuButton.repaint();
        selectedMenuButton = btn;
        btn.repaint();
    }

    private JButton createTopBarIcon(String type) {
        JButton btn = new JButton() {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(AppColor.TEXT_SECONDARY);
                int cx = getWidth() / 2, cy = getHeight() / 2;
                g2.setStroke(new BasicStroke(1.5f));
                if ("bell".equals(type)) {
                    // Bell shape
                    g2.drawArc(cx - 7, cy - 8, 14, 14, 0, 180);
                    g2.drawLine(cx - 7, cy - 1, cx - 9, cy + 5);
                    g2.drawLine(cx + 7, cy - 1, cx + 9, cy + 5);
                    g2.drawLine(cx - 9, cy + 5, cx + 9, cy + 5);
                    g2.fillOval(cx - 2, cy + 6, 4, 3);
                } else if ("help".equals(type)) {
                    g2.drawOval(cx - 9, cy - 9, 18, 18);
                    g2.setFont(new Font("Segoe UI", Font.BOLD, 13));
                    FontMetrics fm = g2.getFontMetrics();
                    g2.drawString("?", cx - fm.stringWidth("?") / 2, cy + fm.getAscent() / 2 - 1);
                }
                g2.dispose();
            }
        };
        btn.setPreferredSize(new Dimension(36, 36));
        btn.setContentAreaFilled(false);
        btn.setBorderPainted(false);
        btn.setFocusPainted(false);
        btn.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        return btn;
    }

    private JButton createAvatarButton() {
        JButton btn = new JButton() {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                // Circle bg
                g2.setColor(new Color(59, 130, 246)); // Blue 500
                g2.fillOval(2, 2, 32, 32);
                // User icon
                g2.setColor(Color.WHITE);
                g2.fillOval(13, 8, 10, 10);
                g2.fillArc(8, 20, 20, 16, 0, 180);
                g2.dispose();
            }
        };
        btn.setPreferredSize(new Dimension(36, 36));
        btn.setContentAreaFilled(false);
        btn.setBorderPainted(false);
        btn.setFocusPainted(false);
        btn.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        return btn;
    }

    // ==================== MENU ICON DRAWING ====================
    private void drawMenuIcon(Graphics2D g2, String type, int x, int y, int size) {
        g2.setStroke(new BasicStroke(1.5f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND));
        int cx = x + size / 2;
        int cy = y + size / 2;

        switch (type) {
            case "flight" -> {
                // Airplane
                GeneralPath p = new GeneralPath();
                p.moveTo(cx - 2, cy + 6);
                p.lineTo(cx, cy - 7);
                p.lineTo(cx + 2, cy + 6);
                p.closePath();
                g2.fill(p);
                g2.drawLine(cx - 8, cy, cx + 8, cy);
                g2.drawLine(cx - 4, cy + 5, cx + 4, cy + 5);
            }
            case "booking" -> {
                // Calendar
                g2.drawRoundRect(x + 2, y + 3, size - 4, size - 5, 3, 3);
                g2.drawLine(x + 2, y + 7, x + size - 2, y + 7);
                g2.drawLine(x + 6, y + 1, x + 6, y + 5);
                g2.drawLine(x + 12, y + 1, x + 12, y + 5);
            }
            case "ticket" -> {
                // Ticket
                g2.drawRoundRect(x + 1, y + 4, size - 2, size - 8, 3, 3);
                g2.drawLine(x + 6, y + 4, x + 6, y + size - 4);
                g2.fillRect(x + 9, y + 7, 5, 2);
                g2.fillRect(x + 9, y + 11, 4, 2);
            }
            case "employee" -> {
                // Person
                g2.drawOval(cx - 4, y + 1, 8, 8);
                g2.drawArc(cx - 7, y + 9, 14, 10, 0, 180);
            }
            case "customer" -> {
                // People
                g2.drawOval(cx - 6, y + 1, 7, 7);
                g2.drawArc(cx - 9, y + 8, 12, 8, 0, 180);
                g2.drawOval(cx + 1, y + 2, 6, 6);
                g2.drawArc(cx - 1, y + 9, 10, 7, 0, 180);
            }
            case "report" -> {
                // Chart
                g2.drawRect(x + 1, y + 1, size - 2, size - 2);
                g2.fillRect(x + 4, y + 10, 3, 6);
                g2.fillRect(x + 8, y + 6, 3, 10);
                g2.fillRect(x + 12, y + 3, 3, 13);
            }
            case "permission" -> {
                // Key/Lock
                g2.drawOval(cx - 5, y + 1, 10, 9);
                g2.drawLine(cx, y + 10, cx, y + size - 1);
                g2.drawLine(cx, y + 13, cx + 3, y + 13);
            }
            case "data" -> {
                // Database
                g2.drawOval(x + 2, y + 1, size - 4, 6);
                g2.drawLine(x + 2, y + 4, x + 2, y + size - 4);
                g2.drawLine(x + size - 2, y + 4, x + size - 2, y + size - 4);
                g2.drawArc(x + 2, y + size - 7, size - 4, 6, 180, 180);
                g2.drawArc(x + 2, y + 6, size - 4, 6, 180, 180);
            }
            case "settings" -> {
                // Gear
                g2.drawOval(cx - 4, cy - 4, 8, 8);
                for (int i = 0; i < 6; i++) {
                    double angle = Math.toRadians(i * 60);
                    int sx = (int) (cx + 7 * Math.cos(angle));
                    int sy = (int) (cy + 7 * Math.sin(angle));
                    g2.fillOval(sx - 2, sy - 2, 4, 4);
                }
            }
            case "logout" -> {
                // Door with arrow
                g2.drawRect(x + 2, y + 1, 9, size - 2);
                g2.drawLine(x + 11, cy, x + size - 1, cy);
                g2.drawLine(x + size - 4, cy - 3, x + size - 1, cy);
                g2.drawLine(x + size - 4, cy + 3, x + size - 1, cy);
            }
        }
    }

    // ==================== NAVIGATION ====================

    /**
     * Xử lý khi người dùng nhấn vào menu sidebar.
     * Gọi setContentPanel() để đổi panel ở giữa.
     */
    private void onMenuClicked(String menuText) {
        // Placeholder - sẽ được kết nối với các Panel thực tế sau
        System.out.println("Menu clicked: " + menuText);
    }

    /**
     * Đặt panel nội dung ở giữa.
     * Gọi method này để chuyển đổi giữa các module.
     */
    public void setContentPanel(JPanel panel) {
        contentPanel.removeAll();
        contentPanel.add(panel, BorderLayout.CENTER);
        contentPanel.revalidate();
        contentPanel.repaint();
    }

    /**
     * Lấy panel nội dung hiện tại
     */
    public JPanel getContentPanel() {
        return contentPanel;
    }

    // ==================== MAIN (for testing) ====================
    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            try {
                UIManager.setLookAndFeel(new FlatLightLaf());
            } catch (Exception e) {
                e.printStackTrace();
            }
            MainFrame frame = new MainFrame();
            frame.setVisible(true);
        });
    }
}
