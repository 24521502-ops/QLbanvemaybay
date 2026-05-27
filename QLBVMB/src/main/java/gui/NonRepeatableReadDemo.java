package gui;

import com.formdev.flatlaf.FlatClientProperties;
import net.miginfocom.swing.MigLayout;
import util.DBConnection;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;

/**
 * Standalone GUI application to demonstrate the "Non-Repeatable Read" anomaly.
 * It simulates two concurrent transactions (Customer and Admin) and allows
 * toggling the isolation level between READ COMMITTED and SERIALIZABLE.
 */
public class NonRepeatableReadDemo extends JFrame {

    private static final Color PRIMARY = new Color(0, 102, 138);
    private static final Color BG_PAGE = new Color(248, 249, 255);
    private static final Color TEXT_DARK = new Color(11, 28, 48);
    private static final Color SURFACE = Color.WHITE;
    private static final Color GREEN_TEXT = new Color(22, 163, 74);
    private static final Color RED_TEXT = new Color(220, 38, 38);

    private JRadioButton rbReadCommitted;
    private JRadioButton rbSerializable;

    private JLabel lblRead1;
    private JLabel lblRead2;
    private JTextField tfNewPrice;
    private JTextArea taLog;

    private JButton btnStep1;
    private JButton btnStep2;
    private JButton btnStep3;
    private JButton btnReset;

    // Transaction State
    private Connection customerConn;
    private double priceRead1 = -1;
    private double priceRead2 = -1;

    private final String demoFlightID = "FL_TEST_01";
    private final String demoClass = "Economy";
    private final DecimalFormat df = new DecimalFormat("#,### đ");

    public NonRepeatableReadDemo() {
        setTitle("Demo Cô Lập Giao Dịch - Non-Repeatable Read");
        setSize(960, 680);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(DISPOSE_ON_CLOSE);
        getContentPane().setBackground(BG_PAGE);

        initComponents();
        setupDemoData();
        resetDemoState();
    }

