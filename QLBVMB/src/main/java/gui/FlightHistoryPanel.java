package gui;

import bus.DatVeBUS.BookingHistoryBUS;
import dto.AccountDTO;
import dto.BookingHistoryDTO;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import javax.swing.border.AbstractBorder;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.awt.geom.RoundRectangle2D;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class FlightHistoryPanel extends JPanel {
    private AccountDTO account;
    private BookingHistoryBUS historyBUS;
    private JPanel listPanel;

    private static final Color TEXT_DARK = new Color(15, 23, 42);
    private static final Color TEXT_GRAY = new Color(71, 85, 105);
    private static final Color BORDER = new Color(226, 232, 240);
    private static final Color BG_CONTENT = new Color(248, 249, 255);
    private static final Color GREEN_BG = new Color(220, 252, 231);
    private static final Color GREEN_TEXT = new Color(22, 163, 74);
    private static final Color ORANGE_BG = new Color(254, 243, 199);
    private static final Color ORANGE_TEXT = new Color(217, 119, 6);
    private static final Color RED_BG = new Color(254, 226, 226);
    private static final Color RED_TEXT = new Color(220, 38, 38);
    private static final Color BLUE_TEXT = new Color(37, 99, 235);

    public FlightHistoryPanel(AccountDTO account) {
        this.account = account;
        this.historyBUS = new BookingHistoryBUS();
        
        setLayout(new BorderLayout());
        setBackground(BG_CONTENT);

        JPanel headerPanel = new JPanel(new FlowLayout(FlowLayout.LEFT, 20, 20));
        headerPanel.setBackground(BG_CONTENT);
        
        JLabel titleBadge = new JLabel("Lịch sử đặt vé");
        titleBadge.setFont(new Font("Segoe UI", Font.BOLD, 14));
        titleBadge.setForeground(TEXT_DARK);
        titleBadge.setBackground(Color.WHITE);
        titleBadge.setOpaque(true);
        titleBadge.setBorder(BorderFactory.createCompoundBorder(
            new RoundedBorder(20, BORDER),
            new EmptyBorder(8, 16, 8, 16)
        ));
        headerPanel.add(titleBadge);
        
        add(headerPanel, BorderLayout.NORTH);

        listPanel = new JPanel(new MigLayout("wrap 1, fillx, insets 10 20 10 20, gapy 15", "[grow]"));
        listPanel.setBackground(BG_CONTENT);
        
        JScrollPane scrollPane = new JScrollPane(listPanel);
        scrollPane.setBorder(null);
        scrollPane.getVerticalScrollBar().setUnitIncrement(16);
        scrollPane.setOpaque(false);
        scrollPane.getViewport().setOpaque(false);
        
        add(scrollPane, BorderLayout.CENTER);
        
        loadHistory();
    }

    private void loadHistory() {
        listPanel.removeAll();

        String accId = account != null ? account.getAccountID() : "ACC01";
        List<BookingHistoryDTO> bookings = historyBUS.getBookingHistory(accId);

        // Auto-cancel các booking PENDING đã quá 20 phút (giống handleTimeout trong PaymentPanel)
        if (bookings != null) {
            for (BookingHistoryDTO b : bookings) {
                if ("PENDING".equalsIgnoreCase(b.getBookingStatus())) {
                    int remaining = historyBUS.getRemainingPaymentSeconds(b.getBookingID());
                    if (remaining <= 0) {
                        historyBUS.cancelBooking(b.getBookingID());
                    }
                }
            }
            // Load lại sau khi đã hủy các booking hết hạn
            bookings = historyBUS.getBookingHistory(accId);
        }

        if (bookings == null || bookings.isEmpty()) {
            JLabel emptyLabel = new JLabel("Bạn không có lịch sử đặt vé nào.");
            emptyLabel.setFont(new Font("Segoe UI", Font.ITALIC, 16));
            emptyLabel.setForeground(TEXT_GRAY);
            listPanel.add(emptyLabel, "align center, gapy 50");
        } else {
            for (BookingHistoryDTO b : bookings) {
                listPanel.add(createHistoryCard(b), "growx");
            }
        }

        listPanel.revalidate();
        listPanel.repaint();
    }

    private JPanel createHistoryCard(BookingHistoryDTO booking) {
        JPanel card = new JPanel(new MigLayout("wrap 1, fillx, insets 0, hidemode 3, gapy 0", "[grow]"));
        card.setBackground(Color.WHITE);
        card.setBorder(new RoundedBorder(10, BORDER));

        // TOP SUMMARY ROW
        JPanel topRow = new JPanel(new MigLayout("fillx, insets 15 20 15 20", "[][grow][]", "[]"));
        topRow.setBackground(Color.WHITE);
        
        SimpleDateFormat dateFmt = new SimpleDateFormat("dd/MM/yyyy");
        DecimalFormat moneyFmt = new DecimalFormat("#,### đ");

        String routeStr = (booking.getDepIATA() != null ? booking.getDepIATA() : "N/A") + " -> " + 
                          (booking.getArrIATA() != null ? booking.getArrIATA() : "N/A");
        String depDateStr = booking.getDepartureTime() != null ? dateFmt.format(booking.getDepartureTime()) : "Chưa có";
        
        JLabel lblTitle = new JLabel("#" + booking.getBookingID() + "  |  " + routeStr + "  |  " + depDateStr);
        lblTitle.setFont(new Font("Segoe UI", Font.BOLD, 15));
        lblTitle.setForeground(TEXT_DARK);
        
        JPanel rightPanel = new JPanel(new MigLayout("insets 0", "[][][]", "[]"));
        rightPanel.setBackground(Color.WHITE);
        
        String rawStatus = booking.getBookingStatus() != null ? booking.getBookingStatus().toUpperCase() : "PENDING";
        long diffToFlight = booking.getDepartureTime() != null ? booking.getDepartureTime().getTime() - new Date().getTime() : 0;
        boolean isDeparted = diffToFlight < 0;
        
        String displayStatus = rawStatus;
        if ("CONFIRMED".equals(rawStatus)) {
            if (isDeparted) {
                if (booking.getCheckedInCount() > 0) {
                    displayStatus = "COMPLETED";
                } else {
                    displayStatus = "NO-SHOW";
                }
            } else {
                displayStatus = "PAID";
            }
        }
        
        JLabel lblStatus = new JLabel(displayStatus);
        lblStatus.setFont(new Font("Segoe UI", Font.BOLD, 11));
        lblStatus.setOpaque(true);
        lblStatus.setBorder(BorderFactory.createCompoundBorder(
            new RoundedBorder(6, BORDER),
            new EmptyBorder(2, 8, 2, 8)
        ));
        
        // Style status
        if ("PENDING".equals(rawStatus)) {
            lblStatus.setForeground(ORANGE_TEXT);
            lblStatus.setBackground(ORANGE_BG);
        } else if ("PAID".equals(displayStatus) || "COMPLETED".equals(displayStatus) || "COMPLETED".equals(rawStatus)) {
            lblStatus.setForeground(GREEN_TEXT);
            lblStatus.setBackground(GREEN_BG);
        } else if ("CANCELLED".equals(rawStatus)) {
            lblStatus.setForeground(RED_TEXT);
            lblStatus.setBackground(RED_BG);
        } else if ("NO-SHOW".equals(displayStatus)) {
            lblStatus.setForeground(new Color(107, 114, 128));
            lblStatus.setBackground(new Color(243, 244, 246));
        } else {
            lblStatus.setForeground(TEXT_GRAY);
            lblStatus.setBackground(new Color(241, 245, 249));
        }

        String priceText = moneyFmt.format(booking.getTotalAmount());
        if ("CANCELLED".equals(rawStatus) && booking.getTotalAmount() > 0) {
            priceText = "Phí hủy: " + priceText;
        }
        JLabel lblPrice = new JLabel(priceText);
        lblPrice.setFont(new Font("Segoe UI", Font.BOLD, 16));
        lblPrice.setForeground(TEXT_DARK);
        
        JButton btnToggle = new JButton("▼");
        btnToggle.setContentAreaFilled(false);
        btnToggle.setBorder(null);
        btnToggle.setCursor(new Cursor(Cursor.HAND_CURSOR));
        btnToggle.setForeground(TEXT_GRAY);
        
        rightPanel.add(lblStatus);
        rightPanel.add(lblPrice, "gapleft 15");
        rightPanel.add(btnToggle, "gapleft 10");
        
        topRow.add(lblTitle, "cell 0 0");
        topRow.add(rightPanel, "cell 2 0, alignx right");

        // DETAILS CONTAINER (hidden by default)
        JPanel detailsContainer = new JPanel(new MigLayout("wrap 1, fillx, insets 0", "[grow]"));
        detailsContainer.setBackground(new Color(250, 250, 249));
        detailsContainer.setVisible(false);

        // Details Grid (Payment + Booking Date)
        JPanel infoGrid = new JPanel(new MigLayout("fillx, insets 15 20 15 20", "[grow][grow]", "[]"));
        infoGrid.setBackground(new Color(250, 250, 249));
        
        // Payment Box
        JPanel payBox = createDetailBox("Phương thức thanh toán", 
                (booking.getPaymentMethod() != null ? booking.getPaymentMethod() : "Chưa thanh toán"));
        
        // Date Box
        SimpleDateFormat fullDateFmt = new SimpleDateFormat("dd/MM/yyyy HH:mm");
        JPanel dateBox = createDetailBox("Ngày đặt vé", 
                booking.getBookingDate() != null ? fullDateFmt.format(booking.getBookingDate()) : "N/A");
        
        infoGrid.add(payBox, "growx");
        infoGrid.add(dateBox, "growx");

        // Receipt Box
        JPanel receiptBox = new JPanel(new MigLayout("fillx, insets 15 20 15 20", "[grow][]", "[][][]"));
        receiptBox.setBackground(Color.WHITE);
        receiptBox.setBorder(BorderFactory.createMatteBorder(1, 0, 0, 0, BORDER));
        
        JLabel lblReceiptTitle = new JLabel("Chi tiết Hóa đơn");
        lblReceiptTitle.setFont(new Font("Segoe UI", Font.BOLD, 14));
        lblReceiptTitle.setForeground(TEXT_DARK);
        
        String itemName = "CANCELLED".equals(rawStatus) ? "Phí phạt hủy vé" : "Tiền vé";
        JLabel lblItem1 = new JLabel(itemName + " (" + booking.getTicketCount() + " hành khách)");
        lblItem1.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        lblItem1.setForeground(TEXT_DARK);
        JLabel lblItem1Val = new JLabel(moneyFmt.format(booking.getTotalAmount()));
        lblItem1Val.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        
        JLabel lblTotalText = new JLabel("Tổng cộng");
        lblTotalText.setFont(new Font("Segoe UI", Font.BOLD, 14));
        lblTotalText.setForeground(TEXT_DARK);
        JLabel lblTotalVal = new JLabel(moneyFmt.format(booking.getTotalAmount()));
        lblTotalVal.setFont(new Font("Segoe UI", Font.BOLD, 15));
        lblTotalVal.setForeground(TEXT_DARK);
        
        receiptBox.add(lblReceiptTitle, "span 2, wrap, gapbottom 10");
        receiptBox.add(lblItem1, "growx");
        receiptBox.add(lblItem1Val, "wrap");
        receiptBox.add(new JSeparator(), "span 2, growx, gapy 10 10, wrap");
        receiptBox.add(lblTotalText, "growx");
        receiptBox.add(lblTotalVal, "wrap");

        // Action Buttons Box
        JPanel actionBox = new JPanel(new FlowLayout(FlowLayout.RIGHT, 10, 15));
        actionBox.setBackground(new Color(250, 250, 249));
        
        boolean isPending = "PENDING".equalsIgnoreCase(booking.getBookingStatus());
        boolean isConfirmed = "CONFIRMED".equalsIgnoreCase(booking.getBookingStatus());
        boolean isCancelled = "CANCELLED".equalsIgnoreCase(booking.getBookingStatus());
        
        long hoursToFlight = 0;
        if (booking.getDepartureTime() != null) {
            long diff = booking.getDepartureTime().getTime() - new Date().getTime();
            hoursToFlight = diff / (1000 * 60 * 60);
        }

        if (isPending) {
            JButton btnCancel = createOutlineButton("Hủy đặt chỗ", RED_TEXT);
            JButton btnPay = createPrimaryButton("Thanh toán ngay");
            
            btnCancel.addActionListener(e -> {
                int ans = JOptionPane.showConfirmDialog(this, "Bạn có chắc muốn hủy đơn đặt chỗ này không?", "Xác nhận", JOptionPane.YES_NO_OPTION);
                if (ans == JOptionPane.YES_OPTION) {
                    if (historyBUS.cancelBooking(booking.getBookingID())) {
                        JOptionPane.showMessageDialog(this, "Hủy thành công.");
                        loadHistory();
                    } else {
                        JOptionPane.showMessageDialog(this, "Hủy thất bại.", "Lỗi", JOptionPane.ERROR_MESSAGE);
                    }
                }
            });
            
            btnPay.addActionListener(e -> {
                int remaining = historyBUS.getRemainingPaymentSeconds(booking.getBookingID());
                if (remaining <= 0) {
                    // Hết giờ: hủy booking trong DB giống PaymentPanel.handleTimeout()
                    historyBUS.cancelBooking(booking.getBookingID());
                    JOptionPane.showMessageDialog(this,
                        "Đã hết thời gian giữ chỗ (20 phút).\nVui lòng đặt vé lại.",
                        "Hết giờ", JOptionPane.WARNING_MESSAGE);
                    loadHistory();
                    return;
                }
                Frame parentFrame = (Frame) SwingUtilities.getWindowAncestor(this);
                PaymentDialog dialog = new PaymentDialog(parentFrame, booking.getTotalAmount(), booking.getBookingID(), remaining);
                dialog.setVisible(true);

                if (dialog.isPaid()) {
                    String method = dialog.getSelectedMethod();
                    if (historyBUS.payBooking(booking.getBookingID(), booking.getTotalAmount(), method)) {
                        JOptionPane.showMessageDialog(this, "Thanh toán thành công qua " + method + "!\nVé của bạn đã được xuất.");
                        loadHistory();
                    }
                }
            });
            
            actionBox.add(btnCancel);
            actionBox.add(btnPay);
        } else if (isConfirmed && hoursToFlight > 48) {
            if (booking.getCheckedInCount() > 0) {
                JLabel lblNote = new JLabel("Đã Check-in, không thể hủy.");
                lblNote.setForeground(TEXT_GRAY);
                lblNote.setFont(new Font("Segoe UI", Font.ITALIC, 12));
                actionBox.add(lblNote);
            } else {
                JButton btnCancel = createOutlineButton("Hủy vé & Hoàn tiền", RED_TEXT);
                btnCancel.addActionListener(e -> {
                    int ans = JOptionPane.showConfirmDialog(this, "Bạn có chắc muốn hủy vé?\nHệ thống sẽ thu phí hủy là 30% giá vé, phần còn lại sẽ được hoàn trả.", "Xác nhận", JOptionPane.YES_NO_OPTION);
                    if (ans == JOptionPane.YES_OPTION) {
                        if (historyBUS.cancelBooking(booking.getBookingID())) {
                            JOptionPane.showMessageDialog(this, "Hủy vé thành công. Vui lòng kiểm tra email để nhận thông tin hoàn tiền.");
                            loadHistory();
                        }
                    }
                });
                actionBox.add(btnCancel);
            }
        } else if (isCancelled) {
            JLabel lblCancelNote = new JLabel("Đơn đã hủy.");
            lblCancelNote.setForeground(TEXT_GRAY);
            lblCancelNote.setFont(new Font("Segoe UI", Font.ITALIC, 12));
            actionBox.add(lblCancelNote);
        } else {
            JLabel lblNote = new JLabel("Chuyến bay sát giờ hoặc đã hoàn thành, không thể thay đổi.");
            lblNote.setForeground(TEXT_GRAY);
            lblNote.setFont(new Font("Segoe UI", Font.ITALIC, 12));
            actionBox.add(lblNote);
        }

        detailsContainer.add(infoGrid, "growx");
        detailsContainer.add(receiptBox, "growx");
        detailsContainer.add(actionBox, "growx");

        // Toggle logic
        btnToggle.addActionListener(e -> {
            boolean isVis = detailsContainer.isVisible();
            detailsContainer.setVisible(!isVis);
            btnToggle.setText(!isVis ? "▲" : "▼");
            card.revalidate();
            card.repaint();
            revalidate();
            repaint();
            Window w = SwingUtilities.getWindowAncestor(this);
            if (w != null) w.validate();
        });

        card.add(topRow, "growx");
        card.add(new JSeparator(), "growx, h 1!");
        card.add(detailsContainer, "growx");

        return card;
    }

    private JPanel createDetailBox(String title, String value) {
        JPanel panel = new JPanel(new MigLayout("insets 10", "[]", "[]"));
        panel.setBackground(Color.WHITE);
        panel.setBorder(new RoundedBorder(6, BORDER));
        
        JLabel lblTitle = new JLabel(title);
        lblTitle.setForeground(TEXT_GRAY);
        lblTitle.setFont(new Font("Segoe UI", Font.PLAIN, 12));
        
        JLabel lblVal = new JLabel(value);
        lblVal.setForeground(TEXT_DARK);
        lblVal.setFont(new Font("Segoe UI", Font.BOLD, 14));
        
        panel.add(lblTitle, "wrap");
        panel.add(lblVal);
        return panel;
    }

    private JButton createPrimaryButton(String text) {
        JButton btn = new JButton(text);
        btn.setFont(new Font("Segoe UI", Font.BOLD, 13));
        btn.setForeground(Color.WHITE);
        btn.setBackground(BLUE_TEXT);
        btn.setFocusPainted(false);
        btn.setBorder(BorderFactory.createCompoundBorder(
            new RoundedBorder(6, BLUE_TEXT),
            new EmptyBorder(6, 16, 6, 16)
        ));
        btn.setCursor(new Cursor(Cursor.HAND_CURSOR));
        return btn;
    }

    private JButton createOutlineButton(String text, Color color) {
        JButton btn = new JButton(text);
        btn.setFont(new Font("Segoe UI", Font.BOLD, 13));
        btn.setForeground(color);
        btn.setBackground(Color.WHITE);
        btn.setFocusPainted(false);
        btn.setBorder(BorderFactory.createCompoundBorder(
            new RoundedBorder(6, BORDER),
            new EmptyBorder(6, 16, 6, 16)
        ));
        btn.setCursor(new Cursor(Cursor.HAND_CURSOR));
        return btn;
    }

    class RoundedBorder extends AbstractBorder {
        private int radius;
        private Color color;

        RoundedBorder(int radius, Color color) {
            this.radius = radius;
            this.color = color;
        }

        @Override
        public void paintBorder(Component c, Graphics g, int x, int y, int width, int height) {
            Graphics2D g2 = (Graphics2D) g.create();
            g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            g2.setColor(color);
            g2.draw(new RoundRectangle2D.Double(x, y, width - 1, height - 1, radius, radius));
            g2.dispose();
        }

        @Override
        public Insets getBorderInsets(Component c) {
            return new Insets(1, 1, 1, 1);
        }
    }
}
