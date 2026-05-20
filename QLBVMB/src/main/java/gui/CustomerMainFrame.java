package gui;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import dto.CustomerDTO;
import dao.QuanLyKhachHangDAO.ProfileDAO;

public class CustomerMainFrame extends JFrame {

    private JPanel contentPanel;
    private JPanel activeNavPanel;
    private dto.AccountDTO account;
    private final java.util.Map<String, JPanel> navItems = new java.util.HashMap<>();

    private CustomerDTO customer;
    private JLabel lblHeaderUserName;
    private JPanel headerAvatarPanel;
    private String headerInitials = "?";

    private static final Color BLUE = new Color(29, 78, 216);
    private static final Color TEXT_DARK = new Color(15, 23, 42);
    private static final Color TEXT_GRAY = new Color(71, 85, 105);
    private static final Color BORDER = new Color(226, 232, 240);
    private static final Color BG_CONTENT = new Color(248, 249, 255);

    public CustomerMainFrame(dto.AccountDTO account) {
        this.account = account;
        if (account != null && account.getCustomerID() != null) {
            try {
                this.customer = new ProfileDAO().getProfileByCustomerID(account.getCustomerID());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        setTitle("TIU AIRLINES - Đặt vé máy bay");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(1280, 800);
        setMinimumSize(new Dimension(1100, 700));
        setLocationRelativeTo(null);
        setLayout(new BorderLayout());

        add(createHeader(), BorderLayout.NORTH);

        contentPanel = new JPanel(new BorderLayout());
        contentPanel.setBackground(BG_CONTENT);
        add(contentPanel, BorderLayout.CENTER);

        showPanel(new BookingHomePanel());
    }

    private JPanel createHeader() {
        JPanel header = new JPanel(new BorderLayout());
        header.setBackground(Color.WHITE);

        header.setPreferredSize(new Dimension(1280, 70));
        header.setMinimumSize(new Dimension(0, 70));
        header.setMaximumSize(new Dimension(Integer.MAX_VALUE, 70));

        header.setBorder(BorderFactory.createCompoundBorder(
                BorderFactory.createMatteBorder(0, 0, 1, 0, BORDER),
                new EmptyBorder(0, 35, 0, 35)));

        header.add(createLogoPanel(), BorderLayout.WEST);
        header.add(createNavPanel(), BorderLayout.CENTER);
        header.add(createUserPanel(), BorderLayout.EAST);

        return header;
    }

    private JPanel createLogoPanel() {
        JPanel panel = new JPanel(new GridBagLayout());
        panel.setOpaque(false);
        panel.setPreferredSize(new Dimension(280, 70));

        GridBagConstraints gbc = new GridBagConstraints();
        gbc.gridx = 0;
        gbc.gridy = 0;
        gbc.weighty = 1.0;
        gbc.anchor = GridBagConstraints.CENTER;
        gbc.insets = new Insets(0, 0, 0, 12);

        JLabel icon = new JLabel("🛫"); // Sử dụng emoji cất cánh cao cấp đồng bộ
        icon.setFont(new Font("Segoe UI Emoji", Font.PLAIN, 28));
        // Đệm lề các góc để bảo vệ cánh máy bay hoàn toàn
        icon.setBorder(BorderFactory.createEmptyBorder(8, 8, 8, 8));
        panel.add(icon, gbc);

        gbc.gridx = 1;
        gbc.insets = new Insets(0, 0, 0, 0);
        JLabel text = new JLabel("TIU AIRLINES");
        text.setFont(new Font("Segoe UI", Font.BOLD, 22));
        text.setForeground(TEXT_DARK);
        panel.add(text, gbc);

        return panel;
    }

    private JPanel createNavPanel() {
        JPanel wrapper = new JPanel(new GridBagLayout());
        wrapper.setOpaque(false);

        JPanel nav = new JPanel(new FlowLayout(FlowLayout.CENTER, 38, 0));
        nav.setOpaque(false);

        nav.add(createNavItem("Đặt vé", true));
        nav.add(createNavItem("Chuyến bay của tôi", false));
        nav.add(createNavItem("Lịch sử vé", false));

        wrapper.add(nav);

        return wrapper;
    }

    private JPanel createNavItem(String text, boolean active) {
        JPanel item = new JPanel(new BorderLayout());
        item.setOpaque(false);
        item.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));

        int width = getNavWidth(text);

        item.setPreferredSize(new Dimension(width, 70));
        item.setMinimumSize(new Dimension(width, 70));
        item.setMaximumSize(new Dimension(width, 70));

        JLabel label = new JLabel(text, SwingConstants.CENTER);
        label.setFont(new Font("Segoe UI", active ? Font.BOLD : Font.PLAIN, 14));
        label.setForeground(active ? BLUE : TEXT_GRAY);
        label.setVerticalAlignment(SwingConstants.CENTER);

        JPanel underline = new JPanel();
        underline.setPreferredSize(new Dimension(width, 3));
        underline.setBackground(active ? BLUE : Color.WHITE);

        item.add(label, BorderLayout.CENTER);
        item.add(underline, BorderLayout.SOUTH);

        navItems.put(text, item);
        if (active) {
            activeNavPanel = item;
        }

        item.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                updateNavStyle(item);
                handleNavClick(text);
            }

