package gui.QuanLyDatChoGUI;

import java.awt.*;

import java.text.DecimalFormat;
import java.util.List;
import javax.swing.*;
import javax.swing.border.EmptyBorder;

import bus.QuanLyDatChoBUS.BookingBUS;

public class ThemDatChoDialog extends JDialog {

    private JComboBox<String> cbxChuyenBay, cbxGhe;
    private JTextField txtSdtNguoiDat, txtTenNguoiDat, txtTenHanhKhach, txtCCCD;
    private String currentCustomerID = "";
    private JLabel lblTotal; // Label hiển thị tổng tiền
    private BookingBUS bookingBUS;

    public ThemDatChoDialog(Frame parent) {
        super(parent, true);
        bookingBUS = new BookingBUS();
        initComponents();
        setLocationRelativeTo(parent);

        // Load dữ liệu từ Database lên ComboBox
        loadDataToComboBoxes();
    }

    private void initComponents() {
        setTitle("Thêm đặt chỗ mới");
        setSize(800, 550);
        setLayout(new BorderLayout());
        getContentPane().setBackground(Color.WHITE);

        // --- HEADER ---
        JPanel header = new JPanel(new BorderLayout());
        header.setBackground(new Color(248, 250, 252));
        header.setBorder(BorderFactory.createCompoundBorder(
                BorderFactory.createMatteBorder(0, 0, 1, 0, new Color(226, 232, 240)),
                new EmptyBorder(15, 25, 15, 25)));

        JLabel lblTitle = new JLabel("Thêm đặt chỗ mới");
        lblTitle.setFont(new Font("Inter", Font.BOLD, 18));
        JLabel lblAutoID = new JLabel("Mã Đơn: (Hệ thống tự động tạo)");
        lblAutoID.setFont(new Font("Inter", Font.ITALIC, 13));
        lblAutoID.setForeground(Color.GRAY);

        header.add(lblTitle, BorderLayout.WEST);
        header.add(lblAutoID, BorderLayout.EAST);
        add(header, BorderLayout.NORTH);

        // --- BODY ---
        JPanel body = new JPanel(new GridBagLayout());
        body.setBackground(Color.WHITE);
        body.setBorder(new EmptyBorder(20, 30, 20, 30));
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.insets = new Insets(0, 10, 25, 10);
        gbc.weightx = 0.5;

        // Dòng 1: Khách hàng (SĐT & Tên)
        gbc.gridy = 0;
        gbc.gridx = 0;
        gbc.gridwidth = 1;
        
        txtSdtNguoiDat = createStyledTextField("Nhập SĐT người đặt...", true);
        txtSdtNguoiDat.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                String sdt = txtSdtNguoiDat.getText().trim();
                if (sdt.length() >= 9) {
                    String[] cus = bookingBUS.timKhachHangBangSdt(sdt);
                    if (cus != null) {
                        currentCustomerID = cus[0];
                        txtTenNguoiDat.setText(cus[1]);
                        txtTenNguoiDat.setEditable(false);
                        txtTenNguoiDat.setBackground(new Color(241, 245, 249));
                    } else {
                        currentCustomerID = "";
                        txtTenNguoiDat.setEditable(true);
                        txtTenNguoiDat.setBackground(Color.WHITE);
                    }
                } else {
                    currentCustomerID = "";
                    txtTenNguoiDat.setEditable(true);
                    txtTenNguoiDat.setBackground(Color.WHITE);
                }
            }
        });
        body.add(createInputGroup("SĐT NGƯỜI ĐẶT VÉ", txtSdtNguoiDat), gbc);

        gbc.gridx = 1;
        txtTenNguoiDat = createStyledTextField("Nhập họ tên người đặt...", true);
        body.add(createInputGroup("HỌ TÊN NGƯỜI ĐẶT VÉ", txtTenNguoiDat), gbc);

        // Dòng 2: Chuyến bay
        gbc.gridy = 1;
        gbc.gridx = 0;
        gbc.gridwidth = 2;
        cbxChuyenBay = new JComboBox<>();

        // SỰ KIỆN LÕI: Chọn chuyến bay thì load ghế trống tương ứng
        cbxChuyenBay.addActionListener(e -> {
            if (cbxChuyenBay.getSelectedItem() != null) {
                String selectedFlight = cbxChuyenBay.getSelectedItem().toString();
                String flightID = selectedFlight.split(" - ")[0]; // Lấy FL01 từ chuỗi "FL01 - VN101..."
                loadGheTrong(flightID);
            }
        });
        body.add(createInputGroup("CHỌN CHUYẾN BAY ĐANG MỞ BÁN", cbxChuyenBay), gbc);

        // Dòng 3: Tên người bay & CCCD
        gbc.gridy = 2;
        gbc.gridx = 0;
        gbc.gridwidth = 1;
        txtTenHanhKhach = createStyledTextField("Nhập họ tên người bay...", true);
        body.add(createInputGroup("HỌ TÊN NGƯỜI BAY", txtTenHanhKhach), gbc);

        gbc.gridx = 1;
        txtCCCD = createStyledTextField("Nhập Số CCCD / Passport...", true);
        body.add(createInputGroup("CCCD / PASSPORT", txtCCCD), gbc);

        // Dòng 4: Chọn ghế & Tổng tiền
        gbc.gridy = 3;
        gbc.gridx = 0;
        cbxGhe = new JComboBox<>();

        // Cập nhật tổng tiền khi chọn ghế
        cbxGhe.addActionListener(e -> tinhTongTien());
        body.add(createInputGroup("CHỌN GHẾ NGỒI (CHỈ HIỂN THỊ GHẾ TRỐNG)", cbxGhe), gbc);

        gbc.gridx = 1;
        lblTotal = new JLabel("<html>Tổng tiền tạm tính:<br><font color='#e11d48' size='6'><b>0 VNĐ</b></font></html>");
        lblTotal.setHorizontalAlignment(SwingConstants.RIGHT);
        JPanel pnlTotal = new JPanel(new BorderLayout());
        pnlTotal.setOpaque(false);
        pnlTotal.setBorder(new EmptyBorder(10, 0, 0, 0));
        pnlTotal.add(lblTotal, BorderLayout.CENTER);
        body.add(pnlTotal, gbc);

        JScrollPane scrollPane = new JScrollPane(body);
        scrollPane.setBorder(null);
        scrollPane.getVerticalScrollBar().setUnitIncrement(16);
        add(scrollPane, BorderLayout.CENTER);

        // --- FOOTER ---
        JPanel footer = new JPanel(new FlowLayout(FlowLayout.RIGHT, 15, 15));
        footer.setBackground(Color.WHITE);
        footer.setBorder(BorderFactory.createMatteBorder(1, 0, 0, 0, new Color(226, 232, 240)));

        JButton btnCancel = createButton("Hủy", false);
        btnCancel.addActionListener(e -> dispose());

        JButton btnSave = createButton("Xác nhận Tạo đơn", true);
        btnSave.addActionListener(e -> xuLyTaoDatCho()); // Gọi hàm lưu xuống Database

        footer.add(btnCancel);
        footer.add(btnSave);
        add(footer, BorderLayout.SOUTH);
    }

    // Đổ dữ liệu Khách hàng và Chuyến bay lúc vừa bật Form
    private void loadDataToComboBoxes() {
        cbxChuyenBay.removeAllItems();
        for (String f : bookingBUS.layDanhSachChuyenBay()) {
            cbxChuyenBay.addItem(f);
        }
    }

    // Tự động tìm ghế trống dựa trên Chuyến bay được chọn
    private void loadGheTrong(String flightID) {
        cbxGhe.removeAllItems();
        List<String> danhSachGhe = bookingBUS.layDanhSachGheTrong(flightID);
        if (danhSachGhe.isEmpty()) {
            cbxGhe.addItem("Hết ghế trống!");
        } else {
            for (String g : danhSachGhe) {
                cbxGhe.addItem(g);
            }
        }
        tinhTongTien(); // Reset tiền
    }

    // Hàm cắt chuỗi để lấy Giá Tiền hiển thị lên màn hình
    private void tinhTongTien() {
        if (cbxGhe.getSelectedItem() != null && !cbxGhe.getSelectedItem().toString().equals("Hết ghế trống!")) {
            String selectedGhe = cbxGhe.getSelectedItem().toString();
            // Cắt phần tử cuối cùng sau dấu "-" (ví dụ cắt từ "ST01 - 1A - 4000000")
            String[] parts = selectedGhe.split(" - ");
            try {
                int price = Integer.parseInt(parts[parts.length - 1].trim());
                DecimalFormat formatter = new DecimalFormat("###,###,###");
                lblTotal.setText("<html>Tổng tiền tạm tính:<br><font color='#e11d48' size='6'><b>"
                        + formatter.format(price) + " VNĐ</b></font></html>");
            } catch (Exception ex) {
                lblTotal.setText(
                        "<html>Tổng tiền tạm tính:<br><font color='#e11d48' size='6'><b>0 VNĐ</b></font></html>");
            }
        } else {
            lblTotal.setText("<html>Tổng tiền tạm tính:<br><font color='#e11d48' size='6'><b>0 VNĐ</b></font></html>");
        }
    }

    // Logic lưu xuống Database gọi Procedure
    private void xuLyTaoDatCho() {
        String sdtNguoiDat = txtSdtNguoiDat.getText().trim();
        String tenNguoiDat = txtTenNguoiDat.getText().trim();

        if (sdtNguoiDat.isEmpty() || tenNguoiDat.isEmpty() || cbxChuyenBay.getSelectedItem() == null ||
                cbxGhe.getSelectedItem() == null || cbxGhe.getSelectedItem().toString().equals("Hết ghế trống!")) {
            JOptionPane.showMessageDialog(this, "Vui lòng nhập/chọn đầy đủ thông tin Khách hàng, Chuyến bay và Ghế ngồi!", "Lỗi",
                    JOptionPane.ERROR_MESSAGE);
            return;
        }

        // Kiểm tra xem nhân viên đã nhập đủ thông tin Người bay chưa
        String tenNguoiBay = txtTenHanhKhach.getText().trim();
        String cccd = txtCCCD.getText().trim();
        if (tenNguoiBay.isEmpty() || cccd.isEmpty()) {
            JOptionPane.showMessageDialog(this, "Vui lòng nhập Họ tên và CCCD của người trực tiếp bay!", "Cảnh báo",
                    JOptionPane.WARNING_MESSAGE);
            return;
        }

        String cusID = currentCustomerID; // Mã khách hàng (rỗng nếu là khách mới)
        String flightID = cbxChuyenBay.getSelectedItem().toString().split(" - ")[0];
        String seatID = cbxGhe.getSelectedItem().toString().split(" - ")[0];
        String empID = "EMP02";

        boolean success = bookingBUS.taoDatChoMoi(cusID, tenNguoiDat, sdtNguoiDat, empID, flightID, seatID, tenNguoiBay, cccd);
        if (success) {
            // ĐÃ SỬA: Hiển thị thông báo chi tiết hơn để chứng minh logic chuẩn
            JOptionPane.showMessageDialog(this,
                    "Tạo Đơn Đặt Chỗ thành công!\n" +
                            "Hệ thống đã tự động:\n" +
                            "- Xuất vé và lưu Đơn đặt chỗ (Booking) cho khách hàng " + cusID + "\n" +
                            "- Đồng bộ dữ liệu hành khách: " + tenNguoiBay + " (CCCD: " + cccd
                            + ") vào hệ thống check-in.",
                    "Hoàn tất", JOptionPane.INFORMATION_MESSAGE);
            dispose();
        } else {
            JOptionPane.showMessageDialog(this, "Tạo thất bại! Vui lòng kiểm tra lại kết nối.", "Lỗi CSDL",
                    JOptionPane.ERROR_MESSAGE);
        }
    }

    // --- CÁC COMPONENT HỖ TRỢ BÊN DƯỚI GIỮ NGUYÊN (createInputGroup,
    // createStyledTextField, createButton) ---
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

    private JTextField createStyledTextField(String placeholder, boolean editable) {
        JTextField txt = new JTextField();
        txt.setEditable(editable);
        txt.setFont(new Font("Inter", Font.PLAIN, 14));
        txt.putClientProperty("JTextField.placeholderText", placeholder);
        txt.setBorder(BorderFactory.createCompoundBorder(BorderFactory.createLineBorder(new Color(226, 232, 240)),
                new EmptyBorder(0, 15, 0, 15)));
        return txt;
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