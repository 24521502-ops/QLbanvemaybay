package gui;

import com.formdev.flatlaf.FlatClientProperties;
import dao.QuanLyKhachHangDAO.ProfileDAO;
import dto.AccountDTO;
import dto.CustomerDTO;
import net.miginfocom.swing.MigLayout;
import com.github.lgooddatepicker.components.DatePicker;
import com.github.lgooddatepicker.components.DatePickerSettings;

import javax.swing.*;
import java.awt.*;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.regex.Pattern;

public class ProfilePanel extends JPanel {

    private static final Color PRIMARY = new Color(0, 102, 138);
    private static final Color BG_PAGE = new Color(245, 247, 252);
    private static final Color BG_CARD = Color.WHITE;
    private static final Color TEXT_DARK = new Color(15, 23, 42);
    private static final Color TEXT_GRAY = new Color(100, 116, 139);
    private static final Color DIVIDER = new Color(226, 232, 240);

    private final AccountDTO account;
    private final ProfileDAO profileDAO = new ProfileDAO();
    private CustomerDTO customer;

    // View-only labels (display)
    private JLabel lblFullNameVal;
    private JLabel lblDobVal;
    private JLabel lblPhoneVal;
    private JLabel lblGenderVal;
    private JLabel lblEmailVal;
    private JLabel lblPassportVal;
    private JLabel lblNationalityVal;

    // Input fields (edit)
    private JTextField tfFullName;
    private DatePicker dpDob;
    private JPanel panelDobWrapper; // Wrapper for DatePicker
    private JTextField tfPhone;
    private JComboBox<String> cbGender;
    private JTextField tfEmail;
    private JTextField tfPassport;
    private JTextField tfNationality;

    // Header updates
    private JLabel lblHeaderName;
    private JLabel lblHeaderEmail;
    private JPanel avatarPanel;
    private String avatarInitials = "?";

    private JButton btnEdit;
    private boolean editMode = false;
    private JPanel infoCard;

    public ProfilePanel(AccountDTO account) {
        this.account = account;
        setLayout(new BorderLayout());
        setBackground(BG_PAGE);

        if (account != null && account.getCustomerID() != null) {
            customer = profileDAO.getProfileByCustomerID(account.getCustomerID());
        }

        // Center column với max width
        JPanel centerCol = new JPanel(new MigLayout(
                "wrap, fillx, insets 36 0 36 0, gapy 16", "[grow, fill]"));
        centerCol.setBackground(BG_PAGE);
        centerCol.add(buildHeaderCard(), "growx");
        infoCard = buildInfoCard();
        centerCol.add(infoCard, "growx");

        // Wrapper để giới hạn width và căn giữa
        JPanel wrapper = new JPanel(new MigLayout("fill, insets 0", "[32!][grow, fill, 0:0:860][32!]"));
        wrapper.setBackground(BG_PAGE);
        wrapper.add(new JLabel(), "");
        wrapper.add(centerCol, "grow");
        wrapper.add(new JLabel(), "");

        JScrollPane sp = new JScrollPane(wrapper);
        sp.setBorder(null);
        sp.setOpaque(false);
        sp.getViewport().setOpaque(false);
        sp.getVerticalScrollBar().setUnitIncrement(16);
        add(sp, BorderLayout.CENTER);
    }

