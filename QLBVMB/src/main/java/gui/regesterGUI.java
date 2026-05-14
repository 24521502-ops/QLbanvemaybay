package gui;

import bus.regesterBUS;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.awt.event.*;
import java.awt.geom.RoundRectangle2D;
import java.net.URL;

/**
 * Giao diện đăng ký tài khoản - SkyManage.
 * Thiết kế: Panel trái (ảnh sân bay tối), Panel phải (form đăng ký).
 *
 * @author Trần Minh Quyền
 */
public class regesterGUI extends JFrame {

    private final regesterBUS regesterBUS = new regesterBUS();

    // ──── Components ────
    private JTextField txtFullName;
    private JTextField txtEmail;
    private JTextField txtPhone;
    private JPasswordField txtPassword;
    private JPasswordField txtConfirmPassword;
    private JButton btnRegister;

    // ──── Colors (dark theme bên trái) ────
    private static final Color COLOR_LEFT_BG = new Color(0x1A1A2E);
    private static final Color COLOR_BTN = new Color(0x1C2833);
    private static final Color COLOR_BG = new Color(0xFFFFFF);
    private static final Color COLOR_FIELD_BG = new Color(0xF4F6F7);
    private static final Color COLOR_BORDER = new Color(0xD5D8DC);
    private static final Color COLOR_TEXT = new Color(0x1C2833);
    private static final Color COLOR_SUBTEXT = new Color(0x717D7E);
    private static final Color COLOR_LINK = new Color(0x2E86C1);
    private static final Font FONT_TITLE = new Font("Segoe UI", Font.BOLD, 26);
    private static final Font FONT_LABEL = new Font("Segoe UI", Font.BOLD, 11);
    private static final Font FONT_FIELD = new Font("Segoe UI", Font.PLAIN, 13);
    private static final Font FONT_BUTTON = new Font("Segoe UI", Font.BOLD, 14);
    private static final Font FONT_SMALL = new Font("Segoe UI", Font.PLAIN, 12);

    public regesterGUI() {
        initFrame();
        buildUI();
        setVisible(true);
    }

    private void initFrame() {
        setTitle("Đăng ký - Hệ thống Quản lý Vé Máy Bay");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(900, 620);
        setLocationRelativeTo(null);
        setResizable(false);
        getContentPane().setBackground(COLOR_BG);
        setLayout(new GridLayout(1, 2));
    }

    // ──────────────────────────────────────────────────
    // XÂY DỰNG GIAO DIỆN
    // ──────────────────────────────────────────────────
    private void buildUI() {
        add(buildLeftPanel());
        add(buildRightPanel());
    }

    /** Panel trái: ảnh sân bay với overlay tối */
    private JPanel buildLeftPanel() {
        JPanel panel = new JPanel() {
            private Image bgImage;
            {
                URL imgUrl = getClass().getResource("/image/regesterBVMB.png");
                if (imgUrl != null)
                    bgImage = new ImageIcon(imgUrl).getImage();
            }

            @Override
            protected void paintComponent(Graphics g) {
                super.paintComponent(g);
                Graphics2D g2 = (Graphics2D) g;
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

                if (bgImage != null) {
                    g2.drawImage(bgImage, 0, 0, getWidth(), getHeight(), this);
                } else {
                    GradientPaint gp = new GradientPaint(0, 0, COLOR_LEFT_BG, 0, getHeight(),
                            new Color(0x16213E));
                    g2.setPaint(gp);
                    g2.fillRect(0, 0, getWidth(), getHeight());
                }

                // Overlay tối toàn bộ để tăng độ tương phản với text
                g2.setColor(new Color(0, 0, 0, 120));
                g2.fillRect(0, 0, getWidth(), getHeight());

                // Overlay gradient đậm hơn ở dưới
                GradientPaint overlay = new GradientPaint(
                        0, getHeight() - 200, new Color(0, 0, 0, 40),
                        0, getHeight(), new Color(0, 0, 0, 200));
                g2.setPaint(overlay);
                g2.fillRect(0, getHeight() - 200, getWidth(), 200);
            }
        };
        panel.setLayout(null);

        // Logo + tên ứng dụng ở dưới cùng
        JLabel lblLogo = new JLabel();
        Icon planeIcon = new Icon() {
            @Override
            public void paintIcon(Component c, Graphics g, int x, int y) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.translate(x, y);
                g2.setColor(Color.WHITE);
                g2.rotate(Math.toRadians(-45), 15, 15);
                java.awt.geom.Path2D p = new java.awt.geom.Path2D.Double();
                p.moveTo(25, 15);
                p.curveTo(25, 13, 23, 13, 20, 14);
                p.lineTo(10, 5);
                p.lineTo(7, 5);
                p.lineTo(13, 14);
                p.lineTo(5, 14);
                p.lineTo(2, 10);
                p.lineTo(0, 10);
                p.lineTo(2, 15);
                p.lineTo(0, 20);
                p.lineTo(2, 20);
                p.lineTo(5, 16);
                p.lineTo(13, 16);
                p.lineTo(7, 25);
                p.lineTo(10, 25);
                p.lineTo(20, 16);
                p.curveTo(23, 17, 25, 17, 25, 15);
                p.closePath();
                g2.fill(p);
                g2.dispose();
            }
            @Override public int getIconWidth() { return 30; }
            @Override public int getIconHeight() { return 30; }
        };
        lblLogo.setIcon(planeIcon);
        lblLogo.setFont(new Font("Segoe UI", Font.BOLD, 22));
        lblLogo.setForeground(Color.WHITE);
        lblLogo.setBounds(24, 450, 40, 30);
        panel.add(lblLogo);

