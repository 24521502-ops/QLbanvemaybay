package gui;

import bus.BaoCaoTKBUS;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.awt.geom.GeneralPath;

import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.List;
import javax.swing.plaf.basic.BasicScrollBarUI;

public class BaoCaoTKGUI extends JPanel {

    // ── Colors ──────────────────────────────────────────────
    private static final Color BG = new Color(0xF0F4F8);
    private static final Color CARD = Color.WHITE;
    private static final Color DARK = new Color(0x1A2B4A);
    private static final Color BLUE = new Color(0x1D6FA4);
    private static final Color GREEN = new Color(0x10B981);
    private static final Color GRAY = new Color(0x6B7280);

    private static class AirlineItem {
        String id, name;

        AirlineItem(String id, String name) {
            this.id = id;
            this.name = name;
        }

        @Override
        public String toString() {
            return name;
        }
    }

    private static final Font F_TITLE = new Font("Segoe UI", Font.BOLD, 20);
    private static final Font F_BODY = new Font("Segoe UI", Font.PLAIN, 12);
    private static final Font F_KPI = new Font("Segoe UI", Font.BOLD, 19);
    private static final Font F_SMALL = new Font("Segoe UI", Font.PLAIN, 11);

    // ── BUS ─────────────────────────────────────────────────
    private final BaoCaoTKBUS bus = new BaoCaoTKBUS();

    // ── Controls ─────────────────────────────────────────────
    private JTextField txtTuNgay, txtDenNgay;
    private JComboBox<Object> cboHangBay;

    private JLabel lblDT, lblDC, lblCB, lblOcc;

    // ── Charts ───────────────────────────────────────────────
    private LineChart lineChart;
    private BarChart barChart;
    private PieChart pieChart;

    // ── State ────────────────────────────────────────────────
    private double[] trendData = new double[12];
    private List<Object[]> hangData = new ArrayList<>();
    private List<Object[]> revByClassData = new ArrayList<>();

    public BaoCaoTKGUI() {
        setBackground(BG);
        setLayout(new BorderLayout(0, 0));
        setBorder(new EmptyBorder(20, 20, 20, 20));
        add(buildHeader(), BorderLayout.NORTH);

        JScrollPane scroll = new JScrollPane(buildBody());
        scroll.setBorder(null);
        scroll.setOpaque(false);
        scroll.getViewport().setOpaque(false);
        scroll.getVerticalScrollBar().setUnitIncrement(16);
        scroll.getVerticalScrollBar().setUI(new ModernScrollBarUI());
        scroll.getHorizontalScrollBar().setUI(new ModernScrollBarUI());
        add(scroll, BorderLayout.CENTER);

        loadData();
    }

    // ── HEADER ───────────────────────────────────────────────
    private JPanel buildHeader() {
        JPanel p = new JPanel(new BorderLayout(12, 0));
        p.setOpaque(false);
        p.setBorder(new EmptyBorder(0, 0, 16, 0));

        JPanel left = new JPanel(new GridLayout(2, 1, 0, 4));
        left.setOpaque(false);
        JLabel t = new JLabel("Báo cáo & Thống kê");
        t.setFont(F_TITLE);
        t.setForeground(DARK);
        JLabel s = new JLabel("Tổng quan hiệu suất hoạt động và doanh thu.");
        s.setFont(F_BODY);
        s.setForeground(GRAY);
        left.add(t);
        left.add(s);

        // Tạo Filter Bar giống hình (2 dòng)
        JPanel filterBar = new JPanel(new BorderLayout(0, 16)) {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(Color.WHITE);
                g2.fillRoundRect(0, 0, getWidth() - 1, getHeight() - 1, 6, 6);
                g2.setColor(new Color(0xD1D5DB));
                g2.drawRoundRect(0, 0, getWidth() - 1, getHeight() - 1, 6, 6);
                g2.dispose();
            }
        };
        filterBar.setOpaque(false);
        filterBar.setBorder(new EmptyBorder(12, 16, 12, 16));

        JPanel topRow = new JPanel(new FlowLayout(FlowLayout.LEFT, 10, 0));
        topRow.setOpaque(false);

        // Date Tu Ngay & Den Ngay - Mặc định là ngày hiện tại
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        String today = sdf.format(new Date());

        txtTuNgay = new JTextField(today, 8);
        txtTuNgay.setBorder(null);
        txtTuNgay.setOpaque(false);
        txtTuNgay.setFont(F_BODY);

        JLabel lblDash = new JLabel("   -   ");
        lblDash.setForeground(GRAY);

        // Date Den Ngay
        txtDenNgay = new JTextField(today, 8);
        txtDenNgay.setBorder(null);
        txtDenNgay.setOpaque(false);
        txtDenNgay.setFont(F_BODY);

        // Separator
        JLabel lblSep = new JLabel("   |   ");
        lblSep.setForeground(new Color(0xD1D5DB));

