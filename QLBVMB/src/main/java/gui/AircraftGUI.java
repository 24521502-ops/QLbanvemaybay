package gui;

import bus.AircraftBUS;
import dto.AircraftDTO;
import util.AppColor;

import javax.swing.*;
import javax.swing.table.*;
import java.awt.*;
import java.awt.event.*;
import java.util.List;

public class AircraftGUI extends JPanel {
    private final AircraftBUS bus = new AircraftBUS();
    private JTable table;
    private DefaultTableModel tableModel;
    private JTextField txtSearch;
    private JLabel lblInfo;
    private JPanel pagePanel;
    private int currentPage = 1;
    private JLabel lblTotalCount, lblStat2, lblStat3;
    private final int pageSize = 6;
    private List<AircraftDTO> allData;
    private JComboBox<String> cboSort;
    private javax.swing.Timer searchTimer;

    public AircraftGUI() {
        setLayout(new BorderLayout());
        setBackground(AppColor.BACKGROUND);
        initComponents();
        // Nạp dữ liệu trong luồng riêng để tránh treo UI
        new Thread(this::loadData).start();
    }

    private void initComponents() {
        // ===== TOP =====
        JPanel topPanel = new JPanel(new BorderLayout(10, 0));
        topPanel.setBackground(AppColor.SURFACE);
        topPanel.setBorder(BorderFactory.createCompoundBorder(
            BorderFactory.createMatteBorder(0, 0, 1, 0, AppColor.BORDER),
            BorderFactory.createEmptyBorder(12, 16, 12, 16)
        ));

        JPanel searchBox = new JPanel(new BorderLayout(5, 0));
        searchBox.setBackground(AppColor.SURFACE);
        searchBox.setBorder(BorderFactory.createCompoundBorder(
            BorderFactory.createLineBorder(AppColor.BORDER, 1, true),
            BorderFactory.createEmptyBorder(4, 10, 4, 10)
        ));
        searchBox.setPreferredSize(new Dimension(260, 36));

                JLabel lblSearchIcon = new JLabel() {
            @Override
            protected void paintComponent(Graphics g) {
                super.paintComponent(g);
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(new Color(148, 163, 184));
                g2.setStroke(new BasicStroke(2f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND));
                int s = 12;
                int cx = 4;
                int cy = (getHeight() - s) / 2 - 1;
                g2.drawOval(cx, cy, s, s);
                g2.drawLine(cx + s - 2, cy + s - 2, cx + s + 3, cy + s + 3);
                g2.dispose();
            }
            @Override
            public Dimension getPreferredSize() {
                return new Dimension(24, 24);
            }
        };
        searchBox.add(lblSearchIcon, BorderLayout.WEST);

        txtSearch = new JTextField(20);
        txtSearch.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        txtSearch.setBorder(null);
        txtSearch.setBackground(AppColor.SURFACE);
        txtSearch.setText("Tìm kiếm loại máy bay...");
        txtSearch.setForeground(AppColor.TEXT_SECONDARY);
        txtSearch.addFocusListener(new FocusAdapter() {
            @Override
            public void focusGained(FocusEvent e) {
                if (txtSearch.getText().equals("Tìm kiếm loại máy bay...")) {
                    txtSearch.setText(""); txtSearch.setForeground(AppColor.TEXT_PRIMARY);
                }
            }
            @Override
            public void focusLost(FocusEvent e) {
                if (txtSearch.getText().isEmpty()) {
                    txtSearch.setText("Tìm kiếm loại máy bay..."); txtSearch.setForeground(AppColor.TEXT_SECONDARY);
                }
            }
        });

        searchTimer = new javax.swing.Timer(300, e -> { currentPage = 1; loadData(); });
        searchTimer.setRepeats(false);
        txtSearch.getDocument().addDocumentListener(new javax.swing.event.DocumentListener() {
            public void insertUpdate(javax.swing.event.DocumentEvent e) { triggerSearch(); }
            public void removeUpdate(javax.swing.event.DocumentEvent e) { triggerSearch(); }
            public void changedUpdate(javax.swing.event.DocumentEvent e) { triggerSearch(); }
        });

        searchBox.add(txtSearch, BorderLayout.CENTER);

        String[] sortOptions = {"Sắp xếp: Mặc định", "Mã máy bay (A-Z)", "Tên loại (A-Z)", "Năm sản xuất (Tăng)", "Sức chứa (Tăng)"};
        cboSort = new JComboBox<>(sortOptions);
        cboSort.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        cboSort.setPreferredSize(new Dimension(180, 36));
        cboSort.setBackground(Color.WHITE);
        cboSort.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        cboSort.addActionListener(e -> sortData());

        JButton btnRefresh = new JButton("Làm mới");
        btnRefresh.setFont(new Font("Segoe UI", Font.BOLD, 13));
        btnRefresh.setBackground(Color.WHITE);
        btnRefresh.setForeground(AppColor.TEXT_PRIMARY);
        btnRefresh.setFocusPainted(false);
        btnRefresh.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        btnRefresh.setBorder(BorderFactory.createCompoundBorder(
            BorderFactory.createLineBorder(AppColor.BORDER, 1, true),
            BorderFactory.createEmptyBorder(0, 15, 0, 15)
        ));
        btnRefresh.setPreferredSize(new Dimension(110, 36));
        btnRefresh.addMouseListener(new MouseAdapter() {
            @Override public void mouseEntered(MouseEvent e) { btnRefresh.setBackground(new Color(249, 250, 251)); }
            @Override public void mouseExited(MouseEvent e) { btnRefresh.setBackground(Color.WHITE); }
        });
        btnRefresh.addActionListener(e -> {
            txtSearch.setText("Tìm kiếm loại máy bay...");
            txtSearch.setForeground(AppColor.TEXT_SECONDARY);
            cboSort.setSelectedIndex(0);
            currentPage = 1;
            loadData();
        });

        JPanel searchPanel = new JPanel(new FlowLayout(FlowLayout.LEFT, 10, 0));
        searchPanel.setBackground(AppColor.SURFACE);
        searchPanel.add(searchBox);
        searchPanel.add(cboSort);
        searchPanel.add(btnRefresh);
        topPanel.add(searchPanel, BorderLayout.WEST);

        JButton btnAdd = createStyledButton("+ Thêm loại máy bay", AppColor.PRIMARY, Color.WHITE);
        btnAdd.setPreferredSize(new Dimension(175, 36));
        btnAdd.addActionListener(e -> showAddDialog());
        JPanel btnPanel = new JPanel(new FlowLayout(FlowLayout.RIGHT, 0, 0));
        btnPanel.setBackground(AppColor.SURFACE);
        btnPanel.add(btnAdd);
        topPanel.add(btnPanel, BorderLayout.EAST);

                JPanel dashboardPanel = new JPanel(new GridLayout(1, 3, 16, 0));
        dashboardPanel.setBackground(AppColor.SURFACE);
        dashboardPanel.setBorder(BorderFactory.createEmptyBorder(16, 16, 16, 16));
        
        JPanel card1 = createKPICard("TỔNG MÁY BAY", "0", 1, new Color(14, 165, 233));
        lblTotalCount = (JLabel) ((JPanel) card1.getComponent(1)).getComponent(0);
        
        JPanel card2 = createKPICard("CỠ LỚN (>200)", "0", 2, new Color(16, 185, 129));
        lblStat2 = (JLabel) ((JPanel) card2.getComponent(1)).getComponent(0);
        
        JPanel card3 = createKPICard("ĐỜI CŨ NHẤT", "0", 5, new Color(245, 158, 11));
        lblStat3 = (JLabel) ((JPanel) card3.getComponent(1)).getComponent(0);
        
        dashboardPanel.add(card1); dashboardPanel.add(card2); dashboardPanel.add(card3);

        dashboardPanel.setOpaque(false);
        add(dashboardPanel, BorderLayout.NORTH);

        JPanel contentPanel = new JPanel(new BorderLayout());
        contentPanel.setBackground(AppColor.SURFACE);
        contentPanel.setBorder(BorderFactory.createLineBorder(new Color(226, 232, 240), 1, true));
        contentPanel.add(topPanel, BorderLayout.NORTH);

        // ===== TABLE =====
        String[] cols = {"MÃ MÁY BAY", "TÊN LOẠI", "NĂM SẢN XUẤT", "SỨC CHỨA", "THAO TÁC"};
        tableModel = new DefaultTableModel(cols, 0) {
            @Override
            public boolean isCellEditable(int row, int column) { return column == 4; }
        };
        table = new JTable(tableModel);
        table.setRowHeight(52);
        table.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        table.setGridColor(AppColor.BORDER);
        table.setShowGrid(false);
        table.setShowHorizontalLines(true);
        table.setIntercellSpacing(new Dimension(0, 0));
        table.setSelectionBackground(new Color(219, 234, 254));
        table.setSelectionForeground(AppColor.TEXT_PRIMARY);
        table.setFocusable(false);

        DefaultTableCellRenderer headerRenderer = new DefaultTableCellRenderer() {
            @Override
            public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected, boolean hasFocus, int row, int column) {
                super.getTableCellRendererComponent(table, value, isSelected, hasFocus, row, column);
                setBackground(AppColor.SURFACE);
                setForeground(AppColor.TEXT_SECONDARY);
                setFont(new Font("Segoe UI", Font.BOLD, 12));
                if (column == table.getColumnCount() - 1) {
                    setHorizontalAlignment(SwingConstants.CENTER);
                    setBorder(BorderFactory.createEmptyBorder(0, 0, 0, 0));
                } else {
                    setHorizontalAlignment(SwingConstants.LEFT);
                    setBorder(BorderFactory.createEmptyBorder(0, 16, 0, 8));
                }
                return this;
            }
        };

