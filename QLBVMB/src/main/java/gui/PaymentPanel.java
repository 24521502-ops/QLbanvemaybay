package gui;

import com.formdev.flatlaf.FlatClientProperties;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;
import java.text.DecimalFormat;
import java.util.List;

public class PaymentPanel extends JPanel {

    private final BookingProcessPanel navigationListener;

    // Design System
    private static final Color PRIMARY = new Color(0, 102, 138);
    private static final Color BG_PAGE = new Color(248, 249, 255);
    private static final Color TEXT_DARK = new Color(11, 28, 48);
    private static final Color TEXT_GRAY = new Color(100, 116, 139);
    private static final Color SURFACE = Color.WHITE;

    private JPanel methodCardsContainer;
    private JPanel dynamicFormContainer;
    private JPanel summaryPanelWrapper;
    private String selectedMethod = "BANK TRANSFER";

    // Summary Labels
    private JLabel lblTotal;
    private JLabel lblTimer;
    private double currentTotal = 0;

    public PaymentPanel(BookingProcessPanel listener) {
        this.navigationListener = listener;
        setLayout(new BorderLayout());
        setBackground(BG_PAGE);
        initComponents();
    }

    private void initComponents() {
        JPanel content = new JPanel(
                new MigLayout("insets 32 24, fill, gapx 32", "[320!] [grow, fill]", "[grow, fill]"));
        content.setOpaque(false);

        // Header (Title)
        JLabel title = new JLabel("Thanh toán");
        title.setFont(new Font("Segoe UI", Font.BOLD, 32));
        title.setForeground(TEXT_DARK);

        JPanel mainWrapper = new JPanel(new BorderLayout(0, 16));
        mainWrapper.setOpaque(false);

        // Khối Header ở phía trên (Gồm Tiêu đề và Thanh Đếm ngược dễ nhìn)
        JPanel topHeader = new JPanel(new MigLayout("wrap, insets 0, fillx, gapy 12", "[grow, fill]"));
        topHeader.setOpaque(false);
        topHeader.add(title);

        // Timer Panel (Đưa lên trên đầu dưới Tiêu đề để khách hàng dễ thấy nhất)
        JPanel timerPnl = new JPanel(new MigLayout("insets 8 16, fillx", "[grow] [pref!]"));
        timerPnl.setBackground(new Color(255, 247, 237)); // Light orange
        timerPnl.putClientProperty(FlatClientProperties.STYLE, "arc:8; borderColor:#fdba74; borderWidth:1");

        JLabel lblMsg = new JLabel("(!) Vui lòng hoàn tất thanh toán để giữ chỗ");
        lblMsg.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        lblMsg.setForeground(new Color(154, 52, 18));

        lblTimer = new JLabel("20:00");
        lblTimer.setFont(new Font("Segoe UI", Font.BOLD, 15));
        lblTimer.setForeground(new Color(154, 52, 18));

        timerPnl.add(lblMsg);
        timerPnl.add(lblTimer, "right");
        topHeader.add(timerPnl);

        mainWrapper.add(topHeader, BorderLayout.NORTH);

        // Split into Left (Summary) and Right (Payment)
        JPanel splitContent = new JPanel(
                new MigLayout("insets 0, fill, gapx 32", "[320!] [grow, fill]", "[grow, fill]"));
        splitContent.setOpaque(false);

        summaryPanelWrapper = new JPanel(new BorderLayout());
        summaryPanelWrapper.setOpaque(false);
        splitContent.add(summaryPanelWrapper, "growy");
        splitContent.add(createPaymentForm(), "grow");

        mainWrapper.add(splitContent, BorderLayout.CENTER);
        content.add(mainWrapper, "span, grow");

        add(content, BorderLayout.CENTER);
    }

    // Removed static createSummaryPanel