    private void initComponents() {
        setLayout(new MigLayout("wrap, insets 24, fill", "[grow, fill]", "[]16[]16[grow, fill]"));

        // ===== HEADER PANEL =====
        JPanel headerPanel = new JPanel(new MigLayout("insets 0", "[grow] [pref!]"));
        headerPanel.setOpaque(false);

        JLabel lblTitle = new JLabel("Mô phỏng Hiện tượng Đọc không lặp lại (Non-Repeatable Read)");
        lblTitle.setFont(new Font("Segoe UI", Font.BOLD, 22));
        lblTitle.setForeground(TEXT_DARK);
        headerPanel.add(lblTitle);

        btnReset = new JButton("Khởi động lại Demo");
        btnReset.setFont(new Font("Segoe UI", Font.BOLD, 13));
        btnReset.putClientProperty(FlatClientProperties.STYLE, "arc:8; background:#e2e8f0; color:#475569");
        btnReset.addActionListener(e -> resetDemoState());
        headerPanel.add(btnReset, "right");

        add(headerPanel);

        // ===== CONFIGURATION & SPLIT WORKSPACE =====
        JPanel mainWorkspace = new JPanel(new MigLayout("insets 0, fill, gapx 20", "[450!] [grow, fill]", "[grow, fill]"));
        mainWorkspace.setOpaque(false);

        // Left Card: Transaction 1 (Customer Session)
        JPanel customerCard = new JPanel(new MigLayout("wrap, insets 20, fillx, gapy 12", "[grow, fill]"));
        customerCard.setBackground(SURFACE);
        customerCard.putClientProperty(FlatClientProperties.STYLE, "arc:16; borderColor:#e2e8f0; borderWidth:1");

        JLabel lblCustTitle = new JLabel("Giao dịch 1: Khách hàng mua vé");
        lblCustTitle.setFont(new Font("Segoe UI", Font.BOLD, 16));
        lblCustTitle.setForeground(PRIMARY);
        customerCard.add(lblCustTitle, "gapy 0 10");

        // Isolation Selector inside Transaction 1 card
        JPanel isoPanel = new JPanel(new MigLayout("insets 0, wrap", "[grow, fill]", "[]8[]"));
        isoPanel.setOpaque(false);
        JLabel lblIso = new JLabel("1. Chọn Mức Cô Lập (Isolation Level):");
        lblIso.setFont(new Font("Segoe UI", Font.BOLD, 13));
        isoPanel.add(lblIso);

        rbReadCommitted = new JRadioButton("READ COMMITTED (Cho phép đọc không lặp lại)");
        rbReadCommitted.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        rbReadCommitted.setSelected(true);
        rbSerializable = new JRadioButton("SERIALIZABLE (Ngăn chặn đọc không lặp lại)");
        rbSerializable.setFont(new Font("Segoe UI", Font.PLAIN, 13));

        ButtonGroup bg = new ButtonGroup();
        bg.add(rbReadCommitted);
        bg.add(rbSerializable);
        isoPanel.add(rbReadCommitted);
        isoPanel.add(rbSerializable);
        customerCard.add(isoPanel, "gapy 0 10");

        customerCard.add(new JSeparator(), "gapy 5 5");

        // Step 1 Trigger
        btnStep1 = new JButton("Bước 1: Mở Giao dịch & Đọc giá lần 1");
        btnStep1.setFont(new Font("Segoe UI", Font.BOLD, 14));
        btnStep1.setBackground(PRIMARY);
        btnStep1.setForeground(Color.WHITE);
        btnStep1.putClientProperty(FlatClientProperties.STYLE, "arc:8");
        btnStep1.addActionListener(e -> runStep1());
        customerCard.add(btnStep1);

        JPanel read1Pnl = new JPanel(new BorderLayout());
        read1Pnl.setOpaque(false);
        JLabel lblR1Text = new JLabel("Kết quả đọc lần 1 (Giá vé):");
        lblR1Text.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        lblRead1 = new JLabel("---");
        lblRead1.setFont(new Font("Segoe UI", Font.BOLD, 16));
        lblRead1.setForeground(TEXT_DARK);
        read1Pnl.add(lblR1Text, BorderLayout.WEST);
        read1Pnl.add(lblRead1, BorderLayout.EAST);
        customerCard.add(read1Pnl, "gapy 0 10");

        customerCard.add(new JSeparator(), "gapy 5 5");

        // Step 3 Trigger
        btnStep3 = new JButton("Bước 3: Đọc giá lần 2 & Commit");
        btnStep3.setFont(new Font("Segoe UI", Font.BOLD, 14));
        btnStep3.setBackground(PRIMARY);
        btnStep3.setForeground(Color.WHITE);
        btnStep3.putClientProperty(FlatClientProperties.STYLE, "arc:8");
        btnStep3.addActionListener(e -> runStep3());
        customerCard.add(btnStep3);

        JPanel read2Pnl = new JPanel(new BorderLayout());
        read2Pnl.setOpaque(false);
        JLabel lblR2Text = new JLabel("Kết quả đọc lần 2 (Giá vé):");
        lblR2Text.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        lblRead2 = new JLabel("---");
        lblRead2.setFont(new Font("Segoe UI", Font.BOLD, 16));
        lblRead2.setForeground(TEXT_DARK);
        read2Pnl.add(lblR2Text, BorderLayout.WEST);
        read2Pnl.add(lblRead2, BorderLayout.EAST);
        customerCard.add(read2Pnl);

        mainWorkspace.add(customerCard, "growy");

        // Right Card: Transaction 2 (Admin price update)
        JPanel adminCard = new JPanel(new MigLayout("wrap, insets 20, fillx, gapy 12", "[grow, fill]"));
        adminCard.setBackground(SURFACE);
        adminCard.putClientProperty(FlatClientProperties.STYLE, "arc:16; borderColor:#e2e8f0; borderWidth:1");

        JLabel lblAdminTitle = new JLabel("Giao dịch 2: Admin sửa giá vé");
        lblAdminTitle.setFont(new Font("Segoe UI", Font.BOLD, 16));
        lblAdminTitle.setForeground(new Color(180, 83, 9)); // Amber dark
        adminCard.add(lblAdminTitle, "gapy 0 10");

        JLabel lblInputPrice = new JLabel("2. Nhập giá vé mới muốn thay đổi:");
        lblInputPrice.setFont(new Font("Segoe UI", Font.BOLD, 13));
        adminCard.add(lblInputPrice);

        tfNewPrice = new JTextField("1,800,000");
        tfNewPrice.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        tfNewPrice.putClientProperty(FlatClientProperties.STYLE, "arc:8");
        adminCard.add(tfNewPrice, "h 38!");

        adminCard.add(new JSeparator(), "gapy 5 5");

        btnStep2 = new JButton("Bước 2: Admin Cập nhật giá & Commit");
        btnStep2.setFont(new Font("Segoe UI", Font.BOLD, 14));
        btnStep2.setBackground(new Color(217, 119, 6)); // Amber main
        btnStep2.setForeground(Color.WHITE);
        btnStep2.putClientProperty(FlatClientProperties.STYLE, "arc:8");
        btnStep2.addActionListener(e -> runStep2());
        adminCard.add(btnStep2, "gapy 10 0");

        JLabel lblTip = new JLabel("<html><body style='width:360px'><b>Hướng dẫn thực hành:</b><br>"
                + "1. Nhấn <b>Bước 1</b> để mở giao dịch Khách hàng và đọc giá vé hiện tại.<br>"
                + "2. Nhập giá vé mới bên phải, rồi nhấn <b>Bước 2</b> để Admin thay đổi giá và commit ngay lập tức.<br>"
                + "3. Quay lại bên trái, nhấn <b>Bước 3</b> để Khách hàng đọc lại giá lần thứ 2.<br>"
                + "4. So sánh kết quả của 2 lần đọc tương ứng với mức cô lập đã chọn!</body></html>");
        lblTip.setFont(new Font("Segoe UI", Font.PLAIN, 12));
        lblTip.setForeground(new Color(100, 116, 139));
        adminCard.add(lblTip, "gapy 20 0");

        mainWorkspace.add(adminCard, "grow");
        add(mainWorkspace);

        // ===== LOG PANEL =====
        JPanel logPanel = new JPanel(new BorderLayout(0, 8));
        logPanel.setOpaque(false);

        JLabel lblLog = new JLabel("Nhật ký chi tiết các lệnh SQL & Hiện tượng:");
        lblLog.setFont(new Font("Segoe UI", Font.BOLD, 14));
        lblLog.setForeground(TEXT_DARK);
        logPanel.add(lblLog, BorderLayout.NORTH);

        taLog = new JTextArea();
        taLog.setFont(new Font("Consolas", Font.PLAIN, 12));
        taLog.setEditable(false);
        taLog.setBackground(new Color(15, 23, 42)); // Slate 900
        taLog.setForeground(new Color(241, 245, 249)); // Slate 100
        taLog.setMargin(new Insets(12, 12, 12, 12));

        JScrollPane logScroll = new JScrollPane(taLog);
        logScroll.setBorder(BorderFactory.createLineBorder(new Color(226, 232, 240)));
        logScroll.putClientProperty(FlatClientProperties.STYLE, "arc:12");
        logPanel.add(logScroll, BorderLayout.CENTER);

        add(logPanel, "grow");
    }

