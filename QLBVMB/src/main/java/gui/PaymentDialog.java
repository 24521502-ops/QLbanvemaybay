package gui;

import com.formdev.flatlaf.FlatClientProperties;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;
import java.text.DecimalFormat;

public class PaymentDialog extends JDialog {

    private static final Color PRIMARY = new Color(0, 102, 138);
    private static final Color TEXT_DARK = new Color(11, 28, 48);
    private static final Color TEXT_GRAY = new Color(100, 116, 139);
    private static final Color SURFACE = Color.WHITE;
    private static final Color BG_PAGE = new Color(248, 249, 255);

    private JPanel methodCardsContainer;
    private JPanel dynamicFormContainer;
    private String selectedMethod = "BANK TRANSFER";
    private JLabel lblTimer;

    private boolean isPaid = false;
    private String finalPaymentMethod = "";
    private final double amount;
    private final String bookingID;

    private Timer countdownTimer;
    private int remainingSeconds; // Được truyền từ ngoài (tính từ BookingDate thực tế)

    public PaymentDialog(Frame owner, double amount, String bookingID, int remainingSeconds) {
        super(owner, "Thanh to\u00e1n v\u00e9 #" + bookingID, true);
        this.amount = amount;
        this.bookingID = bookingID;
        this.remainingSeconds = remainingSeconds;

        setSize(920, 640);
        setLocationRelativeTo(owner);
        setBackground(BG_PAGE);
        setDefaultCloseOperation(DISPOSE_ON_CLOSE);
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowClosing(java.awt.event.WindowEvent e) {
                stopTimer();
            }
        });

        initComponents();
        startTimer();
    }

    public boolean isPaid() {
        return isPaid;
    }

    public String getSelectedMethod() {
        return finalPaymentMethod;
    }

    private void initComponents() {
        JPanel root = new JPanel(new BorderLayout());
        root.setBackground(BG_PAGE);

        // ===== TOP HEADER =====
        JPanel topHeader = new JPanel(new MigLayout("insets 24 28 0 28, fillx, wrap", "[grow, fill]"));
        topHeader.setBackground(BG_PAGE);

        JLabel lblTitle = new JLabel("Thanh to\u00e1n");
        lblTitle.setFont(new Font("Segoe UI", Font.BOLD, 30));
        lblTitle.setForeground(TEXT_DARK);
        topHeader.add(lblTitle, "gapy 0 10");

        // Timer banner (giống PaymentPanel)
        JPanel timerPnl = new JPanel(new MigLayout("insets 8 16, fillx", "[grow] [pref!]"));
        timerPnl.setBackground(new Color(255, 247, 237));
        timerPnl.putClientProperty(FlatClientProperties.STYLE, "arc:8; borderColor:#fdba74; borderWidth:1");

        JLabel lblMsg = new JLabel(
                "(!) Vui l\u00f2ng ho\u00e0n t\u1ea5t thanh to\u00e1n \u0111\u1ec3 gi\u1eef ch\u1ed7");
        lblMsg.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        lblMsg.setForeground(new Color(154, 52, 18));

        lblTimer = new JLabel("20:00");
        lblTimer.setFont(new Font("Segoe UI", Font.BOLD, 15));
        lblTimer.setForeground(new Color(154, 52, 18));

        timerPnl.add(lblMsg);
        timerPnl.add(lblTimer, "right");
        topHeader.add(timerPnl, "gapy 0 4");

        root.add(topHeader, BorderLayout.NORTH);

        // ===== SPLIT CONTENT =====
        ScrollablePanel splitContent = new ScrollablePanel(new MigLayout(
                "insets 16 28 24 28, fill, gapx 24", "[300!] [grow, fill]", "[grow, fill]"));
        splitContent.setBackground(BG_PAGE);

        splitContent.add(createSummaryPanel(), "growy");
        splitContent.add(createPaymentForm(), "grow");

        JScrollPane scrollPane = new JScrollPane(splitContent);
        scrollPane.setBorder(null);
        scrollPane.setOpaque(false);
        scrollPane.getViewport().setOpaque(false);
        scrollPane.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);
        scrollPane.getVerticalScrollBar().setUnitIncrement(20);

        root.add(scrollPane, BorderLayout.CENTER);
        setContentPane(root);
    }

    private JPanel createSummaryPanel() {
        DecimalFormat df = new DecimalFormat("#,###");
        JPanel p = new JPanel(new MigLayout("wrap, insets 24, fillx, gapy 10", "[grow, fill]"));
        p.setBackground(SURFACE);
        p.putClientProperty(FlatClientProperties.STYLE, "arc:16; borderColor:#e2e8f0; borderWidth:1");

        JLabel title = new JLabel("T\u00f3m t\u1eaft \u0111\u01a1n h\u00e0ng");
        title.setFont(new Font("Segoe UI", Font.BOLD, 18));
        p.add(title, "gapy 0 8");

        addSectionLabel(p, "M\u00c3 \u0110\u1eb6T CH\u1ed0");
        JLabel lblBK = new JLabel("#" + bookingID);
        lblBK.setFont(new Font("Segoe UI", Font.BOLD, 15));
        lblBK.setForeground(PRIMARY);
        p.add(lblBK, "gapy 0 8");

        p.add(new JSeparator(), "gapy 4 8");

        addSectionLabel(p, "T\u1ed4NG TI\u1ec0N V\u00c9");
        JLabel lblBase = new JLabel(df.format(amount) + " VND");
        lblBase.setFont(new Font("Segoe UI", Font.BOLD, 14));
        p.add(lblBase, "gapy 0 8");

        p.add(new JSeparator(), "gapy 4 8");

        JPanel totalPnl = new JPanel(new BorderLayout());
        totalPnl.setOpaque(false);

        JLabel lblTotalTitle = new JLabel("T\u1ed5ng c\u1ed9ng");
        lblTotalTitle.setFont(new Font("Segoe UI", Font.BOLD, 20));

        JLabel lblTotalVal = new JLabel(df.format(amount) + " VND");
        lblTotalVal.setFont(new Font("Segoe UI", Font.BOLD, 20));
        lblTotalVal.setForeground(PRIMARY);
        lblTotalVal.setHorizontalAlignment(SwingConstants.RIGHT);

        totalPnl.add(lblTotalTitle, BorderLayout.WEST);
        totalPnl.add(lblTotalVal, BorderLayout.EAST);
        p.add(totalPnl, "growx");

        return p;
    }

    private void addSectionLabel(JPanel parent, String text) {
        JLabel l = new JLabel(text);
        l.setFont(new Font("Segoe UI", Font.BOLD, 11));
        l.setForeground(TEXT_GRAY);
        parent.add(l);
    }

    private JPanel createPaymentForm() {
        JPanel p = new JPanel(new MigLayout("wrap, insets 24, fillx, gapy 20", "[grow, fill]"));
        p.setBackground(SURFACE);
        p.putClientProperty(FlatClientProperties.STYLE, "arc:16; borderColor:#e2e8f0; borderWidth:1");

        JLabel title = new JLabel("Ph\u01b0\u01a1ng th\u1ee9c thanh to\u00e1n");
        title.setFont(new Font("Segoe UI", Font.BOLD, 18));
        p.add(title);

        methodCardsContainer = new JPanel(new MigLayout("insets 0, gapx 16", "[] []"));
        methodCardsContainer.setOpaque(false);
        methodCardsContainer.add(createMethodCard(
                "Chuy\u1ec3n kho\u1ea3n ng\u00e2n h\u00e0ng", "VietQR, Internet Banking",
                "/image/mbbank.jpg", "BANK TRANSFER", true));
        methodCardsContainer.add(createMethodCard(
                "V\u00ed MoMo", "MoMo",
                "/image/momo.jpg", "MOMO", false));
        p.add(methodCardsContainer, "gapy 0 12");

        dynamicFormContainer = new JPanel(new CardLayout());
        dynamicFormContainer.setOpaque(false);
        dynamicFormContainer.add(createBankTransferInfo(), "BANK TRANSFER");
        dynamicFormContainer.add(createMoMoInfo(), "MOMO");
        p.add(dynamicFormContainer, "growx");

        // Footer - y hệt PaymentPanel: [Hủy] ... [Thanh toán ngay]
        JPanel footer = new JPanel(new MigLayout("insets 24 0 0 0, fillx", "[pref!] [grow] [pref!]"));
        footer.setOpaque(false);

        JButton btnCancel = new JButton("H\u1ee7y giao d\u1ecbch");
        btnCancel.setFont(new Font("Segoe UI", Font.BOLD, 15));
        btnCancel.putClientProperty(FlatClientProperties.STYLE, "arc:8; background:#fee2e2; color:#ef4444");
        btnCancel.setPreferredSize(new Dimension(150, 45));
        btnCancel.addActionListener(e -> {
            stopTimer();
            dispose();
        });

        JButton btnPay = new JButton("Thanh to\u00e1n ngay");
        btnPay.setFont(new Font("Segoe UI", Font.BOLD, 16));
        btnPay.setBackground(PRIMARY);
        btnPay.setForeground(Color.WHITE);
        btnPay.putClientProperty(FlatClientProperties.STYLE, "arc:8");
        btnPay.setPreferredSize(new Dimension(200, 45));
        btnPay.addActionListener(e -> handlePayment());

        footer.add(btnCancel);
        footer.add(new JLabel(), "growx");
        footer.add(btnPay);
        p.add(footer);

        return p;
    }

    private JPanel createMethodCard(String title, String subtitle, String iconPath, String method, boolean selected) {
        JPanel card = new JPanel(new MigLayout("wrap, insets 16, gapy 4", "[grow, fill]"));
        card.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        updateCardStyle(card, selected);

        JLabel lblIcon = new JLabel();
        try {
            ImageIcon icon = new ImageIcon(getClass().getResource(iconPath));
            Image img = icon.getImage().getScaledInstance(36, 36, Image.SCALE_SMOOTH);
            lblIcon.setIcon(new ImageIcon(img));
        } catch (Exception ignored) {
            lblIcon.setText("[IMG]");
        }

        JLabel lblTitle = new JLabel(title);
        lblTitle.setFont(new Font("Segoe UI", Font.BOLD, 14));

        JLabel lblSub = new JLabel("<html><body style='width:90px'>" + subtitle + "</body></html>");
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
            if (c instanceof JPanel)
                updateCardStyle((JPanel) c, c == selectedCard);
        }
        ((CardLayout) dynamicFormContainer.getLayout()).show(dynamicFormContainer, method);
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
            Image img = new ImageIcon(getClass().getResource("/image/mbbank.jpg")).getImage()
                    .getScaledInstance(220, 220, Image.SCALE_SMOOTH);
            lblQR.setIcon(new ImageIcon(img));
        } catch (Exception e) {
            lblQR.setText("QR MB Bank");
            lblQR.setPreferredSize(new Dimension(220, 220));
        }
        lblQR.setHorizontalAlignment(SwingConstants.CENTER);
        p.add(new JLabel("Qu\u00e9t m\u00e3 VietQR (MB Bank) \u0111\u1ec3 thanh to\u00e1n"), "gapy 0 10");
        p.add(lblQR);
        p.add(new JLabel("N\u1ed9i dung: SKY-" + bookingID), "gapy 10 0");
        return p;
    }

    private JPanel createMoMoInfo() {
        JPanel p = new JPanel(new MigLayout("wrap, insets 20, center", "[center]"));
        p.setBackground(new Color(250, 250, 250));
        p.putClientProperty(FlatClientProperties.STYLE, "arc:12; borderColor:#e2e8f0; borderWidth:1");
        JLabel lblQR = new JLabel();
        try {
            Image img = new ImageIcon(getClass().getResource("/image/momo.jpg")).getImage()
                    .getScaledInstance(220, 220, Image.SCALE_SMOOTH);
            lblQR.setIcon(new ImageIcon(img));
        } catch (Exception e) {
            lblQR.setText("QR MoMo");
            lblQR.setPreferredSize(new Dimension(220, 220));
        }
        lblQR.setHorizontalAlignment(SwingConstants.CENTER);
        p.add(new JLabel("Qu\u00e9t m\u00e3 MoMo \u0111\u1ec3 thanh to\u00e1n"), "gapy 0 10");
        p.add(lblQR);
        return p;
    }

    private void handlePayment() {
        DecimalFormat df = new DecimalFormat("#,###");

        // Bước 1: Confirm như PaymentPanel
        int choice = JOptionPane.showConfirmDialog(this,
                "X\u00e1c nh\u1eadn b\u1ea1n \u0111\u00e3 th\u1ef1c hi\u1ec7n thanh to\u00e1n s\u1ed1 ti\u1ec1n "
                        + df.format(amount) + " VND?",
                "X\u00e1c nh\u1eadn thanh to\u00e1n", JOptionPane.YES_NO_OPTION);
        if (choice != JOptionPane.YES_OPTION)
            return;

        // Bước 2: Loading dialog (y hệt PaymentPanel)
        JDialog loadingDialog = new JDialog(this, "\u0110ang ki\u1ec3m tra", true);
        loadingDialog.setLayout(new MigLayout("insets 32, wrap, align center", "[center]", "[]20[]"));
        loadingDialog.setUndecorated(true);
        loadingDialog.getRootPane().putClientProperty(FlatClientProperties.STYLE,
                "arc:16; background:white; borderColor:#e2e8f0; borderWidth:1");

        JPanel loadingHeader = new JPanel(new FlowLayout(FlowLayout.CENTER, 0, 0));
        loadingHeader.setOpaque(false);
        JLabel lblLoadingText = new JLabel("H\u1ec7 th\u1ed1ng \u0111ang ki\u1ec3m tra giao d\u1ecbch...");
        lblLoadingText.setFont(new Font("Segoe UI", Font.BOLD, 15));
        lblLoadingText.setForeground(PRIMARY);
        loadingHeader.add(lblLoadingText);

        JProgressBar progressBar = new JProgressBar();
        progressBar.setIndeterminate(true);
        progressBar.setPreferredSize(new Dimension(300, 8));
        progressBar.setForeground(PRIMARY);

        loadingDialog.add(loadingHeader);
        loadingDialog.add(progressBar);
        loadingDialog.pack();
        loadingDialog.setLocationRelativeTo(this);

        // Bước 3: Sau 3 giây → thành công (giống PaymentPanel)
        Timer timer = new Timer(3000, e -> {
            loadingDialog.dispose();
            stopTimer();
            isPaid = true;
            finalPaymentMethod = "MOMO".equals(selectedMethod) ? "MOMO" : "BANK TRANSFER";

            // Bước 4: Thông báo thành công (y hệt PaymentPanel)
            JOptionPane.showMessageDialog(this,
                    "Thanh to\u00e1n th\u00e0nh c\u00f4ng! Gh\u1ebf c\u1ee7a b\u1ea1n \u0111\u00e3 \u0111\u01b0\u1ee3c x\u00e1c nh\u1eadn.",
                    "Th\u00e0nh c\u00f4ng", JOptionPane.INFORMATION_MESSAGE);

            dispose();
        });
        timer.setRepeats(false);
        timer.start();
        loadingDialog.setVisible(true);
    }

    private void startTimer() {
        countdownTimer = new Timer(1000, e -> {
            remainingSeconds--;
            if (remainingSeconds <= 0) {
                stopTimer();
                JOptionPane.showMessageDialog(this,
                        "H\u1ebft th\u1eddi gian gi\u1eef ch\u1ed7. Vui l\u00f2ng \u0111\u1eb7t v\u00e9 l\u1ea1i.",
                        "H\u1ebft gi\u1edd", JOptionPane.WARNING_MESSAGE);
                dispose();
            } else {
                int m = remainingSeconds / 60;
                int s = remainingSeconds % 60;
                lblTimer.setText(String.format("%02d:%02d", m, s));
                // Đổi màu đỏ khi còn < 5 phút
                if (remainingSeconds < 300) {
                    lblTimer.setForeground(new Color(220, 38, 38));
                }
            }
        });
        countdownTimer.start();
    }

    private void stopTimer() {
        if (countdownTimer != null)
            countdownTimer.stop();
    }

    private static class ScrollablePanel extends JPanel implements Scrollable {
        public ScrollablePanel(LayoutManager layout) {
            super(layout);
        }

        @Override
        public Dimension getPreferredScrollableViewportSize() {
            return getPreferredSize();
        }

        @Override
        public int getScrollableUnitIncrement(Rectangle visibleRect, int orientation, int direction) {
            return 20;
        }

        @Override
        public int getScrollableBlockIncrement(Rectangle visibleRect, int orientation, int direction) {
            return 50;
        }

        @Override
        public boolean getScrollableTracksViewportWidth() {
            return true;
        }

        @Override
        public boolean getScrollableTracksViewportHeight() {
            return false;
        }
    }
}
