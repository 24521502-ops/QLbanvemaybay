package gui;

import dto.EmployeeDTO;
import util.AppColor;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.awt.geom.RoundRectangle2D;
import java.util.List;

/**
 * Dialog thêm / sửa nhân viên - Thiết kế theo mẫu UI mockup
 */
public class EmployeeDialog extends JDialog {

    private JTextField txtFullName;
    private JComboBox<String> cboPosition;
    private JTextField txtEmail;
    private JTextField txtPhone;

    private EmployeeDTO employee; // null = thêm mới, != null = sửa
    private boolean confirmed = false;

    // Danh sách chức vụ mặc định
    private static final String[] DEFAULT_POSITIONS = {
            "Cơ trưởng", "Tiếp viên trưởng", "Nhân viên mặt đất",
            "Điều phái viên", "Kỹ thuật viên", "Quản lý"
    };

    public EmployeeDialog(Frame owner, EmployeeDTO employee, List<String> positions) {
        super(owner, true);
        this.employee = employee;
        setTitle(employee == null ? "Thêm nhân viên mới" : "Chỉnh sửa nhân viên");
        setUndecorated(true);
        setSize(480, 360);
        setLocationRelativeTo(owner);

        // Main wrapper panel với bo góc
        JPanel wrapper = new JPanel(new BorderLayout()) {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(AppColor.SURFACE);
                g2.fill(new RoundRectangle2D.Double(0, 0, getWidth(), getHeight(), 16, 16));

                // Nền footer xám xanh nhạt
                g2.setColor(new Color(248, 250, 252));
                Shape clip = new RoundRectangle2D.Double(0, 0, getWidth(), getHeight(), 16, 16);
                g2.clip(clip);
                g2.fillRect(0, getHeight() - 76, getWidth(), 76);

                g2.setClip(null);

                // Viền phân cách
                g2.setColor(AppColor.BORDER);
                g2.drawLine(0, 64, getWidth(), 64); // Header line
                g2.drawLine(0, getHeight() - 76, getWidth(), getHeight() - 76); // Footer line

                // Viền ngoài
                g2.setStroke(new BasicStroke(1f));
                g2.draw(new RoundRectangle2D.Double(0.5, 0.5, getWidth() - 1, getHeight() - 1, 16, 16));
                g2.dispose();
            }
        };
        wrapper.setOpaque(false);
        setContentPane(wrapper);
        setBackground(new Color(0, 0, 0, 0));

        // ===== HEADER =====
        JPanel headerPanel = new JPanel(new BorderLayout());
        headerPanel.setOpaque(false);
        headerPanel.setBorder(BorderFactory.createEmptyBorder(20, 24, 20, 24));

        JLabel titleLabel = new JLabel(employee == null ? "Thêm nhân viên mới" : "Chỉnh sửa nhân viên");
        titleLabel.setFont(new Font("Segoe UI", Font.BOLD, 18));
        titleLabel.setForeground(AppColor.TEXT_PRIMARY);
        headerPanel.add(titleLabel, BorderLayout.WEST);

