package gui;

import net.miginfocom.swing.MigLayout;
import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

public class CustomerMainFrame extends JFrame {

    private JPanel contentPanel;
    private JPanel activeNavPanel;
    private dto.AccountDTO account;

    private static final Color BLUE = new Color(29, 78, 216);
    private static final Color TEXT_DARK = new Color(15, 23, 42);
    private static final Color TEXT_GRAY = new Color(71, 85, 105);
    private static final Color BORDER = new Color(226, 232, 240);
    private static final Color BG_CONTENT = new Color(248, 249, 255);
    private static final Color SECONDARY = new Color(0, 102, 138);

    public CustomerMainFrame(dto.AccountDTO account) {
        this.account = account;
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
        panel.setPreferredSize(new Dimension(330, 70));

        JLabel globe = createHeaderIcon("🌐");
        JLabel help = createHeaderIcon("❔");

        JPanel separatorWrapper = new JPanel(new GridBagLayout());
        separatorWrapper.setOpaque(false);
        separatorWrapper.setPreferredSize(new Dimension(12, 70));

        JPanel separator = new JPanel();
        separator.setPreferredSize(new Dimension(1, 24));
        separator.setBackground(BORDER);
        separatorWrapper.add(separator);

        String userName = (account != null && account.getUserName() != null) ? account.getUserName() : "Khách hàng";
        JLabel name = new JLabel(userName);
        name.setFont(new Font("Segoe UI", Font.BOLD, 14));
        name.setForeground(TEXT_DARK);
        name.setPreferredSize(new Dimension(100, 70));
        name.setVerticalAlignment(SwingConstants.CENTER);

        JLabel avatar = createAvatarLabel();

        panel.add(globe);
        panel.add(help);
        panel.add(separatorWrapper);
        panel.add(name);
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

    private JLabel createAvatarLabel() {
        JLabel avatar = new JLabel() {
            @Override
            protected void paintComponent(Graphics g) {
                super.paintComponent(g);

                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

                int size = 36;
                int x = 0;
                int y = 17;

                g2.setColor(new Color(0, 102, 138, 51));
                g2.fillOval(x, y, size, size);

                g2.setColor(Color.WHITE);
                g2.fillOval(x + 2, y + 2, size - 4, size - 4);

                g2.setColor(new Color(209, 213, 219));
                g2.fillOval(x + 2, y + 2, size - 4, size - 4);

                g2.setColor(TEXT_GRAY);
                g2.fillOval(x + 10, y + 8, 15, 15);
                g2.fillArc(x + 5, y + 24, 25, 20, 0, 180);

                g2.dispose();
            }
        };

        avatar.setPreferredSize(new Dimension(36, 70));
        avatar.setMinimumSize(new Dimension(36, 70));
        avatar.setMaximumSize(new Dimension(36, 70));

        return avatar;
    }

    private void handleNavClick(String menuName) {
        if (menuName.equals("Đặt vé")) {
            showPanel(new BookingHomePanel());
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