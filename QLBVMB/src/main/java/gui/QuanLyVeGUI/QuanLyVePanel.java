package gui.QuanLyVeGUI;

import java.awt.*;
import java.awt.event.*;
import java.awt.geom.Ellipse2D;
import java.awt.geom.RoundRectangle2D;
import java.util.ArrayList;
import java.util.List;
import javax.swing.*;
import javax.swing.border.EmptyBorder;
import javax.swing.table.*;

import bus.QuanLyVeBUS.VeBUS;
import util.AppColor;

public class QuanLyVePanel extends JPanel {

    private DefaultTableModel tableModel;
    private JTable table;
    private JTextField txtSearch;
    private JLabel lblTotalTicket, lblPaidTicket, lblCancelledTicket;
    private TableRowSorter<DefaultTableModel> rowSorter;
    private VeBUS veBUS;

    public QuanLyVePanel() {
        veBUS = new VeBUS();
        initComponents();
        customizeTable();
        loadRealData();
    }

    private void initComponents() {
        setLayout(new BorderLayout(0, 20));
        setBackground(AppColor.BACKGROUND);
        setBorder(new EmptyBorder(30, 40, 30, 40));

        JPanel headerPanel = new JPanel(new BorderLayout(0, 15));
        headerPanel.setOpaque(false);

        JLabel lblTitle = new JLabel("Danh sách Vé");
        lblTitle.setFont(new Font("Inter", Font.BOLD, 28));
        lblTitle.setForeground(AppColor.TEXT_PRIMARY);
        headerPanel.add(lblTitle, BorderLayout.WEST);

        JPanel statsPanel = new JPanel(new GridLayout(1, 3, 30, 0));
        statsPanel.setOpaque(false);
        statsPanel.setMaximumSize(new Dimension(Integer.MAX_VALUE, 120));

        lblTotalTicket = new JLabel("0");
        lblPaidTicket = new JLabel("0");
        lblCancelledTicket = new JLabel("0");

        // Thêm tính năng click vào thẻ thống kê
        statsPanel.add(createClickableStatCard("TỔNG VÉ ĐÃ ĐẶT", lblTotalTicket, AppColor.PRIMARY, "ALL"));
        statsPanel.add(createClickableStatCard("ĐÃ THANH TOÁN (PAID)", lblPaidTicket, AppColor.SUCCESS, "PAID"));
        statsPanel.add(createClickableStatCard("ĐÃ HỦY (CANCELLED)", lblCancelledTicket, AppColor.ERROR, "CANCELLED"));

        JPanel toolPanel = new JPanel(new BorderLayout());
        toolPanel.setOpaque(false);
        toolPanel.setBorder(new EmptyBorder(25, 0, 0, 0));

        txtSearch = new JTextField();
        txtSearch.setFont(new Font("Inter", Font.PLAIN, 14));
        txtSearch.setPreferredSize(new Dimension(350, 42));
        txtSearch.setBorder(BorderFactory.createCompoundBorder(BorderFactory.createLineBorder(AppColor.BORDER),
                new EmptyBorder(8, 15, 8, 15)));
        txtSearch.putClientProperty("JTextField.placeholderText", "Tìm theo mã vé, tên khách hàng...");
        txtSearch.putClientProperty("JTextField.leadingIcon", new SearchIcon());
        txtSearch.putClientProperty("JComponent.roundRect", true);
        txtSearch.addKeyListener(new KeyAdapter() {
            @Override
            public void keyReleased(KeyEvent e) {
                String text = txtSearch.getText().trim();
                if (text.length() == 0)
                    rowSorter.setRowFilter(null);
                else
                    rowSorter.setRowFilter(RowFilter.regexFilter("(?i)" + text));
            }
        });

        JPanel pnlRightTools = new JPanel(new FlowLayout(FlowLayout.RIGHT, 10, 0));
        pnlRightTools.setOpaque(false);

        JButton btnRefresh = makeSecondaryButton("Làm mới");
        btnRefresh.addActionListener(e -> {
            table.clearSelection();
            loadRealData();
            txtSearch.setText("");
            rowSorter.setRowFilter(null);
            txtSearch.requestFocus();
        });

        JButton btnSort = makeSecondaryButton("Sắp xếp ▼");
        JPopupMenu sortMenu = new JPopupMenu();
        sortMenu.setBackground(AppColor.SURFACE);

        JMenuItem itemPriceAsc = createMenuItem("Giá vé (Tăng dần)");
        JMenuItem itemPriceDesc = createMenuItem("Giá vé (Giảm dần)");
        JMenuItem itemStatus = createMenuItem("Trạng thái vé");

        // Cập nhật lại Index Sắp xếp: Giá vé là 6, Trạng thái là 7
        itemPriceAsc.addActionListener(e -> applySorting(6, SortOrder.ASCENDING));
        itemPriceDesc.addActionListener(e -> applySorting(6, SortOrder.DESCENDING));
        itemStatus.addActionListener(e -> applySorting(7, SortOrder.ASCENDING));

        sortMenu.add(itemPriceDesc);
        sortMenu.add(itemPriceAsc);
        sortMenu.addSeparator();
        sortMenu.add(itemStatus);

        btnSort.addActionListener(e -> sortMenu.show(btnSort, 0, btnSort.getHeight() + 2));

        pnlRightTools.add(txtSearch);
        pnlRightTools.add(btnRefresh);
        pnlRightTools.add(btnSort);

        toolPanel.add(pnlRightTools, BorderLayout.EAST);

        JPanel topPanel = new JPanel(new BorderLayout());
        topPanel.setOpaque(false);
        topPanel.add(headerPanel, BorderLayout.NORTH);
        topPanel.add(statsPanel, BorderLayout.CENTER);
        topPanel.add(toolPanel, BorderLayout.SOUTH);

        add(topPanel, BorderLayout.NORTH);

        // ==========================================
        // 2. BẢNG DANH SÁCH VÉ (ĐÃ THÊM 2 CỘT MỚI)
        // ==========================================
        JPanel panelTableCard = new JPanel(new BorderLayout());
        panelTableCard.setBackground(AppColor.SURFACE);
        panelTableCard.setBorder(BorderFactory.createLineBorder(AppColor.BORDER));

        String[] cols = { "Số vé", "Mã đặt chỗ", "Hành khách", "Chuyến bay", "Ngày bay", "Hạng vé", "Giá vé",
                "Trạng thái", "Thao tác" };
        tableModel = new DefaultTableModel(cols, 0) {
            @Override
            public boolean isCellEditable(int r, int c) {
                return c == 8;
            }
        };

        table = new JTable(tableModel);
        rowSorter = new TableRowSorter<>(tableModel);
        table.setRowSorter(rowSorter);

        JScrollPane scrollPane = new JScrollPane(table);
        scrollPane.getViewport().setBackground(AppColor.SURFACE);
        scrollPane.setBorder(BorderFactory.createEmptyBorder());
        panelTableCard.add(scrollPane, BorderLayout.CENTER);

        add(panelTableCard, BorderLayout.CENTER);

        // ==========================================
        // 3. FOOTER: NÚT HỦY VÉ
        // ==========================================
        JPanel footerPanel = new JPanel(new FlowLayout(FlowLayout.RIGHT, 15, 10));
        footerPanel.setOpaque(false);
        JButton btnRefund = makeDestructiveButton("Hoàn/Hủy vé");

        btnRefund.addActionListener(e -> {
            int row = table.getSelectedRow();
            if (row == -1) {
                JOptionPane.showMessageDialog(this, "Vui lòng click chọn 1 dòng vé trên bảng để hủy!", "Cảnh báo",
                        JOptionPane.WARNING_MESSAGE);
                return;
            }

            int modelRow = table.convertRowIndexToModel(row);
            String ticketID = tableModel.getValueAt(modelRow, 0).toString();
            String status = tableModel.getValueAt(modelRow, 7).toString(); // Cột trạng thái giờ là 7

            if (status.equalsIgnoreCase("Đã hủy") || status.equalsIgnoreCase("CANCELLED")) {
                JOptionPane.showMessageDialog(this, "Vé này đã bị hủy từ trước rồi!", "Thông báo",
                        JOptionPane.INFORMATION_MESSAGE);
                return;
            }
            if (status.equalsIgnoreCase("Đã lên máy bay") || status.equalsIgnoreCase("CHECKED-IN")) {
                JOptionPane.showMessageDialog(this, "Hành khách đã lên máy bay!\nKhông thể thực hiện hoàn/hủy vé này.",
                        "Cảnh báo nghiệp vụ", JOptionPane.WARNING_MESSAGE);
                return;
            }

            int confirm = JOptionPane.showConfirmDialog(this,
                    "Bạn có chắc chắn muốn HỦY vé: " + ticketID + " không?\nHành động này không thể hoàn tác!",
                    "Xác nhận Hủy vé", JOptionPane.YES_NO_OPTION, JOptionPane.WARNING_MESSAGE);
            if (confirm == JOptionPane.YES_OPTION) {
                if (veBUS.huyVe(ticketID)) {
                    JOptionPane.showMessageDialog(this, "Hủy vé thành công!", "Thành công",
                            JOptionPane.INFORMATION_MESSAGE);
                    loadRealData();
                    txtSearch.setText("");
                    rowSorter.setRowFilter(null);
                } else {
                    JOptionPane.showMessageDialog(this, "Lỗi khi hủy vé. Vui lòng kiểm tra lại!", "Lỗi",
                            JOptionPane.ERROR_MESSAGE);
                }
            }
        });

        footerPanel.add(btnRefund);
        add(footerPanel, BorderLayout.SOUTH);
    }