        // Nút X đóng dialog
        JLabel closeBtn = new JLabel(new CloseIcon());
        closeBtn.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        closeBtn.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                dispose();
            }
        });
        headerPanel.add(closeBtn, BorderLayout.EAST);
        wrapper.add(headerPanel, BorderLayout.NORTH);

        // ===== FORM BODY =====
        JPanel formPanel = new JPanel(new GridBagLayout());
        formPanel.setOpaque(false);
        formPanel.setBorder(BorderFactory.createEmptyBorder(20, 24, 20, 24));
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.insets = new Insets(0, 0, 0, 0);

        // --- Row 1: Họ tên + Chức vụ ---
        gbc.gridx = 0;
        gbc.gridy = 0;
        gbc.weightx = 0.5;
        gbc.insets = new Insets(0, 0, 8, 12);
        formPanel.add(createLabel("HỌ TÊN"), gbc);

        gbc.gridx = 1;
        gbc.gridy = 0;
        gbc.weightx = 0.5;
        gbc.insets = new Insets(0, 12, 8, 0);
        formPanel.add(createLabel("CHỨC VỤ"), gbc);

        txtFullName = createTextField("Nhập họ và tên", null);
        gbc.gridx = 0;
        gbc.gridy = 1;
        gbc.weightx = 0.5;
        gbc.insets = new Insets(0, 0, 20, 12);
        formPanel.add(txtFullName, gbc);

        cboPosition = new JComboBox<>();
        cboPosition.addItem("Chọn chức vụ");
        if (positions != null) {
            for (String pos : positions)
                cboPosition.addItem(pos);
        }
        for (String defaultPos : DEFAULT_POSITIONS) {
            boolean exists = false;
            for (int i = 0; i < cboPosition.getItemCount(); i++) {
                if (defaultPos.equals(cboPosition.getItemAt(i))) {
                    exists = true;
                    break;
                }
            }
            if (!exists)
                cboPosition.addItem(defaultPos);
        }
        cboPosition.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        cboPosition.setPreferredSize(new Dimension(0, 40));
        cboPosition.setRenderer(new DefaultListCellRenderer() {
            @Override
            public Component getListCellRendererComponent(JList<?> list, Object value, int index, boolean isSelected,
                    boolean cellHasFocus) {
                JLabel label = (JLabel) super.getListCellRendererComponent(list, value, index, isSelected,
                        cellHasFocus);
                label.setBorder(BorderFactory.createEmptyBorder(0, 8, 0, 0));
                if ("Chọn chức vụ".equals(value) && index == -1) {
                    label.setForeground(new Color(156, 163, 175)); // Grey 400 placeholder
                }
                return label;
            }
        });
        gbc.gridx = 1;
        gbc.gridy = 1;
        gbc.weightx = 0.5;
        gbc.insets = new Insets(0, 12, 20, 0);
        formPanel.add(cboPosition, gbc);

        // --- Row 2: Email + Số điện thoại ---
        gbc.gridx = 0;
        gbc.gridy = 2;
        gbc.weightx = 0.5;
        gbc.insets = new Insets(0, 0, 8, 12);
        formPanel.add(createLabel("EMAIL"), gbc);

        gbc.gridx = 1;
        gbc.gridy = 2;
        gbc.weightx = 0.5;
        gbc.insets = new Insets(0, 12, 8, 0);
        formPanel.add(createLabel("SỐ ĐIỆN THOẠI"), gbc);

        txtEmail = createTextField("ví dụ@skycontrol.com", new EnvelopeIcon());
        gbc.gridx = 0;
        gbc.gridy = 3;
        gbc.weightx = 0.5;
        gbc.insets = new Insets(0, 0, 0, 12);
        formPanel.add(txtEmail, gbc);

        txtPhone = createTextField("Nhập số điện thoại", null);
        gbc.gridx = 1;
        gbc.gridy = 3;
        gbc.weightx = 0.5;
        gbc.insets = new Insets(0, 12, 0, 0);
        formPanel.add(txtPhone, gbc);

        wrapper.add(formPanel, BorderLayout.CENTER);

        // ===== FOOTER BUTTONS =====
        JPanel footerPanel = new JPanel(new FlowLayout(FlowLayout.RIGHT, 12, 18));
        footerPanel.setOpaque(false);
        footerPanel.setBorder(BorderFactory.createEmptyBorder(0, 0, 0, 12));

        JButton btnCancel = createButton("Hủy", new Color(238, 242, 255), new Color(30, 41, 59));
        btnCancel.setPreferredSize(new Dimension(100, 40));
        btnCancel.addActionListener(e -> dispose());

        JButton btnSave = createButton("Lưu thông tin", new Color(2, 106, 145), Color.WHITE);
        btnSave.addActionListener(e -> onSave());

        // Căn giữa 2 nút trong panel (FlowLayout default is right, let's use right
        // alignment for a form, but mockup 2 has them right aligned or center?)
        // Mockup 2 shows them right-aligned or centered? Actually image 2 shows them
        // right aligned or maybe centered in a specific container.
        // Let's right align them with FlowLayout.RIGHT. Wait, the screenshot shows them
        // at the center-right.

        footerPanel.add(btnCancel);
        footerPanel.add(btnSave);
        wrapper.add(footerPanel, BorderLayout.SOUTH);

        // Điền dữ liệu nếu sửa
        if (employee != null) {
            txtFullName.setText(employee.getFullName());
            txtEmail.setText(employee.getEmail());
            txtPhone.setText(employee.getPhone());
            if (employee.getPosition() != null) {
                cboPosition.setSelectedItem(employee.getPosition());
            }
        }
    }

    private JLabel createLabel(String text) {
        JLabel label = new JLabel(text);
        label.setFont(new Font("Segoe UI", Font.BOLD, 12));
        label.setForeground(AppColor.TEXT_SECONDARY); // Gray color
        return label;
    }

    private JTextField createTextField(String placeholder, Icon leadingIcon) {
        JTextField field = new JTextField();
        field.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        field.setPreferredSize(new Dimension(0, 40));
        field.putClientProperty("JTextField.placeholderText", placeholder);
        if (leadingIcon != null) {
            field.putClientProperty("JTextField.leadingIcon", leadingIcon);
        }
        return field;
    }

    private JButton createButton(String text, Color bgColor, Color fgColor) {
        JButton btn = new JButton(text) {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(getModel().isPressed() ? bgColor.darker() : bgColor);
                g2.fillRoundRect(0, 0, getWidth(), getHeight(), 8, 8);
                g2.setColor(fgColor);
                g2.setFont(getFont());
                FontMetrics fm = g2.getFontMetrics();
                int x = (getWidth() - fm.stringWidth(getText())) / 2;
                int y = (getHeight() + fm.getAscent() - fm.getDescent()) / 2;
                g2.drawString(getText(), x, y);
                g2.dispose();
            }
        };
        btn.setFont(new Font("Segoe UI", Font.BOLD, 13));
        btn.setPreferredSize(new Dimension(140, 40));
        btn.setContentAreaFilled(false);
        btn.setBorderPainted(false);
        btn.setFocusPainted(false);
        btn.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        return btn;
    }

    private static class EnvelopeIcon implements Icon {
        @Override
        public void paintIcon(Component c, Graphics g, int x, int y) {
            Graphics2D g2 = (Graphics2D) g.create();
            g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            g2.setColor(new Color(156, 163, 175)); // Gray 400
            g2.setStroke(new BasicStroke(1.5f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND));
            g2.drawRoundRect(x + 2, y + 5, 14, 10, 2, 2);
            g2.drawPolyline(new int[] { x + 2, x + 9, x + 16 }, new int[] { y + 5, y + 10, y + 5 }, 3);
            g2.dispose();
        }

        @Override
        public int getIconWidth() {
            return 20;
        }

        @Override
        public int getIconHeight() {
            return 20;
        }
    }

    private static class CloseIcon implements Icon {
        @Override
        public void paintIcon(Component c, Graphics g, int x, int y) {
            Graphics2D g2 = (Graphics2D) g.create();
            g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            g2.setColor(AppColor.TEXT_SECONDARY);
            g2.setStroke(new BasicStroke(1.5f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND));
            g2.drawLine(x + 3, y + 3, x + 13, y + 13);
            g2.drawLine(x + 13, y + 3, x + 3, y + 13);
            g2.dispose();
        }

        @Override
        public int getIconWidth() {
            return 16;
        }

        @Override
        public int getIconHeight() {
            return 16;
        }
    }

    private void onSave() {
        String fullName = txtFullName.getText().trim();
        String position = cboPosition.getSelectedIndex() > 0 ? (String) cboPosition.getSelectedItem() : "";
        String email = txtEmail.getText().trim();
        String phone = txtPhone.getText().trim();

        // Validate
        if (fullName.isEmpty()) {
            JOptionPane.showMessageDialog(this, "Vui lòng nhập họ tên!", "Lỗi", JOptionPane.WARNING_MESSAGE);
            txtFullName.requestFocus();
            return;
        }

        if (employee == null) {
            employee = new EmployeeDTO();
        }
        employee.setFullName(fullName);
        employee.setPosition(position);
        employee.setEmail(email);
        employee.setPhone(phone);

        confirmed = true;
        dispose();
    }

    /**
     * Trả về true nếu người dùng bấm Lưu
     */
    public boolean isConfirmed() {
        return confirmed;
    }

    /**
     * Trả về DTO đã điền dữ liệu
     */
    public EmployeeDTO getEmployee() {
        return employee;
    }
}
