package gui.LoginRegesterGUI;

import bus.LoginRegesterBUS.loginBUS;
import dto.AccountDTO;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.awt.event.*;
import java.awt.geom.RoundRectangle2D;
import java.net.URL;

/**
 * Giao diện đăng nhập - SkyManage.
 * Thiết kế: Panel trái (ảnh sân bay tối), Panel phải (form đăng nhập).
 *
 * @author Trần Minh Quyền
 */
public class loginGUI extends JFrame {

    private final loginBUS loginBUS = new loginBUS();

    // ──── Components ────
    private JTextField     txtUserName;
    private JPasswordField txtPassword;
    private JButton        btnLogin;
    private JCheckBox      chkShowPassword;

    // ──── Colors ────
    private static final Color COLOR_BG       = new Color(0xFFFFFF);
    private static final Color COLOR_FIELD_BG = new Color(0xF4F6F7);
    private static final Color COLOR_BORDER   = new Color(0xD5D8DC);
    private static final Color COLOR_TEXT     = new Color(0x1C2833);
    private static final Color COLOR_SUBTEXT  = new Color(0x717D7E);
    private static final Color COLOR_LINK     = new Color(0x2E86C1);
    private static final Color COLOR_BTN      = new Color(0x1C2833);

    // ──── Fonts ────
    private static final Font FONT_TITLE  = new Font("Segoe UI", Font.BOLD, 28);
    private static final Font FONT_LABEL  = new Font("Segoe UI", Font.BOLD, 11);
    private static final Font FONT_FIELD  = new Font("Segoe UI", Font.PLAIN, 13);
    private static final Font FONT_BUTTON = new Font("Segoe UI", Font.BOLD, 14);
    private static final Font FONT_SMALL  = new Font("Segoe UI", Font.PLAIN, 12);

    public loginGUI() {
        initFrame();
        buildUI();
        setVisible(true);
    }

    private void initFrame() {
        setTitle("Đăng nhập - Hệ thống Quản lý Vé Máy Bay");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(900, 560);
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
                URL imgUrl = getClass().getResource("/image/loginBVMBpng.png");
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
                    GradientPaint gp = new GradientPaint(0, 0, new Color(0x1A1A2E),
                            0, getHeight(), new Color(0x16213E));
                    g2.setPaint(gp);
                    g2.fillRect(0, 0, getWidth(), getHeight());
                }

                // Overlay tối để tăng tương phản
                g2.setColor(new Color(0, 0, 0, 120));
                g2.fillRect(0, 0, getWidth(), getHeight());

