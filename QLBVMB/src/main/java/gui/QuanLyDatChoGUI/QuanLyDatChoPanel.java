package gui.QuanLyDatChoGUI;

import bus.QuanLyDatChoBUS.BookingBUS;
import java.awt.*;
import java.awt.event.*;
import java.awt.geom.RoundRectangle2D;
import java.util.ArrayList;
import java.util.List;
import javax.swing.*;
import javax.swing.border.EmptyBorder;
import javax.swing.table.*;
import util.AppColor; 

public class QuanLyDatChoPanel extends JPanel {

    private DefaultTableModel tableModel;
    private JTable table;
    private JTextField txtSearch; 
    private JLabel lblTotalBooking, lblConfirmedBooking, lblCancelledBooking;
    private TableRowSorter<DefaultTableModel> rowSorter; 
    private BookingBUS bookingBUS; 
    
    // Màu Zebra chuẩn y hệt bản Quản lý Chuyến bay / Quản lý Vé
    private final Color ZEBRA_COLOR = new Color(252, 252, 253); 

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
        lblTitle.setFont(new Font("Segoe UI", Font.BOLD, 28));
        lblTitle.setForeground(AppColor.TEXT_PRIMARY);
        JLabel lblSub = new JLabel("Xem và quản lý tất cả các đặt chỗ trên hệ thống.");
        lblSub.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        lblSub.setForeground(AppColor.TEXT_SECONDARY);
        titlePanel.add(lblTitle);
        titlePanel.add(Box.createVerticalStrut(5));
        titlePanel.add(lblSub);

        headerPanel.add(titlePanel, BorderLayout.WEST);

        // ==========================================
        // 2. THỐNG KÊ (STATS CARDS)
        // ==========================================
        JPanel statsPanel = new JPanel(new GridLayout(1, 3, 30, 0));
        statsPanel.setOpaque(false);
        statsPanel.setMaximumSize(new Dimension(Integer.MAX_VALUE, 120));
        statsPanel.setBorder(new EmptyBorder(15, 0, 5, 0));
        
        lblTotalBooking = new JLabel("0");
        lblConfirmedBooking = new JLabel("0");
        lblCancelledBooking = new JLabel("0");
        
        statsPanel.add(createClickableStatCard("TỔNG ĐƠN ĐẶT CHỖ", lblTotalBooking, AppColor.PRIMARY, "ALL"));
        statsPanel.add(createClickableStatCard("ĐÃ XÁC NHẬN", lblConfirmedBooking, AppColor.SUCCESS, "CONFIRMED"));
        statsPanel.add(createClickableStatCard("ĐÃ HỦY", lblCancelledBooking, AppColor.ERROR, "CANCELLED"));

        // ==========================================
        // 3. TOOLBAR 
        // ==========================================
        JPanel toolbarPanel = new JPanel(new BorderLayout());
        toolbarPanel.setOpaque(false);
        toolbarPanel.setBorder(new EmptyBorder(15, 0, 0, 0)); 

        // Nhóm công cụ bên Trái (WEST)
        JPanel pnlLeftTools = new JPanel(new FlowLayout(FlowLayout.LEFT, 12, 0));
        pnlLeftTools.setOpaque(false);

        txtSearch = new JTextField();
        txtSearch.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        txtSearch.setPreferredSize(new Dimension(340, 42));
        txtSearch.setBorder(BorderFactory.createCompoundBorder(
            BorderFactory.createLineBorder(AppColor.BORDER), 
            new EmptyBorder(8, 12, 8, 12)
        ));
        txtSearch.putClientProperty("JTextField.placeholderText", "Nhập mã đặt chỗ, tên KH hoặc trạng thái...");
        txtSearch.putClientProperty("JTextField.leadingIcon", new SearchIcon());
        txtSearch.putClientProperty("JComponent.roundRect", true);
        txtSearch.getDocument().addDocumentListener(new javax.swing.event.DocumentListener() {
            public void insertUpdate(javax.swing.event.DocumentEvent e) { applyFilter(); }
            public void removeUpdate(javax.swing.event.DocumentEvent e) { applyFilter(); }
            public void changedUpdate(javax.swing.event.DocumentEvent e) { applyFilter(); }
        });