    private JPanel createPaymentForm() {
        JPanel p = new JPanel(new MigLayout("wrap, insets 24, fillx, gapy 20", "[grow, fill]"));
        p.setBackground(SURFACE);
        p.putClientProperty(FlatClientProperties.STYLE, "arc:16; borderColor:#e2e8f0; borderWidth:1");

        JLabel title = new JLabel("Phương thức thanh toán");
        title.setFont(new Font("Segoe UI", Font.BOLD, 18));
        p.add(title);

        methodCardsContainer = new JPanel(new MigLayout("insets 0, gapx 16", "[] []"));
        methodCardsContainer.setOpaque(false);

        methodCardsContainer.add(
                createMethodCard("Chuyển khoản ngân hàng", "VietQR, Internet Banking", "/image/mbbank.jpg",
                        "BANK TRANSFER", true));
        methodCardsContainer.add(
                createMethodCard("Ví MoMo", "MoMo", "/image/momo.jpg", "MOMO", false));

        p.add(methodCardsContainer, "gapy 0 12");

        dynamicFormContainer = new JPanel(new CardLayout());
        dynamicFormContainer.setOpaque(false);

        dynamicFormContainer.add(createBankTransferInfo(), "BANK TRANSFER");
        dynamicFormContainer.add(createMoMoInfo(), "MOMO");

        p.add(dynamicFormContainer, "growx");

        JPanel footer = new JPanel(new MigLayout("insets 24 0 0 0, fillx", "[pref!] [pref!] [grow] [pref!]"));
        footer.setOpaque(false);

        JButton btnBack = new JButton("Hủy giao dịch");
        btnBack.setFont(new Font("Segoe UI", Font.BOLD, 15));
        btnBack.putClientProperty(FlatClientProperties.STYLE, "arc:8; background:#fee2e2; color:#ef4444");
        btnBack.setPreferredSize(new Dimension(140, 45));
        btnBack.addActionListener(e -> navigationListener.goBackFromPayment());

        JButton btnPayLater = new JButton("Thanh toán sau");
        btnPayLater.setFont(new Font("Segoe UI", Font.BOLD, 15));
        btnPayLater.putClientProperty(FlatClientProperties.STYLE, "arc:8; background:#e2e8f0; color:#475569");
        btnPayLater.setPreferredSize(new Dimension(150, 45));
        btnPayLater.addActionListener(e -> navigationListener.payLater());

        JButton btnPay = new JButton("Thanh toán ngay");
        btnPay.setFont(new Font("Segoe UI", Font.BOLD, 16));
        btnPay.setBackground(new Color(0, 102, 138));
        btnPay.setForeground(Color.WHITE);
        btnPay.putClientProperty(FlatClientProperties.STYLE, "arc:8");
        btnPay.setPreferredSize(new Dimension(200, 45));
        btnPay.addActionListener(e -> handlePayment());

        footer.add(btnBack);
        footer.add(btnPayLater, "gapleft 10");
        footer.add(new JLabel(), "growx");
        footer.add(btnPay);

        p.add(footer);

        return p;
    }