                // Gradient đậm hơn ở dưới
                GradientPaint overlay = new GradientPaint(
                        0, getHeight() - 200, new Color(0, 0, 0, 40),
                        0, getHeight(), new Color(0, 0, 0, 200));
                g2.setPaint(overlay);
                g2.fillRect(0, getHeight() - 200, getWidth(), 200);
            }
        };
        panel.setLayout(null);

        // Logo + tên app
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
        lblLogo.setBounds(24, 390, 40, 30);
        panel.add(lblLogo);

        JLabel lblAppName = new JLabel("TIU AIRLINES");
        lblAppName.setFont(new Font("Segoe UI", Font.BOLD, 20));
        lblAppName.setForeground(Color.WHITE);
        lblAppName.setBounds(70, 392, 200, 28);
        panel.add(lblAppName);

        JLabel lblDesc = new JLabel(
                "<html>Hệ thống quản lý hàng không toàn diện.<br>"
                + "Đăng nhập để tiếp tục hành trình của bạn.</html>");
        lblDesc.setFont(new Font("Segoe UI", Font.PLAIN, 12));
        lblDesc.setForeground(new Color(200, 200, 200));
        lblDesc.setBounds(24, 426, 380, 50);
        panel.add(lblDesc);

        return panel;
    }

    /** Panel phải: form đăng nhập */
    private JPanel buildRightPanel() {
        JPanel panel = new JPanel(null);
        panel.setBackground(COLOR_BG);

        int cx = 70;
        int fw = 320;
        int y  = 80;

        // ─── Tiêu đề ───
        JLabel lblTitle = new JLabel("Chào mừng trở lại!");
        lblTitle.setFont(FONT_TITLE);
        lblTitle.setForeground(COLOR_TEXT);
        lblTitle.setBounds(cx, y, 380, 38);
        panel.add(lblTitle);

        JLabel lblSub = new JLabel("Đăng nhập để tiếp tục sử dụng TIU AIRLINES.");
        lblSub.setFont(FONT_SMALL);
        lblSub.setForeground(COLOR_SUBTEXT);
        lblSub.setBounds(cx, y + 44, fw + 40, 20);
        panel.add(lblSub);

        y += 100;

        // ─── Tên đăng nhập ───
        panel.add(makeLabel("TÊN ĐĂNG NHẬP (EMAIL)", cx, y, fw));
        txtUserName = createStyledField("email@example.com", "EMAIL");
        txtUserName.setBounds(cx, y + 20, fw, 42);
        panel.add(txtUserName);
        y += 80;

        // ─── Mật khẩu ───
        panel.add(makeLabel("MẬT KHẨU", cx, y, fw));
        txtPassword = createStyledPassword("PASSWORD");
        txtPassword.setBounds(cx, y + 20, fw, 42);
        panel.add(txtPassword);
        y += 72;

        // ─── Checkbox hiện mật khẩu ───
        chkShowPassword = new JCheckBox("Hiện mật khẩu");
        chkShowPassword.setFont(FONT_SMALL);
        chkShowPassword.setForeground(COLOR_SUBTEXT);
        chkShowPassword.setBackground(COLOR_BG);
        chkShowPassword.setFocusPainted(false);
        chkShowPassword.setBounds(cx, y, 160, 24);
        chkShowPassword.addActionListener(e -> {
            if (chkShowPassword.isSelected())
                txtPassword.setEchoChar((char) 0);
            else
                txtPassword.setEchoChar('●');
        });
        panel.add(chkShowPassword);
        y += 40;

        // ─── Nút đăng nhập ───
        btnLogin = createStyledButton("Đăng nhập", COLOR_BTN, Color.WHITE);
        btnLogin.setBounds(cx, y, fw, 44);
        panel.add(btnLogin);
        y += 60;

        // ─── Link đăng ký ───
        JLabel lblPrompt = new JLabel("Chưa có tài khoản?");
        lblPrompt.setFont(FONT_SMALL);
        lblPrompt.setForeground(COLOR_SUBTEXT);
        lblPrompt.setBounds(cx, y, 145, 20);
        panel.add(lblPrompt);

        JLabel lblRegister = new JLabel("<html><u>Đăng ký ngay</u></html>");
        lblRegister.setFont(new Font("Segoe UI", Font.BOLD, 12));
        lblRegister.setForeground(COLOR_LINK);
        lblRegister.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        lblRegister.setBounds(cx + 148, y, 100, 20);
        panel.add(lblRegister);

        // ─── Sự kiện ───
        btnLogin.addActionListener(e -> handleLogin());
        txtPassword.addActionListener(e -> handleLogin()); // Enter trên password
        txtUserName.addKeyListener(new KeyAdapter() {
            @Override public void keyPressed(KeyEvent e) {
                if (e.getKeyCode() == KeyEvent.VK_ENTER) handleLogin();
            }
        });
        lblRegister.addMouseListener(new MouseAdapter() {
            @Override public void mouseClicked(MouseEvent e) { openRegister(); }
        });

        return panel;
    }

    // ──────────────────────────────────────────────────
    // XỬ LÝ SỰ KIỆN
    // ──────────────────────────────────────────────────
    private void handleLogin() {
        String userName = getFieldText(txtUserName, "email@example.com");
        String password = new String(txtPassword.getPassword()).trim();

        // Validate input
        String validationError = loginBUS.validate(userName, password);
        if (validationError != null) {
            showError(validationError);
            return;
        }

        // Thực hiện đăng nhập
        AccountDTO account = loginBUS.login(userName, password);
        if (account == null) {
            showError("Tên đăng nhập hoặc mật khẩu không đúng.\nVui lòng thử lại.");
        } else {
            JOptionPane.showMessageDialog(this,
                    "Đăng nhập thành công!\nChào mừng " + account.getUserName(),
                    "Thành công", JOptionPane.INFORMATION_MESSAGE);
            openMainWindow(account);
        }
    }

    private void openMainWindow(AccountDTO account) {
        String role = account.getRoleGroup();
        if ("ADMIN_GROUP".equals(role) || "MANAGER_GROUP".equals(role) || "STAFF_GROUP".equals(role)) {
            gui.FrameAdmin.FrameAdmin frame = new gui.FrameAdmin.FrameAdmin(account);
            frame.setVisible(true);
        } else {
            gui.CustomerMainFrame frame = new gui.CustomerMainFrame(account);
            frame.setVisible(true);
        }
        dispose();
    }

    private void openRegister() {
        new regesterGUI();
        dispose();
    }

    private String getFieldText(JTextField field, String placeholder) {
        String text = field.getText().trim();
        return text.equals(placeholder) ? "" : text;
    }

    private void showError(String msg) {
        JOptionPane.showMessageDialog(this, msg, "Lỗi đăng nhập", JOptionPane.ERROR_MESSAGE);
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
            @Override public void focusGained(FocusEvent e) {
                if (field.getText().equals(placeholder)) {
                    field.setText("");
                    field.setForeground(COLOR_TEXT);
                }
                field.repaint();
            }
            @Override public void focusLost(FocusEvent e) {
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
                if (getModel().isPressed())        g2.setColor(bg.darker());
                else if (getModel().isRollover())  g2.setColor(bg.brighter());
                else                               g2.setColor(bg);
                g2.fill(new RoundRectangle2D.Float(0, 0, getWidth() - 1, getHeight() - 1, 12, 12));
                g2.dispose();
                super.paintComponent(g);
            }

            @Override
            protected void paintBorder(Graphics g) {}
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
