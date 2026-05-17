package gui.QuanLyKhachHangGUI;

import java.awt.*;
import java.awt.event.*;
import java.util.ArrayList;
import java.util.List;
import javax.swing.*;
import javax.swing.border.EmptyBorder;
import javax.swing.table.*;

import bus.QuanLyKhachHangBUS.CustomerBUS;
import util.AppColor;

public class QuanLyKhachHangPanel extends JPanel {

    private DefaultTableModel tableModel;
    private JTable table;
    private JTextField txtSearch; // Đổi tên cho chuẩn đồng bộ
    private TableRowSorter<DefaultTableModel> rowSorter;
    private CustomerBUS customerBUS;

    // Màu Zebra chuẩn y hệt bản Quản lý Chuyến bay / Đặt chỗ
    private final Color ZEBRA_COLOR = new Color(252, 252, 253); 

    public QuanLyKhachHangPanel() {
        customerBUS = new CustomerBUS();
        initComponents();
        customizeTable();
        loadData();
    }

    private void initComponents() {
        setLayout(new BorderLayout(0, 20));
        setBackground(AppColor.BACKGROUND);
        setBorder(new EmptyBorder(30, 40, 30, 40));

        // ==========================================
        // 1. HEADER
        // ==========================================
        JPanel headerPanel = new JPanel(new BorderLayout());
        headerPanel.setOpaque(false);

        JPanel titlePanel = new JPanel();
        titlePanel.setLayout(new BoxLayout(titlePanel, BoxLayout.Y_AXIS));
        titlePanel.setOpaque(false);
        JLabel lblTitle = new JLabel("Khách hàng");
        lblTitle.setFont(new Font("Inter", Font.BOLD, 28));
        lblTitle.setForeground(AppColor.TEXT_PRIMARY);
        JLabel lblSub = new JLabel("Quản lý thông tin và liên hệ của tất cả hành khách.");
        lblSub.setFont(new Font("Inter", Font.PLAIN, 14));
        lblSub.setForeground(AppColor.TEXT_SECONDARY);
        titlePanel.add(lblTitle);
        titlePanel.add(Box.createVerticalStrut(5));
        titlePanel.add(lblSub);

        headerPanel.add(titlePanel, BorderLayout.WEST);

        // ==========================================
        // 2. TOOLBAR (ĐỒNG BỘ GIAO DIỆN XỊN)
        // ==========================================
        JPanel toolbarPanel = new JPanel(new BorderLayout());
        toolbarPanel.setOpaque(false);
        toolbarPanel.setBorder(new EmptyBorder(15, 0, 0, 0)); 

        // Nhóm công cụ bên Trái (WEST)
        JPanel pnlLeftTools = new JPanel(new FlowLayout(FlowLayout.LEFT, 12, 0));
        pnlLeftTools.setOpaque(false);

        // 2.1 Thanh tìm kiếm
        txtSearch = new JTextField();
        txtSearch.setFont(new Font("Inter", Font.PLAIN, 14));
        txtSearch.setPreferredSize(new Dimension(340, 42));
        txtSearch.setBorder(BorderFactory.createCompoundBorder(
            BorderFactory.createLineBorder(AppColor.BORDER), 
            new EmptyBorder(8, 12, 8, 12)
        ));
        txtSearch.putClientProperty("JTextField.placeholderText", "Nhập tên, email hoặc SĐT...");
        txtSearch.putClientProperty("JTextField.leadingIcon", new SearchIcon());
        txtSearch.putClientProperty("JComponent.roundRect", true);
        txtSearch.addKeyListener(new KeyAdapter() {
            @Override public void keyReleased(KeyEvent e) { applyFilter(); }
        });

        // 2.2 Nút Làm mới
        JButton btnRefresh = makeSecondaryButton("Làm mới");
        btnRefresh.setPreferredSize(new Dimension(110, 42));
        btnRefresh.addActionListener(e -> {
            txtSearch.setText("");
            rowSorter.setRowFilter(null);
            loadData();
            txtSearch.requestFocus();
        });

        // 2.3 Nút Sắp xếp xổ xuống (JPopupMenu)
        JButton btnSort = makeSecondaryButton("Sắp xếp ▼");
        btnSort.setPreferredSize(new Dimension(120, 42));
        
        JPopupMenu sortMenu = new JPopupMenu();
        sortMenu.setBackground(Color.WHITE);
        sortMenu.setBorder(BorderFactory.createLineBorder(AppColor.BORDER));

        JMenuItem itemSortDef = createMenuItem("Mã KH (Mới nhất)");
        JMenuItem itemSortOld = createMenuItem("Mã KH (Cũ nhất)");
        JMenuItem itemSortNameAsc = createMenuItem("Tên khách hàng (A - Z)");
        JMenuItem itemSortNameDesc = createMenuItem("Tên khách hàng (Z - A)");

        itemSortDef.addActionListener(e -> applySorting(0, SortOrder.DESCENDING));
        itemSortOld.addActionListener(e -> applySorting(0, SortOrder.ASCENDING));
        itemSortNameAsc.addActionListener(e -> applySorting(1, SortOrder.ASCENDING));
        itemSortNameDesc.addActionListener(e -> applySorting(1, SortOrder.DESCENDING));

        sortMenu.add(itemSortDef);
        sortMenu.add(itemSortOld);
        sortMenu.addSeparator();
        sortMenu.add(itemSortNameAsc);
        sortMenu.add(itemSortNameDesc);

        btnSort.addActionListener(e -> sortMenu.show(btnSort, 0, btnSort.getHeight() + 2));

        pnlLeftTools.add(txtSearch);
        pnlLeftTools.add(btnRefresh);
        pnlLeftTools.add(btnSort);

        // Nhóm thao tác bên Phải (EAST)
        JPanel pnlRightTools = new JPanel(new FlowLayout(FlowLayout.RIGHT, 0, 0));
        pnlRightTools.setOpaque(false);
        
        JButton btnAdd = makePrimaryButton("+ Thêm khách hàng");
        btnAdd.addActionListener(e -> {
            ThemKhachHangDialog dialog = new ThemKhachHangDialog((Frame) SwingUtilities.getWindowAncestor(this));
            dialog.setVisible(true);
            loadData();
            applyFilter();
        });
        pnlRightTools.add(btnAdd);

        toolbarPanel.add(pnlLeftTools, BorderLayout.WEST);
        toolbarPanel.add(pnlRightTools, BorderLayout.EAST);

        JPanel topPanel = new JPanel(new BorderLayout(0, 10));
        topPanel.setOpaque(false);
        topPanel.add(headerPanel, BorderLayout.NORTH);
        topPanel.add(toolbarPanel, BorderLayout.CENTER);
        add(topPanel, BorderLayout.NORTH);

        // ==========================================
        // 3. BẢNG DANH SÁCH
        // ==========================================
        JPanel panelTableCard = new JPanel(new BorderLayout());
        panelTableCard.setBackground(Color.WHITE);
        panelTableCard.setBorder(BorderFactory.createLineBorder(AppColor.BORDER));

        String[] cols = { "MÃ KH", "TÊN KHÁCH HÀNG", "EMAIL", "SỐ ĐIỆN THOẠI", "SỐ PASSPORT", "HÀNH ĐỘNG" };
        tableModel = new DefaultTableModel(cols, 0) {
            @Override public boolean isCellEditable(int r, int c) { return c == 5; }
        };

        table = new JTable(tableModel);
        rowSorter = new TableRowSorter<>(tableModel);
        table.setRowSorter(rowSorter);

        JScrollPane scrollPane = new JScrollPane(table);
        scrollPane.getViewport().setBackground(Color.WHITE);
        scrollPane.setBorder(BorderFactory.createEmptyBorder());
        panelTableCard.add(scrollPane, BorderLayout.CENTER);

        add(panelTableCard, BorderLayout.CENTER);
    }

