package gui.QuanLyVe;

import bus.VeBUS; // Import BUS để lấy dữ liệu thật
import java.awt.*;
import java.awt.geom.Line2D;
import java.io.File;
import javax.swing.*;
import javax.swing.border.EmptyBorder;
import util.AppColor;

public class ChiTietVeDialog extends JDialog {

    private final Color BG_COLOR = new Color(240, 244, 248); 
    private final Color BRAND_BLUE = new Color(0, 114, 188); 
    private final Color INFO_BG = new Color(241, 245, 249);  
    private VeBUS veBUS = new VeBUS();

    public ChiTietVeDialog(Frame parent, boolean modal, String ticketID) {
        super(parent, modal);
        initComponents(ticketID);
        setLocationRelativeTo(parent);
    }

    private void initComponents(String ticketID) {
        // --- LẤY DỮ LIỆU THẬT TỪ DATABASE BẰNG MÃ VÉ ---
        Object[] ticketInfo = veBUS.layThongTinChiTietVe(ticketID); 
        if (ticketInfo == null) {
            // Đã thêm "N/A" vào cuối cùng để làm mặc định cho Cửa ra máy bay (Gate)
            ticketInfo = new Object[]{"N/A", "N/A", "Hành khách", "Hạng", "0", "N/A", "N/A", "SGN", "HAN", "VN000", "Ngày", "00:00", "00:00", "00", "N/A"};
        }

        setTitle("Chi tiết vé điện tử - " + ticketInfo[0].toString());
        setSize(950, 520); 
        setDefaultCloseOperation(DISPOSE_ON_CLOSE);
        getContentPane().setBackground(BG_COLOR); 
        setLayout(new GridBagLayout()); 

        // ==========================================
        // KHUNG TẤM VÉ CHÍNH
        // ==========================================
        JPanel ticketPanel = new JPanel(new BorderLayout()) {
            @Override
            protected void paintComponent(Graphics g) {
                super.paintComponent(g);
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                
                g2.setColor(Color.WHITE);
                g2.fillRoundRect(0, 0, getWidth(), getHeight(), 16, 16); 
                
                int splitX = getWidth() - 240; 
                
                g2.setColor(BG_COLOR);
                g2.fillOval(splitX - 12, -12, 24, 24);
                g2.fillOval(splitX - 12, getHeight() - 12, 24, 24);
                
                g2.setColor(new Color(210, 215, 220));
                g2.setStroke(new BasicStroke(1.5f, BasicStroke.CAP_BUTT, BasicStroke.JOIN_BEVEL, 0, new float[]{6}, 0));
                g2.draw(new Line2D.Double(splitX, 15, splitX, getHeight() - 15));
                
                g2.dispose();
            }
        };
        ticketPanel.setOpaque(false);
        ticketPanel.setPreferredSize(new Dimension(860, 380)); 

        // ==========================================
        // PHẦN BÊN TRÁI: THÔNG TIN CHUYẾN BAY
        // ==========================================
        JPanel leftPanel = new JPanel();
        leftPanel.setLayout(new BoxLayout(leftPanel, BoxLayout.Y_AXIS));
        leftPanel.setOpaque(false);
        leftPanel.setBorder(new EmptyBorder(30, 35, 30, 45)); 
        
        // 1. HEADER
        JPanel headerPanel = new JPanel(new BorderLayout());
        headerPanel.setOpaque(false);
        
        JPanel txtLogoWrap = new JPanel();
        txtLogoWrap.setLayout(new BoxLayout(txtLogoWrap, BoxLayout.Y_AXIS));
        txtLogoWrap.setOpaque(false);
        JLabel lblBrand = new JLabel("TIU AIRLINES"); lblBrand.setFont(new Font("Inter", Font.BOLD, 18)); lblBrand.setForeground(BRAND_BLUE);
        // Lấy tên hãng bay thật từ cột AirlineName trong DB (là vị trí số 6) và in hoa lên
        JLabel lblSubBrand = new JLabel(ticketInfo[6].toString().toUpperCase());
        lblSubBrand.setFont(new Font("Inter", Font.PLAIN, 11));
        lblSubBrand.setForeground(new Color(100, 116, 139));
        txtLogoWrap.add(lblBrand); txtLogoWrap.add(lblSubBrand);
        
        // --- XỬ LÝ MÀU SẮC TRẠNG THÁI VÉ TỰ ĐỘNG ---
        String status = ticketInfo[5].toString();
        JLabel lblBadgeText = new JLabel(status, SwingConstants.CENTER); 
        lblBadgeText.setFont(new Font("Inter", Font.BOLD, 12)); 
        lblBadgeText.setOpaque(true);
        lblBadgeText.setBorder(new EmptyBorder(5, 12, 5, 12));
        
        if (status.equalsIgnoreCase("Đã xác nhận") || status.equalsIgnoreCase("Đã lên máy bay")) {
            lblBadgeText.setBackground(new Color(209, 250, 229)); // Xanh nhạt
            lblBadgeText.setForeground(new Color(6, 95, 70));     // Xanh đậm
        } else if (status.equalsIgnoreCase("Đã hủy")) {
            lblBadgeText.setBackground(new Color(254, 226, 226)); // Đỏ nhạt
            lblBadgeText.setForeground(new Color(153, 27, 27));   // Đỏ đậm
        } else if (status.equalsIgnoreCase("Chờ thanh toán")) {
            lblBadgeText.setBackground(new Color(254, 243, 199)); // Vàng nhạt
            lblBadgeText.setForeground(new Color(146, 64, 14));   // Cam
        } else {
            lblBadgeText.setBackground(new Color(243, 244, 246)); // Xám
            lblBadgeText.setForeground(new Color(75, 85, 99));
        }
        
        headerPanel.add(txtLogoWrap, BorderLayout.WEST);
        headerPanel.add(lblBadgeText, BorderLayout.EAST);
        leftPanel.add(headerPanel);
        
        // Đường kẻ ngang dưới header
        leftPanel.add(Box.createVerticalStrut(15));
        JPanel topDivider = new JPanel() {
            @Override protected void paintComponent(Graphics g) {
                g.setColor(new Color(226, 232, 240)); g.drawLine(0, 0, getWidth(), 0);
            }
        };
        topDivider.setOpaque(false);
        topDivider.setPreferredSize(new Dimension(0, 1)); 
        topDivider.setMaximumSize(new Dimension(Short.MAX_VALUE, 1));
        leftPanel.add(topDivider);
        leftPanel.add(Box.createVerticalStrut(15)); 

        // 2. HÀNH TRÌNH
        JPanel routePanel = new JPanel(new BorderLayout());
        routePanel.setOpaque(false);
        
        JLabel lblFrom = new JLabel(ticketInfo[7].toString()); 
        lblFrom.setFont(new Font("Inter", Font.BOLD, 52)); lblFrom.setForeground(new Color(15, 23, 42));
        JLabel lblTo = new JLabel(ticketInfo[8].toString()); 
        lblTo.setFont(new Font("Inter", Font.BOLD, 52)); lblTo.setForeground(new Color(15, 23, 42));
        
        JLabel lblIcon = new JLabel(" ─────── ✈ ─────── ", SwingConstants.CENTER); 
        lblIcon.setFont(new Font("Inter", Font.PLAIN, 20)); lblIcon.setForeground(BRAND_BLUE);
        
        routePanel.add(lblFrom, BorderLayout.WEST);
        routePanel.add(lblIcon, BorderLayout.CENTER);
        routePanel.add(lblTo, BorderLayout.EAST);
        leftPanel.add(routePanel);
        leftPanel.add(Box.createVerticalStrut(30));

        // 3. THẺ THÔNG TIN CHI TIẾT
        JPanel infoCard = new JPanel() {
            @Override protected void paintComponent(Graphics g) {
                super.paintComponent(g);
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(INFO_BG);
                g2.fillRoundRect(0, 0, getWidth(), getHeight(), 12, 12);
                g2.dispose();
            }
        };
        infoCard.setOpaque(false);
        infoCard.setLayout(new GridLayout(2, 4, 15, 15)); 
        infoCard.setBorder(new EmptyBorder(15, 20, 15, 20)); 
        
        infoCard.add(createInfoBlock("HÀNH KHÁCH", ticketInfo[2].toString().toUpperCase())); 
        infoCard.add(createInfoBlock("CHUYẾN BAY", ticketInfo[9].toString()));
        infoCard.add(createInfoBlock("HẠNG", ticketInfo[3].toString(), BRAND_BLUE));
        infoCard.add(new JLabel("")); 
        
        infoCard.add(createInfoBlock("NGÀY BAY", ticketInfo[10].toString()));
        infoCard.add(createInfoBlock("GIỜ KHỞI HÀNH", ticketInfo[11].toString()));
        infoCard.add(createInfoBlock("CỬA RA MÁY BAY", ticketInfo[14].toString()));
        infoCard.add(createInfoBlock("GIỜ LÊN MÁY BAY", ticketInfo[12].toString(), new Color(220, 38, 38))); 

        leftPanel.add(infoCard);
        ticketPanel.add(leftPanel, BorderLayout.CENTER);

        // ==========================================
        // PHẦN BÊN PHẢI: SỐ GHẾ, PNR & QR CODE
        // ==========================================
        JPanel rightPanel = new JPanel();
        rightPanel.setLayout(new BoxLayout(rightPanel, BoxLayout.Y_AXIS));
        rightPanel.setOpaque(false);
        rightPanel.setBorder(new EmptyBorder(30, 25, 30, 25));
        rightPanel.setPreferredSize(new Dimension(240, 380));

        // Số ghế
        JLabel lblSeatTitle = new JLabel("SỐ GHẾ"); 
        lblSeatTitle.setFont(new Font("Inter", Font.BOLD, 12)); 
        lblSeatTitle.setForeground(new Color(100, 116, 139));
        lblSeatTitle.setAlignmentX(Component.LEFT_ALIGNMENT); 
        
        JLabel lblSeatNo = new JLabel(ticketInfo[13] != null ? ticketInfo[13].toString() : "N/A"); 
        lblSeatNo.setFont(new Font("Inter", Font.BOLD, 42)); 
        lblSeatNo.setForeground(new Color(15, 23, 42));
        lblSeatNo.setAlignmentX(Component.LEFT_ALIGNMENT);
        
        rightPanel.add(lblSeatTitle); 
        rightPanel.add(lblSeatNo);
        rightPanel.add(Box.createVerticalStrut(20));
        
        // Vạch kẻ ngang
        JPanel divider = createDividerLine();
        divider.setAlignmentX(Component.LEFT_ALIGNMENT);
        rightPanel.add(divider);
        rightPanel.add(Box.createVerticalStrut(20));
        
        // Số vé 
        JPanel pnlTicketId = createInfoBlock("SỐ VÉ (TICKET ID)", ticketInfo[0].toString(), new Font("Inter", Font.PLAIN, 15));
        pnlTicketId.setAlignmentX(Component.LEFT_ALIGNMENT);
        rightPanel.add(pnlTicketId);
        rightPanel.add(Box.createVerticalStrut(15));
        
        // PNR
        JPanel pnlPNR = createInfoBlock("MÃ ĐẶT CHỖ (PNR)", ticketInfo[1].toString(), new Font("Inter", Font.BOLD, 17));
        pnlPNR.setAlignmentX(Component.LEFT_ALIGNMENT);
        rightPanel.add(pnlPNR);
        
        rightPanel.add(Box.createVerticalGlue()); 
        
        // Cục QR Code
        JPanel qrWrap = new JPanel();
        qrWrap.setLayout(new BoxLayout(qrWrap, BoxLayout.Y_AXIS));
        qrWrap.setOpaque(false);
        qrWrap.setAlignmentX(Component.LEFT_ALIGNMENT); 
        
        JPanel qrPanel = new JPanel(new BorderLayout());
        qrPanel.setBackground(Color.WHITE);
        qrPanel.setBorder(BorderFactory.createLineBorder(new Color(226, 232, 240), 1));
        qrPanel.setPreferredSize(new Dimension(85, 85));
        qrPanel.setMaximumSize(new Dimension(85, 85));
        qrPanel.setAlignmentX(Component.CENTER_ALIGNMENT);

        try {
            String path = "D:\\HK2 2025-2026\\IS216-Lap Trinh Java\\QLbanvemaybay\\QLBVMB\\src\\main\\resources\\image\\qr.png";
            File f = new File(path);
            if (!f.exists()) path = "D:\\HK2 2025-2026\\IS216-Lap Trinh Java\\QLbanvemaybay\\QLBVMB\\src\\main\\resources\\image\\qr.jpg";

            ImageIcon icon = new ImageIcon(path);
            if (icon.getIconWidth() > 0) {
                Image img = icon.getImage();
                Image scaledImg = img.getScaledInstance(75, 75, Image.SCALE_SMOOTH); 
                JLabel lblQR = new JLabel(new ImageIcon(scaledImg));
                lblQR.setHorizontalAlignment(SwingConstants.CENTER);
                qrPanel.add(lblQR, BorderLayout.CENTER);
            } else {
                JLabel lblError = new JLabel("LỖI ẢNH", SwingConstants.CENTER); lblError.setForeground(Color.RED);
                qrPanel.add(lblError, BorderLayout.CENTER);
            }
        } catch (Exception ex) { ex.printStackTrace(); }

        JLabel lblQRNote = new JLabel("QUÉT ĐỂ LÊN MÁY BAY", SwingConstants.CENTER); 
        lblQRNote.setFont(new Font("Inter", Font.BOLD, 9)); 
        lblQRNote.setForeground(new Color(148, 163, 184));
        lblQRNote.setAlignmentX(Component.CENTER_ALIGNMENT);

        qrWrap.add(qrPanel);
        qrWrap.add(Box.createVerticalStrut(5));
        qrWrap.add(lblQRNote);
        
        rightPanel.add(qrWrap);
        ticketPanel.add(rightPanel, BorderLayout.EAST);
        add(ticketPanel, new GridBagConstraints());

        // ==========================================
        // PANEL NÚT BẤM
        // ==========================================
        JPanel buttonPanel = new JPanel(new FlowLayout(FlowLayout.CENTER, 20, 0));
        buttonPanel.setOpaque(false);
        JButton btnDownload = makeButton("Tải xuống PDF", BRAND_BLUE, Color.WHITE); 
        
        final String tenFile = "BoardingPass_" + ticketInfo[0].toString() + ".pdf";
        btnDownload.addActionListener(e -> {
            JFileChooser fileChooser = new JFileChooser();
            fileChooser.setDialogTitle("Chọn thư mục lưu Vé điện tử");
            fileChooser.setSelectedFile(new File(tenFile)); 
            int userSelection = fileChooser.showSaveDialog(this);
            if (userSelection == JFileChooser.APPROVE_OPTION) {
                JOptionPane.showMessageDialog(this, "Đã lưu vé thành công tại:\n" + fileChooser.getSelectedFile().getAbsolutePath(), "Hoàn tất", JOptionPane.INFORMATION_MESSAGE);
                dispose();
            }
        });
        buttonPanel.add(btnDownload);

        GridBagConstraints gbcBtn = new GridBagConstraints();
        gbcBtn.gridy = 1; gbcBtn.insets = new Insets(20, 0, 0, 0); 
        add(buttonPanel, gbcBtn);
    }