        JButton btnRefresh = makeSecondaryButton("Làm mới"); 
        btnRefresh.setPreferredSize(new Dimension(130, 42));
        btnRefresh.addActionListener(e -> {
            txtSearch.setText(""); 
            if (rowSorter != null) {
                rowSorter.setRowFilter(null);
                rowSorter.setSortKeys(null);
            }
            loadRealData(); 
            txtSearch.requestFocus();
        });

        JButton btnSort = makeSecondaryButton("Sắp xếp ▼");
        btnSort.setPreferredSize(new Dimension(120, 42));
        
        JPopupMenu sortMenu = new JPopupMenu();
        sortMenu.setBackground(Color.WHITE);
        sortMenu.setBorder(BorderFactory.createLineBorder(AppColor.BORDER));

        JMenuItem itemSortDef = createMenuItem("Mã đặt chỗ (Mới nhất)");
        JMenuItem itemSortIdAsc = createMenuItem("Mã đặt chỗ (A - Z)");
        JMenuItem itemSortDateAsc = createMenuItem("Ngày đi (Gần nhất)");
        JMenuItem itemSortDateDesc = createMenuItem("Ngày đi (Xa nhất)");
        JMenuItem itemSortStatus = createMenuItem("Trạng thái (A - Z)");

        itemSortDef.addActionListener(e -> applySorting(0, SortOrder.DESCENDING));
        itemSortIdAsc.addActionListener(e -> applySorting(0, SortOrder.ASCENDING));
        itemSortDateAsc.addActionListener(e -> applySorting(3, SortOrder.ASCENDING));
        itemSortDateDesc.addActionListener(e -> applySorting(3, SortOrder.DESCENDING));
        itemSortStatus.addActionListener(e -> applySorting(5, SortOrder.ASCENDING));

        sortMenu.add(itemSortDef);
        sortMenu.add(itemSortIdAsc);
        sortMenu.addSeparator();
        sortMenu.add(itemSortDateAsc);
        sortMenu.add(itemSortDateDesc);
        sortMenu.addSeparator();
        sortMenu.add(itemSortStatus);

        btnSort.addActionListener(e -> sortMenu.show(btnSort, 0, btnSort.getHeight() + 2));

        pnlLeftTools.add(txtSearch);
        pnlLeftTools.add(btnRefresh);
        pnlLeftTools.add(btnSort);

        // Nhóm thao tác bên Phải (EAST)
        JPanel pnlRightTools = new JPanel(new FlowLayout(FlowLayout.RIGHT, 0, 0));
        pnlRightTools.setOpaque(false);
        
        JButton btnAdd = makePrimaryButton("+ Thêm đặt chỗ");
        btnAdd.addActionListener(e -> {
            // Lưu ý: Nếu báo lỗi ở dialog này thì chỉnh lại tên package/import cho khớp code cũ của bạn nhé
            ThemDatChoDialog dialog = new ThemDatChoDialog((Frame) SwingUtilities.getWindowAncestor(this));
            dialog.setVisible(true);
            loadRealData(); applyFilter();
        });
        pnlRightTools.add(btnAdd);

        toolbarPanel.add(pnlLeftTools, BorderLayout.WEST);
        toolbarPanel.add(pnlRightTools, BorderLayout.EAST);

        // Gộp Header, Stats và Toolbar lại
        JPanel topPanel = new JPanel(new BorderLayout(0, 5));
        topPanel.setOpaque(false);
        topPanel.add(headerPanel, BorderLayout.NORTH);
        topPanel.add(statsPanel, BorderLayout.CENTER);
        topPanel.add(toolbarPanel, BorderLayout.SOUTH);
        add(topPanel, BorderLayout.NORTH);

        // ==========================================
        // 4. BẢNG DANH SÁCH 
        // ==========================================
        JPanel panelTableCard = new JPanel(new BorderLayout());
        panelTableCard.setBackground(Color.WHITE);
        panelTableCard.setBorder(BorderFactory.createLineBorder(AppColor.BORDER));

        String[] cols = {"MÃ ĐẶT CHỖ", "KHÁCH HÀNG", "CHẶNG BAY", "NGÀY ĐI", "TỔNG TIỀN", "TRẠNG THÁI", "THAO TÁC"};
        tableModel = new DefaultTableModel(cols, 0) {
            @Override public boolean isCellEditable(int r, int c) { return c == 6; } 
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
            rowSorter.setRowFilter(RowFilter.regexFilter("(?iu)" + keyword, 0, 1, 5));
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
        item.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        item.setBackground(Color.WHITE);
        item.setForeground(AppColor.TEXT_PRIMARY);
        item.setBorder(new EmptyBorder(8, 15, 8, 15));
        item.setCursor(new Cursor(Cursor.HAND_CURSOR));
        return item;
    }

