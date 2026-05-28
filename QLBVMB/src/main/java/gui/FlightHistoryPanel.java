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
    private static final Color BLUE_BG = new Color(219, 234, 254);

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

        // Passengers Ticket List Box (hidden until fetched)
        JPanel passengersContainer = new JPanel(new MigLayout("wrap 1, fillx, insets 0 20 15 20, hidemode 3", "[grow]"));
        passengersContainer.setBackground(new Color(250, 250, 249));

        // Receipt Box
        JPanel receiptBox = new JPanel(new MigLayout("fillx, insets 15 20 15 20", "[grow][]", ""));
        receiptBox.setBackground(Color.WHITE);
        receiptBox.setBorder(BorderFactory.createMatteBorder(1, 0, 0, 0, BORDER));
        
        JLabel lblReceiptTitle = new JLabel("Chi tiết Hóa đơn");
        lblReceiptTitle.setFont(new Font("Segoe UI", Font.BOLD, 14));
        lblReceiptTitle.setForeground(TEXT_DARK);
        receiptBox.add(lblReceiptTitle, "span 2, wrap, gapbottom 10");

        if ("CANCELLED".equals(rawStatus)) {
            double originalTotal = historyBUS.getOriginalTotalAmount(booking.getBookingID());
            double refundAmount = Math.max(0, originalTotal - booking.getTotalAmount());
            
            JLabel lblOrig = new JLabel("Tiền vé ban đầu (" + booking.getTicketCount() + " hành khách)");
            lblOrig.setFont(new Font("Segoe UI", Font.PLAIN, 13));
            lblOrig.setForeground(TEXT_DARK);
            JLabel lblOrigVal = new JLabel(moneyFmt.format(originalTotal));
            lblOrigVal.setFont(new Font("Segoe UI", Font.PLAIN, 13));
            
            JLabel lblRef = new JLabel("Đã hoàn lại (thành công)");
            lblRef.setFont(new Font("Segoe UI", Font.PLAIN, 13));
            lblRef.setForeground(GREEN_TEXT);
            JLabel lblRefVal = new JLabel("-" + moneyFmt.format(refundAmount));
            lblRefVal.setFont(new Font("Segoe UI", Font.PLAIN, 13));
            lblRefVal.setForeground(GREEN_TEXT);
            
            JLabel lblFee = new JLabel("Phí phạt hủy vé (khấu trừ)");
            lblFee.setFont(new Font("Segoe UI", Font.PLAIN, 13));
            lblFee.setForeground(RED_TEXT);
            JLabel lblFeeVal = new JLabel(moneyFmt.format(booking.getTotalAmount()));
            lblFeeVal.setFont(new Font("Segoe UI", Font.PLAIN, 13));
            lblFeeVal.setForeground(RED_TEXT);
            
            JLabel lblTotalText = new JLabel("Tổng chi phí thực tế");
            lblTotalText.setFont(new Font("Segoe UI", Font.BOLD, 14));
            lblTotalText.setForeground(TEXT_DARK);
            JLabel lblTotalVal = new JLabel(moneyFmt.format(booking.getTotalAmount()));
            lblTotalVal.setFont(new Font("Segoe UI", Font.BOLD, 15));
            lblTotalVal.setForeground(TEXT_DARK);
            
            receiptBox.add(lblOrig, "growx");
            receiptBox.add(lblOrigVal, "wrap, gapbottom 4");
            receiptBox.add(lblRef, "growx");
            receiptBox.add(lblRefVal, "wrap, gapbottom 4");
            receiptBox.add(lblFee, "growx");
            receiptBox.add(lblFeeVal, "wrap");
            
            receiptBox.add(new JSeparator(), "span 2, growx, gapy 10 10, wrap");
            
            receiptBox.add(lblTotalText, "growx");
            receiptBox.add(lblTotalVal, "wrap");
        } else {
            JLabel lblItem1 = new JLabel("Tiền vé (" + booking.getTicketCount() + " hành khách)");
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
            
            receiptBox.add(lblItem1, "growx");
            receiptBox.add(lblItem1Val, "wrap");
            receiptBox.add(new JSeparator(), "span 2, growx, gapy 10 10, wrap");
            receiptBox.add(lblTotalText, "growx");
            receiptBox.add(lblTotalVal, "wrap");
        }

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
        } else if (isConfirmed && hoursToFlight > 24) {
            if (booking.getCheckedInCount() > 0) {
                JLabel lblNote = new JLabel("Đã Check-in, không thể hủy.");
                lblNote.setForeground(TEXT_GRAY);
                lblNote.setFont(new Font("Segoe UI", Font.ITALIC, 12));
                actionBox.add(lblNote);
            } else {
                JButton btnCancel = createOutlineButton("Hủy vé & Hoàn tiền", RED_TEXT);
                btnCancel.addActionListener(e -> {
                    double refundAmount = historyBUS.getRefundAmountPreview(booking.getBookingID());
                    double totalPaid = booking.getTotalAmount();
                    double cancelFee = Math.max(0, totalPaid - refundAmount);
                    
                    String msg = "Bạn có chắc muốn hủy vé không?\n\n" +
                                 "• Tổng tiền đã thanh toán: " + moneyFmt.format(totalPaid) + "\n" +
                                 "• Số tiền sẽ hoàn lại: " + moneyFmt.format(refundAmount) + "\n" +
                                 "• Phí hủy vé (khấu trừ): " + moneyFmt.format(cancelFee) + "\n\n" +
                                 "(*) Tiền hoàn sẽ được tự động hoàn lại theo phương thức thanh toán ban đầu.";
                    
                    int ans = JOptionPane.showConfirmDialog(this, msg, "Xác nhận hủy vé & hoàn tiền", JOptionPane.YES_NO_OPTION, JOptionPane.WARNING_MESSAGE);
                    if (ans == JOptionPane.YES_OPTION) {
                        if (historyBUS.cancelBooking(booking.getBookingID())) {
                            JOptionPane.showMessageDialog(this, "Hủy vé thành công.\nSố tiền " + moneyFmt.format(refundAmount) + " đã được hoàn lại.");
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
        detailsContainer.add(passengersContainer, "growx");
        detailsContainer.add(receiptBox, "growx");
        detailsContainer.add(actionBox, "growx");

        // Toggle logic
        btnToggle.addActionListener(e -> {
            boolean isVis = detailsContainer.isVisible();
            if (!isVis) {
                if (passengersContainer.getComponentCount() == 0) {
                    populatePassengers(passengersContainer, booking.getBookingID());
                }
            }
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

    private void populatePassengers(JPanel container, String bookingID) {
        List<dto.MyFlightPassengerDTO> passengers = historyBUS.getPassengersByBooking(bookingID);
        
        JSeparator sep = new JSeparator();
        sep.setForeground(BORDER);
        container.add(sep, "growx, h 1!, gapy 0 10");
        
        JLabel lblTitle = new JLabel("Danh sách vé (" + passengers.size() + ")");
        lblTitle.setFont(new Font("Segoe UI", Font.BOLD, 13));
        lblTitle.setForeground(TEXT_DARK);
        container.add(lblTitle, "gapy 0 5");
        
        for (dto.MyFlightPassengerDTO p : passengers) {
            try {
                JPanel pCard = new JPanel(new MigLayout("fillx, insets 10", "[grow][]"));
                pCard.setBackground(Color.WHITE);
                pCard.setBorder(new RoundedBorder(8, BORDER));
                
                JPanel infoP = new JPanel(new MigLayout("insets 0, wrap 1, gapy 2", "[]", ""));
                infoP.setBackground(Color.WHITE);
                
                String fullNameText = p.getFullName() != null ? p.getFullName() : "Hành khách";
                JLabel lblName = new JLabel(fullNameText);
                lblName.setFont(new Font("Segoe UI", Font.BOLD, 14));
                lblName.setForeground(TEXT_DARK);
                
                String subText = (p.isAdult() ? "Người lớn" : "Trẻ em");
                if (p.getPassportNumber() != null && !p.getPassportNumber().isEmpty()) {
                    subText += " - CCCD: " + p.getPassportNumber();
                }
                JLabel lblSub = new JLabel(subText);
                lblSub.setFont(new Font("Segoe UI", Font.PLAIN, 12));
                lblSub.setForeground(TEXT_GRAY);
                
                String flightInfo = "Chuyến bay: " + (p.getFlightNumber() != null ? p.getFlightNumber() : "N/A") +
                                    "  (" + (p.getRoute() != null ? p.getRoute() : "Chưa rõ") + ")";
                JLabel lblFlight = new JLabel(flightInfo);
                lblFlight.setFont(new Font("Segoe UI", Font.PLAIN, 12));
                lblFlight.setForeground(new Color(14, 165, 233));
                
                infoP.add(lblName);
                infoP.add(lblSub);
                infoP.add(lblFlight);
                
                JLabel lblSeat = new JLabel("Ghế " + (p.getSeatNumber() != null ? p.getSeatNumber() : "?"));
                lblSeat.setFont(new Font("Segoe UI", Font.PLAIN, 13));
                lblSeat.setForeground(BLUE_TEXT);
                lblSeat.setBackground(BLUE_BG);
                lblSeat.setOpaque(true);
                lblSeat.setBorder(BorderFactory.createCompoundBorder(
                    new RoundedBorder(10, BLUE_TEXT),
                    new EmptyBorder(4, 12, 4, 12)
                ));
                
                pCard.add(infoP, "cell 0 0, growx");
                pCard.add(lblSeat, "cell 1 0, alignx right");
                
                container.add(pCard, "growx, gapy 0 8");
            } catch (Exception ex) {
                JLabel err = new JLabel("Lỗi hiển thị vé: " + ex.getMessage());
                err.setForeground(Color.RED);
                container.add(err, "growx, gapy 10 10");
                ex.printStackTrace();
            }
        }
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