    // ── Header Card ────────────────────────────────────────────────────────────
    private JPanel buildHeaderCard() {
        JPanel card = new JPanel(new MigLayout("insets 24 28, fillx, gapx 20", "[64!, 64!][grow][]"));
        card.setBackground(BG_CARD);
        card.putClientProperty(FlatClientProperties.STYLE,
                "arc:16; borderColor:#e2e8f0; borderWidth:1");

        String displayName = customer != null && customer.getFullName() != null
                ? customer.getFullName()
                : (account != null ? account.getUserName() : "Khách hàng");

        avatarInitials = getInitials(displayName);
        avatarPanel = buildAvatar();

        // Avatar
        card.add(avatarPanel, "w 56!, h 56!, aligny center");

        // Thông tin
        JPanel info = new JPanel(new MigLayout("wrap, insets 0, gapy 4"));
        info.setOpaque(false);

        lblHeaderName = new JLabel(displayName);
        lblHeaderName.setFont(new Font("Segoe UI", Font.BOLD, 20));
        lblHeaderName.setForeground(TEXT_DARK);

        String emailStr = customer != null && customer.getEmail() != null
                ? customer.getEmail()
                : (account != null ? nvl(account.getUserName()) : "");
        lblHeaderEmail = new JLabel(emailStr);
        lblHeaderEmail.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        lblHeaderEmail.setForeground(TEXT_GRAY);

        info.add(lblHeaderName);
        info.add(lblHeaderEmail);
        card.add(info, "grow, aligny center");

        return card;
    }

    // ── Info Card ──────────────────────────────────────────────────────────────
    private JPanel buildInfoCard() {
        JPanel card = new JPanel(new MigLayout("wrap, insets 28, fillx, gapy 0", "[grow, fill]"));
        card.setBackground(BG_CARD);
        card.putClientProperty(FlatClientProperties.STYLE,
                "arc:16; borderColor:#e2e8f0; borderWidth:1");

        // ── Thông tin cá nhân ──────────────────────────────────────────────
        card.add(sectionTitle("Thông tin cá nhân"), "gapy 0 16");

        String fullName = nvl(customer != null ? customer.getFullName() : null);
        String dobStr = customer != null && customer.getDateOfBirth() != null
                ? new SimpleDateFormat("dd/MM/yyyy").format(customer.getDateOfBirth())
                : "";
        String phone = nvl(customer != null ? customer.getPhone() : null);
        String gender = formatGender(customer != null ? customer.getGender() : null);
        String email = nvl(customer != null ? customer.getEmail() : null);
        String nationality = nvl(customer != null ? customer.getNationality() : null);
        String passport = nvl(customer != null ? customer.getPassportNumber() : null);

        // Khởi tạo các thành phần giao diện
        tfFullName = new JTextField();
        lblFullNameVal = new JLabel();

        dpDob = createDatePicker();
        lblDobVal = new JLabel();

        tfPhone = new JTextField();
        lblPhoneVal = new JLabel();

        cbGender = new JComboBox<>(new String[] { "Nam", "Nữ", "Khác" });
        lblGenderVal = new JLabel();

        tfEmail = new JTextField();
        lblEmailVal = new JLabel();

        tfNationality = new JTextField();
        lblNationalityVal = new JLabel();

        tfPassport = new JTextField();
        lblPassportVal = new JLabel();

        // Xây dựng lưới grid bento 2 cột cân xứng
        JPanel g1 = grid();

        // Dòng 1: Họ và tên | Ngày sinh
        g1.add(editableFieldBlock("Họ và tên", fullName, tfFullName, lblFullNameVal));
        g1.add(editableDateBlock("Ngày sinh", dobStr, dpDob, lblDobVal), "wrap");

        // Dòng 2: Số điện thoại | Giới tính
        g1.add(editableFieldBlock("Số điện thoại", phone, tfPhone, lblPhoneVal));
        g1.add(editableGenderBlock("Giới tính", gender, cbGender, lblGenderVal), "wrap");

        // Dòng 3: Email | Quốc tịch
        g1.add(editableFieldBlock("Email", email, tfEmail, lblEmailVal));
        g1.add(editableFieldBlock("Quốc tịch", nationality, tfNationality, lblNationalityVal), "wrap");

        // Dòng 4: Số CCCD / Hộ chiếu
        g1.add(editableFieldBlock("Số CCCD / Hộ chiếu", passport, tfPassport, lblPassportVal), "wrap");

        card.add(g1, "growx, gapy 0 24");

        card.add(divider(), "growx, h 1!, gapy 0 24");

        // ── Nút Chỉnh sửa / Lưu ────────────────────────────────────────────
        JPanel footRow = new JPanel(new FlowLayout(FlowLayout.RIGHT, 0, 0));
        footRow.setOpaque(false);
        btnEdit = new JButton("<html><font face='Segoe UI Emoji'>✏</font>&nbsp;&nbsp;Chỉnh sửa</html>");
        btnEdit.setFont(new Font("Segoe UI", Font.BOLD, 14));
        btnEdit.putClientProperty(FlatClientProperties.STYLE,
                "arc:10; background:#00668a; foreground:white; borderWidth:0; " +
                        "hoverBackground:#005577; pressedBackground:#004466");
        btnEdit.setPreferredSize(new Dimension(140, 40));
        btnEdit.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        btnEdit.addActionListener(e -> toggleEdit());
        footRow.add(btnEdit);
        card.add(footRow, "growx");

        return card;
    }

