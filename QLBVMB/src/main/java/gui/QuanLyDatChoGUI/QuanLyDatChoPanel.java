package gui.QuanLyDatChoGUI;

import java.awt.*;
import java.awt.event.*;
import java.awt.geom.RoundRectangle2D;
import java.util.ArrayList;
import java.util.List;
import javax.swing.*;
import javax.swing.border.EmptyBorder;
import javax.swing.table.*;

import bus.QuanLyDatChoBUS.BookingBUS;
import util.AppColor;

public class QuanLyDatChoPanel extends JPanel {

    private DefaultTableModel tableModel;
    private JTable table;
    private JTextField txtTimKiem;
    private JComboBox<String> cbxSapXep;
    private TableRowSorter<DefaultTableModel> rowSorter;
    private BookingBUS bookingBUS;

    public QuanLyDatChoPanel() {
        bookingBUS = new BookingBUS();
        initComponents();
        customizeTable();
        loadRealData();
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
        JLabel lblTitle = new JLabel("Quản lý Đặt chỗ");
        lblTitle.setFont(new Font("Inter", Font.BOLD, 28));
        lblTitle.setForeground(AppColor.TEXT_PRIMARY);
        JLabel lblSub = new JLabel("Xem và quản lý tất cả các đặt chỗ trên hệ thống.");
        lblSub.setFont(new Font("Inter", Font.PLAIN, 14));
        lblSub.setForeground(AppColor.TEXT_SECONDARY);
        titlePanel.add(lblTitle);
        titlePanel.add(Box.createVerticalStrut(5));
        titlePanel.add(lblSub);

        headerPanel.add(titlePanel, BorderLayout.WEST);

        // ==========================================
        // 2. TOOLBAR
        // ==========================================
        JPanel toolbarPanel = new JPanel(new BorderLayout());
        toolbarPanel.setBackground(Color.WHITE);
        toolbarPanel.setBorder(BorderFactory.createCompoundBorder(
                BorderFactory.createLineBorder(AppColor.BORDER),
                new EmptyBorder(10, 15, 10, 15)));

        JPanel leftFilter = new JPanel(new FlowLayout(FlowLayout.LEFT, 15, 0));
        leftFilter.setOpaque(false);

        txtTimKiem = createTextField("Nhập mã, tên KH hoặc trạng thái...");
        txtTimKiem.setPreferredSize(new Dimension(300, 40));
        txtTimKiem.addKeyListener(new KeyAdapter() {
            @Override
            public void keyReleased(KeyEvent e) {
                applyFilter();
            }
        });

        cbxSapXep = new JComboBox<>(new String[] {
                "Sắp xếp mặc định", "Mã đặt chỗ (A - Z)", "Mã đặt chỗ (Z - A)",
                "Ngày đi (Gần nhất)", "Ngày đi (Xa nhất)", "Trạng thái (A - Z)"
        });
        cbxSapXep.setPreferredSize(new Dimension(170, 40));
        cbxSapXep.setBackground(Color.WHITE);
        cbxSapXep.setFont(new Font("Inter", Font.PLAIN, 13));
        cbxSapXep.addActionListener(e -> applySorting());

        JButton btnRefresh = makeSecondaryButton("Làm mới");
        btnRefresh.setPreferredSize(new Dimension(110, 40));
        btnRefresh.addActionListener(e -> {
            txtTimKiem.setText("");
            cbxSapXep.setSelectedIndex(0);
            loadRealData();
            applyFilter();
            applySorting();
        });

        leftFilter.add(createFilterGroup("TÌM KIẾM CHUNG", txtTimKiem));
        leftFilter.add(createFilterGroup("SẮP XẾP THEO", cbxSapXep));

        JPanel pnlBtnRefresh = new JPanel(new BorderLayout());
        pnlBtnRefresh.setOpaque(false);
        pnlBtnRefresh.setBorder(new EmptyBorder(22, 5, 0, 0));
        pnlBtnRefresh.add(btnRefresh, BorderLayout.CENTER);
        leftFilter.add(pnlBtnRefresh);

        JPanel rightAction = new JPanel(new FlowLayout(FlowLayout.RIGHT, 0, 0));
        rightAction.setOpaque(false);
        rightAction.setBorder(new EmptyBorder(22, 0, 0, 0));

        JButton btnAdd = makePrimaryButton("+ Thêm đặt chỗ");
        btnAdd.addActionListener(e -> {
            ThemDatChoDialog dialog = new ThemDatChoDialog((Frame) SwingUtilities.getWindowAncestor(this));
            dialog.setVisible(true);
            loadRealData();
            applyFilter();
        });
        rightAction.add(btnAdd);

        toolbarPanel.add(leftFilter, BorderLayout.WEST);
        toolbarPanel.add(rightAction, BorderLayout.EAST);

        JPanel topPanel = new JPanel(new BorderLayout(0, 20));
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

        String[] cols = { "MÃ ĐẶT CHỖ", "KHÁCH HÀNG", "CHẶNG BAY", "NGÀY ĐI", "TỔNG TIỀN", "TRẠNG THÁI", "THAO TÁC" };
        tableModel = new DefaultTableModel(cols, 0) {
            @Override
            public boolean isCellEditable(int r, int c) {
                return c == 6;
            }
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
        String keyword = txtTimKiem.getText().trim();
        if (keyword.isEmpty()) {
            rowSorter.setRowFilter(null);
        } else {
            rowSorter.setRowFilter(RowFilter.regexFilter("(?iu)" + keyword, 0, 1, 5));
        }
    }

    private void applySorting() {
        int index = cbxSapXep.getSelectedIndex();
        List<RowSorter.SortKey> sortKeys = new ArrayList<>();
        switch (index) {
            case 0:
                sortKeys.add(new RowSorter.SortKey(0, SortOrder.DESCENDING));
                break;
            case 1:
                sortKeys.add(new RowSorter.SortKey(0, SortOrder.ASCENDING));
                break;
            case 2:
                sortKeys.add(new RowSorter.SortKey(0, SortOrder.DESCENDING));
                break;
            case 3:
                sortKeys.add(new RowSorter.SortKey(3, SortOrder.ASCENDING));
                break;
            case 4:
                sortKeys.add(new RowSorter.SortKey(3, SortOrder.DESCENDING));
                break;
            case 5:
                sortKeys.add(new RowSorter.SortKey(5, SortOrder.ASCENDING));
                break;
        }
        rowSorter.setSortKeys(sortKeys);
        rowSorter.sort();
    }

    private void loadRealData() {
        tableModel.setRowCount(0);
        List<Object[]> listRaw = bookingBUS.layDanhSachDatCho();
        java.text.DecimalFormat formatter = new java.text.DecimalFormat("###,###,###");

        for (Object[] raw : listRaw) {
            String bookingID = (String) raw[0];
            String fullName = (String) raw[1];
            String email = (String) raw[2];
            String route = (String) raw[3];
            String flightInfo = raw[4] + " • " + raw[5];
            String date = (String) raw[6];

            Double totalAmount = null;
            if (raw[7] != null) {
                totalAmount = Double.valueOf(raw[7].toString());
            }
            // Dùng &nbsp; thay vì khoảng trắng để chữ VNĐ KHÔNG BAO GIỜ rớt xuống dòng
            String formattedMoney = (totalAmount != null && totalAmount > 0)
                    ? formatter.format(totalAmount) + "&nbsp;VNĐ"
                    : "0&nbsp;VNĐ";
            String status = (String) raw[8];

            String htmlKhachHang = "<html><b><font size='4' face='Inter'>" + fullName
                    + "</font></b><br><font color='#64748b' face='Inter'>" + email + "</font></html>";
            String htmlChangBay = "<html><b><font size='4' face='Inter'>" + route
                    + "</font></b><br><font color='#64748b' face='Inter'>" + flightInfo + "</font></html>";

            String htmlTongTien = "<html><b><font color='#0f172a' face='Inter'>" + formattedMoney
                    + "</font></b></html>";

            tableModel.addRow(new Object[] {
                    bookingID, htmlKhachHang, htmlChangBay, date, htmlTongTien, status, ""
            });
        }
    }

    private void customizeTable() {
        table.setRowHeight(75);
        table.setFont(new Font("Inter", Font.PLAIN, 14));
        table.setShowVerticalLines(false);
        table.setShowHorizontalLines(true);
        table.setGridColor(AppColor.BORDER);
        table.setSelectionBackground(new Color(248, 250, 252));
        table.setSelectionForeground(AppColor.TEXT_PRIMARY);

        JTableHeader header = table.getTableHeader();
        header.setPreferredSize(new Dimension(header.getWidth(), 45));
        header.setBackground(Color.WHITE);

        DefaultTableCellRenderer headerRenderer = new DefaultTableCellRenderer() {
            @Override
            public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected,
                    boolean hasFocus, int row, int column) {
                super.getTableCellRendererComponent(table, value, isSelected, hasFocus, row, column);
                setBorder(BorderFactory.createCompoundBorder(
                        BorderFactory.createMatteBorder(0, 0, 1, 0, AppColor.BORDER), new EmptyBorder(0, 20, 0, 20)));
                setForeground(new Color(100, 116, 139));
                setFont(new Font("Inter", Font.BOLD, 11));
                return this;
            }
        };
        for (int i = 0; i < table.getColumnModel().getColumnCount(); i++)
            table.getColumnModel().getColumn(i).setHeaderRenderer(headerRenderer);

        DefaultTableCellRenderer defaultRenderer = new DefaultTableCellRenderer() {
            @Override
            public Component getTableCellRendererComponent(JTable t, Object v, boolean s, boolean f, int r, int c) {
                super.getTableCellRendererComponent(t, v, s, f, r, c);
                setBorder(new EmptyBorder(0, 20, 0, 20));
                setForeground(AppColor.TEXT_PRIMARY);
                setFont(new Font("Inter", Font.PLAIN, 14));
                if (c == 0)
                    setFont(new Font("Inter", Font.BOLD, 14));
                return this;
            }
        };

        table.getColumnModel().getColumn(0).setCellRenderer(defaultRenderer);
        table.getColumnModel().getColumn(1).setCellRenderer(defaultRenderer);
        table.getColumnModel().getColumn(2).setCellRenderer(defaultRenderer);
        table.getColumnModel().getColumn(3).setCellRenderer(defaultRenderer);
        table.getColumnModel().getColumn(4).setCellRenderer(defaultRenderer);

        table.getColumnModel().getColumn(5).setCellRenderer(new BadgeRenderer());
        table.getColumnModel().getColumn(6).setCellRenderer(new ActionRenderer());
        table.getColumnModel().getColumn(6).setCellEditor(new ActionEditor());

        // ĐÃ FIX LỖI THẨM MỸ: Canh chỉnh lại Width cho cân đối nhất
        table.getColumnModel().getColumn(0).setPreferredWidth(110); // Đủ chỗ cho chữ MÃ ĐẶT CHỖ
        table.getColumnModel().getColumn(1).setPreferredWidth(210);
        table.getColumnModel().getColumn(2).setPreferredWidth(200);
        table.getColumnModel().getColumn(3).setPreferredWidth(140);
        table.getColumnModel().getColumn(4).setPreferredWidth(140); // Nới rộng cho số tiền dài
        table.getColumnModel().getColumn(5).setPreferredWidth(120);
        table.getColumnModel().getColumn(6).setPreferredWidth(90);
    }

