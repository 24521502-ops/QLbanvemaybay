package gui.QuanLyDatChoGUI;

import java.awt.*;
import java.util.List;
import javax.swing.*;
import javax.swing.border.EmptyBorder;

import bus.QuanLyDatChoBUS.BookingBUS;

public class SuaDatChoDialog extends JDialog {

    private String bookingID;
    private BookingBUS bookingBUS;
    private JComboBox<String> cbxChuyenBayMoi, cbxGheMoi;
    private JLabel lblTicketInfo; // Đổi tên biến để dùng cho Card thông tin

    public SuaDatChoDialog(Frame parent, String bookingID) {
        super(parent, true);
        this.bookingID = bookingID;
        this.bookingBUS = new BookingBUS();

        initComponents();
        setLocationRelativeTo(parent);
        loadDataCuaBooking();
    }

    private void initComponents() {
        setTitle("Quản lý Đặt chỗ");
        setSize(550, 420); // Tăng height lên một chút để chứa Card thông tin
        setLayout(new BorderLayout());
        getContentPane().setBackground(Color.WHITE);

        // --- HEADER TĨNH ---
        JPanel header = new JPanel(new BorderLayout());
        header.setBackground(new Color(248, 250, 252));
        header.setBorder(BorderFactory.createCompoundBorder(
                BorderFactory.createMatteBorder(0, 0, 1, 0, new Color(226, 232, 240)),
                new EmptyBorder(15, 25, 15, 25)));

        JLabel lblTitle = new JLabel("Thay đổi Chuyến bay & Ghế ngồi");
        lblTitle.setFont(new Font("Inter", Font.BOLD, 18));
        lblTitle.setForeground(new Color(15, 23, 42));

        header.add(lblTitle, BorderLayout.WEST);
        add(header, BorderLayout.NORTH);

        // --- BODY ---
        JPanel body = new JPanel(new GridBagLayout());
        body.setBackground(Color.WHITE);
        body.setBorder(new EmptyBorder(20, 30, 20, 30));
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.insets = new Insets(0, 0, 20, 0);
        gbc.weightx = 1.0;

        // --- Dòng 1: CARD THÔNG TIN HIỆN TẠI (Chuẩn UI Hàng không) ---
        gbc.gridy = 0;
        JPanel infoCard = new JPanel(new GridLayout(1, 2, 10, 0));
        infoCard.setBackground(new Color(241, 245, 249)); // Màu xám nhạt (Slate 50)
        infoCard.setBorder(BorderFactory.createCompoundBorder(
                BorderFactory.createLineBorder(new Color(226, 232, 240)),
                new EmptyBorder(15, 20, 15, 20)));

        JLabel lblBookingInfo = new JLabel(
                "<html><font color='#64748b' face='Inter' size='3'>MÃ ĐẶT CHỖ</font><br><font color='#0f172a' face='Inter' size='5'><b>"
                        + bookingID + "</b></font></html>");
        lblTicketInfo = new JLabel(
                "<html><font color='#64748b' face='Inter' size='3'>MÃ VÉ THAO TÁC</font><br><font color='#e11d48' face='Inter' size='5'><b>Đang tải...</b></font></html>");

        infoCard.add(lblBookingInfo);
        infoCard.add(lblTicketInfo);
        body.add(infoCard, gbc);

        // --- Dòng 2: COMBOBOX CHỌN CHUYẾN MỚI ---
        gbc.gridy = 1;
        cbxChuyenBayMoi = new JComboBox<>();
        cbxChuyenBayMoi.addActionListener(e -> {
            if (cbxChuyenBayMoi.getSelectedItem() != null) {
                String flightID = cbxChuyenBayMoi.getSelectedItem().toString().split(" - ")[0];
                loadGheTrong(flightID);
            }
        });
        body.add(createInputGroup("CHỌN CHUYẾN BAY MỚI (REBOOKING)", cbxChuyenBayMoi), gbc);

        // --- Dòng 3: COMBOBOX CHỌN GHẾ MỚI ---
        gbc.gridy = 2;
        cbxGheMoi = new JComboBox<>();
        body.add(createInputGroup("CHỌN GHẾ MỚI", cbxGheMoi), gbc);

        add(body, BorderLayout.CENTER);

        // --- FOOTER ---
        JPanel footer = new JPanel(new FlowLayout(FlowLayout.RIGHT, 15, 15));
        footer.setBackground(Color.WHITE);
        footer.setBorder(BorderFactory.createMatteBorder(1, 0, 0, 0, new Color(226, 232, 240)));

        JButton btnCancel = createButton("Hủy", false);
        btnCancel.addActionListener(e -> dispose());

        JButton btnSave = createButton("Xác nhận Đổi vé", true);
        btnSave.addActionListener(e -> xuLyDoiVe());

        footer.add(btnCancel);
        footer.add(btnSave);
        add(footer, BorderLayout.SOUTH);
    }