        JTableHeader header = table.getTableHeader();
        header.setDefaultRenderer(headerRenderer);
        header.setBorder(BorderFactory.createMatteBorder(0, 0, 2, 0, AppColor.BORDER));
        header.setPreferredSize(new Dimension(0, 44));
        header.setReorderingAllowed(false);

        table.getColumnModel().getColumn(0).setPreferredWidth(100);
        table.getColumnModel().getColumn(1).setPreferredWidth(250);
        table.getColumnModel().getColumn(2).setPreferredWidth(120);
        table.getColumnModel().getColumn(3).setPreferredWidth(140);
        table.getColumnModel().getColumn(4).setPreferredWidth(100);

        // Custom renderer tên loại máy bay (icon ✈ + tên)
        table.getColumnModel().getColumn(1).setCellRenderer(new AircraftNameRenderer());

        // Default renderer
        DefaultTableCellRenderer defRenderer = new DefaultTableCellRenderer() {
            @Override
            public Component getTableCellRendererComponent(JTable t, Object v, boolean sel, boolean foc, int row, int col) {
                super.getTableCellRendererComponent(t, v, sel, foc, row, col);
                if (!sel) setBackground(row % 2 == 0 ? AppColor.SURFACE : new Color(249, 250, 251));
                else setBackground(new Color(219, 234, 254));
                setForeground(AppColor.TEXT_PRIMARY);
                setHorizontalAlignment(SwingConstants.LEFT);
                setBorder(BorderFactory.createEmptyBorder(0, 16, 0, 8));

                // In đậm cột mã
                if (col == 0) setFont(new Font("Segoe UI", Font.BOLD, 13));
                else setFont(new Font("Segoe UI", Font.PLAIN, 13));

                return this;
            }
        };
        table.getColumnModel().getColumn(0).setCellRenderer(defRenderer);
        table.getColumnModel().getColumn(2).setCellRenderer(defRenderer);
        table.getColumnModel().getColumn(3).setCellRenderer(defRenderer);