    private JPanel createClickableStatCard(String title, JLabel lblCount, Color themeColor, String filterType) {
        JPanel card = new JPanel(new BorderLayout(0, 10));
        card.setBackground(Color.WHITE);
        card.setBorder(BorderFactory.createCompoundBorder(BorderFactory.createMatteBorder(0, 5, 0, 0, themeColor), new EmptyBorder(20, 25, 20, 25)));
        JLabel lblT = new JLabel(title); lblT.setFont(new Font("Segoe UI", Font.BOLD, 12)); lblT.setForeground(AppColor.TEXT_SECONDARY);
        lblCount.setFont(new Font("Segoe UI", Font.BOLD, 42)); lblCount.setForeground(AppColor.TEXT_PRIMARY);
        card.add(lblT, BorderLayout.NORTH); card.add(lblCount, BorderLayout.CENTER); 
        
        card.addMouseListener(new MouseAdapter() {
            @Override public void mouseClicked(MouseEvent e) {
                if (filterType.equals("ALL")) rowSorter.setRowFilter(null);
                else if (filterType.equals("CONFIRMED")) rowSorter.setRowFilter(RowFilter.regexFilter("(?i)Xác nhận", 5));
                else if (filterType.equals("CANCELLED")) rowSorter.setRowFilter(RowFilter.regexFilter("(?i)Hủy", 5));
            }
            @Override public void mouseEntered(MouseEvent e) { 
                card.setCursor(new Cursor(Cursor.HAND_CURSOR)); 
                card.setBackground(ZEBRA_COLOR); 
            }
            @Override public void mouseExited(MouseEvent e) { 
                card.setBackground(Color.WHITE); 
            }
        });
        return card;
    }

    private void loadRealData() {
        tableModel.setRowCount(0); 
        List<Object[]> listRaw = bookingBUS.layDanhSachDatCho(); 
        java.text.DecimalFormat formatter = new java.text.DecimalFormat("###,###,###");

        int total = 0, confirmed = 0, cancelled = 0;

        for (Object[] raw : listRaw) {
            String bookingID = (String) raw[0];
            String fullName = (String) raw[1];
            String email = (String) raw[2];
            String route = (String) raw[3];
            String flightInfo = raw[4] + " • " + raw[5]; 
            String date = (String) raw[6];
            
            Double totalAmount = null;
            if(raw[7] != null) {
                totalAmount = Double.valueOf(raw[7].toString()); 
            }
            String formattedMoney = (totalAmount != null && totalAmount > 0) ? formatter.format(totalAmount) + "&nbsp;VNĐ" : "0&nbsp;VNĐ";
            String status = (String) raw[8]; 

            // Cập nhật số liệu thống kê
            total++;
            if (status != null) {
                if (status.equalsIgnoreCase("Đã xác nhận")) confirmed++;
                else if (status.equalsIgnoreCase("Đã hủy")) cancelled++;
            }

            String htmlKhachHang = "<html><b><font size='4' face='Segoe UI'>" + fullName + "</font></b><br><font color='#64748b' face='Segoe UI'>" + email + "</font></html>";
            String htmlChangBay = "<html><b><font size='4' face='Segoe UI'>" + route + "</font></b><br><font color='#64748b' face='Segoe UI'>" + flightInfo + "</font></html>";
            String htmlTongTien = "<html><b><font color='#0f172a' face='Segoe UI'>" + formattedMoney + "</font></b></html>";

            tableModel.addRow(new Object[]{
                bookingID, htmlKhachHang, htmlChangBay, date, htmlTongTien, status, ""
            });
        }
        
        // Đổ số liệu lên các thẻ Stats
        if(lblTotalBooking != null) {
            lblTotalBooking.setText(String.valueOf(total));
            lblConfirmedBooking.setText(String.valueOf(confirmed));
            lblCancelledBooking.setText(String.valueOf(cancelled));
        }
    }