    private DatePicker createDatePicker() {
        DatePickerSettings dobSettings = new DatePickerSettings();
        dobSettings.setAllowEmptyDates(true);
        dobSettings.setFormatForDatesCommonEra("dd/MM/yyyy");
        dobSettings.setFontValidDate(new Font("Segoe UI", Font.PLAIN, 14));
        dobSettings.setAllowKeyboardEditing(false);

        DatePicker datePicker = new DatePicker(dobSettings);
        JTextField tf = datePicker.getComponentDateTextField();
        tf.setBorder(null);
        tf.setOpaque(false);
        tf.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        tf.addMouseListener(new java.awt.event.MouseAdapter() {
            @Override
            public void mousePressed(java.awt.event.MouseEvent e) {
                datePicker.openPopup();
            }
        });

        JButton toggleBtn = datePicker.getComponentToggleCalendarButton();
        toggleBtn.setText("📅");
        toggleBtn.setFont(new Font("Segoe UI Emoji", Font.PLAIN, 14));
        toggleBtn.setBorder(null);
        toggleBtn.setContentAreaFilled(false);
        toggleBtn.setCursor(new Cursor(Cursor.HAND_CURSOR));
        return datePicker;
    }

    // ── Component Khối dữ liệu dạng chữ có thể sửa ──────────────────────────────
    private JPanel editableFieldBlock(String label, String value, JTextField textField, JLabel labelVal) {
        JPanel p = new JPanel(new MigLayout("wrap, insets 0, gapy 4", "[grow, fill]"));
        p.setOpaque(false);
        p.add(smallLabel(label));

        labelVal.setText(value.isEmpty() ? "—" : value);
        labelVal.setFont(new Font("Segoe UI", Font.BOLD, 14));
        labelVal.setForeground(TEXT_DARK);
        p.add(labelVal);

        textField.setText(value);
        textField.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        textField.putClientProperty(FlatClientProperties.STYLE,
                "arc:8; borderColor:#cbd5e1; background:#f8fafc");
        textField.setPreferredSize(new Dimension(0, 38));
        textField.setVisible(false);
        p.add(textField, "growx, h 38!");
        return p;
    }

    // ── Component Khối chọn giới tính Nam/Nữ/Khác ──────────────────────────────
    private JPanel editableGenderBlock(String label, String displayValue, JComboBox<String> combo, JLabel labelVal) {
        JPanel p = new JPanel(new MigLayout("wrap, insets 0, gapy 4", "[grow, fill]"));
        p.setOpaque(false);
        p.add(smallLabel(label));

        labelVal.setText(displayValue.isEmpty() ? "—" : displayValue);
        labelVal.setFont(new Font("Segoe UI", Font.BOLD, 14));
        labelVal.setForeground(TEXT_DARK);
        p.add(labelVal);

        combo.setSelectedItem(displayValue.isEmpty() ? "Nam" : displayValue);
        combo.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        combo.putClientProperty(FlatClientProperties.STYLE,
                "arc:8; borderColor:#cbd5e1; background:#f8fafc");
        combo.setPreferredSize(new Dimension(0, 38));
        combo.setVisible(false);
        p.add(combo, "growx, h 38!");
        return p;
    }

