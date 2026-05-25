package gui;

import com.formdev.flatlaf.FlatClientProperties;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.awt.geom.RoundRectangle2D;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;
import com.github.lgooddatepicker.components.DatePicker;
import com.github.lgooddatepicker.components.DatePickerSettings;

import dao.DatVeDAO.BookingAirportDAO;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

/**
 * AeroManage - Booking Home Panel
 * Được cập nhật giao diện theo thiết kế Tailwind (Bento Grid, Colors, Pill
 * Buttons).
 */
public class BookingHomePanel extends JPanel {

    // --- Tailwind Colors từ cấu hình HTML ---
    private static final Color SECONDARY = new Color(0, 102, 138); // #00668a
    private static final Color ON_SURFACE = new Color(11, 28, 48); // #0b1c30
    private static final Color ON_SURFACE_VARIANT = new Color(69, 70, 77); // #45464d
    private static final Color SURFACE = new Color(248, 249, 255); // #f8f9ff
    private static final Color SURFACE_CONTAINER_LOWEST = new Color(255, 255, 255); // #ffffff
    private static final Color SURFACE_CONTAINER_HIGH = new Color(220, 233, 255); // #dce9ff
    private static final Color OUTLINE_VARIANT = new Color(198, 198, 205); // #c6c6cd
    private static final Color OUTLINE = new Color(118, 119, 125); // #76777d

    private JComboBox<String> cbFrom;
    private JComboBox<String> cbTo;
    private JRadioButton rbRoundTrip;
    private JRadioButton rbOneWay;
    private JRadioButton rbMultiCity;
    private JPanel multiCityList;
    private DatePicker dpDateOut;
    private DatePicker dpDateReturn;
    private final Map<String, Image> imageCache = new HashMap<>();

    private List<String> airportList = new ArrayList<>();

    public BookingHomePanel() {
        preloadImages();
        loadAirportData();
        initComponents();
    }

    private void preloadImages() {
        String[] images = { "tokyo.png", "newyork.png", "paris.png", "london.png", "tonhat.png" };
        for (String name : images) {
            try {
                URL url = getClass().getResource("/image/" + name);
                if (url != null)
                    imageCache.put(name, new ImageIcon(url).getImage());
            } catch (Exception e) {
                // Ignore if images are missing
            }
        }
    }

    private void loadAirportData() {
        try {
            BookingAirportDAO dao = new BookingAirportDAO();
            airportList = dao.getAllAirportsForDisplay();
            if (airportList == null || airportList.isEmpty()) {
                airportList = new ArrayList<>();
                JOptionPane.showMessageDialog(null, 
                    "Không thể tải danh sách sân bay từ Cơ sở dữ liệu.\nVui lòng kiểm tra kết nối Database!", 
                    "Lỗi Kết Nối CSDL", 
                    JOptionPane.ERROR_MESSAGE);
            }
        } catch (Exception e) {
            airportList = new ArrayList<>();
            e.printStackTrace();
            JOptionPane.showMessageDialog(null, 
                "Lỗi kết nối cơ sở dữ liệu: " + e.getMessage(), 
                "Lỗi Kết Nối CSDL", 
                JOptionPane.ERROR_MESSAGE);
        }
    }

    private void initComponents() {
        setLayout(new BorderLayout());
        setBackground(SURFACE);

        ScrollablePanel contentPanel = new ScrollablePanel(
                new MigLayout("fillx, insets 0, gap 0", "[grow,fill]", "[]0[]"));
        contentPanel.setBackground(SURFACE);

        JScrollPane scrollPane = new JScrollPane(contentPanel, JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED,
                JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
        scrollPane.setBorder(null);
        scrollPane.getVerticalScrollBar().setUnitIncrement(20);
        add(scrollPane, BorderLayout.CENTER);

        contentPanel.add(createHeroPanel(), "growx, h min:320, wrap");
        contentPanel.add(createPopularDestinationsPanel(), "growx, pad 24 0 40 0");
    }

    private JPanel createHeroPanel() {
        Image bgImg = imageCache.get("tonhat.png");
        JPanel hero = new JPanel(new MigLayout("fill, insets 0", "[center]", "40[]8[]push[]30")) {
            @Override
            protected void paintComponent(Graphics g) {
                super.paintComponent(g);
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setColor(SECONDARY);
                g2.fillRect(0, 0, getWidth(), getHeight());
                if (bgImg != null) {
                    g2.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER, 0.2f));
                    g2.drawImage(bgImg, 0, 0, getWidth(), getHeight(), null);
                }
                g2.dispose();
            }
        };

        JLabel lblTitle = new JLabel("Điểm đến tiếp theo?");
        lblTitle.setFont(new Font("Segoe UI", Font.BOLD, 32));
        lblTitle.setForeground(Color.WHITE);
        hero.add(lblTitle, "wrap");

