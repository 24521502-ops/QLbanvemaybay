package gui;

import com.formdev.flatlaf.FlatClientProperties;

import bus.DatVeBUS.BookingAirportBUS;
import net.miginfocom.swing.MigLayout;
import dao.DatVeDAO.BookingFlightDAO;
import dto.FlightSearchResultDTO;

import javax.swing.*;
import java.awt.*;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * AeroManage - FlightSearchResultPanel
 * Premium flight selection UI with interactive date ribbon.
 */
public class FlightSearchResultPanel extends JPanel {

    private String depCode;
    private String arrCode;
    private LocalDate searchDate;
    private List<FlightSearchResultDTO> flights;
    private BookingProcessPanel navigationListener;

    private final BookingAirportBUS airportBUS = new BookingAirportBUS();
    private final BookingFlightDAO flightDAO = new BookingFlightDAO();

    // Design System
    private static final Color PRIMARY = new Color(29, 78, 216); // blue-700
    private static final Color SECONDARY = new Color(0, 102, 138); // TIU AIRLINES Secondary
    private static final Color BG_CONTENT = new Color(248, 249, 255);
    private static final Color TEXT_DARK = new Color(15, 23, 42);
    private static final Color TEXT_GRAY = new Color(71, 85, 105);
    private static final Color BORDER = new Color(226, 232, 240);
    private static final Color SURFACE = Color.WHITE;

    // Multi-City State fields
    private List<BookingProcessPanel.SearchLeg> multiCityLegs;
    private int activeLegIndex = -1;

    public FlightSearchResultPanel() {
        this("SGN", "HAN", LocalDate.now().toString(), new ArrayList<>(), null);
    }

    public FlightSearchResultPanel(String dep, String arr, String dateStr, List<FlightSearchResultDTO> flights,
            BookingProcessPanel listener) {
        this.depCode = dep;
        this.arrCode = arr;
        this.flights = flights != null ? flights : new ArrayList<>();
        this.navigationListener = listener;

        try {
            if (dateStr.contains("Thg")) {
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd 'Thg' MM, yyyy");
                this.searchDate = LocalDate.parse(dateStr, dtf);
            } else {
                this.searchDate = LocalDate.parse(dateStr);
            }
        } catch (Exception e) {
            this.searchDate = LocalDate.now();
        }

        setLayout(new BorderLayout());
        setBackground(BG_CONTENT);
        initComponents();
    }

    public FlightSearchResultPanel(List<BookingProcessPanel.SearchLeg> legs, int activeIndex,
            BookingProcessPanel listener) {
        this.multiCityLegs = legs;
        this.activeLegIndex = activeIndex;
        BookingProcessPanel.SearchLeg activeLeg = legs.get(activeIndex);
        this.depCode = activeLeg.depCode;
        this.arrCode = activeLeg.arrCode;
        this.flights = activeLeg.results != null ? activeLeg.results : new ArrayList<>();
        this.navigationListener = listener;

        try {
            this.searchDate = LocalDate.parse(activeLeg.dateStr);
        } catch (Exception e) {
            this.searchDate = LocalDate.now();
        }

        setLayout(new BorderLayout());
        setBackground(BG_CONTENT);
        initComponents();

        // Đưa trực tiếp card hành trình dọc vào thanh sidebar bên trái để giải phóng
        // hoàn toàn không gian
        if (listener != null) {
            listener.getSidebar().setMultiCityCard(createMultiCityVerticalCard());
        }
    }

    private BookingProcessPanel findNavigationListener() {
        if (navigationListener != null)
            return navigationListener;
        Container parent = getParent();
        while (parent != null) {
            if (parent instanceof BookingProcessPanel)
                return (BookingProcessPanel) parent;
            parent = parent.getParent();
        }
        return null;
    }

    private void initComponents() {
        removeAll();

        // Layout 1 cột rộng rãi, phóng khoáng cho cả Một chiều, Khứ hồi và Nhiều điểm
        // đến
        setLayout(new BorderLayout());
        JPanel container = new JPanel(new MigLayout("wrap, fillx, insets 24 16, gapy 24", "[grow, fill]"));
        container.setOpaque(false);
        container.add(createHeaderSummary());
        container.add(createDateRibbon());
        container.add(createFlightList());
        add(container, BorderLayout.CENTER);

        revalidate();
        repaint();
    }

