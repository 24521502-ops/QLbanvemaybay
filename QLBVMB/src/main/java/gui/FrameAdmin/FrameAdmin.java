package gui.FrameAdmin;

import com.formdev.flatlaf.FlatLightLaf;
import util.AppColor;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.awt.geom.*;

import gui.BaoCaoThongKeGUI.BaoCaoTKGUI;
import gui.DuLieuGocGUI.DuLieuGocPanel;
import gui.QuanLyChuyenBayGUI.QuanLyChuyenBayPanel;
import gui.QuanLyDatChoGUI.QuanLyDatChoPanel;
import gui.QuanLyKhachHangGUI.QuanLyKhachHangPanel;
import gui.QuanLyNhanVienGUI.EmployeePanel;
import gui.QuanLyVeGUI.QuanLyVePanel;
import dto.AccountDTO;

import bus.FrameAdminBUS.FrameAdminBUS;
import dto.NotificationDTO;
import dto.SearchResultDTO;
import java.util.List;

/**
 * FrameAdmin - Khung chính của ứng dụng Aviation Manager
 * Gồm: Sidebar (trái), TopBar (trên), ContentArea (giữa)
 */

public class FrameAdmin extends JFrame {

    private JPanel contentPanel;
    private JPanel sidebarPanel;
    private JButton selectedMenuButton;
    private AccountDTO currentAccount;

    // Các module (Khởi tạo Lazy để tăng tốc khởi động)
    private QuanLyChuyenBayPanel quanLyChuyenBayPanel;
    private QuanLyDatChoPanel quanLyDatChoPanel;
    private QuanLyVePanel quanLyVePanel;
    private EmployeePanel employeePanel;
    private QuanLyKhachHangPanel quanLyKhachHangPanel;
    private BaoCaoTKGUI baoCaoTKGUI;
    private gui.QuanLyPhanQuyenGUI.PhanQuyenGUI phanQuyenGUI;
    private DuLieuGocPanel duLieuGocPanel;

    // Global search and notification
    private final FrameAdminBUS frameAdminBUS = new FrameAdminBUS();
    private GlobalSearchPopup searchPopup;
    private NotificationDialog notiDialog;
    private Timer notificationTimer;
    private int unreadNotificationsCount = 0;
    private JButton btnNotification;
    private JTextField txtSearch;
    private java.util.List<JButton> sidebarButtons = new java.util.ArrayList<>();

    // Sidebar dimensions
    private static final int SIDEBAR_WIDTH = 220;
    private static final int TOPBAR_HEIGHT = 56;

    // Menu items config: {text, iconType}
    private static final String[][] MENU_ITEMS = {
            { "Dashboard", "dashboard" },
            { "Chuyến bay", "flight" },
            { "Đặt chỗ", "booking" },
            { "Vé", "ticket" },
            { "Nhân viên", "employee" },
            { "Khách hàng", "customer" },
            { "Phân quyền", "permission" },
            { "Dữ liệu gốc", "data" }
    };

    public FrameAdmin(AccountDTO account) {
        this.currentAccount = account;
        setTitle("Aviation Manager - TIU AIRLINES");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setMinimumSize(new Dimension(1100, 700));
        setSize(1280, 780);
        setLocationRelativeTo(null);
        setLayout(new BorderLayout(0, 0));

        initComponents();
    }

    private void initComponents() {
        // Init global search and notification popups
        searchPopup = new GlobalSearchPopup();
        notiDialog = new NotificationDialog();

        // ===== RIGHT SIDE (TopBar + Content) =====
        JPanel rightPanel = new JPanel(new BorderLayout(0, 0));
        rightPanel.setBackground(AppColor.BACKGROUND);

        // Top Bar
        JPanel topBar = createTopBar();
        rightPanel.add(topBar, BorderLayout.NORTH);

        // Content Area - Khởi tạo TRƯỚC sidebar vì selectDefaultMenu cần contentPanel
        contentPanel = new JPanel(new BorderLayout());
        contentPanel.setBackground(AppColor.BACKGROUND);
        contentPanel.setBorder(BorderFactory.createEmptyBorder(0, 0, 0, 0));
        rightPanel.add(contentPanel, BorderLayout.CENTER);

        add(rightPanel, BorderLayout.CENTER);

        // ===== SIDEBAR (phải tạo SAU contentPanel) =====
        sidebarPanel = createSidebar();
        add(sidebarPanel, BorderLayout.WEST);

        // Bắt đầu timer thông báo
        notificationTimer = new Timer(30000, e -> updateNotifications());
        notificationTimer.start();
        updateNotifications();

        setVisible(true);
    }