    private void setupDemoData() {
        // Ensure test data exists in the database
        try (Connection conn = DBConnection.getConnection()) {
            if (conn == null) {
                log("!!! Không thể kết nối cơ sở dữ liệu. Vui lòng kiểm tra file DBConnection.");
                return;
            }
            conn.setAutoCommit(true);

            // Check if flight FL_TEST_01 exists
            String checkFlight = "SELECT COUNT(*) FROM FLIGHT WHERE FlightID = ?";
            boolean flightExists = false;
            try (PreparedStatement ps = conn.prepareStatement(checkFlight)) {
                ps.setString(1, demoFlightID);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next() && rs.getInt(1) > 0) {
                        flightExists = true;
                    }
                }
            }

            if (!flightExists) {
                log(">>> Đang khởi tạo Chuyến bay thử nghiệm " + demoFlightID + "...");
                // Insert a dummy airline and aircraft if needed, but let's assume they exist
                // We'll insert directly
                String insertFlight = "INSERT INTO FLIGHT (FlightID, FlightNumber, AirlineID, AircraftID, RouteID, DepartureTime, ArrivalTime, Gate, FlightStatus) " +
                                      "VALUES (?, 'VN-DEMO', 'AL01', 'AC01', 'R01', SYSDATE+2, SYSDATE+2.1, 'Gate 1', 'SCHEDULED')";
                try (PreparedStatement ps = conn.prepareStatement(insertFlight)) {
                    ps.setString(1, demoFlightID);
                    ps.executeUpdate();
                }
            }