    private JPanel createMultiCityVerticalCard() {
        JPanel card = new JPanel(new MigLayout("wrap, fillx, insets 16 0 16 0, gapy 0", "[grow, fill]"));
        card.setBackground(SURFACE);
        card.putClientProperty(FlatClientProperties.STYLE, "arc:12; borderColor:#e2e8f0; borderWidth:1");

        // Tiêu đề card
        JPanel titlePanel = new JPanel(new MigLayout("insets 0 16 12 16, gapx 8", "[][]", "[]"));
        titlePanel.setOpaque(false);
        titlePanel.setBorder(BorderFactory.createMatteBorder(0, 0, 1, 0, new Color(226, 232, 240))); // Line phân cách

        JLabel lblIcon = new JLabel("🛫");
        lblIcon.setFont(new Font("Segoe UI Emoji", Font.PLAIN, 20));

        JLabel lblTitle = new JLabel("Chuyến bay của bạn");
        lblTitle.setFont(new Font("Segoe UI", Font.BOLD, 15));
        lblTitle.setForeground(TEXT_DARK);

        titlePanel.add(lblIcon);
        titlePanel.add(lblTitle);
        card.add(titlePanel, "wrap, growx");

        // Danh sách các chặng bay xếp dọc
        for (int i = 0; i < multiCityLegs.size(); i++) {
            BookingProcessPanel.SearchLeg leg = multiCityLegs.get(i);
            final int legIdx = i;
            final boolean isActive = (i == activeLegIndex);
            final boolean isCompleted = (i < activeLegIndex);

            JPanel legRow = new JPanel(new MigLayout("insets 12 16, gapx 12", "[pref!][grow, fill]", "[]"));
            legRow.setOpaque(isActive);
            if (isActive) {
                legRow.setBackground(new Color(239, 246, 255)); // Nền xanh dương nhạt cho chặng active
            } else {
                legRow.setBackground(Color.WHITE);
            }

            // Đường xanh bên trái nếu đang được chọn (Active)
            if (isActive) {
                legRow.setBorder(BorderFactory.createCompoundBorder(
                        BorderFactory.createMatteBorder(0, 4, 0, 0, new Color(14, 165, 233)), // Thanh đứng xanh dương
                        BorderFactory.createEmptyBorder(0, 8, 0, 0) // Padding trong
                ));
            } else {
                legRow.setBorder(BorderFactory.createEmptyBorder(0, 12, 0, 0));
            }

            // Số thứ tự chặng (Hộp tròn)
            JLabel lblNum = new JLabel();
            lblNum.setHorizontalAlignment(SwingConstants.CENTER);
            lblNum.setOpaque(true);
            lblNum.setFont(new Font("Segoe UI", Font.BOLD, 11));

            if (isCompleted) {
                lblNum.setText(String.valueOf(i + 1));
                lblNum.setBackground(new Color(34, 197, 94)); // Xanh lá cây
                lblNum.setForeground(Color.WHITE);
            } else if (isActive) {
                lblNum.setText(String.valueOf(i + 1));
                lblNum.setBackground(new Color(14, 165, 233)); // Xanh dương
                lblNum.setForeground(Color.WHITE);
            } else {
                lblNum.setText(String.valueOf(i + 1));
                lblNum.setBackground(new Color(226, 232, 240)); // Xám
                lblNum.setForeground(new Color(100, 116, 139));
            }
            lblNum.setPreferredSize(new Dimension(24, 24));
            lblNum.putClientProperty(FlatClientProperties.STYLE, "arc:999");

            // Text chặng bay
            JPanel textPnl = new JPanel(new MigLayout("wrap, insets 0, gapy 2"));
            textPnl.setOpaque(false);

            // Dòng ngày đi
            JLabel lblDate = new JLabel(formatLegDate(leg.dateStr));
            lblDate.setFont(new Font("Segoe UI", isActive ? Font.BOLD : Font.PLAIN, 12));
            lblDate.setForeground(isActive ? TEXT_DARK : new Color(148, 163, 184)); // Tối hoặc xám nhạt

            // Dòng hành trình (TP HCM -> Bangkok) - Dùng ký tự ASCII -> để không bao giờ bị
            // lỗi ô vuông
            String depCity = airportBUS.getCityByIATA(leg.depCode);
            String arrCity = airportBUS.getCityByIATA(leg.arrCode);
            JLabel lblRoute = new JLabel(depCity + " -> " + arrCity);
            lblRoute.setFont(new Font("Segoe UI", Font.BOLD, 13));
            lblRoute.setForeground(isActive ? TEXT_DARK : new Color(148, 163, 184));

            textPnl.add(lblDate);
            textPnl.add(lblRoute);

            legRow.add(lblNum, "w 24!, h 24!");
            legRow.add(textPnl);

            // Thêm hiệu ứng click và hover tương tác kiểu Traveloka Premium
            legRow.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
            legRow.addMouseListener(new java.awt.event.MouseAdapter() {
                @Override
                public void mouseClicked(java.awt.event.MouseEvent e) {
                    BookingProcessPanel listener = findNavigationListener();
                    if (listener != null) {
                        listener.goToLeg(legIdx);
                    }
                }

                @Override
                public void mouseEntered(java.awt.event.MouseEvent e) {
                    legRow.setBackground(new Color(241, 245, 249)); // Màu xám nhẹ khi hover
                    legRow.setOpaque(true);
                    legRow.repaint();
                }

                @Override
                public void mouseExited(java.awt.event.MouseEvent e) {
                    if (isActive) {
                        legRow.setBackground(new Color(239, 246, 255)); // Trả về màu active xanh nhạt
                    } else {
                        legRow.setBackground(Color.WHITE);
                        legRow.setOpaque(false);
                    }
                    legRow.repaint();
                }
            });

            card.add(legRow, "wrap, growx");

            // Thêm đường phân cách mờ ở giữa các chặng
            if (i < multiCityLegs.size() - 1) {
                JPanel line = new JPanel();
                line.setBackground(new Color(241, 245, 249));
                card.add(line, "h 1!, growx, gapleft 12, gapright 12");
            }
        }

        return card;
    }

