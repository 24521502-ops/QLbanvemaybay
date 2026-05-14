package gui.DuLieuGocGUI;

import util.AppColor;

import javax.swing.*;
import javax.swing.plaf.basic.BasicTabbedPaneUI;

import java.awt.*;

/**
 * Panel "Dữ liệu gốc" - Quản lý các danh mục dữ liệu cốt lõi:
 * - Tab 1: Sân bay (AirportGUI)
 * - Tab 2: Hãng hàng không (AirlineGUI)
 * - Tab 3: Loại máy bay (AircraftGUI)
 */
public class DuLieuGocPanel extends JPanel {
    private JTabbedPane tabbedPane;

    public DuLieuGocPanel() {
        setLayout(new BorderLayout());
        setBackground(AppColor.BACKGROUND);
        initComponents();
    }

    private void initComponents() {
        // ===== HEADER =====
        JPanel headerPanel = new JPanel();
        headerPanel.setLayout(new BoxLayout(headerPanel, BoxLayout.Y_AXIS));
        headerPanel.setBackground(AppColor.BACKGROUND);
        headerPanel.setBorder(BorderFactory.createEmptyBorder(24, 28, 0, 28));

        JLabel lblTitle = new JLabel("Dữ liệu gốc");
        lblTitle.setFont(new Font("Segoe UI", Font.BOLD, 24));
        lblTitle.setForeground(AppColor.TEXT_PRIMARY);
        lblTitle.setAlignmentX(Component.LEFT_ALIGNMENT);

        JLabel lblDesc = new JLabel("Quản lý các danh mục dữ liệu cốt lõi của hệ thống.");
        lblDesc.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        lblDesc.setForeground(AppColor.TEXT_SECONDARY);
        lblDesc.setAlignmentX(Component.LEFT_ALIGNMENT);
        lblDesc.setBorder(BorderFactory.createEmptyBorder(4, 0, 16, 0));

        headerPanel.add(lblTitle);
        headerPanel.add(lblDesc);
        add(headerPanel, BorderLayout.NORTH);

        // ===== TABBED PANE =====
        tabbedPane = new JTabbedPane(JTabbedPane.TOP);
        tabbedPane.setFont(new Font("Segoe UI", Font.BOLD, 13));
        tabbedPane.setBackground(AppColor.BACKGROUND);
        tabbedPane.setForeground(AppColor.TEXT_SECONDARY);
        tabbedPane.setBorder(BorderFactory.createEmptyBorder(0, 28, 20, 28));

        // Custom UI cho tab đẹp
        tabbedPane.setUI(new BasicTabbedPaneUI() {
            private final Insets tabInsets = new Insets(10, 20, 10, 20);

            @Override
            protected Insets getTabInsets(int tabPlacement, int tabIndex) {
                return tabInsets;
            }

            @Override
            protected void paintTabBorder(Graphics g, int tabPlacement, int tabIndex,
                    int x, int y, int w, int h, boolean isSelected) {
                if (isSelected) {
                    Graphics2D g2 = (Graphics2D) g;
                    g2.setColor(AppColor.PRIMARY);
                    g2.fillRect(x, y + h - 3, w, 3);
                }
            }

            @Override
            protected void paintTabBackground(Graphics g, int tabPlacement, int tabIndex,
                    int x, int y, int w, int h, boolean isSelected) {
                g.setColor(AppColor.BACKGROUND);
                g.fillRect(x, y, w, h);
            }

            @Override
            protected void paintContentBorder(Graphics g, int tabPlacement, int selectedIndex) {
                // Không vẽ border mặc định
            }

            @Override
            protected void paintFocusIndicator(Graphics g, int tabPlacement, Rectangle[] rects,
                    int tabIndex, Rectangle iconRect, Rectangle textRect, boolean isSelected) {
                // Không vẽ focus indicator
            }

            @Override
            protected void paintText(Graphics g, int tabPlacement, Font font, FontMetrics metrics,
                    int tabIndex, String title, Rectangle textRect, boolean isSelected) {
                Graphics2D g2 = (Graphics2D) g;
                g2.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_LCD_HRGB);
                g2.setFont(font);
                g2.setColor(isSelected ? AppColor.PRIMARY : AppColor.TEXT_SECONDARY);
                g2.drawString(title, textRect.x, textRect.y + metrics.getAscent());
            }
        });

        // Thêm 3 tab
        tabbedPane.addTab("Sân bay", createTabPanel(new AirportGUI()));
        tabbedPane.addTab("Hãng hàng không", createTabPanel(new AirlineGUI()));
        tabbedPane.addTab("Loại máy bay", createTabPanel(new AircraftGUI()));

        add(tabbedPane, BorderLayout.CENTER);
    }

    private JPanel createTabPanel(JPanel content) {
        JPanel wrapper = new JPanel(new BorderLayout());
        wrapper.setBackground(AppColor.SURFACE);
        wrapper.setBorder(BorderFactory.createCompoundBorder(
                BorderFactory.createLineBorder(AppColor.BORDER, 1, true),
                BorderFactory.createEmptyBorder(0, 0, 0, 0)));
        wrapper.add(content, BorderLayout.CENTER);
        return wrapper;
    }

    /**
     * Test standalone - chạy trực tiếp panel này để kiểm tra giao diện
     */
    public static void main(String[] args) {
        try {
            UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
        } catch (Exception e) {
            e.printStackTrace();
        }

        SwingUtilities.invokeLater(() -> {
            JFrame frame = new JFrame("Dữ liệu gốc - Test");
            frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            frame.setSize(1000, 650);
            frame.setLocationRelativeTo(null);
            frame.add(new DuLieuGocPanel());
            frame.setVisible(true);
        });
    }
}