    /** Tìm và chọn hàng theo BookingID (cột 0) - được gọi từ GlobalSearch */
    public void selectById(String bookingId) {
        rowSorter.setRowFilter(null);
        for (int row = 0; row < tableModel.getRowCount(); row++) {
            Object val = tableModel.getValueAt(row, 0);
            if (val != null && bookingId.equalsIgnoreCase(val.toString())) {
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
        table.setRowHeight(65); 
        table.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        
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
                setFont(new Font("Segoe UI", Font.BOLD, 12)); 
                setBackground(Color.WHITE);
                return this;
            }
        };
        for (int i = 0; i < table.getColumnModel().getColumnCount(); i++) table.getColumnModel().getColumn(i).setHeaderRenderer(headerRenderer);

        DefaultTableCellRenderer defaultRenderer = new DefaultTableCellRenderer() {
            @Override public Component getTableCellRendererComponent(JTable t, Object v, boolean s, boolean f, int r, int c) {
                super.getTableCellRendererComponent(t, v, s, f, r, c);
                setOpaque(true);
                
                setBorder(BorderFactory.createCompoundBorder(
                    BorderFactory.createMatteBorder(0, 0, 1, 0, AppColor.BORDER),
                    new EmptyBorder(0, 15, 0, 15)
                ));
                
                if (!s) {
                    setBackground(r % 2 == 0 ? Color.WHITE : ZEBRA_COLOR);
                }
                
                setForeground(AppColor.TEXT_PRIMARY);
                if (c == 0) {
                    setFont(new Font("Segoe UI", Font.BOLD, 14)); 
                } else {
                    setFont(new Font("Segoe UI", Font.PLAIN, 14)); 
                }
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
        
        table.getColumnModel().getColumn(0).setPreferredWidth(110); 
        table.getColumnModel().getColumn(1).setPreferredWidth(210); 
        table.getColumnModel().getColumn(2).setPreferredWidth(200); 
        table.getColumnModel().getColumn(3).setPreferredWidth(140); 
        table.getColumnModel().getColumn(4).setPreferredWidth(140); 
        table.getColumnModel().getColumn(5).setPreferredWidth(120); 
        table.getColumnModel().getColumn(6).setPreferredWidth(90); 
    }

    private JButton makePrimaryButton(String text) {
        JButton btn = new JButton(text) {
            @Override protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create(); g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(AppColor.PRIMARY); g2.fillRoundRect(0, 0, getWidth(), getHeight(), 8, 8); g2.dispose(); super.paintComponent(g);
            }
        };
        btn.setFont(new Font("Segoe UI", Font.BOLD, 14)); btn.setForeground(Color.WHITE); btn.setContentAreaFilled(false); btn.setBorderPainted(false); btn.setCursor(new Cursor(Cursor.HAND_CURSOR)); btn.setPreferredSize(new Dimension(160, 42)); return btn;
    }

    private JButton makeSecondaryButton(String text) {
        JButton btn = new JButton(text) {
            @Override protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create(); g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(Color.WHITE); g2.fillRoundRect(0, 0, getWidth(), getHeight(), 8, 8);
                g2.setColor(AppColor.BORDER); g2.drawRoundRect(0, 0, getWidth()-1, getHeight()-1, 8, 8); g2.dispose(); super.paintComponent(g);
            }
        };
        btn.setFont(new Font("Segoe UI", Font.BOLD, 14)); btn.setForeground(AppColor.TEXT_PRIMARY); btn.setContentAreaFilled(false); btn.setBorderPainted(false); btn.setCursor(new Cursor(Cursor.HAND_CURSOR)); return btn;
    }

    class BadgeRenderer extends JPanel implements TableCellRenderer {
        private String text = ""; private Color bgColor = Color.WHITE; private Color fgColor = Color.BLACK;
        public BadgeRenderer() { 
            setOpaque(true); 
            setBorder(BorderFactory.createMatteBorder(0, 0, 1, 0, AppColor.BORDER)); 
        }

        @Override public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected, boolean hasFocus, int row, int column) {
            setBackground(isSelected ? table.getSelectionBackground() : (row % 2 == 0 ? Color.WHITE : ZEBRA_COLOR));
            if (value != null) {
                text = value.toString();
                if (text.equalsIgnoreCase("Đã xác nhận")) { bgColor = new Color(219, 234, 254); fgColor = new Color(30, 64, 175); } 
                else if (text.equalsIgnoreCase("Chờ thanh toán")) { bgColor = new Color(241, 245, 249); fgColor = new Color(71, 85, 105); } 
                else if (text.equalsIgnoreCase("Đã hủy")) { bgColor = new Color(254, 226, 226); fgColor = new Color(153, 27, 27); } 
                else { bgColor = new Color(243, 244, 246); fgColor = new Color(75, 85, 99); }
            } else { text = ""; } return this;
        }