    private String formatLegDate(String dateStr) {
        try {
            LocalDate d = LocalDate.parse(dateStr);
            int dow = d.getDayOfWeek().getValue();
            String dowStr = (dow == 7) ? "Chủ Nhật" : "Thứ " + (dow + 1);
            return dowStr + ", " + d.getDayOfMonth() + " thg " + d.getMonthValue() + " " + d.getYear();
        } catch (Exception e) {
            return dateStr;
        }
    }

    private JPanel createHeaderSummary() {
        JPanel card = new JPanel(
                new MigLayout("insets 20 32, fillx", "[pref!][pref!, center][pref!][grow, right]", "[center]"));
        card.setBackground(SURFACE);
        card.putClientProperty(FlatClientProperties.STYLE, "arc:16; borderColor:#e2e8f0; borderWidth:1");

        String depCity = airportBUS.getCityByIATA(depCode);
        String arrCity = airportBUS.getCityByIATA(arrCode);

        // Departure
        JPanel pnlFrom = createCityGroup(depCode, depCity, true);

        // Icon
        JLabel lblPlane = new JLabel("🛫");
        lblPlane.setFont(new Font("Segoe UI Emoji", Font.PLAIN, 28));
        lblPlane.setBorder(BorderFactory.createEmptyBorder(8, 20, 8, 20)); // Thêm padding trên dưới để tránh bị cắt
                                                                           // cánh/đuôi

        // Arrival
        JPanel pnlTo = createCityGroup(arrCode, arrCity, false);

        // Info
        JPanel pnlInfo = new JPanel(new MigLayout("wrap, insets 0, gapy 2", "[right, grow]"));
        pnlInfo.setOpaque(false);
        JLabel lblDateTitle = new JLabel("NGÀY ĐI");
        lblDateTitle.setFont(new Font("Segoe UI", Font.BOLD, 11));
        lblDateTitle.setForeground(TEXT_GRAY);
        JLabel lblDateVal = new JLabel(searchDate.format(DateTimeFormatter.ofPattern("dd 'Thg' MM, yyyy")));
        lblDateVal.setFont(new Font("Segoe UI", Font.BOLD, 18));
        lblDateVal.setForeground(TEXT_DARK);
        pnlInfo.add(lblDateTitle);
        pnlInfo.add(lblDateVal);

        card.add(pnlFrom);
        card.add(lblPlane, "gapleft 48, gapright 48");
        card.add(pnlTo);
        card.add(pnlInfo, "growx");

        return card;
    }

