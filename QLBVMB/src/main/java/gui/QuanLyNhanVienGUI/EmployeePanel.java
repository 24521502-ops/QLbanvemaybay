package gui.QuanLyNhanVienGUI;

import dto.EmployeeDTO;
import util.AppColor;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import javax.swing.table.*;

import bus.QuanLyNhanVienBUS.EmployeeBUS;

import java.awt.*;
import java.awt.event.*;
import java.awt.geom.RoundRectangle2D;
import java.util.ArrayList;
import java.util.List;

public class EmployeePanel extends JPanel {

    private final EmployeeBUS employeeBUS = new EmployeeBUS();
    private JTable table;
    private DefaultTableModel tableModel;
    private JComboBox<String> cboFilterPosition;

    // Đã bỏ các biến phân trang, thêm biến lưu trạng thái sắp xếp
    private List<EmployeeDTO> allData = new ArrayList<>();
    private List<EmployeeDTO> currentData = new ArrayList<>();
    private JTextField txtSearch;
    private boolean isAscendingSort = true;
    private boolean isUpdatingFilters = false;

    // Dashboards
    private JLabel lblTotalEmp;
    private JLabel lblTotalRoles;
    private JLabel lblActiveManagers;

    public EmployeePanel() {
        setLayout(new BorderLayout(0, 0));
        setBackground(AppColor.BACKGROUND);
        setBorder(BorderFactory.createEmptyBorder(15, 36, 15, 36));
        initComponents();
        loadData();
    }