        table.getColumnModel().getColumn(4).setCellRenderer(new ActionCellRenderer());
        table.getColumnModel().getColumn(4).setCellEditor(new ActionCellEditor());

        JScrollPane scroll = new JScrollPane(table);
        scroll.setBorder(BorderFactory.createEmptyBorder());
        scroll.getViewport().setBackground(AppColor.SURFACE);
        contentPanel.add(scroll, BorderLayout.CENTER);

        // ===== BOTTOM =====
        JPanel bottomPanel = new JPanel(new BorderLayout());
        bottomPanel.setBackground(AppColor.SURFACE);
        bottomPanel.setBorder(BorderFactory.createCompoundBorder(
            BorderFactory.createMatteBorder(1, 0, 0, 0, AppColor.BORDER),
            BorderFactory.createEmptyBorder(10, 16, 10, 16)
        ));

        lblInfo = new JLabel();
        lblInfo.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        lblInfo.setForeground(AppColor.TEXT_SECONDARY);
        bottomPanel.add(lblInfo, BorderLayout.WEST);

        pagePanel = new JPanel(new FlowLayout(FlowLayout.RIGHT, 4, 0));
        pagePanel.setBackground(AppColor.SURFACE);
        bottomPanel.add(pagePanel, BorderLayout.EAST);