    private JPanel createFilterGroup(String label, JComponent input) {
        JPanel p = new JPanel(new BorderLayout(0, 5));
        p.setOpaque(false);
        JLabel lbl = new JLabel(label);
        lbl.setFont(new Font("Inter", Font.BOLD, 10));
        lbl.setForeground(new Color(100, 116, 139));
        p.add(lbl, BorderLayout.NORTH);
        p.add(input, BorderLayout.CENTER);
        return p;
    }

    private JTextField createTextField(String placeholder) {
        JTextField txt = new JTextField();
        txt.setFont(new Font("Inter", Font.PLAIN, 13));
        txt.setPreferredSize(new Dimension(180, 40));
        txt.putClientProperty("JTextField.placeholderText", placeholder);
        txt.putClientProperty("JTextField.leadingIcon", new SearchIcon());
        return txt;
    }

    private JButton makePrimaryButton(String text) {
        JButton btn = new JButton(text) {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(AppColor.PRIMARY);
                g2.fillRoundRect(0, 0, getWidth(), getHeight(), 6, 6);
                g2.dispose();
                super.paintComponent(g);
            }
        };
        btn.setFont(new Font("Inter", Font.BOLD, 14));
        btn.setForeground(Color.WHITE);
        btn.setContentAreaFilled(false);
        btn.setBorderPainted(false);
        btn.setCursor(new Cursor(Cursor.HAND_CURSOR));
        btn.setPreferredSize(new Dimension(160, 42));
        return btn;
    }

    private JButton makeSecondaryButton(String text) {
        JButton btn = new JButton(text) {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(new Color(241, 245, 249));
                g2.fillRoundRect(0, 0, getWidth(), getHeight(), 6, 6);
                g2.setColor(AppColor.BORDER);
                g2.drawRoundRect(0, 0, getWidth() - 1, getHeight() - 1, 6, 6);
                g2.dispose();
                super.paintComponent(g);
            }
        };
        btn.setFont(new Font("Inter", Font.BOLD, 13));
        btn.setForeground(AppColor.TEXT_PRIMARY);
        btn.setContentAreaFilled(false);
        btn.setBorderPainted(false);
        btn.setCursor(new Cursor(Cursor.HAND_CURSOR));
        return btn;
    }

    class BadgeRenderer extends JPanel implements TableCellRenderer {
        private String text = "";
        private Color bgColor = Color.WHITE;
        private Color fgColor = Color.BLACK;

        public BadgeRenderer() {
            setOpaque(true);
        }

        @Override
        public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected, boolean hasFocus,
                int row, int column) {
            setBackground(isSelected ? table.getSelectionBackground() : Color.WHITE);
            if (value != null) {
                text = value.toString();
                if (text.equalsIgnoreCase("Đã xác nhận")) {
                    bgColor = new Color(219, 234, 254);
                    fgColor = new Color(30, 64, 175);
                } else if (text.equalsIgnoreCase("Chờ thanh toán")) {
                    bgColor = new Color(241, 245, 249);
                    fgColor = new Color(71, 85, 105);
                } else if (text.equalsIgnoreCase("Đã hủy")) {
                    bgColor = new Color(254, 226, 226);
                    fgColor = new Color(153, 27, 27);
                } else {
                    bgColor = new Color(243, 244, 246);
                    fgColor = new Color(75, 85, 99);
                }
            } else {
                text = "";
            }
            return this;
        }

        @Override
        protected void paintComponent(Graphics g) {
            super.paintComponent(g);
            if (text.isEmpty())
                return;
            Graphics2D g2 = (Graphics2D) g.create();
            g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            g2.setFont(new Font("Inter", Font.BOLD, 12));
            FontMetrics fm = g2.getFontMetrics();
            int paddingX = 14, paddingY = 6;
            int width = fm.stringWidth(text) + paddingX * 2;
            int height = fm.getHeight() + paddingY * 2;
            int x = 20;
            int y = (getHeight() - height) / 2;
            g2.setColor(bgColor);
            g2.fill(new RoundRectangle2D.Double(x, y, width, height, 15, 15));
            g2.setColor(fgColor);
            g2.drawString(text, x + paddingX, y + fm.getAscent() + paddingY - 1);
            g2.dispose();
        }
    }

    class ActionRenderer extends JPanel implements TableCellRenderer {
        public ActionRenderer() {
            setOpaque(true);
        }

        @Override
        public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected, boolean hasFocus,
                int row, int column) {
            setBackground(isSelected ? table.getSelectionBackground() : Color.WHITE);
            return this;
        }

        @Override
        protected void paintComponent(Graphics g) {
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

        @Override
        public Component getTableCellEditorComponent(JTable table, Object value, boolean isSelected, int row,
                int column) {
            currentRow = row;
            panel.setBackground(table.getSelectionBackground());
            return panel;
        }

        @Override
        public Object getCellEditorValue() {
            return null;
        }

        @Override
        public void mouseClicked(MouseEvent e) {
            fireEditingStopped();
            int modelRow = table.convertRowIndexToModel(currentRow);
            String bookingID = tableModel.getValueAt(modelRow, 0).toString();

            if (e.getX() >= 10 && e.getX() <= 35) {
                SuaDatChoDialog editDialog = new SuaDatChoDialog((Frame) SwingUtilities.getWindowAncestor(panel),
                        bookingID);
                editDialog.setVisible(true);
                loadRealData();
                applyFilter();
            } else if (e.getX() >= 40 && e.getX() <= 65) {
                int confirm = JOptionPane.showConfirmDialog(panel,
                        "Bạn có chắc chắn muốn HỦY đơn đặt chỗ " + bookingID
                                + " này không?\nHành động sẽ hủy toàn bộ vé bên trong đơn.",
                        "Xác nhận Hủy Đơn", JOptionPane.YES_NO_OPTION, JOptionPane.WARNING_MESSAGE);
                if (confirm == JOptionPane.YES_OPTION) {
                    boolean isCancelled = bookingBUS.huyDatCho(bookingID, "Khách yêu cầu hủy qua điện thoại");
                    if (isCancelled) {
                        JOptionPane.showMessageDialog(panel, "Đã Hủy đơn " + bookingID + " thành công!");
                        loadRealData();
                        applyFilter();
                    }
                }
            }
        }

        @Override
        public void mousePressed(MouseEvent e) {
        }

        @Override
        public void mouseReleased(MouseEvent e) {
        }

        @Override
        public void mouseEntered(MouseEvent e) {
        }

        @Override
        public void mouseExited(MouseEvent e) {
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

    public static void main(String[] args) {
        try {
            UIManager.setLookAndFeel(new com.formdev.flatlaf.FlatLightLaf());
        } catch (Exception ex) {
            System.err.println("Chưa cài FlatLaf, dùng giao diện mặc định của Java.");
        }

        SwingUtilities.invokeLater(() -> {
            JFrame frame = new JFrame("Demo Quản Lý Đặt Chỗ - TIU AIRLINES");
            frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            frame.setSize(1200, 800);
            frame.setLocationRelativeTo(null);

            frame.add(new QuanLyDatChoPanel());
            frame.setVisible(true);
        });
    }
}