    private void updateNotifications() {
        List<NotificationDTO> notis = frameAdminBUS.getUrgentNotifications();
        unreadNotificationsCount = (notis != null) ? notis.size() : 0;
        notiDialog.updateNotifications(notis);
        if (btnNotification != null) {
            btnNotification.repaint();
        }
    }

    // ==================== SIDEBAR ====================
    private JPanel createSidebar() {
        JPanel sidebar = new JPanel(new BorderLayout(0, 0)) {
            @Override
            protected void paintComponent(Graphics g) {
                super.paintComponent(g);
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

                // Nền xanh navy đậm (Dark navy blue)
                g2.setColor(new Color(10, 15, 36));
                g2.fillRect(0, 0, getWidth(), getHeight());

                // Giả lập vân kim loại phay xước dạng tròn (Circular brushed metal texture)
                RadialGradientPaint rgp = new RadialGradientPaint(
                        new Point(getWidth() / 2, getHeight() / 4),
                        Math.max(getWidth(), getHeight()) * 0.8f,
                        new float[] { 0.0f, 0.5f, 1.0f },
                        new Color[] { new Color(45, 60, 95, 100), new Color(20, 30, 55, 60),
                                new Color(10, 15, 36, 0) });
                g2.setPaint(rgp);
                g2.fillRect(0, 0, getWidth(), getHeight());

                // Viền highlight tinh tế ở cạnh phải
                g2.setColor(new Color(255, 255, 255, 15));
                g2.drawLine(getWidth() - 1, 0, getWidth() - 1, getHeight());

                g2.dispose();
            }
        };
        sidebar.setPreferredSize(new Dimension(SIDEBAR_WIDTH, 0));
        sidebar.setOpaque(false);

        // --- Logo Section ---
        JPanel logoPanel = new JPanel(new BorderLayout(12, 0));
        logoPanel.setOpaque(false);
        logoPanel.setBorder(BorderFactory.createEmptyBorder(20, 20, 16, 20));

        // Logo Emblem: Glossy blue airplane + blue ring + gold swoosh + sparkles
        JLabel lblIcon = new JLabel() {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setRenderingHint(RenderingHints.KEY_STROKE_CONTROL, RenderingHints.VALUE_STROKE_PURE);

                int s = 44; // Tổng kích thước vùng vẽ
                int cx = s / 2;
                int cy = s / 2;
                AffineTransform saved = g2.getTransform();

                // ============================================================
                // LAYER 1: Golden-yellow curved swoosh (behind everything)
                // Wraps around the bottom-left of the blue ring, crossing behind the plane
                // ============================================================
                g2.setPaint(new LinearGradientPaint(2, cy + 4, s - 6, cy - 8,
                        new float[] { 0.0f, 0.5f, 1.0f },
                        new Color[] { new Color(255, 210, 50), new Color(255, 185, 0), new Color(210, 140, 0) }));
                g2.setStroke(new BasicStroke(1.8f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND));
                // Vẽ vòng cung vàng từ góc dưới-trái bao quanh phía dưới ring xanh
                Arc2D goldArc = new Arc2D.Double(cx - 19, cy - 10, 34, 28, 200, 170, Arc2D.OPEN);
                g2.draw(goldArc);

                // ============================================================
                // LAYER 2: Thick circular ring (light-blue → dark-blue gradient)
                // ============================================================
                int ringInset = 5;
                int ringDia = s - ringInset * 2;
                g2.setPaint(new LinearGradientPaint(ringInset, ringInset, ringInset + ringDia, ringInset + ringDia,
                        new float[] { 0.0f, 0.5f, 1.0f },
                        new Color[] { new Color(100, 210, 255), new Color(30, 120, 220), new Color(0, 60, 170) }));
                g2.setStroke(new BasicStroke(3.2f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND));
                g2.drawOval(ringInset, ringInset, ringDia, ringDia);

                // Glossy highlight trên ring (vòng sáng nhẹ ở nửa trên)
                g2.setStroke(new BasicStroke(1.0f));
                g2.setColor(new Color(255, 255, 255, 55));
                g2.drawArc(ringInset + 2, ringInset + 2, ringDia - 4, ringDia - 4, 30, 120);

                // ============================================================
                // LAYER 3: 3 tiny four-point star sparkles trên vòng ring
                // ============================================================
                drawFourPointStar(g2, 12, 7, 3); // Top-left trên ring
                drawFourPointStar(g2, 36, 14, 2); // Right trên ring
                drawFourPointStar(g2, 8, 32, 2); // Bottom-left trên ring

                // ============================================================
                // LAYER 4: Glossy Royal Blue Airplane (topmost, soaring upward-right)
                // ============================================================
                g2.rotate(Math.toRadians(-30), cx, cy); // Xoay để bay chéo lên phải

                // Gradient glossy xanh dương hoàng gia
                g2.setPaint(new LinearGradientPaint(cx - 8, cy - 10, cx + 6, cy + 8,
                        new float[] { 0.0f, 0.35f, 0.7f, 1.0f },
                        new Color[] {
                                new Color(200, 240, 255), // highlight sáng
                                new Color(60, 160, 255), // royal blue sáng
                                new Color(20, 100, 220), // royal blue trung
                                new Color(0, 50, 150) // royal blue sẫm
                        }));

                // Thân máy bay (mũi nhọn, dáng thanh thoát)
                GeneralPath body = new GeneralPath();
                body.moveTo(cx - 12, cy + 1); // Mũi (trái = hướng bay)
                body.quadTo(cx - 5, cy - 4, cx + 2, cy - 1);
                body.quadTo(cx + 6, cy + 1, cx + 10, cy + 2); // Đuôi sau
                body.quadTo(cx + 6, cy + 4, cx + 2, cy + 4);
                body.quadTo(cx - 5, cy + 5, cx - 12, cy + 1);
                body.closePath();
                g2.fill(body);

                // Cánh chính (mở rộng từ giữa thân ra 2 bên)
                GeneralPath mainWing = new GeneralPath();
                mainWing.moveTo(cx - 4, cy);
                mainWing.lineTo(cx + 1, cy - 9); // Mút cánh trên
                mainWing.lineTo(cx + 3, cy - 1);
                mainWing.closePath();
                g2.fill(mainWing);

                GeneralPath mainWing2 = new GeneralPath();
                mainWing2.moveTo(cx - 4, cy + 2);
                mainWing2.lineTo(cx + 1, cy + 10); // Mút cánh dưới
                mainWing2.lineTo(cx + 3, cy + 3);
                mainWing2.closePath();
                g2.fill(mainWing2);

                // Cánh đuôi
                GeneralPath tailWing = new GeneralPath();
                tailWing.moveTo(cx + 8, cy + 1);
                tailWing.lineTo(cx + 12, cy - 4); // Cánh đuôi dựng đứng lên
                tailWing.lineTo(cx + 11, cy + 1);
                tailWing.closePath();
                g2.fill(tailWing);

                // Đường highlight bóng trên thân (glass cockpit)
                g2.setColor(new Color(255, 255, 255, 160));
                g2.setStroke(new BasicStroke(0.8f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND));
                g2.drawLine(cx - 10, cy, cx - 6, cy);

                // Đường highlight dọc thân trên
                g2.setColor(new Color(255, 255, 255, 50));
                g2.drawLine(cx - 6, cy - 1, cx + 6, cy);

                g2.setTransform(saved);
                g2.dispose();
            }

            /** Vẽ ngôi sao 4 cánh (four-point sparkle) */
            private void drawFourPointStar(Graphics2D g2, int sx, int sy, int r) {
                g2.setColor(new Color(255, 255, 255, 230));
                GeneralPath star = new GeneralPath();
                star.moveTo(sx, sy - r); // Đỉnh trên
                star.quadTo(sx + 0.5, sy - 0.5, sx + r, sy); // Cánh phải
                star.quadTo(sx + 0.5, sy + 0.5, sx, sy + r); // Đỉnh dưới
                star.quadTo(sx - 0.5, sy + 0.5, sx - r, sy); // Cánh trái
                star.quadTo(sx - 0.5, sy - 0.5, sx, sy - r); // Về đỉnh trên
                star.closePath();
                g2.fill(star);
                // Lõi sáng trắng trung tâm
                g2.setColor(Color.WHITE);
                g2.fillOval(sx - 1, sy - 1, 2, 2);
            }
        };
        lblIcon.setPreferredSize(new Dimension(44, 44));
        logoPanel.add(lblIcon, BorderLayout.WEST);