    private void applyFilter() {
        String keyword = txtSearch.getText().trim();
        if (keyword.isEmpty()) {
            rowSorter.setRowFilter(null);
        } else {
            rowSorter.setRowFilter(RowFilter.regexFilter("(?iu)" + keyword, 1, 2, 3, 4));
        }
    }

    private void applySorting(int columnIndex, SortOrder order) {
        List<RowSorter.SortKey> sortKeys = new ArrayList<>();
        sortKeys.add(new RowSorter.SortKey(columnIndex, order));
        rowSorter.setSortKeys(sortKeys);
        rowSorter.sort();
    }

    private JMenuItem createMenuItem(String text) {
        JMenuItem item = new JMenuItem(text);
        item.setFont(new Font("Inter", Font.PLAIN, 13));
        item.setBackground(Color.WHITE);
        item.setForeground(AppColor.TEXT_PRIMARY);
        item.setBorder(new EmptyBorder(8, 15, 8, 15));
        item.setCursor(new Cursor(Cursor.HAND_CURSOR));
        return item;
    }

    private void loadData() {
        tableModel.setRowCount(0);
        List<Object[]> list = customerBUS.layDanhSachKhachHang();
        for (Object[] row : list) {
            tableModel.addRow(new Object[] { row[0], row[1], row[2], row[3], row[4], "" });
        }
    }