    private JPanel createDividerLine() {
        JPanel p = new JPanel() {
            @Override protected void paintComponent(Graphics g) {
                super.paintComponent(g);
                g.setColor(new Color(226, 232, 240)); 
                g.drawLine(0, getHeight()/2, getWidth(), getHeight()/2);
            }
        };
        p.setOpaque(false); 
        p.setPreferredSize(new Dimension(200, 2)); 
        p.setMaximumSize(new Dimension(200, 2));
        return p;
    }

    private JPanel createInfoBlock(String title, String value) {
        return createInfoBlock(title, value, new Color(15, 23, 42)); 
    }
    
    private JPanel createInfoBlock(String title, String value, Color valueColor) {
        return createInfoBlock(title, value, new Font("Inter", Font.BOLD, 14), valueColor);
    }
    
    private JPanel createInfoBlock(String title, String value, Font valFont) {
        return createInfoBlock(title, value, valFont, new Color(15, 23, 42));
    }

    private JPanel createInfoBlock(String title, String value, Font valFont, Color valueColor) {
        JPanel p = new JPanel(); p.setLayout(new BoxLayout(p, BoxLayout.Y_AXIS)); p.setOpaque(false);
        JLabel lblT = new JLabel(title); lblT.setFont(new Font("Inter", Font.BOLD, 10)); lblT.setForeground(new Color(100, 116, 139));
        JLabel lblV = new JLabel(value); lblV.setFont(valFont); lblV.setForeground(valueColor); 
        
        lblT.setAlignmentX(Component.LEFT_ALIGNMENT);
        lblV.setAlignmentX(Component.LEFT_ALIGNMENT);
        
        p.add(lblT); p.add(Box.createVerticalStrut(4)); p.add(lblV);
        return p;
    }

    private JButton makeButton(String text, Color bg, Color fg) {
        JButton btn = new JButton(text) {
            @Override protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(bg); g2.fillRoundRect(0, 0, getWidth(), getHeight(), 8, 8); g2.dispose(); super.paintComponent(g);
            }
        };
        btn.setFont(new Font("Inter", Font.BOLD, 14)); btn.setForeground(fg);
        btn.setContentAreaFilled(false); btn.setBorderPainted(false); btn.setCursor(new Cursor(Cursor.HAND_CURSOR));
        btn.setPreferredSize(new Dimension(170, 42)); 
        return btn;
    }
}