    private JPanel createMethodCard(String title, String subtitle, String iconPathOrEmoji, String method,
            boolean selected) {
        JPanel card = new JPanel(new MigLayout("wrap, insets 16, gapy 4", "[grow, fill]"));
        card.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));

        updateCardStyle(card, selected);

        JLabel lblIcon = new JLabel();
        if (iconPathOrEmoji.startsWith("/")) {
            try {
                ImageIcon originalIcon = new ImageIcon(getClass().getResource(iconPathOrEmoji));
                Image img = originalIcon.getImage().getScaledInstance(36, 36, Image.SCALE_SMOOTH);
                lblIcon.setIcon(new ImageIcon(img));
            } catch (Exception e) {
                lblIcon.setText("💳");
                lblIcon.setFont(new Font("Segoe UI Emoji", Font.PLAIN, 24));
            }
        } else {
            lblIcon.setText(iconPathOrEmoji);
            lblIcon.setFont(new Font("Segoe UI Emoji", Font.PLAIN, 24));
        }

        JLabel lblTitle = new JLabel(title);
        lblTitle.setFont(new Font("Segoe UI", Font.BOLD, 14));

        JLabel lblSub = new JLabel("<html><body style='width: 100px'>" + subtitle + "</body></html>");
        lblSub.setFont(new Font("Segoe UI", Font.PLAIN, 12));
        lblSub.setForeground(TEXT_GRAY);

        card.add(lblIcon);
        card.add(lblTitle);
        card.add(lblSub);

        card.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent e) {
                selectMethod(method, card);
            }
        });

        return card;
    }

    private void selectMethod(String method, JPanel selectedCard) {
        this.selectedMethod = method;
        for (Component c : methodCardsContainer.getComponents()) {
            if (c instanceof JPanel) {
                updateCardStyle((JPanel) c, c == selectedCard);
            }
        }
        CardLayout cl = (CardLayout) dynamicFormContainer.getLayout();
        cl.show(dynamicFormContainer, method);
    }

    private void updateCardStyle(JPanel card, boolean selected) {
        if (selected) {
            card.setBackground(new Color(240, 249, 255));
            card.putClientProperty(FlatClientProperties.STYLE, "arc:12; borderColor:#00668a; borderWidth:2");
        } else {
            card.setBackground(SURFACE);
            card.putClientProperty(FlatClientProperties.STYLE, "arc:12; borderColor:#e2e8f0; borderWidth:1");
        }
        card.repaint();
    }

    private JPanel createBankTransferInfo() {
        JPanel p = new JPanel(new MigLayout("wrap, insets 20, center", "[center]"));
        p.setBackground(new Color(250, 250, 250));
        p.putClientProperty(FlatClientProperties.STYLE, "arc:12; borderColor:#e2e8f0; borderWidth:1");

        JLabel lblQR = new JLabel();
        try {
            ImageIcon icon = new ImageIcon(getClass().getResource("/image/mbbank.jpg"));
            Image img = icon.getImage().getScaledInstance(220, 220, Image.SCALE_SMOOTH);
            lblQR.setIcon(new ImageIcon(img));
        } catch (Exception e) {
            lblQR.setText("QR MB Bank Placeholder");
            lblQR.setPreferredSize(new Dimension(220, 220));
            lblQR.setBorder(BorderFactory.createLineBorder(Color.LIGHT_GRAY));
        }
        lblQR.setHorizontalAlignment(SwingConstants.CENTER);

        p.add(new JLabel("Quét mã VietQR (MB Bank) để thanh toán"), "gapy 0 10");
        p.add(lblQR);
        p.add(new JLabel("Nội dung: SKY" + System.currentTimeMillis() / 100000), "gapy 10 0");

        return p;
    }

    private JPanel createMoMoInfo() {
        JPanel p = new JPanel(new MigLayout("wrap, insets 20, center", "[center]"));
        p.setBackground(new Color(250, 250, 250));
        p.putClientProperty(FlatClientProperties.STYLE, "arc:12; borderColor:#e2e8f0; borderWidth:1");

        JLabel lblQR = new JLabel();
        try {
            ImageIcon icon = new ImageIcon(getClass().getResource("/image/momo.jpg"));
            Image img = icon.getImage().getScaledInstance(220, 220, Image.SCALE_SMOOTH);
            lblQR.setIcon(new ImageIcon(img));
        } catch (Exception e) {
            lblQR.setText("QR MoMo Placeholder");
            lblQR.setPreferredSize(new Dimension(220, 220));
            lblQR.setBorder(BorderFactory.createLineBorder(Color.LIGHT_GRAY));
        }
        lblQR.setHorizontalAlignment(SwingConstants.CENTER);

        p.add(new JLabel("Quét mã MoMo để thanh toán"), "gapy 0 10");
        p.add(lblQR);

        return p;
    }

    private JLabel createSectionLabel(String text) {
        JLabel l = new JLabel(text);
        l.setFont(new Font("Segoe UI", Font.BOLD, 11));
        l.setForeground(TEXT_GRAY);
        return l;
    }

    private JLabel createPriceRow(JPanel parent, String label, String value) {
        JPanel row = new JPanel(new BorderLayout());
        row.setOpaque(false);
        JLabel lbl = new JLabel(label);
        lbl.setForeground(TEXT_GRAY);
        row.add(lbl, BorderLayout.WEST);

        JLabel val = new JLabel(value);
        val.setFont(new Font("Segoe UI", Font.BOLD, 13));
        val.setHorizontalAlignment(SwingConstants.RIGHT);
        row.add(val, BorderLayout.EAST);

        parent.add(row, "growx");
        return val;
    }

    private void handlePayment() {
        int choice = JOptionPane.showConfirmDialog(this,
                "Xác nhận bạn đã thực hiện thanh toán số tiền " + lblTotal.getText() + "?",
                "Xác nhận thanh toán", JOptionPane.YES_NO_OPTION);

        if (choice == JOptionPane.YES_OPTION) {
            // Hiển thị dialog đang kiểm tra
            JDialog loadingDialog = new JDialog((Frame) SwingUtilities.getWindowAncestor(this), "Đang kiểm tra", true);
            loadingDialog.setLayout(new MigLayout("insets 32, wrap, align center", "[center]", "[]20[]"));
            loadingDialog.setUndecorated(true);
            loadingDialog.getRootPane().putClientProperty(FlatClientProperties.STYLE,
                    "arc:16; background:white; borderColor:#e2e8f0; borderWidth:1");

            JPanel loadingHeader = new JPanel(new FlowLayout(FlowLayout.CENTER, 0, 0));
            loadingHeader.setOpaque(false);
            JLabel lblLoadingIcon = new JLabel("🔄");
            lblLoadingIcon.setFont(new Font("Segoe UI Emoji", Font.PLAIN, 18));
            JLabel lblLoadingText = new JLabel("  Hệ thống đang kiểm tra giao dịch...");
            lblLoadingText.setFont(new Font("Segoe UI", Font.BOLD, 15));
            lblLoadingText.setForeground(PRIMARY);
            loadingHeader.add(lblLoadingIcon);
            loadingHeader.add(lblLoadingText);

            JProgressBar progressBar = new JProgressBar();
            progressBar.setIndeterminate(true);
            progressBar.setPreferredSize(new Dimension(300, 8));
            progressBar.setForeground(PRIMARY);

            loadingDialog.add(loadingHeader);
            loadingDialog.add(progressBar);
            loadingDialog.pack();
            loadingDialog.setLocationRelativeTo(this);

            // Giả lập kiểm tra 3 giây bằng Timer
            Timer timer = new Timer(3000, e -> {
                loadingDialog.dispose();

                // Lưu vào DB thông qua listener
                boolean success = navigationListener.confirmPayment(selectedMethod, currentTotal);

                if (!success) {
                    JOptionPane.showMessageDialog(this,
                            "Có lỗi xảy ra khi xử lý thanh toán. Vui lòng thử lại hoặc liên hệ hỗ trợ.",
                            "Lỗi", JOptionPane.ERROR_MESSAGE);
                }
            });
            timer.setRepeats(false);
            timer.start();

            loadingDialog.setVisible(true);
        }
    }

    public void updateTimer(String time) {
        if (lblTimer != null)
            lblTimer.setText(time);
    }

    public void updateDataMulti(List<dto.FlightSearchResultDTO> flights, List<String> seatClasses,
            List<List<String>> multiSeats, List<Double> legPrices, double totalAmount) {
        if (flights == null || flights.isEmpty())
            return;
        this.currentTotal = totalAmount;
        DecimalFormat df = new DecimalFormat("#,###");

        JPanel p = new JPanel(new MigLayout("wrap, insets 24, fillx, gapy 12", "[grow, fill]"));
        p.setBackground(SURFACE);
        p.putClientProperty(FlatClientProperties.STYLE, "arc:16; borderColor:#e2e8f0; borderWidth:1");

        JLabel title = new JLabel("Tóm tắt chuyến bay");
        title.setFont(new Font("Segoe UI", Font.BOLD, 18));
        p.add(title, "gapy 0 8");

        int passCount = multiSeats.get(0).size();

        for (int i = 0; i < flights.size(); i++) {
            dto.FlightSearchResultDTO flight = flights.get(i);
            List<String> seats = multiSeats.get(i);
            String seatClass = seatClasses.get(i);

            p.add(createSectionLabel("CHẶNG " + (i + 1)));
            JLabel lblR = new JLabel(flight.getDepartureCode() + " -> " + flight.getArrivalCode());
            lblR.setFont(new Font("Segoe UI", Font.BOLD, 14));
            p.add(lblR);

            JLabel lblT = new JLabel(flight.getDepartureTime().toString());
            lblT.setForeground(TEXT_GRAY);
            p.add(lblT, "gapy 0 8");

            JLabel lblS = new JLabel("Ghế " + String.join(", ", seats) + " (" + seatClass + ")");
            lblS.setFont(new Font("Segoe UI", Font.BOLD, 14));
            p.add(lblS, "gapy 0 12");
        }

        p.add(createSectionLabel("HÀNH KHÁCH"));
        JLabel lblP = new JLabel(passCount + " Người lớn");
        lblP.setFont(new Font("Segoe UI", Font.BOLD, 14));
        p.add(lblP, "gapy 0 8");

        p.add(new JSeparator(), "gapy 8 8");

        for (int i = 0; i < flights.size(); i++) {
            double baseP = legPrices.get(i) * passCount;
            String prefix = flights.size() > 1 ? "Chặng " + (i + 1) + " - " : "";
            createPriceRow(p, prefix + "Giá vé cơ bản (x" + passCount + ")", df.format(baseP) + " VND");
            double tax = baseP * 0.10;
            createPriceRow(p, prefix + "Thuế & Phí (x" + passCount + ")", df.format(tax) + " VND");
        }

        p.add(new JSeparator(), "gapy 8 8");

        JPanel totalPnl = new JPanel(new BorderLayout());
        totalPnl.setOpaque(false);
        JLabel lblTotalTitle = new JLabel("Tổng cộng");
        lblTotalTitle.setFont(new Font("Segoe UI", Font.BOLD, 20));

        lblTotal = new JLabel(df.format(totalAmount) + " VND");
        lblTotal.setFont(new Font("Segoe UI", Font.BOLD, 20));
        lblTotal.setForeground(PRIMARY);
        lblTotal.setHorizontalAlignment(SwingConstants.RIGHT);

        totalPnl.add(lblTotalTitle, BorderLayout.WEST);
        totalPnl.add(lblTotal, BorderLayout.EAST);
        p.add(totalPnl, "growx");

        summaryPanelWrapper.removeAll();
        summaryPanelWrapper.add(p, BorderLayout.CENTER);
        summaryPanelWrapper.revalidate();
        summaryPanelWrapper.repaint();
    }
}