    // ── Component Khối chọn ngày sinh ──────────────────────────────────────────
    private JPanel editableDateBlock(String label, String displayValue, DatePicker datePicker, JLabel labelVal) {
        JPanel p = new JPanel(new MigLayout("wrap, insets 0, gapy 4", "[grow, fill]"));
        p.setOpaque(false);
        p.add(smallLabel(label));

        labelVal.setText(displayValue.isEmpty() ? "—" : displayValue);
        labelVal.setFont(new Font("Segoe UI", Font.BOLD, 14));
        labelVal.setForeground(TEXT_DARK);
        p.add(labelVal);

        if (customer != null && customer.getDateOfBirth() != null) {
            java.sql.Date sqlDate = new java.sql.Date(customer.getDateOfBirth().getTime());
            datePicker.setDate(sqlDate.toLocalDate());
        }

        panelDobWrapper = new JPanel(new MigLayout("insets 0 10 0 4", "[grow,fill]", "[grow,fill]"));
        panelDobWrapper.putClientProperty(FlatClientProperties.STYLE,
                "arc:8; background:#f8fafc; borderColor:#cbd5e1; borderWidth:1");
        panelDobWrapper.add(datePicker);
        panelDobWrapper.setVisible(false);
        p.add(panelDobWrapper, "growx, h 38!");
        return p;
    }