    /** Tìm và chọn hàng theo CustomerID - được gọi từ GlobalSearch */
    public void selectById(String customerId) {
        rowSorter.setRowFilter(null); // Xóa filter cũ để hiện hết dữ liệu
        for (int row = 0; row < tableModel.getRowCount(); row++) {
            Object val = tableModel.getValueAt(row, 0);
            if (val != null && customerId.equalsIgnoreCase(val.toString())) {
                int viewRow = table.convertRowIndexToView(row);
                if (viewRow >= 0) {
                    table.setRowSelectionInterval(viewRow, viewRow);
                    table.scrollRectToVisible(table.getCellRect(viewRow, 0, true));
                }
                return;
            }
        }
    }

    // ===============================================
    // LỘT XÁC BẢNG: ĐỒNG BỘ NGỰA VẰN VÀ ĐƯỜNG KẺ MẢNH
    // ===============================================
    private void customizeTable() {
        table.setRowHeight(60); // Tối ưu để vừa vặn cái hình Avatar tròn tròn
        table.setFont(new Font("Inter", Font.PLAIN, 14));
        
        // Tắt Grid mặc định
        table.setShowVerticalLines(false);
        table.setShowHorizontalLines(false);
        table.setIntercellSpacing(new Dimension(0, 0));
        table.setSelectionBackground(new Color(243, 244, 246));
        table.setSelectionForeground(AppColor.PRIMARY);

        JTableHeader header = table.getTableHeader();
        header.setPreferredSize(new Dimension(header.getWidth(), 48));
        header.setBackground(Color.WHITE);
        header.setBorder(BorderFactory.createMatteBorder(0, 0, 2, 0, AppColor.BORDER));

        DefaultTableCellRenderer headerRenderer = new DefaultTableCellRenderer() {
            @Override public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected, boolean hasFocus, int row, int column) {
                super.getTableCellRendererComponent(table, value, isSelected, hasFocus, row, column);
                setBorder(BorderFactory.createEmptyBorder(0, 15, 0, 15));
                setForeground(new Color(100, 116, 139));
                setFont(new Font("Inter", Font.BOLD, 12));
                setBackground(Color.WHITE);
                return this;
            }
        };
        for (int i = 0; i < table.getColumnModel().getColumnCount(); i++)
            table.getColumnModel().getColumn(i).setHeaderRenderer(headerRenderer);

        DefaultTableCellRenderer defaultRenderer = new DefaultTableCellRenderer() {
            @Override public Component getTableCellRendererComponent(JTable t, Object v, boolean s, boolean f, int r, int c) {
                super.getTableCellRendererComponent(t, v, s, f, r, c);
                setOpaque(true);
                
                // VẼ ĐƯỜNG VIỀN 1PX DƯỚI ĐÁY
                setBorder(BorderFactory.createCompoundBorder(
                    BorderFactory.createMatteBorder(0, 0, 1, 0, AppColor.BORDER),
                    new EmptyBorder(0, 15, 0, 15)
                ));
                
                if (!s) {
                    setBackground(r % 2 == 0 ? Color.WHITE : ZEBRA_COLOR);
                }

                setForeground(AppColor.TEXT_PRIMARY);
                if (c == 0) {
                    setFont(new Font("Inter", Font.BOLD, 14));
                } else {
                    setFont(new Font("Inter", Font.PLAIN, 14));
                }
                return this;
            }
        };

        table.getColumnModel().getColumn(0).setCellRenderer(defaultRenderer);
        table.getColumnModel().getColumn(2).setCellRenderer(defaultRenderer);
        table.getColumnModel().getColumn(3).setCellRenderer(defaultRenderer);
        table.getColumnModel().getColumn(4).setCellRenderer(defaultRenderer);

        table.getColumnModel().getColumn(1).setCellRenderer(new AvatarRenderer());
        table.getColumnModel().getColumn(5).setCellRenderer(new ActionRenderer());
        table.getColumnModel().getColumn(5).setCellEditor(new ActionEditor());