        // Hang Bay - giao diện phẳng không viền, lấy từ DB
        DefaultComboBoxModel<Object> model = new DefaultComboBoxModel<>();
        model.addElement("Tất cả Hãng bay");
        try {
            // Sử dụng phương thức getAllAirlines để lấy cả ID và Name
            List<Object[]> airlines = bus.getAllAirlines();
            for (Object[] row : airlines) {
                model.addElement(new AirlineItem(row[0].toString(), row[1].toString()));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        cboHangBay = new JComboBox<>(model);
        cboHangBay.setFont(F_BODY);
        cboHangBay.setFocusable(false);
        cboHangBay.setOpaque(false);
        cboHangBay.setBackground(Color.WHITE);
        cboHangBay.setBorder(BorderFactory.createEmptyBorder(0, 2, 0, 2));
        // Xóa viền bằng UI tùy chỉnh
        cboHangBay.setUI(new javax.swing.plaf.basic.BasicComboBoxUI() {
            @Override
            protected JButton createArrowButton() {
                JButton b = new JButton("∨");
                b.setFont(new Font("Segoe UI", Font.PLAIN, 9));
                b.setForeground(GRAY);
                b.setContentAreaFilled(false);
                b.setBorderPainted(false);
                b.setFocusPainted(false);
                return b;
            }

            @Override
            public void paintCurrentValueBackground(Graphics g, Rectangle bounds, boolean hasFocus) {
                // Không vẽ nền
            }
        });
        cboHangBay.putClientProperty("JComboBox.hasBorders", false);

        // Icon lịch kèm date picker popup
        topRow.add(mkCalBtn(txtTuNgay));
        topRow.add(txtTuNgay);
        topRow.add(lblDash);
        topRow.add(mkCalBtn(txtDenNgay));
        topRow.add(txtDenNgay);
        topRow.add(lblSep);
        topRow.add(new JLabel(new TicketIcon()));
        topRow.add(cboHangBay);

        // Buttons
        JPanel botRow = new JPanel(new FlowLayout(FlowLayout.RIGHT, 10, 0));
        botRow.setOpaque(false);

        JButton btnRefresh = mkBtn("Làm mới", new Color(0xF3F4F6), DARK);
        btnRefresh.addActionListener(e -> loadData());

        JButton btn = mkBtn("Áp dụng", Color.BLACK, Color.WHITE);
        btn.addActionListener(e -> loadData());

        botRow.add(btnRefresh);
        botRow.add(btn);

        filterBar.add(topRow, BorderLayout.CENTER);
        filterBar.add(botRow, BorderLayout.SOUTH);

        // Đóng gói filterBar vào FlowLayout để nó không chiếm toàn bộ chiều cao
        JPanel rightPanel = new JPanel(new FlowLayout(FlowLayout.RIGHT, 0, 0));
        rightPanel.setOpaque(false);
        rightPanel.add(filterBar);

        p.add(left, BorderLayout.WEST);
        p.add(rightPanel, BorderLayout.EAST);
        return p;
    }

    private JButton mkBtn(String text, Color bg, Color fg) {
        JButton btn = new JButton(text);
        btn.setFont(new Font("Segoe UI", Font.BOLD, 12));
        btn.setBackground(bg);
        btn.setForeground(fg);
        btn.setBorderPainted(false);
        btn.setFocusPainted(false);
        btn.setPreferredSize(new Dimension(85, 30));
        btn.setMaximumSize(new Dimension(85, 30));
        btn.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        return btn;
    }


    // ── BODY ─────────────────────────────────────────────────
    /** Tạo nút icon lịch mở popup chọn ngày gắn vào txtField */
    private JButton mkCalBtn(JTextField target) {
        JButton btn = new JButton(new CalendarIcon());
        btn.setContentAreaFilled(false);
        btn.setBorderPainted(false);
        btn.setFocusPainted(false);
        btn.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        btn.setToolTipText("Chọn ngày");
        btn.addActionListener(e -> showDatePicker(btn, target));
        return btn;
    }

    /** Popup chọn ngày hiện đại với lưới lịch */
    private void showDatePicker(JButton source, JTextField target) {
        JPopupMenu popup = new JPopupMenu();
        popup.setBorder(BorderFactory.createLineBorder(new Color(0xD1D5DB)));
        popup.setBackground(Color.WHITE);

        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        Date initDate;
        try {
            initDate = sdf.parse(target.getText());
        } catch (Exception ex) {
            initDate = new Date();
        }

        CalendarPanel calPanel = new CalendarPanel(initDate, target, popup);
        popup.add(calPanel);
        popup.show(source, 0, source.getHeight() + 2);
    }

    private JPanel buildBody() {
        JPanel p = new JPanel(new BorderLayout(0, 14));
        p.setOpaque(false);
        p.add(buildKpiRow(), BorderLayout.NORTH);
        p.add(buildChartRow(), BorderLayout.CENTER);
        return p;
    }

    // ── KPI CARDS ─────────────────────────────────────────────
    private JPanel buildKpiRow() {
        JPanel row = new JPanel(new GridLayout(1, 4, 12, 0));
        row.setOpaque(false);

        lblDT = mkKpiVal("0");
        lblDC = mkKpiVal("0");
        lblCB = mkKpiVal("0");
        lblOcc = mkKpiVal("0%");

        row.add(mkCard("Tổng doanh thu (VND)", lblDT, new DollarIcon(),
                new JLabel("Từ các booking đã xác nhận")));
        row.add(mkCard("Tổng số đặt chỗ", lblDC, new EnvelopeIcon(),
                new JLabel("Tất cả các booking")));
        row.add(mkCard("Chuyến bay hoàn thành", lblCB, new PlaneIcon(),
                new JLabel("Trong khoảng thời gian chọn")));
        row.add(mkCard("Tỷ lệ lấp đầy ghế", lblOcc, new PercentIcon(),
                new JLabel("Toàn hệ thống (trừ vé hủy)")));
        return row;
    }

    /** Trend footer tĩnh (fallback) */

    private JLabel mkKpiVal(String txt) {
        JLabel l = new JLabel(txt);
        l.setFont(F_KPI);
        l.setForeground(new Color(0x0F172A));
        return l;
    }

    /** Card với footer là JComponent tùy ý (JPanel, JLabel,...) */
    private JPanel mkCard(String label, JLabel val, Object icon, JComponent footer) {
        JPanel c = mkCardBase();
        c.setLayout(new BorderLayout(0, 8));

        JPanel top = new JPanel(new BorderLayout());
        top.setOpaque(false);

        // Nhãn tiêu đề in đậm
        JLabel lbl = new JLabel(label);
        lbl.setFont(F_SMALL.deriveFont(Font.BOLD));
        lbl.setForeground(DARK);

        // Icon đặt trong khung nhỏ bo góc
        JPanel iconBox = new JPanel(new GridBagLayout()) {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(new Color(0xEBF5FF));
                g2.fillRoundRect(0, 0, getWidth(), getHeight(), 8, 8);
                g2.dispose();
            }
        };
        iconBox.setOpaque(false);
        iconBox.setPreferredSize(new Dimension(30, 30));
        JLabel ico = new JLabel();
        if (icon instanceof Icon) {
            ico.setIcon((Icon) icon);
        } else {
            ico.setText(String.valueOf(icon));
            ico.setFont(F_BODY.deriveFont(Font.BOLD, 13f));
            ico.setForeground(BLUE);
        }
        iconBox.add(ico);

        top.add(lbl, BorderLayout.WEST);
        top.add(iconBox, BorderLayout.EAST);

        c.add(top, BorderLayout.NORTH);
        c.add(val, BorderLayout.CENTER);
        if (footer != null) {
            if (footer instanceof JLabel) {
                footer.setFont(F_SMALL);
                footer.setForeground(GRAY);
            }
            c.add(footer, BorderLayout.SOUTH);
        }
        return c;
    }