    // ── Chuyển đổi qua lại chế độ Xem / Sửa và cập nhật CSDL
    // ──────────────────────────
    private void toggleEdit() {
        if (!editMode) {
            editMode = true;
            btnEdit.setText("<html><font face='Segoe UI Emoji'>💾</font>&nbsp;&nbsp;Lưu</html>");
            btnEdit.putClientProperty(FlatClientProperties.STYLE,
                    "arc:10; background:#16a34a; foreground:white; borderWidth:0; " +
                            "hoverBackground:#15803d");

            // Ẩn tất cả nhãn hiển thị xem
            lblFullNameVal.setVisible(false);
            lblDobVal.setVisible(false);
            lblPhoneVal.setVisible(false);
            lblGenderVal.setVisible(false);
            lblEmailVal.setVisible(false);
            lblNationalityVal.setVisible(false);
            lblPassportVal.setVisible(false);

            // Hiển thị các thành phần nhập liệu
            tfFullName.setVisible(true);
            panelDobWrapper.setVisible(true);
            tfPhone.setVisible(true);
            cbGender.setVisible(true);
            tfEmail.setVisible(true);
            tfNationality.setVisible(true);
            tfPassport.setVisible(true);

            tfFullName.requestFocusInWindow();
        } else {
            // Lấy dữ liệu và kiểm tra hợp lệ
            String newFullName = tfFullName.getText().trim();
            String newPhone = tfPhone.getText().trim();
            String newEmail = tfEmail.getText().trim();
            String newNationality = tfNationality.getText().trim();
            String newPassport = tfPassport.getText().trim();
            String selectedGender = (String) cbGender.getSelectedItem();
            LocalDate newDobLocalDate = dpDob.getDate();

            if (newFullName.isEmpty()) {
                JOptionPane.showMessageDialog(this, "Họ và tên không được để trống!", "Lỗi", JOptionPane.ERROR_MESSAGE);
                tfFullName.requestFocus();
                return;
            }
            if (newPhone.isEmpty()) {
                JOptionPane.showMessageDialog(this, "Số điện thoại không được để trống!", "Lỗi",
                        JOptionPane.ERROR_MESSAGE);
                tfPhone.requestFocus();
                return;
            }
            if (!Pattern.matches("(0[3|5|7|8|9])+([0-9]{8})\\b", newPhone)) {
                JOptionPane.showMessageDialog(this, "Số điện thoại không đúng định dạng Việt Nam!", "Lỗi",
                        JOptionPane.ERROR_MESSAGE);
                tfPhone.requestFocus();
                return;
            }
            if (newEmail.isEmpty()) {
                JOptionPane.showMessageDialog(this, "Email không được để trống!", "Lỗi", JOptionPane.ERROR_MESSAGE);
                tfEmail.requestFocus();
                return;
            }
            if (!Pattern.matches("^[A-Za-z0-9+_.-]+@(.+)$", newEmail)) {
                JOptionPane.showMessageDialog(this, "Email không đúng định dạng!", "Lỗi", JOptionPane.ERROR_MESSAGE);
                tfEmail.requestFocus();
                return;
            }
            if (newNationality.isEmpty()) {
                JOptionPane.showMessageDialog(this, "Quốc tịch không được để trống!", "Lỗi", JOptionPane.ERROR_MESSAGE);
                tfNationality.requestFocus();
                return;
            }
            if (newPassport.isEmpty()) {
                JOptionPane.showMessageDialog(this, "Số CCCD / Hộ chiếu không được để trống!", "Lỗi",
                        JOptionPane.ERROR_MESSAGE);
                tfPassport.requestFocus();
                return;
            }

            if (customer != null) {
                // Đổ dữ liệu mới vào CustomerDTO
                customer.setFullName(newFullName);
                customer.setPhone(newPhone);
                customer.setEmail(newEmail);
                customer.setNationality(newNationality);
                customer.setPassportNumber(newPassport);

                // Map giới tính Nam/Nữ/Khác -> Male/Female/Other
                String dbGender;
                if ("Nam".equals(selectedGender)) {
                    dbGender = "Male";
                } else if ("Nữ".equals(selectedGender)) {
                    dbGender = "Female";
                } else {
                    dbGender = "Other";
                }
                customer.setGender(dbGender);

                // Ép kiểu Ngày sinh LocalDate -> java.util.Date
                if (newDobLocalDate != null) {
                    customer.setDateOfBirth(java.sql.Date.valueOf(newDobLocalDate));
                } else {
                    customer.setDateOfBirth(null);
                }

                // Gọi DAO để cập nhật database
                boolean ok = profileDAO.updateProfile(customer);
                if (ok) {
                    // Cập nhật text hiển thị trên nhãn
                    lblFullNameVal.setText(newFullName);
                    lblPhoneVal.setText(newPhone);
                    lblEmailVal.setText(newEmail);
                    lblNationalityVal.setText(newNationality);
                    lblPassportVal.setText(newPassport);
                    lblGenderVal.setText(selectedGender);

                    String dobStr = "";
                    if (newDobLocalDate != null) {
                        java.time.format.DateTimeFormatter dtf = java.time.format.DateTimeFormatter
                                .ofPattern("dd/MM/yyyy");
                        dobStr = newDobLocalDate.format(dtf);
                    }
                    lblDobVal.setText(dobStr.isEmpty() ? "—" : dobStr);

                    // Đồng bộ nhãn tiêu đề Header và Avatar chữ cái đầu
                    lblHeaderName.setText(newFullName);
                    lblHeaderEmail.setText(newEmail);
                    avatarInitials = getInitials(newFullName);
                    avatarPanel.repaint();

                    // Đồng bộ lên header của CustomerMainFrame
                    Window window = SwingUtilities.getWindowAncestor(this);
                    if (window instanceof CustomerMainFrame) {
                        ((CustomerMainFrame) window).updateHeaderUserInfo(newFullName);
                    }

                    JOptionPane.showMessageDialog(this,
                            "Cập nhật thông tin thành công!", "Thành công",
                            JOptionPane.INFORMATION_MESSAGE);
                } else {
                    JOptionPane.showMessageDialog(this,
                            "Cập nhật thông tin thất bại!", "Lỗi", JOptionPane.ERROR_MESSAGE);
                    return; // Vẫn giữ nguyên chế độ sửa để tránh mất dữ liệu vừa nhập
                }
            }

            editMode = false;
            btnEdit.setText("<html><font face='Segoe UI Emoji'>✏</font>&nbsp;&nbsp;Chỉnh sửa</html>");
            btnEdit.putClientProperty(FlatClientProperties.STYLE,
                    "arc:10; background:#00668a; foreground:white; borderWidth:0; " +
                            "hoverBackground:#005577");

            // Ẩn tất cả thành phần nhập liệu
            tfFullName.setVisible(false);
            panelDobWrapper.setVisible(false);
            tfPhone.setVisible(false);
            cbGender.setVisible(false);
            tfEmail.setVisible(false);
            tfNationality.setVisible(false);
            tfPassport.setVisible(false);

            // Hiện tất cả nhãn hiển thị xem
            lblFullNameVal.setVisible(true);
            lblDobVal.setVisible(true);
            lblPhoneVal.setVisible(true);
            lblGenderVal.setVisible(true);
            lblEmailVal.setVisible(true);
            lblNationalityVal.setVisible(true);
            lblPassportVal.setVisible(true);
        }
        infoCard.revalidate();
        infoCard.repaint();
    }