    private JMenuItem createMenuItem(String text) {
        JMenuItem item = new JMenuItem(text);
        item.setFont(new Font("Inter", Font.PLAIN, 13));
        item.setBackground(AppColor.SURFACE);
        item.setForeground(AppColor.TEXT_PRIMARY);
        item.setBorder(new EmptyBorder(8, 15, 8, 15));
        return item;
    }

    private void applySorting(int columnIndex, SortOrder order) {
        List<RowSorter.SortKey> sortKeys = new ArrayList<>();
        sortKeys.add(new RowSorter.SortKey(columnIndex, order));
        rowSorter.setSortKeys(sortKeys);
        rowSorter.sort();
    }

    private void loadRealData() {
        tableModel.setRowCount(0);
        List<Object[]> listVe = veBUS.layDanhSachVe();
        int total = 0, paid = 0, cancelled = 0;

        for (Object[] row : listVe) {
            tableModel.addRow(row);
            total++;
            String status = row[7] != null ? row[7].toString().toUpperCase() : ""; // Trạng thái ở cột 7
            if (status.contains("XÁC NHẬN") || status.contains("LÊN MÁY BAY") || status.contains("PAID"))
                paid++;
            if (status.contains("HỦY") || status.contains("CANCELLED"))
                cancelled++;
        }

        lblTotalTicket.setText(String.valueOf(total));
        lblPaidTicket.setText(String.valueOf(paid));
        lblCancelledTicket.setText(String.valueOf(cancelled));
    }