    private JPanel mkCardBase() {
        JPanel c = new JPanel() {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(new Color(0, 0, 0, 16));
                g2.fillRoundRect(2, 3, getWidth() - 4, getHeight() - 3, 12, 12);
                g2.setColor(CARD);
                g2.fillRoundRect(0, 0, getWidth() - 3, getHeight() - 4, 12, 12);
                g2.dispose();
                super.paintComponent(g);
            }
        };
        c.setOpaque(false);
        c.setBorder(new EmptyBorder(14, 16, 14, 16));
        return c;
    }

    // ── CHART ROW ─────────────────────────────────────────────
    private JPanel buildChartRow() {
        JPanel outer = new JPanel(new BorderLayout(0, 12));
        outer.setOpaque(false);

        // Top: Line chart (doanh thu theo tháng)
        JPanel lc = mkCardBase();
        lc.setLayout(new BorderLayout(0, 8));
        lc.add(mkChartHeader("Xu hướng Doanh thu", "Theo tháng trong năm hiện tại"), BorderLayout.NORTH);
        lineChart = new LineChart(trendData);
        lc.add(lineChart, BorderLayout.CENTER);

        // Bottom row: Bar (trạng thái vé) + Pie (doanh thu hạng ghế)
        JPanel bottomRow = new JPanel(new GridLayout(1, 2, 12, 0));
        bottomRow.setOpaque(false);

        JPanel bc = mkCardBase();
        bc.setLayout(new BorderLayout(0, 8));
        bc.add(mkChartHeader("Tỉ lệ trạng thái Booking", "Phân bổ theo số lượng"), BorderLayout.NORTH);
        barChart = new BarChart(hangData);
        bc.add(barChart, BorderLayout.CENTER);

        JPanel pc = mkCardBase();
        pc.setLayout(new BorderLayout(0, 8));
        pc.add(mkChartHeader("Doanh thu theo Hạng ghế", "Phân bổ nguồn thu"), BorderLayout.NORTH);
        pieChart = new PieChart(revByClassData);
        pc.add(pieChart, BorderLayout.CENTER);

        bottomRow.add(bc);
        bottomRow.add(pc);

        outer.add(lc, BorderLayout.NORTH);
        outer.add(bottomRow, BorderLayout.CENTER);
        return outer;
    }

    private JPanel mkChartHeader(String title, String sub) {
        JPanel p = new JPanel(new GridLayout(2, 1, 0, 2));
        p.setOpaque(false);
        JLabel t = new JLabel(title);
        t.setFont(new Font("Segoe UI", Font.BOLD, 13));
        t.setForeground(DARK);
        JLabel s = new JLabel(sub);
        s.setFont(F_SMALL);
        s.setForeground(GRAY);
        p.add(t);
        p.add(s);
        return p;
    }

    // ── ACTIONS ───────────────────────────────────────────────
    private void loadData() {
        // Sử dụng SwingWorker để không làm treo UI khi truy vấn DB
        new SwingWorker<Object[], Void>() {
            @Override
            protected Object[] doInBackground() throws Exception {
                // 1. Lấy và parse tham số
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                java.sql.Date d1 = new java.sql.Date(sdf.parse(txtTuNgay.getText()).getTime());
                java.sql.Date d2 = new java.sql.Date(sdf.parse(txtDenNgay.getText()).getTime());

                String hangBay = "ALL";
                Object selected = cboHangBay.getSelectedItem();
                if (selected instanceof AirlineItem) {
                    hangBay = ((AirlineItem) selected).id;
                }

                // 2. Lấy dữ liệu KPI (thay vì View tổng)
                double dt = bus.getTongDoanhThu(d1, d2, hangBay);
                int dc = bus.getTongDatCho(d1, d2, hangBay);
                int cb = bus.getSoChuyenBayHoanThanh(d1, d2, hangBay);
                double occ = bus.getTyLeLapDay(d1, d2, hangBay);
                Object[] summary = { dt, dc, cb, occ };

                // 3. Lấy dữ liệu biểu đồ (có lọc)
                // Trend: lấy theo năm của ngày bắt đầu
                Calendar cal = Calendar.getInstance();
                cal.setTime(d1);
                double[] trend = bus.getDoanhThuTheoThang(cal.get(Calendar.YEAR), hangBay);

                List<Object[]> statusStats = bus.getBookingStatusStats(d1, d2, hangBay);
                List<Object[]> revByClass = bus.getDoanhThuTheoHang(d1, d2, hangBay);

                return new Object[] { summary, trend, statusStats, revByClass };
            }

            @Override
            @SuppressWarnings("unchecked")
            protected void done() {
                try {
                    Object[] results = get();
                    Object[] summary = (Object[]) results[0];
                    trendData = (double[]) results[1];
                    hangData = (List<Object[]>) results[2];
                    revByClassData = (List<Object[]>) results[3];

                    NumberFormat nf = NumberFormat.getNumberInstance(Locale.of("vi", "VN"));

                    lblDT.setText(nf.format(summary[0] != null ? summary[0] : 0));
                    lblDC.setText(nf.format(summary[1] != null ? summary[1] : 0));
                    lblCB.setText(nf.format(summary[2] != null ? summary[2] : 0));
                    double occ = summary[3] instanceof Number ? ((Number) summary[3]).doubleValue() : 0;
                    lblOcc.setText(String.format("%.2f%%", occ));

                    lineChart.setData(trendData);
                    barChart.setData(hangData);
                    pieChart.setData(revByClassData);

                } catch (Exception ex) {
                    JOptionPane.showMessageDialog(BaoCaoTKGUI.this, "Lỗi khi lấy dữ liệu: " + ex.getMessage(),
                            "Thông báo", JOptionPane.WARNING_MESSAGE);
                    ex.printStackTrace();
                }
            }
        }.execute();
    }

    // ══════════════════════════════════════════════════════════
    // INNER: Line Chart (Swing thuần)
    // ══════════════════════════════════════════════════════════
    static class LineChart extends JPanel {
        private double[] data;
        private static final String[] LBL = { "T1", "T2", "T3", "T4", "T5", "T6", "T7", "T8", "T9", "T10", "T11",
                "T12" };

        LineChart(double[] data) {
            this.data = data;
            setOpaque(false);
            setPreferredSize(new Dimension(0, 210));
        }

        void setData(double[] d) {
            data = d;
            repaint();
        }

        @Override
        protected void paintComponent(Graphics g) {
            super.paintComponent(g);
            if (data == null || data.length == 0)
                return;
            Graphics2D g2 = (Graphics2D) g.create();
            g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

            int W = getWidth(), H = getHeight();
            int pL = 48, pR = 8, pT = 12, pB = 28;
            int cW = W - pL - pR, cH = H - pT - pB;
            double mx = Arrays.stream(data).max().orElse(1);
            if (mx == 0)
                mx = 1;
            int n = data.length;
            int[] xs = new int[n], ys = new int[n];
            for (int i = 0; i < n; i++) {
                xs[i] = pL + cW * i / (n - 1);
                ys[i] = pT + cH - (int) (cH * data[i] / mx);
            }

            // grid
            g2.setFont(new Font("Segoe UI", Font.PLAIN, 9));
            for (int i = 0; i <= 4; i++) {
                int y = pT + cH - cH * i / 4;
                g2.setColor(new Color(0xE5E7EB));
                g2.drawLine(pL, y, W - pR, y);
                g2.setColor(GRAY);
                g2.drawString(fmt(mx * i / 4), 2, y + 4);
            }

            // fill
            GeneralPath fill = new GeneralPath();
            fill.moveTo(xs[0], pT + cH);
            fill.lineTo(xs[0], ys[0]);
            for (int i = 1; i < n; i++)
                fill.curveTo(
                        (xs[i - 1] + xs[i]) / 2.0, ys[i - 1],
                        (xs[i - 1] + xs[i]) / 2.0, ys[i], xs[i], ys[i]);
            fill.lineTo(xs[n - 1], pT + cH);
            fill.closePath();
            g2.setColor(new Color(29, 111, 164, 45)); // alpha fill
            g2.fill(fill);

            // line
            g2.setStroke(new BasicStroke(2.4f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND));
            g2.setColor(BLUE);
            GeneralPath line = new GeneralPath();
            line.moveTo(xs[0], ys[0]);
            for (int i = 1; i < n; i++)
                line.curveTo(
                        (xs[i - 1] + xs[i]) / 2.0, ys[i - 1],
                        (xs[i - 1] + xs[i]) / 2.0, ys[i], xs[i], ys[i]);
            g2.draw(line);

            // x-labels
            g2.setFont(new Font("Segoe UI", Font.PLAIN, 10));
            g2.setColor(GRAY);
            FontMetrics fm = g2.getFontMetrics();
            for (int i = 0; i < n; i++)
                g2.drawString(LBL[i], xs[i] - fm.stringWidth(LBL[i]) / 2, H - 4);
            g2.dispose();
        }

        private String fmt(double v) {
            if (v >= 1e9)
                return (int) (v / 1e9) + "B";
            if (v >= 1e6)
                return (int) (v / 1e6) + "M";
            return v == 0 ? "0" : String.valueOf((int) v);
        }
    }

    // ══════════════════════════════════════════════════════════
    // INNER: Custom Icons
    // ══════════════════════════════════════════════════════════
    static class CalendarIcon implements javax.swing.Icon {
        public int getIconWidth() {
            return 16;
        }

        public int getIconHeight() {
            return 16;
        }

        public void paintIcon(Component c, Graphics g, int x, int y) {
            Graphics2D g2 = (Graphics2D) g.create();
            g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            g2.setColor(new Color(0x6B7280)); // GRAY
            g2.setStroke(new BasicStroke(1.5f));
            g2.drawRoundRect(x + 2, y + 3, 12, 11, 3, 3);
            g2.drawLine(x + 2, y + 7, x + 14, y + 7);
            g2.drawLine(x + 5, y + 1, x + 5, y + 4);
            g2.drawLine(x + 11, y + 1, x + 11, y + 4);
            g2.dispose();
        }
    }

    static class TicketIcon implements javax.swing.Icon {
        public int getIconWidth() {
            return 16;
        }

        public int getIconHeight() {
            return 16;
        }

        public void paintIcon(Component c, Graphics g, int x, int y) {
            Graphics2D g2 = (Graphics2D) g.create();
            g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            g2.setColor(new Color(0x6B7280)); // GRAY
            g2.setStroke(new BasicStroke(1.5f));
            g2.translate(x + 8, y + 8);
            g2.rotate(Math.toRadians(-20)); // Góc nghiêng của vé
            g2.drawRoundRect(-7, -4, 14, 8, 2, 2);
            g2.fillOval(-1, -1, 2, 2); // Dấu chấm giữa
            g2.dispose();
        }
    }

    static class DollarIcon implements javax.swing.Icon {
        public int getIconWidth() {
            return 16;
        }

        public int getIconHeight() {
            return 16;
        }

        public void paintIcon(Component c, Graphics g, int x, int y) {
            Graphics2D g2 = (Graphics2D) g.create();
            g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            g2.setColor(BLUE);
            g2.setStroke(new BasicStroke(2f));
            g2.drawOval(x + 1, y + 1, 14, 14);
            g2.setFont(new Font("Segoe UI", Font.BOLD, 10));
            g2.drawString("$", x + 5, y + 12);
            g2.dispose();
        }
    }

    static class EnvelopeIcon implements javax.swing.Icon {
        public int getIconWidth() {
            return 16;
        }

        public int getIconHeight() {
            return 16;
        }

        public void paintIcon(Component c, Graphics g, int x, int y) {
            Graphics2D g2 = (Graphics2D) g.create();
            g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            g2.setColor(BLUE);
            g2.setStroke(new BasicStroke(1.5f));
            g2.drawRect(x + 1, y + 3, 14, 10);
            g2.drawLine(x + 1, y + 3, x + 8, y + 8);
            g2.drawLine(x + 15, y + 3, x + 8, y + 8);
            g2.dispose();
        }
    }

    static class PlaneIcon implements javax.swing.Icon {
        public int getIconWidth() {
            return 16;
        }

        public int getIconHeight() {
            return 16;
        }

        public void paintIcon(Component c, Graphics g, int x, int y) {
            Graphics2D g2 = (Graphics2D) g.create();
            g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            g2.setColor(BLUE);
            GeneralPath p = new GeneralPath();
            p.moveTo(x + 2, y + 8);
            p.lineTo(x + 14, y + 8);
            p.lineTo(x + 10, y + 4);
            p.lineTo(x + 6, y + 4);
            p.closePath();
            g2.fill(p);
            g2.fillRect(x + 7, y + 2, 2, 12);
            g2.dispose();
        }
    }

    static class PercentIcon implements javax.swing.Icon {
        public int getIconWidth() {
            return 16;
        }

        public int getIconHeight() {
            return 16;
        }

        public void paintIcon(Component c, Graphics g, int x, int y) {
            Graphics2D g2 = (Graphics2D) g.create();
            g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            g2.setColor(BLUE);
            g2.setStroke(new BasicStroke(1.8f));
            g2.drawOval(x + 2, y + 2, 4, 4);
            g2.drawOval(x + 10, y + 10, 4, 4);
            g2.drawLine(x + 14, y + 2, x + 2, y + 14);
            g2.dispose();
        }
    }

    // ══════════════════════════════════════════════════════════
    // INNER: Pie Chart – Doanh thu theo Hạng ghế
    // ══════════════════════════════════════════════════════════
    static class PieChart extends JPanel {
        private List<Object[]> data; // Object[]: {Seat_Class, Total_Revenue, Ticket_Count, Revenue_Percentage}
        private static final Color[] PIE_COLORS = {
                new Color(0x1D6FA4), GREEN,
                new Color(0xF59E0B), new Color(0xEF4444)
        };

        PieChart(List<Object[]> data) {
            this.data = data;
            setOpaque(false);
            setPreferredSize(new Dimension(0, 210));
        }

        void setData(List<Object[]> d) {
            data = d;
            repaint();
        }

        @Override
        protected void paintComponent(Graphics g) {
            super.paintComponent(g);
            Graphics2D g2 = (Graphics2D) g.create();
            g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

            int W = getWidth(), H = getHeight();
            if (data == null || data.isEmpty()) {
                g2.setColor(GRAY);
                g2.setFont(new Font("Segoe UI", Font.PLAIN, 12));
                g2.drawString("Không có dữ liệu", W / 2 - 50, H / 2);
                g2.dispose();
                return;
            }

            // Tính tổng để fallback nếu Revenue_Percentage = 0
            double total = data.stream().mapToDouble(r -> ((Number) r[1]).doubleValue()).sum();
            if (total == 0)
                total = 1;

            int diameter = Math.min(W - 130, H - 20);
            diameter = Math.max(diameter, 60);
            int cx = 10 + diameter / 2, cy = (H - diameter) / 2 + diameter / 2;
            int x0 = cx - diameter / 2, y0 = cy - diameter / 2;

            double start = 0;
            for (int i = 0; i < data.size(); i++) {
                Object[] row = data.get(i);
                double pct = ((Number) row[1]).doubleValue() / total * 100; // Tính % từ tổng
                double sweep = pct / 100.0 * 360.0;

                // Hiệu ứng 3D nhẹ bằng cách vẽ viền tối hơn
                g2.setColor(PIE_COLORS[i % PIE_COLORS.length].darker());
                g2.fillArc(x0, y0, diameter, diameter, (int) start, (int) sweep);
                g2.setColor(PIE_COLORS[i % PIE_COLORS.length]);
                g2.fillArc(x0, y0 - 2, diameter, diameter, (int) start, (int) sweep);

                start += sweep;
            }
            // Vòng tròn trắng giữa (donut) tạo chiều sâu
            int hole = (int) (diameter * 0.5);
            g2.setColor(new Color(240, 244, 248)); // Màu nền
            g2.fillOval(cx - hole / 2, cy - hole / 2, hole, hole);
            g2.setColor(Color.WHITE);
            g2.fillOval(cx - hole / 2, cy - hole / 2 - 2, hole, hole);

            // Legend bên phải
            int lx = x0 + diameter + 14;
            int ly = y0 + 10;
            g2.setFont(new Font("Segoe UI", Font.BOLD, 10));
            for (int i = 0; i < data.size(); i++) {
                Object[] row = data.get(i);
                String cls = (String) row[0];
                double pct = ((Number) row[1]).doubleValue() / total * 100; // Tính % từ tổng

                g2.setColor(PIE_COLORS[i % PIE_COLORS.length]);
                g2.fillRoundRect(lx, ly + i * 25, 12, 12, 4, 4);

                g2.setColor(DARK);
                g2.drawString(cls, lx + 18, ly + i * 25 + 10);
                g2.setFont(new Font("Segoe UI", Font.PLAIN, 10));
                g2.setColor(GRAY);
                g2.drawString(String.format("%.1f%%", pct), lx + 18, ly + i * 25 + 21);
                g2.setFont(new Font("Segoe UI", Font.BOLD, 10));
            }
            g2.dispose();
        }
    }

    // ══════════════════════════════════════════════════════════
    // INNER: Bar Chart (Swing thuần)
    // ══════════════════════════════════════════════════════════
    static class BarChart extends JPanel {
        private List<Object[]> data;
        private static final Color[] BARS = { GREEN, BLUE, new Color(0x9CA3AF), new Color(0xEF4444) };

        BarChart(List<Object[]> data) {
            this.data = data;
            setOpaque(false);
            setPreferredSize(new Dimension(0, 210));
        }

        void setData(List<Object[]> d) {
            data = d;
            repaint();
        }

        @Override
        protected void paintComponent(Graphics g) {
            super.paintComponent(g);
            if (data == null || data.isEmpty())
                return;
            Graphics2D g2 = (Graphics2D) g.create();
            g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

            int W = getWidth(), H = getHeight();
            int pL = 8, pR = 8, pT = 30, pB = 28;
            int cW = W - pL - pR, cH = H - pT - pB;
            int n = data.size();
            double mx = data.stream().mapToDouble(r -> ((Number) r[1]).doubleValue()).max().orElse(1);
            if (mx == 0)
                mx = 1;
            int gap = cW / n, bW = (int) (gap * 0.5);

            for (int i = 0; i < n; i++) {
                Object[] row = data.get(i);
                double val = ((Number) row[1]).doubleValue();
                double pct = row.length > 2 ? ((Number) row[2]).doubleValue() : 0;
                String name = (String) row[0];
                int bH = (int) (cH * val / mx);
                int x = pL + i * gap + (gap - bW) / 2, y = pT + cH - bH;

                // Gradient cho cột
                Color baseColor = BARS[i % BARS.length];
                GradientPaint gp = new GradientPaint(x, y, baseColor, x, y + bH, baseColor.darker());
                g2.setPaint(gp);
                g2.fillRoundRect(x, y, bW, bH, 8, 8);

                // Hiển thị PHẦN TRĂM trên đầu cột (đã tăng pT nên không lo bị cắt)
                g2.setFont(new Font("Segoe UI", Font.BOLD, 10));
                g2.setColor(DARK);
                String valStr = String.format("%.1f%%", pct);
                FontMetrics fmVal = g2.getFontMetrics();
                g2.drawString(valStr, x + bW / 2 - fmVal.stringWidth(valStr) / 2, y - 10);

                g2.setFont(new Font("Segoe UI", Font.PLAIN, 10));
                g2.setColor(GRAY);
                FontMetrics fm = g2.getFontMetrics();
                g2.drawString(name, x + bW / 2 - fm.stringWidth(name) / 2, H - 4);
            }
            g2.dispose();
        }
    }

    // ══════════════════════════════════════════════════════════
    // INNER: Modern ScrollBar UI
    // ══════════════════════════════════════════════════════════
    static class ModernScrollBarUI extends BasicScrollBarUI {
        @Override
        public void installUI(JComponent c) {
            super.installUI(c);
            scrollbar.setOpaque(false);
        }

        @Override
        protected JButton createDecreaseButton(int orientation) {
            return createZeroButton();
        }

        @Override
        protected JButton createIncreaseButton(int orientation) {
            return createZeroButton();
        }

        private JButton createZeroButton() {
            JButton b = new JButton();
            b.setPreferredSize(new Dimension(0, 0));
            return b;
        }

        @Override
        protected void paintTrack(Graphics g, JComponent c, Rectangle trackBounds) {
        }

        @Override
        protected void paintThumb(Graphics g, JComponent c, Rectangle thumbBounds) {
            Graphics2D g2 = (Graphics2D) g.create();
            g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            // Màu thumb mượt mà hơn
            g2.setColor(new Color(180, 180, 180, 120));
            int w = thumbBounds.width - 8; // Thu nhỏ lại cho thanh mảnh
            int h = thumbBounds.height - 4;
            g2.fillRoundRect(thumbBounds.x + 4, thumbBounds.y + 2, w, h, 8, 8);
            g2.dispose();
        }
    }

    // ══════════════════════════════════════════════════════════
    // INNER: Calendar Panel (Modern Date Picker)
    // ══════════════════════════════════════════════════════════
    static class CalendarPanel extends JPanel {
        private Calendar calendar;
        private JTextField targetField;
        private JPopupMenu popup;
        private JPanel daysPanel;
        private JLabel monthLabel;
        private SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

        CalendarPanel(Date initialDate, JTextField target, JPopupMenu popup) {
            this.calendar = Calendar.getInstance();
            this.calendar.setTime(initialDate);
            this.targetField = target;
            this.popup = popup;

            setLayout(new BorderLayout(0, 10));
            setBackground(Color.WHITE);
            setBorder(new EmptyBorder(10, 10, 10, 10));

            // Header: Month/Year + Buttons
            JPanel header = new JPanel(new BorderLayout());
            header.setOpaque(false);

            JButton btnPrev = mkNavBtn("<");
            JButton btnNext = mkNavBtn(">");

            monthLabel = new JLabel("", SwingConstants.CENTER);
            monthLabel.setFont(new Font("Segoe UI", Font.BOLD, 14));
            monthLabel.setForeground(DARK);

            btnPrev.addActionListener(e -> {
                calendar.add(Calendar.MONTH, -1);
                updateCalendar();
            });
            btnNext.addActionListener(e -> {
                calendar.add(Calendar.MONTH, 1);
                updateCalendar();
            });

            header.add(btnPrev, BorderLayout.WEST);
            header.add(monthLabel, BorderLayout.CENTER);
            header.add(btnNext, BorderLayout.EAST);

            // Weekdays Header
            JPanel weekdays = new JPanel(new GridLayout(1, 7));
            weekdays.setOpaque(false);
            String[] days = { "CN", "T2", "T3", "T4", "T5", "T6", "T7" };
            for (String d : days) {
                JLabel l = new JLabel(d, SwingConstants.CENTER);
                l.setFont(new Font("Segoe UI", Font.BOLD, 11));
                l.setForeground(GRAY);
                weekdays.add(l);
            }

            JPanel center = new JPanel(new BorderLayout(0, 5));
            center.setOpaque(false);
            center.add(weekdays, BorderLayout.NORTH);

            daysPanel = new JPanel(new GridLayout(6, 7, 2, 2));
            daysPanel.setOpaque(false);
            center.add(daysPanel, BorderLayout.CENTER);

            add(header, BorderLayout.NORTH);
            add(center, BorderLayout.CENTER);

            updateCalendar();
        }

        private JButton mkNavBtn(String t) {
            JButton b = new JButton(t);
            b.setFont(new Font("Segoe UI", Font.BOLD, 12));
            b.setFocusPainted(false);
            b.setContentAreaFilled(false);
            b.setBorderPainted(false);
            b.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
            b.setForeground(GRAY);
            return b;
        }

        private void updateCalendar() {
            daysPanel.removeAll();

            Calendar cal = (Calendar) calendar.clone();
            cal.set(Calendar.DAY_OF_MONTH, 1);
            int startDay = cal.get(Calendar.DAY_OF_WEEK); // 1 = Sunday
            int maxDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);

            SimpleDateFormat monthSdf = new SimpleDateFormat("'Tháng' MM, yyyy", Locale.of("vi", "VN"));
            monthLabel.setText(monthSdf.format(cal.getTime()));

            // Days of previous month
            cal.add(Calendar.MONTH, -1);
            int prevMaxDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
            for (int i = 1; i < startDay; i++) {
                JComponent b = mkDayBtn(String.valueOf(prevMaxDay - startDay + i + 1), false);
                daysPanel.add(b);
            }

            // Days of current month
            cal.add(Calendar.MONTH, 1);
            Calendar today = Calendar.getInstance();
            for (int i = 1; i <= maxDay; i++) {
                final int day = i;
                JLabel l = (JLabel) mkDayBtn(String.valueOf(i), true);

                // Highlight today
                if (cal.get(Calendar.YEAR) == today.get(Calendar.YEAR) &&
                        cal.get(Calendar.MONTH) == today.get(Calendar.MONTH) &&
                        i == today.get(Calendar.DAY_OF_MONTH)) {
                    l.setForeground(BLUE);
                    l.setFont(l.getFont().deriveFont(Font.BOLD));
                }

                l.addMouseListener(new java.awt.event.MouseAdapter() {
                    @Override
                    public void mouseEntered(java.awt.event.MouseEvent e) {
                        l.setOpaque(true);
                        l.setBackground(new Color(0xEBF5FF));
                        l.repaint();
                    }

                    @Override
                    public void mouseExited(java.awt.event.MouseEvent e) {
                        l.setOpaque(false);
                        l.repaint();
                    }

                    @Override
                    public void mouseClicked(java.awt.event.MouseEvent e) {
                        Calendar result = (Calendar) calendar.clone();
                        result.set(Calendar.DAY_OF_MONTH, day);
                        targetField.setText(sdf.format(result.getTime()));
                        popup.setVisible(false);
                    }
                });
                daysPanel.add(l);
            }

            // Fill remaining slots to make it 6 rows
            int currentCount = daysPanel.getComponentCount();
            for (int i = 1; i <= 42 - currentCount; i++) {
                JComponent b = mkDayBtn(String.valueOf(i), false);
                daysPanel.add(b);
            }

            daysPanel.revalidate();
            daysPanel.repaint();
        }

        private JComponent mkDayBtn(String text, boolean active) {
            JLabel l = new JLabel(text, SwingConstants.CENTER);
            l.setFont(new Font("Segoe UI", Font.PLAIN, 11));
            l.setPreferredSize(new Dimension(35, 30));
            if (active) {
                l.setForeground(DARK);
                l.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
            } else {
                l.setForeground(new Color(0xD1D5DB));
            }
            return l;
        }
    }
}
