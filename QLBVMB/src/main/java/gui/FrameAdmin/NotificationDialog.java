package gui.FrameAdmin;

import dto.NotificationDTO;
import util.AppColor;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.util.List;

public class NotificationDialog extends JPopupMenu {

    private final JPanel container;
    private final JPanel listPanel;
    private final JScrollPane scrollPane;

    public NotificationDialog() {
        container = new JPanel(new BorderLayout());
        container.setBackground(Color.WHITE);
        container.setBorder(new EmptyBorder(8, 8, 8, 8));
        
        setBorder(BorderFactory.createLineBorder(AppColor.BORDER, 1));
        setBackground(Color.WHITE);
        
        JPanel header = new JPanel(new BorderLayout());
        header.setBackground(Color.WHITE);
        header.setBorder(new EmptyBorder(0, 0, 8, 0));
        
        JLabel lblTitle = new JLabel("Thông báo");
        lblTitle.setFont(new Font("Segoe UI", Font.BOLD, 15));
        lblTitle.setForeground(AppColor.TEXT_PRIMARY);
        header.add(lblTitle, BorderLayout.WEST);
        
        JPanel topPanel = new JPanel(new BorderLayout());
        topPanel.setBackground(Color.WHITE);
        topPanel.add(header, BorderLayout.NORTH);
        topPanel.add(new JSeparator(), BorderLayout.CENTER);
        topPanel.add(Box.createVerticalStrut(8), BorderLayout.SOUTH);
        
        container.add(topPanel, BorderLayout.NORTH);
        
        listPanel = new JPanel();
        listPanel.setLayout(new BoxLayout(listPanel, BoxLayout.Y_AXIS));
        listPanel.setBackground(Color.WHITE);
        
        scrollPane = new JScrollPane(listPanel);
        scrollPane.setBorder(BorderFactory.createEmptyBorder());
        scrollPane.setBackground(Color.WHITE);
        scrollPane.getViewport().setBackground(Color.WHITE);
        scrollPane.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
        scrollPane.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED);
        scrollPane.getVerticalScrollBar().setUnitIncrement(16);
        
