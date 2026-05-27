package gui.QuanLyChuyenBayGUI;

import java.awt.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.swing.*;
import javax.swing.border.EmptyBorder;
import javax.swing.table.*;

import bus.QuanLyChuyenBayBUS.ChuyenBayBUS;
import util.AppColor;

public class QuanLyChuyenBayPanel extends JPanel {

    private ChuyenBayBUS chuyenBayBUS;
    private DefaultTableModel tableModel;
    private JTable table;
    private JLabel lblTotalCount, lblScheduledCount, lblDelayedCount;
    private JTextField txtSearch;

    public QuanLyChuyenBayPanel() {
        chuyenBayBUS = new ChuyenBayBUS();
        initComponents();
        customizeTable();
        loadDataToTable();
    }

    private void initComponents() {
        setLayout(new BorderLayout(0, 20));
        setBackground(AppColor.BACKGROUND);
        setBorder(new EmptyBorder(30, 40, 30, 40));

        // ── HEADER ──
        JPanel headerPanel = new JPanel(new BorderLayout(0, 20));
        headerPanel.setOpaque(false);

        JLabel lblTitle = new JLabel("QUẢN LÝ CHUYẾN BAY");
        lblTitle.setFont(new Font("Segoe UI", Font.BOLD, 26));
        lblTitle.setForeground(AppColor.TEXT_PRIMARY);
        headerPanel.add(lblTitle, BorderLayout.NORTH);

        // --- STATS CARDS ---
        JPanel statsPanel = new JPanel(new GridLayout(1, 3, 30, 0));
        statsPanel.setOpaque(false);
        statsPanel.setMaximumSize(new Dimension(Integer.MAX_VALUE, 120));

        lblTotalCount = new JLabel("0");
        lblScheduledCount = new JLabel("0");
        lblDelayedCount = new JLabel("0");

        statsPanel.add(createStatCard("TỔNG SỐ CHUYẾN BAY", lblTotalCount, AppColor.PRIMARY));
        statsPanel.add(createStatCard("ĐANG LÊN LỊCH", lblScheduledCount, AppColor.SUCCESS));
        statsPanel.add(createStatCard("BỊ CHẬM (DELAYED)", lblDelayedCount, AppColor.WARNING));
        headerPanel.add(statsPanel, BorderLayout.CENTER);

        // --- TOOL PANEL (Tìm kiếm + Làm mới + Sắp xếp Dropdown) ---
        JPanel toolPanel = new JPanel(new BorderLayout());
        toolPanel.setOpaque(false);

        txtSearch = new JTextField();
        txtSearch.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        txtSearch.setPreferredSize(new Dimension(300, 42));
        txtSearch.setBorder(BorderFactory.createCompoundBorder(
                BorderFactory.createLineBorder(AppColor.BORDER),
                new EmptyBorder(8, 12, 8, 12)));
        txtSearch.putClientProperty("JTextField.placeholderText", "Tìm kiếm chuyến bay...");
        txtSearch.putClientProperty("JTextField.leadingIcon", new SearchIcon());
        txtSearch.putClientProperty("JComponent.roundRect", true);
        txtSearch.getDocument().addDocumentListener(new javax.swing.event.DocumentListener() {
            public void insertUpdate(javax.swing.event.DocumentEvent e) {
                performSearch();
            }

            public void removeUpdate(javax.swing.event.DocumentEvent e) {
                performSearch();
            }

            public void changedUpdate(javax.swing.event.DocumentEvent e) {
                performSearch();
            }
        });

        // NÚT LÀM MỚI
        JButton btnRefresh = makeSecondaryButton("Làm mới");
        btnRefresh.setPreferredSize(new Dimension(130, 42));
        btnRefresh.addActionListener(e -> {
            txtSearch.setText("");
            @SuppressWarnings("unchecked")
            TableRowSorter<DefaultTableModel> sorter = (TableRowSorter<DefaultTableModel>) table.getRowSorter();
            if (sorter != null) {
                sorter.setRowFilter(null);
                sorter.setSortKeys(null);
            }
            loadDataToTable();
            txtSearch.requestFocus();
        });

        // ==========================================
        // NÚT SẮP XẾP XỔ XUỐNG (DROPDOWN MENU)
        // ==========================================
        JButton btnSort = makeSecondaryButton("Sắp xếp ▼");

        // Tạo Menu chứa các lựa chọn
        JPopupMenu sortMenu = new JPopupMenu();
        sortMenu.setBackground(AppColor.SURFACE);
        sortMenu.setBorder(BorderFactory.createLineBorder(AppColor.BORDER));

        // Các Item trong Menu
        JMenuItem itemTimeAsc = createMenuItem("Giờ khởi hành (Sớm nhất)");
        JMenuItem itemTimeDesc = createMenuItem("Giờ khởi hành (Muộn nhất)");
        JMenuItem itemFlightAsc = createMenuItem("Số hiệu chuyến bay (A-Z)");
        JMenuItem itemStatus = createMenuItem("Trạng thái chuyến bay");

        // Gắn hành động sắp xếp cho từng Item
        itemTimeAsc.addActionListener(e -> applySorting(2, SortOrder.ASCENDING));
        itemTimeDesc.addActionListener(e -> applySorting(2, SortOrder.DESCENDING));
        itemFlightAsc.addActionListener(e -> applySorting(0, SortOrder.ASCENDING));
        itemStatus.addActionListener(e -> applySorting(7, SortOrder.DESCENDING));

        // Thêm Item vào Menu
        sortMenu.add(itemTimeAsc);
        sortMenu.add(itemTimeDesc);
        sortMenu.addSeparator(); // Đường kẻ ngang phân cách cho đẹp
        sortMenu.add(itemFlightAsc);
        sortMenu.add(itemStatus);

        // Khi bấm vào nút Sắp xếp thì xổ Menu ra ngay bên dưới nút
        btnSort.addActionListener(e -> {
            sortMenu.show(btnSort, 0, btnSort.getHeight() + 2);
        });
        // ==========================================

        JPanel pnlSearchGroup = new JPanel(new FlowLayout(FlowLayout.LEFT, 12, 0));
        pnlSearchGroup.setOpaque(false);
        pnlSearchGroup.add(txtSearch);
        pnlSearchGroup.add(btnRefresh);
        pnlSearchGroup.add(btnSort);

        toolPanel.add(pnlSearchGroup, BorderLayout.WEST);

        JButton btnAdd = makePrimaryButton("+ Thêm chuyến bay");
        btnAdd.addActionListener(
                e -> new AddFlightDialog((Frame) SwingUtilities.getWindowAncestor(this), true, this).setVisible(true));
        toolPanel.add(btnAdd, BorderLayout.EAST);

        headerPanel.add(toolPanel, BorderLayout.SOUTH);
        add(headerPanel, BorderLayout.NORTH);

        // ── BẢNG DỮ LIỆU ──
        JPanel panelTableCard = new JPanel(new BorderLayout());
        panelTableCard.setBackground(AppColor.SURFACE);
        panelTableCard.setBorder(BorderFactory.createLineBorder(AppColor.BORDER));

        String[] cols = { "SỐ HIỆU", "HÀNH TRÌNH", "KHỞI HÀNH", "HẠ CÁNH", "TÀU BAY", "CỔNG", "BẢNG GIÁ", "TRẠNG THÁI", "ID_ẨN" };
        tableModel = new DefaultTableModel(cols, 0) {
            @Override
            public boolean isCellEditable(int r, int c) {
                return false;
            }
        };

        table = new JTable(tableModel);
        table.setAutoCreateRowSorter(true);
        table.getColumnModel().getColumn(8).setMinWidth(0);
        table.getColumnModel().getColumn(8).setMaxWidth(0);

        JScrollPane scrollPane = new JScrollPane(table);
        scrollPane.getViewport().setBackground(AppColor.SURFACE);
        scrollPane.setBorder(BorderFactory.createEmptyBorder());
        panelTableCard.add(scrollPane, BorderLayout.CENTER);

        add(panelTableCard, BorderLayout.CENTER);

        // ── FOOTER THAO TÁC ──
        JPanel footerPanel = new JPanel(new FlowLayout(FlowLayout.RIGHT, 15, 10));
        footerPanel.setOpaque(false);

        JButton btnEditInfo = makePrimaryButton("Sửa chuyến bay");
        JButton btnDelay = makePrimaryButton("Đánh dấu Delay");
        JButton btnCancel = makeDestructiveButton("Hủy chuyến bay");

        btnEditInfo.addActionListener(e -> {
            int row = table.getSelectedRow();
            if (row == -1) {
                JOptionPane.showMessageDialog(this, "Vui lòng chọn 1 chuyến bay!", "Thông báo", JOptionPane.WARNING_MESSAGE);
                return;
            }
            String status = table.getValueAt(row, 7).toString().toUpperCase();
            if (status.contains("CANCEL")) {
                JOptionPane.showMessageDialog(this, "Không thể sửa chuyến bay đã bị HỦY!", "Lỗi", JOptionPane.ERROR_MESSAGE);
                return;
            }
            String id = table.getValueAt(row, 8).toString();
            new UpdateFlightDialog((Frame) SwingUtilities.getWindowAncestor(this), true, this, id).setVisible(true);
        });

        btnCancel.addActionListener(e -> {
            int row = table.getSelectedRow();
            if (row == -1) {
                JOptionPane.showMessageDialog(this, "Vui lòng chọn 1 chuyến bay!", "Thông báo", JOptionPane.WARNING_MESSAGE);
                return;
            }
            String status = table.getValueAt(row, 7).toString().toUpperCase();
            if (status.contains("CANCEL")) {
                JOptionPane.showMessageDialog(this, "Chuyến bay này đã bị HỦY từ trước!", "Thông báo", JOptionPane.INFORMATION_MESSAGE);
                return;
            }
            String id = table.getValueAt(row, 8).toString();
            if (JOptionPane.showConfirmDialog(this, "Hủy chuyến bay này?\nCảnh báo: Hành động này sẽ hủy tất cả các vé thuộc chuyến bay.", "Xác nhận Hủy",
                    JOptionPane.YES_NO_OPTION, JOptionPane.WARNING_MESSAGE) == JOptionPane.YES_OPTION) {
                if (chuyenBayBUS.huyChuyenBay(id)) {
                    JOptionPane.showMessageDialog(this, "Hủy chuyến bay thành công!");
                    loadDataToTable();
                } else {
                    JOptionPane.showMessageDialog(this, "Hủy chuyến bay thất bại. Vui lòng kiểm tra lại hệ thống.", "Lỗi CSDL", JOptionPane.ERROR_MESSAGE);
                }
            }
        });

        btnDelay.addActionListener(e -> {
            int row = table.getSelectedRow();
            if (row == -1) {
                JOptionPane.showMessageDialog(this, "Vui lòng chọn 1 chuyến bay!", "Thông báo", JOptionPane.WARNING_MESSAGE);
                return;
            }
            String status = table.getValueAt(row, 7).toString().toUpperCase();
            if (status.contains("CANCEL")) {
                JOptionPane.showMessageDialog(this, "Không thể Delay một chuyến bay đã bị HỦY!", "Lỗi", JOptionPane.ERROR_MESSAGE);
                return;
            }
            if (status.contains("COMPLETED")) {
                JOptionPane.showMessageDialog(this, "Không thể Delay chuyến bay đã HOÀN THÀNH!", "Lỗi", JOptionPane.ERROR_MESSAGE);
                return;
            }
            String id = table.getValueAt(row, 8).toString();
            String flightNum = table.getValueAt(row, 0).toString();
            String displayTime = table.getValueAt(row, 2).toString();
            String formattedOldTime = "";
            try {
                java.util.Date dateObj = new SimpleDateFormat("HH:mm - dd/MM/yyyy").parse(displayTime);
                formattedOldTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(dateObj);
            } catch (Exception ex) {
            }
            showDelayDialog(id, flightNum, formattedOldTime);
        });

        footerPanel.add(btnEditInfo);
        footerPanel.add(btnDelay);
        footerPanel.add(btnCancel);
        add(footerPanel, BorderLayout.SOUTH);
    }