        JPanel logoTextPanel = new JPanel();
        logoTextPanel.setLayout(new BoxLayout(logoTextPanel, BoxLayout.Y_AXIS));
        logoTextPanel.setOpaque(false);

        JLabel lblTitle = new JLabel("TIU AIRLINES");
        lblTitle.setFont(new Font("Segoe UI", Font.BOLD, 17));
        lblTitle.setForeground(Color.WHITE);
        lblTitle.setAlignmentX(Component.LEFT_ALIGNMENT);
        logoTextPanel.add(lblTitle);

        // Wide letter spacing for modern corporate subtext look
        JLabel lblSub = new JLabel("A V I A T I O N  S Y S T E M");
        lblSub.setFont(new Font("Segoe UI", Font.BOLD, 8));
        lblSub.setForeground(new Color(110, 140, 170)); // light blue-grey
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
        sidebarButtons.clear();
        for (String[] item : MENU_ITEMS) {
            JButton btn = createMenuButton(item[0], item[1]);
            sidebarButtons.add(btn);
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
                if ("Dashboard".equals(btn.getText().trim())) {
                    setSelectedButton(btn);
                    onMenuClicked("Dashboard");
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
                BorderFactory.createEmptyBorder(0, 24, 0, 24)));

        // Left: Title
        JLabel lblAppTitle = new JLabel("Aviation Manager");
        lblAppTitle.setFont(new Font("Segoe UI", Font.BOLD, 16));
        lblAppTitle.setForeground(AppColor.TEXT_PRIMARY);
        topBar.add(lblAppTitle, BorderLayout.WEST);

