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
    private final RoleGroupBUS roleGroupBUS = new RoleGroupBUS();
    private int currentPage = 1;
    private final int pageSize = 10;
    private List<RoleGroupDTO> currentData;
    private JLabel lblPageInfo;
    private JPanel paginationPanel;

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

        JButton btnAdd = createPrimaryButton("＋  Tạo vai trò mới");
        btnAdd.addActionListener(e -> openDialog(null));
        headerPanel.add(btnAdd, BorderLayout.EAST);
        add(headerPanel, BorderLayout.NORTH);

        // === CONTENT CARD ===
        JPanel cardPanel = new JPanel(new BorderLayout()) {
            @Override protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(Color.WHITE);
                g2.fill(new RoundRectangle2D.Float(0, 0, getWidth(), getHeight(), 16, 16));
                g2.dispose();
            }
        };
        cardPanel.setOpaque(false);
        cardPanel.setBorder(BorderFactory.createEmptyBorder(20, 20, 20, 20));

        // Search bar
        JPanel searchPanel = new JPanel(new BorderLayout(10, 0));
        searchPanel.setOpaque(false);
        searchPanel.setBorder(BorderFactory.createEmptyBorder(0, 0, 16, 0));

        txtSearch = new JTextField() {
            @Override protected void paintBorder(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(isFocusOwner() ? AppColor.PRIMARY : AppColor.BORDER);
                g2.drawRoundRect(0, 0, getWidth()-1, getHeight()-1, 10, 10);
                g2.dispose();
            }
        };
        txtSearch.setOpaque(false);
        txtSearch.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        txtSearch.setBorder(BorderFactory.createEmptyBorder(10, 36, 10, 14));
        txtSearch.setPreferredSize(new Dimension(400, 40));
        txtSearch.setText("🔍  Tìm kiếm vai trò...");
        txtSearch.setForeground(new Color(156, 163, 175));
        txtSearch.addFocusListener(new FocusAdapter() {
            @Override public void focusGained(FocusEvent e) {
                if (txtSearch.getForeground().equals(new Color(156, 163, 175))) {
                    txtSearch.setText(""); txtSearch.setForeground(AppColor.TEXT_PRIMARY);
                }
            }
            @Override public void focusLost(FocusEvent e) {
                if (txtSearch.getText().trim().isEmpty()) {
                    txtSearch.setText("🔍  Tìm kiếm vai trò...");
                    txtSearch.setForeground(new Color(156, 163, 175));
                }
            }
        });
        txtSearch.addKeyListener(new KeyAdapter() {
            @Override public void keyReleased(KeyEvent e) {
                String kw = txtSearch.getForeground().equals(new Color(156, 163, 175)) ? "" : txtSearch.getText().trim();
                currentData = roleGroupBUS.search(kw);
                currentPage = 1;
                refreshTable();
            }
        });
        searchPanel.add(txtSearch, BorderLayout.CENTER);

        JButton btnFilter = createOutlineButton("☰  Lọc");
        searchPanel.add(btnFilter, BorderLayout.EAST);
        cardPanel.add(searchPanel, BorderLayout.NORTH);

        // === Màu xen kẽ hàng ===
        final Color ROW_EVEN = Color.WHITE;
        final Color ROW_ODD = new Color(249, 250, 251); // #F9FAFB
        final Color ROW_BORDER = new Color(243, 244, 246); // #F3F4F6

        // Table
        String[] cols = {"Tên vai trò", "Mô tả", "Số người dùng", "Thao tác"};
        tableModel = new DefaultTableModel(cols, 0) {
            @Override public boolean isCellEditable(int r, int c) { return c == 3; }
        };
        table = new JTable(tableModel);
        table.setRowHeight(60);
        table.setShowGrid(false);
        table.setShowHorizontalLines(false);
        table.setShowVerticalLines(false);
        table.setIntercellSpacing(new Dimension(0, 0));
        table.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        table.setSelectionBackground(new Color(232, 244, 255));
        table.setSelectionForeground(AppColor.TEXT_PRIMARY);
        table.setFocusable(false);
        table.setBorder(null);

        // --- Header: chữ plain nhạt, nền trắng, không viền ---
        JTableHeader header = table.getTableHeader();
        header.setDefaultRenderer(new DefaultTableCellRenderer() {
            @Override public Component getTableCellRendererComponent(JTable t, Object v, boolean sel, boolean foc, int r, int c) {
                JLabel l = (JLabel) super.getTableCellRendererComponent(t, v, sel, foc, r, c);
                l.setFont(new Font("Segoe UI", Font.PLAIN, 13));
                l.setForeground(new Color(107, 114, 128)); // Gray 500
                l.setBackground(Color.WHITE);
                l.setBorder(BorderFactory.createCompoundBorder(
                    BorderFactory.createMatteBorder(0, 0, 1, 0, ROW_BORDER),
                    BorderFactory.createEmptyBorder(0, c == 0 ? 16 : 0, 0, 0)
                ));
                l.setHorizontalAlignment(c == 3 ? SwingConstants.RIGHT : SwingConstants.LEFT);
                return l;
            }
        });
        header.setPreferredSize(new Dimension(0, 44));
        header.setReorderingAllowed(false);
        header.setResizingAllowed(false);
        header.setBorder(null);

        // Column widths
        table.getColumnModel().getColumn(0).setPreferredWidth(180);
        table.getColumnModel().getColumn(1).setPreferredWidth(300);
        table.getColumnModel().getColumn(2).setPreferredWidth(120);
        table.getColumnModel().getColumn(3).setPreferredWidth(100);

        // Col 0: Tên vai trò - Bold, padding left
        table.getColumnModel().getColumn(0).setCellRenderer(new DefaultTableCellRenderer() {
            @Override public Component getTableCellRendererComponent(JTable t, Object v, boolean sel, boolean foc, int r, int c) {
                JLabel l = (JLabel) super.getTableCellRendererComponent(t, v, sel, foc, r, c);
                l.setFont(new Font("Segoe UI", Font.BOLD, 13));
                l.setForeground(AppColor.TEXT_PRIMARY);
                l.setOpaque(true);
                l.setBackground(sel ? t.getSelectionBackground() : (r % 2 == 0 ? ROW_EVEN : ROW_ODD));
                l.setBorder(BorderFactory.createCompoundBorder(
                    BorderFactory.createMatteBorder(0, 0, 1, 0, ROW_BORDER),
                    BorderFactory.createEmptyBorder(0, 16, 0, 0)
                ));
                return l;
            }
        });

        // Col 1: Mô tả - Plain, gray
        table.getColumnModel().getColumn(1).setCellRenderer(new DefaultTableCellRenderer() {
            @Override public Component getTableCellRendererComponent(JTable t, Object v, boolean sel, boolean foc, int r, int c) {
                JLabel l = (JLabel) super.getTableCellRendererComponent(t, v, sel, foc, r, c);
                l.setFont(new Font("Segoe UI", Font.PLAIN, 13));
                l.setForeground(AppColor.TEXT_SECONDARY);
                l.setOpaque(true);
                l.setBackground(sel ? t.getSelectionBackground() : (r % 2 == 0 ? ROW_EVEN : ROW_ODD));
                l.setBorder(BorderFactory.createMatteBorder(0, 0, 1, 0, ROW_BORDER));
                return l;
            }
        });

        // Col 2: Số người dùng - Badge
        table.getColumnModel().getColumn(2).setCellRenderer(new BadgeCellRenderer());

        // Col 3: Hành động
        table.getColumnModel().getColumn(3).setCellRenderer(new ActionCellRenderer());
        table.getColumnModel().getColumn(3).setCellEditor(new ActionCellEditor());

        JScrollPane scroll = new JScrollPane(table);
        scroll.setBorder(BorderFactory.createEmptyBorder());
        scroll.setViewportBorder(null);
        scroll.getViewport().setBackground(Color.WHITE);
        scroll.setBackground(Color.WHITE);
        cardPanel.add(scroll, BorderLayout.CENTER);

        // Pagination
        paginationPanel = new JPanel(new BorderLayout());
        paginationPanel.setOpaque(false);
        paginationPanel.setBorder(BorderFactory.createEmptyBorder(12, 0, 0, 0));
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
        cardPanel.add(paginationPanel, BorderLayout.SOUTH);

        add(cardPanel, BorderLayout.CENTER);
    }

    private void loadData() {
        currentData = roleGroupBUS.getAll();
        currentPage = 1;
        refreshTable();
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
        lblPageInfo.setText("Hiển thị " + (start + 1) + "-" + end + " trong số " + currentData.size() + " kết quả");
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
                g2.drawString(text, (getWidth() - fm.stringWidth(text)) / 2, (getHeight() + fm.getAscent() - fm.getDescent()) / 2);
                g2.dispose();
            }
        };
        btn.setFont(new Font("Segoe UI", Font.BOLD, 13));
        btn.setPreferredSize(new Dimension(180, 40));
        btn.setBorderPainted(false); btn.setContentAreaFilled(false); btn.setFocusPainted(false);
        btn.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        return btn;
    }

    private JButton createOutlineButton(String text) {
        JButton btn = new JButton(text) {
            @Override protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(getModel().isRollover() ? new Color(249, 250, 251) : Color.WHITE);
                g2.fill(new RoundRectangle2D.Float(0, 0, getWidth(), getHeight(), 10, 10));
                g2.setColor(AppColor.BORDER);
                g2.draw(new RoundRectangle2D.Float(0.5f, 0.5f, getWidth()-1, getHeight()-1, 10, 10));
                g2.setColor(AppColor.TEXT_PRIMARY);
                g2.setFont(getFont());
                FontMetrics fm = g2.getFontMetrics();
                g2.drawString(text, (getWidth() - fm.stringWidth(text)) / 2, (getHeight() + fm.getAscent() - fm.getDescent()) / 2);
                g2.dispose();
            }
        };
        btn.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        btn.setPreferredSize(new Dimension(80, 40));
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
                g2.setFont(new Font("Segoe UI", Font.BOLD, 16));
                FontMetrics fm = g2.getFontMetrics();
                g2.drawString(text, (getWidth() - fm.stringWidth(text)) / 2, (getHeight() + fm.getAscent() - fm.getDescent()) / 2);
                g2.dispose();
            }
        };
        btn.setPreferredSize(new Dimension(32, 32));
        btn.setBorderPainted(false); btn.setContentAreaFilled(false); btn.setFocusPainted(false);
        btn.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        return btn;
    }

    // Badge renderer for user count - với alternating row color
    class BadgeCellRenderer extends DefaultTableCellRenderer {
        private final Color ROW_EVEN = Color.WHITE;
        private final Color ROW_ODD = new Color(249, 250, 251);
        private final Color ROW_BORDER = new Color(243, 244, 246);

        @Override public Component getTableCellRendererComponent(JTable t, Object v, boolean sel, boolean foc, int r, int c) {
            JPanel p = new JPanel(new GridBagLayout());
            p.setOpaque(true);
            p.setBackground(sel ? t.getSelectionBackground() : (r % 2 == 0 ? ROW_EVEN : ROW_ODD));
            p.setBorder(BorderFactory.createMatteBorder(0, 0, 1, 0, ROW_BORDER));
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

    // Action buttons renderer - với alternating row color
    class ActionCellRenderer extends DefaultTableCellRenderer {
        private final Color ROW_EVEN = Color.WHITE;
        private final Color ROW_ODD = new Color(249, 250, 251);
        private final Color ROW_BORDER = new Color(243, 244, 246);

        @Override public Component getTableCellRendererComponent(JTable t, Object v, boolean sel, boolean foc, int r, int c) {
            JPanel p = new JPanel(new FlowLayout(FlowLayout.RIGHT, 12, 0));
            p.setOpaque(true);
            p.setBackground(sel ? t.getSelectionBackground() : (r % 2 == 0 ? ROW_EVEN : ROW_ODD));
            p.setBorder(BorderFactory.createCompoundBorder(
                BorderFactory.createMatteBorder(0, 0, 1, 0, ROW_BORDER),
                BorderFactory.createEmptyBorder(0, 0, 0, 8)
            ));
            JLabel edit = new JLabel("✏");
            edit.setFont(new Font("Segoe UI", Font.PLAIN, 16));
            edit.setForeground(AppColor.TEXT_SECONDARY);
            edit.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
            JLabel del = new JLabel("🗑");
            del.setFont(new Font("Segoe UI", Font.PLAIN, 16));
            del.setForeground(AppColor.TEXT_SECONDARY);
            del.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
            p.add(edit); p.add(del);
            return p;
        }
    }

    // Action buttons editor
    class ActionCellEditor extends AbstractCellEditor implements TableCellEditor {
        private JPanel panel;
        private String roleGroupID;

        @Override public Component getTableCellEditorComponent(JTable t, Object v, boolean sel, int r, int c) {
            roleGroupID = (String) v;
            Color rowBg = r % 2 == 0 ? Color.WHITE : new Color(249, 250, 251);
            panel = new JPanel(new FlowLayout(FlowLayout.RIGHT, 12, 0));
            panel.setBackground(rowBg);
            panel.setBorder(BorderFactory.createCompoundBorder(
                BorderFactory.createMatteBorder(0, 0, 1, 0, new Color(243, 244, 246)),
                BorderFactory.createEmptyBorder(0, 0, 0, 8)
            ));
            JButton btnEdit = new JButton("✏");
            btnEdit.setFont(new Font("Segoe UI", Font.PLAIN, 16));
            btnEdit.setBorderPainted(false); btnEdit.setContentAreaFilled(false); btnEdit.setFocusPainted(false);
            btnEdit.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
            btnEdit.addActionListener(e -> {
                fireEditingStopped();
                RoleGroupDTO dto = roleGroupBUS.getByID(roleGroupID);
                if (dto != null) openDialog(dto);
            });
            JButton btnDel = new JButton("🗑");
            btnDel.setFont(new Font("Segoe UI", Font.PLAIN, 16));
            btnDel.setBorderPainted(false); btnDel.setContentAreaFilled(false); btnDel.setFocusPainted(false);
            btnDel.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
            btnDel.addActionListener(e -> {
                fireEditingStopped();
                deleteRoleGroup(roleGroupID);
            });
            panel.add(btnEdit); panel.add(btnDel);
            return panel;
        }

        @Override public Object getCellEditorValue() { return roleGroupID; }
    }
}
