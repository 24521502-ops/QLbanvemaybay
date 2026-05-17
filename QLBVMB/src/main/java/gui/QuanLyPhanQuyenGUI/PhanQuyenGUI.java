package gui.QuanLyPhanQuyenGUI;

import dto.RoleGroupDTO;
import util.AppColor;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import javax.swing.table.*;

import bus.QuanLyPhanQuyenBUS.RoleGroupBUS;

import java.awt.*;
import java.awt.event.*;
import java.awt.geom.RoundRectangle2D;
import java.util.List;

public class PhanQuyenGUI extends JPanel {

    private JTable table;
    private DefaultTableModel tableModel;
    private JTextField txtSearch;
    private javax.swing.Timer searchTimer;
    private final RoleGroupBUS roleGroupBUS = new RoleGroupBUS();

    // Đã bỏ các biến phân trang, thêm biến lưu trữ trạng thái sắp xếp
    private List<RoleGroupDTO> currentData;
    private boolean isAscendingSort = true;

    // Dashboard labels
    private JLabel lblTotalRoles;
    private JLabel lblTotalUsers;
    private JLabel lblLargestGroup;

    // Table colors
    private static final Color ROW_EVEN = Color.WHITE;
    private static final Color ROW_ODD = new Color(249, 250, 251);
    private static final Color ROW_BORDER = new Color(243, 244, 246);

    public PhanQuyenGUI() {
        setLayout(new BorderLayout());
        setBackground(AppColor.BACKGROUND);
        setBorder(BorderFactory.createEmptyBorder(24, 28, 24, 28));
        initComponents();
        loadData();
    }

    private void initComponents() {
        // === HEADER ===
        JPanel headerPanel = new JPanel(new BorderLayout());
        headerPanel.setOpaque(false);
        headerPanel.setBorder(BorderFactory.createEmptyBorder(0, 0, 20, 0));

        JPanel titlePanel = new JPanel();
        titlePanel.setLayout(new BoxLayout(titlePanel, BoxLayout.Y_AXIS));
        titlePanel.setOpaque(false);
        JLabel lblTitle = new JLabel("Vai trò & Quyền hạn");
        lblTitle.setFont(new Font("Segoe UI", Font.BOLD, 22));
        lblTitle.setForeground(AppColor.TEXT_PRIMARY);
        lblTitle.setAlignmentX(LEFT_ALIGNMENT);
        JLabel lblSub = new JLabel("Quản lý các nhóm vai trò và quyền truy cập chức năng trong hệ thống");
        lblSub.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        lblSub.setForeground(AppColor.TEXT_SECONDARY);
        lblSub.setAlignmentX(LEFT_ALIGNMENT);
        titlePanel.add(lblTitle);
        titlePanel.add(Box.createVerticalStrut(4));
        titlePanel.add(lblSub);
        headerPanel.add(titlePanel, BorderLayout.WEST);

        JButton btnAdd = createPrimaryButton("Tạo vai trò mới");
        btnAdd.setIcon(new PlusIcon());
        btnAdd.setIconTextGap(10);
        btnAdd.addActionListener(e -> openDialog(null));
        headerPanel.add(btnAdd, BorderLayout.EAST);
        add(headerPanel, BorderLayout.NORTH);

        // === CONTENT WRAPPER ===
        JPanel contentWrapper = new JPanel(new BorderLayout(0, 16));
        contentWrapper.setOpaque(false);

        // ===== DASHBOARD PANELS =====
        JPanel dashboardPanel = createDashboardPanel();
        contentWrapper.add(dashboardPanel, BorderLayout.NORTH);

        JPanel mainWrapper = new JPanel(new BorderLayout(0, 16));
        mainWrapper.setOpaque(false);

        // ===== FILTER CARD (Đã chỉnh sửa giống QuanLyDatChoPanel) =====
        JPanel filterCard = new JPanel(new BorderLayout()) {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(Color.WHITE);
                g2.fill(new RoundRectangle2D.Double(0, 0, getWidth(), getHeight(), 12, 12));
                g2.setColor(AppColor.BORDER);
                g2.draw(new RoundRectangle2D.Double(0.5, 0.5, getWidth() - 1, getHeight() - 1, 12, 12));
                g2.dispose();
            }
        };
        filterCard.setOpaque(false);
        filterCard.setBorder(BorderFactory.createEmptyBorder(12, 20, 12, 20));