        @Override protected void paintComponent(Graphics g) {
            super.paintComponent(g); if(text.isEmpty()) return;
            Graphics2D g2 = (Graphics2D) g.create(); g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            g2.setFont(new Font("Segoe UI", Font.BOLD, 12)); FontMetrics fm = g2.getFontMetrics();
            int paddingX = 14, paddingY = 6; int width = fm.stringWidth(text) + paddingX * 2; int height = fm.getHeight() + paddingY * 2;
            int x = 15; int y = (getHeight() - height) / 2;
            g2.setColor(bgColor); g2.fill(new RoundRectangle2D.Double(x, y, width, height, 8, 8)); 
            g2.setColor(fgColor); g2.drawString(text, x + paddingX, y + fm.getAscent() + paddingY - 1); g2.dispose();
        }
    }

    class ActionRenderer extends JPanel implements TableCellRenderer {
        public ActionRenderer() { 
            setOpaque(true); 
            setBorder(BorderFactory.createMatteBorder(0, 0, 1, 0, AppColor.BORDER)); 
        }
        @Override public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected, boolean hasFocus, int row, int column) {
            setBackground(isSelected ? table.getSelectionBackground() : (row % 2 == 0 ? Color.WHITE : ZEBRA_COLOR)); return this;
        }
        @Override protected void paintComponent(Graphics g) {
            super.paintComponent(g); Graphics2D g2 = (Graphics2D) g.create();
            g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            g2.setFont(new Font("Segoe UI Emoji", Font.PLAIN, 18)); g2.setColor(new Color(100, 116, 139));
            g2.drawString("✏️", 15, (getHeight() / 2) + 6); 
            g2.drawString("🗑️", 45, (getHeight() / 2) + 6); 
            g2.dispose();
        }
    }

    class ActionEditor extends AbstractCellEditor implements TableCellEditor, MouseListener {
        private JPanel panel; private int currentRow;
        
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
            String bookingID = tableModel.getValueAt(modelRow, 0).toString(); 
            
            if (e.getX() >= 10 && e.getX() <= 35) { 
                SuaDatChoDialog editDialog = new SuaDatChoDialog((Frame) SwingUtilities.getWindowAncestor(panel), bookingID);
                editDialog.setVisible(true); 
                loadRealData(); 
                applyFilter();
            } else if (e.getX() >= 40 && e.getX() <= 65) { 
                int confirm = JOptionPane.showConfirmDialog(panel, "Bạn có chắc chắn muốn HỦY đơn đặt chỗ " + bookingID + " này không?\nHành động sẽ hủy toàn bộ vé bên trong đơn.", "Xác nhận Hủy Đơn", JOptionPane.YES_NO_OPTION, JOptionPane.WARNING_MESSAGE);
                if (confirm == JOptionPane.YES_OPTION) {
                    boolean isCancelled = bookingBUS.huyDatCho(bookingID, "Khách yêu cầu hủy qua điện thoại");
                    if(isCancelled) { 
                        JOptionPane.showMessageDialog(panel, "Đã Hủy đơn " + bookingID + " thành công!"); 
                        loadRealData(); 
                        applyFilter(); 
                    }
                }
            }
        }
        @Override public void mousePressed(MouseEvent e) {} @Override public void mouseReleased(MouseEvent e) {} @Override public void mouseEntered(MouseEvent e) {} @Override public void mouseExited(MouseEvent e) {}
    }

    private static class SearchIcon implements Icon {
        @Override
        public void paintIcon(Component c, Graphics g, int x, int y) {
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
        try { UIManager.setLookAndFeel(new com.formdev.flatlaf.FlatLightLaf()); } catch (Exception ex) {}
        
        SwingUtilities.invokeLater(() -> {
            JFrame frame = new JFrame("Quản Lý Đặt Chỗ - TIU AIRLINES");
            frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            frame.setSize(1200, 800); 
            frame.setLocationRelativeTo(null); 
            frame.add(new QuanLyDatChoPanel());
            frame.setVisible(true);
        });
    }
}