package gui;

import com.formdev.flatlaf.FlatClientProperties;
import dao.BookingSeatDAO;
import dto.FlightSearchResultDTO;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import java.awt.*;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ExecutionException;

public class SeatSelectionPanel extends JPanel {

    private FlightSearchResultDTO flight;
    private String selectedClass;
    private final BookingProcessPanel navigationListener;
    private final BookingSeatDAO seatDAO = new BookingSeatDAO();
    
    private final Set<String> selectedSeats = new HashSet<>();
    private double baggagePrice = 0;
    private String baggageWeight = "0 kg";

    private static final Color SECONDARY = new Color(0, 102, 138); 
    private static final Color TEXT_DARK = new Color(15, 23, 42);
    private static final Color TEXT_GRAY = new Color(71, 85, 105);
    private static final Color BORDER = new Color(226, 232, 240);
    private static final Color BG_CONTENT = new Color(248, 249, 255);

    private JLabel lblSelectedSeatsVal;
    private JLabel lblBaggageVal;
    private JLabel lblTotalPriceVal;
    private JPanel planeInterior;

    public SeatSelectionPanel(BookingProcessPanel listener) {
        this.navigationListener = listener;
        setLayout(new BorderLayout());
        setBackground(BG_CONTENT);
    }

    private int currentLegIndex = 0;
    private int totalLegsCount = 1;
    private int maxSeats = 9;

    public void setMaxSeats(int maxSeats) {
        this.maxSeats = maxSeats;
    }

    public void setFlightData(FlightSearchResultDTO flight, String selectedClass, int legIdx, int totalLegs) {
        this.flight = flight;
        this.selectedClass = selectedClass;
        this.currentLegIndex = legIdx;
        this.totalLegsCount = totalLegs;
        this.selectedSeats.clear();
        this.baggagePrice = 0;
        this.baggageWeight = "0 kg";
        
        showLoading();
        loadSeatsAsync();
    }

    public void setFlightData(FlightSearchResultDTO flight, String selectedClass) {
        setFlightData(flight, selectedClass, 0, 1);
    }

    public void refreshSeatMap() {
        showLoading();
        loadSeatsAsync();
    }

    private void showLoading() {
        removeAll();
        JPanel loader = new JPanel(new GridBagLayout());
        loader.setOpaque(false);
        JLabel lbl = new JLabel("Đang tải sơ đồ ghế...");
        lbl.setFont(new Font("Segoe UI", Font.ITALIC, 16));
        loader.add(lbl);
        add(loader, BorderLayout.CENTER);
        revalidate();
        repaint();
    }

    private void loadSeatsAsync() {
        SwingWorker<List<BookingSeatDAO.SeatInfo>, Void> worker = new SwingWorker<>() {
            @Override
            protected List<BookingSeatDAO.SeatInfo> doInBackground() throws Exception {
                // Kiểm tra an toàn trước khi gọi DAO
                if (flight == null || flight.getFlightID() == null) {
                    throw new Exception("Thông tin chuyến bay không hợp lệ (FlightID is NULL)");
                }
                return seatDAO.getSeatsByFlightAndClass(flight.getFlightID(), selectedClass);
            }

            @Override
            protected void done() {
                try {
                    List<BookingSeatDAO.SeatInfo> seats = get();
                    displayUI(seats);
                } catch (ExecutionException e) {
                    Throwable cause = e.getCause();
                    cause.printStackTrace();
                    showError("Lỗi DB: " + cause.getMessage());
                } catch (Exception e) {
                    e.printStackTrace();
                    showError("Lỗi hệ thống: " + e.getMessage());
                }
            }
        };
        worker.execute();
    }

    private void displayUI(List<BookingSeatDAO.SeatInfo> seats) {
        removeAll();
        initComponents(seats);
        revalidate();
        repaint();
    }