            @Override
            public void mouseEntered(MouseEvent e) {
                if (item != activeNavPanel) {
                    JLabel label = (JLabel) item.getComponent(0);
                    label.setForeground(BLUE);
                }
            }

            @Override
            public void mouseExited(MouseEvent e) {
                if (item != activeNavPanel) {
                    JLabel label = (JLabel) item.getComponent(0);
                    label.setForeground(TEXT_GRAY);
                }
            }
        });

        return item;
    }

    private int getNavWidth(String text) {
        switch (text) {
            case "Chuyến bay của tôi":
                return 155;
            case "Lịch sử vé":
                return 105;
            case "Đặt vé":
                return 80;
            default:
                return 100;
        }
    }

    private void updateNavStyle(JPanel clickedItem) {
        if (activeNavPanel != null) {
            JLabel oldLabel = (JLabel) activeNavPanel.getComponent(0);
            JPanel oldUnderline = (JPanel) activeNavPanel.getComponent(1);

            oldLabel.setFont(new Font("Segoe UI", Font.PLAIN, 14));
            oldLabel.setForeground(TEXT_GRAY);
            oldUnderline.setBackground(Color.WHITE);

            activeNavPanel.revalidate();
            activeNavPanel.repaint();
        }

        activeNavPanel = clickedItem;

        JLabel newLabel = (JLabel) activeNavPanel.getComponent(0);
        JPanel newUnderline = (JPanel) activeNavPanel.getComponent(1);

        newLabel.setFont(new Font("Segoe UI", Font.BOLD, 14));
        newLabel.setForeground(BLUE);
        newUnderline.setBackground(BLUE);

        activeNavPanel.revalidate();
        activeNavPanel.repaint();
    }

    private JPanel createUserPanel() {
        JPanel panel = new JPanel(new FlowLayout(FlowLayout.RIGHT, 14, 0));
        panel.setOpaque(false);
        panel.setPreferredSize(new Dimension(370, 70));

        JLabel globe = createHeaderIcon("🌐");
        JLabel help = createHeaderIcon("❔");

        JPanel separatorWrapper = new JPanel(new GridBagLayout());
        separatorWrapper.setOpaque(false);
        separatorWrapper.setPreferredSize(new Dimension(12, 70));

        JPanel separator = new JPanel();
        separator.setPreferredSize(new Dimension(1, 24));
        separator.setBackground(BORDER);
        separatorWrapper.add(separator);

        String displayName = "Khách hàng";
        if (customer != null && customer.getFullName() != null && !customer.getFullName().isBlank()) {
            displayName = customer.getFullName();
        } else if (account != null && account.getUserName() != null) {
            displayName = account.getUserName();
        }

        lblHeaderUserName = new JLabel(displayName);
        lblHeaderUserName.setFont(new Font("Segoe UI", Font.BOLD, 14));
        lblHeaderUserName.setForeground(TEXT_DARK);
        lblHeaderUserName.setPreferredSize(new Dimension(140, 70));
        lblHeaderUserName.setVerticalAlignment(SwingConstants.CENTER);

        JPanel avatar = createAvatarLabel();

        panel.add(globe);
        panel.add(help);
        panel.add(separatorWrapper);
        panel.add(lblHeaderUserName);
        panel.add(avatar);

        return panel;
    }

    private JLabel createHeaderIcon(String iconText) {
        JLabel label = new JLabel(iconText, SwingConstants.CENTER);
        label.setFont(new Font("Segoe UI Emoji", Font.PLAIN, 18));
        label.setForeground(TEXT_GRAY);
        label.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        label.setPreferredSize(new Dimension(28, 70));
        label.setVerticalAlignment(SwingConstants.CENTER);
        return label;
    }

    private JPanel createAvatarLabel() {
        String displayName = "Khách hàng";
        if (customer != null && customer.getFullName() != null && !customer.getFullName().isBlank()) {
            displayName = customer.getFullName();
        } else if (account != null && account.getUserName() != null) {
            displayName = account.getUserName();
        }
        headerInitials = getInitials(displayName);

        headerAvatarPanel = new JPanel() {
            @Override
            protected void paintComponent(Graphics g) {
                super.paintComponent(g);
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                int size = 36 - 2; // Subtract 2 to prevent clipping of the border
                int x = (getWidth() - size) / 2;
                int y = (getHeight() - size) / 2;

                // Gradient nền sky sang trọng khớp 100% với ProfilePanel
                GradientPaint gp = new GradientPaint(x, y, new Color(186, 230, 253),
                        x + size, y + size, new Color(147, 197, 253));
                g2.setPaint(gp);
                g2.fillOval(x, y, size, size);

                // Viền
                g2.setColor(new Color(0, 102, 138));
                g2.setStroke(new BasicStroke(1.2f));
                g2.drawOval(x, y, size, size);

                // Initials
                g2.setColor(new Color(0, 102, 138));
                g2.setFont(new Font("Segoe UI", Font.BOLD, 14));
                FontMetrics fm = g2.getFontMetrics();
                int tx = x + (size - fm.stringWidth(headerInitials)) / 2;
                int ty = y + (size + fm.getAscent()) / 2 - 2; // Visually perfectly centered vertically for capitals
                g2.drawString(headerInitials, tx, ty);
                g2.dispose();
            }
        };

        headerAvatarPanel.setOpaque(false);
        headerAvatarPanel.setPreferredSize(new Dimension(36, 70));
        headerAvatarPanel.setMinimumSize(new Dimension(36, 70));
        headerAvatarPanel.setMaximumSize(new Dimension(36, 70));
        headerAvatarPanel.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        headerAvatarPanel.setToolTipText("Hồ sơ cá nhân");

        headerAvatarPanel.addMouseListener(new java.awt.event.MouseAdapter() {
            @Override
            public void mouseClicked(java.awt.event.MouseEvent e) {
                try {
                    showPanel(new ProfilePanel(account));
                } catch (Exception ex) {
                    ex.printStackTrace();
                    JOptionPane.showMessageDialog(null, "Lỗi mở hồ sơ: " + ex.getMessage());
                }
            }
        });

        return headerAvatarPanel;
    }

    private String getInitials(String name) {
        if (name == null || name.isBlank())
            return "?";
        String[] p = name.trim().split("\\s+");
        return p.length >= 2
                ? (p[0].substring(0, 1) + p[p.length - 1].substring(0, 1)).toUpperCase()
                : p[0].substring(0, 1).toUpperCase();
    }

    public void updateHeaderUserInfo(String newFullName) {
        if (lblHeaderUserName != null) {
            lblHeaderUserName.setText(newFullName);
        }
        headerInitials = getInitials(newFullName);
        if (headerAvatarPanel != null) {
            headerAvatarPanel.repaint();
        }
    }

    private void handleNavClick(String menuName) {
        if (menuName.equals("Đặt vé")) {
            showPanel(new BookingHomePanel());
        } else if (menuName.equals("Chuyến bay của tôi")) {
            showPanel(new MyFlightPanel(account));
        } else if (menuName.equals("Lịch sử vé")) {
            showPanel(new FlightHistoryPanel(account));
        } else {
            JPanel placeholder = new JPanel(new GridBagLayout());
            placeholder.setBackground(BG_CONTENT);

            JLabel label = new JLabel(menuName);
            label.setFont(new Font("Segoe UI", Font.BOLD, 32));
            label.setForeground(TEXT_DARK);

            placeholder.add(label);
            showPanel(placeholder);
        }
    }

    public void showPanel(JPanel panel) {
        contentPanel.removeAll();
        contentPanel.add(panel, BorderLayout.CENTER);
        contentPanel.revalidate();
        contentPanel.repaint();
    }

    public dto.AccountDTO getAccount() {
        return account;
    }

    /**
     * Chuyển sang một tab bất kỳ đúng cách (cập nhật cả nav highlight lẫn nội dung)
     */
    public void navigateTo(String menuName) {
        JPanel navItem = navItems.get(menuName);
        if (navItem != null) {
            updateNavStyle(navItem);
        }
        handleNavClick(menuName);
    }

    /** Chuyển sang tab "Lịch sử vé" đúng cách */
    public void navigateToHistory() {
        navigateTo("Lịch sử vé");
    }

    public static void main(String[] args) {
        try {
            com.formdev.flatlaf.FlatIntelliJLaf.setup();
        } catch (Exception ignored) {
            try {
                UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        SwingUtilities.invokeLater(() -> new CustomerMainFrame(null).setVisible(true));
    }
}