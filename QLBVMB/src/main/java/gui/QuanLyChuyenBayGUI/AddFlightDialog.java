package gui.QuanLyChuyenBayGUI;

import dto.FlightDTO;
import java.awt.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.UUID;
import javax.swing.*;
import javax.swing.border.*;

import bus.QuanLyChuyenBayBUS.ChuyenBayBUS;
import util.DBConnection;

public class AddFlightDialog extends javax.swing.JDialog {

    private static final Color PRIMARY = new Color(0, 37, 71);
    private static final Color SURFACE_LOW = new Color(240, 244, 248);
    private static final Color SURFACE_LOWEST = Color.WHITE;
    private static final Color SURFACE_CONTAINER = new Color(234, 238, 242);
    private static final Color OUTLINE_VARIANT = new Color(195, 198, 207);
    private static final Color ON_SURFACE_VAR = new Color(67, 71, 78);

    private static final Font FONT_TITLE = new Font("Inter", Font.BOLD, 22);
    private static final Font FONT_CAP = new Font("Inter", Font.BOLD, 11);
    private static final Font FONT_INPUT = new Font("Inter", Font.PLAIN, 14);
    private static final Font FONT_BTN = new Font("Inter", Font.BOLD, 13);

    private QuanLyChuyenBayPanel parentPanel;
    private JTextField txtSoHieu, txtGate;
    private JTextField txtPriceEco, txtPriceBus, txtPricePrem, txtPriceFirst;
    private JComboBox<String> cbHangBay, cbTauBay, cbSanBayDi, cbSanBayDen;

    // Đã thay JTextField thành JSpinner để chọn Ngày Giờ
    private JSpinner spnKhoiHanh, spnHaCanh;

    public AddFlightDialog(Frame parent, boolean modal, QuanLyChuyenBayPanel panel) {
        super(parent, modal);
        this.parentPanel = panel;
        initComponents();
        loadDropdownData();
        setLocationRelativeTo(parent);
    }