    private void customizeTable() {
        table.setRowHeight(65);
        table.setFont(new Font("Inter", Font.PLAIN, 14));
        table.setShowVerticalLines(false);
        table.setShowHorizontalLines(true);
        table.setGridColor(AppColor.BORDER);
        table.setSelectionBackground(new Color(248, 250, 252));
        table.setSelectionForeground(AppColor.TEXT_PRIMARY);

        JTableHeader header = table.getTableHeader();
        header.setPreferredSize(new Dimension(header.getWidth(), 50));
        header.setBackground(AppColor.SURFACE);

        DefaultTableCellRenderer headerRenderer = new DefaultTableCellRenderer() {
            @Override
            public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected,
                    boolean hasFocus, int row, int column) {
                super.getTableCellRendererComponent(table, value, isSelected, hasFocus, row, column);
                setBorder(BorderFactory.createCompoundBorder(
                        BorderFactory.createMatteBorder(0, 0, 1, 0, AppColor.BORDER), new EmptyBorder(0, 20, 0, 20)));
                setForeground(AppColor.TEXT_SECONDARY);
                setFont(new Font("Inter", Font.BOLD, 13));
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
                setFont(new Font("Inter", Font.BOLD, 14));
                return this;
            }
        };

        // Đặt Renderer cho từng cột
        table.getColumnModel().getColumn(0).setCellRenderer(defaultRenderer);
        table.getColumnModel().getColumn(1).setCellRenderer(defaultRenderer);
        table.getColumnModel().getColumn(3).setCellRenderer(defaultRenderer); // Chuyến bay
        table.getColumnModel().getColumn(4).setCellRenderer(defaultRenderer); // Ngày bay
        table.getColumnModel().getColumn(6).setCellRenderer(defaultRenderer); // Giá vé