    private JPanel createCityGroup(String code, String name, boolean left) {
        JPanel p = new JPanel(new MigLayout("wrap, insets 0, gapy 2", left ? "[left]" : "[left]"));
        p.setOpaque(false);
        JLabel lblCode = new JLabel(code);
        lblCode.setFont(new Font("Segoe UI", Font.BOLD, 32));
        lblCode.setForeground(TEXT_DARK);
        JLabel lblName = new JLabel(name);
        lblName.setFont(new Font("Segoe UI", Font.PLAIN, 15));
        lblName.setForeground(TEXT_GRAY);
        p.add(lblCode);
        p.add(lblName);
        return p;
    }

    private JPanel createDateRibbon() {
        JPanel ribbon = new JPanel(new MigLayout("insets 0, fillx", "[pref!][grow, center][pref!]", "[center]"));
        ribbon.setOpaque(false);

        JButton btnPrev = createNavButton("<");
        btnPrev.addActionListener(e -> updateSearchDate(searchDate.minusDays(1)));

        JButton btnNext = createNavButton(">");
        btnNext.addActionListener(e -> updateSearchDate(searchDate.plusDays(1)));

        JPanel datesContainer = new JPanel(new MigLayout("insets 0, gapx 16", "[]"));
        datesContainer.setOpaque(false);

        Map<LocalDate, Double> prices = flightDAO.getMinPricesForWeek(depCode, arrCode, searchDate);

        for (int i = -2; i <= 2; i++) {
            LocalDate d = searchDate.plusDays(i);
            boolean active = (i == 0);
            Double minPrice = prices.get(d);

            datesContainer.add(createDateItem(d, minPrice, active));
        }

        ribbon.add(btnPrev);
        ribbon.add(datesContainer);
        ribbon.add(btnNext);

        return ribbon;
    }