    // --- CÁC HÀM HỖ TRỢ MENU DROPDOWN SẮP XẾP ---
    private JMenuItem createMenuItem(String text) {
        JMenuItem item = new JMenuItem(text);
        item.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        item.setBackground(AppColor.SURFACE);
        item.setForeground(AppColor.TEXT_PRIMARY);
        item.setBorder(new EmptyBorder(8, 15, 8, 15));
        item.setCursor(new Cursor(Cursor.HAND_CURSOR));
        return item;
    }

    @SuppressWarnings("unchecked")
    private void applySorting(int columnIndex, SortOrder order) {
        TableRowSorter<DefaultTableModel> sorter = (TableRowSorter<DefaultTableModel>) table.getRowSorter();
        List<RowSorter.SortKey> sortKeys = new ArrayList<>();
        sortKeys.add(new RowSorter.SortKey(columnIndex, order));
        sorter.setSortKeys(sortKeys);
        sorter.sort();
    }

    // --- CÁC HÀM VẼ COMPONENT THEO BẢNG MÀU ---
    private JButton makePrimaryButton(String text) {
        JButton btn = new JButton(text) {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                GradientPaint gp = new GradientPaint(0, 0, AppColor.PRIMARY, getWidth(), getHeight(),
                        AppColor.PRIMARY_ACTIVE);
                g2.setPaint(gp);
                g2.fillRoundRect(0, 0, getWidth(), getHeight(), 10, 10);
                g2.dispose();
                super.paintComponent(g);
            }
        };
        btn.setFont(new Font("Segoe UI", Font.BOLD, 13));
        btn.setForeground(Color.WHITE);
        btn.setContentAreaFilled(false);
        btn.setBorderPainted(false);
        btn.setCursor(new Cursor(Cursor.HAND_CURSOR));
        btn.setPreferredSize(new Dimension(170, 42));
        return btn;
    }

    private JButton makeSecondaryButton(String text) {
        JButton btn = new JButton(text) {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(AppColor.SURFACE);
                g2.fillRoundRect(0, 0, getWidth(), getHeight(), 10, 10);
                g2.setColor(AppColor.BORDER);
                g2.drawRoundRect(0, 0, getWidth() - 1, getHeight() - 1, 10, 10);
                g2.dispose();
                super.paintComponent(g);
            }
        };
        btn.setFont(new Font("Segoe UI", Font.BOLD, 13));
        btn.setForeground(AppColor.TEXT_PRIMARY);
        btn.setContentAreaFilled(false);
        btn.setBorderPainted(false);
        btn.setCursor(new Cursor(Cursor.HAND_CURSOR));
        // Cho nút Sắp xếp to hơn một xíu để hiện mũi tên ▼ cho đẹp
        btn.setPreferredSize(new Dimension(120, 42));
        return btn;
    }

    private JButton makeDestructiveButton(String text) {
        JButton btn = new JButton(text) {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                GradientPaint gp = new GradientPaint(0, 0, AppColor.ERROR, getWidth(), getHeight(),
                        AppColor.ERROR_ACTIVE);
                g2.setPaint(gp);
                g2.fillRoundRect(0, 0, getWidth(), getHeight(), 10, 10);
                g2.dispose();
                super.paintComponent(g);
            }
        };
        btn.setFont(new Font("Segoe UI", Font.BOLD, 13));
        btn.setForeground(Color.WHITE);
        btn.setContentAreaFilled(false);
        btn.setBorderPainted(false);
        btn.setPreferredSize(new Dimension(170, 42));
        btn.setCursor(new Cursor(Cursor.HAND_CURSOR));
        return btn;
    }

    private JPanel createStatCard(String title, JLabel lblCount, Color themeColor) {
        JPanel card = new JPanel(new BorderLayout(0, 10));
        card.setBackground(AppColor.SURFACE);
        card.setBorder(BorderFactory.createCompoundBorder(
                BorderFactory.createMatteBorder(0, 5, 0, 0, themeColor),
                new EmptyBorder(20, 25, 20, 25)));

        JLabel lblT = new JLabel(title);
        lblT.setFont(new Font("Segoe UI", Font.BOLD, 12));
        lblT.setForeground(AppColor.TEXT_SECONDARY);

        lblCount.setFont(new Font("Segoe UI", Font.BOLD, 42));
        lblCount.setForeground(AppColor.TEXT_PRIMARY);

        card.add(lblT, BorderLayout.NORTH);
        card.add(lblCount, BorderLayout.CENTER);
        return card;
    }

    private void customizeTable() {
        table.setRowHeight(80);
        table.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        table.setShowVerticalLines(false);
        table.setGridColor(AppColor.BORDER);
        table.setSelectionBackground(new Color(243, 244, 246));
        table.setSelectionForeground(AppColor.PRIMARY);

        JTableHeader header = table.getTableHeader();
        header.setPreferredSize(new Dimension(header.getWidth(), 48));
        header.setBackground(AppColor.SURFACE);
        header.setBorder(BorderFactory.createMatteBorder(0, 0, 2, 0, AppColor.BORDER));

        DefaultTableCellRenderer headerRenderer = new DefaultTableCellRenderer() {
            @Override
            public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected,
                    boolean hasFocus, int row, int column) {
                super.getTableCellRendererComponent(table, value, isSelected, hasFocus, row, column);
                setBorder(BorderFactory.createEmptyBorder(0, 15, 0, 15));
                setForeground(AppColor.TEXT_SECONDARY);
                setFont(new Font("Segoe UI", Font.BOLD, 12));
                setBackground(AppColor.SURFACE);
                return this;
            }
        };
        for (int i = 0; i < table.getColumnModel().getColumnCount(); i++)
            table.getColumnModel().getColumn(i).setHeaderRenderer(headerRenderer);

        DefaultTableCellRenderer cellRenderer = new DefaultTableCellRenderer() {
            @Override
            public Component getTableCellRendererComponent(JTable t, Object val, boolean sel, boolean foc, int r,
                    int c) {
                super.getTableCellRendererComponent(t, val, sel, foc, r, c);
                setBorder(BorderFactory.createEmptyBorder(0, 15, 0, 15));
                if (!sel)
                    setBackground(r % 2 == 0 ? AppColor.SURFACE : new Color(252, 252, 253));

                if (c == 0 && val != null) {
                    setFont(new Font("Segoe UI", Font.BOLD, 14));
                    setForeground(AppColor.TEXT_PRIMARY);
                } else if (c == 7 && val != null) {
                    setFont(new Font("Segoe UI", Font.BOLD, 13));
                    String status = val.toString().toUpperCase();
                    if (status.contains("CANCEL"))
                        setForeground(AppColor.ERROR);
                    else if (status.contains("DELAY"))
                        setForeground(AppColor.WARNING);
                    else
                        setForeground(AppColor.SUCCESS);
                } else {
                    setFont(new Font("Segoe UI", Font.PLAIN, 14));
                    setForeground(AppColor.TEXT_PRIMARY);
                }
                return this;
            }
        };
        
        // Cấu hình độ rộng các cột
        TableColumnModel columnModel = table.getColumnModel();
        columnModel.getColumn(0).setPreferredWidth(70);  // SỐ HIỆU
        columnModel.getColumn(1).setPreferredWidth(90);  // HÀNH TRÌNH
        columnModel.getColumn(2).setPreferredWidth(150); // KHỞI HÀNH
        columnModel.getColumn(3).setPreferredWidth(150); // HẠ CÁNH
        columnModel.getColumn(4).setPreferredWidth(180); // TÀU BAY
        columnModel.getColumn(5).setPreferredWidth(50);  // CỔNG
        columnModel.getColumn(6).setPreferredWidth(160); // BẢNG GIÁ
        columnModel.getColumn(7).setPreferredWidth(110); // TRẠNG THÁI

        for (int i = 0; i < table.getColumnModel().getColumnCount() - 1; i++)
            table.getColumnModel().getColumn(i).setCellRenderer(cellRenderer);
    }

    public void loadDataToTable() {
        tableModel.setRowCount(0);
        List<Object[]> flights = chuyenBayBUS.layDanhSachChuyenBay();
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm - dd/MM/yyyy");
        int total = 0, scheduled = 0, delayed = 0;

        for (Object[] row : flights) {
            if (row[2] != null)
                row[2] = sdf.format(row[2]);
            if (row[3] != null)
                row[3] = sdf.format(row[3]);
            tableModel.addRow(row);
            total++;
            String status = row[7].toString().toUpperCase();
            if (status.contains("SCHEDULED"))
                scheduled++;
            if (status.contains("DELAY"))
                delayed++;
        }
        lblTotalCount.setText(String.valueOf(total));
        lblScheduledCount.setText(String.valueOf(scheduled));
        lblDelayedCount.setText(String.valueOf(delayed));
    }

    /** Tìm và chọn hàng theo FlightID (cột ẩn 7) - được gọi từ GlobalSearch */
    public void selectById(String flightId) {
        for (int row = 0; row < tableModel.getRowCount(); row++) {
            Object val = tableModel.getValueAt(row, 8);
            if (val != null && flightId.equalsIgnoreCase(val.toString())) {
                int viewRow = table.convertRowIndexToView(row);
                if (viewRow >= 0) {
                    table.setRowSelectionInterval(viewRow, viewRow);
                    table.scrollRectToVisible(table.getCellRect(viewRow, 0, true));
                }
                return;
            }
        }
    }

    @SuppressWarnings("unchecked")
    private void performSearch() {
        String text = txtSearch.getText().toLowerCase();
        TableRowSorter<DefaultTableModel> sorter = (TableRowSorter<DefaultTableModel>) table.getRowSorter();
        if (text.trim().length() == 0)
            sorter.setRowFilter(null);
        else
            sorter.setRowFilter(RowFilter.regexFilter("(?i)" + text, 0));
    }

    private void showDelayDialog(String flightID, String flightNum, String oldTimeStr) {
        JDialog dialog = new JDialog((Frame) SwingUtilities.getWindowAncestor(this), "Đánh dấu Delay", true);
        dialog.setSize(450, 320);
        dialog.setLocationRelativeTo(this);
        dialog.setLayout(new BorderLayout());
        dialog.getContentPane().setBackground(AppColor.SURFACE);

        JPanel body = new JPanel();
        body.setLayout(new BoxLayout(body, BoxLayout.Y_AXIS));
        body.setBackground(AppColor.SURFACE);
        body.setBorder(new EmptyBorder(30, 30, 30, 30));

        JLabel lblInfo = new JLabel("Chuyến bay: " + flightNum);
        lblInfo.setFont(new Font("Segoe UI", Font.BOLD, 16));
        lblInfo.setForeground(AppColor.PRIMARY);
        body.add(lblInfo);
        body.add(Box.createVerticalStrut(20));

        JLabel lblInput = new JLabel("Giờ khởi hành mới (yyyy-MM-dd HH:mm:ss):");
        lblInput.setFont(new Font("Segoe UI", Font.BOLD, 12));
        lblInput.setForeground(AppColor.TEXT_SECONDARY);
        body.add(lblInput);
        body.add(Box.createVerticalStrut(8));

        JTextField txtNewTime = new JTextField(oldTimeStr);
        txtNewTime.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        txtNewTime.setPreferredSize(new Dimension(0, 40));
        body.add(txtNewTime);

        dialog.add(body, BorderLayout.CENTER);

        JPanel footer = new JPanel(new FlowLayout(FlowLayout.RIGHT, 15, 15));
        footer.setBackground(AppColor.BACKGROUND);
        JButton btnSave = makePrimaryButton("Cập nhật giờ bay");
        btnSave.setPreferredSize(new Dimension(160, 40));
        btnSave.addActionListener(e -> {
            try {
                java.util.Date newTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(txtNewTime.getText());
                if (chuyenBayBUS.delayChuyenBay(flightID, newTime)) {
                    JOptionPane.showMessageDialog(dialog, "Đánh dấu Delay thành công!");
                    loadDataToTable();
                    dialog.dispose();
                } else {
                    JOptionPane.showMessageDialog(dialog, "Không thể Delay chuyến bay này!\nCó thể giờ bay mới không hợp lệ hoặc chuyến bay đã khởi hành.", "Lỗi", JOptionPane.ERROR_MESSAGE);
                }
            } catch (Exception ex) {
                JOptionPane.showMessageDialog(dialog, "Sai định dạng ngày giờ (yyyy-MM-dd HH:mm:ss)!", "Lỗi nhập liệu", JOptionPane.ERROR_MESSAGE);
            }
        });
        footer.add(btnSave);
        dialog.add(footer, BorderLayout.SOUTH);
        dialog.setVisible(true);
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

    public static void main(String[] args) {
        try {
            com.formdev.flatlaf.FlatLightLaf.setup();
        } catch (Exception e) {
        }
        SwingUtilities.invokeLater(() -> {
            JFrame frame = new JFrame("SkyManage - Quản lý Chuyến bay");
            frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            frame.setSize(1200, 800);
            frame.add(new QuanLyChuyenBayPanel());
            frame.setVisible(true);
        });
    }
}