    private void initComponents() {
        // ===== HEADER =====
        JPanel headerPanel = new JPanel(new BorderLayout());
        headerPanel.setOpaque(false);
        headerPanel.setBorder(BorderFactory.createEmptyBorder(0, 0, 12, 0));

        JPanel titleBlock = new JPanel();
        titleBlock.setLayout(new BoxLayout(titleBlock, BoxLayout.Y_AXIS));
        titleBlock.setOpaque(false);
        JLabel titleLabel = new JLabel("Nhân viên");
        titleLabel.setFont(new Font("Segoe UI", Font.BOLD, 24));
        titleLabel.setForeground(AppColor.TEXT_PRIMARY);
        titleLabel.setAlignmentX(Component.LEFT_ALIGNMENT);
        JLabel subtitleLabel = new JLabel("Quản lý danh sách và thông tin nhân viên hệ thống.");
        subtitleLabel.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        subtitleLabel.setForeground(AppColor.TEXT_SECONDARY);
        subtitleLabel.setAlignmentX(Component.LEFT_ALIGNMENT);
        titleBlock.add(titleLabel);
        titleBlock.add(Box.createVerticalStrut(4));
        titleBlock.add(subtitleLabel);
        headerPanel.add(titleBlock, BorderLayout.WEST);

        // Nút Thêm nhân viên
        JButton btnAdd = createPrimaryButton("+ Thêm Nhân viên");
        btnAdd.addActionListener(e -> openAddDialog());
        JPanel btnPanel = new JPanel(new FlowLayout(FlowLayout.RIGHT, 0, 0));
        btnPanel.setOpaque(false);
        btnPanel.add(btnAdd);
        headerPanel.add(btnPanel, BorderLayout.EAST);

        add(headerPanel, BorderLayout.NORTH);

        // ===== CONTENT WRAPPER =====
        JPanel contentWrapper = new JPanel(new BorderLayout(0, 12));
        contentWrapper.setOpaque(false);

        // ===== DASHBOARD PANELS =====
        JPanel dashboardPanel = new JPanel(new GridLayout(1, 3, 20, 0));
        dashboardPanel.setOpaque(false);

        lblTotalEmp = new JLabel("0");
        lblTotalRoles = new JLabel("0");
        lblActiveManagers = new JLabel("0");

        dashboardPanel
                .add(createKpiCard("TỔNG NHÂN VIÊN", lblTotalEmp, new Color(59, 130, 246), new Color(239, 246, 255)));
        dashboardPanel.add(
                createKpiCard("VỊ TRÍ CÔNG VIỆC", lblTotalRoles, new Color(16, 185, 129), new Color(236, 253, 245)));
        dashboardPanel.add(createKpiCard("QUẢN LÝ & TRƯỞNG NHÓM", lblActiveManagers, new Color(245, 158, 11),
                new Color(254, 252, 232)));

        // ===== FILTER CARD =====
        JPanel filterCard = new JPanel(new BorderLayout()) {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(AppColor.SURFACE);
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

        // Search Field
        txtSearch = new JTextField();
        txtSearch.setPreferredSize(new Dimension(300, 42));
        txtSearch.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        txtSearch.putClientProperty("JTextField.placeholderText", "Tìm kiếm nhân viên...");
        txtSearch.putClientProperty("JTextField.leadingIcon", new SearchIcon());
        txtSearch.setBorder(BorderFactory.createCompoundBorder(
                BorderFactory.createLineBorder(AppColor.BORDER),
                new EmptyBorder(8, 12, 8, 12)));
        txtSearch.getDocument().addDocumentListener(new javax.swing.event.DocumentListener() {
            public void insertUpdate(javax.swing.event.DocumentEvent e) {
                applyFilters();
            }

            public void removeUpdate(javax.swing.event.DocumentEvent e) {
                applyFilters();
            }

            public void changedUpdate(javax.swing.event.DocumentEvent e) {
                applyFilters();
            }
        });

        // Position Filter
        cboFilterPosition = new JComboBox<>();
        cboFilterPosition.addItem("Tất cả chức vụ");
        cboFilterPosition.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        cboFilterPosition.setPreferredSize(new Dimension(180, 42));
        cboFilterPosition.setBackground(AppColor.SURFACE);
        cboFilterPosition.setRenderer(new DefaultListCellRenderer() {
            @Override
            public Component getListCellRendererComponent(JList<?> list, Object value, int index, boolean isSelected,
                    boolean cellHasFocus) {
                String display = (value == null) ? "" : value.toString();
                if (index == -1) {
                    if (display.equals("Tất cả chức vụ"))
                        display = "Chức vụ: Tất cả";
                    else
                        display = "Chức vụ: " + display;
                }
                return super.getListCellRendererComponent(list, display, index, isSelected, cellHasFocus);
            }
        });
        cboFilterPosition.addActionListener(e -> applyFilters());

        // Refresh Button
        JButton btnRefresh = makeSecondaryButton(" Làm mới", new RefreshIcon());
        btnRefresh.setPreferredSize(new Dimension(130, 42)); // Tăng size để chữ không bị che
        btnRefresh.addActionListener(e -> {
            isUpdatingFilters = true;
            txtSearch.setText("");
            cboFilterPosition.setSelectedIndex(0);
            isAscendingSort = true;
            isUpdatingFilters = false;
            loadData();
        });

        // Sort Dropdown Button
        JButton btnSort = makeSecondaryButton("Sắp xếp ▼", null);
        btnSort.setPreferredSize(new Dimension(120, 42));

        JPopupMenu sortMenu = new JPopupMenu();
        sortMenu.setBackground(Color.WHITE);
        sortMenu.setBorder(BorderFactory.createLineBorder(AppColor.BORDER));

        JMenuItem itemSortAsc = createMenuItem("Tên nhân viên (A - Z)");
        JMenuItem itemSortDesc = createMenuItem("Tên nhân viên (Z - A)");

        itemSortAsc.addActionListener(e -> {
            isAscendingSort = true;
            applyFilters();
        });

        itemSortDesc.addActionListener(e -> {
            isAscendingSort = false;
            applyFilters();
        });

        sortMenu.add(itemSortAsc);
        sortMenu.add(itemSortDesc);

        btnSort.addActionListener(e -> sortMenu.show(btnSort, 0, btnSort.getHeight() + 2));

        pnlLeftTools.add(txtSearch);
        pnlLeftTools.add(cboFilterPosition);
        pnlLeftTools.add(btnRefresh);
        pnlLeftTools.add(btnSort);

        filterCard.add(pnlLeftTools, BorderLayout.WEST);

        JPanel topWrapper = new JPanel(new BorderLayout(0, 8));
        topWrapper.setOpaque(false);
        topWrapper.add(dashboardPanel, BorderLayout.NORTH);
        topWrapper.add(filterCard, BorderLayout.SOUTH);

        contentWrapper.add(topWrapper, BorderLayout.NORTH);

        // ===== TABLE CARD =====
        JPanel tableCard = new JPanel(new BorderLayout(0, 0)) {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(AppColor.SURFACE);
                g2.fill(new RoundRectangle2D.Double(0, 0, getWidth(), getHeight(), 16, 16));
                g2.setColor(AppColor.BORDER);
                g2.draw(new RoundRectangle2D.Double(0.5, 0.5, getWidth() - 1, getHeight() - 1, 16, 16));
                g2.dispose();
            }
        };
        tableCard.setOpaque(false);
        tableCard.setBorder(BorderFactory.createEmptyBorder(10, 2, 10, 2));

        // ===== TABLE =====
        String[] columns = { "Tên nhân viên", "Chức vụ", "Số điện thoại", "Email", "Thao tác" };
        tableModel = new DefaultTableModel(columns, 0) {
            @Override
            public boolean isCellEditable(int row, int column) {
                return column == 4;
            }
        };
        table = new JTable(tableModel);
        table.setRowHeight(64);
        table.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        table.setShowHorizontalLines(true);
        table.setShowVerticalLines(false);
        table.setGridColor(new Color(243, 244, 246));
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
                if (c == 4) {
                    label.setBorder(BorderFactory.createEmptyBorder(0, 0, 0, 0));
                    label.setHorizontalAlignment(SwingConstants.CENTER);
                } else {
                    label.setBorder(BorderFactory.createEmptyBorder(0, 20, 0, 10));
                    label.setHorizontalAlignment(SwingConstants.LEFT);
                }
                return label;
            }
        });

        // Column Renderers
        table.getColumnModel().getColumn(0).setCellRenderer(new AvatarNameRenderer());
        table.getColumnModel().getColumn(0).setPreferredWidth(260);

        ZebraRenderer zebraRenderer = new ZebraRenderer();
        table.getColumnModel().getColumn(1).setCellRenderer(zebraRenderer);
        table.getColumnModel().getColumn(2).setCellRenderer(zebraRenderer);
        table.getColumnModel().getColumn(3).setCellRenderer(zebraRenderer);
        table.getColumnModel().getColumn(4).setCellRenderer(new ActionRenderer());

        table.getColumnModel().getColumn(1).setPreferredWidth(140);
        table.getColumnModel().getColumn(2).setPreferredWidth(120);
        table.getColumnModel().getColumn(3).setPreferredWidth(200);
        table.getColumnModel().getColumn(4).setPreferredWidth(100);

        table.getColumnModel().getColumn(4).setCellEditor(new ActionEditor());

        JScrollPane scrollPane = new JScrollPane(table);
        scrollPane.setBorder(BorderFactory.createEmptyBorder());
        scrollPane.getViewport().setBackground(AppColor.SURFACE);
        tableCard.add(scrollPane, BorderLayout.CENTER);

        // Đã xóa Pagination Panel

        contentWrapper.add(tableCard);
        add(contentWrapper, BorderLayout.CENTER);
    }

    private void loadData() {
        new SwingWorker<List<EmployeeDTO>, Void>() {
            List<String> positions;

            @Override
            protected List<EmployeeDTO> doInBackground() {
                try {
                    positions = employeeBUS.getAllPositions();
                    return employeeBUS.getAll();
                } catch (Exception e) {
                    System.err.println("Lỗi load dữ liệu nhân viên: " + e.getMessage());
                    e.printStackTrace();
                    return new ArrayList<>();
                }
            }

            @Override
            protected void done() {
                try {
                    allData = get();

                    // Cập nhật thống kê Dashboard
                    lblTotalEmp.setText(String.valueOf(allData.size()));
                    long rolesCount = allData.stream().map(EmployeeDTO::getPosition)
                            .filter(p -> p != null && !p.isEmpty()).distinct().count();
                    lblTotalRoles.setText(String.valueOf(rolesCount));
                    long managersCount = allData.stream().filter(e -> {
                        String p = e.getPosition();
                        return p != null && (p.toLowerCase().contains("quản lý") || p.toLowerCase().contains("admin")
                                || p.toLowerCase().contains("trưởng"));
                    }).count();
                    lblActiveManagers.setText(String.valueOf(managersCount));

                    isUpdatingFilters = true;
                    String selectedPos = (String) cboFilterPosition.getSelectedItem();
                    cboFilterPosition.removeAllItems();
                    cboFilterPosition.addItem("Tất cả chức vụ");
                    if (positions != null) {
                        for (String p : positions)
                            cboFilterPosition.addItem(p);
                    }
                    if (selectedPos != null && !selectedPos.equals("Tất cả chức vụ")) {
                        cboFilterPosition.setSelectedItem(selectedPos);
                    }
                    isUpdatingFilters = false;

                    applyFilters();
                } catch (Exception e) {
                    allData = new ArrayList<>();
                    applyFilters();
                    System.err.println("Lỗi hiển thị dữ liệu: " + e.getMessage());
                }
            }
        }.execute();
    }

    private void applyFilters() {
        if (isUpdatingFilters || allData == null)
            return;

        String searchText = txtSearch.getText().toLowerCase().trim();
        String selectedPos = (String) cboFilterPosition.getSelectedItem();

        currentData = new ArrayList<>();

        // 1. Filter
        for (EmployeeDTO emp : allData) {
            boolean matchSearch = searchText.isEmpty() ||
                    (emp.getFullName() != null && emp.getFullName().toLowerCase().contains(searchText)) ||
                    (emp.getPhone() != null && emp.getPhone().contains(searchText));

            boolean matchPos = selectedPos == null || "Tất cả chức vụ".equals(selectedPos) ||
                    (emp.getPosition() != null && emp.getPosition().equals(selectedPos));

            if (matchSearch && matchPos) {
                currentData.add(emp);
            }
        }

        // 2. Sort
        currentData.sort((e1, e2) -> {
            String name1 = e1.getFullName() != null ? e1.getFullName() : "";
            String name2 = e2.getFullName() != null ? e2.getFullName() : "";
            return isAscendingSort ? name1.compareToIgnoreCase(name2) : name2.compareToIgnoreCase(name1);
        });

        refreshTable();
    }

    private void refreshTable() {
        tableModel.setRowCount(0);
        if (currentData == null || currentData.isEmpty()) {
            return;
        }

        // Đổ toàn bộ dữ liệu để sử dụng cuộn dọc
        for (EmployeeDTO emp : currentData) {
            tableModel.addRow(new Object[] {
                    emp,
                    emp.getPosition() != null ? emp.getPosition() : "",
                    emp.getPhone() != null ? emp.getPhone() : "",
                    emp.getEmail() != null ? emp.getEmail() : "",
                    emp.getEmployeeID()
            });
        }
    }

    // ===== ACTIONS =====
    private void openAddDialog() {
        List<String> positions = employeeBUS.getAllPositions();
        EmployeeDialog dialog = new EmployeeDialog((Frame) SwingUtilities.getWindowAncestor(this), null, positions);
        dialog.setVisible(true);
        if (dialog.isConfirmed()) {
            EmployeeDTO emp = dialog.getEmployee();
            if (employeeBUS.add(emp)) {
                loadData();
                JOptionPane.showMessageDialog(this, "Thêm nhân viên thành công!", "Thành công",
                        JOptionPane.INFORMATION_MESSAGE);
            } else {
                JOptionPane.showMessageDialog(this, "Thêm nhân viên thất bại!", "Lỗi", JOptionPane.ERROR_MESSAGE);
            }
        }
    }

    private void openEditDialog(int row) {
        EmployeeDTO emp = (EmployeeDTO) tableModel.getValueAt(row, 0);
        List<String> positions = employeeBUS.getAllPositions();
        EmployeeDialog dialog = new EmployeeDialog((Frame) SwingUtilities.getWindowAncestor(this), emp, positions);
        dialog.setVisible(true);
        if (dialog.isConfirmed()) {
            EmployeeDTO updated = dialog.getEmployee();
            if (employeeBUS.update(updated)) {
                loadData();
                JOptionPane.showMessageDialog(this, "Cập nhật thành công!", "Thành công",
                        JOptionPane.INFORMATION_MESSAGE);
            } else {
                JOptionPane.showMessageDialog(this, "Cập nhật thất bại!", "Lỗi", JOptionPane.ERROR_MESSAGE);
            }
        }
    }

    private void deleteEmployee(int row) {
        EmployeeDTO emp = (EmployeeDTO) tableModel.getValueAt(row, 0);
        int confirm = JOptionPane.showConfirmDialog(this,
                "Bạn có chắc muốn xóa nhân viên \"" + emp.getFullName() + "\"?",
                "Xác nhận xóa", JOptionPane.YES_NO_OPTION, JOptionPane.WARNING_MESSAGE);
        if (confirm == JOptionPane.YES_OPTION) {
            if (employeeBUS.delete(emp.getEmployeeID())) {
                loadData();
                JOptionPane.showMessageDialog(this, "Xóa thành công!", "Thành công", JOptionPane.INFORMATION_MESSAGE);
            } else {
                JOptionPane.showMessageDialog(this, "Xóa thất bại!", "Lỗi", JOptionPane.ERROR_MESSAGE);
            }
        }
    }

    // ===== HELPER METHODS =====
    private JPanel createKpiCard(String title, JLabel lblValue, Color iconColor, Color iconBgColor) {
        JPanel card = new JPanel(new BorderLayout(16, 0)) {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(AppColor.SURFACE);
                g2.fill(new RoundRectangle2D.Double(0, 0, getWidth(), getHeight(), 16, 16));
                g2.setColor(AppColor.BORDER);
                g2.draw(new RoundRectangle2D.Double(0.5, 0.5, getWidth() - 1, getHeight() - 1, 16, 16));
                g2.dispose();
            }
        };
        card.setOpaque(false);
        card.setBorder(BorderFactory.createEmptyBorder(20, 16, 20, 16));

        JPanel textPanel = new JPanel(new GridLayout(2, 1, 0, 4));
        textPanel.setOpaque(false);

        JLabel lblTitle = new JLabel(title);
        lblTitle.setFont(new Font("Segoe UI", Font.BOLD, 11));
        lblTitle.setForeground(AppColor.TEXT_SECONDARY);

        lblValue.setFont(new Font("Segoe UI", Font.BOLD, 28));
        lblValue.setForeground(AppColor.TEXT_PRIMARY);

        textPanel.add(lblTitle);
        textPanel.add(lblValue);
        card.add(textPanel, BorderLayout.CENTER);

        JPanel iconPanel = new JPanel() {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(iconBgColor);
                g2.fillOval(0, 0, getWidth(), getHeight());
                g2.setColor(iconColor);
                g2.setStroke(new BasicStroke(2f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND));
                int w = getWidth(), h = getHeight();
                if (title.contains("NHÂN VIÊN")) {
                    g2.drawOval(w / 2 - 6, h / 2 - 10, 12, 12);
                    g2.drawArc(w / 2 - 12, h / 2 + 4, 24, 20, 0, 180);
                } else if (title.contains("VỊ TRÍ")) {
                    g2.drawRoundRect(w / 2 - 10, h / 2 - 4, 20, 14, 4, 4);
                    g2.drawArc(w / 2 - 5, h / 2 - 9, 10, 10, 0, 180);
                } else {
                    g2.drawOval(w / 2 - 10, h / 2 - 10, 20, 20);
                    g2.drawOval(w / 2 - 4, h / 2 - 4, 8, 8);
                }
                g2.dispose();
            }
        };
        iconPanel.setPreferredSize(new Dimension(56, 56));
        iconPanel.setOpaque(false);

        JPanel iconWrapper = new JPanel(new GridBagLayout());
        iconWrapper.setOpaque(false);
        iconWrapper.add(iconPanel);
        card.add(iconWrapper, BorderLayout.EAST);

        return card;
    }

    private JButton createPrimaryButton(String text) {
        JButton btn = new JButton(text) {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                Color bg = getModel().isPressed() ? AppColor.PRIMARY_ACTIVE
                        : getModel().isRollover() ? AppColor.PRIMARY_HOVER : AppColor.PRIMARY;
                g2.setColor(bg);
                g2.fillRoundRect(0, 0, getWidth(), getHeight(), 10, 10);
                g2.setColor(Color.WHITE);
                g2.setFont(getFont());
                FontMetrics fm = g2.getFontMetrics();
                g2.drawString(getText(), (getWidth() - fm.stringWidth(getText())) / 2,
                        (getHeight() + fm.getAscent() - fm.getDescent()) / 2);
                g2.dispose();
            }
        };
        btn.setFont(new Font("Segoe UI", Font.BOLD, 13));
        btn.setPreferredSize(new Dimension(180, 42));
        btn.setContentAreaFilled(false);
        btn.setBorderPainted(false);
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
                setBackground(r % 2 == 0 ? Color.WHITE : new Color(249, 250, 251));
            }
            return this;
        }
    }

    private static class AvatarNameRenderer extends DefaultTableCellRenderer {
        @Override
        public Component getTableCellRendererComponent(JTable t, Object v, boolean sel, boolean foc, int r, int c) {
            JPanel panel = new JPanel(new FlowLayout(FlowLayout.LEFT, 20, 14));
            panel.setOpaque(true);

            if (sel) {
                panel.setBackground(new Color(241, 245, 249));
            } else {
                panel.setBackground(r % 2 == 0 ? Color.WHITE : new Color(249, 250, 251));
            }

            if (v instanceof EmployeeDTO emp) {
                String name = emp.getFullName() != null ? emp.getFullName() : "N/A";
                String initials = getInitials(name);

                JLabel avatar = new JLabel(initials, SwingConstants.CENTER) {
                    @Override
                    protected void paintComponent(Graphics g) {
                        Graphics2D g2 = (Graphics2D) g.create();
                        g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                        g2.setColor(getAvatarColor(initials));
                        g2.fillOval(0, 0, getWidth(), getHeight());
                        g2.setColor(Color.WHITE);
                        g2.setFont(new Font("Segoe UI", Font.BOLD, 12));
                        FontMetrics fm = g2.getFontMetrics();
                        g2.drawString(initials, (getWidth() - fm.stringWidth(initials)) / 2,
                                (getHeight() + fm.getAscent() - fm.getDescent()) / 2);
                        g2.dispose();
                    }
                };
                avatar.setPreferredSize(new Dimension(36, 36));

                JLabel nameLabel = new JLabel(name);
                nameLabel.setFont(new Font("Segoe UI", Font.BOLD, 14));
                nameLabel.setForeground(AppColor.TEXT_PRIMARY);

                panel.add(avatar);
                panel.add(nameLabel);
            }
            return panel;
        }

        private String getInitials(String name) {
            String[] parts = name.trim().split("\\s+");
            if (parts.length >= 2) {
                return ("" + parts[0].charAt(0) + parts[parts.length - 1].charAt(0)).toUpperCase();
            }
            return name.substring(0, Math.min(2, name.length())).toUpperCase();
        }

        private Color getAvatarColor(String initials) {
            Color[] colors = {
                    new Color(14, 165, 233), new Color(16, 185, 129),
                    new Color(168, 85, 247), new Color(245, 158, 11),
                    new Color(239, 68, 68), new Color(6, 182, 212)
            };
            return colors[Math.abs(initials.hashCode()) % colors.length];
        }
    }

    private static class SearchIcon implements Icon {
        @Override
        public void paintIcon(Component c, Graphics g, int x, int y) {
            Graphics2D g2 = (Graphics2D) g.create();
            g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            g2.setColor(AppColor.TEXT_SECONDARY);
            g2.setStroke(new BasicStroke(1.5f));
            g2.drawOval(x + 4, y + 4, 8, 8);
            g2.drawLine(x + 10, y + 10, x + 14, y + 14);
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
            g2.drawArc(x + 2, y + 2, 12, 12, 50, 260);
            g2.drawPolyline(new int[] { x + 13, x + 13, x + 9 }, new int[] { y + 0, y + 4, y + 4 }, 3);
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
            if (sel) {
                panel.setBackground(new Color(241, 245, 249));
            } else {
                panel.setBackground(r % 2 == 0 ? Color.WHITE : new Color(249, 250, 251));
            }
            panel.add(new JLabel(new EditIcon(AppColor.PRIMARY)));
            panel.add(new JLabel(new DeleteIcon(AppColor.TEXT_SECONDARY)));
            return panel;
        }
    }

    private class ActionEditor extends AbstractCellEditor implements TableCellEditor {
        private final JPanel panel = new JPanel(new FlowLayout(FlowLayout.CENTER, 8, 14));
        private int editingRow;

        @Override
        public Component getTableCellEditorComponent(JTable t, Object v, boolean sel, int r, int c) {
            editingRow = r;
            panel.removeAll();
            panel.setBackground(new Color(241, 245, 249));

            JButton btnEdit = makeIconBtn(new EditIcon(AppColor.PRIMARY), AppColor.PRIMARY);
            btnEdit.addActionListener(e -> {
                fireEditingStopped();
                openEditDialog(editingRow);
            });

            JButton btnDel = makeIconBtn(new DeleteIcon(AppColor.TEXT_SECONDARY), AppColor.TEXT_SECONDARY);
            btnDel.addActionListener(e -> {
                fireEditingStopped();
                deleteEmployee(editingRow);
            });

            panel.add(btnEdit);
            panel.add(btnDel);
            return panel;
        }

        private JButton makeIconBtn(Icon baseIcon, Color hoverColor) {
            JButton b = new JButton(baseIcon);
            b.setBorderPainted(false);
            b.setContentAreaFilled(false);
            b.setFocusPainted(false);
            b.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));

            b.setPressedIcon(baseIcon);
            b.setMargin(new Insets(0, 0, 0, 0));
            b.setBorder(BorderFactory.createEmptyBorder());

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
            return "";
        }
    }
}