        // Center: Search bar
        JPanel searchPanel = new JPanel(new FlowLayout(FlowLayout.CENTER, 0, 0));
        searchPanel.setOpaque(false);
        searchPanel.setBorder(BorderFactory.createEmptyBorder(10, 0, 10, 0));

        txtSearch = new JTextField() {
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
                BorderFactory.createEmptyBorder(4, 34, 4, 12)));
        txtSearch.setBackground(new Color(249, 250, 251)); // Gray 50

        // --- Thêm logic Search ---
        txtSearch.getDocument().addDocumentListener(new javax.swing.event.DocumentListener() {
            public void insertUpdate(javax.swing.event.DocumentEvent e) {
                doSearch();
            }

            public void removeUpdate(javax.swing.event.DocumentEvent e) {
                doSearch();
            }

            public void changedUpdate(javax.swing.event.DocumentEvent e) {
                doSearch();
            }
        });

        txtSearch.addFocusListener(new java.awt.event.FocusAdapter() {
            @Override
            public void focusGained(java.awt.event.FocusEvent e) {
                if (txtSearch.getText().trim().length() > 0) {
                    searchPopup.showLastResults(txtSearch);
                }
            }
        });

        txtSearch.addMouseListener(new java.awt.event.MouseAdapter() {
            @Override
            public void mouseClicked(java.awt.event.MouseEvent e) {
                if (txtSearch.getText().trim().length() > 0 && !searchPopup.isVisible()) {
                    searchPopup.showLastResults(txtSearch);
                }
            }
        });

        searchPanel.add(txtSearch);
        topBar.add(searchPanel, BorderLayout.CENTER);

        // Right: Icons
        JPanel iconsPanel = new JPanel(new FlowLayout(FlowLayout.RIGHT, 12, 0));
        iconsPanel.setOpaque(false);
        iconsPanel.setBorder(BorderFactory.createEmptyBorder(10, 0, 10, 0));

        btnNotification = createTopBarIcon("bell");
        btnNotification.addActionListener(e -> {
            notiDialog.show(btnNotification, -notiDialog.getPreferredSize().width + btnNotification.getWidth(),
                    btnNotification.getHeight() + 4);
        });
        iconsPanel.add(btnNotification);

        // Hiển thị tên người dùng từ currentAccount
        String name = (currentAccount != null) ? currentAccount.getUserName() : "Admin";
        JLabel lblUser = new JLabel(name);
        lblUser.setFont(new Font("Segoe UI", Font.BOLD, 13));
        lblUser.setForeground(AppColor.TEXT_PRIMARY);
        iconsPanel.add(lblUser);

        iconsPanel.add(createAvatarButton());

        topBar.add(iconsPanel, BorderLayout.EAST);

        return topBar;
    }

    private void doSearch() {
        String kw = txtSearch.getText().trim();
        if (kw.length() > 0) {
            List<SearchResultDTO> results = frameAdminBUS.globalSearch(kw);
            searchPopup.updateResults(results, dto -> {
                String type = dto.getType();
                String id = dto.getId();
                if ("FLIGHT".equals(type)) {
                    selectMenuByName("Chuyến bay");
                    if (quanLyChuyenBayPanel != null) quanLyChuyenBayPanel.selectById(id);
                } else if ("CUSTOMER".equals(type)) {
                    selectMenuByName("Khách hàng");
                    if (quanLyKhachHangPanel != null) quanLyKhachHangPanel.selectById(id);
                } else if ("BOOKING".equals(type)) {
                    selectMenuByName("Đặt chỗ");
                    if (quanLyDatChoPanel != null) quanLyDatChoPanel.selectById(id);
                } else if ("TICKET".equals(type)) {
                    selectMenuByName("Vé");
                    if (quanLyVePanel != null) quanLyVePanel.selectById(id);
                }
                searchPopup.setVisible(false); // Ẩn popup sau khi chọn
            });
            if (!searchPopup.isVisible()) {
                searchPopup.show(txtSearch, 0, txtSearch.getHeight() + 4);
                txtSearch.requestFocusInWindow();
            }
        } else {
            searchPopup.setVisible(false);
        }
    }

    // ==================== COMPONENT FACTORIES ====================

    private JButton createMenuButton(String text, String iconType) {
        JButton btn = new JButton(text) {
            private boolean isHovered = false;

            {
                addMouseListener(new MouseAdapter() {
                    @Override
                    public void mouseEntered(MouseEvent e) {
                        isHovered = true;
                        repaint();
                    }

                    @Override
                    public void mouseExited(MouseEvent e) {
                        isHovered = false;
                        repaint();
                    }
                });
            }

            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

                boolean isSelected = (FrameAdmin.this.selectedMenuButton == this);

                if (isSelected) {
                    // Electric blue and purple aura (Glow phát sáng)
                    g2.setPaint(new LinearGradientPaint(
                            0, 0, getWidth(), 0,
                            new float[] { 0.0f, 0.4f, 1.0f },
                            new Color[] { new Color(0, 240, 255, 45), new Color(138, 43, 226, 25),
                                    new Color(0, 0, 0, 0) }));
                    g2.fill(new RoundRectangle2D.Double(0, 0, getWidth(), getHeight(), 12, 12));

                    // Glassmorphism box (Hộp hiệu ứng kính trong suốt)
                    g2.setColor(new Color(255, 255, 255, 10)); // Nền kính mờ
                    g2.fill(new RoundRectangle2D.Double(0, 0, getWidth(), getHeight(), 12, 12));
                    g2.setColor(new Color(255, 255, 255, 25)); // Viền highlight của kính
                    g2.draw(new RoundRectangle2D.Double(0, 0, getWidth() - 1, getHeight() - 1, 12, 12));

                    // Glowing neon blue vertical indicator bar (Thanh chỉ báo neon)
                    Color neonBlue = new Color(0, 255, 255);
                    for (int i = 0; i < 5; i++) { // Vẽ nhiều lớp để tạo hiệu ứng phát sáng mờ (glow)
                        g2.setColor(new Color(neonBlue.getRed(), neonBlue.getGreen(), neonBlue.getBlue(), 50 - i * 10));
                        g2.fill(new RoundRectangle2D.Double(2 - i, 8 - i, 4 + i * 2, getHeight() - 16 + i * 2, 4, 4));
                    }
                    g2.setColor(Color.WHITE); // Lõi sáng nhất
                    g2.fill(new RoundRectangle2D.Double(2, 8, 2, getHeight() - 16, 2, 2));

                    // Floating light particles (Các hạt sáng li ti bay lơ lửng)
                    g2.setColor(new Color(0, 255, 255, 200));
                    g2.fillOval(getWidth() - 30, 12, 2, 2);
                    g2.fillOval(getWidth() - 15, 28, 1, 1);
                    g2.setColor(new Color(138, 43, 226, 200));
                    g2.fillOval(40, getHeight() - 8, 2, 2);

                } else if (isHovered) {
                    // Glassmorphism nhẹ khi hover
                    g2.setColor(new Color(255, 255, 255, 15));
                    g2.fill(new RoundRectangle2D.Double(0, 0, getWidth(), getHeight(), 12, 12));
                }

                // Icon (Elegant thin line icons - Nét mỏng thanh lịch)
                g2.setColor(isSelected ? Color.WHITE : new Color(148, 163, 184));
                drawMenuIcon(g2, iconType, 16, (getHeight() - 18) / 2, 18);

                // Text (Clean white sans-serif)
                g2.setColor(isSelected ? Color.WHITE : new Color(203, 213, 225));
                if (isSelected) {
                    g2.setFont(getFont().deriveFont(Font.BOLD));
                } else {
                    g2.setFont(getFont());
                }
                FontMetrics fm = g2.getFontMetrics();
                g2.drawString(getText(), 48, (getHeight() - fm.getHeight()) / 2 + fm.getAscent());

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
        if (selectedMenuButton != null)
            selectedMenuButton.repaint();
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
                g2.setStroke(new BasicStroke(1.5f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND));
                if ("bell".equals(type)) {
                    // Dáng chuông cổ điển với đường cong mềm mại ở đáy (flare)
                    GeneralPath bell = new GeneralPath();
                    bell.moveTo(cx - 8, cy + 6); // Điểm bắt đầu ở mép trái đáy
                    bell.quadTo(cx - 5, cy + 6, cx - 5, cy + 2); // Cong mềm lên eo trái
                    bell.lineTo(cx - 5, cy - 1); // Nét thẳng đứng ở eo
                    // Mái vòm tròn trịa (tâm ở cx, cy-1; bán kính 5)
                    bell.append(new Arc2D.Double(cx - 5, cy - 6, 10, 10, 180, -180, Arc2D.OPEN), true);
                    bell.lineTo(cx + 5, cy + 2); // Nét thẳng đứng eo phải
                    bell.quadTo(cx + 5, cy + 6, cx + 8, cy + 6); // Cong mềm ra mép phải đáy
                    bell.closePath(); // Đóng hình bằng đường ngang đáy
                    g2.draw(bell);

                    // Quả lắc chuông (Clapper) nằm ngay dưới đáy
                    g2.fillOval(cx - 2, cy + 6, 4, 4);

                    // Vẽ badge thông báo đỏ
                    if (unreadNotificationsCount > 0) {
                        g2.setColor(new Color(239, 68, 68)); // red
                        g2.fillOval(cx + 2, cy - 8, 14, 14);
                        g2.setColor(Color.WHITE);
                        g2.setFont(new Font("Segoe UI", Font.BOLD, 10));
                        String txt = unreadNotificationsCount > 9 ? "9+" : String.valueOf(unreadNotificationsCount);
                        FontMetrics fm2 = g2.getFontMetrics();
                        int w = fm2.stringWidth(txt);
                        g2.drawString(txt, cx + 2 + (14 - w) / 2, cy - 8 + 11);
                    }
                } else if ("help".equals(type)) {
                    // --- Icon dấu chấm hỏi nằm ngay trọng tâm và thẩm mỹ hơn ---
                    g2.setColor(new Color(90, 105, 125));
                    g2.drawOval(cx - 9, cy - 9, 18, 18);
                    g2.setFont(new Font("Segoe UI", Font.BOLD, 15));

                    FontMetrics fm = g2.getFontMetrics();
                    int textWidth = fm.stringWidth("?");
                    int textX = cx - (textWidth / 2);
                    int textY = cy + (fm.getAscent() - fm.getDescent()) / 2 - 1;

                    g2.drawString("?", textX, textY);
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
        g2.setStroke(new BasicStroke(1.2f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND));
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
            case "dashboard" -> {
                // Dashboard grid (4 ô vuông)
                int half = (size - 4) / 2;
                g2.fillRoundRect(x + 1, y + 1, half, half, 3, 3);
                g2.fillRoundRect(x + half + 3, y + 1, half, half, 3, 3);
                g2.fillRoundRect(x + 1, y + half + 3, half, half, 3, 3);
                g2.drawRoundRect(x + half + 3, y + half + 3, half, half, 3, 3);
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

    private void selectMenuByName(String menuText) {
        if (sidebarButtons != null) {
            for (JButton btn : sidebarButtons) {
                if (menuText.equals(btn.getText())) {
                    setSelectedButton(btn);
                    onMenuClicked(menuText);
                    return;
                }
            }
        }
        // Dự phòng nếu không tìm thấy nút trên sidebar
        onMenuClicked(menuText);
    }

    /**
     * Xử lý khi người dùng nhấn vào menu sidebar.
     * Gọi setContentPanel() để đổi panel ở giữa.
     */
    private void onMenuClicked(String menuText) {
        switch (menuText) {
            case "Chuyến bay":
                if (quanLyChuyenBayPanel == null)
                    quanLyChuyenBayPanel = new QuanLyChuyenBayPanel();
                setContentPanel(quanLyChuyenBayPanel);
                break;
            case "Đặt chỗ":
                if (quanLyDatChoPanel == null)
                    quanLyDatChoPanel = new QuanLyDatChoPanel();
                setContentPanel(quanLyDatChoPanel);
                break;
            case "Vé":
                if (quanLyVePanel == null)
                    quanLyVePanel = new QuanLyVePanel();
                setContentPanel(quanLyVePanel);
                break;
            case "Nhân viên":
                if (employeePanel == null)
                    employeePanel = new EmployeePanel();
                setContentPanel(employeePanel);
                break;
            case "Khách hàng":
                if (quanLyKhachHangPanel == null)
                    quanLyKhachHangPanel = new QuanLyKhachHangPanel();
                setContentPanel(quanLyKhachHangPanel);
                break;
            case "Dashboard":
                if (baoCaoTKGUI == null)
                    baoCaoTKGUI = new BaoCaoTKGUI();
                setContentPanel(baoCaoTKGUI);
                break;
            case "Phân quyền":
                if (phanQuyenGUI == null)
                    phanQuyenGUI = new gui.QuanLyPhanQuyenGUI.PhanQuyenGUI();
                setContentPanel(phanQuyenGUI);
                break;
            case "Dữ liệu gốc":
                if (duLieuGocPanel == null)
                    duLieuGocPanel = new DuLieuGocPanel();
                setContentPanel(duLieuGocPanel);
                break;
            case "Logout":
                int opt = JOptionPane.showConfirmDialog(this, "Bạn có chắc chắn muốn đăng xuất?", "Đăng xuất",
                        JOptionPane.YES_NO_OPTION);
                if (opt == JOptionPane.YES_OPTION) {
                    new gui.LoginRegesterGUI.loginGUI();
                    dispose();
                }
                break;
            default:
                System.out.println("Menu clicked: " + menuText);
        }
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

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            try {
                UIManager.setLookAndFeel(new FlatLightLaf());
            } catch (Exception e) {
                e.printStackTrace();
            }
            // Mặc định truyền null khi chạy test
            FrameAdmin frame = new FrameAdmin(null);
            frame.setVisible(true);
        });
    }
}