    private void showError(String msg) {
        removeAll();
        JPanel errorPnl = new JPanel(new MigLayout("wrap, center, insets 40"));
        errorPnl.setOpaque(false);
        
        JLabel lblIcon = new JLabel("⚠️");
        lblIcon.setFont(new Font("Segoe UI", Font.PLAIN, 48));
        
        JLabel lblMsg = new JLabel("<html><body style='width: 300px; text-align: center;'>" + msg + "</body></html>");
        lblMsg.setFont(new Font("Segoe UI", Font.BOLD, 16));
        lblMsg.setForeground(Color.RED);
        
        JButton btnRetry = new JButton("Thử lại");
        btnRetry.addActionListener(e -> loadSeatsAsync());
        
        errorPnl.add(lblIcon, "center");
        errorPnl.add(lblMsg, "center, gaptop 10");
        errorPnl.add(btnRetry, "center, gaptop 20");
        
        add(errorPnl, BorderLayout.CENTER);
        revalidate();
        repaint();
    }

    private void initComponents(List<BookingSeatDAO.SeatInfo> seats) {
        if (flight == null) return;
        
        // Header
        JPanel header = new JPanel(new MigLayout("wrap, insets 0 0 24 0, gapy 4"));
        header.setOpaque(false);
        
        String stepTitle = "Chọn chỗ ngồi & Dịch vụ";
        if (totalLegsCount > 1) {
            stepTitle += " (Chặng " + (currentLegIndex + 1) + "/" + totalLegsCount + ")";
        }
        JLabel title = new JLabel(stepTitle);
        title.setFont(new Font("Segoe UI", Font.BOLD, 28));
        
        String depCity = new bus.BookingAirportBUS().getCityByIATA(flight.getDepartureCode());
        String arrCity = new bus.BookingAirportBUS().getCityByIATA(flight.getArrivalCode());
        String routeStr = depCity + " -> " + arrCity;

        JLabel subtitle = new JLabel("Tùy chỉnh chỗ ngồi của bạn cho chuyến bay " + flight.getFlightID() + " (" + routeStr + ") - Hạng " + selectedClass);
        subtitle.setForeground(TEXT_GRAY);
        header.add(title);
        header.add(subtitle);
        add(header, BorderLayout.NORTH);

        // Main
        JPanel main = new JPanel(new MigLayout("fill, insets 0, gapx 24", "[grow, fill] [320!, fill]", "[grow, fill]"));
        main.setOpaque(false);
        
        // Seat Map
        main.add(createSeatMapPanel(seats));
        
        // Sidebar
        main.add(createRightSidebar(), "top");

        add(main, BorderLayout.CENTER);
    }

    private JPanel createSeatMapPanel(List<BookingSeatDAO.SeatInfo> seats) {
        JPanel p = new JPanel(new MigLayout("wrap 1, insets 24, fill", "[grow, fill]", "[]16[grow, fill]"));
        p.setBackground(Color.WHITE);
        p.putClientProperty(FlatClientProperties.STYLE, "arc:16; borderColor:#e2e8f0; borderWidth:1");

        JLabel lblTitle = new JLabel("Sơ đồ ghế ngồi (" + seats.size() + " ghế)");
        lblTitle.setFont(new Font("Segoe UI", Font.BOLD, 18));
        
        JPanel legend = new JPanel(new MigLayout("insets 0, gapx 16"));
        legend.setOpaque(false);
        legend.add(createLegendItem("Trống", Color.WHITE, BORDER));
        legend.add(createLegendItem("Đang chọn", new Color(135, 206, 250), null));
        legend.add(createLegendItem("Đã đặt", new Color(226, 232, 240), null));
        
        JPanel top = new JPanel(new BorderLayout());
        top.setOpaque(false);
        top.add(lblTitle, BorderLayout.WEST);
        top.add(legend, BorderLayout.EAST);
        p.add(top);

        planeInterior = new JPanel(new MigLayout("wrap 7, insets 40, center, gap 12", "[]12[]12[] 40 [] 12[]12[]12[]", ""));
        planeInterior.setBackground(new Color(240, 244, 255));
        planeInterior.putClientProperty(FlatClientProperties.STYLE, "arc:12");

        if (seats.isEmpty()) {
            planeInterior.add(new JLabel("Không có ghế nào được tìm thấy cho hạng này."), "span");
        } else {
            for (BookingSeatDAO.SeatInfo s : seats) {
                planeInterior.add(createSeatButton(s), "w 40!, h 40!");
            }
        }

        JScrollPane scroll = new JScrollPane(planeInterior);
        scroll.setBorder(null);
        scroll.setOpaque(false);
        scroll.getViewport().setOpaque(false);
        p.add(scroll);

        return p;
    }