    private JPanel createDateItem(LocalDate d, Double price, boolean active) {
        String dow = getVietnameseDayOfWeek(d);
        String dateStr = d.format(DateTimeFormatter.ofPattern("dd 'Thg' MM"));
        String priceStr = (price != null) ? formatPriceShort(price) : "---";

        JPanel item = new JPanel(new MigLayout("wrap, insets 12 24, center", "[center]", "[]2[]2[]"));
        item.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));

        if (active) {
            item.setBackground(new Color(239, 246, 255));
            item.setBorder(BorderFactory.createLineBorder(PRIMARY, 1, true));
        } else {
            item.setBackground(SURFACE);
            item.setBorder(BorderFactory.createLineBorder(BORDER, 1, true));
        }
        item.putClientProperty(FlatClientProperties.STYLE, "arc:12");

        JLabel l1 = new JLabel(dow);
        l1.setFont(new Font("Segoe UI", Font.BOLD, 12));
        l1.setForeground(active ? PRIMARY : TEXT_GRAY);

        JLabel l2 = new JLabel(dateStr);
        l2.setFont(new Font("Segoe UI", active ? Font.BOLD : Font.PLAIN, 15));
        l2.setForeground(TEXT_DARK);

        JLabel l3 = new JLabel("từ " + priceStr);
        l3.setFont(new Font("Segoe UI", Font.BOLD, 12));
        l3.setForeground(active ? SECONDARY : TEXT_GRAY);

        item.add(l1);
        item.add(l2);
        item.add(l3);

        item.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent e) {
                updateSearchDate(d);
            }
        });

        return item;
    }

    private void updateSearchDate(LocalDate newDate) {
        this.searchDate = newDate;
        this.flights = flightDAO.searchFlights(depCode, arrCode, newDate.toString());
        initComponents();
    }

    private String getVietnameseDayOfWeek(LocalDate d) {
        int dow = d.getDayOfWeek().getValue();
        return (dow == 7) ? "CN" : "T" + (dow + 1);
    }

    private String formatPriceShort(double price) {
        if (price >= 1000000)
            return String.format("%.1fM", price / 1000000.0);
        return String.format("%.0fK", price / 1000.0);
    }

    private JButton createNavButton(String text) {
        JButton b = new JButton(text);
        b.setFont(new Font("Segoe UI", Font.BOLD, 22));
        b.setForeground(TEXT_GRAY);
        b.setContentAreaFilled(false);
        b.setBorderPainted(false);
        b.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        return b;
    }

    private JPanel createFlightList() {
        JPanel list = new JPanel(new MigLayout("wrap, fillx, insets 0, gapy 20", "[grow, fill]"));
        list.setOpaque(false);

        if (flights.isEmpty()) {
            JPanel empty = new JPanel(new GridBagLayout());
            empty.setOpaque(false);
            empty.setPreferredSize(new Dimension(0, 300));
            JLabel lbl = new JLabel("Không tìm thấy chuyến bay phù hợp.");
            lbl.setFont(new Font("Segoe UI", Font.ITALIC, 18));
            lbl.setForeground(TEXT_GRAY);
            empty.add(lbl);
            list.add(empty, "grow");
        } else {
            for (FlightSearchResultDTO f : flights) {
                list.add(createFlightCard(f));
            }
        }

        return list;
    }

    private JPanel createFlightCard(FlightSearchResultDTO f) {
        JPanel card = new JPanel(
                new MigLayout("insets 20 24, fillx, gapx 12", "[pref!][grow, fill, center][250!]", "[center]"));
        card.setBackground(SURFACE);
        card.putClientProperty(FlatClientProperties.STYLE, "arc:16; borderColor:#e2e8f0; borderWidth:1");

        // Airline
        JPanel pnlAir = new JPanel(new MigLayout("insets 0, gapx 16", "[]", "[]"));
        pnlAir.setOpaque(false);
        JLabel logo = new JLabel("🛫", SwingConstants.CENTER);
        logo.setFont(new Font("Segoe UI Emoji", Font.PLAIN, 28));
        logo.setBorder(BorderFactory.createEmptyBorder(8, 8, 8, 15)); // Thêm padding các góc để cánh không bị cắt

        JPanel airText = new JPanel(new MigLayout("wrap, insets 0, gapy 2"));
        airText.setOpaque(false);
        JLabel lblAir = new JLabel(f.getAirlineName());
        lblAir.setFont(new Font("Segoe UI", Font.BOLD, 18));
        JLabel lblDetail = new JLabel(f.getFlightID() + " • " + f.getAircraftModel());
        lblDetail.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        lblDetail.setForeground(TEXT_GRAY);
        airText.add(lblAir);
        airText.add(lblDetail);
        pnlAir.add(logo);
        pnlAir.add(airText);

        // Timeline
        SimpleDateFormat hm = new SimpleDateFormat("HH:mm");
        JPanel pnlTime = new JPanel(
                new MigLayout("insets 0, fillx, gapx 16", "[pref!][grow, fill, center][pref!]", "[center]"));
        pnlTime.setOpaque(false);

        pnlTime.add(createTimeNode(hm.format(f.getDepartureTime()), f.getDepartureCode()));

        JPanel mid = new JPanel(new MigLayout("wrap, insets 0, fillx, gapy 4", "[grow, center]"));
        mid.setOpaque(false);
        
        long diff = f.getArrivalTime().getTime() - f.getDepartureTime().getTime();
        long hours = diff / (3600 * 1000);
        long minutes = (diff % (3600 * 1000)) / (60 * 1000);
        String durationStr = hours + "h " + minutes + "m";
        JLabel lblDur = new JLabel(durationStr);
        lblDur.setFont(new Font("Segoe UI", Font.PLAIN, 12));
        lblDur.setForeground(TEXT_GRAY);
        JLabel lblLine = new JLabel("<html>- - - - - - -  <font face='Segoe UI Emoji'>🛫</font>  - - - - - - -</html>"); // Sử
                                                                                                                         // dụng
                                                                                                                         // dấu
                                                                                                                         // gạch
                                                                                                                         // ngang
                                                                                                                         // chuẩn
                                                                                                                         // Segoe
                                                                                                                         // UI
                                                                                                                         // và
                                                                                                                         // bọc
                                                                                                                         // emoji
                                                                                                                         // trong
                                                                                                                         // font
                                                                                                                         // Segoe
                                                                                                                         // UI
                                                                                                                         // Emoji
                                                                                                                         // để
                                                                                                                         // không
                                                                                                                         // bao
                                                                                                                         // giờ
                                                                                                                         // bị
                                                                                                                         // lỗi
                                                                                                                         // ô
                                                                                                                         // vuông
        lblLine.setFont(new Font("Segoe UI", Font.PLAIN, 14)); // Sử dụng Segoe UI chuẩn vẽ gạch ngang tuyệt đẹp
        lblLine.setForeground(new Color(203, 213, 225));
        mid.add(lblDur, "center");
        mid.add(lblLine, "center");
        pnlTime.add(mid);

        pnlTime.add(createTimeNode(hm.format(f.getArrivalTime()), f.getArrivalCode()));

        // Pricing
        JPanel pnlPrice = new JPanel(new MigLayout("wrap, fillx, insets 0, gapy 8", "[grow, fill]"));
        pnlPrice.setOpaque(false);

        List<FlightSearchResultDTO.SeatClassInfo> classes = f.getSeatClasses();
        for (int i = 0; i < classes.size(); i++) {
            FlightSearchResultDTO.SeatClassInfo sc = classes.get(i);
            // Highlight the first class (usually lowest price due to SQL order)
            pnlPrice.add(createPriceRow(f, sc.getClassName(), sc.getPrice(), sc.getAvailableSeats(), i == 0), "growx");
        }

        card.add(pnlAir, "aligny center");
        card.add(pnlTime, "growx, aligny center");
        card.add(pnlPrice, "aligny center");

        return card;
    }

    private JPanel createTimeNode(String time, String code) {
        JPanel p = new JPanel(new MigLayout("wrap, insets 0, center, gapy 0"));
        p.setOpaque(false);
        JLabel t = new JLabel(time);
        t.setFont(new Font("Segoe UI", Font.BOLD, 24));
        JLabel c = new JLabel(code);
        c.setFont(new Font("Segoe UI", Font.PLAIN, 15));
        c.setForeground(TEXT_GRAY);
        p.add(t);
        p.add(c);
        return p;
    }

    private JPanel createPriceRow(FlightSearchResultDTO flight, String type, double price, int seats, boolean primary) {
        JPanel p = new JPanel(new MigLayout("insets 8 16, fillx", "[grow, fill][pref!]", "[center]"));
        p.setBackground(primary ? new Color(240, 249, 255) : SURFACE);
        p.setBorder(BorderFactory.createLineBorder(primary ? SECONDARY : BORDER, 1, true));
        p.putClientProperty(FlatClientProperties.STYLE, "arc:10");

        JPanel text = new JPanel(new MigLayout("wrap, insets 0, gapy 0"));
        text.setOpaque(false);
        JLabel lblType = new JLabel(type.toUpperCase() + (seats > 0 ? "" : " (Hết vé)"));
        lblType.setFont(new Font("Segoe UI", Font.BOLD, 11));
        lblType.setForeground(seats > 0 ? (primary ? SECONDARY : TEXT_GRAY) : Color.RED);

        JLabel lblPrice = new JLabel(new DecimalFormat("#,###₫").format(price));
        lblPrice.setFont(new Font("Segoe UI", Font.BOLD, 17));
        lblPrice.setForeground(TEXT_DARK);
        text.add(lblType);
        text.add(lblPrice);

        JButton btn = new JButton("Chọn");
        btn.setFont(new Font("Segoe UI", Font.BOLD, 13));
        btn.putClientProperty(FlatClientProperties.STYLE, "arc:8");
        btn.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        btn.setEnabled(seats > 0);
        if (primary && seats > 0) {
            btn.setBackground(SECONDARY);
            btn.setForeground(Color.WHITE);
        }

        btn.addActionListener(e -> {
            BookingProcessPanel listener = findNavigationListener();
            System.out.println("DEBUG: Clicked Select for Flight " + flight.getFlightID() + ", Class: " + type);
            if (listener != null) {
                if (multiCityLegs != null && multiCityLegs.size() > 1) {
                    listener.selectFlightForLeg(flight, type);
                } else {
                    listener.showSeatSelection(flight, type);
                }
            } else {
                System.err.println("ERROR: Could not find BookingProcessPanel for navigation!");
            }
        });

        p.add(text, "growx, aligny center");
        p.add(btn, "w 80!, h 34!, aligny center");
        return p;
    }
}