    private void initComponents() {
        setTitle("Thêm chuyến bay mới");
        setDefaultCloseOperation(DISPOSE_ON_CLOSE);
        setResizable(false);
        getContentPane().setBackground(SURFACE_LOWEST);
        getContentPane().setLayout(new BorderLayout());

        JPanel headerPanel = new JPanel(new BorderLayout());
        headerPanel.setBackground(SURFACE_LOWEST);
        headerPanel.setBorder(BorderFactory.createCompoundBorder(
                BorderFactory.createMatteBorder(0, 0, 1, 0,
                        new Color(OUTLINE_VARIANT.getRed(), OUTLINE_VARIANT.getGreen(), OUTLINE_VARIANT.getBlue(), 40)),
                new EmptyBorder(20, 24, 20, 24)));

        JLabel lblTitle = new JLabel("Thêm chuyến bay mới");
        lblTitle.setFont(FONT_TITLE);
        lblTitle.setForeground(PRIMARY);
        headerPanel.add(lblTitle, BorderLayout.WEST);

        JPanel bodyPanel = new JPanel();
        bodyPanel.setLayout(new BoxLayout(bodyPanel, BoxLayout.Y_AXIS));
        bodyPanel.setBackground(SURFACE_LOWEST);
        bodyPanel.setBorder(new EmptyBorder(20, 24, 20, 24));

        txtSoHieu = makeInputField("Nhập số hiệu (VD: VN-123)...");
        bodyPanel.add(makeFieldBlock("SỐ HIỆU CHUYẾN BAY", txtSoHieu));
        bodyPanel.add(Box.createVerticalStrut(12));

        cbHangBay = makeComboBox();
        bodyPanel.add(makeFieldBlock("HÃNG HÀNG KHÔNG", cbHangBay));
        bodyPanel.add(Box.createVerticalStrut(12));

        cbTauBay = makeComboBox();
        bodyPanel.add(makeFieldBlock("TÀU BAY THỰC HIỆN", cbTauBay));
        bodyPanel.add(Box.createVerticalStrut(12));

        cbSanBayDi = makeComboBox();
        bodyPanel.add(makeFieldBlock("SÂN BAY ĐI", cbSanBayDi));
        bodyPanel.add(Box.createVerticalStrut(12));

        cbSanBayDen = makeComboBox();
        bodyPanel.add(makeFieldBlock("SÂN BAY ĐẾN", cbSanBayDen));
        bodyPanel.add(Box.createVerticalStrut(12));

        // Khởi tạo JSpinner cho Khởi Hành và Hạ Cánh
        spnKhoiHanh = makeDateSpinner();
        bodyPanel.add(makeFieldBlock("THỜI GIAN KHỞI HÀNH", spnKhoiHanh));
        bodyPanel.add(Box.createVerticalStrut(12));

        spnHaCanh = makeDateSpinner();
        bodyPanel.add(makeFieldBlock("THỜI GIAN HẠ CÁNH", spnHaCanh));
        bodyPanel.add(Box.createVerticalStrut(12));

        txtGate = makeInputField("Nhập cổng ra máy bay...");
        bodyPanel.add(makeFieldBlock("CỔNG (GATE)", txtGate));
        bodyPanel.add(Box.createVerticalStrut(12));

        // --- BỔ SUNG: GIÁ NỀN CHO CÁC HẠNG GHẾ ---
        txtPriceEco = makeInputField("Giá hạng Phổ thông (Economy)...");
        bodyPanel.add(makeFieldBlock("GIÁ PHỔ THÔNG (VND)", txtPriceEco));
        bodyPanel.add(Box.createVerticalStrut(12));

        txtPriceBus = makeInputField("Giá hạng Thương gia (Business)...");
        bodyPanel.add(makeFieldBlock("GIÁ THƯƠNG GIA (VND)", txtPriceBus));
        bodyPanel.add(Box.createVerticalStrut(12));

        txtPricePrem = makeInputField("Giá Phổ thông Đặc biệt (Premium Economy)...");
        bodyPanel.add(makeFieldBlock("GIÁ PHỔ THÔNG ĐẶC BIỆT (VND)", txtPricePrem));
        bodyPanel.add(Box.createVerticalStrut(12));

        txtPriceFirst = makeInputField("Giá Hạng nhất (First Class)...");
        bodyPanel.add(makeFieldBlock("GIÁ HẠNG NHẤT (VND)", txtPriceFirst));

        JPanel footerPanel = new JPanel(new FlowLayout(FlowLayout.RIGHT, 12, 12));
        footerPanel.setBackground(SURFACE_CONTAINER);
        footerPanel.setBorder(BorderFactory.createMatteBorder(1, 0, 0, 0,
                new Color(OUTLINE_VARIANT.getRed(), OUTLINE_VARIANT.getGreen(), OUTLINE_VARIANT.getBlue(), 40)));

        JButton btnSkip = makeCancelButton("Hủy");
        btnSkip.addActionListener(e -> dispose());

        JButton btnAdd = makePrimaryButton("Thêm chuyến bay");
        btnAdd.addActionListener(this::btnAddActionPerformed);

        footerPanel.add(btnSkip);
        footerPanel.add(btnAdd);

        getContentPane().add(headerPanel, BorderLayout.NORTH);
        JScrollPane scrollPane = new JScrollPane(bodyPanel);
        scrollPane.setBorder(null);
        getContentPane().add(scrollPane, BorderLayout.CENTER);
        getContentPane().add(footerPanel, BorderLayout.SOUTH);

        pack();
        setPreferredSize(new Dimension(500, 800));
        setSize(500, 800);
    }