        // Nhóm công cụ bên Trái
        JPanel pnlLeftTools = new JPanel(new FlowLayout(FlowLayout.LEFT, 12, 0));
        pnlLeftTools.setOpaque(false);

        searchTimer = new javax.swing.Timer(300, e -> applyFilters());
        searchTimer.setRepeats(false);

        txtSearch = new JTextField();
        txtSearch.setPreferredSize(new Dimension(340, 42)); // Tăng kích thước giống QuanLyDatCho
        txtSearch.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        txtSearch.putClientProperty("JTextField.placeholderText", "Tìm kiếm vai trò...");
        txtSearch.putClientProperty("JTextField.leadingIcon", new SearchIcon());
        txtSearch.setBorder(BorderFactory.createCompoundBorder(
                BorderFactory.createLineBorder(AppColor.BORDER),
                new EmptyBorder(8, 12, 8, 12)));
        txtSearch.getDocument().addDocumentListener(new javax.swing.event.DocumentListener() {
            public void insertUpdate(javax.swing.event.DocumentEvent e) {
                searchTimer.restart();
            }

            public void removeUpdate(javax.swing.event.DocumentEvent e) {
                searchTimer.restart();
            }

            public void changedUpdate(javax.swing.event.DocumentEvent e) {
                searchTimer.restart();
            }
        });

        // Nút Làm mới
        JButton btnRefresh = makeSecondaryButton("Làm mới", null);
        // Sửa số 110 thành 130 (hoặc 140 nếu vẫn thấy chật)
        btnRefresh.setPreferredSize(new Dimension(130, 42));
        btnRefresh.addActionListener(e -> {
            if (searchTimer != null)
                searchTimer.stop();
            txtSearch.setText("");
            isAscendingSort = true;
            loadData();
        });

        // Nút Sắp xếp
        JButton btnSort = makeSecondaryButton("Sắp xếp ▼", null);
        btnSort.setPreferredSize(new Dimension(120, 42));

        JPopupMenu sortMenu = new JPopupMenu();
        sortMenu.setBackground(Color.WHITE);
        sortMenu.setBorder(BorderFactory.createLineBorder(AppColor.BORDER));

        JMenuItem itemSortAsc = createMenuItem("Tên vai trò (A - Z)");
        JMenuItem itemSortDesc = createMenuItem("Tên vai trò (Z - A)");

        itemSortAsc.addActionListener(e -> {
            isAscendingSort = true;
            sortData();
            refreshTable();
        });

        itemSortDesc.addActionListener(e -> {
            isAscendingSort = false;
            sortData();
            refreshTable();
        });

        sortMenu.add(itemSortAsc);
        sortMenu.add(itemSortDesc);

        btnSort.addActionListener(e -> sortMenu.show(btnSort, 0, btnSort.getHeight() + 2));

        pnlLeftTools.add(txtSearch);
        pnlLeftTools.add(btnRefresh);
        pnlLeftTools.add(btnSort);

        filterCard.add(pnlLeftTools, BorderLayout.WEST);
        mainWrapper.add(filterCard, BorderLayout.NORTH);