        table.getColumnModel().getColumn(2).setCellRenderer(new PassengerRenderer());
        table.getColumnModel().getColumn(5).setCellRenderer(new BadgeRenderer()); // Hạng vé
        table.getColumnModel().getColumn(7).setCellRenderer(new BadgeRenderer()); // Trạng thái
        table.getColumnModel().getColumn(8).setCellRenderer(new ActionRenderer());
        table.getColumnModel().getColumn(8).setCellEditor(new ActionEditor());

        // Chỉnh độ rộng các cột cho cân đối (Nới rộng để không bị ... ở Tiêu đề)
        table.getColumnModel().getColumn(0).setPreferredWidth(80); // Số vé
        table.getColumnModel().getColumn(1).setPreferredWidth(100); // Mã đặt chỗ
        table.getColumnModel().getColumn(2).setPreferredWidth(190); // Hành khách
        table.getColumnModel().getColumn(3).setPreferredWidth(110); // Chuyến bay
        table.getColumnModel().getColumn(4).setPreferredWidth(110); // Ngày bay
        table.getColumnModel().getColumn(5).setPreferredWidth(130); // Hạng vé
        table.getColumnModel().getColumn(6).setPreferredWidth(140); // Giá vé
        table.getColumnModel().getColumn(7).setPreferredWidth(160); // Trạng thái
        table.getColumnModel().getColumn(8).setPreferredWidth(100); // Thao tác
    }

    // --- Các Component hỗ trợ ---
    private JPanel createClickableStatCard(String title, JLabel lblCount, Color themeColor, String filterType) {
        JPanel card = new JPanel(new BorderLayout(0, 10));
        card.setBackground(AppColor.SURFACE);
        card.setBorder(BorderFactory.createCompoundBorder(BorderFactory.createMatteBorder(0, 5, 0, 0, themeColor),
                new EmptyBorder(20, 25, 20, 25)));
        JLabel lblT = new JLabel(title);
        lblT.setFont(new Font("Inter", Font.BOLD, 12));
        lblT.setForeground(AppColor.TEXT_SECONDARY);
        lblCount.setFont(new Font("Inter", Font.BOLD, 42));
        lblCount.setForeground(AppColor.TEXT_PRIMARY);
        card.add(lblT, BorderLayout.NORTH);
        card.add(lblCount, BorderLayout.CENTER);

        // Sự kiện click để lọc
        card.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                if (filterType.equals("ALL"))
                    rowSorter.setRowFilter(null);
                else if (filterType.equals("PAID"))
                    rowSorter.setRowFilter(RowFilter.regexFilter("(?i)Xác nhận|Lên máy bay", 7));
                else if (filterType.equals("CANCELLED"))
                    rowSorter.setRowFilter(RowFilter.regexFilter("(?i)Hủy", 7));
            }

            @Override
            public void mouseEntered(MouseEvent e) {
                card.setCursor(new Cursor(Cursor.HAND_CURSOR));
                card.setBackground(new Color(248, 250, 252)); // Hiệu ứng sáng nhẹ khi di chuột
            }

            @Override
            public void mouseExited(MouseEvent e) {
                card.setBackground(AppColor.SURFACE);
            }
        });
        return card;
    }



    class PassengerRenderer extends JPanel implements TableCellRenderer {
        private String initials = "";
        private String fullName = "";
        private Color avatarBg = new Color(30, 41, 59);

        public PassengerRenderer() {
            setOpaque(true);
            setBackground(Color.WHITE);
        }

        @Override
        public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected, boolean hasFocus,
                int row, int column) {
            setBackground(isSelected ? table.getSelectionBackground() : AppColor.SURFACE);
            if (value != null) {
                fullName = value.toString();
                String[] words = fullName.split(" ");
                if (words.length >= 2)
                    initials = (words[0].substring(0, 1) + words[words.length - 1].substring(0, 1)).toUpperCase();
                else if (words.length == 1 && words[0].length() > 0)
                    initials = words[0].substring(0, Math.min(2, words[0].length())).toUpperCase();
                else
                    initials = "NA";
                Color[] colors = { new Color(30, 41, 59), new Color(56, 189, 248), new Color(15, 23, 42),
                        new Color(2, 132, 199) };
                avatarBg = colors[fullName.length() % colors.length];
            }
            return this;
        }

        @Override
        protected void paintComponent(Graphics g) {
            super.paintComponent(g);
            Graphics2D g2 = (Graphics2D) g.create();
            g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            int size = 36;
            int y = (getHeight() - size) / 2;
            g2.setColor(avatarBg);
            g2.fill(new Ellipse2D.Double(20, y, size, size));
            g2.setColor(Color.WHITE);
            g2.setFont(new Font("Inter", Font.BOLD, 13));
            FontMetrics fm = g2.getFontMetrics();
            int txtX = 20 + (size - fm.stringWidth(initials)) / 2;
            int txtY = y + ((size - fm.getHeight()) / 2) + fm.getAscent();
            g2.drawString(initials, txtX, txtY);
            g2.setColor(AppColor.TEXT_PRIMARY);
            g2.setFont(new Font("Inter", Font.PLAIN, 14));
            g2.drawString(fullName, 20 + size + 15, y + 22);
            g2.dispose();
        }
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
            setBackground(isSelected ? table.getSelectionBackground() : AppColor.SURFACE);
            if (value != null) {
                text = value.toString();
                if (text.equalsIgnoreCase("Phổ thông") || text.equalsIgnoreCase("Phổ thông đặc biệt")) {
                    bgColor = new Color(224, 231, 255);
                    fgColor = new Color(55, 65, 81);
                } else if (text.equalsIgnoreCase("Thương gia") || text.equalsIgnoreCase("Hạng nhất")) {
                    bgColor = new Color(219, 234, 254);
                    fgColor = new Color(29, 78, 216);
                } else if (text.equalsIgnoreCase("Đã xác nhận") || text.equalsIgnoreCase("Đã lên máy bay")) {
                    bgColor = new Color(209, 250, 229);
                    fgColor = new Color(6, 95, 70);
                } else if (text.equalsIgnoreCase("Chờ thanh toán")) {
                    bgColor = new Color(254, 243, 199);
                    fgColor = new Color(146, 64, 14);
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
            int paddingX = 12, paddingY = 6;
            int width = fm.stringWidth(text) + paddingX * 2;
            int height = fm.getHeight() + paddingY * 2;
            int x = 20;
            int y = (getHeight() - height) / 2;
            g2.setColor(bgColor);
            g2.fill(new RoundRectangle2D.Double(x, y, width, height, 8, 8));
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
            setBackground(isSelected ? table.getSelectionBackground() : AppColor.SURFACE);
            return this;
        }

        @Override
        protected void paintComponent(Graphics g) {
            super.paintComponent(g);
            Graphics2D g2 = (Graphics2D) g.create();
            g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            g2.setFont(new Font("Segoe UI Emoji", Font.PLAIN, 18));
            g2.setColor(AppColor.PRIMARY);
            g2.drawString("✏️", 15, (getHeight() / 2) + 6);
            g2.setColor(AppColor.TEXT_PRIMARY);
            g2.drawString("👁️", 45, (getHeight() / 2) + 6);
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

            if (e.getX() >= 10 && e.getX() <= 35) { // Click Sửa
                String status = tableModel.getValueAt(modelRow, 7).toString();
                if (status.equalsIgnoreCase("Đã lên máy bay") || status.equalsIgnoreCase("CHECKED-IN")) {
                    JOptionPane.showMessageDialog(panel,
                            "Hành khách đã lên máy bay!\nKhông thể chỉnh sửa hay nâng hạng nữa.", "Từ chối thao tác",
                            JOptionPane.WARNING_MESSAGE);
                    return;
                }
                if (status.equalsIgnoreCase("Đã hủy") || status.equalsIgnoreCase("CANCELLED")) {
                    JOptionPane.showMessageDialog(panel, "Vé này đã bị hủy, không thể chỉnh sửa!", "Từ chối thao tác",
                            JOptionPane.WARNING_MESSAGE);
                    return;
                }
                String ticketID = tableModel.getValueAt(modelRow, 0).toString();
                new ChinhSuaVeDialog((Frame) SwingUtilities.getWindowAncestor(panel), true, ticketID).setVisible(true);
                loadRealData();

            } else if (e.getX() >= 40 && e.getX() <= 65) { // Click Xem
                String ticketID = tableModel.getValueAt(modelRow, 0) != null
                        ? tableModel.getValueAt(modelRow, 0).toString()
                        : "";
                new ChiTietVeDialog((Frame) SwingUtilities.getWindowAncestor(panel), true, ticketID).setVisible(true);
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



    private JButton makeSecondaryButton(String text) {
        JButton btn = new JButton(text) {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(AppColor.SURFACE);
                g2.fillRoundRect(0, 0, getWidth(), getHeight(), 8, 8);
                g2.setColor(AppColor.BORDER);
                g2.drawRoundRect(0, 0, getWidth() - 1, getHeight() - 1, 8, 8);
                g2.dispose();
                super.paintComponent(g);
            }
        };
        btn.setFont(new Font("Inter", Font.BOLD, 14));
        btn.setForeground(AppColor.TEXT_PRIMARY);
        btn.setContentAreaFilled(false);
        btn.setBorderPainted(false);
        btn.setCursor(new Cursor(Cursor.HAND_CURSOR));
        btn.setPreferredSize(new Dimension(110, 42));
        return btn;
    }

    private JButton makeDestructiveButton(String text) {
        JButton btn = new JButton(text) {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(AppColor.ERROR);
                g2.fillRoundRect(0, 0, getWidth(), getHeight(), 8, 8);
                g2.dispose();
                super.paintComponent(g);
            }
        };
        btn.setFont(new Font("Inter", Font.BOLD, 14));
        btn.setForeground(Color.WHITE);
        btn.setContentAreaFilled(false);
        btn.setBorderPainted(false);
        btn.setCursor(new Cursor(Cursor.HAND_CURSOR));
        btn.setPreferredSize(new Dimension(140, 42));
        return btn;
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
            JFrame frame = new JFrame("TIU AIRLINES - Hệ thống Quản lý Vé");
            frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            frame.setSize(1280, 800);
            frame.setLocationRelativeTo(null);
            frame.add(new QuanLyVePanel());
            frame.setVisible(true);
        });
    }
}