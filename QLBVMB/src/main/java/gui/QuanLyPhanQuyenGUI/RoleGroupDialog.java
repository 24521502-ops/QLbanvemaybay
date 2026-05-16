package gui.QuanLyPhanQuyenGUI;

import dto.FunctionDTO;
import dto.RoleDTO;
import dto.RoleGroupDTO;
import util.AppColor;
import javax.swing.*;

import bus.QuanLyPhanQuyenBUS.FunctionBUS;
import bus.QuanLyPhanQuyenBUS.RoleBUS;
import bus.QuanLyPhanQuyenBUS.RoleGroupBUS;

import java.awt.*;
import java.awt.event.*;
import java.awt.geom.AffineTransform;
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

    private RoleGroupDTO editingDTO = null;

    public RoleGroupDialog(Frame parent, RoleGroupDTO editDTO) {
        super(parent, true);
        this.editingDTO = editDTO;
        setTitle(editDTO == null ? "Tạo vai trò mới" : "Chỉnh sửa vai trò");
        setUndecorated(true);
        setSize(680, 680);
        setLocationRelativeTo(parent);

        // Khung chính
        JPanel mainPanel = new JPanel(new BorderLayout(0, 15)) {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(Color.WHITE);
                g2.fill(new RoundRectangle2D.Float(0, 0, getWidth(), getHeight(), 20, 20));

                g2.setColor(new Color(226, 232, 240));
                g2.setStroke(new BasicStroke(1f));
                g2.draw(new RoundRectangle2D.Float(0, 0, getWidth() - 1, getHeight() - 1, 20, 20));
                g2.dispose();
            }
        };
        mainPanel.setOpaque(false);
        mainPanel.setBorder(BorderFactory.createEmptyBorder(20, 24, 20, 24));

        // === HEADER ===
        JPanel headerPanel = new JPanel(new BorderLayout());
        headerPanel.setOpaque(false);
        JLabel titleLabel = new JLabel(editDTO == null ? "Tạo vai trò mới" : "Chỉnh sửa vai trò");
        titleLabel.setFont(new Font("Segoe UI", Font.BOLD, 20));
        titleLabel.setForeground(AppColor.TEXT_PRIMARY);
        headerPanel.add(titleLabel, BorderLayout.WEST);

        JButton btnClose = new JButton() {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                if (getModel().isRollover()) {
                    g2.setColor(new Color(239, 68, 68, 20));
                    g2.fillOval(0, 0, getWidth(), getHeight());
                }
                g2.setColor(getModel().isRollover() ? AppColor.ERROR : new Color(100, 116, 139));
                g2.setStroke(new BasicStroke(2f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND));

                int w = getWidth();
                int h = getHeight();
                int padding = 10;
                g2.drawLine(padding, padding, w - padding, h - padding);
                g2.drawLine(w - padding, padding, padding, h - padding);
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

        JPanel headerWrapper = new JPanel(new BorderLayout());
        headerWrapper.setOpaque(false);
        headerWrapper.add(headerPanel, BorderLayout.CENTER);
        JSeparator headerSep = new JSeparator();
        headerSep.setForeground(new Color(241, 245, 249));
        headerWrapper.add(headerSep, BorderLayout.SOUTH);
        headerWrapper.setBorder(BorderFactory.createEmptyBorder(0, 0, 10, 0));

        mainPanel.add(headerWrapper, BorderLayout.NORTH);

        // === CONTENT ===
        JPanel contentPanel = new JPanel();
        contentPanel.setOpaque(false);
        contentPanel.setLayout(new BoxLayout(contentPanel, BoxLayout.Y_AXIS));
        contentPanel.setBorder(BorderFactory.createEmptyBorder(0, 0, 10, 5));

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
        nameLabelPanel.setMaximumSize(new Dimension(Integer.MAX_VALUE, 22));

        namePanel.add(nameLabelPanel);
        namePanel.add(Box.createVerticalStrut(2));

        txtTenVaiTro = createStyledTextField("Nhập tên vai trò (VD: Quản lý chi nhánh)");
        namePanel.add(txtTenVaiTro);
        contentPanel.add(namePanel);
        contentPanel.add(Box.createVerticalStrut(16));

        // --- Mô tả ---
        JPanel descPanel = createFieldPanel();
        JLabel lblDesc = new JLabel("Mô tả");
        lblDesc.setFont(new Font("Segoe UI", Font.BOLD, 13));
        lblDesc.setForeground(AppColor.TEXT_PRIMARY);
        lblDesc.setAlignmentX(Component.LEFT_ALIGNMENT);
        lblDesc.setMaximumSize(new Dimension(Integer.MAX_VALUE, 22));

        descPanel.add(lblDesc);
        descPanel.add(Box.createVerticalStrut(2));

        txtMoTa = new JTextArea(3, 30);
        txtMoTa.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        txtMoTa.setLineWrap(true);
        txtMoTa.setWrapStyleWord(true);
        txtMoTa.setOpaque(false);
        txtMoTa.setBorder(BorderFactory.createEmptyBorder(10, 14, 10, 14));

        txtMoTa.setText("Mô tả quyền hạn và trách nhiệm của vai trò này");
        txtMoTa.setForeground(new Color(156, 163, 175));

        JScrollPane scrollMoTa = new JScrollPane(txtMoTa);
        scrollMoTa.setBorder(null);
        scrollMoTa.setOpaque(false);
        scrollMoTa.getViewport().setOpaque(false);

        JPanel taWrapper = new JPanel(new BorderLayout()) {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(Color.WHITE);
                g2.fill(new RoundRectangle2D.Float(0, 0, getWidth(), getHeight(), 8, 8));
                g2.dispose();
            }

            @Override
            protected void paintBorder(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(txtMoTa.isFocusOwner() ? AppColor.PRIMARY : new Color(156, 163, 175));
                g2.setStroke(new BasicStroke(txtMoTa.isFocusOwner() ? 1.5f : 1f));
                g2.draw(new RoundRectangle2D.Float(0.5f, 0.5f, getWidth() - 1, getHeight() - 1, 8, 8));
                g2.dispose();
            }
        };
        taWrapper.setOpaque(false);
        taWrapper.setMaximumSize(new Dimension(Integer.MAX_VALUE, 100));
        taWrapper.setPreferredSize(new Dimension(400, 100));
        taWrapper.setAlignmentX(Component.LEFT_ALIGNMENT);
        taWrapper.add(scrollMoTa, BorderLayout.CENTER);

        txtMoTa.addFocusListener(new FocusAdapter() {
            @Override
            public void focusGained(FocusEvent e) {
                taWrapper.repaint();
                if (txtMoTa.getForeground().equals(new Color(156, 163, 175))) {
                    txtMoTa.setText("");
                    txtMoTa.setForeground(AppColor.TEXT_PRIMARY);
                }
            }

            @Override
            public void focusLost(FocusEvent e) {
                taWrapper.repaint();
                if (txtMoTa.getText().trim().isEmpty()) {
                    txtMoTa.setText("Mô tả quyền hạn và trách nhiệm của vai trò này");
                    txtMoTa.setForeground(new Color(156, 163, 175));
                }
            }
        });

        descPanel.add(taWrapper);
        contentPanel.add(descPanel);
        contentPanel.add(Box.createVerticalStrut(20));

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
            String fnID = fn.getFunctionID() != null ? fn.getFunctionID() : "";
            String fnName = fn.getNameFunction() != null ? fn.getNameFunction() : "";

            String iconKey = "DEFAULT";
            String displayName = fnName;
            String description = "Chức năng hệ thống";
            String searchStr = (fnID + "_" + fnName).toUpperCase();

            if (searchStr.contains("FLIGHT") || searchStr.contains("BAY")) {
                iconKey = "FLIGHT";
                displayName = "Chuyến bay";
                description = "Quản lý lịch trình, trạng thái bay";
            } else if (searchStr.contains("BOOKING") || searchStr.contains("ĐẶT CHỖ")
                    || searchStr.contains("DAT CHO")) {
                iconKey = "BOOKING";
                displayName = "Đặt chỗ";
                description = "Xử lý đặt chỗ, hủy chỗ";
            } else if (searchStr.contains("TICKET") || searchStr.contains("VÉ") || searchStr.contains("VE")) {
                iconKey = "TICKET";
                displayName = "Vé";
                description = "Phát hành, hoàn đổi vé";
            } else if (searchStr.contains("EMPLOYEE") || searchStr.contains("NHÂN VIÊN")
                    || searchStr.contains("NHAN VIEN")) {
                iconKey = "EMPLOYEE";
                displayName = "Nhân viên";
                description = "Quản lý hồ sơ, kíp trực";
            } else if (searchStr.contains("CUSTOMER") || searchStr.contains("KHÁCH HÀNG")
                    || searchStr.contains("KHACH HANG")) {
                iconKey = "CUSTOMER";
                displayName = "Khách hàng";
                description = "Quản lý thông tin hành khách";
            } else if (searchStr.contains("SYSTEM") || searchStr.contains("DỮ LIỆU") || searchStr.contains("HỆ THỐNG")
                    || searchStr.contains("GỐC")) {
                iconKey = "SYSTEM";
                displayName = "Dữ liệu gốc";
                description = "Quản lý sân bay, máy bay";
            } else if (searchStr.contains("DASHBOARD") || searchStr.contains("BÁO CÁO")
                    || searchStr.contains("THỐNG KÊ")) {
                iconKey = "DASHBOARD";
                displayName = "Báo cáo";
                description = "Báo cáo, thống kê";
            }

            JPanel cbCard = createCheckboxCard(fnID, iconKey, displayName, description);
            checkboxGrid.add(cbCard);
        }

        if (functions.size() % 2 != 0) {
            checkboxGrid.add(new JPanel() {
                {
                    setOpaque(false);
                }
            });
        }

        contentPanel.add(checkboxGrid);

        contentPanel.add(Box.createVerticalGlue());

        // Wrap content trong scrollable
        JScrollPane contentScroll = new JScrollPane(contentPanel);
        contentScroll.setBorder(null);
        contentScroll.setOpaque(false);
        contentScroll.getViewport().setOpaque(false);
        contentScroll.getVerticalScrollBar().setPreferredSize(new Dimension(6, 0));
        contentScroll.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_NEVER);

        mainPanel.add(contentScroll, BorderLayout.CENTER);

        // === FOOTER ===
        JPanel footerWrapper = new JPanel(new BorderLayout());
        footerWrapper.setOpaque(false);

        // Separator line
        JSeparator sep = new JSeparator();
        sep.setForeground(new Color(241, 245, 249));
        footerWrapper.add(sep, BorderLayout.NORTH);

        JPanel footerPanel = new JPanel(new FlowLayout(FlowLayout.RIGHT, 12, 0));
        footerPanel.setOpaque(false);
        footerPanel.setBorder(BorderFactory.createEmptyBorder(16, 0, 0, 0));

        JButton btnCancel = createStyledButton("Hủy", false);
        btnCancel.addActionListener(e -> dispose());

        JButton btnSave = createStyledButton("Lưu thông tin", true);
        btnSave.addActionListener(e -> onSave());

        footerPanel.add(btnCancel);
        footerPanel.add(btnSave);
        footerWrapper.add(footerPanel, BorderLayout.CENTER);

        mainPanel.add(footerWrapper, BorderLayout.SOUTH);

        if (editDTO != null) {
            txtTenVaiTro.setText(editDTO.getNameRoleGroup());
            txtTenVaiTro.setForeground(AppColor.TEXT_PRIMARY);
            txtMoTa.setText("");
            txtMoTa.setForeground(AppColor.TEXT_PRIMARY);

            List<String> assignedRoleIDs = roleGroupBUS.getAssignedRoleIDs(editDTO.getRoleGroupID());
            Set<String> assignedFunctionIDs = new HashSet<>();
            for (String roleID : assignedRoleIDs) {
                RoleDTO role = roleBUS.getByID(roleID);
                if (role != null) {
                    assignedFunctionIDs.add(role.getFunctionID());
                }
            }
            for (Map.Entry<String, JCheckBox> entry : functionCheckBoxes.entrySet()) {
                entry.getValue().setSelected(assignedFunctionIDs.contains(entry.getKey()));
            }
        }

        setContentPane(mainPanel);
        setBackground(new Color(0, 0, 0, 0));

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
            roleGroupID = roleGroupBUS.generateNewID();
            RoleGroupDTO newDTO = new RoleGroupDTO();
            newDTO.setRoleGroupID(roleGroupID);
            newDTO.setNameRoleGroup(tenVaiTro);
            newDTO.setIsDeleted(0);
            success = roleGroupBUS.insert(newDTO);
        } else {
            roleGroupID = editingDTO.getRoleGroupID();
            editingDTO.setNameRoleGroup(tenVaiTro);
            success = roleGroupBUS.update(editingDTO);
        }

        if (success) {
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

    private JPanel createFieldPanel() {
        JPanel panel = new JPanel();
        panel.setLayout(new BoxLayout(panel, BoxLayout.Y_AXIS));
        panel.setOpaque(false);
        panel.setAlignmentX(Component.LEFT_ALIGNMENT);
        return panel;
    }

    private JTextField createStyledTextField(String placeholder) {
        JTextField tf = new JTextField() {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(getBackground());
                g2.fill(new RoundRectangle2D.Float(0, 0, getWidth(), getHeight(), 8, 8));
                g2.dispose();
                super.paintComponent(g);
            }

            @Override
            protected void paintBorder(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(isFocusOwner() ? AppColor.PRIMARY : new Color(156, 163, 175));
                g2.setStroke(new BasicStroke(isFocusOwner() ? 1.5f : 1f));
                g2.draw(new RoundRectangle2D.Float(0.5f, 0.5f, getWidth() - 1, getHeight() - 1, 8, 8));
                g2.dispose();
            }
        };
        tf.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        tf.setOpaque(false);
        tf.setBorder(BorderFactory.createEmptyBorder(10, 14, 10, 14));
        tf.setMaximumSize(new Dimension(Integer.MAX_VALUE, 40));
        tf.setPreferredSize(new Dimension(400, 40));
        tf.setAlignmentX(Component.LEFT_ALIGNMENT);

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

    private JPanel createCheckboxCard(String functionID, String iconKey, String displayName, String description) {
        // Thay đổi sang GridBagLayout để kiểm soát trục dọc tốt nhất
        JPanel card = new JPanel(new GridBagLayout()) {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(new Color(248, 250, 252));
                g2.fill(new RoundRectangle2D.Float(0, 0, getWidth() - 1, getHeight() - 1, 8, 8));
                g2.setColor(new Color(226, 232, 240));
                g2.draw(new RoundRectangle2D.Float(0, 0, getWidth() - 1, getHeight() - 1, 8, 8));
                g2.dispose();
            }
        };
        card.setOpaque(false);
        // Căn chỉnh khoảng cách biên trong của Card
        card.setBorder(BorderFactory.createEmptyBorder(10, 14, 10, 14));
        card.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));

        JCheckBox cb = new JCheckBox();
        cb.setOpaque(false);
        cb.setFocusPainted(false);
        functionCheckBoxes.put(functionID, cb);

        JPanel iconPanel = new JPanel() {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(new Color(71, 85, 105));
                g2.setStroke(new BasicStroke(1.4f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND));

                int cx = getWidth() / 2;
                int cy = getHeight() / 2;

                switch (iconKey) {
                    case "FLIGHT":
                        AffineTransform oldAt = g2.getTransform();
                        g2.rotate(-Math.PI / 4, cx, cy);
                        g2.drawLine(cx - 6, cy, cx + 5, cy);
                        g2.drawLine(cx - 2, cy - 4, cx + 1, cy);
                        g2.drawLine(cx - 2, cy + 4, cx + 1, cy);
                        g2.drawLine(cx - 6, cy - 2, cx - 5, cy);
                        g2.drawLine(cx - 6, cy + 2, cx - 5, cy);
                        g2.setTransform(oldAt);
                        break;
                    case "BOOKING":
                        g2.drawRoundRect(cx - 7, cy - 5, 14, 10, 2, 2);
                        g2.drawLine(cx - 2, cy - 5, cx - 2, cy - 3);
                        g2.drawLine(cx - 2, cy - 1, cx - 2, cy + 1);
                        g2.drawLine(cx - 2, cy + 3, cx - 2, cy + 5);
                        break;
                    case "TICKET":
                        g2.drawRect(cx - 5, cy - 6, 10, 12);
                        g2.drawLine(cx - 2, cy - 3, cx + 2, cy - 3);
                        g2.drawLine(cx - 2, cy, cx + 2, cy);
                        g2.drawLine(cx - 2, cy + 3, cx + 2, cy + 3);
                        break;
                    case "EMPLOYEE":
                        g2.drawRoundRect(cx - 5, cy - 6, 10, 12, 2, 2);
                        g2.drawOval(cx - 2, cy - 8, 4, 2);
                        g2.drawOval(cx - 2, cy - 4, 4, 4);
                        g2.drawArc(cx - 4, cy, 8, 6, 0, 180);
                        break;
                    case "CUSTOMER":
                        g2.drawOval(cx - 4, cy - 3, 4, 4);
                        g2.drawArc(cx - 6, cy + 1, 8, 8, 0, 180);
                        g2.drawOval(cx + 1, cy - 4, 3, 3);
                        g2.drawArc(cx, cy - 1, 6, 6, 0, 180);
                        break;
                    case "SYSTEM":
                        g2.drawOval(cx - 5, cy - 6, 10, 4);
                        g2.drawLine(cx - 5, cy - 4, cx - 5, cy + 4);
                        g2.drawLine(cx + 5, cy - 4, cx + 5, cy + 4);
                        g2.drawArc(cx - 5, cy - 2, 10, 4, 180, 180);
                        g2.drawArc(cx - 5, cy + 2, 10, 4, 180, 180);
                        break;
                    case "DASHBOARD":
                        g2.drawLine(cx - 6, cy + 5, cx + 6, cy + 5);
                        g2.drawRect(cx - 5, cy - 1, 3, 6);
                        g2.drawRect(cx - 1, cy - 5, 3, 10);
                        g2.drawRect(cx + 3, cy + 1, 3, 4);
                        break;
                    default:
                        g2.drawRect(cx - 5, cy - 5, 10, 10);
                        break;
                }
                g2.dispose();
            }
        };
        iconPanel.setPreferredSize(new Dimension(20, 20));
        iconPanel.setOpaque(false);

        JLabel lblTitle = new JLabel(displayName);
        lblTitle.setFont(new Font("Segoe UI", Font.BOLD, 12));
        lblTitle.setForeground(AppColor.TEXT_PRIMARY);

        JLabel lblSub = new JLabel(description);
        lblSub.setFont(new Font("Segoe UI", Font.PLAIN, 11));
        lblSub.setForeground(AppColor.TEXT_SECONDARY);

        // Layout ép các đối tượng vào đúng tâm trục Y
        GridBagConstraints gbc = new GridBagConstraints();

        // 1. Checkbox
        gbc.gridx = 0;
        gbc.gridy = 0;
        gbc.gridheight = 2; // Checkbox kéo dài qua 2 dòng văn bản -> tự động căn chính giữa
        gbc.anchor = GridBagConstraints.CENTER;
        gbc.insets = new Insets(0, 0, 0, 4); // Cách bên phải 4px
        card.add(cb, gbc);

        // 2. Icon
        gbc.gridx = 1;
        gbc.gridy = 0;
        gbc.gridheight = 2; // Icon kéo dài qua 2 dòng văn bản -> tự động căn chính giữa
        gbc.anchor = GridBagConstraints.CENTER;
        gbc.insets = new Insets(0, 0, 0, 10); // Cách văn bản 10px
        card.add(iconPanel, gbc);

        // 3. Tiêu đề
        gbc.gridx = 2;
        gbc.gridy = 0;
        gbc.gridheight = 1;
        gbc.weightx = 1.0;
        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.anchor = GridBagConstraints.SOUTHWEST;
        gbc.insets = new Insets(0, 0, 2, 0); // Đẩy tiêu đề lên 2px cho thông thoáng
        card.add(lblTitle, gbc);

        // 4. Mô tả
        gbc.gridx = 2;
        gbc.gridy = 1;
        gbc.gridheight = 1;
        gbc.weightx = 1.0;
        gbc.fill = GridBagConstraints.HORIZONTAL;
        gbc.anchor = GridBagConstraints.NORTHWEST;
        gbc.insets = new Insets(0, 0, 0, 0);
        card.add(lblSub, gbc);

        // Sự kiện click toàn bộ thẻ
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
                    bg = getModel().isPressed() ? AppColor.PRIMARY_ACTIVE
                            : getModel().isRollover() ? AppColor.PRIMARY_HOVER : AppColor.PRIMARY;
                    fg = Color.WHITE;
                } else {
                    bg = getModel().isPressed() ? AppColor.SECONDARY_ACTIVE
                            : getModel().isRollover() ? AppColor.SECONDARY_HOVER : Color.WHITE;
                    fg = AppColor.TEXT_PRIMARY;
                }

                g2.setColor(bg);
                g2.fill(new RoundRectangle2D.Float(0, 0, getWidth(), getHeight(), 6, 6));

                if (!primary) {
                    g2.setColor(AppColor.BORDER);
                    g2.setStroke(new BasicStroke(1));
                    g2.draw(new RoundRectangle2D.Float(0.5f, 0.5f, getWidth() - 1, getHeight() - 1, 6, 6));
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
        btn.setPreferredSize(new Dimension(primary ? 130 : 80, 36));
        btn.setBorderPainted(false);
        btn.setContentAreaFilled(false);
        btn.setFocusPainted(false);
        btn.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        return btn;
    }
}