    private void loadDropdownData() {
        try (Connection conn = DBConnection.getConnection();
                Statement stmt = conn.createStatement()) {

            ResultSet rsAirline = stmt.executeQuery("SELECT AirlineID, AirlineName FROM AIRLINE");
            while (rsAirline.next()) {
                cbHangBay.addItem(rsAirline.getString(1) + " - " + rsAirline.getString(2));
            }

            ResultSet rsAirport = stmt.executeQuery("SELECT AirportID, AirportName FROM AIRPORT");
            while (rsAirport.next()) {
                String ap = rsAirport.getString(1) + " - " + rsAirport.getString(2);
                cbSanBayDi.addItem(ap);
                cbSanBayDen.addItem(ap);
            }
            
            // Lắng nghe sự kiện đổi Hãng bay để load Tàu bay tương ứng
            cbHangBay.addActionListener(e -> {
                if (cbHangBay.getSelectedItem() != null) {
                    String airlineID = cbHangBay.getSelectedItem().toString().split(" - ")[0];
                    loadAircrafts(airlineID);
                }
            });
            
            // Load tàu bay lần đầu tiên
            if (cbHangBay.getItemCount() > 0) {
                cbHangBay.setSelectedIndex(0);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void loadAircrafts(String airlineID) {
        cbTauBay.removeAllItems();
        String sql = "SELECT AircraftID, Model FROM AIRCRAFT WHERE AirlineID = ?";
        try (Connection conn = DBConnection.getConnection();
             java.sql.PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, airlineID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cbTauBay.addItem(rs.getString(1) + " - " + rs.getString(2));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void btnAddActionPerformed(java.awt.event.ActionEvent evt) {
        try {
            if (txtSoHieu.getText().trim().isEmpty() || cbHangBay.getSelectedItem() == null
                    || cbTauBay.getSelectedItem() == null || cbSanBayDi.getSelectedItem() == null
                    || txtPriceEco.getText().trim().isEmpty() || txtPriceBus.getText().trim().isEmpty() 
                    || txtPricePrem.getText().trim().isEmpty() || txtPriceFirst.getText().trim().isEmpty()) {
                JOptionPane.showMessageDialog(this, "Vui lòng nhập đủ thông tin và giá vé!", "Cảnh báo",
                        JOptionPane.WARNING_MESSAGE);
                return;
            }

            double priceEco = 0, priceBus = 0, pricePrem = 0, priceFirst = 0;
            try {
                priceEco = Double.parseDouble(txtPriceEco.getText().trim());
                priceBus = Double.parseDouble(txtPriceBus.getText().trim());
                pricePrem = Double.parseDouble(txtPricePrem.getText().trim());
                priceFirst = Double.parseDouble(txtPriceFirst.getText().trim());

                if (priceEco <= 0 || priceBus <= 0 || pricePrem <= 0 || priceFirst <= 0) {
                    JOptionPane.showMessageDialog(this, "Giá vé phải lớn hơn 0!", "Lỗi", JOptionPane.ERROR_MESSAGE);
                    return;
                }
            } catch (NumberFormatException e) {
                JOptionPane.showMessageDialog(this, "Vui lòng nhập giá vé là số hợp lệ!", "Lỗi", JOptionPane.ERROR_MESSAGE);
                return;
            }

            String hangBayID = cbHangBay.getSelectedItem().toString().split(" - ")[0];
            String tauBayID = cbTauBay.getSelectedItem().toString().split(" - ")[0];
            String sbDiID = cbSanBayDi.getSelectedItem().toString().split(" - ")[0];
            String sbDenID = cbSanBayDen.getSelectedItem().toString().split(" - ")[0];

            if (sbDiID.equals(sbDenID)) {
                JOptionPane.showMessageDialog(this, "Sân bay đi và đến không được trùng nhau!", "Lỗi",
                        JOptionPane.ERROR_MESSAGE);
                return;
            }

            // Lấy giá trị trực tiếp từ Spinner thành dạng Date (Không cần parse chuỗi nữa)
            java.util.Date depDate = (java.util.Date) spnKhoiHanh.getValue();
            java.util.Date arrDate = (java.util.Date) spnHaCanh.getValue();

            // Ràng buộc sơ bộ: Giờ hạ cánh phải sau giờ khởi hành
            if (arrDate.before(depDate) || arrDate.equals(depDate)) {
                JOptionPane.showMessageDialog(this, "Thời gian hạ cánh phải sau thời gian khởi hành!", "Lỗi logic",
                        JOptionPane.ERROR_MESSAGE);
                return;
            }

            String randomID = "FL" + UUID.randomUUID().toString().substring(0, 6).toUpperCase();

            FlightDTO newFlight = new FlightDTO(
                    randomID, txtSoHieu.getText().trim(), hangBayID,
                    tauBayID, null,
                    depDate, arrDate, txtGate.getText().trim(), "SCHEDULED");

            if (new ChuyenBayBUS().themChuyenBay(newFlight, sbDiID, sbDenID, priceEco, priceBus, pricePrem, priceFirst)) {
                JOptionPane.showMessageDialog(this, "Thêm chuyến bay thành công!", "Thành công",
                        JOptionPane.INFORMATION_MESSAGE);
                if (parentPanel != null)
                    parentPanel.loadDataToTable();
                dispose();
            } else {
                JOptionPane.showMessageDialog(this, "Thêm thất bại. Có thể do máy bay bị trùng lịch, lỗi ràng buộc, hoặc số hiệu bị trùng!", "Lỗi",
                        JOptionPane.ERROR_MESSAGE);
            }
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(this, "Lỗi hệ thống: " + ex.getMessage(), "Lỗi", JOptionPane.ERROR_MESSAGE);
        }
    }

    // --- HÀM TẠO JSPINNER (Xịn xò, ngăn lỗi gõ bậy) ---
    private JSpinner makeDateSpinner() {
        SpinnerDateModel model = new SpinnerDateModel(new java.util.Date(), null, null, java.util.Calendar.MINUTE);
        JSpinner spinner = new JSpinner(model);
        JSpinner.DateEditor editor = new JSpinner.DateEditor(spinner, "yyyy-MM-dd HH:mm:ss");
        spinner.setEditor(editor);

        // Làm đẹp cho giống JTextField
        JFormattedTextField tf = editor.getTextField();
        tf.setFont(FONT_INPUT);
        tf.setBackground(SURFACE_LOW);
        tf.setForeground(ON_SURFACE_VAR);
        tf.setBorder(BorderFactory.createCompoundBorder(
                BorderFactory.createLineBorder(
                        new Color(OUTLINE_VARIANT.getRed(), OUTLINE_VARIANT.getGreen(), OUTLINE_VARIANT.getBlue(), 80)),
                new EmptyBorder(8, 12, 8, 12)));

        return spinner;
    }

    private JPanel makeFieldBlock(String labelText, JComponent field) {
        JPanel block = new JPanel();
        block.setLayout(new BoxLayout(block, BoxLayout.Y_AXIS));
        block.setOpaque(false);
        block.setAlignmentX(Component.LEFT_ALIGNMENT);

        JLabel lbl = new JLabel(labelText);
        lbl.setFont(FONT_CAP);
        lbl.setForeground(ON_SURFACE_VAR);
        lbl.setAlignmentX(Component.LEFT_ALIGNMENT);

        field.setAlignmentX(Component.LEFT_ALIGNMENT);
        field.setMaximumSize(new Dimension(Integer.MAX_VALUE, 36));

        block.add(lbl);
        block.add(Box.createVerticalStrut(4));
        block.add(field);
        return block;
    }

    private JTextField makeInputField(String placeholder) {
        JTextField tf = new JTextField();
        tf.setFont(FONT_INPUT);
        tf.setBackground(SURFACE_LOW);
        tf.setBorder(BorderFactory.createCompoundBorder(
                BorderFactory.createLineBorder(
                        new Color(OUTLINE_VARIANT.getRed(), OUTLINE_VARIANT.getGreen(), OUTLINE_VARIANT.getBlue(), 80)),
                new EmptyBorder(8, 12, 8, 12)));
        tf.putClientProperty("JTextField.placeholderText", placeholder);
        return tf;
    }

    private JComboBox<String> makeComboBox() {
        JComboBox<String> cb = new JComboBox<>();
        cb.setFont(FONT_INPUT);
        cb.setBackground(SURFACE_LOW);
        return cb;
    }

    private JButton makePrimaryButton(String text) {
        JButton btn = new JButton(text) {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(PRIMARY);
                g2.fillRoundRect(0, 0, getWidth(), getHeight(), 8, 8);
                g2.dispose(); // Thêm dòng này để giải phóng tài nguyên
                super.paintComponent(g);
            }
        };
        btn.setFont(FONT_BTN);
        btn.setForeground(Color.WHITE);
        btn.setContentAreaFilled(false);
        btn.setBorderPainted(false);
        btn.setCursor(new Cursor(Cursor.HAND_CURSOR));

        // CHỈNH Ở ĐÂY: Ép chiều rộng 150 để bằng nút Hủy
        btn.setPreferredSize(new Dimension(150, 36));
        return btn;
    }

    private JButton makeCancelButton(String text) {
        JButton btn = new JButton(text) {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                GradientPaint gp = new GradientPaint(0, 0, new Color(186, 26, 26), getWidth(), getHeight(),
                        new Color(140, 15, 15));
                g2.setPaint(gp);
                g2.fillRoundRect(0, 0, getWidth(), getHeight(), 8, 8);
                g2.dispose();
                super.paintComponent(g);
            }
        };
        btn.setFont(new Font("Inter", Font.BOLD, 13));
        btn.setForeground(Color.WHITE);
        btn.setContentAreaFilled(false);
        btn.setBorderPainted(false);
        btn.setFocusPainted(false);
        btn.setCursor(new Cursor(Cursor.HAND_CURSOR));

        // CHỈNH Ở ĐÂY: Để 150 cho đồng bộ với nút Thêm
        btn.setPreferredSize(new Dimension(150, 36));
        return btn;
    }
}