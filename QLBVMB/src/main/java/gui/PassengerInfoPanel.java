package gui;

import com.formdev.flatlaf.FlatClientProperties;
import com.github.lgooddatepicker.components.DatePicker;
import com.github.lgooddatepicker.components.DatePickerSettings;
import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class PassengerInfoPanel extends JPanel {

    private static final Color SECONDARY = new Color(0, 102, 138);
    private static final Color BG_PAGE = new Color(248, 249, 255);
    private static final Color BG_SECTION_HEADER = new Color(240, 245, 255);
    private static final Color TEXT_DARK = new Color(15, 23, 42);
    private static final Color TEXT_GRAY = new Color(100, 116, 139);
    private static final Color BORDER_COLOR = new Color(226, 232, 240);

    private final BookingProcessPanel navigationListener;
    private final bus.PassengerBUS passengerBUS = new bus.PassengerBUS();
    private JPanel formContainer;
    private List<PassengerFormBlock> formBlocks = new ArrayList<>();
    private JComboBox<Integer> cbPassengerCount;

    public PassengerInfoPanel(BookingProcessPanel listener) {
        this.navigationListener = listener;
        setLayout(new BorderLayout());
        setBackground(BG_PAGE);
        initComponents();
        // Khởi tạo ban đầu với 1 hành khách
        setPassengerCount(1);
    }

    private void initComponents() {
        JPanel content = new JPanel(new MigLayout("wrap, fillx, insets 32 32, gapy 24", "[grow, fill]"));
        content.setOpaque(false);

        // Header Panel (Tiêu đề + Chọn số lượng hành khách)
        JPanel headerPanel = new JPanel(new MigLayout("insets 0, fillx", "[grow][pref!]", "[]"));
        headerPanel.setOpaque(false);

        JPanel titleGrp = new JPanel(new MigLayout("wrap, insets 0, gapy 4"));
        titleGrp.setOpaque(false);
        JLabel title = new JLabel("Thông tin hành khách");
        title.setFont(new Font("Segoe UI", Font.BOLD, 32));
        title.setForeground(TEXT_DARK);
        JLabel sub = new JLabel("Vui lòng nhập thông tin chính xác như trên giấy tờ tùy thân của hành khách.");
        sub.setFont(new Font("Segoe UI", Font.PLAIN, 15));
        sub.setForeground(TEXT_GRAY);
        titleGrp.add(title);
        titleGrp.add(sub);

        JPanel countGrp = new JPanel(new MigLayout("insets 0, gapx 12", "[][]", "[]"));
        countGrp.setOpaque(false);
        JLabel lblCount = new JLabel("Số lượng hành khách:");
        lblCount.setFont(new Font("Segoe UI", Font.BOLD, 15));
        lblCount.setForeground(TEXT_DARK);
        cbPassengerCount = new JComboBox<>(new Integer[] { 1, 2, 3, 4, 5, 6, 7, 8, 9 });
        cbPassengerCount.setFont(new Font("Segoe UI", Font.BOLD, 15));
        cbPassengerCount.putClientProperty(FlatClientProperties.STYLE, "arc:8; borderColor:#cbd5e1");
        cbPassengerCount.setPreferredSize(new Dimension(80, 40));
        cbPassengerCount.addActionListener(e -> {
            int count = (Integer) cbPassengerCount.getSelectedItem();
            setPassengerCount(count);
        });
        countGrp.add(lblCount);
        countGrp.add(cbPassengerCount);
        countGrp.setVisible(false); // Ẩn hoàn toàn vì số lượng hành khách được cố định theo số ghế chọn ở Bước 2

        headerPanel.add(titleGrp);
        headerPanel.add(countGrp, "right, aligny center");
        content.add(headerPanel);

        formContainer = new JPanel(new MigLayout("wrap, fillx, insets 0, gapy 0", "[grow, fill]"));
        formContainer.setOpaque(false);
        content.add(formContainer);

        JPanel footer = new JPanel(new MigLayout("insets 24 0, fillx", "[pref!][grow][pref!]"));
        footer.setOpaque(false);

        JButton btnBack = new JButton("← Quay lại chọn ghế");
        btnBack.setFont(new Font("Segoe UI", Font.BOLD, 15));
        btnBack.setForeground(SECONDARY);
        btnBack.setContentAreaFilled(false);
        btnBack.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        btnBack.addActionListener(e -> navigationListener.goBackToSeats());

        JButton btnNext = new JButton("Tiếp tục thanh toán →");
        btnNext.setFont(new Font("Segoe UI", Font.BOLD, 16));
        btnNext.setBackground(SECONDARY);
        btnNext.setForeground(Color.WHITE);
        btnNext.putClientProperty(FlatClientProperties.STYLE, "arc:12");
        btnNext.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        btnNext.addActionListener(e -> {
            if (validateAll()) {
                navigationListener.confirmPassengersAndGoToPayment(getPassengers());
            }
        });

        footer.add(btnBack);
        footer.add(new JLabel(), "growx");
        footer.add(btnNext, "w 220!, h 50!");
        content.add(footer);

        add(content, BorderLayout.CENTER);
    }

    public void initPassengerCount(int count) {
        // Theo yêu cầu: Chỉ nhập thông tin 1 lần (người đại diện) và áp dụng cho toàn bộ vé
        cbPassengerCount.setSelectedItem(1);
        setPassengerCount(1);
    }

    public void setPassengerCount(int count) {
        // Lưu giữ tạm thời dữ liệu cũ đã nhập để tránh mất dữ liệu của người dùng khi
        // thay đổi số lượng hành khách
        List<dto.PassengerDTO> temp = new ArrayList<>();
        for (PassengerFormBlock block : formBlocks) {
            temp.add(block.getPassengerDataRaw());
        }

        formContainer.removeAll();
        formBlocks.clear();

        for (int i = 0; i < count; i++) {
            PassengerFormBlock block = new PassengerFormBlock(i + 1);
            if (i < temp.size()) {
                block.setPassengerData(temp.get(i));
            }
            formBlocks.add(block);
            formContainer.add(block, "growx, gapy 0 24");
        }

        formContainer.revalidate();
        formContainer.repaint();
    }

    private boolean validateAll() {
        Set<String> passports = new HashSet<>();
        for (PassengerFormBlock block : formBlocks) {
            if (!block.validateData()) {
                return false;
            }
            String pNo = block.getPassportNumber().trim();
            if (passports.contains(pNo)) {
                passengerBUS.showError("Số hộ chiếu / CCCD \"" + pNo + "\" bị trùng lặp giữa các hành khách!");
                return false;
            }
            passports.add(pNo);
        }
        return true;
    }

    public List<dto.PassengerDTO> getPassengers() {
        List<dto.PassengerDTO> list = new ArrayList<>();
        for (PassengerFormBlock block : formBlocks) {
            list.add(block.getPassengerData());
        }
        return list;
    }

    public List<dto.PassengerDTO> getAllPassengerData() {
        return getPassengers();
    }

    public void setSeats(List<String> seats) {
        // Hỗ trợ tương thích ngược cho các thành phần cũ
    }

    private class PassengerFormBlock extends JPanel {
        private JTextField tfName, tfEmail, tfPhone, tfPassport;
        private DatePicker dobPicker;
        private JComboBox<String> cbGender;

        public PassengerFormBlock(int index) {
            setLayout(new BorderLayout());
            setBackground(Color.WHITE);
            putClientProperty(FlatClientProperties.STYLE, "arc:16; borderColor:#e2e8f0; borderWidth:1");

            JPanel header = new JPanel(new MigLayout("insets 16 24, fillx"));
            header.setBackground(BG_SECTION_HEADER);
            header.putClientProperty(FlatClientProperties.STYLE, "arc:16 16 0 0");

            JLabel lblTitle = new JLabel("Hành khách " + index);
            lblTitle.setFont(new Font("Segoe UI", Font.BOLD, 18));
            lblTitle.setForeground(new Color(11, 28, 48));
            header.add(lblTitle);
            add(header, BorderLayout.NORTH);

            JPanel form = new JPanel(new GridBagLayout());
            form.setOpaque(false);
            form.setBorder(new EmptyBorder(32, 32, 32, 32));
            GridBagConstraints gbc = new GridBagConstraints();
            gbc.fill = GridBagConstraints.HORIZONTAL;
            gbc.insets = new Insets(0, 0, 20, 0);

            // Row 1: Full Name
            gbc.gridx = 0;
            gbc.gridy = 0;
            gbc.gridwidth = 2;
            form.add(createLabel("HỌ VÀ TÊN (IN HOA KHÔNG DẤU)"), gbc);

            gbc.gridy = 1;
            gbc.insets = new Insets(0, 0, 4, 0);
            tfName = createStyledTextField("👤", "VD: NGUYEN VAN A");
            form.add(tfName, gbc);

            gbc.gridy = 2;
            gbc.insets = new Insets(0, 0, 24, 0);
            JLabel hint = new JLabel("Tên phải khớp với giấy tờ tùy thân.");
            hint.setFont(new Font("Segoe UI", Font.PLAIN, 12));
            hint.setForeground(TEXT_GRAY);
            form.add(hint, gbc);

            // Row 2: Email & Phone
            gbc.gridwidth = 1;
            gbc.weightx = 0.5;
            gbc.insets = new Insets(0, 0, 8, 12);
            gbc.gridy = 3;
            gbc.gridx = 0;
            form.add(createLabel("ĐỊA CHỈ EMAIL"), gbc);

            gbc.gridx = 1;
            gbc.insets = new Insets(0, 12, 8, 0);
            form.add(createLabel("SỐ ĐIỆN THOẠI"), gbc);

            gbc.gridy = 4;
            gbc.gridx = 0;
            gbc.insets = new Insets(0, 0, 24, 12);
            tfEmail = createStyledTextField("✉", "nguyenvana@example.com");
            form.add(tfEmail, gbc);

            gbc.gridx = 1;
            gbc.insets = new Insets(0, 12, 24, 0);
            tfPhone = createPhoneField();
            form.add(tfPhone, gbc);

            // Row 3: DOB & Gender
            gbc.gridy = 5;
            gbc.gridx = 0;
            gbc.insets = new Insets(0, 0, 8, 12);
            form.add(createLabel("NGÀY SINH"), gbc);

            gbc.gridx = 1;
            gbc.insets = new Insets(0, 12, 8, 0);
            form.add(createLabel("GIỚI TÍNH"), gbc);

            gbc.gridy = 6;
            gbc.gridx = 0;
            gbc.insets = new Insets(0, 0, 24, 12);
            dobPicker = createDatePicker();
            form.add(dobPicker, gbc);

            gbc.gridx = 1;
            gbc.insets = new Insets(0, 12, 24, 0);
            cbGender = createGenderCombo();
            form.add(cbGender, gbc);

            // Row 4: Passport Number
            gbc.gridy = 7;
            gbc.gridx = 0;
            gbc.gridwidth = 2;
            gbc.insets = new Insets(0, 0, 8, 0);
            form.add(createLabel("SỐ HỘ CHIẾU / CCCD"), gbc);

            gbc.gridy = 8;
            gbc.insets = new Insets(0, 0, 0, 0);
            tfPassport = createStyledTextField("🆔", "Nhập số hộ chiếu hoặc căn cước công dân");
            form.add(tfPassport, gbc);

            add(form, BorderLayout.CENTER);
        }

        public String getPassportNumber() {
            return tfPassport.getText().trim();
        }

        public void setPassengerData(dto.PassengerDTO data) {
            if (data == null)
                return;
            tfName.setText(data.getFullName());
            if (data.getGender() != null) {
                String g = data.getGender();
                if (g.equalsIgnoreCase("Male"))
                    cbGender.setSelectedItem("Nam");
                else if (g.equalsIgnoreCase("Female"))
                    cbGender.setSelectedItem("Nữ");
                else
                    cbGender.setSelectedItem("Khác");
            }
            if (data.getDateOfBirth() != null) {
                java.sql.Date sqlDate = new java.sql.Date(data.getDateOfBirth().getTime());
                dobPicker.setDate(sqlDate.toLocalDate());
            }
            tfPassport.setText(data.getPassportNumber());
        }

        public dto.PassengerDTO getPassengerDataRaw() {
            String genderMap = (String) cbGender.getSelectedItem();
            if (genderMap.equals("Nam"))
                genderMap = "Male";
            else if (genderMap.equals("Nữ"))
                genderMap = "Female";
            else
                genderMap = "Other";

            java.sql.Date dob = null;
            if (dobPicker.getDate() != null) {
                dob = java.sql.Date.valueOf(dobPicker.getDate());
            }

            return new dto.PassengerDTO(
                    null,
                    tfName.getText().trim(),
                    genderMap,
                    dob,
                    tfPassport.getText().trim());
        }

        public boolean validateData() {
            resetStyles();
            String name = tfName.getText().trim();
            String email = tfEmail.getText().trim();
            String phone = tfPhone.getText().trim();
            String passport = tfPassport.getText().trim();
            LocalDate dob = dobPicker.getDate();

            // 1. Kiểm tra Tên (Regex: Viết hoa không dấu)
            if (!name.matches("^[A-Z\\s]+$")) {
                showError(tfName, "Họ tên phải viết hoa không dấu (VD: NGUYEN VAN A)");
                return false;
            }

            // 2. Kiểm tra Số điện thoại (Regex: Đủ 10 số)
            if (!phone.matches("^\\d{10}$")) {
                showError(tfPhone, "Số điện thoại phải bao gồm đúng 10 chữ số.");
                return false;
            }

            // 3. Kiểm tra Passport (Không được bỏ trống)
            if (passport.isEmpty()) {
                showError(tfPassport, "Số hộ chiếu/CCCD không được bỏ trống.");
                return false;
            }

            // 4. Kiểm tra Ngày sinh & Email cơ bản
            if (dob == null) {
                showError(dobPicker.getComponentDateTextField(), "Vui lòng chọn ngày sinh.");
                return false;
            }
            if (!email.contains("@")) {
                showError(tfEmail, "Địa chỉ email không hợp lệ.");
                return false;
            }

            return true;
        }

        public dto.PassengerDTO getPassengerData() {
            String genderMap = (String) cbGender.getSelectedItem();
            if (genderMap.equals("Nam"))
                genderMap = "Male";
            else if (genderMap.equals("Nữ"))
                genderMap = "Female";
            else
                genderMap = "Other";

            return new dto.PassengerDTO(
                    null,
                    tfName.getText().trim(),
                    genderMap,
                    java.sql.Date.valueOf(dobPicker.getDate()),
                    tfPassport.getText().trim());
        }

        private void showError(JComponent comp, String msg) {
            comp.putClientProperty(FlatClientProperties.STYLE, "arc:12; borderColor:#ef4444; borderWidth:2");
            passengerBUS.showError(msg);
            comp.requestFocusInWindow();
        }

        private void resetStyles() {
            tfName.putClientProperty(FlatClientProperties.STYLE, "arc:12; borderColor:#cbd5e1");
            tfEmail.putClientProperty(FlatClientProperties.STYLE, "arc:12; borderColor:#cbd5e1");
            tfPhone.putClientProperty(FlatClientProperties.STYLE, "arc:12; borderColor:#cbd5e1");
            tfPassport.putClientProperty(FlatClientProperties.STYLE, "arc:12; borderColor:#cbd5e1");
            dobPicker.getComponentDateTextField().putClientProperty(FlatClientProperties.STYLE,
                    "arc:12; borderColor:#cbd5e1");
        }
    }

    private JLabel createLabel(String text) {
        JLabel label = new JLabel("<html>" + text + " <font color='red'>*</font></html>");
        label.setFont(new Font("Segoe UI", Font.BOLD, 12));
        label.setForeground(new Color(71, 85, 105));
        return label;
    }

    private JTextField createStyledTextField(String icon, String placeholder) {
        JTextField tf = new JTextField();
        tf.putClientProperty(FlatClientProperties.PLACEHOLDER_TEXT, placeholder);
        tf.putClientProperty(FlatClientProperties.STYLE,
                "arc:12; borderColor:#cbd5e1; focusedBorderColor:#00668a; padding:0,10,0,10");
        tf.setFont(new Font("Segoe UI", Font.PLAIN, 15));
        tf.setPreferredSize(new Dimension(0, 48));
        tf.putClientProperty(FlatClientProperties.TEXT_FIELD_LEADING_COMPONENT, createIconLabel(icon));
        return tf;
    }

    private JTextField createPhoneField() {
        JTextField num = new JTextField();
        num.putClientProperty(FlatClientProperties.PLACEHOLDER_TEXT, "Nhập số điện thoại");
        num.putClientProperty(FlatClientProperties.STYLE,
                "arc:12; borderColor:#cbd5e1; focusedBorderColor:#00668a; padding:0,12,0,12");
        num.setFont(new Font("Segoe UI", Font.PLAIN, 15));
        num.setPreferredSize(new Dimension(0, 48));

        String[] codes = { "+84", "+1", "+44", "+81", "+82", "+65" };
        JComboBox<String> prefix = new JComboBox<>(codes);
        prefix.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        prefix.setFont(new Font("Segoe UI", Font.BOLD, 14));
        prefix.putClientProperty(FlatClientProperties.STYLE,
                "arc:12 0 0 12; borderWidth:0,1,0,0; borderColor:#cbd5e1; background:#f1f5f9");

        num.putClientProperty(FlatClientProperties.TEXT_FIELD_LEADING_COMPONENT, prefix);
        return num;
    }

    private DatePicker createDatePicker() {
        DatePickerSettings settings = new DatePickerSettings();
        settings.setAllowEmptyDates(true);
        settings.setFormatForDatesCommonEra("dd/MM/yyyy");
        settings.setFontValidDate(new Font("Segoe UI", Font.PLAIN, 15));

        DatePicker picker = new DatePicker(settings);
        picker.setDate(null);

        JTextField tf = picker.getComponentDateTextField();
        tf.putClientProperty(FlatClientProperties.PLACEHOLDER_TEXT, "ngày/tháng/năm");
        tf.putClientProperty(FlatClientProperties.STYLE,
                "arc:12; borderColor:#cbd5e1; focusedBorderColor:#00668a; padding:0,10,0,10");
        tf.setPreferredSize(new Dimension(0, 48));
        tf.putClientProperty(FlatClientProperties.TEXT_FIELD_LEADING_COMPONENT, createIconLabel("📅"));

        JButton btn = picker.getComponentToggleCalendarButton();
        btn.setText("");
        btn.putClientProperty(FlatClientProperties.STYLE, "arc:0 12 12 0; borderWidth:0; background:#ffffff");
        btn.setPreferredSize(new Dimension(30, 0));

        picker.setBackground(Color.WHITE);
        picker.setBorder(null);

        return picker;
    }

    private JComboBox<String> createGenderCombo() {
        JComboBox<String> cb = new JComboBox<>(new String[] { "Nam", "Nữ", "Khác" });
        cb.setFont(new Font("Segoe UI", Font.PLAIN, 15));
        cb.setPreferredSize(new Dimension(0, 48));
        cb.putClientProperty(FlatClientProperties.STYLE, "arc:12; borderColor:#cbd5e1; focusedBorderColor:#00668a");
        return cb;
    }

    private JLabel createIconLabel(String icon) {
        JLabel lbl = new JLabel(" " + icon + " ");
        lbl.setBorder(new EmptyBorder(0, 12, 0, 8));
        lbl.setFont(new Font("Segoe UI Emoji", Font.PLAIN, 16));
        lbl.setForeground(TEXT_GRAY);
        return lbl;
    }
}