        table.getColumnModel().getColumn(0).setPreferredWidth(90);
        table.getColumnModel().getColumn(1).setPreferredWidth(260);
        table.getColumnModel().getColumn(2).setPreferredWidth(220);
        table.getColumnModel().getColumn(3).setPreferredWidth(130);
        table.getColumnModel().getColumn(4).setPreferredWidth(120);
        table.getColumnModel().getColumn(5).setPreferredWidth(100);
    }

    private JButton makePrimaryButton(String text) {
        JButton btn = new JButton(text) {
            @Override protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create(); g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(AppColor.PRIMARY); g2.fillRoundRect(0, 0, getWidth(), getHeight(), 8, 8); g2.dispose(); super.paintComponent(g);
            }
        };
        btn.setFont(new Font("Inter", Font.BOLD, 14)); btn.setForeground(Color.WHITE); btn.setContentAreaFilled(false); btn.setBorderPainted(false); btn.setCursor(new Cursor(Cursor.HAND_CURSOR)); btn.setPreferredSize(new Dimension(170, 42)); return btn;
    }

    private JButton makeSecondaryButton(String text) {
        JButton btn = new JButton(text) {
            @Override protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create(); g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(Color.WHITE); g2.fillRoundRect(0, 0, getWidth(), getHeight(), 8, 8);
                g2.setColor(AppColor.BORDER); g2.drawRoundRect(0, 0, getWidth() - 1, getHeight() - 1, 8, 8); g2.dispose(); super.paintComponent(g);
            }
        };
        btn.setFont(new Font("Inter", Font.BOLD, 13)); btn.setForeground(AppColor.TEXT_PRIMARY); btn.setContentAreaFilled(false); btn.setBorderPainted(false); btn.setCursor(new Cursor(Cursor.HAND_CURSOR)); return btn;
    }

    class AvatarRenderer extends JPanel implements TableCellRenderer {
        private String fullName = "";
        private String initials = "";
        private Color[] bgColors = { AppColor.INFO, AppColor.WARNING, AppColor.SUCCESS, AppColor.PRIMARY, new Color(167, 139, 250) };

        public AvatarRenderer() {
            setOpaque(true);
            setBorder(BorderFactory.createMatteBorder(0, 0, 1, 0, AppColor.BORDER)); // Kẻ đáy
        }

        @Override public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected, boolean hasFocus, int row, int column) {
            setBackground(isSelected ? table.getSelectionBackground() : (row % 2 == 0 ? Color.WHITE : ZEBRA_COLOR));
            if (value != null) {
                fullName = value.toString();
                String[] parts = fullName.trim().split("\\s+");
                if (parts.length >= 2) initials = (parts[0].substring(0, 1) + parts[parts.length - 1].substring(0, 1)).toUpperCase();
                else if (parts.length == 1 && !parts[0].isEmpty()) initials = parts[0].substring(0, 1).toUpperCase();
            }
            return this;
        }

        @Override protected void paintComponent(Graphics g) {
            super.paintComponent(g);
            if (fullName.isEmpty()) return;
            Graphics2D g2 = (Graphics2D) g.create();
            g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

            int circleSize = 36; // Thu gọn chút cho hợp dòng
            int x = 15, y = (getHeight() - circleSize) / 2; // Dời X về 15 cho thẳng lề
            int colorIndex = Math.abs(fullName.hashCode()) % bgColors.length;
            
            g2.setColor(bgColors[colorIndex]);
            g2.fillOval(x, y, circleSize, circleSize);

            g2.setColor(Color.WHITE);
            g2.setFont(new Font("Inter", Font.BOLD, 13));
            FontMetrics fm = g2.getFontMetrics();
            int stringWidth = fm.stringWidth(initials);
            g2.drawString(initials, x + (circleSize - stringWidth) / 2, y + ((circleSize - fm.getHeight()) / 2) + fm.getAscent());

            g2.setColor(AppColor.TEXT_PRIMARY);
            g2.setFont(new Font("Inter", Font.PLAIN, 14));
            g2.drawString(fullName, x + circleSize + 15, (getHeight() / 2) + 5);
            g2.dispose();
        }
    }

    class ActionRenderer extends JPanel implements TableCellRenderer {
        public ActionRenderer() { 
            setOpaque(true); 
            setBorder(BorderFactory.createMatteBorder(0, 0, 1, 0, AppColor.BORDER)); // Kẻ đáy
        }
        
        @Override public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected, boolean hasFocus, int row, int column) {
            setBackground(isSelected ? table.getSelectionBackground() : (row % 2 == 0 ? Color.WHITE : ZEBRA_COLOR));
            return this;
        }
        
        @Override protected void paintComponent(Graphics g) {
            super.paintComponent(g);
            Graphics2D g2 = (Graphics2D) g.create();
            g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            g2.setFont(new Font("Segoe UI Emoji", Font.PLAIN, 18));
            g2.setColor(new Color(100, 116, 139));
            g2.drawString("✏️", 15, (getHeight() / 2) + 6);
            g2.drawString("🗑️", 45, (getHeight() / 2) + 6);
            g2.dispose();
        }
    }

    class ActionEditor extends AbstractCellEditor implements TableCellEditor, MouseListener {
        private JPanel panel;
        private int currentRow;

        public ActionEditor() {
            panel = new ActionRenderer();
            panel.addMouseListener(this);
        }

        @Override public Component getTableCellEditorComponent(JTable table, Object value, boolean isSelected, int row, int column) {
            currentRow = row;
            panel.setBackground(table.getSelectionBackground());
            return panel;
        }

        @Override public Object getCellEditorValue() { return null; }

        @Override public void mouseClicked(MouseEvent e) {
            fireEditingStopped();
            int modelRow = table.convertRowIndexToModel(currentRow);
            String cusID = tableModel.getValueAt(modelRow, 0).toString();
            String name = tableModel.getValueAt(modelRow, 1).toString();
            String email = tableModel.getValueAt(modelRow, 2).toString();
            String phone = tableModel.getValueAt(modelRow, 3).toString();
            String passport = tableModel.getValueAt(modelRow, 4).toString();

            if (e.getX() >= 10 && e.getX() <= 35) {
                SuaKhachHangDialog editDialog = new SuaKhachHangDialog((Frame) SwingUtilities.getWindowAncestor(panel), cusID, name, phone, email, passport);
                editDialog.setVisible(true);
                loadData(); applyFilter();
            } else if (e.getX() >= 40 && e.getX() <= 65) {
                int confirm = JOptionPane.showConfirmDialog(panel, "Bạn có chắc chắn muốn xóa khách hàng " + name + "?", "Xác nhận xóa", JOptionPane.YES_NO_OPTION);
                if (confirm == JOptionPane.YES_OPTION) {
                    String result = customerBUS.xoaKhachHang(cusID);
                    if (result.equals("SUCCESS")) {
                        JOptionPane.showMessageDialog(panel, "Xóa khách hàng thành công!");
                        loadData(); applyFilter();
                    } else if (result.equals("CONSTRAINT_ERROR")) {
                        JOptionPane.showMessageDialog(panel, "KHÔNG THỂ XÓA!\nKhách hàng này đã từng mua vé hoặc có lịch sử giao dịch.", "Lỗi bảo vệ dữ liệu", JOptionPane.ERROR_MESSAGE);
                    } else {
                        JOptionPane.showMessageDialog(panel, "Xóa thất bại do lỗi hệ thống.", "Lỗi", JOptionPane.ERROR_MESSAGE);
                    }
                }
            }
        }

        @Override public void mousePressed(MouseEvent e) {} @Override public void mouseReleased(MouseEvent e) {} @Override public void mouseEntered(MouseEvent e) {} @Override public void mouseExited(MouseEvent e) {}
    }

    private static class SearchIcon implements Icon {
        @Override public void paintIcon(Component c, Graphics g, int x, int y) {
            Graphics2D g2 = (Graphics2D) g.create();
            g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            g2.setColor(new Color(148, 163, 184));
            g2.setStroke(new BasicStroke(1.5f));
            g2.drawOval(x + 4, y + 4, 8, 8);
            g2.drawLine(x + 10, y + 10, x + 14, y + 14);
            g2.dispose();
        }
        @Override public int getIconWidth() { return 20; }
        @Override public int getIconHeight() { return 20; }
    }

    public static void main(String[] args) {
        try { UIManager.setLookAndFeel(new com.formdev.flatlaf.FlatLightLaf()); } catch (Exception ex) { }
        SwingUtilities.invokeLater(() -> {
            JFrame frame = new JFrame("Demo Quản Lý Khách Hàng - TIU AIRLINES");
            frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            frame.setSize(1200, 800);
            frame.setLocationRelativeTo(null);
            frame.add(new QuanLyKhachHangPanel());
            frame.setVisible(true);
        });
    }
}