    // ── Helper Label & UI ──────────────────────────────────────────────────────
    private JLabel smallLabel(String text) {
        JLabel l = new JLabel(text);
        l.setFont(new Font("Segoe UI", Font.PLAIN, 12));
        l.setForeground(TEXT_GRAY);
        return l;
    }

    private JLabel sectionTitle(String text) {
        JLabel l = new JLabel(text);
        l.setFont(new Font("Segoe UI", Font.BOLD, 15));
        l.setForeground(TEXT_DARK);
        return l;
    }

    private JPanel grid() {
        JPanel g = new JPanel(new MigLayout(
                "fillx, insets 0, gapx 32, gapy 20", "[grow, fill][grow, fill]"));
        g.setOpaque(false);
        return g;
    }

    private JPanel divider() {
        JPanel d = new JPanel(null);
        d.setBackground(DIVIDER);
        d.setPreferredSize(new Dimension(0, 1));
        return d;
    }

    // ── Avatar Chữ cái đầu ─────────────────────────────────────────────────────
    private JPanel buildAvatar() {
        JPanel av = new JPanel() {
            @Override
            protected void paintComponent(Graphics g) {
                super.paintComponent(g);
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                int s = Math.min(getWidth(), getHeight()) - 2; // Subtract 2 to prevent clipping of the border
                int x = (getWidth() - s) / 2;
                int y = (getHeight() - s) / 2;
                // Gradient nền sky sang trọng
                GradientPaint gp = new GradientPaint(x, y, new Color(186, 230, 253),
                        x + s, y + s, new Color(147, 197, 253));
                g2.setPaint(gp);
                g2.fillOval(x, y, s, s);
                // Viền
                g2.setColor(PRIMARY);
                g2.setStroke(new BasicStroke(1.2f));
                g2.drawOval(x, y, s, s);
                // Chữ đại diện
                g2.setColor(PRIMARY);
                g2.setFont(new Font("Segoe UI", Font.BOLD, 18));
                FontMetrics fm = g2.getFontMetrics();
                int tx = x + (s - fm.stringWidth(avatarInitials)) / 2;
                int ty = y + (s + fm.getAscent()) / 2 - 2; // Visually perfectly centered vertically for capitals
                g2.drawString(avatarInitials, tx, ty);
                g2.dispose();
            }
        };
        av.setOpaque(false);
        return av;
    }

    private String getInitials(String name) {
        if (name == null || name.isBlank())
            return "?";
        String[] p = name.trim().split("\\s+");
        return p.length >= 2
                ? (p[0].substring(0, 1) + p[p.length - 1].substring(0, 1)).toUpperCase()
                : p[0].substring(0, 1).toUpperCase();
    }

    private String formatGender(String g) {
        if (g == null)
            return "";
        switch (g.toLowerCase()) {
            case "male":
                return "Nam";
            case "female":
                return "Nữ";
            default:
                return "Khác";
        }
    }

    private String nvl(String s) {
        return s != null ? s : "";
    }
}