        contentPanel.add(bottomPanel, BorderLayout.SOUTH);
        add(contentPanel, BorderLayout.CENTER);
    }

    private void triggerSearch() {
        if (!txtSearch.getText().equals("Tìm kiếm loại máy bay...")) {
            if (searchTimer.isRunning()) searchTimer.restart();
            else searchTimer.start();
        }
    }

    private void loadData() {
        String kw = txtSearch.getText();
        if (kw.equals("Tìm kiếm loại máy bay...")) kw = "";
        allData = bus.search(kw);
        if (cboSort != null && cboSort.getSelectedIndex() > 0) applySort();
                if (lblTotalCount != null && allData != null) {
            updateDashboard();
        }
        SwingUtilities.invokeLater(this::refreshTable);
    }

    private void sortData() {
        if (allData == null || allData.isEmpty()) return;
        if (cboSort.getSelectedIndex() == 0) {
            loadData();
        } else {
            applySort();
            currentPage = 1;
                    if (lblTotalCount != null && allData != null) {
            updateDashboard();
        }
        SwingUtilities.invokeLater(this::refreshTable);
        }
    }

    private void applySort() {
        int idx = cboSort.getSelectedIndex();
        switch (idx) {
            case 1: allData.sort((a, b) -> a.getAircraftID().compareToIgnoreCase(b.getAircraftID())); break;
            case 2: allData.sort((a, b) -> a.getModel().compareToIgnoreCase(b.getModel())); break;
            case 3: allData.sort((a, b) -> {
                Integer y1 = a.getManufactureYear() != null ? a.getManufactureYear() : 0;
                Integer y2 = b.getManufactureYear() != null ? b.getManufactureYear() : 0;
                return y1.compareTo(y2);
            }); break;
            case 4: allData.sort((a, b) -> {
                Integer c1 = a.getCapacity() != null ? a.getCapacity() : 0;
                Integer c2 = b.getCapacity() != null ? b.getCapacity() : 0;
                return c1.compareTo(c2);
            }); break;
        }
    }

    private void refreshTable() {
        tableModel.setRowCount(0);
        int total = allData.size();
        int totalPages = Math.max(1, (int) Math.ceil((double) total / pageSize));
        if (currentPage > totalPages) currentPage = totalPages;
        int from = (currentPage - 1) * pageSize;
        int to = Math.min(from + pageSize, total);

        for (int i = from; i < to; i++) {
            AircraftDTO dto = allData.get(i);
            int cap = dto.getCapacity() != null ? dto.getCapacity() : 0;
            int low = Math.max(0, cap - (int)(cap * 0.12));
            tableModel.addRow(new Object[]{
                dto.getAircraftID(),
                dto.getModel(),
                dto.getManufactureYear() != null ? String.valueOf(dto.getManufactureYear()) : "",
                low + " - " + cap,
                "actions"
            });
        }
        lblInfo.setText("Hiển thị " + (total == 0 ? 0 : from + 1) + "-" + to + " trên " + total + " kết quả");
        updatePagination(totalPages);
    }

    private void updatePagination(int totalPages) {
        pagePanel.removeAll();
        JButton btnPrev = createPageButton("<"); btnPrev.setEnabled(currentPage > 1);
        btnPrev.addActionListener(e -> { currentPage--; refreshTable(); });
        pagePanel.add(btnPrev);

        for (int i = 1; i <= totalPages; i++) {
            final int p = i;
            JButton btn = createPageButton(String.valueOf(i));
            if (i == currentPage) {
                btn.setBackground(AppColor.PRIMARY); btn.setForeground(Color.WHITE);
                btn.setBorder(BorderFactory.createLineBorder(AppColor.PRIMARY, 1, true));
            }
            btn.addActionListener(e -> { currentPage = p; refreshTable(); });
            pagePanel.add(btn);
        }

        JButton btnNext = createPageButton(">"); btnNext.setEnabled(currentPage < totalPages);
        btnNext.addActionListener(e -> { currentPage++; refreshTable(); });
        pagePanel.add(btnNext);
        pagePanel.revalidate(); pagePanel.repaint();
    }

    private void showAddDialog() {
        showCustomDialog("Thêm loại máy bay", "Nhập thông tin chi tiết cho loại máy bay mới.", null, -1);
    }

    private void showEditDialog(int row) {
        int idx = (currentPage - 1) * pageSize + row;
        if (idx >= allData.size()) return;
        showCustomDialog("Cập nhật loại máy bay", "Chỉnh sửa thông tin loại máy bay đã chọn.", allData.get(idx), row);
    }

    private void showCustomDialog(String title, String subtitle, AircraftDTO dto, int row) {
        JDialog dialog = new JDialog((java.awt.Frame) javax.swing.SwingUtilities.getWindowAncestor(this), title, true);
        dialog.setUndecorated(true);
        dialog.setSize(580, 520);
        dialog.setLocationRelativeTo(this);
        dialog.getRootPane().setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(203, 213, 225), 1));
        
        JPanel mainPanel = new JPanel(new java.awt.BorderLayout());
        mainPanel.setBackground(java.awt.Color.WHITE);

        // Header
        JPanel header = new JPanel(new java.awt.BorderLayout());
        header.setBackground(java.awt.Color.WHITE);
        header.setBorder(javax.swing.BorderFactory.createCompoundBorder(
            javax.swing.BorderFactory.createMatteBorder(0, 0, 1, 0, new java.awt.Color(226, 232, 240)),
            javax.swing.BorderFactory.createEmptyBorder(20, 24, 20, 24)
        ));

        // Header Draggable
        java.awt.Point[] initialClick = new java.awt.Point[1];
        header.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mousePressed(java.awt.event.MouseEvent e) { initialClick[0] = e.getPoint(); }
        });
        header.addMouseMotionListener(new java.awt.event.MouseMotionAdapter() {
            public void mouseDragged(java.awt.event.MouseEvent e) {
                dialog.setLocation(dialog.getLocation().x + e.getX() - initialClick[0].x, dialog.getLocation().y + e.getY() - initialClick[0].y);
            }
        });

        JPanel titlePanel = new JPanel(new java.awt.BorderLayout(16, 0));
        titlePanel.setBackground(java.awt.Color.WHITE);
        
        JLabel lblIcon = new JLabel("✈", javax.swing.SwingConstants.CENTER);
        lblIcon.setFont(new java.awt.Font("Segoe UI Emoji", java.awt.Font.PLAIN, 20));
        lblIcon.setOpaque(true);
        lblIcon.setBackground(new java.awt.Color(240, 249, 255));
        lblIcon.setForeground(new java.awt.Color(2, 132, 199));
        lblIcon.setPreferredSize(new java.awt.Dimension(48, 48));
        titlePanel.add(lblIcon, java.awt.BorderLayout.WEST);

        JPanel textPanel = new JPanel(new java.awt.GridLayout(2, 1, 0, 2));
        textPanel.setBackground(java.awt.Color.WHITE);
        JLabel lblTitle = new JLabel(title);
        lblTitle.setFont(new java.awt.Font("Segoe UI", java.awt.Font.BOLD, 18));
        lblTitle.setForeground(new java.awt.Color(15, 23, 42));
        JLabel lblSub = new JLabel(subtitle);
        lblSub.setFont(new java.awt.Font("Segoe UI", java.awt.Font.PLAIN, 13));
        lblSub.setForeground(new java.awt.Color(100, 116, 139));
        textPanel.add(lblTitle); textPanel.add(lblSub);
        titlePanel.add(textPanel, java.awt.BorderLayout.CENTER);

        header.add(titlePanel, java.awt.BorderLayout.CENTER);

        JButton btnClose = new JButton() {
            @Override
            protected void paintComponent(java.awt.Graphics g) {
                super.paintComponent(g);
                java.awt.Graphics2D g2 = (java.awt.Graphics2D) g.create();
                g2.setRenderingHint(java.awt.RenderingHints.KEY_ANTIALIASING, java.awt.RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(getModel().isRollover() ? new java.awt.Color(239, 68, 68) : new java.awt.Color(100, 116, 139));
                int s = 12;
                int x = (getWidth() - s) / 2;
                int y = (getHeight() - s) / 2;
                g2.setStroke(new java.awt.BasicStroke(2f, java.awt.BasicStroke.CAP_ROUND, java.awt.BasicStroke.JOIN_ROUND));
                g2.drawLine(x, y, x + s, y + s);
                g2.drawLine(x + s, y, x, y + s);
                g2.dispose();
            }
        };
        btnClose.setPreferredSize(new java.awt.Dimension(32, 32));
        btnClose.setContentAreaFilled(false);
        btnClose.setBorderPainted(false);
        btnClose.setFocusPainted(false);
        btnClose.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnClose.addActionListener(e -> dialog.dispose());
        header.add(btnClose, java.awt.BorderLayout.EAST);

        mainPanel.add(header, java.awt.BorderLayout.NORTH);

        // Body Form
        JPanel form = new JPanel(new java.awt.GridBagLayout());
        form.setBackground(java.awt.Color.WHITE);
        form.setBorder(javax.swing.BorderFactory.createEmptyBorder(24, 24, 24, 24));
        java.awt.GridBagConstraints gbc = new java.awt.GridBagConstraints();
        gbc.fill = java.awt.GridBagConstraints.HORIZONTAL; gbc.insets = new java.awt.Insets(0, 0, 16, 0); gbc.weightx = 1;

        JTextField txtID = new JTextField();
        JTextField txtAirlineID = new JTextField();
        JTextField txtModel = new JTextField();
        JTextField txtCapacity = new JTextField();
        JTextField txtYear = new JTextField();

        if (dto != null) {
            txtID.setText(dto.getAircraftID()); txtID.setEditable(false);
            txtAirlineID.setText(dto.getAirlineID());
            txtModel.setText(dto.getModel());
            txtCapacity.setText(dto.getCapacity() != null ? String.valueOf(dto.getCapacity()) : "");
            txtYear.setText(dto.getManufactureYear() != null ? String.valueOf(dto.getManufactureYear()) : "");
        }

        // Row 1: MÃ MÁY BAY | MÃ HÃNG
        JPanel row1 = new JPanel(new java.awt.GridLayout(1, 2, 16, 0));
        row1.setBackground(java.awt.Color.WHITE);
        row1.add(createFieldPanel("MÃ MÁY BAY *", "#", txtID, "Ví dụ: AC01"));
        row1.add(createFieldPanel("MÃ HÃNG *", "🏢", txtAirlineID, "Ví dụ: VN"));
        gbc.gridy = 0; form.add(row1, gbc);

        // Row 2: MODEL
        gbc.gridy = 1; form.add(createFieldPanel("TÊN LOẠI (MODEL) *", "✈", txtModel, "Ví dụ: Boeing 787"), gbc);

        // Row 3: SỨC CHỨA | NĂM SẢN XUẤT
        JPanel row3 = new JPanel(new java.awt.GridLayout(1, 2, 16, 0));
        row3.setBackground(java.awt.Color.WHITE);
        row3.add(createFieldPanel("SỨC CHỨA", "👥", txtCapacity, "Số ghế"));
        row3.add(createFieldPanel("NĂM SẢN XUẤT", "📅", txtYear, "Năm"));
        gbc.gridy = 2; form.add(row3, gbc);

        mainPanel.add(form, java.awt.BorderLayout.CENTER);

        // Footer
        JPanel footer = new JPanel(new java.awt.FlowLayout(java.awt.FlowLayout.RIGHT, 12, 16));
        footer.setBackground(java.awt.Color.WHITE);
        footer.setBorder(javax.swing.BorderFactory.createMatteBorder(1, 0, 0, 0, new java.awt.Color(226, 232, 240)));
        
        JButton btnCancel = new JButton("Hủy");
        btnCancel.setFont(new java.awt.Font("Segoe UI", java.awt.Font.PLAIN, 14));
        btnCancel.setBackground(java.awt.Color.WHITE);
        btnCancel.setForeground(new java.awt.Color(51, 65, 85));
        btnCancel.setPreferredSize(new java.awt.Dimension(80, 38));
        btnCancel.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(203, 213, 225)));
        btnCancel.setFocusPainted(false);
        btnCancel.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnCancel.addActionListener(e -> dialog.dispose());

        JButton btnSave = new JButton(dto == null ? "Lưu thông tin" : "Cập nhật");
        btnSave.setFont(new java.awt.Font("Segoe UI", java.awt.Font.BOLD, 14));
        btnSave.setBackground(new java.awt.Color(15, 23, 42));
        btnSave.setForeground(java.awt.Color.WHITE);
        btnSave.setPreferredSize(new java.awt.Dimension(150, 38));
        btnSave.setFocusPainted(false);
        btnSave.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnSave.addActionListener(e -> {
            try {
                AircraftDTO newDto = new AircraftDTO();
                newDto.setAircraftID(txtID.getText().trim());
                newDto.setAirlineID(txtAirlineID.getText().trim());
                newDto.setModel(txtModel.getText().trim());
                String capStr = txtCapacity.getText().trim();
                newDto.setCapacity(capStr.isEmpty() ? 0 : Integer.parseInt(capStr));
                String yearStr = txtYear.getText().trim();
                newDto.setManufactureYear(yearStr.isEmpty() ? 0 : Integer.parseInt(yearStr));

                boolean success = dto == null ? bus.insert(newDto) : bus.update(newDto);
                if (success) {
                    javax.swing.JOptionPane.showMessageDialog(dialog, "Thành công!", "Thông báo", javax.swing.JOptionPane.INFORMATION_MESSAGE);
                    dialog.dispose();
                    if (dto == null) currentPage = 1;
                    loadData();
                } else {
                    javax.swing.JOptionPane.showMessageDialog(dialog, "Lỗi! Kiểm tra lại dữ liệu.", "Lỗi", javax.swing.JOptionPane.ERROR_MESSAGE);
                }
            } catch (NumberFormatException ex) {
                javax.swing.JOptionPane.showMessageDialog(dialog, "Sức chứa và năm sản xuất phải là số!", "Lỗi", javax.swing.JOptionPane.ERROR_MESSAGE);
            }
        });

        footer.add(btnCancel);
        footer.add(btnSave);
        mainPanel.add(footer, java.awt.BorderLayout.SOUTH);

        dialog.add(mainPanel);
        dialog.setVisible(true);
    }

    private void deleteRow(int row) {
        int idx = (currentPage - 1) * pageSize + row;
        if (idx >= allData.size()) return;
        AircraftDTO dto = allData.get(idx);
        int confirm = javax.swing.JOptionPane.showConfirmDialog(this,
            "Bạn có chắc muốn xóa loại máy bay \"" + dto.getModel() + "\"?",
            "Xác nhận xóa", javax.swing.JOptionPane.YES_NO_OPTION, javax.swing.JOptionPane.WARNING_MESSAGE);
        if (confirm == javax.swing.JOptionPane.YES_OPTION) {
            if (bus.delete(dto.getAircraftID())) { javax.swing.JOptionPane.showMessageDialog(this, "Xóa thành công!"); loadData(); }
            else { javax.swing.JOptionPane.showMessageDialog(this, "Xóa thất bại!", "Lỗi", javax.swing.JOptionPane.ERROR_MESSAGE); }
        }
    }

    private JPanel createFieldPanel(String labelStr, String iconStr, JTextField txt, String placeholder) {
        JPanel p = new JPanel(new java.awt.BorderLayout(0, 8));
        p.setBackground(java.awt.Color.WHITE);
        
        JLabel lbl = new JLabel(labelStr);
        lbl.setFont(new java.awt.Font("Segoe UI", java.awt.Font.BOLD, 11));
        lbl.setForeground(new java.awt.Color(71, 85, 105));
        p.add(lbl, java.awt.BorderLayout.NORTH);

        JPanel inputWrap = new JPanel(new java.awt.BorderLayout(8, 0));
        inputWrap.setBackground(new java.awt.Color(248, 250, 252));
        inputWrap.setBorder(javax.swing.BorderFactory.createCompoundBorder(
            javax.swing.BorderFactory.createLineBorder(new java.awt.Color(226, 232, 240), 1, true),
            javax.swing.BorderFactory.createEmptyBorder(8, 12, 8, 12)
        ));
        
        JLabel lblIcon = new JLabel(iconStr);
        lblIcon.setFont(new java.awt.Font("Segoe UI Emoji", java.awt.Font.PLAIN, 14));
        lblIcon.setForeground(new java.awt.Color(100, 116, 139));
        inputWrap.add(lblIcon, java.awt.BorderLayout.WEST);
        
        txt.setFont(new java.awt.Font("Segoe UI", java.awt.Font.PLAIN, 14));
        txt.setBackground(new java.awt.Color(248, 250, 252));
        txt.setBorder(null);
        txt.setForeground(new java.awt.Color(15, 23, 42));
        txt.putClientProperty("JTextField.placeholderText", placeholder);
        inputWrap.add(txt, java.awt.BorderLayout.CENTER);

        p.add(inputWrap, java.awt.BorderLayout.CENTER);
        return p;
    }

        private void updateDashboard() {
        lblTotalCount.setText(String.valueOf(allData.size()));
        long c2 = allData.stream().filter(a -> a.getCapacity() >= 200).count();
        lblStat2.setText(String.valueOf(c2));
        int minYear = allData.stream().mapToInt(dto.AircraftDTO::getManufactureYear).min().orElse(0);
        lblStat3.setText(minYear > 0 ? String.valueOf(minYear) : "-");
    }

    // ===== UI Helpers =====
        

    private JPanel createKPICard(String title, String value, int iconType, Color color) {
        JPanel p = new JPanel(new BorderLayout(16, 0));
        p.setBackground(Color.WHITE);
        p.setBorder(BorderFactory.createCompoundBorder(
            BorderFactory.createLineBorder(new Color(226, 232, 240), 1, true),
            BorderFactory.createEmptyBorder(16, 16, 16, 16)
        ));
        
        JLabel lblIcon = new JLabel() {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(new Color(color.getRed(), color.getGreen(), color.getBlue(), 25));
                g2.fillRoundRect(0, 0, getWidth(), getHeight(), 12, 12);
                
                g2.setColor(color);
                g2.setStroke(new BasicStroke(2f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND));
                if (iconType == 1) { // Chart
                    g2.drawRect(14, 26, 4, 8);
                    g2.drawRect(22, 18, 4, 16);
                    g2.drawRect(30, 14, 4, 20);
                } else if (iconType == 2) { // Location
                    g2.drawOval(16, 12, 16, 16);
                    g2.drawLine(24, 28, 24, 34);
                    g2.drawLine(20, 34, 28, 34);
                    g2.drawOval(22, 18, 4, 4);
                } else if (iconType == 5) { // Clock
                    g2.drawOval(14, 14, 20, 20); // Outer circle
                    g2.drawLine(24, 24, 24, 18); // Hour hand
                    g2.drawLine(24, 24, 29, 24); // Minute hand
                } else { // Alert/Info
                    g2.drawOval(14, 14, 20, 20);
                    g2.drawLine(24, 20, 24, 26);
                    g2.drawLine(24, 30, 24, 30);
                }
                g2.dispose();
                super.paintComponent(g);
            }
        };
        lblIcon.setPreferredSize(new Dimension(48, 48));
        p.add(lblIcon, BorderLayout.WEST);

        JPanel textPanel = new JPanel(new GridLayout(2, 1, 0, 2));
        textPanel.setBackground(Color.WHITE);
        JLabel lblValue = new JLabel(value);
        lblValue.setFont(new Font("Segoe UI", Font.BOLD, 22));
        lblValue.setForeground(AppColor.TEXT_PRIMARY);
        JLabel lblTitle = new JLabel(title);
        lblTitle.setFont(new Font("Segoe UI", Font.BOLD, 12));
        lblTitle.setForeground(AppColor.TEXT_SECONDARY);
        
        textPanel.add(lblValue); textPanel.add(lblTitle);
        p.add(textPanel, BorderLayout.CENTER);
        return p;
    }
