package gui;

import bus.FunctionBUS;
import bus.RoleBUS;
import bus.RoleGroupBUS;
import dto.FunctionDTO;
import dto.RoleDTO;
import dto.RoleGroupDTO;
import util.AppColor;

import javax.swing.*;
import javax.swing.border.*;
import java.awt.*;
import java.awt.event.*;
import java.awt.geom.RoundRectangle2D;
import java.util.*;
import java.util.List;

/**
 * Dialog tạo / chỉnh sửa vai trò (RoleGroup).
 * Hiển thị ô tên vai trò, mô tả, và danh sách checkbox chức năng.
 */
public class RoleGroupDialog extends JDialog {

    private JTextField txtTenVaiTro;
    private JTextArea txtMoTa;
    private final Map<String, JCheckBox> functionCheckBoxes = new LinkedHashMap<>();
    private boolean confirmed = false;

    private final FunctionBUS functionBUS = new FunctionBUS();
    private final RoleBUS roleBUS = new RoleBUS();
    private final RoleGroupBUS roleGroupBUS = new RoleGroupBUS();

    private RoleGroupDTO editingDTO = null; // null = tạo mới, != null = chỉnh sửa

    // Mapping icon/mô tả cho các chức năng (theo ảnh giao diện mẫu)
    private static final Map<String, String[]> FUNCTION_META = new LinkedHashMap<>();
    static {
        FUNCTION_META.put("DASHBOARD",           new String[]{"📊", "Báo cáo, thống kê tổng quan"});
        FUNCTION_META.put("BOOKING_MANAGEMENT",  new String[]{"📋", "Xử lý đặt chỗ, hủy chỗ, thay đổi"});
        FUNCTION_META.put("FLIGHT_MANAGEMENT",   new String[]{"✈", "Quản lý lịch trình, trạng thái bay"});
        FUNCTION_META.put("CUSTOMER_MANAGEMENT", new String[]{"👤", "Quản lý thông tin hành khách"});
        FUNCTION_META.put("SYSTEM_MANAGEMENT",   new String[]{"⚙", "Quản lý sân bay, máy bay, cấu hình"});
    }

    // Tên hiển thị tiếng Việt cho các chức năng
    private static final Map<String, String> FUNCTION_DISPLAY_NAME = new LinkedHashMap<>();
    static {
        FUNCTION_DISPLAY_NAME.put("DASHBOARD",           "Báo cáo");
        FUNCTION_DISPLAY_NAME.put("BOOKING_MANAGEMENT",  "Đặt chỗ");
        FUNCTION_DISPLAY_NAME.put("FLIGHT_MANAGEMENT",   "Chuyến bay");
        FUNCTION_DISPLAY_NAME.put("CUSTOMER_MANAGEMENT", "Khách hàng");
        FUNCTION_DISPLAY_NAME.put("SYSTEM_MANAGEMENT",   "Dữ liệu gốc");
    }

    public RoleGroupDialog(Frame parent, RoleGroupDTO editDTO) {
        super(parent, true);
        this.editingDTO = editDTO;
        setTitle(editDTO == null ? "Tạo vai trò mới" : "Chỉnh sửa vai trò");
        setUndecorated(true);
        setSize(520, 560);
        setLocationRelativeTo(parent);

        JPanel mainPanel = new JPanel(new BorderLayout()) {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(Color.WHITE);
                g2.fill(new RoundRectangle2D.Float(0, 0, getWidth(), getHeight(), 20, 20));
                g2.dispose();
            }
        };
        mainPanel.setOpaque(false);
        mainPanel.setBorder(BorderFactory.createCompoundBorder(
            new ShadowBorder(),
            BorderFactory.createEmptyBorder(24, 28, 24, 28)
        ));

        // === HEADER ===
        JPanel headerPanel = new JPanel(new BorderLayout());
        headerPanel.setOpaque(false);
        JLabel titleLabel = new JLabel(editDTO == null ? "Tạo vai trò mới" : "Chỉnh sửa vai trò");
        titleLabel.setFont(new Font("Segoe UI", Font.BOLD, 18));
        titleLabel.setForeground(AppColor.TEXT_PRIMARY);
        headerPanel.add(titleLabel, BorderLayout.WEST);