        container.add(scrollPane, BorderLayout.CENTER);
        add(container);
    }

    public void updateNotifications(List<NotificationDTO> notifications) {
        listPanel.removeAll();

        if (notifications == null || notifications.isEmpty()) {
            JLabel lblNoData = new JLabel("Không có thông báo mới");
            lblNoData.setFont(new Font("Segoe UI", Font.ITALIC, 13));
            lblNoData.setForeground(AppColor.TEXT_SECONDARY);
            lblNoData.setBorder(new EmptyBorder(20, 20, 20, 20));
            listPanel.add(lblNoData);
        } else {
            for (NotificationDTO dto : notifications) {
                listPanel.add(createNotiItem(dto));
                listPanel.add(Box.createVerticalStrut(8));
            }
        }
        
        int prefWidth = Math.max(300, listPanel.getPreferredSize().width + 30); // 30 for scrollbar width
        int prefHeight = Math.min(450, listPanel.getPreferredSize().height + 10); // max height 450px
        scrollPane.setPreferredSize(new Dimension(prefWidth, prefHeight));
        
        pack();
        revalidate();
        repaint();
    }

    private JPanel createNotiItem(NotificationDTO dto) {
        String type = dto.getType();
        Color bg, border, text, iconColor;

        if (type.contains("URGENT") || type.contains("EXPIRING")) {
            bg = new Color(254, 226, 226); // red 100
            border = new Color(252, 165, 165); // red 300
            text = new Color(185, 28, 28); // red 700
            iconColor = new Color(239, 68, 68); // red 500
        } else if (type.contains("NEW")) {
            bg = new Color(209, 250, 229); // green 100
            border = new Color(110, 231, 183); // green 300
            text = new Color(4, 120, 87); // green 700
            iconColor = new Color(16, 185, 129); // green 500
        } else { // DELAYED, LOW_SEATS
            bg = new Color(254, 243, 199); // yellow 100
            border = new Color(252, 211, 77); // yellow 300
            text = new Color(180, 83, 9); // yellow 700
            iconColor = new Color(245, 158, 11); // yellow 500
        }

        NotiItemPanel panel = new NotiItemPanel(border, new Color(249, 250, 251)); // hover: light gray
        panel.setLayout(new BorderLayout(15, 5));
        panel.setBorder(new EmptyBorder(12, 15, 12, 15));
        
        // Icon
        JLabel lblIcon = new JLabel(getAlertIcon(type, bg, iconColor));
        panel.add(lblIcon, BorderLayout.WEST);
        
        JPanel textPanel = new JPanel();
        textPanel.setLayout(new BoxLayout(textPanel, BoxLayout.Y_AXIS));
        textPanel.setOpaque(false);

        JLabel lblMsg = new JLabel(dto.getMessage());
        lblMsg.setFont(new Font("Segoe UI", Font.BOLD, 13));
        lblMsg.setForeground(text);

        JLabel lblTime = new JLabel(dto.getTimeInfo());
        lblTime.setFont(new Font("Segoe UI", Font.PLAIN, 12));
        lblTime.setForeground(AppColor.TEXT_SECONDARY);

        textPanel.add(lblMsg);
        textPanel.add(Box.createVerticalStrut(4));
        textPanel.add(lblTime);

        panel.add(textPanel, BorderLayout.CENTER);
        
        return panel;
    }
    
    private Icon getAlertIcon(String type, Color bg, Color iconColor) {
        return new Icon() {
            @Override
            public void paintIcon(Component c, Graphics g, int x, int y) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                
                // Background circle
                g2.setColor(bg);
                g2.fillOval(x, y + 2, 32, 32);
                
                // Icon styling
                g2.setColor(iconColor);
                g2.setStroke(new BasicStroke(2.2f, BasicStroke.CAP_ROUND, BasicStroke.JOIN_ROUND));
                
                if (type.contains("NEW")) {
                    // Checkmark
                    g2.drawLine(x + 10, y + 18, x + 14, y + 22);
                    g2.drawLine(x + 14, y + 22, x + 22, y + 12);
                } else if (type.contains("DELAYED")) {
                    // Clock
                    g2.drawOval(x + 8, y + 10, 16, 16);
                    g2.drawLine(x + 16, y + 14, x + 16, y + 18); // Hour hand
                    g2.drawLine(x + 16, y + 18, x + 20, y + 18); // Minute hand
                } else {
                    // Exclamation
                    g2.drawLine(x + 16, y + 10, x + 16, y + 20);
                    g2.fillOval(x + 14, y + 24, 4, 4);
                }
                
                g2.dispose();
            }

            @Override
            public int getIconWidth() { return 32; }

            @Override
            public int getIconHeight() { return 36; }
        };
    }

    // Inner class để vẽ Custom Panel với viền bo tròn (Rounded Corner) và hiệu ứng Hover
    class NotiItemPanel extends JPanel {
        private Color borderColor;
        private Color hoverBg;
        private boolean isHovered = false;

        public NotiItemPanel(Color border, Color hoverBg) {
            this.borderColor = border;
            this.hoverBg = hoverBg;
            setOpaque(false);
            
            addMouseListener(new java.awt.event.MouseAdapter() {
                public void mouseEntered(java.awt.event.MouseEvent e) {
                    isHovered = true;
                    setCursor(new Cursor(Cursor.HAND_CURSOR));
                    repaint();
                }
                public void mouseExited(java.awt.event.MouseEvent e) {
                    isHovered = false;
                    repaint();
                }
            });
        }

        @Override
        protected void paintComponent(Graphics g) {
            super.paintComponent(g);
            Graphics2D g2 = (Graphics2D) g.create();
            g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
            
            if (isHovered) {
                g2.setColor(hoverBg);
            } else {
                g2.setColor(Color.WHITE);
            }
            g2.fillRoundRect(0, 0, getWidth() - 1, getHeight() - 1, 12, 12);
            
            g2.setColor(borderColor);
            g2.setStroke(new BasicStroke(1.2f));
            g2.drawRoundRect(0, 0, getWidth() - 1, getHeight() - 1, 12, 12);
            
            g2.dispose();
        }
    }
}