        JLabel lblSub = new JLabel("Khám phá thế giới với sự chính xác và tin cậy.");
        lblSub.setFont(new Font("Segoe UI", Font.PLAIN, 18));
        lblSub.setForeground(new Color(255, 255, 255, 204));
        hero.add(lblSub, "wrap");

        hero.add(createSearchCard(), "w 90%!, wmax 1000");
        return hero;
    }

    private JPanel createSearchCard() {
        JPanel card = new JPanel(new MigLayout("fillx, insets 20 20 20 20", "[grow,fill]", "[]16[]16[]"));
        card.setBackground(SURFACE_CONTAINER_LOWEST);
        card.putClientProperty(FlatClientProperties.STYLE,
                "arc:12; background:#FFFFFF; borderColor:#C6C6CD; borderWidth:1; dropShadow:true");

        JPanel radioRow = new JPanel(new MigLayout("insets 0 0 12 0, gap 24", "[] [] []"));
        radioRow.setOpaque(false);
        radioRow.setBorder(BorderFactory.createMatteBorder(0, 0, 1, 0, new Color(198, 198, 205, 76)));
        rbRoundTrip = createStyledRadio("Khứ hồi", true);
        rbOneWay = createStyledRadio("Một chiều", false);
        rbMultiCity = createStyledRadio("Nhiều điểm đến", false);
        ButtonGroup group = new ButtonGroup();
        group.add(rbRoundTrip);
        group.add(rbOneWay);
        group.add(rbMultiCity);
        radioRow.add(rbRoundTrip);
        radioRow.add(rbOneWay);
        radioRow.add(rbMultiCity);
        card.add(radioRow, "wrap, growx");

        JPanel dynamicInputPanel = new JPanel(new MigLayout("fillx, insets 0, hidemode 3", "[grow,fill]", "[]"));
        dynamicInputPanel.setOpaque(false);

        JPanel regularPanel = new JPanel(new MigLayout("fillx, insets 0, gap 12",
                "[grow 26,fill][pref!][grow 34,fill][grow 20,fill][grow 20,fill]", "[]"));
        regularPanel.setOpaque(false);

        JPanel pFrom = createComboInputGroup("TỪ", "🛫", "Chọn điểm đi");
        cbFrom = getComboBoxFromGroup(pFrom);

        JButton btnSwap = new JButton("⇄");
        btnSwap.putClientProperty(FlatClientProperties.STYLE,
                "arc:999; background:#eaf1ff; focusWidth:0; foreground:#00668a; borderColor:#C6C6CD; borderWidth:1");
        btnSwap.addActionListener(e -> {
            int i = cbFrom.getSelectedIndex();
            cbFrom.setSelectedIndex(cbTo.getSelectedIndex());
            cbTo.setSelectedIndex(i);
        });

        JPanel pTo = createComboInputGroup("ĐẾN", "🛬", "Chọn điểm đến");
        cbTo = getComboBoxFromGroup(pTo);

        JPanel pDateOut = createDateInputGroup("NGÀY ĐI", "Chọn ngày", "📅");
        dpDateOut = getDatePickerFromGroup(pDateOut);

        JPanel pDateReturn = createDateInputGroup("NGÀY VỀ", "Chọn ngày", "📅");
        dpDateReturn = getDatePickerFromGroup(pDateReturn);

        regularPanel.add(pFrom);
        // Thay đổi aligny bottom thành aligny top với gapy 20 để tránh bị cắt góc dưới
        // vòng tròn
        regularPanel.add(btnSwap, "w 36!, h 36!, aligny top, gapy 20 0");
        regularPanel.add(pTo);
        regularPanel.add(pDateOut);
        regularPanel.add(pDateReturn);

        // Mặc định chọn cái 1 và cái 2 cho chặng lẻ
        if (airportList.size() >= 2) {
            cbFrom.setSelectedIndex(0);
            cbTo.setSelectedIndex(1);
        }

        JPanel multiCityWrapper = new JPanel(new BorderLayout());
        multiCityWrapper.setOpaque(false);
        multiCityList = new JPanel(new MigLayout("fillx, insets 0, gap 8", "[grow,fill]", "[]"));
        multiCityList.setOpaque(false);
        addMultiCitySegment(multiCityList, 1);
        addMultiCitySegment(multiCityList, 2);
        JButton btnAdd = new JButton("+ Thêm chặng bay");
        btnAdd.setFont(new Font("Segoe UI", Font.BOLD, 12));
        btnAdd.setForeground(SECONDARY);
        btnAdd.setContentAreaFilled(false);
        btnAdd.addActionListener(e -> {
            addMultiCitySegment(multiCityList, multiCityList.getComponentCount() + 1);
            updateMultiCitySegments(multiCityList);
            revalidate();
            repaint();
        });
        multiCityWrapper.add(multiCityList, BorderLayout.CENTER);
        JPanel addPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        addPanel.setOpaque(false);
        addPanel.add(btnAdd);
        multiCityWrapper.add(addPanel, BorderLayout.SOUTH);

        dynamicInputPanel.add(regularPanel, "wrap");
        dynamicInputPanel.add(multiCityWrapper, "wrap");
        multiCityWrapper.setVisible(false);
        card.add(dynamicInputPanel, "wrap, growx");

        rbRoundTrip.addActionListener(e -> {
            regularPanel.setVisible(true);
            multiCityWrapper.setVisible(false);
            getDatePickerFromGroup(pDateReturn).setEnabled(true);
            revalidate();
            repaint();
        });
        rbOneWay.addActionListener(e -> {
            regularPanel.setVisible(true);
            multiCityWrapper.setVisible(false);
            getDatePickerFromGroup(pDateReturn).setEnabled(false);
            revalidate();
            repaint();
        });
        rbMultiCity.addActionListener(e -> {
            regularPanel.setVisible(false);
            multiCityWrapper.setVisible(true);
            revalidate();
            repaint();
        });

        JButton btnSearch = new JButton("Tìm chuyến bay");
        btnSearch.setFont(new Font("Segoe UI", Font.BOLD, 15));
        btnSearch.setCursor(new Cursor(Cursor.HAND_CURSOR));
        btnSearch.putClientProperty(FlatClientProperties.STYLE,
                "arc:999; " + // Dáng viên thuốc (Pill) tròn xoe 100% cực kỳ thanh lịch
                        "background:#0ea5e9; " + // Màu xanh trời Sky Blue rực rỡ và hiện đại
                        "foreground:#FFFFFF; " +
                        "hoverBackground:#0284c7; " + // Tông hover xanh đầm
                        "pressedBackground:#0369a1; " + // Tông click
                        "margin:12,60,12,60; " + // Padding rộng tạo dáng thon dài sang trọng
                        "focusWidth:0; " +
                        "borderWidth:0");

        btnSearch.addActionListener(e -> {
            // --- Xử lý Tìm kiếm Nhiều điểm đến (Multi-City) ---
            if (rbMultiCity.isSelected()) {
                Component[] rows = multiCityList.getComponents();
                List<String> depIATAs = new ArrayList<>();
                List<String> arrIATAs = new ArrayList<>();
                List<LocalDate> dates = new ArrayList<>();

                int segmentCount = 0;
                for (int i = 0; i < rows.length; i++) {
                    if (!(rows[i] instanceof JPanel))
                        continue; // Bỏ qua các thành phần phụ trợ không phải chặng bay
                    segmentCount++;
                    JPanel row = (JPanel) rows[i];

                    // Lấy ra các panel chứa Input Group: row.getComponent(1) -> pFromGrp,
                    // row.getComponent(2) -> pToGrp, row.getComponent(3) -> pDateGrp
                    JPanel pFromGrp = (JPanel) row.getComponent(1);
                    JPanel pToGrp = (JPanel) row.getComponent(2);
                    JPanel pDateGrp = (JPanel) row.getComponent(3);

                    JComboBox<String> cbFromMC = getComboBoxFromGroup(pFromGrp);
                    JComboBox<String> cbToMC = getComboBoxFromGroup(pToGrp);
                    DatePicker dpDateMC = getDatePickerFromGroup(pDateGrp);

                    String fromVal = (String) cbFromMC.getSelectedItem();
                    String toVal = (String) cbToMC.getSelectedItem();
                    LocalDate dateVal = dpDateMC.getDate();

                    if (fromVal == null || toVal == null || dateVal == null) {
                        JOptionPane.showMessageDialog(this,
                                "Vui lòng chọn đầy đủ điểm đi, điểm đến và ngày đi cho chặng " + segmentCount + "!",
                                "Thông báo", JOptionPane.WARNING_MESSAGE);
                        return;
                    }

                    String depIATA = extractIATA(fromVal);
                    String arrIATA = extractIATA(toVal);

                    if (depIATA.isEmpty() || arrIATA.isEmpty()) {
                        JOptionPane.showMessageDialog(this, "Mã sân bay chặng " + segmentCount + " không hợp lệ!",
                                "Lỗi", JOptionPane.ERROR_MESSAGE);
                        return;
                    }

                    if (depIATA.equals(arrIATA)) {
                        JOptionPane.showMessageDialog(this,
                                "Điểm đi và đến của chặng " + segmentCount + " không được trùng nhau!", "Thông báo",
                                JOptionPane.WARNING_MESSAGE);
                        return;
                    }

                    if (!dates.isEmpty()) {
                        LocalDate prevDate = dates.get(dates.size() - 1);
                        if (dateVal.isBefore(prevDate)) {
                            JOptionPane.showMessageDialog(this,
                                    "Ngày khởi hành chặng " + segmentCount
                                            + " không được trước ngày khởi hành của chặng " + (segmentCount - 1) + "!",
                                    "Thông báo", JOptionPane.WARNING_MESSAGE);
                            return;
                        }
                    }

                    depIATAs.add(depIATA);
                    arrIATAs.add(arrIATA);
                    dates.add(dateVal);
                }

                if (depIATAs.isEmpty()) {
                    JOptionPane.showMessageDialog(this, "Không tìm thấy chặng bay nào hợp lệ!", "Thông báo",
                            JOptionPane.WARNING_MESSAGE);
                    return;
                }

                // Thực hiện tìm kiếm tất cả các chặng bay qua BUS
                bus.DatVeBUS.BookingFlightBUS flightBUS = new bus.DatVeBUS.BookingFlightBUS();
                List<BookingProcessPanel.SearchLeg> legs = new ArrayList<>();
                for (int i = 0; i < depIATAs.size(); i++) {
                    String dep = depIATAs.get(i);
                    String arr = arrIATAs.get(i);
                    LocalDate dt = dates.get(i);
                    java.util.List<dto.FlightSearchResultDTO> legResults = flightBUS.searchFlights(dep, arr,
                            dt.toString());
                    legs.add(new BookingProcessPanel.SearchLeg(dep, arr, dt.toString(), legResults));
                }

                System.out.println("DEBUG MULTI-CITY: Searched " + legs.size() + " legs successfully.");

                // Chuyển sang màn hình quy trình đặt vé và khởi động chọn các chặng
                Window window = SwingUtilities.getWindowAncestor(this);
                if (window instanceof CustomerMainFrame) {
                    CustomerMainFrame mainFrame = (CustomerMainFrame) window;
                    BookingProcessPanel processPanel = new BookingProcessPanel(mainFrame.getAccount());
                    mainFrame.showPanel(processPanel);

                    processPanel.updateFlightResults(legs);
                    System.out.println("DEBUG: Switched to BookingProcessPanel with all Multi-City search legs.");
                } else {
                    System.err.println("ERROR: Could not find CustomerMainFrame ancestor.");
                }
                return;
            }

            // --- XỬ LÝ TÌM KIẾM KHỨ HỒI (Treat as 2-segment multi-leg journey) ---
            if (rbRoundTrip.isSelected()) {
                String fromStr = (String) cbFrom.getSelectedItem();
                String toStr = (String) cbTo.getSelectedItem();
                LocalDate dateOut = dpDateOut.getDate();
                LocalDate dateReturn = dpDateReturn.getDate();

                System.out.println("DEBUG ROUND-TRIP: Searching from " + fromStr + " to " + toStr + " out " + dateOut
                        + " return " + dateReturn);

                if (fromStr == null || toStr == null || dateOut == null || dateReturn == null) {
                    JOptionPane.showMessageDialog(this,
                            "Vui lòng chọn đầy đủ điểm đi, điểm đến, ngày đi và ngày về cho chuyến bay khứ hồi!",
                            "Thông báo",
                            JOptionPane.WARNING_MESSAGE);
                    return;
                }

                String depIATA = extractIATA(fromStr);
                String arrIATA = extractIATA(toStr);

                if (depIATA.isEmpty() || arrIATA.isEmpty()) {
                    JOptionPane.showMessageDialog(this, "Mã sân bay không hợp lệ!", "Lỗi", JOptionPane.ERROR_MESSAGE);
                    return;
                }

                if (depIATA.equals(arrIATA)) {
                    JOptionPane.showMessageDialog(this, "Điểm đi và đến không được trùng nhau!", "Thông báo",
                            JOptionPane.WARNING_MESSAGE);
                    return;
                }

                if (dateReturn.isBefore(dateOut)) {
                    JOptionPane.showMessageDialog(this, "Ngày về không được trước ngày đi!", "Thông báo",
                            JOptionPane.WARNING_MESSAGE);
                    return;
                }

                bus.DatVeBUS.BookingFlightBUS flightBUS = new bus.DatVeBUS.BookingFlightBUS();
                List<BookingProcessPanel.SearchLeg> legs = new ArrayList<>();

                // Chặng đi (Outbound)
                java.util.List<dto.FlightSearchResultDTO> outResults = flightBUS.searchFlights(depIATA, arrIATA,
                        dateOut.toString());
                legs.add(new BookingProcessPanel.SearchLeg(depIATA, arrIATA, dateOut.toString(), outResults));

                // Chặng về (Return)
                java.util.List<dto.FlightSearchResultDTO> returnResults = flightBUS.searchFlights(arrIATA, depIATA,
                        dateReturn.toString());
                legs.add(new BookingProcessPanel.SearchLeg(arrIATA, depIATA, dateReturn.toString(), returnResults));

                Window window = SwingUtilities.getWindowAncestor(this);
                if (window instanceof CustomerMainFrame) {
                    CustomerMainFrame mainFrame = (CustomerMainFrame) window;
                    BookingProcessPanel processPanel = new BookingProcessPanel(mainFrame.getAccount());
                    mainFrame.showPanel(processPanel);

                    processPanel.updateFlightResults(legs);
                    System.out.println("DEBUG ROUND-TRIP: Switched to BookingProcessPanel with 2 legs.");
                } else {
                    System.err.println("ERROR: Could not find CustomerMainFrame ancestor.");
                }
                return;
            }

            // --- XỬ LÝ TÌM KIẾM MỘT CHIỀU (ONE-WAY) ---
            String fromStr = (String) cbFrom.getSelectedItem();
            String toStr = (String) cbTo.getSelectedItem();
            LocalDate date = dpDateOut.getDate();

            System.out.println("DEBUG ONE-WAY: Searching from " + fromStr + " to " + toStr + " on " + date);

            if (fromStr == null || toStr == null || date == null) {
                JOptionPane.showMessageDialog(this, "Vui lòng chọn đầy đủ điểm đi, điểm đến và ngày đi!", "Thông báo",
                        JOptionPane.WARNING_MESSAGE);
                return;
            }

            String depIATA = extractIATA(fromStr);
            String arrIATA = extractIATA(toStr);

            if (depIATA.isEmpty() || arrIATA.isEmpty()) {
                JOptionPane.showMessageDialog(this, "Mã sân bay không hợp lệ!", "Lỗi", JOptionPane.ERROR_MESSAGE);
                return;
            }

            if (depIATA.equals(arrIATA)) {
                JOptionPane.showMessageDialog(this, "Điểm đi và đến không được trùng nhau!", "Thông báo",
                        JOptionPane.WARNING_MESSAGE);
                return;
            }

            bus.DatVeBUS.BookingFlightBUS flightBUS = new bus.DatVeBUS.BookingFlightBUS();
            java.util.List<dto.FlightSearchResultDTO> results = flightBUS.searchFlights(depIATA, arrIATA,
                    date.toString());
            System.out.println("DEBUG ONE-WAY: Found " + (results != null ? results.size() : 0) + " flights.");

            Window window = SwingUtilities.getWindowAncestor(this);
            if (window instanceof CustomerMainFrame) {
                CustomerMainFrame mainFrame = (CustomerMainFrame) window;
                BookingProcessPanel processPanel = new BookingProcessPanel(mainFrame.getAccount());
                mainFrame.showPanel(processPanel);

                String dateDisplay = date.format(DateTimeFormatter.ofPattern("dd 'Thg' MM, yyyy"));
                processPanel.updateFlightResults(depIATA, arrIATA, dateDisplay, results);
                System.out.println("DEBUG ONE-WAY: Switched to BookingProcessPanel.");
            } else {
                System.err.println("ERROR: Could not find CustomerMainFrame ancestor.");
            }
        });

        JPanel btnPanel = new JPanel(new MigLayout("insets 12 8 8 8, fillx")); // Thêm padding 8px bên phải và bên dưới
                                                                               // để bảo vệ góc tròn của nút không bị
                                                                               // cắt
        btnPanel.setOpaque(false);
        btnPanel.setBorder(BorderFactory.createMatteBorder(1, 0, 0, 0, new Color(198, 198, 205, 76)));
        btnPanel.add(btnSearch, "align right");
        card.add(btnPanel, "growx");

        return card;
    }

    private void addMultiCitySegment(JPanel parent, int index) {
        JPanel row = new JPanel(new MigLayout("fillx, insets 0, gap 12",
                "[pref!][grow 35,fill][grow 35,fill][grow 30,fill][pref!]", "[]"));
        row.setOpaque(false);
        JLabel lbl = new JLabel("Chặng " + index);
        lbl.setFont(new Font("Segoe UI", Font.BOLD, 12));
        lbl.setForeground(SECONDARY);
        JPanel pFrom = createComboInputGroup("TỪ", "🛫", "");
        JPanel pTo = createComboInputGroup("ĐẾN", "🛬", "");

        JComboBox<String> cbFromMC = getComboBoxFromGroup(pFrom);
        JComboBox<String> cbToMC = getComboBoxFromGroup(pTo);

        // Logic đồng bộ: Từ của chặng sau = Đến của chặng trước
        if (index > 1 && parent.getComponentCount() > 0) {
            JPanel lastRow = (JPanel) parent.getComponent(parent.getComponentCount() - 1);
            JComboBox<String> prevTo = getComboBoxFromGroup((JPanel) lastRow.getComponent(2));

            cbFromMC.setSelectedItem(prevTo.getSelectedItem());
            // Cho phép sửa điểm đi nếu người dùng muốn thay đổi hành trình linh hoạt
            prevTo.addActionListener(e -> {
                cbFromMC.setSelectedItem(prevTo.getSelectedItem());
            });
        } else if (airportList.size() >= 2) {
            cbFromMC.setSelectedIndex(0);
            cbToMC.setSelectedIndex(1);
        }

        JPanel pDate = createDateInputGroup("NGÀY ĐI", "Chọn ngày", "📅");
        JButton btnX = new JButton("X");
        btnX.setForeground(Color.RED);
        btnX.setContentAreaFilled(false);
        btnX.setVisible(false);
        btnX.addActionListener(e -> {
            parent.remove(row);
            updateMultiCitySegments(parent);
            revalidate();
            repaint();
        });
        row.add(lbl, "w 60!");
        row.add(pFrom);
        row.add(pTo);
        row.add(pDate);
        row.add(btnX);
        parent.add(row, "wrap");
    }

    private void updateMultiCitySegments(JPanel p) {
        Component[] cs = p.getComponents();
        int c = 0;
        for (Component comp : cs)
            if (comp instanceof JPanel)
                c++;
        int i = 1;
        for (Component comp : cs) {
            if (comp instanceof JPanel) {
                JPanel r = (JPanel) comp;
                ((JLabel) r.getComponent(0)).setText("Chặng " + i++);
                r.getComponent(4).setVisible(c > 2);
            }
        }
    }

    private JRadioButton createStyledRadio(String t, boolean s) {
        JRadioButton rb = new JRadioButton(t, s);
        rb.setOpaque(false);
        rb.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        rb.setForeground(ON_SURFACE);
        rb.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        return rb;
    }

    @SuppressWarnings("unchecked")
    private JComboBox<String> getComboBoxFromGroup(JPanel group) {
        JPanel field = (JPanel) group.getComponent(1);
        return (JComboBox<String>) field.getComponent(1);
    }

    private DatePicker getDatePickerFromGroup(JPanel group) {
        JPanel field = (JPanel) group.getComponent(1);
        for (Component c : field.getComponents()) {
            if (c instanceof DatePicker)
                return (DatePicker) c;
        }
        return null;
    }

    private JPanel createComboInputGroup(String label, String icon, String placeholder) {
        JPanel g = new JPanel(new MigLayout("fillx, insets 0, gap 4", "[grow,fill]", "[]4[]"));
        g.setOpaque(false);

        JLabel lbl = new JLabel(label);
        lbl.setFont(new Font("Segoe UI", Font.BOLD, 10));
        lbl.setForeground(ON_SURFACE_VARIANT);
        g.add(lbl, "wrap");

        JPanel field = new JPanel(new MigLayout("insets 0 10 0 4", "[pref!][grow,fill]", "[grow,fill]"));
        field.putClientProperty(FlatClientProperties.STYLE,
                "arc:8; background:#f8f9ff; borderColor:#C6C6CD; borderWidth:1");

        JLabel iconLbl = new JLabel(" " + icon + " "); // Thêm khoảng trắng đệm
        iconLbl.setFont(new Font("Segoe UI Emoji", Font.PLAIN, 16));
        iconLbl.setForeground(OUTLINE);
        field.add(iconLbl);

        JComboBox<String> cb = new JComboBox<>();
        for (String s : airportList)
            cb.addItem(s);
        cb.putClientProperty(FlatClientProperties.STYLE, "borderWidth:0; focusWidth:0; background:null");
        if (placeholder != null && !placeholder.isEmpty() && airportList.contains(placeholder)) {
            cb.setSelectedItem(placeholder);
        }
        field.add(cb);

        g.add(field, "h 42!");
        return g;
    }

    private JPanel createDateInputGroup(String l, String p, String icon) {
        JPanel g = new JPanel(new MigLayout("fillx, insets 0, gap 4", "[grow,fill]", "[]4[]"));
        g.setOpaque(false);

        JLabel lbl = new JLabel(l);
        lbl.setFont(new Font("Segoe UI", Font.BOLD, 10));
        lbl.setForeground(ON_SURFACE_VARIANT);
        g.add(lbl, "wrap");

        DatePickerSettings settings = new DatePickerSettings();
        settings.setAllowEmptyDates(false);
        settings.setFormatForDatesCommonEra("dd/MM/yyyy");
        settings.setFontValidDate(new Font("Segoe UI", Font.PLAIN, 14));
        settings.setAllowKeyboardEditing(false);

        DatePicker datePicker = new DatePicker(settings);
        datePicker.setBorder(null);
        datePicker.setOpaque(false);
        datePicker.setDateToToday();

        JTextField tf = datePicker.getComponentDateTextField();
        tf.setBorder(null);
        tf.setOpaque(false);
        tf.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        tf.setCursor(new Cursor(Cursor.HAND_CURSOR));
        tf.addMouseListener(new java.awt.event.MouseAdapter() {
            @Override
            public void mousePressed(java.awt.event.MouseEvent e) {
                datePicker.openPopup();
            }
        });

        JButton nativeBtn = datePicker.getComponentToggleCalendarButton();
        nativeBtn.setText(icon);
        nativeBtn.setFont(new Font("Segoe UI Emoji", Font.PLAIN, 14));
        nativeBtn.setBorder(null);
        nativeBtn.setContentAreaFilled(false);
        nativeBtn.setCursor(new Cursor(Cursor.HAND_CURSOR));

        // Construct the wrapper panel with a solid rounded border exactly like PassengerInfoPanel
        JPanel field = new JPanel(new BorderLayout());
        field.setBackground(SURFACE);
        field.setBorder(BorderFactory.createCompoundBorder(
                BorderFactory.createLineBorder(OUTLINE_VARIANT, 1, true),
                BorderFactory.createEmptyBorder(0, 10, 0, 4)
        ));
        field.add(datePicker, BorderLayout.CENTER);

        // Add focus transition styling to the wrapper
        tf.addFocusListener(new java.awt.event.FocusListener() {
            @Override
            public void focusGained(java.awt.event.FocusEvent e) {
                field.setBorder(BorderFactory.createCompoundBorder(
                        BorderFactory.createLineBorder(SECONDARY, 2, true),
                        BorderFactory.createEmptyBorder(0, 9, 0, 3)
                ));
            }
            @Override
            public void focusLost(java.awt.event.FocusEvent e) {
                field.setBorder(BorderFactory.createCompoundBorder(
                        BorderFactory.createLineBorder(OUTLINE_VARIANT, 1, true),
                        BorderFactory.createEmptyBorder(0, 10, 0, 4)
                ));
            }
        });

        g.add(field, "h 42!");
        return g;
    }

    private JPanel createPopularDestinationsPanel() {
        JPanel wrapper = new JPanel(new MigLayout("fillx, insets 0 24 40 24", "[grow,fill]", "[]"));
        wrapper.setOpaque(false);

        JPanel panel = new JPanel(new MigLayout("fillx, insets 0", "[grow,fill]", "[]4[]24[]"));
        panel.setOpaque(false);

        JLabel lblH = new JLabel("Điểm đến thịnh hành");
        lblH.setFont(new Font("Segoe UI", Font.BOLD, 22));
        lblH.setForeground(ON_SURFACE);
        panel.add(lblH, "wrap");

        JLabel lblS = new JLabel("Khám phá các đường bay phổ biến được thiết kế cho những chuyến đi hoàn hảo.");
        lblS.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        lblS.setForeground(ON_SURFACE_VARIANT);
        panel.add(lblS, "wrap");

        // FIX: Ràng buộc [0,grow,fill] ép 2 cột xuất phát từ 0 và chia đều không gian
        // 50/50
        JPanel mainGrid = new JPanel(new MigLayout("fill, insets 0, gap 16", "[0,grow,fill][0,grow,fill]", "[320!]"));
        mainGrid.setOpaque(false);

        // FIX: Thêm tham số "grow" để Tokyo lấp đầy toàn bộ cột bên trái
        mainGrid.add(createDestinationCard("Tokyo", "Từ $849", "tokyo.png", true), "grow");

        // FIX: Ép lưới bên phải thành một ma trận 2x2 chia đều cả chiều rộng lẫn chiều
        // cao
        JPanel rightGrid = new JPanel(
                new MigLayout("fill, insets 0, gap 16", "[0,grow,fill][0,grow,fill]", "[0,grow,fill][0,grow,fill]"));
        rightGrid.setOpaque(false);

        // FIX: Thêm "grow" vào mỗi item để chúng bung kín ô lưới của mình
        rightGrid.add(createDestinationCard("New York", "Từ $299", "newyork.png", false), "grow");
        rightGrid.add(createDestinationCard("Paris", "Từ $450", "paris.png", false), "grow, wrap");
        rightGrid.add(createDestinationCard("London", "Từ $380", "london.png", false), "grow");
        rightGrid.add(createConfidenceCard(), "grow");

        // FIX: Thêm "grow" để mảng 4 ảnh nhỏ lấp đầy cột bên phải
        mainGrid.add(rightGrid, "grow");

        panel.add(mainGrid, "growx");
        wrapper.add(panel, "growx");

        return wrapper;
    }

    private JPanel createDestinationCard(String name, String price, String imgName, boolean isBig) {
        Image img = imageCache.get(imgName);
        JPanel card = new JPanel(new BorderLayout()) {
            @Override
            protected void paintComponent(Graphics g) {
                super.paintComponent(g);
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                Shape clip = new RoundRectangle2D.Double(0, 0, getWidth(), getHeight(), 16, 16); // Tailwind xl
                g2.setClip(clip);
                if (img != null) {
                    double r = Math.max((double) getWidth() / img.getWidth(null),
                            (double) getHeight() / img.getHeight(null));
                    int w = (int) (img.getWidth(null) * r), h = (int) (img.getHeight(null) * r);
                    g2.drawImage(img, (getWidth() - w) / 2, (getHeight() - h) / 2, w, h, null);
                } else {
                    g2.setColor(new Color(30, 41, 59));
                    g2.fillRect(0, 0, getWidth(), getHeight());
                }

                // Overlay Gradient mượt từ dưới lên
                g2.setPaint(new GradientPaint(0, getHeight() * 0.4f, new Color(0, 0, 0, 0), 0, getHeight(),
                        new Color(0, 0, 0, 200)));
                g2.fillRect(0, 0, getWidth(), getHeight());
                g2.dispose();
            }
        };
        card.setOpaque(false);
        card.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        card.setBorder(BorderFactory.createLineBorder(OUTLINE_VARIANT)); // Border mờ bao quanh

        JPanel content = new JPanel(new MigLayout("fill, insets 16", "[grow,fill]", "push[]2[]"));
        content.setOpaque(false);

        if (isBig) {
            JLabel badge = new JLabel("Bay thẳng");
            badge.setFont(new Font("Segoe UI", Font.BOLD, 10));
            badge.setForeground(Color.WHITE);
            badge.setOpaque(true);
            badge.setBackground(new Color(255, 255, 255, 60)); // Kính mờ
            badge.setBorder(new EmptyBorder(4, 8, 4, 8));
            badge.putClientProperty(FlatClientProperties.STYLE, "arc:8");

            JPanel badgeWrapper = new JPanel(new FlowLayout(FlowLayout.LEFT, 0, 0));
            badgeWrapper.setOpaque(false);
            badgeWrapper.add(badge);
            content.add(badgeWrapper, "wrap, gapbottom 8");

            price = price + " • Có chuyến bay thẳng";
        }

        JLabel n = new JLabel(name);
        n.setFont(new Font("Segoe UI", Font.BOLD, isBig ? 24 : 18));
        n.setForeground(Color.WHITE);

        JLabel p = new JLabel(price);
        p.setFont(new Font("Segoe UI", Font.PLAIN, isBig ? 14 : 12));
        p.setForeground(new Color(255, 255, 255, 200));

        content.add(n, "wrap");
        content.add(p);
        card.add(content);
        return card;
    }

    private JPanel createConfidenceCard() {
        JPanel card = new JPanel(new MigLayout("insets 16, fill", "[grow,fill]", "[]8[]4[]push[]"));
        card.setBackground(SURFACE_CONTAINER_HIGH);
        card.putClientProperty(FlatClientProperties.STYLE, "arc:16; borderColor:#C6C6CD; borderWidth:1");

        JLabel icon = new JLabel(" 🛡 ");
        icon.setFont(new Font("Segoe UI Emoji", Font.PLAIN, 24));
        icon.setForeground(SECONDARY);
        icon.setBorder(BorderFactory.createEmptyBorder(5, 0, 5, 0));

        JLabel t = new JLabel("Tự tin đặt vé");
        t.setFont(new Font("Segoe UI", Font.BOLD, 16));
        t.setForeground(ON_SURFACE);

        JTextArea d = new JTextArea("Chính sách hủy linh hoạt và hỗ trợ 24/7 cho thành viên AeroManage.");
        d.setFont(new Font("Segoe UI", Font.PLAIN, 12));
        d.setForeground(ON_SURFACE_VARIANT);
        d.setLineWrap(true);
        d.setWrapStyleWord(true);
        d.setOpaque(false);
        d.setEditable(false);

        JLabel link = new JLabel("<html><u>Tìm hiểu thêm -></u></html>");
        link.setFont(new Font("Segoe UI", Font.BOLD, 13));
        link.setForeground(SECONDARY);
        link.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));

        card.add(icon, "wrap");
        card.add(t, "wrap");
        // FIX: Thêm "wmin 0" để tránh JTextArea làm vỡ khung layout khi tự động wrap
        // text
        card.add(d, "wrap, wmin 0");
        card.add(link, "aligny bottom");

        return card;
    }

    private String extractIATA(String s) {
        if (s == null || !s.contains("(") || !s.contains(")"))
            return "";
        return s.substring(s.indexOf("(") + 1, s.indexOf(")"));
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