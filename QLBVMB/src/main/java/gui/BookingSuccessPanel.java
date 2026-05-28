package gui;

import com.formdev.flatlaf.FlatClientProperties;
import net.miginfocom.swing.MigLayout;
import javax.swing.*;
import java.awt.*;
import java.util.List;

public class BookingSuccessPanel extends JPanel {

    private final BookingProcessPanel navigationListener;
    private JLabel lblBookingID, lblRoute, lblTime, lblSeats;

    public BookingSuccessPanel(BookingProcessPanel listener) {
        this.navigationListener = listener;
        setLayout(new BorderLayout());
        setBackground(new Color(248, 249, 255));
        initComponents();
    }

    private void initComponents() {
        JPanel content = new JPanel(new MigLayout("wrap, insets 40, align center", "[center]"));
        content.setOpaque(false);

        // Success Icon
        JLabel lblIcon = new JLabel("✅");
        lblIcon.setFont(new Font("Segoe UI Emoji", Font.PLAIN, 72));
        content.add(lblIcon, "gapy 0 10");

        // Title
        JLabel lblTitle = new JLabel("Đặt vé thành công!");
        lblTitle.setFont(new Font("Segoe UI", Font.BOLD, 28));
        lblTitle.setForeground(new Color(22, 163, 74)); // Success Green
        content.add(lblTitle);

        JLabel lblSub = new JLabel("Cảm ơn bạn đã tin dùng TIU AIRLINES. Mã đặt chỗ của bạn là:");
        lblSub.setFont(new Font("Segoe UI", Font.PLAIN, 15));
        lblSub.setForeground(new Color(71, 85, 105));
        content.add(lblSub, "gapy 0 10");

        // Booking ID Card
        lblBookingID = new JLabel("-");
        lblBookingID.setFont(new Font("Segoe UI", Font.BOLD, 36));
        lblBookingID.setForeground(new Color(11, 28, 48));
        JPanel idCard = new JPanel(new MigLayout("insets 16 32"));
        idCard.setBackground(Color.WHITE);
        idCard.putClientProperty(FlatClientProperties.STYLE, "arc:12; borderColor:#e2e8f0; borderWidth:1");
        idCard.add(lblBookingID);
        content.add(idCard, "gapy 0 30");

        // Ticket Summary Card
        JPanel infoCard = new JPanel(new MigLayout("wrap, insets 24, fillx", "[grow, fill]"));
        infoCard.setBackground(Color.WHITE);
        infoCard.setPreferredSize(new Dimension(500, 200));
        infoCard.putClientProperty(FlatClientProperties.STYLE, "arc:16; borderColor:#e2e8f0; borderWidth:1");

        JLabel lblInfoTitle = new JLabel("Thông tin chuyến bay");
        lblInfoTitle.setFont(new Font("Segoe UI", Font.BOLD, 16));
        infoCard.add(lblInfoTitle, "gapy 0 10");

        lblRoute = new JLabel("-");
        lblRoute.setFont(new Font("Segoe UI", Font.BOLD, 14));
        infoCard.add(lblRoute);

        lblTime = new JLabel("-");
        lblTime.setForeground(new Color(100, 116, 139));
        infoCard.add(lblTime, "gapy 0 8");

        lblSeats = new JLabel("-");
        lblSeats.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        infoCard.add(lblSeats);

        content.add(infoCard, "gapy 0 30");

        // Action Buttons
        JPanel actions = new JPanel(new MigLayout("insets 0, gapx 16"));
        actions.setOpaque(false);

        JButton btnPrint = new JButton("📥 Tải vé điện tử (PDF)");
        btnPrint.setFont(new Font("Segoe UI", Font.BOLD, 14));
        btnPrint.setPreferredSize(new Dimension(200, 45));
        btnPrint.putClientProperty(FlatClientProperties.STYLE,
                "arc:8; background:white; color:#00668a; borderColor:#00668a; borderWidth:1");

        JButton btnHome = new JButton("Về trang chủ");
        btnHome.setFont(new Font("Segoe UI", Font.BOLD, 14));
        btnHome.setPreferredSize(new Dimension(150, 45));
        btnHome.setBackground(new Color(0, 102, 138));
        btnHome.setForeground(Color.WHITE);
        btnHome.putClientProperty(FlatClientProperties.STYLE, "arc:8");
        btnHome.addActionListener(e -> navigationListener.showStep(0));

        actions.add(btnPrint);
        actions.add(btnHome);
        content.add(actions);

        add(content, BorderLayout.CENTER);
    }

    public void updateData(String bookingID, dto.FlightSearchResultDTO flight, List<String> seats) {
        if (bookingID != null)
            lblBookingID.setText(bookingID);
        if (flight != null) {
            lblRoute.setText(flight.getDepartureCode() + "  🛫  " + flight.getArrivalCode());
            lblTime.setText(flight.getDepartureTime().toString());
        }
        if (seats != null) {
            lblSeats.setText("Số ghế: " + String.join(", ", seats));
        }
    }
}
