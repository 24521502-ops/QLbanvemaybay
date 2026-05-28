package gui;

import com.formdev.flatlaf.FlatClientProperties;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.ArrayList;
import java.util.List;

public class BookingProcessPanel extends JPanel {

    private CardLayout cardLayout;
    private JPanel mainContentPanel;
    private BookingProgressSidebar sidebar;
    private JScrollPane scrollPane;

    // UI Panels
    private FlightSearchResultPanel flightSearchPanel;
    private PassengerInfoPanel passengerInfoPanel;
    private SeatSelectionPanel seatSelectionPanel;
    private PaymentPanel paymentPanel;

    private final dao.DatVeDAO.BookingProcessDAO bookingDAO = new dao.DatVeDAO.BookingProcessDAO();
    private String currentBookingID;
    private Timer checkoutTimer;
    private int remainingSeconds = 1200; // 20 minutes

    // Selection State
    private dto.FlightSearchResultDTO selectedFlight;
    private String selectedClass;
    private List<String> selectedSeats;

    // Multi-City Selection State
    private List<SearchLeg> searchLegs = new ArrayList<>();
    private int activeLegIndex = 0;
    private List<dto.FlightSearchResultDTO> selectedFlights = new ArrayList<>();
    private List<String> selectedClasses = new ArrayList<>();
    private List<List<String>> multiCitySeats = new ArrayList<>();

    // Passenger Data
    private List<dto.PassengerDTO> currentPassengers = new ArrayList<>();

    private dto.AccountDTO account; // Lưu account trực tiếp thay vì dùng getWindowAncestor

    public BookingProcessPanel() {
        this(null);
    }

    public BookingProcessPanel(dto.AccountDTO account) {
        this.account = account;
        setLayout(new BorderLayout());
        setBackground(new Color(248, 249, 255));
        initComponents();
    }

    private void initComponents() {
        sidebar = new BookingProgressSidebar();
        add(sidebar, BorderLayout.WEST);

        cardLayout = new CardLayout();
        mainContentPanel = new JPanel(cardLayout);
        mainContentPanel.setBackground(new Color(248, 249, 255));
        mainContentPanel.setBorder(new EmptyBorder(32, 16, 32, 16));

        flightSearchPanel = new FlightSearchResultPanel();
        seatSelectionPanel = new SeatSelectionPanel(this);
        passengerInfoPanel = new PassengerInfoPanel(this);
        paymentPanel = new PaymentPanel(this);

        // Quy trình hàng không chuẩn mới: Tìm chuyến (STEP_1) -> Chọn ghế (STEP_2) ->
        // Thông tin khách (STEP_3) -> Thanh toán (STEP_4)
        mainContentPanel.add(flightSearchPanel, "STEP_1"); // Index 0
        mainContentPanel.add(seatSelectionPanel, "STEP_2"); // Index 1
        mainContentPanel.add(passengerInfoPanel, "STEP_3"); // Index 2
        mainContentPanel.add(paymentPanel, "STEP_4"); // Index 3

        scrollPane = new JScrollPane(mainContentPanel);
        scrollPane.setBorder(null);
        scrollPane.setOpaque(false);
        scrollPane.getViewport().setOpaque(false);
        scrollPane.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);
        scrollPane.getVerticalScrollBar().setUnitIncrement(20);