        JButton btnClose = new JButton("✕") {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                if (getModel().isRollover()) {
                    g2.setColor(new Color(239, 68, 68, 20));
                    g2.fillOval(0, 0, getWidth(), getHeight());
                }
                g2.setColor(getModel().isRollover() ? AppColor.ERROR : AppColor.TEXT_SECONDARY);
                g2.setFont(new Font("Segoe UI", Font.PLAIN, 18));
                FontMetrics fm = g2.getFontMetrics();
                int x = (getWidth() - fm.stringWidth("✕")) / 2;
                int y = (getHeight() + fm.getAscent() - fm.getDescent()) / 2;
                g2.drawString("✕", x, y);
                g2.dispose();
            }
        };
        btnClose.setPreferredSize(new Dimension(32, 32));
        btnClose.setBorderPainted(false);
        btnClose.setContentAreaFilled(false);
        btnClose.setFocusPainted(false);
        btnClose.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        btnClose.addActionListener(e -> dispose());
        headerPanel.add(btnClose, BorderLayout.EAST);
        headerPanel.setBorder(BorderFactory.createEmptyBorder(0, 0, 16, 0));

        mainPanel.add(headerPanel, BorderLayout.NORTH);

        // === CONTENT ===
        JPanel contentPanel = new JPanel();
        contentPanel.setOpaque(false);
        contentPanel.setLayout(new BoxLayout(contentPanel, BoxLayout.Y_AXIS));

        // --- Tên vai trò ---
        JPanel namePanel = createFieldPanel();
        JLabel lblName = new JLabel("Tên vai trò ");
        lblName.setFont(new Font("Segoe UI", Font.BOLD, 13));
        lblName.setForeground(AppColor.TEXT_PRIMARY);
        JLabel lblRequired = new JLabel("*");
        lblRequired.setFont(new Font("Segoe UI", Font.BOLD, 13));
        lblRequired.setForeground(AppColor.ERROR);
        JPanel nameLabelPanel = new JPanel(new FlowLayout(FlowLayout.LEFT, 0, 0));
        nameLabelPanel.setOpaque(false);
        nameLabelPanel.add(lblName);
        nameLabelPanel.add(lblRequired);
        nameLabelPanel.setAlignmentX(Component.LEFT_ALIGNMENT);
        namePanel.add(nameLabelPanel);
        namePanel.add(Box.createVerticalStrut(6));

        txtTenVaiTro = createStyledTextField("Nhập tên vai trò (VD: Quản lý chi nhánh)");
        namePanel.add(txtTenVaiTro);
        contentPanel.add(namePanel);
        contentPanel.add(Box.createVerticalStrut(14));

        // --- Mô tả ---
        JPanel descPanel = createFieldPanel();
        JLabel lblDesc = new JLabel("Mô tả");
        lblDesc.setFont(new Font("Segoe UI", Font.BOLD, 13));
        lblDesc.setForeground(AppColor.TEXT_PRIMARY);
        lblDesc.setAlignmentX(Component.LEFT_ALIGNMENT);
        descPanel.add(lblDesc);
        descPanel.add(Box.createVerticalStrut(6));

        txtMoTa = new JTextArea(3, 30);
        txtMoTa.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        txtMoTa.setLineWrap(true);
        txtMoTa.setWrapStyleWord(true);
        txtMoTa.setBorder(BorderFactory.createCompoundBorder(
            new RoundedBorder(8, AppColor.BORDER),
            BorderFactory.createEmptyBorder(10, 12, 10, 12)
        ));
        txtMoTa.setBackground(Color.WHITE);
        // Placeholder
        txtMoTa.setText("Mô tả quyền hạn và trách nhiệm của vai trò này");
        txtMoTa.setForeground(new Color(156, 163, 175));
        txtMoTa.addFocusListener(new FocusAdapter() {
            @Override
            public void focusGained(FocusEvent e) {
                if (txtMoTa.getForeground().equals(new Color(156, 163, 175))) {
                    txtMoTa.setText("");
                    txtMoTa.setForeground(AppColor.TEXT_PRIMARY);
                }
            }
            @Override
            public void focusLost(FocusEvent e) {
                if (txtMoTa.getText().trim().isEmpty()) {
                    txtMoTa.setText("Mô tả quyền hạn và trách nhiệm của vai trò này");
                    txtMoTa.setForeground(new Color(156, 163, 175));
                }
            }
        });
        JScrollPane scrollMoTa = new JScrollPane(txtMoTa);
        scrollMoTa.setBorder(null);
        scrollMoTa.setAlignmentX(Component.LEFT_ALIGNMENT);
        scrollMoTa.setMaximumSize(new Dimension(Integer.MAX_VALUE, 80));
        descPanel.add(scrollMoTa);
        contentPanel.add(descPanel);
        contentPanel.add(Box.createVerticalStrut(18));

        // --- Phân quyền chức năng ---
        JPanel permHeader = new JPanel(new BorderLayout());
        permHeader.setOpaque(false);
        permHeader.setAlignmentX(Component.LEFT_ALIGNMENT);
        permHeader.setMaximumSize(new Dimension(Integer.MAX_VALUE, 30));
        JLabel lblPerm = new JLabel("Phân quyền chức năng");
        lblPerm.setFont(new Font("Segoe UI", Font.BOLD, 14));
        lblPerm.setForeground(AppColor.TEXT_PRIMARY);
        permHeader.add(lblPerm, BorderLayout.WEST);

        JLabel lblSelectAll = new JLabel("Chọn tất cả");
        lblSelectAll.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        lblSelectAll.setForeground(AppColor.PRIMARY);
        lblSelectAll.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        lblSelectAll.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                boolean allChecked = functionCheckBoxes.values().stream().allMatch(JCheckBox::isSelected);
                functionCheckBoxes.values().forEach(cb -> cb.setSelected(!allChecked));
            }
            @Override
            public void mouseEntered(MouseEvent e) {
                lblSelectAll.setForeground(AppColor.PRIMARY_HOVER);
            }
            @Override
            public void mouseExited(MouseEvent e) {
                lblSelectAll.setForeground(AppColor.PRIMARY);
            }
        });
        permHeader.add(lblSelectAll, BorderLayout.EAST);
        contentPanel.add(permHeader);
        contentPanel.add(Box.createVerticalStrut(10));

        // Checkbox grid cho các chức năng
        JPanel checkboxGrid = new JPanel(new GridLayout(0, 2, 12, 10));
        checkboxGrid.setOpaque(false);
        checkboxGrid.setAlignmentX(Component.LEFT_ALIGNMENT);

        List<FunctionDTO> functions = functionBUS.getAll();
        for (FunctionDTO fn : functions) {
            String fnName = fn.getNameFunction();
            String[] meta = FUNCTION_META.getOrDefault(fnName, new String[]{"📁", fnName});
            String displayName = FUNCTION_DISPLAY_NAME.getOrDefault(fnName, fnName);

            JPanel cbCard = createCheckboxCard(fn.getFunctionID(), meta[0], displayName, meta[1]);
            checkboxGrid.add(cbCard);
        }
        // Nếu số lẻ, thêm panel trống
        if (functions.size() % 2 != 0) {
            checkboxGrid.add(new JPanel() {{ setOpaque(false); }});
        }

        contentPanel.add(checkboxGrid);

        // Wrap content trong scrollable
        JScrollPane contentScroll = new JScrollPane(contentPanel);
        contentScroll.setBorder(null);
        contentScroll.setOpaque(false);
        contentScroll.getViewport().setOpaque(false);
        contentScroll.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);
        mainPanel.add(contentScroll, BorderLayout.CENTER);

        // === FOOTER BUTTONS ===
        JPanel footerPanel = new JPanel(new FlowLayout(FlowLayout.RIGHT, 10, 0));
        footerPanel.setOpaque(false);
        footerPanel.setBorder(BorderFactory.createEmptyBorder(16, 0, 0, 0));

        JButton btnCancel = createStyledButton("Hủy", false);
        btnCancel.addActionListener(e -> dispose());

        JButton btnSave = createStyledButton("Lưu thông tin", true);
        btnSave.addActionListener(e -> onSave());

        footerPanel.add(btnCancel);
        footerPanel.add(btnSave);
        mainPanel.add(footerPanel, BorderLayout.SOUTH);

        // Nếu chỉnh sửa, fill data
        if (editDTO != null) {
            txtTenVaiTro.setText(editDTO.getNameRoleGroup());
            txtTenVaiTro.setForeground(AppColor.TEXT_PRIMARY);
            txtMoTa.setText("");
            txtMoTa.setForeground(AppColor.TEXT_PRIMARY);

            // Lấy danh sách roleID đã gán cho nhóm quyền
            List<String> assignedRoleIDs = roleGroupBUS.getAssignedRoleIDs(editDTO.getRoleGroupID());
            // Từ roleID → lấy functionID
            Set<String> assignedFunctionIDs = new HashSet<>();
            for (String roleID : assignedRoleIDs) {
                RoleDTO role = roleBUS.getByID(roleID);
                if (role != null) {
                    assignedFunctionIDs.add(role.getFunctionID());
                }
            }
            // Tick các checkbox
            for (Map.Entry<String, JCheckBox> entry : functionCheckBoxes.entrySet()) {
                entry.getValue().setSelected(assignedFunctionIDs.contains(entry.getKey()));
            }
        }

        // Background semi-transparent
        JPanel rootPanel = new JPanel(new GridBagLayout());
        rootPanel.setOpaque(true);
        rootPanel.setBackground(new Color(0, 0, 0, 60));
        rootPanel.add(mainPanel);

        setContentPane(rootPanel);
        setBackground(new Color(0, 0, 0, 0));

        // Make rounded window
        addComponentListener(new ComponentAdapter() {
            @Override
            public void componentResized(ComponentEvent e) {
                setShape(new RoundRectangle2D.Double(0, 0, getWidth(), getHeight(), 20, 20));
            }
        });
    }

    private void onSave() {
        String tenVaiTro = txtTenVaiTro.getText().trim();
        if (tenVaiTro.isEmpty() || txtTenVaiTro.getForeground().equals(new Color(156, 163, 175))) {
            JOptionPane.showMessageDialog(this, "Vui lòng nhập tên vai trò!", "Lỗi", JOptionPane.ERROR_MESSAGE);
            txtTenVaiTro.requestFocus();
            return;
        }

        List<String> selectedFunctionIDs = new ArrayList<>();
        for (Map.Entry<String, JCheckBox> entry : functionCheckBoxes.entrySet()) {
            if (entry.getValue().isSelected()) {
                selectedFunctionIDs.add(entry.getKey());
            }
        }

        boolean success;
        String roleGroupID;

        if (editingDTO == null) {
            // Tạo mới
            roleGroupID = roleGroupBUS.generateNewID();
            RoleGroupDTO newDTO = new RoleGroupDTO();
            newDTO.setRoleGroupID(roleGroupID);
            newDTO.setNameRoleGroup(tenVaiTro);
            newDTO.setIsDeleted(0);
            success = roleGroupBUS.insert(newDTO);
        } else {
            // Cập nhật
            roleGroupID = editingDTO.getRoleGroupID();
            editingDTO.setNameRoleGroup(tenVaiTro);
            success = roleGroupBUS.update(editingDTO);
        }

        if (success) {
            // Gán quyền - xóa hết rồi gán lại
            roleGroupBUS.removeAllRoles(roleGroupID);
            List<RoleDTO> allRoles = roleBUS.getAll();
            for (String fnID : selectedFunctionIDs) {
                for (RoleDTO role : allRoles) {
                    if (role.getFunctionID().equals(fnID)) {
                        roleGroupBUS.assignRole(roleGroupID, role.getRoleID());
                    }
                }
            }
            confirmed = true;
            dispose();
        } else {
            JOptionPane.showMessageDialog(this, "Lưu thất bại! Vui lòng thử lại.", "Lỗi", JOptionPane.ERROR_MESSAGE);
        }
    }

    public boolean isConfirmed() {
        return confirmed;
    }

    // ======================== UI Helper Methods ========================

    private JPanel createFieldPanel() {
        JPanel panel = new JPanel();
        panel.setLayout(new BoxLayout(panel, BoxLayout.Y_AXIS));
        panel.setOpaque(false);
        panel.setAlignmentX(Component.LEFT_ALIGNMENT);
        panel.setMaximumSize(new Dimension(Integer.MAX_VALUE, 200));
        return panel;
    }

    private JTextField createStyledTextField(String placeholder) {
        JTextField tf = new JTextField() {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(getBackground());
                g2.fill(new RoundRectangle2D.Float(0, 0, getWidth(), getHeight(), 12, 12));
                g2.dispose();
                super.paintComponent(g);
            }

            @Override
            protected void paintBorder(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(isFocusOwner() ? AppColor.PRIMARY : AppColor.BORDER);
                g2.setStroke(new BasicStroke(isFocusOwner() ? 1.5f : 1f));
                g2.draw(new RoundRectangle2D.Float(0.5f, 0.5f, getWidth() - 1, getHeight() - 1, 12, 12));
                g2.dispose();
            }
        };
        tf.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        tf.setOpaque(false);
        tf.setBorder(BorderFactory.createEmptyBorder(10, 14, 10, 14));
        tf.setPreferredSize(new Dimension(400, 40));
        tf.setMaximumSize(new Dimension(Integer.MAX_VALUE, 40));
        tf.setAlignmentX(Component.LEFT_ALIGNMENT);

        // Placeholder
        tf.setText(placeholder);
        tf.setForeground(new Color(156, 163, 175));
        tf.addFocusListener(new FocusAdapter() {
            @Override
            public void focusGained(FocusEvent e) {
                if (tf.getForeground().equals(new Color(156, 163, 175))) {
                    tf.setText("");
                    tf.setForeground(AppColor.TEXT_PRIMARY);
                }
            }
            @Override
            public void focusLost(FocusEvent e) {
                if (tf.getText().trim().isEmpty()) {
                    tf.setText(placeholder);
                    tf.setForeground(new Color(156, 163, 175));
                }
            }
        });
        return tf;
    }

    private JPanel createCheckboxCard(String functionID, String emoji, String displayName, String description) {
        JPanel card = new JPanel(new BorderLayout(10, 0)) {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(new Color(249, 250, 251));
                g2.fill(new RoundRectangle2D.Float(0, 0, getWidth(), getHeight(), 10, 10));
                g2.dispose();
            }
        };
        card.setOpaque(false);
        card.setBorder(BorderFactory.createEmptyBorder(10, 12, 10, 12));
        card.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));

        JCheckBox cb = new JCheckBox();
        cb.setOpaque(false);
        cb.setFocusPainted(false);
        functionCheckBoxes.put(functionID, cb);

        JPanel textPanel = new JPanel();
        textPanel.setLayout(new BoxLayout(textPanel, BoxLayout.Y_AXIS));
        textPanel.setOpaque(false);

        JLabel lblTitle = new JLabel(emoji + "  " + displayName);
        lblTitle.setFont(new Font("Segoe UI", Font.BOLD, 12));
        lblTitle.setForeground(AppColor.TEXT_PRIMARY);
        lblTitle.setAlignmentX(Component.LEFT_ALIGNMENT);

        JLabel lblSub = new JLabel(description);
        lblSub.setFont(new Font("Segoe UI", Font.PLAIN, 11));
        lblSub.setForeground(AppColor.TEXT_SECONDARY);
        lblSub.setAlignmentX(Component.LEFT_ALIGNMENT);

        textPanel.add(lblTitle);
        textPanel.add(Box.createVerticalStrut(2));
        textPanel.add(lblSub);

        card.add(cb, BorderLayout.WEST);
        card.add(textPanel, BorderLayout.CENTER);

        // Click anywhere on card to toggle
        card.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                cb.setSelected(!cb.isSelected());
            }
        });

        return card;
    }

    private JButton createStyledButton(String text, boolean primary) {
        JButton btn = new JButton(text) {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

                Color bg;
                Color fg;
                if (primary) {
                    bg = getModel().isPressed() ? AppColor.PRIMARY_ACTIVE :
                         getModel().isRollover() ? AppColor.PRIMARY_HOVER : AppColor.PRIMARY;
                    fg = Color.WHITE;
                } else {
                    bg = getModel().isPressed() ? AppColor.SECONDARY_ACTIVE :
                         getModel().isRollover() ? AppColor.SECONDARY_HOVER : Color.WHITE;
                    fg = AppColor.TEXT_PRIMARY;
                }

                g2.setColor(bg);
                g2.fill(new RoundRectangle2D.Float(0, 0, getWidth(), getHeight(), 10, 10));

                if (!primary) {
                    g2.setColor(AppColor.BORDER);
                    g2.setStroke(new BasicStroke(1));
                    g2.draw(new RoundRectangle2D.Float(0.5f, 0.5f, getWidth() - 1, getHeight() - 1, 10, 10));
                }

                g2.setColor(fg);
                g2.setFont(getFont());
                FontMetrics fm = g2.getFontMetrics();
                int x = (getWidth() - fm.stringWidth(text)) / 2;
                int y = (getHeight() + fm.getAscent() - fm.getDescent()) / 2;
                g2.drawString(text, x, y);
                g2.dispose();
            }
        };
        btn.setFont(new Font("Segoe UI", Font.BOLD, 13));
        btn.setPreferredSize(new Dimension(primary ? 130 : 80, 38));
        btn.setBorderPainted(false);
        btn.setContentAreaFilled(false);
        btn.setFocusPainted(false);
        btn.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        return btn;
    }

    // Custom rounded border
    static class RoundedBorder extends AbstractBorder {
        private final int radius;
        private final Color color;

        RoundedBorder(int radius, Color color) {
            this.radius = radius;
            this.color = color;
        }

        @Override
        public void paintBorder(Component c, Graphics g, int x, int y, int width, int height) {
            Graphics2D g2 = (Graphics2D) g.create();
            g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            g2.setColor(color);
            g2.drawRoundRect(x, y, width - 1, height - 1, radius, radius);
            g2.dispose();
        }

        @Override
        public Insets getBorderInsets(Component c) {
            return new Insets(4, 8, 4, 8);
        }
    }

    // Shadow border for dialog
    static class ShadowBorder extends AbstractBorder {
        @Override
        public void paintBorder(Component c, Graphics g, int x, int y, int width, int height) {
            // Shadow handled by parent painting
        }

        @Override
        public Insets getBorderInsets(Component c) {
            return new Insets(6, 6, 6, 6);
        }
    }
}