        // ===== TABLE CARD =====
        JPanel tableCard = new JPanel(new BorderLayout(0, 0)) {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(Color.WHITE);
                g2.fill(new RoundRectangle2D.Double(0, 0, getWidth(), getHeight(), 16, 16));
                g2.setColor(AppColor.BORDER);
                g2.draw(new RoundRectangle2D.Double(0.5, 0.5, getWidth() - 1, getHeight() - 1, 16, 16));
                g2.dispose();
            }
        };
        tableCard.setOpaque(false);
        tableCard.setBorder(BorderFactory.createEmptyBorder(10, 2, 10, 2));

        String[] cols = { "Tên vai trò", "Mô tả", "Số người dùng", "Thao tác" };
        tableModel = new DefaultTableModel(cols, 0) {
            @Override
            public boolean isCellEditable(int r, int c) {
                return c == 3;
            }
        };
        table = new JTable(tableModel);
        table.setRowHeight(64);
        table.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        table.setShowHorizontalLines(true);
        table.setShowVerticalLines(false);
        table.setGridColor(ROW_BORDER);
        table.setSelectionBackground(new Color(241, 245, 249));
        table.setSelectionForeground(AppColor.TEXT_PRIMARY);
        table.setIntercellSpacing(new Dimension(0, 0));
        table.setFocusable(false);

        // Header style
        JTableHeader header = table.getTableHeader();
        header.setFont(new Font("Segoe UI", Font.BOLD, 12));
        header.setForeground(AppColor.TEXT_SECONDARY);
        header.setBackground(AppColor.SURFACE);
        header.setBorder(BorderFactory.createMatteBorder(0, 0, 1, 0, AppColor.BORDER));
        header.setPreferredSize(new Dimension(0, 50));
        header.setReorderingAllowed(false);

        header.setDefaultRenderer(new DefaultTableCellRenderer() {
            @Override
            public Component getTableCellRendererComponent(JTable t, Object v, boolean sel, boolean foc, int r, int c) {
                JLabel label = (JLabel) super.getTableCellRendererComponent(t, v, sel, foc, r, c);
                label.setFont(new Font("Segoe UI", Font.BOLD, 12));
                label.setForeground(AppColor.TEXT_SECONDARY);
                label.setBackground(AppColor.SURFACE);
                if (c == 3) {
                    label.setBorder(BorderFactory.createEmptyBorder(0, 0, 0, 0));
                    label.setHorizontalAlignment(SwingConstants.CENTER);
                } else {
                    label.setBorder(BorderFactory.createEmptyBorder(0, 20, 0, 10));
                    label.setHorizontalAlignment(SwingConstants.LEFT);
                }
                return label;
            }
        });

        // Column widths
        table.getColumnModel().getColumn(0).setPreferredWidth(180);
        table.getColumnModel().getColumn(1).setPreferredWidth(300);
        table.getColumnModel().getColumn(2).setPreferredWidth(120);
        table.getColumnModel().getColumn(3).setPreferredWidth(100);

        // Column Renderers
        ZebraRenderer zebraRenderer = new ZebraRenderer();

        table.getColumnModel().getColumn(0).setCellRenderer(new DefaultTableCellRenderer() {
            @Override
            public Component getTableCellRendererComponent(JTable t, Object v, boolean sel, boolean foc, int r, int c) {
                super.getTableCellRendererComponent(t, v, sel, foc, r, c);
                setFont(new Font("Segoe UI", Font.BOLD, 14));
                setForeground(AppColor.TEXT_PRIMARY);
                setBorder(BorderFactory.createEmptyBorder(0, 20, 0, 10));
                setBackground(sel ? new Color(241, 245, 249) : (r % 2 == 0 ? ROW_EVEN : ROW_ODD));
                return this;
            }
        });

        table.getColumnModel().getColumn(1).setCellRenderer(zebraRenderer);
        table.getColumnModel().getColumn(2).setCellRenderer(new BadgeCellRenderer());
        table.getColumnModel().getColumn(3).setCellRenderer(new ActionRenderer());
        table.getColumnModel().getColumn(3).setCellEditor(new ActionEditor());

        JScrollPane scroll = new JScrollPane(table);
        scroll.setBorder(BorderFactory.createEmptyBorder());
        scroll.setViewportBorder(null);
        scroll.getViewport().setBackground(Color.WHITE);
        scroll.setBackground(Color.WHITE);
        tableCard.add(scroll, BorderLayout.CENTER);

        // (Đã xóa Pagination Panel ở đây để cho phép lướt thanh cuộn)

        mainWrapper.add(tableCard, BorderLayout.CENTER);
        contentWrapper.add(mainWrapper, BorderLayout.CENTER);
        add(contentWrapper, BorderLayout.CENTER);
    }

    private void loadData() {
        currentData = roleGroupBUS.getAll();
        sortData();
        refreshTable();
        updateDashboards();
    }

    private void updateDashboards() {
        List<RoleGroupDTO> allData = roleGroupBUS.getAll();
        if (allData == null || allData.isEmpty()) {
            lblTotalRoles.setText("0");
            lblTotalUsers.setText("0");
            lblLargestGroup.setText("N/A");
            return;
        }

        int totalRoles = allData.size();
        int totalUsers = 0;
        int maxUsers = -1;
        String largestGroup = "N/A";

        for (RoleGroupDTO dto : allData) {
            int users = roleGroupBUS.countUsers(dto.getRoleGroupID());
            totalUsers += users;
            if (users > maxUsers) {
                maxUsers = users;
                largestGroup = dto.getNameRoleGroup();
            }
        }

        lblTotalRoles.setText(String.valueOf(totalRoles));
        lblTotalUsers.setText(String.valueOf(totalUsers));
        String lg = largestGroup != null ? largestGroup : "N/A";
        lblLargestGroup.setText(lg);
        lblLargestGroup.setToolTipText(lg);
    }

    private JPanel createDashboardPanel() {
        JPanel panel = new JPanel(new GridLayout(1, 3, 20, 0));
        panel.setOpaque(false);
        panel.setPreferredSize(new Dimension(0, 110));

        lblTotalRoles = new JLabel("0");
        lblTotalUsers = new JLabel("0");
        lblLargestGroup = new JLabel("N/A");

        panel.add(createKPICard("Tổng số vai trò", lblTotalRoles, new Color(59, 130, 246), new Color(219, 234, 254)));
        panel.add(createKPICard("Tài khoản đã cấp", lblTotalUsers, new Color(16, 185, 129), new Color(209, 250, 229)));
        panel.add(createKPICard("Nhóm phổ biến nhất", lblLargestGroup, new Color(245, 158, 11),
                new Color(254, 243, 199)));

        return panel;
    }

    private JPanel createKPICard(String title, JLabel lblValue, Color iconColor, Color iconBg) {
        JPanel card = new JPanel(new BorderLayout(14, 0)) {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(Color.WHITE);
                g2.fill(new java.awt.geom.RoundRectangle2D.Double(0, 0, getWidth(), getHeight(), 16, 16));
                g2.setColor(AppColor.BORDER);
                g2.draw(new java.awt.geom.RoundRectangle2D.Double(0.5, 0.5, getWidth() - 1, getHeight() - 1, 16, 16));

                g2.setColor(iconColor);
                Shape oldClip = g2.getClip();
                g2.clipRect(0, 0, 6, getHeight());
                g2.fill(new java.awt.geom.RoundRectangle2D.Double(0, 0, 12, getHeight(), 16, 16));
                g2.setClip(oldClip);
                g2.dispose();
            }
        };
        card.setOpaque(false);
        card.setBorder(BorderFactory.createEmptyBorder(16, 22, 16, 16));

        JPanel iconPanel = new JPanel() {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

                int cx = getWidth() / 2;
                int cy = getHeight() / 2;

                g2.setColor(iconBg);
                g2.fillRoundRect(0, cy - 26, 52, 52, 16, 16);

                g2.setColor(iconColor);
                g2.setStroke(new BasicStroke(2.2f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND));

                if (title.contains("vai trò")) {
                    g2.drawRoundRect(cx - 11, cy - 11, 9, 9, 3, 3);
                    g2.drawRoundRect(cx + 2, cy - 11, 9, 9, 3, 3);
                    g2.drawRoundRect(cx - 11, cy + 2, 9, 9, 3, 3);
                    g2.drawRoundRect(cx + 2, cy + 2, 9, 9, 3, 3);
                } else if (title.contains("Tài khoản")) {
                    g2.drawOval(cx - 6, cy - 11, 12, 12);
                    g2.drawArc(cx - 12, cy + 5, 24, 16, 0, 180);
                } else {
                    g2.drawRoundRect(cx - 8, cy - 12, 16, 18, 3, 3);
                    g2.drawArc(cx - 15, cy - 10, 7, 12, 90, 180);
                    g2.drawArc(cx + 8, cy - 10, 7, 12, 270, 180);
                    g2.drawLine(cx, cy + 6, cx, cy + 14);
                    g2.drawLine(cx - 8, cy + 14, cx + 8, cy + 14);
                }
                g2.dispose();
            }
        };
        iconPanel.setPreferredSize(new Dimension(52, 52));
        iconPanel.setMaximumSize(new Dimension(52, 52));
        iconPanel.setOpaque(false);
        card.add(iconPanel, BorderLayout.WEST);

        JPanel textPanel = new JPanel(new GridBagLayout());
        textPanel.setOpaque(false);

        JPanel innerTextPanel = new JPanel();
        innerTextPanel.setLayout(new BoxLayout(innerTextPanel, BoxLayout.Y_AXIS));
        innerTextPanel.setOpaque(false);

        JLabel lblTitle = new JLabel(title);
        lblTitle.setFont(new Font("Segoe UI", Font.BOLD, 13));
        lblTitle.setForeground(new Color(100, 116, 139));
        lblTitle.setAlignmentX(Component.LEFT_ALIGNMENT);

        lblValue.setFont(new Font("Segoe UI", Font.BOLD, title.contains("Nhóm") ? 14 : 26));
        lblValue.setForeground(new Color(15, 23, 42));
        lblValue.setAlignmentX(Component.LEFT_ALIGNMENT);

        innerTextPanel.add(lblTitle);
        innerTextPanel.add(Box.createVerticalStrut(2));
        innerTextPanel.add(lblValue);

        GridBagConstraints gbc = new GridBagConstraints();
        gbc.anchor = GridBagConstraints.WEST;
        gbc.weightx = 1.0;
        gbc.fill = GridBagConstraints.HORIZONTAL;
        textPanel.add(innerTextPanel, gbc);

        card.add(textPanel, BorderLayout.CENTER);
        return card;
    }

    private void applyFilters() {
        if (currentData == null)
            return;
        String kw = txtSearch.getText().trim();
        currentData = roleGroupBUS.search(kw);
        sortData();
        refreshTable();
    }

    private void sortData() {
        if (currentData == null)
            return;
        currentData.sort((e1, e2) -> {
            String name1 = e1.getNameRoleGroup() != null ? e1.getNameRoleGroup() : "";
            String name2 = e2.getNameRoleGroup() != null ? e2.getNameRoleGroup() : "";
            return isAscendingSort ? name1.compareToIgnoreCase(name2) : name2.compareToIgnoreCase(name1);
        });
    }

    private void refreshTable() {
        tableModel.setRowCount(0);
        if (currentData == null || currentData.isEmpty()) {
            return;
        }
        // Đổ toàn bộ dữ liệu thay vì cắt theo trang
        for (RoleGroupDTO dto : currentData) {
            int userCount = roleGroupBUS.countUsers(dto.getRoleGroupID());
            String desc = getDescriptionForGroup(dto.getNameRoleGroup());
            tableModel.addRow(new Object[] { dto.getNameRoleGroup(), desc, userCount, dto.getRoleGroupID() });
        }
    }

    private String getDescriptionForGroup(String name) {
        if (name == null)
            return "";
        return switch (name.toUpperCase()) {
            case "ADMIN_GROUP" -> "Toàn quyền truy cập hệ thống và cấu hình lõi.";
            case "STAFF_GROUP" -> "Quản lý lịch trình bay, phân công tổ bay.";
            case "MANAGER_GROUP" -> "Xử lý đặt chỗ, thanh toán và hoàn vé.";
            case "CUSTOMER_GROUP" -> "Quyền truy cập hạn chế vào portal đặt vé.";
            default -> "Vai trò tùy chỉnh.";
        };
    }

    private void openDialog(RoleGroupDTO editDTO) {
        Frame parentFrame = (Frame) SwingUtilities.getWindowAncestor(this);
        RoleGroupDialog dlg = new RoleGroupDialog(parentFrame, editDTO);
        dlg.setVisible(true);
        if (dlg.isConfirmed())
            loadData();
    }

    private void deleteRoleGroup(String roleGroupID) {
        int opt = JOptionPane.showConfirmDialog(this, "Bạn có chắc chắn muốn xóa vai trò này?", "Xác nhận xóa",
                JOptionPane.YES_NO_OPTION, JOptionPane.WARNING_MESSAGE);
        if (opt == JOptionPane.YES_OPTION) {
            if (roleGroupBUS.delete(roleGroupID))
                loadData();
            else
                JOptionPane.showMessageDialog(this, "Xóa thất bại!", "Lỗi", JOptionPane.ERROR_MESSAGE);
        }
    }

    // ============ UI Helpers ============

    private JButton createPrimaryButton(String text) {
        JButton btn = new JButton(text) {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                Color bg = getModel().isPressed() ? AppColor.PRIMARY_ACTIVE
                        : getModel().isRollover() ? AppColor.PRIMARY_HOVER : AppColor.PRIMARY;
                g2.setColor(bg);
                g2.fill(new RoundRectangle2D.Float(0, 0, getWidth(), getHeight(), 10, 10));

                g2.setColor(Color.WHITE);
                g2.setFont(getFont());
                FontMetrics fm = g2.getFontMetrics();

                int totalWidth = fm.stringWidth(text);
                int startX = (getWidth() - totalWidth) / 2;

                Icon icon = getIcon();
                if (icon != null) {
                    int gap = getIconTextGap();
                    totalWidth += icon.getIconWidth() + gap;
                    startX = (getWidth() - totalWidth) / 2;
                    icon.paintIcon(this, g2, startX, (getHeight() - icon.getIconHeight()) / 2);
                    startX += icon.getIconWidth() + gap;
                }

                g2.drawString(text, startX, (getHeight() + fm.getAscent() - fm.getDescent()) / 2);
                g2.dispose();
            }
        };
        btn.setFont(new Font("Segoe UI", Font.BOLD, 13));
        btn.setPreferredSize(new Dimension(180, 40));
        btn.setBorderPainted(false);
        btn.setContentAreaFilled(false);
        btn.setFocusPainted(false);
        btn.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        return btn;
    }

    private JButton makeSecondaryButton(String text, Icon icon) {
        JButton btn = new JButton(text, icon) {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(Color.WHITE);
                g2.fillRoundRect(0, 0, getWidth(), getHeight(), 8, 8);
                g2.setColor(AppColor.BORDER);
                g2.drawRoundRect(0, 0, getWidth() - 1, getHeight() - 1, 8, 8);
                g2.dispose();
                super.paintComponent(g);
            }
        };
        btn.setFont(new Font("Segoe UI", Font.BOLD, 14));
        btn.setForeground(AppColor.TEXT_PRIMARY);
        btn.setContentAreaFilled(false);
        btn.setBorderPainted(false);
        btn.setCursor(new Cursor(Cursor.HAND_CURSOR));
        return btn;
    }

    private JMenuItem createMenuItem(String text) {
        JMenuItem item = new JMenuItem(text);
        item.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        item.setBackground(Color.WHITE);
        item.setForeground(AppColor.TEXT_PRIMARY);
        item.setBorder(new EmptyBorder(8, 15, 8, 15));
        item.setCursor(new Cursor(Cursor.HAND_CURSOR));
        return item;
    }

    // Badge renderer for user count
    class BadgeCellRenderer extends DefaultTableCellRenderer {
        @Override
        public Component getTableCellRendererComponent(JTable t, Object v, boolean sel, boolean foc, int r, int c) {
            JPanel p = new JPanel(new FlowLayout(FlowLayout.LEFT, 20, 16));
            p.setOpaque(true);
            p.setBackground(sel ? new Color(241, 245, 249) : (r % 2 == 0 ? ROW_EVEN : ROW_ODD));
            JLabel badge = new JLabel(String.valueOf(v), SwingConstants.CENTER) {
                @Override
                protected void paintComponent(Graphics g) {
                    Graphics2D g2 = (Graphics2D) g.create();
                    g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                    g2.setColor(new Color(219, 234, 254));
                    g2.fill(new RoundRectangle2D.Float(0, 0, getWidth(), getHeight(), 16, 16));
                    g2.dispose();
                    super.paintComponent(g);
                }
            };
            badge.setFont(new Font("Segoe UI", Font.BOLD, 12));
            badge.setForeground(AppColor.PRIMARY);
            badge.setOpaque(false);
            badge.setPreferredSize(new Dimension(48, 26));
            p.add(badge);
            return p;
        }
    }

    // ===== CUSTOM RENDERERS =====
    private static class ZebraRenderer extends DefaultTableCellRenderer {
        @Override
        public Component getTableCellRendererComponent(JTable t, Object v, boolean sel, boolean foc, int r, int c) {
            super.getTableCellRendererComponent(t, v, sel, foc, r, c);
            setFont(new Font("Segoe UI", Font.PLAIN, 14));
            setForeground(AppColor.TEXT_PRIMARY);
            setBorder(BorderFactory.createEmptyBorder(0, 20, 0, 10));
            setBackground(sel ? new Color(241, 245, 249) : (r % 2 == 0 ? ROW_EVEN : ROW_ODD));
            return this;
        }
    }

    private static class EditIcon implements Icon {
        private final Color color;

        public EditIcon(Color color) {
            this.color = color;
        }

        @Override
        public void paintIcon(Component c, Graphics g, int x, int y) {
            Graphics2D g2 = (Graphics2D) g.create();
            g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            g2.setColor(color);
            g2.translate(x, y);
            g2.setStroke(new BasicStroke(1.5f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND));
            g2.drawLine(4, 15, 7, 15);
            g2.drawLine(4, 15, 4, 12);
            g2.drawLine(4, 12, 12, 4);
            g2.drawLine(12, 4, 15, 7);
            g2.drawLine(15, 7, 7, 15);
            g2.drawLine(11, 5, 14, 8);
            g2.dispose();
        }

        @Override
        public int getIconWidth() {
            return 18;
        }

        @Override
        public int getIconHeight() {
            return 18;
        }
    }

    private static class DeleteIcon implements Icon {
        private final Color color;

        public DeleteIcon(Color color) {
            this.color = color;
        }

        @Override
        public void paintIcon(Component c, Graphics g, int x, int y) {
            Graphics2D g2 = (Graphics2D) g.create();
            g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            g2.setColor(color);
            g2.translate(x, y);
            g2.setStroke(new BasicStroke(1.5f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND));
            g2.drawRect(5, 6, 8, 10);
            g2.drawLine(3, 6, 15, 6);
            g2.drawLine(7, 4, 11, 4);
            g2.drawLine(7, 4, 7, 6);
            g2.drawLine(11, 4, 11, 6);
            g2.drawLine(7, 9, 7, 13);
            g2.drawLine(11, 9, 11, 13);
            g2.dispose();
        }

        @Override
        public int getIconWidth() {
            return 18;
        }

        @Override
        public int getIconHeight() {
            return 18;
        }
    }

    private class ActionRenderer extends DefaultTableCellRenderer {
        @Override
        public Component getTableCellRendererComponent(JTable t, Object v, boolean sel, boolean foc, int r, int c) {
            JPanel panel = new JPanel(new FlowLayout(FlowLayout.CENTER, 8, 14));
            panel.setOpaque(true);
            panel.setBackground(sel ? new Color(241, 245, 249) : (r % 2 == 0 ? ROW_EVEN : ROW_ODD));

            JButton btnEdit = new JButton(new EditIcon(AppColor.PRIMARY));
            btnEdit.setMargin(new Insets(0, 0, 0, 0));
            btnEdit.setBorder(null);
            btnEdit.setPreferredSize(new Dimension(24, 24));
            btnEdit.setBorderPainted(false);
            btnEdit.setContentAreaFilled(false);
            btnEdit.setFocusPainted(false);

            JButton btnDel = new JButton(new DeleteIcon(AppColor.TEXT_SECONDARY));
            btnDel.setMargin(new Insets(0, 0, 0, 0));
            btnDel.setBorder(null);
            btnDel.setPreferredSize(new Dimension(24, 24));
            btnDel.setBorderPainted(false);
            btnDel.setContentAreaFilled(false);
            btnDel.setFocusPainted(false);

            panel.add(btnEdit);
            panel.add(btnDel);
            return panel;
        }
    }

    private class ActionEditor extends AbstractCellEditor implements TableCellEditor {
        private final JPanel panel = new JPanel(new FlowLayout(FlowLayout.CENTER, 8, 14));
        private String roleGroupID;

        @Override
        public Component getTableCellEditorComponent(JTable t, Object v, boolean sel, int r, int c) {
            roleGroupID = (String) v;
            panel.removeAll();
            panel.setBackground(new Color(241, 245, 249));

            JButton btnEdit = makeIconBtn(new EditIcon(AppColor.PRIMARY));
            btnEdit.addActionListener(e -> {
                fireEditingStopped();
                RoleGroupDTO dto = roleGroupBUS.getByID(roleGroupID);
                if (dto != null)
                    openDialog(dto);
            });

            JButton btnDel = makeIconBtn(new DeleteIcon(AppColor.TEXT_SECONDARY));
            btnDel.addActionListener(e -> {
                fireEditingStopped();
                deleteRoleGroup(roleGroupID);
            });

            panel.add(btnEdit);
            panel.add(btnDel);
            return panel;
        }

        private JButton makeIconBtn(Icon baseIcon) {
            JButton b = new JButton(baseIcon);
            b.setMargin(new Insets(0, 0, 0, 0));
            b.setBorder(null);
            b.setPreferredSize(new Dimension(24, 24));
            b.setBorderPainted(false);
            b.setContentAreaFilled(false);
            b.setFocusPainted(false);
            b.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
            b.addMouseListener(new MouseAdapter() {
                @Override
                public void mouseEntered(MouseEvent e) {
                    b.setOpaque(true);
                    b.setBackground(new Color(226, 232, 240));
                }

                @Override
                public void mouseExited(MouseEvent e) {
                    b.setOpaque(false);
                    b.setBackground(new Color(0, 0, 0, 0));
                }
            });
            return b;
        }

        @Override
        public Object getCellEditorValue() {
            return roleGroupID;
        }
    }

    private static class SearchIcon implements Icon {
        @Override
        public void paintIcon(Component c, Graphics g, int x, int y) {
            Graphics2D g2 = (Graphics2D) g.create();
            g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            g2.setColor(AppColor.TEXT_SECONDARY);
            g2.translate(x, y);
            g2.setStroke(new BasicStroke(1.5f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND));
            g2.drawOval(4, 4, 8, 8);
            g2.drawLine(10, 10, 14, 14);
            g2.dispose();
        }

        @Override
        public int getIconWidth() {
            return 20;
        }

        @Override
        public int getIconHeight() {
            return 20;
        }
    }

    private static class RefreshIcon implements Icon {
        @Override
        public void paintIcon(Component c, Graphics g, int x, int y) {
            Graphics2D g2 = (Graphics2D) g.create();
            g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            g2.setColor(AppColor.TEXT_SECONDARY);
            g2.setStroke(new BasicStroke(1.5f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND));
            g2.drawArc(x + 3, y + 3, 10, 10, 0, -270);
            g2.drawPolyline(new int[] { x + 8, x + 11, x + 8 }, new int[] { y + 0, y + 3, y + 6 }, 3);
            g2.dispose();
        }

        @Override
        public int getIconWidth() {
            return 16;
        }

        @Override
        public int getIconHeight() {
            return 16;
        }
    }

    private static class PlusIcon implements Icon {
        @Override
        public void paintIcon(Component c, Graphics g, int x, int y) {
            Graphics2D g2 = (Graphics2D) g.create();
            g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            g2.setColor(Color.WHITE);
            g2.translate(x, y);
            g2.setStroke(new BasicStroke(1.8f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND));
            g2.drawLine(3, 8, 13, 8);
            g2.drawLine(8, 3, 8, 13);
            g2.dispose();
        }

        @Override
        public int getIconWidth() {
            return 16;
        }

        @Override
        public int getIconHeight() {
            return 16;
        }
    }
}