    private void loadDataCuaBooking() {
        // Lấy TicketID từ DB và cập nhật vào Card Thông tin
        String ticketID = bookingBUS.layTicketIDTuBooking(bookingID);
        if (ticketID != null && !ticketID.isEmpty()) {
            lblTicketInfo.setText(
                    "<html><font color='#64748b' face='Inter' size='3'>MÃ VÉ THAO TÁC</font><br><font color='#e11d48' face='Inter' size='5'><b>"
                            + ticketID + "</b></font></html>");
            lblTicketInfo.putClientProperty("TicketID", ticketID); // Lưu ngầm ID để xử lý
        } else {
            lblTicketInfo.setText(
                    "<html><font color='#64748b' face='Inter' size='3'>MÃ VÉ THAO TÁC</font><br><font color='#e11d48' face='Inter' size='5'><b>Lỗi / Trống</b></font></html>");
        }

        // Đổ danh sách chuyến bay
        cbxChuyenBayMoi.removeAllItems();
        for (String f : bookingBUS.layDanhSachChuyenBay()) {
            cbxChuyenBayMoi.addItem(f);
        }
    }

    private void loadGheTrong(String flightID) {
        cbxGheMoi.removeAllItems();
        List<String> danhSachGhe = bookingBUS.layDanhSachGheTrong(flightID);
        if (danhSachGhe.isEmpty()) {
            cbxGheMoi.addItem("Hết ghế trống!");
        } else {
            for (String g : danhSachGhe)
                cbxGheMoi.addItem(g);
        }
    }

    private void xuLyDoiVe() {
        String ticketID = (String) lblTicketInfo.getClientProperty("TicketID");
        if (ticketID == null) {
            JOptionPane.showMessageDialog(this, "Lỗi: Không tìm thấy Mã Vé hợp lệ để đổi!", "Lỗi",
                    JOptionPane.ERROR_MESSAGE);
            return;
        }

        if (cbxChuyenBayMoi.getSelectedItem() == null || cbxGheMoi.getSelectedItem() == null
                || cbxGheMoi.getSelectedItem().toString().equals("Hết ghế trống!")) {
            JOptionPane.showMessageDialog(this, "Vui lòng chọn Chuyến bay mới và Ghế trống hợp lệ!", "Cảnh báo",
                    JOptionPane.WARNING_MESSAGE);
            return;
        }

        String newFlightID = cbxChuyenBayMoi.getSelectedItem().toString().split(" - ")[0];
        String newSeatID = cbxGheMoi.getSelectedItem().toString().split(" - ")[0];

        // Gọi Procedure
        boolean success = bookingBUS.doiChuyenBayVaGhe(ticketID, newFlightID, newSeatID);
        if (success) {
            JOptionPane.showMessageDialog(this, "Đổi vé thành công! Tổng tiền đã được hệ thống tự động cập nhật.",
                    "Hoàn tất", JOptionPane.INFORMATION_MESSAGE);
            dispose();
        } else {
            JOptionPane.showMessageDialog(this, "Đổi vé thất bại! Ghế có thể đã có người đặt, vui lòng thử lại.",
                    "Lỗi Database", JOptionPane.ERROR_MESSAGE);
        }
    }

    // --- HELPER COMPONENTS ---
    private JPanel createInputGroup(String label, JComponent input) {
        JPanel p = new JPanel(new BorderLayout(0, 8));
        p.setOpaque(false);
        JLabel lbl = new JLabel(label);
        lbl.setFont(new Font("Inter", Font.BOLD, 12));
        lbl.setForeground(new Color(71, 85, 105));
        p.add(lbl, BorderLayout.NORTH);
        input.setPreferredSize(new Dimension(0, 45));
        if (input instanceof JComboBox) {
            input.setBackground(Color.WHITE);
            input.setFont(new Font("Inter", Font.PLAIN, 14));
        }
        p.add(input, BorderLayout.CENTER);
        return p;
    }

    private JButton createButton(String text, boolean isPrimary) {
        JButton btn = new JButton(text) {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                if (isPrimary) {
                    g2.setColor(new Color(15, 23, 42));
                } else {
                    g2.setColor(new Color(241, 245, 249));
                }
                g2.fillRoundRect(0, 0, getWidth(), getHeight(), 6, 6);
                if (!isPrimary) {
                    g2.setColor(new Color(203, 213, 225));
                    g2.drawRoundRect(0, 0, getWidth() - 1, getHeight() - 1, 6, 6);
                }
                g2.dispose();
                super.paintComponent(g);
            }
        };
        btn.setFont(new Font("Inter", Font.BOLD, 14));
        btn.setForeground(isPrimary ? Color.WHITE : new Color(71, 85, 105));
        btn.setContentAreaFilled(false);
        btn.setBorderPainted(false);
        btn.setCursor(new Cursor(Cursor.HAND_CURSOR));
        btn.setPreferredSize(new Dimension(160, 42));
        return btn;
    }
}