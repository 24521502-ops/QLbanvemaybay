package gui.QuanLyVeGUI;

import java.awt.*;
import java.util.List;
import javax.swing.*;
import javax.swing.border.EmptyBorder;

import bus.QuanLyVeBUS.VeBUS;
import util.AppColor;

public class ChinhSuaVeDialog extends JDialog {

    private String ticketID;
    private String currentFlightID; // Lưu FlightID hiện tại
    private JComboBox<String> cbxHangGhe;
    private VeBUS veBUS = new VeBUS();

    public ChinhSuaVeDialog(Frame parent, boolean modal, String ticketID) {
        super(parent, modal);
        this.ticketID = ticketID;
        initComponents();
        setLocationRelativeTo(parent);
    }

    private void initComponents() {
        setTitle("Cập nhật / Đổi ghế");
        setSize(550, 450);
        setDefaultCloseOperation(DISPOSE_ON_CLOSE);
        setLayout(new BorderLayout());
        getContentPane().setBackground(AppColor.BACKGROUND);

        JPanel mainPanel = new JPanel();
        mainPanel.setLayout(new BoxLayout(mainPanel, BoxLayout.Y_AXIS));
        mainPanel.setBackground(AppColor.SURFACE);
        mainPanel.setBorder(new EmptyBorder(30, 40, 30, 40));

        // Lấy thông tin vé hiện tại từ DB
        Object[] info = veBUS.layThongTinVeDeSua(ticketID);
        String fullName = info != null ? info[0].toString() : "Khách vãng lai";
        currentFlightID = info != null ? info[1].toString() : "";

        // Tiêu đề
        JLabel lblTitle = new JLabel("CẬP NHẬT VÉ: " + ticketID);
        lblTitle.setFont(new Font("Inter", Font.BOLD, 22));
        lblTitle.setForeground(AppColor.PRIMARY);
        lblTitle.setAlignmentX(Component.CENTER_ALIGNMENT);
        mainPanel.add(lblTitle);
        mainPanel.add(Box.createVerticalStrut(30));

        // 1. Tên Hành khách (Khóa - Không được sửa)
        mainPanel.add(createLabelGroup("Hành khách (Cố định):", fullName, false));
        mainPanel.add(Box.createVerticalStrut(15));

        // 2. Chỗ ngồi / Hạng ghế (Combo Box ĐỘNG LẤY TỪ DB)
        JLabel lblHangGhe = new JLabel("Chọn chỗ ngồi mới (Chỉ hiện ghế trống):");
        lblHangGhe.setFont(new Font("Inter", Font.BOLD, 13));
        lblHangGhe.setForeground(AppColor.TEXT_SECONDARY);

        cbxHangGhe = new JComboBox<>();
        cbxHangGhe.setFont(new Font("Inter", Font.PLAIN, 14));
        cbxHangGhe.setPreferredSize(new Dimension(400, 38));
        cbxHangGhe.setBackground(Color.WHITE);

        // Đổ dữ liệu ghế trống vào ComboBox
        List<String> emptySeats = veBUS.layDanhSachGheTrong(currentFlightID);
        if (emptySeats.isEmpty()) {
            cbxHangGhe.addItem("Không còn ghế trống trên chuyến bay này");
            cbxHangGhe.setEnabled(false);
        } else {
            for (String seat : emptySeats) {
                cbxHangGhe.addItem(seat);
            }
        }

        JPanel pnlHangGhe = new JPanel(new BorderLayout(0, 5));
        pnlHangGhe.setOpaque(false);
        pnlHangGhe.add(lblHangGhe, BorderLayout.NORTH);
        pnlHangGhe.add(cbxHangGhe, BorderLayout.CENTER);
        mainPanel.add(pnlHangGhe);
        mainPanel.add(Box.createVerticalStrut(15));

        // 3. Giá vé (Khóa - Giao cho Procedure tính toán)
        JPanel pnlGiaVe = createLabelGroup("Giá vé mới tạm tính:", "0 VNĐ", true);
        JLabel lblGiaVe = (JLabel) pnlGiaVe.getComponent(1); // Lấy cái Label chứa Giá
        mainPanel.add(pnlGiaVe);
        mainPanel.add(Box.createVerticalStrut(15));

        // Bắt sự kiện khi chọn ghế thì cập nhật Giá
        cbxHangGhe.addActionListener(e -> {
            if (cbxHangGhe.getSelectedItem() != null) {
                String selected = cbxHangGhe.getSelectedItem().toString();
                if (selected.contains(" - ")) {
                    String[] parts = selected.split(" - ");
                    lblGiaVe.setText(parts[parts.length - 1]);
                } else {
                    lblGiaVe.setText("0 VNĐ");
                }
            }
        });
        
        // Kích hoạt sự kiện lần đầu để lấy giá của ghế đầu tiên
        if(cbxHangGhe.getItemCount() > 0 && cbxHangGhe.isEnabled()) {
            cbxHangGhe.setSelectedIndex(0);
        }

        add(mainPanel, BorderLayout.CENTER);

        // ==========================================
        // FOOTER: Nút Lưu
        // ==========================================
        JPanel footer = new JPanel(new FlowLayout(FlowLayout.RIGHT, 15, 15));
        footer.setBackground(AppColor.SURFACE);
        footer.setBorder(BorderFactory.createMatteBorder(1, 0, 0, 0, AppColor.BORDER));

        JButton btnCancel = new JButton("Hủy bỏ");
        btnCancel.setFont(new Font("Inter", Font.BOLD, 14));
        btnCancel.setCursor(new Cursor(Cursor.HAND_CURSOR));
        btnCancel.addActionListener(e -> dispose());

        JButton btnSave = new JButton("Lưu thay đổi");
        btnSave.setFont(new Font("Inter", Font.BOLD, 14));
        btnSave.setBackground(AppColor.PRIMARY);
        btnSave.setForeground(Color.WHITE);
        btnSave.setCursor(new Cursor(Cursor.HAND_CURSOR));
        btnSave.setPreferredSize(new Dimension(140, 40));

        if (emptySeats.isEmpty())
            btnSave.setEnabled(false); // Khóa nút lưu nếu hết ghế

        // GỌI PROCEDURE ORACLE TẠI ĐÂY
        btnSave.addActionListener(e -> {
            String selectedSeat = cbxHangGhe.getSelectedItem().toString();
            // Cắt chuỗi "ST01 - 1A - Thương gia" để lấy ra chữ "ST01"
            String newSeatID = selectedSeat.split(" - ")[0];

            // Gọi xuống BUS để chạy Procedure
            boolean isSuccess = veBUS.doiVeNangHang(ticketID, currentFlightID, newSeatID);

            if (isSuccess) {
                JOptionPane.showMessageDialog(this,
                        "Đổi ghế thành công!\nGiá vé mới đã được cập nhật tự động vào hệ thống.",
                        "Hoàn tất", JOptionPane.INFORMATION_MESSAGE);
                dispose();
            }
        });

        footer.add(btnCancel);
        footer.add(btnSave);
        add(footer, BorderLayout.SOUTH);
    }

    private JPanel createLabelGroup(String label, String value, boolean isHighlight) {
        JPanel panel = new JPanel(new BorderLayout(0, 5));
        panel.setOpaque(false);
        JLabel lbl = new JLabel(label);
        lbl.setFont(new Font("Inter", Font.BOLD, 13));
        lbl.setForeground(AppColor.TEXT_SECONDARY);

        JLabel valLbl = new JLabel(value);
        if (isHighlight) {
            valLbl.setFont(new Font("Inter", Font.BOLD, 20));
            valLbl.setForeground(new Color(225, 29, 72)); // Màu đỏ hồng nổi bật
        } else {
            valLbl.setFont(new Font("Inter", Font.BOLD, 16));
            valLbl.setForeground(AppColor.TEXT_PRIMARY);
        }

        panel.add(lbl, BorderLayout.NORTH);
        panel.add(valLbl, BorderLayout.CENTER);
        return panel;
    }
}