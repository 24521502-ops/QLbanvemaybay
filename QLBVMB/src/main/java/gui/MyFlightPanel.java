package gui;

import bus.DatVeBUS.MyFlightBUS;
import dto.AccountDTO;
import dto.MyFlightDTO;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import javax.swing.border.AbstractBorder;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.awt.geom.RoundRectangle2D;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class MyFlightPanel extends JPanel {
    private AccountDTO account;
    private MyFlightBUS flightBUS;
    private JPanel listPanel;

    private static final Color TEXT_DARK = new Color(15, 23, 42);
    private static final Color TEXT_GRAY = new Color(71, 85, 105);
    private static final Color BORDER = new Color(226, 232, 240);
    private static final Color BG_CONTENT = new Color(248, 249, 255);
    private static final Color GREEN_BG = new Color(220, 252, 231);
    private static final Color GREEN_TEXT = new Color(22, 163, 74);
    private static final Color BLUE_BG = new Color(219, 234, 254);
    private static final Color BLUE_TEXT = new Color(37, 99, 235);

    public MyFlightPanel(AccountDTO account) {
        this.account = account;
        this.flightBUS = new MyFlightBUS();
        
        setLayout(new BorderLayout());
        setBackground(BG_CONTENT);

        JPanel headerPanel = new JPanel(new FlowLayout(FlowLayout.LEFT, 20, 20));
        headerPanel.setBackground(BG_CONTENT);
        
        JLabel titleBadge = new JLabel("Chuyến bay sắp tới");
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
        
        loadFlights();
    }

    private void loadFlights() {
        listPanel.removeAll();
        
        // Fetch flights for user
        String accId = account != null ? account.getAccountID() : "ACC01"; // Fallback for testing
        List<MyFlightDTO> flights = flightBUS.getMyFlights(accId);
        
        if (flights == null || flights.isEmpty()) {
            JLabel emptyLabel = new JLabel("Bạn không có chuyến bay nào sắp tới.");
            emptyLabel.setFont(new Font("Segoe UI", Font.ITALIC, 16));
            emptyLabel.setForeground(TEXT_GRAY);
            listPanel.add(emptyLabel, "align center, gapy 50");
        } else {
            for (MyFlightDTO f : flights) {
                listPanel.add(createFlightCard(f), "growx");
            }
        }
        
        listPanel.revalidate();
        listPanel.repaint();
    }

    private JPanel createFlightCard(MyFlightDTO flight) {
        JPanel card = new JPanel(new MigLayout("wrap 1, fillx, insets 0, hidemode 3, gapy 0", "[grow]"));
        card.setBackground(Color.WHITE);
        card.setBorder(new RoundedBorder(15, BORDER));

        // TOP SECTION
        JPanel topPanel = new JPanel(new MigLayout("fillx, insets 10 15 10 15", "[][grow][]", "[]"));
        topPanel.setBackground(Color.WHITE);
        
        // Left - Route
        JPanel routePanel = new JPanel(new MigLayout("insets 0, gapx 8, gapy 0", "[][][]", "[][]"));
        routePanel.setBackground(Color.WHITE);
        
        JLabel lblDep = new JLabel(flight.getDepartureIATA());
        lblDep.setFont(new Font("Segoe UI", Font.BOLD, 22));
        lblDep.setForeground(TEXT_DARK);
        
        JLabel lblArrow = new JLabel("->");
        lblArrow.setFont(new Font("Segoe UI", Font.PLAIN, 16));
        lblArrow.setForeground(TEXT_GRAY);
        
        JLabel lblArr = new JLabel(flight.getArrivalIATA());
        lblArr.setFont(new Font("Segoe UI", Font.BOLD, 22));
        lblArr.setForeground(TEXT_DARK);
        
        JLabel lblDepCity = new JLabel(flight.getDepartureCity());
        lblDepCity.setFont(new Font("Segoe UI", Font.PLAIN, 12));
        lblDepCity.setForeground(TEXT_GRAY);
        
        JLabel lblDuration = new JLabel(formatDuration(flight.getEstimatedTime()));
        lblDuration.setFont(new Font("Segoe UI", Font.PLAIN, 11));
        lblDuration.setForeground(TEXT_GRAY);
        
        JLabel lblArrCity = new JLabel(flight.getArrivalCity());
        lblArrCity.setFont(new Font("Segoe UI", Font.PLAIN, 12));
        lblArrCity.setForeground(TEXT_GRAY);
        
        routePanel.add(lblDep, "cell 0 0");
        routePanel.add(lblArrow, "cell 1 0, aligny center");
        routePanel.add(lblArr, "cell 2 0");
        
        routePanel.add(lblDepCity, "cell 0 1, alignx center");
        routePanel.add(lblDuration, "cell 1 1, alignx center");
        routePanel.add(lblArrCity, "cell 2 1, alignx center");
        
        topPanel.add(routePanel, "cell 0 0, aligny top");
        
        // Right - Airline & Status
        JPanel infoPanel = new JPanel(new MigLayout("insets 0, wrap 1", "[]", "[][][]"));
        infoPanel.setBackground(Color.WHITE);
        
        JLabel lblAirline = new JLabel(flight.getAirlineName());
        lblAirline.setFont(new Font("Segoe UI", Font.PLAIN, 12));
        lblAirline.setForeground(TEXT_GRAY);
        
        JLabel lblFlightNum = new JLabel(flight.getFlightNumber());
        lblFlightNum.setFont(new Font("Segoe UI", Font.BOLD, 15));
        lblFlightNum.setForeground(TEXT_DARK);
        
        String tStatus = flight.getTicketStatus() != null ? flight.getTicketStatus().toUpperCase() : "PAID";
        JLabel lblStatus = new JLabel(tStatus);
        lblStatus.setFont(new Font("Segoe UI", Font.BOLD, 11));
        
        if ("CANCELLED".equals(tStatus)) {
            lblStatus.setForeground(new Color(220, 38, 38));
            lblStatus.setBackground(new Color(254, 226, 226));
            lblStatus.setOpaque(true);
            lblStatus.setBorder(BorderFactory.createCompoundBorder(
                new RoundedBorder(10, new Color(254, 226, 226)),
                new EmptyBorder(2, 8, 2, 8)
            ));
        } else if ("BOOKED".equals(tStatus)) {
            lblStatus.setForeground(new Color(217, 119, 6)); // Orange
            lblStatus.setBackground(new Color(254, 243, 199));
            lblStatus.setOpaque(true);
            lblStatus.setBorder(BorderFactory.createCompoundBorder(
                new RoundedBorder(10, new Color(254, 243, 199)),
                new EmptyBorder(2, 8, 2, 8)
            ));
        } else {
            lblStatus.setForeground(GREEN_TEXT);
            lblStatus.setBackground(GREEN_BG);
            lblStatus.setOpaque(true);
            lblStatus.setBorder(BorderFactory.createCompoundBorder(
                new RoundedBorder(10, GREEN_BG),
                new EmptyBorder(2, 8, 2, 8)
            ));
        }
        
        infoPanel.add(lblAirline, "align right");
        infoPanel.add(lblFlightNum, "align right");
        infoPanel.add(lblStatus, "align right, gapy 2");
        
        topPanel.add(infoPanel, "cell 2 0, aligny top, alignx right");
        
        // MIDDLE SECTION
        JPanel midPanel = new JPanel(new MigLayout("fillx, insets 10 15 10 15", "[grow][grow][grow][grow]", "[]"));
        midPanel.setBackground(Color.WHITE);
        
        SimpleDateFormat timeFmt = new SimpleDateFormat("HH:mm");
        SimpleDateFormat dateFmt = new SimpleDateFormat("EEEE, dd/MM/yyyy");
        
        JPanel timePanel = createInfoBlock("Khởi hành", timeFmt.format(flight.getDepartureTime()), dateFmt.format(flight.getDepartureTime()));
        JPanel gatePanel = createInfoBlock("Cổng bay", flight.getGate() != null ? flight.getGate() : "Chưa có", "");
        JPanel seatPanel = createInfoBlock("Ghế", flight.getSeats() != null ? flight.getSeats() : "Chưa chọn", "");
        
        long diff = flight.getDepartureTime().getTime() - new Date().getTime();
        long days = diff / (1000 * 60 * 60 * 24);
        
        JPanel daysPanel = new JPanel(new MigLayout("insets 0, wrap 1, gapy 2", "[]", "[][]"));
        daysPanel.setBackground(Color.WHITE);
        JLabel lblDaysTitle = new JLabel("Còn lại");
        lblDaysTitle.setForeground(TEXT_GRAY);
        lblDaysTitle.setFont(new Font("Segoe UI", Font.PLAIN, 12));
        
        JLabel lblDaysVal = new JLabel(days > 0 ? days + " ngày" : "Hôm nay");
        lblDaysVal.setForeground(BLUE_TEXT);
        lblDaysVal.setBackground(BLUE_BG);
        lblDaysVal.setOpaque(true);
        lblDaysVal.setFont(new Font("Segoe UI", Font.BOLD, 13));
        lblDaysVal.setBorder(BorderFactory.createCompoundBorder(
            new RoundedBorder(10, BLUE_BG),
            new EmptyBorder(2, 10, 2, 10)
        ));
        
        daysPanel.add(lblDaysTitle);
        daysPanel.add(lblDaysVal);
        
        midPanel.add(timePanel, "growx, aligny top");
        midPanel.add(gatePanel, "growx, aligny top");
        midPanel.add(seatPanel, "growx, aligny top");
        midPanel.add(daysPanel, "growx, aligny top");
        
        // BOTTOM SECTION
        JPanel botPanel = new JPanel(new MigLayout("fillx, insets 8 15 8 15", "[grow][]", "[]"));
        botPanel.setBackground(new Color(250, 250, 249)); // slightly off-white
        
        JButton btnDetails = new JButton("Chi tiết hành khách  ▼");
        btnDetails.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        btnDetails.setForeground(TEXT_DARK);
        btnDetails.setBackground(Color.WHITE);
        btnDetails.setFocusPainted(false);
        btnDetails.setBorder(BorderFactory.createCompoundBorder(
            new RoundedBorder(6, BORDER),
            new EmptyBorder(6, 12, 6, 12)
        ));
        btnDetails.setCursor(new Cursor(Cursor.HAND_CURSOR));
        
        JButton btnCheckIn = new JButton("Check-in");
        btnCheckIn.setFont(new Font("Segoe UI", Font.BOLD, 13));
        btnCheckIn.setForeground(TEXT_DARK);
        btnCheckIn.setBackground(Color.WHITE);
        btnCheckIn.setFocusPainted(false);
        btnCheckIn.setBorder(BorderFactory.createCompoundBorder(
            new RoundedBorder(6, BORDER),
            new EmptyBorder(6, 16, 6, 16)
        ));
        btnCheckIn.setCursor(new Cursor(Cursor.HAND_CURSOR));
        
        JLabel btnPayNowHint = null;

        if ("BOOKED".equalsIgnoreCase(flight.getTicketStatus())) {
            // PENDING - chưa thanh toán, chỉ hiển hint
            btnCheckIn.setText("Check-in");
            btnCheckIn.setEnabled(false);
            btnCheckIn.setBackground(new Color(241, 245, 249));
            btnCheckIn.setForeground(TEXT_GRAY);

            btnPayNowHint = new JLabel(">> Thanh toán tại Lịch sử vé");
            btnPayNowHint.setFont(new Font("Segoe UI", Font.ITALIC, 12));
            btnPayNowHint.setForeground(new Color(0, 102, 138));
        } else if ("CHECKED-IN".equalsIgnoreCase(flight.getTicketStatus())) {
            btnCheckIn.setText("Đã Check-in");
            btnCheckIn.setEnabled(false);
            btnCheckIn.setBackground(new Color(241, 245, 249));
            btnCheckIn.setForeground(TEXT_GRAY);
        } else if ("CANCELLED".equalsIgnoreCase(flight.getTicketStatus())) {
            btnCheckIn.setText("Đã Hủy");
            btnCheckIn.setEnabled(false);
            btnCheckIn.setBackground(new Color(254, 226, 226));
            btnCheckIn.setForeground(new Color(220, 38, 38));
        } else if (diff / (1000 * 60) > 24 * 60) {
            btnCheckIn.setText("Mở trước 24h");
            btnCheckIn.setEnabled(false);
            btnCheckIn.setBackground(new Color(241, 245, 249));
            btnCheckIn.setForeground(TEXT_GRAY);
        } else if (diff / (1000 * 60) < 45 && diff >= 0) {
            btnCheckIn.setText("Đã đóng quầy");
            btnCheckIn.setEnabled(false);
            btnCheckIn.setBackground(new Color(254, 226, 226));
            btnCheckIn.setForeground(new Color(220, 38, 38));
        } else {
            btnCheckIn.addActionListener(e -> {
                boolean success = flightBUS.checkIn(flight.getBookingID(), flight.getFlightID());
                if (success) {
                    JOptionPane.showMessageDialog(this, "Check-in thành công!");
                    loadFlights();
                } else {
                    JOptionPane.showMessageDialog(this, "Check-in thất bại.", "Lỗi", JOptionPane.ERROR_MESSAGE);
                }
            });
        }

        botPanel.add(btnDetails, "align left");
        if (btnPayNowHint != null) {
            botPanel.add(btnPayNowHint, "align left, gapleft 12");
        }
        botPanel.add(btnCheckIn, "align right");

        
        // Assemble card
        JSeparator sep1 = new JSeparator();
        sep1.setForeground(BORDER);
        JSeparator sep2 = new JSeparator();
        sep2.setForeground(BORDER);
        
        card.add(topPanel, "growx");
        card.add(sep1, "growx, h 1!");
        card.add(midPanel, "growx");
        card.add(sep2, "growx, h 1!");
        card.add(botPanel, "growx");
        
        // Passenger Container
        JPanel passengersContainer = new JPanel(new MigLayout("wrap 1, fillx, insets 0 15 15 15, hidemode 3", "[grow]"));
        passengersContainer.setBackground(new Color(250, 250, 249));
        passengersContainer.setVisible(false);
        
        btnDetails.addActionListener(e -> {
            boolean isVisible = passengersContainer.isVisible();
            if (!isVisible) {
                if (passengersContainer.getComponentCount() == 0) {
                    populatePassengers(passengersContainer, flight.getBookingID(), flight.getFlightID());
                }
                passengersContainer.setVisible(true);
                btnDetails.setText("Chi tiết hành khách  ▲");
            } else {
                passengersContainer.setVisible(false);
                btnDetails.setText("Chi tiết hành khách  ▼");
            }
            // Trigger layout update
            passengersContainer.revalidate();
            passengersContainer.repaint();
            card.revalidate();
            card.repaint();
            revalidate();
            repaint();
            
            Window w = SwingUtilities.getWindowAncestor(this);
            if (w != null) w.validate();
        });
        
        card.add(passengersContainer, "growx");
        
        return card;
    }

    private JPanel createInfoBlock(String title, String mainValue, String subValue) {
        JPanel panel = new JPanel(new MigLayout("insets 0, wrap 1, gapy 0", "[]", "[]"));
        panel.setBackground(Color.WHITE);
        
        JLabel lblTitle = new JLabel(title);
        lblTitle.setForeground(TEXT_GRAY);
        lblTitle.setFont(new Font("Segoe UI", Font.PLAIN, 12));
        
        JLabel lblMain = new JLabel(mainValue);
        lblMain.setForeground(TEXT_DARK);
        lblMain.setFont(new Font("Segoe UI", Font.BOLD, 15));
        
        panel.add(lblTitle);
        panel.add(lblMain);
        
        if (subValue != null && !subValue.isEmpty()) {
            JLabel lblSub = new JLabel(subValue);
            lblSub.setForeground(TEXT_GRAY);
            lblSub.setFont(new Font("Segoe UI", Font.PLAIN, 12));
            panel.add(lblSub);
        }
        
        return panel;
    }

    private String formatDuration(int minutes) {
        int h = minutes / 60;
        int m = minutes % 60;
        if (h > 0 && m > 0) return h + "h " + m + "m";
        if (h > 0) return h + "h";
        return m + "m";
    }

    private void populatePassengers(JPanel container, String bookingID, String flightID) {
        List<dto.MyFlightPassengerDTO> passengers = flightBUS.getPassengers(bookingID, flightID);
        
        JSeparator sep = new JSeparator();
        sep.setForeground(BORDER);
        container.add(sep, "growx, h 1!, gapy 0 10");
        
        JLabel lblTitle = new JLabel("Danh sách hành khách (" + passengers.size() + ")");
        lblTitle.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        lblTitle.setForeground(TEXT_GRAY);
        container.add(lblTitle, "gapy 0 5");
        
        for (dto.MyFlightPassengerDTO p : passengers) {
            try {
                JPanel pCard = new JPanel(new MigLayout("fillx, insets 10", "[][grow][]"));
                pCard.setBackground(Color.WHITE);
                pCard.setBorder(new RoundedBorder(8, BORDER));
                
                String initial = getInitials(p.getFullName());
                JLabel lblAvatar = new JLabel(initial, SwingConstants.CENTER);
                lblAvatar.setFont(new Font("Segoe UI", Font.BOLD, 13));
                lblAvatar.setForeground(new Color(14, 165, 233));
                lblAvatar.setBackground(new Color(224, 242, 254));
                lblAvatar.setOpaque(true);
                lblAvatar.setPreferredSize(new Dimension(36, 36));
                lblAvatar.setBorder(new RoundedBorder(18, new Color(224, 242, 254)));
                
                JPanel infoP = new JPanel(new MigLayout("insets 0, wrap 1, gapy 2", "[]", "[][]"));
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
                
                infoP.add(lblName);
                infoP.add(lblSub);
                
                JLabel lblSeat = new JLabel("Ghế " + (p.getSeatNumber() != null ? p.getSeatNumber() : "?"));
                lblSeat.setFont(new Font("Segoe UI", Font.PLAIN, 13));
                lblSeat.setForeground(BLUE_TEXT);
                lblSeat.setBackground(BLUE_BG);
                lblSeat.setOpaque(true);
                lblSeat.setBorder(BorderFactory.createCompoundBorder(
                    new RoundedBorder(10, BLUE_TEXT),
                    new EmptyBorder(4, 12, 4, 12)
                ));
                
                pCard.add(lblAvatar, "cell 0 0");
                pCard.add(infoP, "cell 1 0, gapleft 10");
                pCard.add(lblSeat, "cell 2 0, alignx right");
                
                container.add(pCard, "growx, gapy 0 8");
            } catch (Exception ex) {
                JLabel err = new JLabel("Lỗi hiển thị hành khách: " + ex.getMessage());
                err.setForeground(Color.RED);
                container.add(err, "growx, gapy 10 10");
                ex.printStackTrace();
            }
        }
    }
    
    private String getInitials(String fullName) {
        if (fullName == null || fullName.trim().isEmpty()) return "U";
        String[] parts = fullName.trim().split("\\s+");
        if (parts.length == 1) {
            return parts[0].substring(0, Math.min(2, parts[0].length())).toUpperCase();
        }
        String first = parts[0].substring(0, 1).toUpperCase();
        String last = parts[parts.length - 1].substring(0, 1).toUpperCase();
        return first + last;
    }

    // Custom rounded border class
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