    private JButton createSeatButton(BookingSeatDAO.SeatInfo s) {
        JButton btn = new JButton(s.getSeatNumber());
        btn.setFont(new Font("Segoe UI", Font.PLAIN, 10));
        btn.putClientProperty(FlatClientProperties.STYLE, "arc:8");

        if (s.isBooked()) {
            btn.setBackground(new Color(226, 232, 240));
            btn.setText("✕");
            btn.setEnabled(false);
        } else {
            btn.setBackground(Color.WHITE);
            btn.setBorder(BorderFactory.createLineBorder(BORDER));
            btn.addActionListener(e -> {
                if (selectedSeats.contains(s.getSeatNumber())) {
                    selectedSeats.remove(s.getSeatNumber());
                    btn.setBackground(Color.WHITE);
                } else {
                    if (selectedSeats.size() >= maxSeats) {
                        JOptionPane.showMessageDialog(SeatSelectionPanel.this, 
                            "Bạn chỉ được phép chọn tối đa " + maxSeats + " ghế!", 
                            "Thông báo", JOptionPane.WARNING_MESSAGE);
                        return;
                    }
                    selectedSeats.add(s.getSeatNumber());
                    btn.setBackground(new Color(135, 206, 250));
                }
                updateSummary();
            });
        }
        return btn;
    }

    private JPanel createRightSidebar() {
        JPanel p = new JPanel(new MigLayout("wrap, insets 0, fillx, gapy 16"));
        p.setOpaque(false);

        // Baggage
        JPanel pnlBag = new JPanel(new MigLayout("wrap, insets 20, fillx, gapy 12"));
        pnlBag.setBackground(Color.WHITE);
        pnlBag.putClientProperty(FlatClientProperties.STYLE, "arc:16; borderColor:#e2e8f0; borderWidth:1");
        JPanel pnlBagHeader = new JPanel(new FlowLayout(FlowLayout.LEFT, 0, 0));
        pnlBagHeader.setOpaque(false);
        JLabel lblBagIcon = new JLabel("🧳");
        lblBagIcon.setFont(new Font("Segoe UI Emoji", Font.PLAIN, 16));
        JLabel lblBagTitle = new JLabel("  Hành lý ký gửi");
        lblBagTitle.setFont(new Font("Segoe UI", Font.BOLD, 15));
        lblBagTitle.setForeground(TEXT_DARK);
        pnlBagHeader.add(lblBagIcon);
        pnlBagHeader.add(lblBagTitle);
        pnlBag.add(pnlBagHeader, "wrap");
        
        ButtonGroup group = new ButtonGroup();
        pnlBag.add(createBaggageOption("Không ký gửi", "Miễn phí", 0, group, true), "growx");
        pnlBag.add(createBaggageOption("20 kg", "+250.000₫", 250000, group, false), "growx");
        pnlBag.add(createBaggageOption("30 kg", "+400.000₫", 400000, group, false), "growx");
        p.add(pnlBag);

        // Summary
        JPanel pnlSum = new JPanel(new MigLayout("wrap, insets 20, fillx, gapy 12"));
        pnlSum.setBackground(Color.WHITE);
        pnlSum.putClientProperty(FlatClientProperties.STYLE, "arc:16; borderColor:#e2e8f0; borderWidth:1");
        pnlSum.add(new JLabel("Tổng quan"), "wrap");

        lblSelectedSeatsVal = createSummaryRow(pnlSum, "Ghế chọn:", "Chưa chọn");
        lblBaggageVal = createSummaryRow(pnlSum, "Hành lý:", "0 kg");
        pnlSum.add(new JSeparator(), "growx, gaptop 8");
        
        lblTotalPriceVal = new JLabel("0 VNĐ");
        lblTotalPriceVal.setFont(new Font("Segoe UI", Font.BOLD, 22));
        lblTotalPriceVal.setForeground(SECONDARY);
        pnlSum.add(lblTotalPriceVal, "right");

        JButton btnBack = new JButton("← Quay lại");
        btnBack.setFont(new Font("Segoe UI", Font.BOLD, 14));
        btnBack.putClientProperty(FlatClientProperties.STYLE, "arc:8; background:#e2e8f0; color:#475569");
        btnBack.addActionListener(e -> navigationListener.goBackSeatSelection());

        JButton btnNext = new JButton("Tiếp tục →");
        btnNext.setFont(new Font("Segoe UI", Font.BOLD, 14));
        btnNext.setBackground(new Color(11, 28, 48));
        btnNext.setForeground(Color.WHITE);
        btnNext.putClientProperty(FlatClientProperties.STYLE, "arc:8");
        btnNext.addActionListener(e -> {
            if (selectedSeats.isEmpty()) {
                JOptionPane.showMessageDialog(this, "Vui lòng chọn ít nhất một chỗ ngồi để tiếp tục.", "Thông báo", JOptionPane.WARNING_MESSAGE);
                return;
            }
            // Xác nhận chọn ghế cho chặng hiện tại để chuyển chặng hoặc đi tiếp
            navigationListener.confirmSeatsForCurrentLeg(new ArrayList<>(selectedSeats));
        });
        
        JPanel footer = new JPanel(new MigLayout("insets 0, fillx, gapx 8", "[grow, fill] [grow, fill]"));
        footer.setOpaque(false);
        footer.add(btnBack, "h 45!");
        footer.add(btnNext, "h 45!");
        
        pnlSum.add(footer, "growx");

        p.add(pnlSum);
        return p;
    }