        JLabel lblAppName = new JLabel("TIU AIRLINES");
        lblAppName.setFont(new Font("Segoe UI", Font.BOLD, 20));
        lblAppName.setForeground(Color.WHITE);
        lblAppName.setBounds(70, 452, 160, 28);
        panel.add(lblAppName);

        JLabel lblDesc = new JLabel(
                "<html>Hệ thống quản lý hàng không toàn diện. Tạo tài<br>"
                        + "khoản để bắt đầu trải nghiệm dịch vụ của chúng tôi.</html>");
        lblDesc.setFont(new Font("Segoe UI", Font.PLAIN, 12));
        lblDesc.setForeground(new Color(200, 200, 200));
        lblDesc.setBounds(24, 484, 380, 50);
        panel.add(lblDesc);

        return panel;
    }

    /** Panel phải: form đăng ký */
    private JPanel buildRightPanel() {
        JPanel panel = new JPanel(null);
        panel.setBackground(COLOR_BG);

        int cx = 60;
        int fw = 340;
        int y = 40;

        // Tiêu đề
        JLabel lblTitle = new JLabel("Tạo tài khoản mới");
        lblTitle.setFont(FONT_TITLE);
        lblTitle.setForeground(COLOR_TEXT);
        lblTitle.setBounds(cx, y, 340, 36);
        panel.add(lblTitle);

        JLabel lblSub = new JLabel("Điền thông tin dưới đây để đăng ký.");
        lblSub.setFont(FONT_SMALL);
        lblSub.setForeground(COLOR_SUBTEXT);
        lblSub.setBounds(cx, y + 40, fw, 20);
        panel.add(lblSub);

        y += 80;

        // ─── Họ và Tên ───
        panel.add(makeLabel("HỌ VÀ TÊN", cx, y, fw));
        txtFullName = createStyledField("Nguyễn Văn A", "USER");
        txtFullName.setBounds(cx, y + 20, fw, 40);
        panel.add(txtFullName);
        y += 72;

        // ─── Email ───
        panel.add(makeLabel("EMAIL", cx, y, fw));
        txtEmail = createStyledField("nguyenvana@example.com", "EMAIL");
        txtEmail.setBounds(cx, y + 20, fw, 40);
        panel.add(txtEmail);
        y += 72;

        // ─── Số điện thoại ───
        panel.add(makeLabel("SỐ ĐIỆN THOẠI", cx, y, fw));
        txtPhone = createStyledField("0123 456 789", "PHONE");
        txtPhone.setBounds(cx, y + 20, fw, 40);
        panel.add(txtPhone);
        y += 72;

        // ─── Mật khẩu ───
        panel.add(makeLabel("MẬT KHẨU", cx, y, fw));
        txtPassword = createStyledPassword("PASSWORD");
        txtPassword.setBounds(cx, y + 20, fw, 40);
        panel.add(txtPassword);
        y += 72;

        // ─── Xác nhận mật khẩu ───
        panel.add(makeLabel("XÁC NHẬN MẬT KHẨU", cx, y, fw));
        txtConfirmPassword = createStyledPassword("CONFIRM_PASSWORD");
        txtConfirmPassword.setBounds(cx, y + 20, fw, 40);
        panel.add(txtConfirmPassword);
        y += 68;

        // ─── Nút Đăng ký ───
        btnRegister = createStyledButton("Đăng ký", COLOR_BTN, Color.WHITE);
        btnRegister.setBounds(cx, y, fw, 44);
        panel.add(btnRegister);

        y += 60;

        // ─── Link đăng nhập ───
        JLabel lblPrompt = new JLabel("Đã có tài khoản?");
        lblPrompt.setFont(FONT_SMALL);
        lblPrompt.setForeground(COLOR_SUBTEXT);
        lblPrompt.setBounds(cx, y, 130, 20);
        panel.add(lblPrompt);

        JLabel lblLogin = new JLabel("<html><u>Đăng nhập</u></html>");
        lblLogin.setFont(new Font("Segoe UI", Font.BOLD, 12));
        lblLogin.setForeground(COLOR_LINK);
        lblLogin.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        lblLogin.setBounds(cx + 132, y, 90, 20);
        panel.add(lblLogin);

        // ─── Sự kiện ───
        btnRegister.addActionListener(e -> handleRegister());
        lblLogin.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                openLogin();
            }
        });

        return panel;
    }

    // ──────────────────────────────────────────────────
    // XỬ LÝ SỰ KIỆN
    // ──────────────────────────────────────────────────
    private void handleRegister() {
        String fullName = getFieldText(txtFullName, "Nguyễn Văn A");
        String email = getFieldText(txtEmail, "nguyenvana@example.com");
        String phone = getFieldText(txtPhone, "0123 456 789");
        String password = new String(txtPassword.getPassword()).trim();
        String confirmPassword = new String(txtConfirmPassword.getPassword()).trim();

        String error = regesterBUS.register(fullName, email, phone, password, confirmPassword);
        if (error != null) {
            showError(error);
        } else {
            JOptionPane.showMessageDialog(this,
                    "Đăng ký thành công!\nBạn có thể đăng nhập ngay bây giờ.",
                    "Thành công", JOptionPane.INFORMATION_MESSAGE);
            openLogin();
        }
    }

    /** Lấy text thực, loại bỏ placeholder */
    private String getFieldText(JTextField field, String placeholder) {
        String text = field.getText().trim();
        return text.equals(placeholder) ? "" : text;
    }

    private void openLogin() {
        new loginGUI();
        dispose();
    }

    private void showError(String msg) {
        JOptionPane.showMessageDialog(this, msg, "Lỗi", JOptionPane.ERROR_MESSAGE);
    }

    // ──────────────────────────────────────────────────
    // HELPER TẠO COMPONENTS
    // ──────────────────────────────────────────────────
    private JLabel makeLabel(String text, int x, int y, int w) {
        JLabel lbl = new JLabel(text);
        lbl.setFont(FONT_LABEL);
        lbl.setForeground(COLOR_SUBTEXT);
        lbl.setBounds(x, y, w, 16);
        return lbl;
    }

    private void drawVectorIcon(Graphics2D g2, String type, int x, int y, int size, boolean isFocused) {
        g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        g2.setStroke(new BasicStroke(1.5f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND));
        
        g2.setColor(isFocused ? COLOR_LINK : COLOR_SUBTEXT);
        
        int pad = 2;
        int w = size - pad * 2;
        int h = size - pad * 2;
        int cx = x + pad;
        int cy = y + pad;

        if ("EMAIL".equals(type)) {
            g2.drawRoundRect(cx, cy + 2, w, h - 5, 3, 3);
            java.awt.geom.Path2D path = new java.awt.geom.Path2D.Double();
            path.moveTo(cx, cy + 4);
            path.lineTo(cx + w / 2.0, cy + h / 2.0 + 1);
            path.lineTo(cx + w, cy + 4);
            g2.draw(path);
        } else if ("PASSWORD".equals(type) || "CONFIRM_PASSWORD".equals(type)) {
            g2.drawRoundRect(cx + 2, cy + 7, w - 4, h - 8, 2, 2);
            g2.drawArc(cx + 4, cy + 1, w - 8, 12, 0, 180);
            g2.fillOval(cx + w / 2 - 1, cy + h / 2 + 2, 2, 2);
            g2.drawLine(cx + w / 2, cy + h / 2 + 4, cx + w / 2, cy + h - 2);
        } else if ("USER".equals(type)) {
            g2.drawOval(cx + 3, cy + 1, w - 6, w - 6);
            java.awt.geom.Path2D path = new java.awt.geom.Path2D.Double();
            path.moveTo(cx, cy + h);
            path.quadTo(cx + w / 2.0, cy + h - 8, cx + w, cy + h);
            g2.draw(path);
        } else if ("PHONE".equals(type)) {
            g2.drawRoundRect(cx + 4, cy, w - 8, h, 4, 4);
            g2.drawLine(cx + w / 2 - 2, cy + h - 3, cx + w / 2 + 2, cy + h - 3);
        }
    }

    private JTextField createStyledField(String placeholder, String iconType) {
        JTextField field = new JTextField() {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(getBackground());
                g2.fill(new RoundRectangle2D.Float(0, 0, getWidth() - 1, getHeight() - 1, 10, 10));
                super.paintComponent(g);
                
                int iconSize = 20;
                int iconY = (getHeight() - iconSize) / 2;
                
                if (getText().equals(placeholder) || getText().trim().isEmpty()) {
                    g2.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER, 0.6f));
                }
                drawVectorIcon(g2, iconType, 12, iconY, iconSize, hasFocus() || (!getText().equals(placeholder) && !getText().isEmpty()));
                g2.dispose();
            }

            @Override
            protected void paintBorder(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(hasFocus() ? COLOR_LINK : COLOR_BORDER);
                g2.draw(new RoundRectangle2D.Float(0, 0, getWidth() - 1, getHeight() - 1, 10, 10));
                g2.dispose();
            }
        };
        field.setOpaque(false);
        field.setBackground(COLOR_FIELD_BG);
        field.setFont(FONT_FIELD);
        field.setForeground(COLOR_SUBTEXT);
        field.setBorder(new EmptyBorder(8, 40, 8, 12));
        field.setText(placeholder);
        field.addFocusListener(new FocusAdapter() {
            @Override
            public void focusGained(FocusEvent e) {
                if (field.getText().equals(placeholder)) {
                    field.setText("");
                    field.setForeground(COLOR_TEXT);
                }
                field.repaint();
            }

            @Override
            public void focusLost(FocusEvent e) {
                if (field.getText().trim().isEmpty()) {
                    field.setText(placeholder);
                    field.setForeground(COLOR_SUBTEXT);
                }
                field.repaint();
            }
        });
        return field;
    }

    private JPasswordField createStyledPassword(String iconType) {
        JPasswordField field = new JPasswordField() {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(getBackground());
                g2.fill(new RoundRectangle2D.Float(0, 0, getWidth() - 1, getHeight() - 1, 10, 10));
                super.paintComponent(g);
                
                int iconSize = 20;
                int iconY = (getHeight() - iconSize) / 2;
                
                if (getPassword().length == 0) {
                    g2.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_OVER, 0.6f));
                }
                drawVectorIcon(g2, iconType, 12, iconY, iconSize, hasFocus() || getPassword().length > 0);
                g2.dispose();
            }

            @Override
            protected void paintBorder(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(hasFocus() ? COLOR_LINK : COLOR_BORDER);
                g2.draw(new RoundRectangle2D.Float(0, 0, getWidth() - 1, getHeight() - 1, 10, 10));
                g2.dispose();
            }
        };
        field.setOpaque(false);
        field.setBackground(COLOR_FIELD_BG);
        field.setFont(FONT_FIELD);
        field.setBorder(new EmptyBorder(8, 40, 8, 12));
        field.setEchoChar('●');
        field.addFocusListener(new FocusAdapter() {
            @Override public void focusGained(FocusEvent e) { field.repaint(); }
            @Override public void focusLost(FocusEvent e) { field.repaint(); }
        });
        return field;
    }

    private JButton createStyledButton(String text, Color bg, Color fg) {
        JButton btn = new JButton(text) {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                if (getModel().isPressed())
                    g2.setColor(bg.darker());
                else if (getModel().isRollover())
                    g2.setColor(bg.brighter());
                else
                    g2.setColor(bg);
                g2.fill(new RoundRectangle2D.Float(0, 0, getWidth() - 1, getHeight() - 1, 12, 12));
                g2.dispose();
                super.paintComponent(g);
            }

            @Override
            protected void paintBorder(Graphics g) {
            }
        };
        btn.setFont(FONT_BUTTON);
        btn.setForeground(fg);
        btn.setOpaque(false);
        btn.setContentAreaFilled(false);
        btn.setBorderPainted(false);
        btn.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        btn.setFocusPainted(false);
        return btn;
    }
}