        add(scrollPane, BorderLayout.CENTER);
        sidebar.setActiveStep(0);
    }

    public BookingProgressSidebar getSidebar() {
        return sidebar;
    }

    public void showStep(int index) {
        if (index >= 0 && index <= 3) {
            cardLayout.show(mainContentPanel, "STEP_" + (index + 1));
            sidebar.setActiveStep(index);

            mainContentPanel.revalidate();
            mainContentPanel.repaint();
            SwingUtilities.invokeLater(() -> scrollPane.getVerticalScrollBar().setValue(0));
        }
    }

    // --- LOGIC HÀNH TRÌNH VÀ CHỌN CHUYẾN ---
    public void selectFlightForLeg(dto.FlightSearchResultDTO flight, String selectedClass) {
        // Đảm bảo list có đủ kích thước trước khi set phần tử theo chỉ mục
        while (selectedFlights.size() <= activeLegIndex) {
            selectedFlights.add(null);
        }
        while (selectedClasses.size() <= activeLegIndex) {
            selectedClasses.add(null);
        }

        selectedFlights.set(activeLegIndex, flight);
        selectedClasses.set(activeLegIndex, selectedClass);

        // Xóa tất cả các lựa chọn chặng sau chặng này để tránh dư thừa dữ liệu cũ khi
        // quay lại chọn lại
        while (selectedFlights.size() > activeLegIndex + 1) {
            selectedFlights.remove(selectedFlights.size() - 1);
        }
        while (selectedClasses.size() > activeLegIndex + 1) {
            selectedClasses.remove(selectedClasses.size() - 1);
        }

        // Chuyển ngay sang sơ đồ chọn ghế của chặng này (Dạng vòng lặp)
        seatSelectionPanel.setFlightData(flight, selectedClass, activeLegIndex,
                searchLegs.isEmpty() ? 1 : searchLegs.size());

        int maxS = 9;
        if (activeLegIndex > 0 && multiCitySeats != null && !multiCitySeats.isEmpty()
                && multiCitySeats.get(0) != null) {
            maxS = multiCitySeats.get(0).size();
        }
        seatSelectionPanel.setMaxSeats(maxS);
        showStep(1); // Sang bước Chọn ghế (STEP_2)
    }

    public void goToLeg(int index) {
        if (searchLegs == null || searchLegs.isEmpty())
            return;
        if (index < 0 || index >= searchLegs.size())
            return;

        this.activeLegIndex = index;

        // Xóa sạch các lựa chọn chuyến bay và ghế từ chặng này trở đi
        while (selectedFlights.size() > index) {
            selectedFlights.remove(selectedFlights.size() - 1);
        }
        while (selectedClasses.size() > index) {
            selectedClasses.remove(selectedClasses.size() - 1);
        }
        while (multiCitySeats.size() > index) {
            multiCitySeats.remove(multiCitySeats.size() - 1);
        }

        stopTimer();
        if (currentBookingID != null) {
            bookingDAO.cancelBooking(currentBookingID);
            currentBookingID = null;
        }

        mainContentPanel.remove(flightSearchPanel);
        flightSearchPanel = new FlightSearchResultPanel(searchLegs, activeLegIndex, this);
        mainContentPanel.add(flightSearchPanel, "STEP_1", 0);
        showStep(0);
    }

    public void updateFlightResults(List<SearchLeg> legs) {
        this.searchLegs = legs;
        this.activeLegIndex = 0;
        this.selectedFlights.clear();
        this.selectedClasses.clear();
        this.multiCitySeats.clear();

        mainContentPanel.remove(flightSearchPanel);
        flightSearchPanel = new FlightSearchResultPanel(legs, 0, this);
        mainContentPanel.add(flightSearchPanel, "STEP_1", 0);
        showStep(0);
    }

    public void updateFlightResults(String dep, String arr, String date, List<dto.FlightSearchResultDTO> flights) {
        this.searchLegs = new ArrayList<>();
        this.activeLegIndex = 0;
        this.selectedFlights.clear();
        this.selectedClasses.clear();
        this.multiCitySeats.clear();
        sidebar.setMultiCityCard(null);

        mainContentPanel.remove(flightSearchPanel);
        flightSearchPanel = new FlightSearchResultPanel(dep, arr, date, flights, this);
        mainContentPanel.add(flightSearchPanel, "STEP_1", 0);
        showStep(0);
    }

    public void showSeatSelection(dto.FlightSearchResultDTO flight, String selectedClass) {
        this.selectedFlights.clear();
        this.selectedClasses.clear();
        this.multiCitySeats.clear();

        this.selectedFlights.add(flight);
        this.selectedClasses.add(selectedClass);

        this.selectedFlight = flight;
        this.selectedClass = selectedClass;
        this.activeLegIndex = 0;

        seatSelectionPanel.setFlightData(flight, selectedClass, 0, 1);
        seatSelectionPanel.setMaxSeats(9);
        showStep(1); // Sang bước Chọn ghế (STEP_2)
    }

    // --- LOGIC NHẬP THÔNG TIN HÀNH KHÁCH (BƯỚC 3) ---
    public void showPassengerInfoStep() {
        int count = 1;
        if (selectedSeats != null && !selectedSeats.isEmpty()) {
            // Luồng cũ hoặc 1-chặng: selectedSeats set trực tiếp
            count = selectedSeats.size();
        } else if (multiCitySeats != null && !multiCitySeats.isEmpty() && multiCitySeats.get(0) != null) {
            // Luồng nhiều chặng: lấy số ghế chặng đầu làm chuẩn
            count = multiCitySeats.get(0).size();
        }
        passengerInfoPanel.initPassengerCount(count);
        showStep(2);
    }

    public void confirmPassengersAndGoToPayment(List<dto.PassengerDTO> passengers) {
        this.currentPassengers = passengers;
        showPayment();
    }

    public void goBackToSeats() {
        if (selectedFlights.size() > 0) {
            this.activeLegIndex = selectedFlights.size() - 1;
            dto.FlightSearchResultDTO lastFlight = selectedFlights.get(activeLegIndex);
            String lastClass = selectedClasses.get(activeLegIndex);
            seatSelectionPanel.setFlightData(lastFlight, lastClass, activeLegIndex, selectedFlights.size());

            int maxS = 9;
            if (activeLegIndex > 0 && multiCitySeats != null && !multiCitySeats.isEmpty()
                    && multiCitySeats.get(0) != null) {
                maxS = multiCitySeats.get(0).size();
            }
            seatSelectionPanel.setMaxSeats(maxS);

            showStep(1); // Sang màn hình chọn ghế (STEP_2)
        } else {
            showStep(0);
        }
    }

    // --- LOGIC CHỌN CHỖ NGỒI (BƯỚC 2 - VÒNG LẶP) ---
    public void confirmSeatsForCurrentLeg(List<String> seats) {
        if (seats == null || seats.isEmpty()) {
            JOptionPane.showMessageDialog(this, "Vui lòng chọn ít nhất 1 ghế!", "Thông báo",
                    JOptionPane.WARNING_MESSAGE);
            return;
        }

        // Kiểm tra số lượng ghế của chặng sau phải trùng khớp với chặng đầu
        if (activeLegIndex > 0 && !multiCitySeats.isEmpty()) {
            int expectedCount = multiCitySeats.get(0).size();
            if (seats.size() != expectedCount) {
                JOptionPane.showMessageDialog(this,
                        "Số lượng ghế chọn phải bằng đúng số lượng ghế đã chọn ở chặng 1 (" + expectedCount + " ghế)!\n"
                                +
                                "Hiện tại bạn đã chọn " + seats.size() + " ghế.",
                        "Thông báo", JOptionPane.WARNING_MESSAGE);
                return;
            }
        }

        // Lưu ghế đã chọn cho chặng hiện tại vào bộ nhớ tạm RAM (Session)
        while (multiCitySeats.size() <= activeLegIndex) {
            multiCitySeats.add(null);
        }
        multiCitySeats.set(activeLegIndex, seats);
        this.selectedSeats = multiCitySeats.get(0); // Dùng làm số lượng chuẩn hiển thị

        // Xóa các ghế của chặng sau nếu có quay lại chọn lại
        while (multiCitySeats.size() > activeLegIndex + 1) {
            multiCitySeats.remove(multiCitySeats.size() - 1);
        }

        if (activeLegIndex < searchLegs.size() - 1) {
            // Chuyển sang chọn CHUYẾN BAY cho chặng kế tiếp
            activeLegIndex++;

            mainContentPanel.remove(flightSearchPanel);
            flightSearchPanel = new FlightSearchResultPanel(searchLegs, activeLegIndex, this);
            mainContentPanel.add(flightSearchPanel, "STEP_1", 0);
            showStep(0); // Trở về FlightSearchResultPanel (STEP_1) để chọn chuyến bay chặng sau
        } else {
            // Đã chọn xong chuyến bay & ghế của toàn bộ chặng! Tiến sang nhập thông tin
            // khách hàng (Bước 3)
            showPassengerInfoStep();
        }
    }

    public void goBackSeatSelection() {
        // Quay lại màn hình chọn chuyến bay của chính chặng này để đổi chuyến bay khác
        showStep(0);
    }

    // --- LOGIC THANH TOÁN (BƯỚC 4 - GỘP BILL) ---
    public void showPayment() {
        if (currentPassengers == null || currentPassengers.isEmpty())
            return;

        double basePrice = getBasePrice();
        // Thuế phí = 10% giá vé
        double total = (basePrice * selectedSeats.size()) * 1.10;

        // Giữ ghế và gộp hóa đơn trong DB khi bắt đầu sang bước Thanh toán
        if (this.currentBookingID == null) {
            List<String> flightIDs = new ArrayList<>();
            for (dto.FlightSearchResultDTO f : selectedFlights) {
                flightIDs.add(f.getFlightID());
            }

            String customerID = (account != null) ? account.getCustomerID() : null;

            this.currentBookingID = bookingDAO.createPendingBookingMulti(
                    customerID,
                    flightIDs,
                    multiCitySeats,
                    selectedClasses,
                    currentPassengers,
                    total);

            if (this.currentBookingID == null) {
                // Nếu lỗi giữ ghế, quay lại màn hình nhập thông tin khách hàng
                showPassengerInfoStep();
                return;
            }
            startCountdown(); // Khởi tạo duy nhất 1 Timer đếm ngược 20 phút chung
        }

        // Lấy lại tổng tiền thực tế trong database sau khi transaction kết thúc (vì giá có thể đã thay đổi)
        double actualTotal = bookingDAO.getBookingTotalAmount(this.currentBookingID);
        if (actualTotal > 0) {
            total = actualTotal;
        }

        this.selectedFlight = selectedFlights.get(0);
        this.selectedClass = selectedClasses.get(0);
        paymentPanel.updateDataMulti(selectedFlights, selectedClasses, multiCitySeats, total);
        showStep(3); // Hiện màn hình thanh toán (STEP_4)
    }

    private double getBasePrice() {
        if (selectedFlights != null && !selectedFlights.isEmpty()) {
            double sum = 0;
            for (int i = 0; i < selectedFlights.size(); i++) {
                dto.FlightSearchResultDTO f = selectedFlights.get(i);
                String cls = selectedClasses.get(i);
                for (dto.FlightSearchResultDTO.SeatClassInfo sc : f.getSeatClasses()) {
                    if (sc.getClassName().equalsIgnoreCase(cls)) {
                        sum += sc.getPrice();
                        break;
                    }
                }
            }
            return sum > 0 ? sum : 1200000;
        }

        if (selectedFlight != null && selectedClass != null) {
            for (dto.FlightSearchResultDTO.SeatClassInfo sc : selectedFlight.getSeatClasses()) {
                if (sc.getClassName().equalsIgnoreCase(selectedClass)) {
                    return sc.getPrice();
                }
            }
        }
        return 1200000;
    }

    private void startCountdown() {
        stopTimer();
        remainingSeconds = 1200; // 20 phút

        checkoutTimer = new Timer(1000, e -> {
            remainingSeconds--;
            if (remainingSeconds <= 0) {
                handleTimeout();
            } else {
                updateTimerDisplay();
            }
        });
        checkoutTimer.start();
    }

    private void updateTimerDisplay() {
        int m = remainingSeconds / 60;
        int s = remainingSeconds % 60;
        String time = String.format("%02d:%02d", m, s);
        paymentPanel.updateTimer(time);
    }

    private void handleTimeout() {
        stopTimer();

        if (currentBookingID != null) {
            bookingDAO.cancelBooking(currentBookingID);
            currentBookingID = null;
        }

        JOptionPane.showMessageDialog(this, "Đã hết thời gian giữ chỗ (20 phút). Vui lòng thực hiện lại.", "Hết giờ",
                JOptionPane.WARNING_MESSAGE);

        goBackToSeatSelection();
    }

    public void goBackToSeatSelection() {
        stopTimer();

        if (currentBookingID != null) {
            bookingDAO.cancelBooking(currentBookingID);
            currentBookingID = null;
        }

        if (selectedFlights.size() > 0) {
            this.activeLegIndex = selectedFlights.size() - 1;
            dto.FlightSearchResultDTO flight = selectedFlights.get(activeLegIndex);
            String cls = selectedClasses.get(activeLegIndex);
            seatSelectionPanel.setFlightData(flight, cls, activeLegIndex, selectedFlights.size());
        } else {
            seatSelectionPanel.refreshSeatMap();
        }

        showStep(1); // Quay về bước chọn ghế (STEP_2)
    }

    public void goBackFromPayment() {
        goBackToSeatSelection();
    }

    public void payLater() {
        if (currentBookingID == null)
            return;

        stopTimer(); // Dừng timer nhưng KHÔNG hủy booking

        JOptionPane.showMessageDialog(this,
                "V\u00e9 c\u1ee7a b\u1ea1n \u0111\u00e3 \u0111\u01b0\u1ee3c gi\u1eef ch\u1ed7 th\u00e0nh c\u00f4ng!\nM\u00e3 \u0111\u1eb7t ch\u1ed7: "
                        + currentBookingID +
                        "\n\nVui l\u00f2ng thanh to\u00e1n t\u1ea1i m\u1ee5c 'L\u1ecbch s\u1eed v\u00e9' tr\u01b0\u1edbc khi h\u1ebft th\u1eddi gian gi\u1eef ch\u1ed7.",
                "Gi\u1eef ch\u1ed7 th\u00e0nh c\u00f4ng", JOptionPane.INFORMATION_MESSAGE);

        currentBookingID = null;

        Window window = SwingUtilities.getWindowAncestor(this);
        if (window instanceof CustomerMainFrame) {
            ((CustomerMainFrame) window).navigateToHistory(); // Navigate đúng cách, highlight nav
        } else {
            showStep(0);
        }
    }

    public boolean confirmPayment(String method, double amount) {
        if (currentBookingID == null)
            return false;

        stopTimer();

        boolean success = bookingDAO.finalizeBooking(currentBookingID, method, amount);
        if (success) {
            JOptionPane.showMessageDialog(this,
                    "Chúc mừng! Bạn đã đặt vé thành công.\nMã đặt chỗ của bạn là: " + currentBookingID,
                    "Thành công", JOptionPane.INFORMATION_MESSAGE);

            currentBookingID = null;

            Window window = SwingUtilities.getWindowAncestor(this);
            if (window instanceof CustomerMainFrame) {
                ((CustomerMainFrame) window).navigateTo("Đặt vé");
            } else {
                showStep(0);
            }
        }
        return success;
    }

    public void stopTimer() {
        if (checkoutTimer != null) {
            checkoutTimer.stop();
        }
    }

    public static class SearchLeg {
        public String depCode;
        public String arrCode;
        public String dateStr;
        public List<dto.FlightSearchResultDTO> results;

        public SearchLeg(String dep, String arr, String date, List<dto.FlightSearchResultDTO> flights) {
            this.depCode = dep;
            this.arrCode = arr;
            this.dateStr = date;
            this.results = flights;
        }
    }

    class BookingProgressSidebar extends JPanel {
        private List<StepItem> steps = new ArrayList<>();
        private static final Color ACTIVE_BG = new Color(240, 249, 255);
        private JPanel multiCityCardContainer;

        public BookingProgressSidebar() {
            setLayout(new MigLayout("wrap, insets 24 24 24 0, aligny top, gapy 20", "[240!, fill]", "[]20[]"));
            setOpaque(false);
            JPanel card = new JPanel(new MigLayout("wrap, insets 20 0 16 0, gapy 0", "[grow, fill]"));
            card.setBackground(Color.WHITE);
            card.putClientProperty(FlatClientProperties.STYLE, "arc:12; borderColor:#e2e8f0; borderWidth:1");

            addStep(card, "Tìm chuyến bay", 0);
            addStep(card, "Chọn chỗ ngồi", 1);
            addStep(card, "Thông tin khách", 2);
            addStep(card, "Thanh toán", 3);
            add(card);

            multiCityCardContainer = new JPanel(new BorderLayout());
            multiCityCardContainer.setOpaque(false);
            add(multiCityCardContainer, "growx");
        }

        public void setMultiCityCard(JPanel legCard) {
            multiCityCardContainer.removeAll();
            if (legCard != null) {
                multiCityCardContainer.add(legCard, BorderLayout.CENTER);
            }
            multiCityCardContainer.revalidate();
            multiCityCardContainer.repaint();
        }

        private void addStep(JPanel parent, String title, int index) {
            StepItem item = new StepItem(title, index);
            steps.add(item);
            parent.add(item);
        }

        public void setActiveStep(int index) {
            for (int i = 0; i < steps.size(); i++)
                steps.get(i).setActive(i == index);
        }

        class StepItem extends JPanel {
            private JLabel lblIcon, lblText;
            private String[] icons = { "🔍", "🛫", "👤", "💳" }; // Thứ tự icon: Tìm kiếm -> Chọn ghế -> Thông tin khách
                                                                 // -> Thanh toán

            public StepItem(String title, int index) {
                setLayout(new MigLayout("insets 12 16, gapx 12", "[][grow]"));
                setOpaque(false);
                setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
                lblIcon = new JLabel(icons[index]);
                lblText = new JLabel(title);
                add(lblIcon);
                add(lblText);
                addMouseListener(new MouseAdapter() {
                    @Override
                    public void mouseClicked(MouseEvent e) {
                        if (index == 0) {
                            stopTimer();
                            // Hủy booking nếu đang ở bước thanh toán (ghế đang bị giữ)
                            if (currentBookingID != null) {
                                bookingDAO.cancelBooking(currentBookingID);
                                currentBookingID = null;
                            }
                            showStep(0);
                        } else if (index == 1) {
                            if (!selectedFlights.isEmpty()) {
                                showStep(1);
                            }
                        } else if (index == 2) {
                            if (!multiCitySeats.isEmpty()) {
                                showStep(2);
                            }
                        } else if (index == 3 && currentBookingID != null) {
                            showStep(3);
                        }
                    }
                });
            }

            public void setActive(boolean active) {
                if (active) {
                    setBackground(ACTIVE_BG);
                    setOpaque(true);
                    lblText.setFont(new Font("Segoe UI", Font.BOLD, 14));
                } else {
                    setOpaque(false);
                    lblText.setFont(new Font("Segoe UI", Font.PLAIN, 14));
                }
                repaint();
            }
        }
    }
}