private JButton createStyledButton(String text, Color bg, Color fg) {
        JButton btn = new JButton(text); btn.setFont(new Font("Segoe UI", Font.BOLD, 13));
        btn.setBackground(bg); btn.setForeground(fg); btn.setFocusPainted(false); btn.setBorderPainted(false);
        btn.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR)); btn.setPreferredSize(new Dimension(150, 36));
        btn.addMouseListener(new MouseAdapter() {
            @Override public void mouseEntered(MouseEvent e) { if (bg.equals(AppColor.PRIMARY)) btn.setBackground(AppColor.PRIMARY_HOVER); }
            @Override public void mouseExited(MouseEvent e) { btn.setBackground(bg); }
        });
        return btn;
    }

    private JButton createPageButton(String text) {
        JButton btn = new JButton(text); btn.setFont(new Font("Segoe UI", Font.PLAIN, 12));
        btn.setPreferredSize(new Dimension(32, 32)); btn.setBackground(AppColor.SURFACE); btn.setForeground(AppColor.TEXT_PRIMARY);
        btn.setFocusPainted(false); btn.setBorder(BorderFactory.createLineBorder(AppColor.BORDER, 1, true));
        btn.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        return btn;
    }

    // ===== Aircraft Name Renderer (icon ✈ + tên) =====
    private class AircraftNameRenderer extends JPanel implements TableCellRenderer {
        private final JLabel lblIcon = new JLabel("✈");
        private final JLabel lblName = new JLabel();
        public AircraftNameRenderer() {
            setLayout(new FlowLayout(FlowLayout.LEFT, 10, 10)); setOpaque(true);
            setBorder(BorderFactory.createEmptyBorder(0, 6, 0, 8));
            lblIcon.setFont(new Font("Segoe UI Emoji", Font.PLAIN, 18)); lblIcon.setForeground(AppColor.TEXT_SECONDARY);
            lblName.setFont(new Font("Segoe UI", Font.BOLD, 13)); lblName.setForeground(AppColor.TEXT_PRIMARY);
        }
        @Override
        public Component getTableCellRendererComponent(JTable t, Object v, boolean sel, boolean foc, int row, int col) {
            removeAll();
            setBackground(sel ? new Color(219, 234, 254) : (row % 2 == 0 ? AppColor.SURFACE : new Color(249, 250, 251)));
            lblName.setText(v != null ? v.toString() : "");
            add(lblIcon); add(lblName);
            return this;
        }
    }

    // ===== Action renderers =====
    private static class EditIcon implements javax.swing.Icon {
        @Override public int getIconWidth() { return 20; }
        @Override public int getIconHeight() { return 20; }
        @Override public void paintIcon(java.awt.Component c, java.awt.Graphics g, int x, int y) {
            java.awt.Graphics2D g2 = (java.awt.Graphics2D) g.create();
            g2.setRenderingHint(java.awt.RenderingHints.KEY_ANTIALIASING, java.awt.RenderingHints.VALUE_ANTIALIAS_ON);
            g2.translate(x, y);
            g2.setColor(new java.awt.Color(2, 132, 199)); // Modern blue
            g2.setStroke(new java.awt.BasicStroke(1.5f, java.awt.BasicStroke.CAP_ROUND, java.awt.BasicStroke.JOIN_ROUND));
            // draw pencil body
            int[] px = {5, 12, 15, 8};
            int[] py = {15, 8, 11, 18};
            g2.drawPolygon(px, py, 4);
            // draw pencil tip
            g2.drawLine(5, 15, 3, 17);
            g2.drawLine(3, 17, 5, 17);
            g2.drawLine(5, 17, 8, 18);
            g2.dispose();
        }
    }

    private static class DeleteIcon implements javax.swing.Icon {
        @Override public int getIconWidth() { return 20; }
        @Override public int getIconHeight() { return 20; }
        @Override public void paintIcon(java.awt.Component c, java.awt.Graphics g, int x, int y) {
            java.awt.Graphics2D g2 = (java.awt.Graphics2D) g.create();
            g2.setRenderingHint(java.awt.RenderingHints.KEY_ANTIALIASING, java.awt.RenderingHints.VALUE_ANTIALIAS_ON);
            g2.translate(x, y);
            g2.setColor(new java.awt.Color(239, 68, 68)); // Red
            g2.setStroke(new java.awt.BasicStroke(1.5f, java.awt.BasicStroke.CAP_ROUND, java.awt.BasicStroke.JOIN_ROUND));
            g2.drawRect(5, 7, 10, 10);
            g2.drawLine(3, 7, 17, 7);
            g2.drawLine(8, 4, 12, 4);
            g2.drawLine(8, 10, 8, 14);
            g2.drawLine(12, 10, 12, 14);
            g2.dispose();
        }
    }

    private class ActionCellRenderer extends javax.swing.JPanel implements javax.swing.table.TableCellRenderer {
        public ActionCellRenderer() { setLayout(new java.awt.FlowLayout(java.awt.FlowLayout.CENTER, 6, 8)); setOpaque(true); }
        @Override
        public java.awt.Component getTableCellRendererComponent(javax.swing.JTable t, Object v, boolean sel, boolean foc, int row, int col) {
            removeAll();
            setBackground(sel ? new java.awt.Color(219, 234, 254) : (row % 2 == 0 ? new java.awt.Color(255, 255, 255) : new java.awt.Color(249, 250, 251)));
            add(makeBtn(true)); add(makeBtn(false));
            return this;
        }
        private javax.swing.JButton makeBtn(boolean isEdit) {
            javax.swing.JButton b = new javax.swing.JButton(isEdit ? new EditIcon() : new DeleteIcon());
            b.setPreferredSize(new java.awt.Dimension(32, 32));
            b.setBorderPainted(false);
            b.setContentAreaFilled(false);
            b.setFocusPainted(false);
            return b;
        }
    }

    private class ActionCellEditor extends javax.swing.AbstractCellEditor implements javax.swing.table.TableCellEditor {
        private final javax.swing.JPanel panel = new javax.swing.JPanel(new java.awt.FlowLayout(java.awt.FlowLayout.CENTER, 6, 8));
        private int editingRow;
        @Override
        public java.awt.Component getTableCellEditorComponent(javax.swing.JTable t, Object v, boolean sel, int row, int col) {
            editingRow = row; panel.removeAll(); panel.setBackground(new java.awt.Color(219, 234, 254));
            javax.swing.JButton btnEdit = makeBtn(true); btnEdit.addActionListener(e -> { fireEditingStopped(); javax.swing.SwingUtilities.invokeLater(() -> showEditDialog(editingRow)); });
            javax.swing.JButton btnDel = makeBtn(false); btnDel.addActionListener(e -> { fireEditingStopped(); javax.swing.SwingUtilities.invokeLater(() -> deleteRow(editingRow)); });
            panel.add(btnEdit); panel.add(btnDel);
            return panel;
        }
        private javax.swing.JButton makeBtn(boolean isEdit) {
            javax.swing.JButton b = new javax.swing.JButton(isEdit ? new EditIcon() : new DeleteIcon());
            b.setPreferredSize(new java.awt.Dimension(32, 32));
            b.setBorderPainted(false);
            b.setContentAreaFilled(false);
            b.setFocusPainted(false);
            b.setCursor(java.awt.Cursor.getPredefinedCursor(java.awt.Cursor.HAND_CURSOR));
            return b;
        }
        @Override public Object getCellEditorValue() { return "actions"; }
    }
}





