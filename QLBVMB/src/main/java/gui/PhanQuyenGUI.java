package gui;

import bus.RoleGroupBUS;
import dto.RoleGroupDTO;
import util.AppColor;

import javax.swing.*;
import javax.swing.table.*;
import java.awt.*;
import java.awt.event.*;
import java.awt.geom.RoundRectangle2D;
import java.util.List;

public class PhanQuyenGUI extends JPanel {

    private JTable table;
    private DefaultTableModel tableModel;
    private JTextField txtSearch;
    private JComboBox<String> cboSort;
    private javax.swing.Timer searchTimer;
    private final RoleGroupBUS roleGroupBUS = new RoleGroupBUS();
    private int currentPage = 1;
    private final int pageSize = 10;
    private List<RoleGroupDTO> currentData;
    private JLabel lblPageInfo;
    private JPanel paginationPanel;

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

        // ===== FILTER CARD =====
        JPanel filterCard = new JPanel() {
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
        filterCard.setLayout(new BoxLayout(filterCard, BoxLayout.X_AXIS));
        filterCard.setOpaque(false);
        filterCard.setBorder(BorderFactory.createEmptyBorder(12, 20, 12, 20));

        searchTimer = new javax.swing.Timer(300, e -> applyFilters());
        searchTimer.setRepeats(false);

        txtSearch = new JTextField();
        txtSearch.setPreferredSize(new Dimension(280, 36));
        txtSearch.setMaximumSize(new Dimension(280, 36));
        txtSearch.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        txtSearch.putClientProperty("JTextField.placeholderText", "Tìm kiếm vai trò...");
        txtSearch.putClientProperty("JTextField.leadingIcon", new SearchIcon());
        txtSearch.getDocument().addDocumentListener(new javax.swing.event.DocumentListener() {
            public void insertUpdate(javax.swing.event.DocumentEvent e) { searchTimer.restart(); }
            public void removeUpdate(javax.swing.event.DocumentEvent e) { searchTimer.restart(); }
            public void changedUpdate(javax.swing.event.DocumentEvent e) { searchTimer.restart(); }
        });
        filterCard.add(txtSearch);

        filterCard.add(Box.createHorizontalGlue());

        cboSort = new JComboBox<>(new String[] { "Sắp xếp: Tên (A-Z)", "Sắp xếp: Tên (Z-A)" });
        cboSort.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        cboSort.setPreferredSize(new Dimension(160, 36));
        cboSort.setMaximumSize(new Dimension(160, 36));
        cboSort.setBackground(Color.WHITE);
        cboSort.addActionListener(e -> {
            if (currentData != null) {
                sortData();
                currentPage = 1;
                refreshTable();
            }
        });
        filterCard.add(cboSort);

        filterCard.add(Box.createHorizontalStrut(12));

        JButton btnRefresh = new JButton(" Làm mới", new RefreshIcon());
        btnRefresh.setFont(new Font("Segoe UI", Font.BOLD, 13));
        btnRefresh.setForeground(AppColor.TEXT_SECONDARY);
        btnRefresh.setBackground(Color.WHITE);
        btnRefresh.setBorder(BorderFactory.createCompoundBorder(
                BorderFactory.createLineBorder(AppColor.BORDER),
                BorderFactory.createEmptyBorder(0, 12, 0, 12)));
        btnRefresh.setFocusPainted(false);
        btnRefresh.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        btnRefresh.setPreferredSize(new Dimension(110, 36));
        btnRefresh.setMaximumSize(new Dimension(110, 36));
        btnRefresh.addMouseListener(new MouseAdapter() {
            public void mouseEntered(MouseEvent e) { btnRefresh.setBackground(new Color(248, 250, 252)); }
            public void mouseExited(MouseEvent e) { btnRefresh.setBackground(Color.WHITE); }
        });
        btnRefresh.addActionListener(e -> {
            if (searchTimer != null) searchTimer.stop();
            txtSearch.setText("");
            cboSort.setSelectedIndex(0);
            loadData();
        });
        filterCard.add(btnRefresh);

        contentWrapper.add(filterCard, BorderLayout.NORTH);

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

        // Table

        // Table
        String[] cols = {"Tên vai trò", "Mô tả", "Số người dùng", "Thao tác"};
        tableModel = new DefaultTableModel(cols, 0) {
            @Override public boolean isCellEditable(int r, int c) { return c == 3; }
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

        // Remove header vertical lines by setting a custom renderer
        header.setDefaultRenderer(new DefaultTableCellRenderer() {
            @Override
            public Component getTableCellRendererComponent(JTable t, Object v, boolean sel, boolean foc, int r, int c) {
                JLabel label = (JLabel) super.getTableCellRendererComponent(t, v, sel, foc, r, c);
                label.setFont(new Font("Segoe UI", Font.BOLD, 12));
                label.setForeground(AppColor.TEXT_SECONDARY);
                label.setBackground(AppColor.SURFACE);
                if (c == 3) { // Action column
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

        // Col 0: Tên vai trò - Bold
        table.getColumnModel().getColumn(0).setCellRenderer(new DefaultTableCellRenderer() {
            @Override
            public Component getTableCellRendererComponent(JTable t, Object v, boolean sel, boolean foc, int r, int c) {
                super.getTableCellRendererComponent(t, v, sel, foc, r, c);
                setFont(new Font("Segoe UI", Font.BOLD, 14));
                setForeground(AppColor.TEXT_PRIMARY);
                setBorder(BorderFactory.createEmptyBorder(0, 20, 0, 10));
                if (sel) {
                    setBackground(new Color(241, 245, 249));
                } else {
                    setBackground(r % 2 == 0 ? ROW_EVEN : ROW_ODD);
                }
                return this;
            }
        });

        // Col 1: Mô tả - Plain
        table.getColumnModel().getColumn(1).setCellRenderer(zebraRenderer);

        // Col 2: Số người dùng - Badge
        table.getColumnModel().getColumn(2).setCellRenderer(new BadgeCellRenderer());

        // Col 3: Hành động
        table.getColumnModel().getColumn(3).setCellRenderer(new ActionRenderer());
        table.getColumnModel().getColumn(3).setCellEditor(new ActionEditor());

        JScrollPane scroll = new JScrollPane(table);
        scroll.setBorder(BorderFactory.createEmptyBorder());
        scroll.setViewportBorder(null);
        scroll.getViewport().setBackground(Color.WHITE);
        scroll.setBackground(Color.WHITE);
        tableCard.add(scroll, BorderLayout.CENTER);

        // Pagination
        paginationPanel = new JPanel(new BorderLayout());
        paginationPanel.setOpaque(false);
        paginationPanel.setBorder(BorderFactory.createEmptyBorder(12, 18, 10, 18));
        lblPageInfo = new JLabel();
        lblPageInfo.setFont(new Font("Segoe UI", Font.PLAIN, 12));
        lblPageInfo.setForeground(AppColor.TEXT_SECONDARY);
        paginationPanel.add(lblPageInfo, BorderLayout.WEST);

        JPanel pageButtons = new JPanel(new FlowLayout(FlowLayout.RIGHT, 4, 0));
        pageButtons.setOpaque(false);
        JButton btnPrev = createSmallButton("‹");
        btnPrev.addActionListener(e -> { if (currentPage > 1) { currentPage--; refreshTable(); } });
        JButton btnNext = createSmallButton("›");
        btnNext.addActionListener(e -> { int max = (int) Math.ceil((double) currentData.size() / pageSize); if (currentPage < max) { currentPage++; refreshTable(); } });
        pageButtons.add(btnPrev);
        pageButtons.add(btnNext);
        paginationPanel.add(pageButtons, BorderLayout.EAST);
        tableCard.add(paginationPanel, BorderLayout.SOUTH);

        contentWrapper.add(tableCard, BorderLayout.CENTER);
        add(contentWrapper, BorderLayout.CENTER);
    }

    private void loadData() {
        currentData = roleGroupBUS.getAll();
        currentPage = 1;
        refreshTable();
    }

    private void applyFilters() {
        if (currentData == null) return;
        String kw = txtSearch.getText().trim();
        currentData = roleGroupBUS.search(kw);
        sortData();
        currentPage = 1;
        refreshTable();
    }

    private void sortData() {
        if (currentData == null) return;
        boolean isAscending = cboSort.getSelectedIndex() == 0;
        currentData.sort((e1, e2) -> {
            String name1 = e1.getNameRoleGroup() != null ? e1.getNameRoleGroup() : "";
            String name2 = e2.getNameRoleGroup() != null ? e2.getNameRoleGroup() : "";
            return isAscending ? name1.compareToIgnoreCase(name2) : name2.compareToIgnoreCase(name1);
        });
    }

    private void refreshTable() {
        tableModel.setRowCount(0);
        if (currentData == null || currentData.isEmpty()) {
            lblPageInfo.setText("Không có dữ liệu");
            return;
        }
        int start = (currentPage - 1) * pageSize;
        int end = Math.min(start + pageSize, currentData.size());
        for (int i = start; i < end; i++) {
            RoleGroupDTO dto = currentData.get(i);
            int userCount = roleGroupBUS.countUsers(dto.getRoleGroupID());
            String desc = getDescriptionForGroup(dto.getNameRoleGroup());
            tableModel.addRow(new Object[]{dto.getNameRoleGroup(), desc, userCount, dto.getRoleGroupID()});
        }
        int totalPages = (int) Math.ceil((double) currentData.size() / pageSize);
        lblPageInfo.setText("Hiển thị " + (start + 1) + "-" + end + " / " + currentData.size() + " (Trang " + currentPage + "/" + totalPages + ")");
    }

    private String getDescriptionForGroup(String name) {
        if (name == null) return "";
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
        if (dlg.isConfirmed()) loadData();
    }

    private void deleteRoleGroup(String roleGroupID) {
        int opt = JOptionPane.showConfirmDialog(this, "Bạn có chắc chắn muốn xóa vai trò này?", "Xác nhận xóa", JOptionPane.YES_NO_OPTION, JOptionPane.WARNING_MESSAGE);
        if (opt == JOptionPane.YES_OPTION) {
            if (roleGroupBUS.delete(roleGroupID)) loadData();
            else JOptionPane.showMessageDialog(this, "Xóa thất bại!", "Lỗi", JOptionPane.ERROR_MESSAGE);
        }
    }

    // ============ UI Helpers ============

    private JButton createPrimaryButton(String text) {
        JButton btn = new JButton(text) {
            @Override protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                Color bg = getModel().isPressed() ? AppColor.PRIMARY_ACTIVE : getModel().isRollover() ? AppColor.PRIMARY_HOVER : AppColor.PRIMARY;
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
        btn.setBorderPainted(false); btn.setContentAreaFilled(false); btn.setFocusPainted(false);
        btn.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        return btn;
    }


    private JButton createSmallButton(String text) {
        JButton btn = new JButton(text) {
            @Override protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(getModel().isRollover() ? new Color(243, 244, 246) : Color.WHITE);
                g2.fill(new RoundRectangle2D.Float(0, 0, getWidth(), getHeight(), 8, 8));
                g2.setColor(AppColor.BORDER);
                g2.draw(new RoundRectangle2D.Float(0.5f, 0.5f, getWidth()-1, getHeight()-1, 8, 8));
                g2.setColor(AppColor.TEXT_PRIMARY);
                g2.setFont(new Font("Segoe UI", Font.BOLD, 18));
                FontMetrics fm = g2.getFontMetrics();
                g2.drawString(text, (getWidth() - fm.stringWidth(text)) / 2, (getHeight() + fm.getAscent() - fm.getDescent()) / 2);
                g2.dispose();
            }
        };
        btn.setPreferredSize(new Dimension(36, 36));
        btn.setBorderPainted(false); btn.setContentAreaFilled(false); btn.setFocusPainted(false);
        btn.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        return btn;
    }

    // Badge renderer for user count
    class BadgeCellRenderer extends DefaultTableCellRenderer {
        @Override public Component getTableCellRendererComponent(JTable t, Object v, boolean sel, boolean foc, int r, int c) {
            JPanel p = new JPanel(new FlowLayout(FlowLayout.LEFT, 20, 16));
            p.setOpaque(true);
            if (sel) {
                p.setBackground(new Color(241, 245, 249));
            } else {
                p.setBackground(r % 2 == 0 ? ROW_EVEN : ROW_ODD);
            }
            JLabel badge = new JLabel(String.valueOf(v), SwingConstants.CENTER) {
                @Override protected void paintComponent(Graphics g) {
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

            if (sel) {
                setBackground(new Color(241, 245, 249));
            } else {
                setBackground(r % 2 == 0 ? ROW_EVEN : ROW_ODD);
            }
            return this;
        }
    }

    private static class EditIcon implements Icon {
        private final Color color;
        public EditIcon(Color color) { this.color = color; }
        @Override public void paintIcon(Component c, Graphics g, int x, int y) {
            Graphics2D g2 = (Graphics2D) g.create();
            g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            g2.setColor(color);
            g2.translate(x, y);
            g2.setStroke(new BasicStroke(1.5f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND));
            // Pencil shape
            g2.drawLine(4, 15, 7, 15);
            g2.drawLine(4, 15, 4, 12);
            g2.drawLine(4, 12, 12, 4);
            g2.drawLine(12, 4, 15, 7);
            g2.drawLine(15, 7, 7, 15);
            // Eraser line
            g2.drawLine(11, 5, 14, 8);
            g2.dispose();
        }
        @Override public int getIconWidth() { return 18; }
        @Override public int getIconHeight() { return 18; }
    }

    private static class DeleteIcon implements Icon {
        private final Color color;
        public DeleteIcon(Color color) { this.color = color; }
        @Override public void paintIcon(Component c, Graphics g, int x, int y) {
            Graphics2D g2 = (Graphics2D) g.create();
            g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            g2.setColor(color);
            g2.translate(x, y);
            g2.setStroke(new BasicStroke(1.5f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND));
            // Trash bin
            g2.drawRect(5, 6, 8, 10);
            g2.drawLine(3, 6, 15, 6);
            g2.drawLine(7, 4, 11, 4);
            g2.drawLine(7, 4, 7, 6);
            g2.drawLine(11, 4, 11, 6);
            g2.drawLine(7, 9, 7, 13);
            g2.drawLine(11, 9, 11, 13);
            g2.dispose();
        }
        @Override public int getIconWidth() { return 18; }
        @Override public int getIconHeight() { return 18; }
    }

    private class ActionRenderer extends DefaultTableCellRenderer {
        @Override
        public Component getTableCellRendererComponent(JTable t, Object v, boolean sel, boolean foc, int r, int c) {
            JPanel panel = new JPanel(new FlowLayout(FlowLayout.CENTER, 8, 14));
            panel.setOpaque(true);
            if (sel) {
                panel.setBackground(new Color(241, 245, 249));
            } else {
                panel.setBackground(r % 2 == 0 ? ROW_EVEN : ROW_ODD);
            }
            JButton btnEdit = new JButton(new EditIcon(AppColor.PRIMARY));
            btnEdit.setMargin(new Insets(0, 0, 0, 0));
            btnEdit.setBorder(null);
            btnEdit.setPreferredSize(new Dimension(24, 24));
            btnEdit.setBorderPainted(false); btnEdit.setContentAreaFilled(false); btnEdit.setFocusPainted(false);
            
            JButton btnDel = new JButton(new DeleteIcon(AppColor.TEXT_SECONDARY));
            btnDel.setMargin(new Insets(0, 0, 0, 0));
            btnDel.setBorder(null);
            btnDel.setPreferredSize(new Dimension(24, 24));
            btnDel.setBorderPainted(false); btnDel.setContentAreaFilled(false); btnDel.setFocusPainted(false);

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
                if (dto != null) openDialog(dto);
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
            g2.drawOval(2, 2, 8, 8);
            g2.drawLine(8, 8, 12, 12);
            g2.dispose();
        }
        @Override public int getIconWidth() { return 16; }
        @Override public int getIconHeight() { return 16; }
    }

    private static class RefreshIcon implements Icon {
        @Override
        public void paintIcon(Component c, Graphics g, int x, int y) {
            Graphics2D g2 = (Graphics2D) g.create();
            g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            g2.setColor(AppColor.TEXT_SECONDARY);
            g2.setStroke(new BasicStroke(1.5f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND));
            
            // Vẽ vòng cung (hở góc trên bên phải)
            g2.drawArc(x + 3, y + 3, 10, 10, 0, -270);
            
            // Vẽ mũi tên ở điểm cuối (vị trí 12h) hướng sang phải
            g2.drawPolyline(new int[] { x + 8, x + 11, x + 8 }, new int[] { y + 0, y + 3, y + 6 }, 3);
            
            g2.dispose();
        }
        @Override public int getIconWidth() { return 16; }
        @Override public int getIconHeight() { return 16; }
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
        @Override public int getIconWidth() { return 16; }
        @Override public int getIconHeight() { return 16; }
    }
}