    private JPanel createBaggageOption(String label, String priceLabel, double price, ButtonGroup group, boolean sel) {
        JPanel p = new JPanel(new MigLayout("insets 8, fillx", "[]12[grow]push", "[]"));
        p.setOpaque(false);
        JRadioButton rb = new JRadioButton();
        rb.setOpaque(false);
        if (sel) rb.setSelected(true);
        group.add(rb);
        p.add(rb);
        p.add(new JLabel(label));
        JLabel lp = new JLabel(priceLabel);
        lp.setForeground(SECONDARY);
        p.add(lp, "right");
        
        rb.addActionListener(e -> {
            this.baggagePrice = price;
            this.baggageWeight = label;
            updateSummary();
        });
        return p;
    }

    private JLabel createSummaryRow(JPanel parent, String label, String value) {
        JPanel row = new JPanel(new BorderLayout());
        row.setOpaque(false);
        row.add(new JLabel(label), BorderLayout.WEST);
        JLabel val = new JLabel(value);
        val.setFont(new Font("Segoe UI", Font.BOLD, 13));
        row.add(val, BorderLayout.EAST);
        parent.add(row, "growx");
        return val;
    }

    private JPanel createLegendItem(String text, Color bg, Color border) {
        JPanel p = new JPanel(new MigLayout("insets 0, gapx 8"));
        p.setOpaque(false);
        JPanel box = new JPanel();
        box.setPreferredSize(new Dimension(16, 16));
        box.setBackground(bg);
        if (border != null) box.setBorder(BorderFactory.createLineBorder(border));
        p.add(box);
        p.add(new JLabel(text));
        return p;
    }

    private void updateSummary() {
        if (lblSelectedSeatsVal == null || lblTotalPriceVal == null) return;

        lblSelectedSeatsVal.setText(selectedSeats.isEmpty() ? "Chưa chọn" : String.join(", ", selectedSeats));
        lblBaggageVal.setText(baggageWeight);
        
        double basePrice = 0;
        if (flight != null) {
            for (FlightSearchResultDTO.SeatClassInfo sc : flight.getSeatClasses()) {
                if (sc.getClassName().equalsIgnoreCase(selectedClass)) {
                    basePrice = sc.getPrice();
                    break;
                }
            }
        }
        double total = (selectedSeats.size() * basePrice) + baggagePrice;
        lblTotalPriceVal.setText(new DecimalFormat("#,### VNĐ").format(total));
    }
}