            // Check if seat class price exists
            String checkPrice = "SELECT COUNT(*) FROM SEATCLASSPRICE WHERE FlightID = ? AND Class = ?";
            boolean priceExists = false;
            try (PreparedStatement ps = conn.prepareStatement(checkPrice)) {
                ps.setString(1, demoFlightID);
                ps.setString(2, demoClass);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next() && rs.getInt(1) > 0) {
                        priceExists = true;
                    }
                }
            }

            if (!priceExists) {
                log(">>> Đang khởi tạo Giá vé Economy mặc định: 1,200,000 đ...");
                String insertPrice = "INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES (?, ?, ?, 1200000)";
                try (PreparedStatement ps = conn.prepareStatement(insertPrice)) {
                    ps.setString(1, "PR-DEMO");
                    ps.setString(2, demoFlightID);
                    ps.setString(3, demoClass);
                    ps.executeUpdate();
                }
            }
        } catch (SQLException e) {
            log("!!! Lỗi khởi tạo dữ liệu mẫu: " + e.getMessage());
        }
    }

    private void resetDemoState() {
        if (customerConn != null) {
            try {
                customerConn.rollback();
                customerConn.close();
            } catch (SQLException ignored) {}
            customerConn = null;
        }

        priceRead1 = -1;
        priceRead2 = -1;

        lblRead1.setText("---");
        lblRead1.setForeground(TEXT_DARK);
        lblRead2.setText("---");
        lblRead2.setForeground(TEXT_DARK);

        btnStep1.setEnabled(true);
        btnStep2.setEnabled(false);
        btnStep3.setEnabled(false);

        rbReadCommitted.setEnabled(true);
        rbSerializable.setEnabled(true);

        taLog.setText("");
        log("=== CHƯƠNG TRÌNH MÔ PHỎNG ANOMALY TRANSACTION ===");
        log("Đã sẵn sàng. Hãy chọn Mức cô lập và nhấn Bước 1 để bắt đầu.");

        // Reset price in DB back to 1,200,000 to keep it consistent
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement("UPDATE SEATCLASSPRICE SET Price = 1200000 WHERE FlightID = ? AND Class = ?")) {
            ps.setString(1, demoFlightID);
            ps.setString(2, demoClass);
            ps.executeUpdate();
            log("-> Reset giá vé trên database về mức ban đầu: 1,200,000 đ");
        } catch (SQLException e) {
            log("Lỗi reset giá: " + e.getMessage());
        }
    }

    private void runStep1() {
        try {
            customerConn = DBConnection.getConnection();
            if (customerConn == null) {
                JOptionPane.showMessageDialog(this, "Không thể kết nối CSDL!", "Lỗi", JOptionPane.ERROR_MESSAGE);
                return;
            }

            customerConn.setAutoCommit(false);
            int isoLevel;
            String isoName;

            if (rbSerializable.isSelected()) {
                isoLevel = Connection.TRANSACTION_SERIALIZABLE;
                isoName = "SERIALIZABLE";
            } else {
                isoLevel = Connection.TRANSACTION_READ_COMMITTED;
                isoName = "READ COMMITTED";
            }

            customerConn.setTransactionIsolation(isoLevel);

            log("\n--- BẮT ĐẦU GIAO DỊCH KHÁCH HÀNG (Transaction 1) ---");
            log("- Đã set mức cô lập: " + isoName);
            log("- Lệnh SQL: SELECT Price FROM SEATCLASSPRICE WHERE FlightID = '" + demoFlightID + "' AND Class = '" + demoClass + "'");

            priceRead1 = queryPrice(customerConn);
            lblRead1.setText(df.format(priceRead1));
            lblRead1.setForeground(PRIMARY);

            log("=> [LẦN ĐỌC 1]: Giá vé lấy ra từ database là: " + df.format(priceRead1));
            log("=== GIAO DỊCH 1 ĐANG GIỮ Ở TRẠNG THÁI MỞ (CHƯA COMMIT) ===");

            btnStep1.setEnabled(false);
            btnStep2.setEnabled(true);
            rbReadCommitted.setEnabled(false);
            rbSerializable.setEnabled(false);

        } catch (SQLException e) {
            log("!!! Lỗi Bước 1: " + e.getMessage());
            e.printStackTrace();
        }
    }

    private void runStep2() {
        String input = tfNewPrice.getText().replace(",", "").replace(".", "").trim();
        double newPrice;
        try {
            newPrice = Double.parseDouble(input);
        } catch (NumberFormatException e) {
            JOptionPane.showMessageDialog(this, "Giá vé nhập vào không hợp lệ!", "Lỗi", JOptionPane.ERROR_MESSAGE);
            return;
        }

        log("\n--- BẮT ĐẦU GIAO DỊCH ADMIN (Transaction 2) ---");
        log("- Lệnh SQL: UPDATE SEATCLASSPRICE SET Price = " + newPrice + " WHERE FlightID = '" + demoFlightID + "' AND Class = '" + demoClass + "'");

        try (Connection adminConn = DBConnection.getConnection()) {
            if (adminConn == null) return;
            adminConn.setAutoCommit(false);
            adminConn.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);

            try (PreparedStatement ps = adminConn.prepareStatement("UPDATE SEATCLASSPRICE SET Price = ? WHERE FlightID = ? AND Class = ?")) {
                ps.setDouble(1, newPrice);
                ps.setString(2, demoFlightID);
                ps.setString(3, demoClass);
                int rows = ps.executeUpdate();
                log("-> Cập nhật thành công " + rows + " dòng.");
            }

            adminConn.commit();
            log("=> GIAO DỊCH 2 ĐÃ COMMIT THÀNH CÔNG (Giá vé mới đã lưu vào DB).");

            btnStep2.setEnabled(false);
            btnStep3.setEnabled(true);

        } catch (SQLException e) {
            log("!!! Lỗi Bước 2: " + e.getMessage());
            e.printStackTrace();
        }
    }

    private void runStep3() {
        if (customerConn == null) return;

        try {
            log("\n--- GIAO DỊCH KHÁCH HÀNG (Transaction 1): TIẾP TỤC ĐỌC LẦN 2 ---");
            log("- Lệnh SQL: SELECT Price FROM SEATCLASSPRICE WHERE FlightID = '" + demoFlightID + "' AND Class = '" + demoClass + "'");

            priceRead2 = queryPrice(customerConn);
            lblRead2.setText(df.format(priceRead2));

            customerConn.commit();
            log("=> GIAO DỊCH 1 ĐÃ COMMIT & ĐÓNG KẾT NỐI.");
            customerConn.close();
            customerConn = null;

            log("=> [LẦN ĐỌC 2]: Giá vé lấy ra từ database là: " + df.format(priceRead2));

            // Evaluate anomaly
            log("\n================ KẾT QUẢ PHÂN TÍCH ================");
            if (priceRead1 != priceRead2) {
                lblRead2.setForeground(RED_TEXT);
                log("⚠️ PHÁT HIỆN LỖI: NON-REPEATABLE READ ANOMALY XẢY RA!");
                log("Giải thích: Trong cùng một giao dịch (Transaction 1), hai câu lệnh SELECT cùng một dòng dữ liệu cho ra kết quả khác nhau (Lần 1: " + df.format(priceRead1) + " | Lần 2: " + df.format(priceRead2) + ").");
                log("Nguyên nhân: Do dùng mức cô lập READ COMMITTED, Transaction 1 được phép đọc dữ liệu đã commit từ giao dịch khác (Transaction 2) ngay giữa tiến trình.");
            } else {
                lblRead2.setForeground(GREEN_TEXT);
                log("✅ AN TOÀN: NGĂN CHẶN THÀNH CÔNG HIỆN TƯỢNG ĐỌC KHÔNG LẶP LẠI.");
                log("Giải thích: Hai lần đọc dữ liệu trong cùng một giao dịch cho ra kết quả đồng nhất (" + df.format(priceRead1) + "). Giao dịch 2 cập nhật giá vé lên " + df.format(queryCurrentDbPrice()) + " nhưng không ảnh hưởng tới kết quả đọc của Transaction 1.");
                log("Nguyên nhân: Do sử dụng mức cô lập SERIALIZABLE, hệ thống cung cấp ảnh chụp nhất quán (Read Consistency) tại thời điểm Transaction 1 bắt đầu.");
            }
            log("====================================================");

            btnStep3.setEnabled(false);

        } catch (SQLException e) {
            log("!!! Lỗi Bước 3: " + e.getMessage());
            try {
                if (customerConn != null) {
                    customerConn.rollback();
                    customerConn.close();
                }
            } catch (SQLException ignored) {}
            customerConn = null;
        }
    }

    private double queryPrice(Connection conn) throws SQLException {
        String sql = "SELECT Price FROM SEATCLASSPRICE WHERE FlightID = ? AND Class = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, demoFlightID);
            ps.setString(2, demoClass);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getDouble("Price");
                }
            }
        }
        return 0;
    }

    private double queryCurrentDbPrice() {
        try (Connection conn = DBConnection.getConnection()) {
            if (conn != null) {
                return queryPrice(conn);
            }
        } catch (SQLException ignored) {}
        return 0;
    }

    private void log(String message) {
        taLog.append(message + "\n");
        taLog.setCaretPosition(taLog.getDocument().getLength());
    }

    public static void main(String[] args) {
        try {
            com.formdev.flatlaf.FlatLightLaf.setup();
        } catch (Exception e) {
            e.printStackTrace();
        }
        SwingUtilities.invokeLater(() -> new NonRepeatableReadDemo().setVisible(true));
    }
}
