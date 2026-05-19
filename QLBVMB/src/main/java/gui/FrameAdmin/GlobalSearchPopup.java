package gui.FrameAdmin;

import dto.SearchResultDTO;
import util.AppColor;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.List;

public class GlobalSearchPopup extends JPopupMenu {

    private final JPanel container;
    private List<SearchResultDTO> lastResults;
    private java.util.function.Consumer<SearchResultDTO> lastOnSelect;

    public GlobalSearchPopup() {
        container = new JPanel();
        container.setLayout(new BoxLayout(container, BoxLayout.Y_AXIS));
        container.setBackground(Color.WHITE);
        container.setBorder(new EmptyBorder(8, 8, 8, 8));

        JScrollPane scrollPane = new JScrollPane(container);
        scrollPane.setPreferredSize(new Dimension(420, 320));
        scrollPane.setBorder(null);
        scrollPane.getVerticalScrollBar().setUnitIncrement(16);

        setBorder(BorderFactory.createLineBorder(AppColor.BORDER, 1));
        setBackground(Color.WHITE);
        setFocusable(false); // Ngăn JPopupMenu chiếm focus của ô nhập liệu
        add(scrollPane);
    }

    public void updateResults(List<SearchResultDTO> results, java.util.function.Consumer<SearchResultDTO> onSelect) {
        this.lastResults = results;
        this.lastOnSelect = onSelect;
        renderResults(results, onSelect);
    }

    public void showLastResults(javax.swing.JComponent invoker) {
        if (lastResults != null && lastOnSelect != null && !lastResults.isEmpty()) {
            renderResults(lastResults, lastOnSelect);
            if (!isVisible()) {
                show(invoker, 0, invoker.getHeight() + 4);
            }
        }
    }

    private void renderResults(List<SearchResultDTO> results, java.util.function.Consumer<SearchResultDTO> onSelect) {
        container.removeAll();
        if (results == null || results.isEmpty()) {
            JLabel lblNoData = new JLabel("Không tìm thấy kết quả");
            lblNoData.setFont(new Font("Segoe UI", Font.ITALIC, 13));
            lblNoData.setForeground(AppColor.TEXT_SECONDARY);
            lblNoData.setBorder(new EmptyBorder(10, 10, 10, 10));
            container.add(lblNoData);
        } else {
            for (SearchResultDTO dto : results) {
                container.add(createResultItem(dto, onSelect));
                container.add(Box.createVerticalStrut(4));
            }
        }
        container.revalidate();
        container.repaint();
    }

    private JPanel createResultItem(SearchResultDTO dto, java.util.function.Consumer<SearchResultDTO> onSelect) {
        JPanel panel = new JPanel(new BorderLayout(10, 5));
        panel.setBackground(Color.WHITE);
        panel.setBorder(BorderFactory.createCompoundBorder(
                BorderFactory.createLineBorder(new Color(241, 245, 249), 1),
                new EmptyBorder(8, 12, 8, 12)
        ));
        panel.setCursor(new Cursor(Cursor.HAND_CURSOR));

        JLabel lblType = new JLabel(getIconForType(dto.getType()));
        
        JPanel textPanel = new JPanel();
        textPanel.setLayout(new BoxLayout(textPanel, BoxLayout.Y_AXIS));
        textPanel.setOpaque(false);

        JLabel lblTitle = new JLabel(dto.getTitle());
        lblTitle.setFont(new Font("Segoe UI", Font.BOLD, 13));
        lblTitle.setForeground(AppColor.TEXT_PRIMARY);

        JLabel lblSub = new JLabel(dto.getSubTitle());
        lblSub.setFont(new Font("Segoe UI", Font.PLAIN, 12));
        lblSub.setForeground(AppColor.TEXT_SECONDARY);

        textPanel.add(lblTitle);
        textPanel.add(Box.createVerticalStrut(2));
        textPanel.add(lblSub);

        panel.add(lblType, BorderLayout.WEST);
        panel.add(textPanel, BorderLayout.CENTER);

        panel.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseEntered(MouseEvent e) {
                panel.setBackground(new Color(241, 245, 249)); // hover
            }

            @Override
            public void mouseExited(MouseEvent e) {
                panel.setBackground(Color.WHITE);
            }

            @Override
            public void mousePressed(MouseEvent e) {
                setVisible(false);
                if (onSelect != null) {
                    onSelect.accept(dto);
                }
            }
        });

        return panel;
    }

    private Icon getIconForType(String type) {
        // Return a simple colored circle or shape based on type, or text
        return new Icon() {
            @Override
            public void paintIcon(Component c, Graphics g, int x, int y) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                if ("FLIGHT".equals(type)) g2.setColor(new Color(59, 130, 246));
                else if ("CUSTOMER".equals(type)) g2.setColor(new Color(16, 185, 129));
                else if ("BOOKING".equals(type)) g2.setColor(new Color(245, 158, 11));
                else g2.setColor(new Color(139, 92, 246)); // purple for tickets
                
                g2.fillRoundRect(x, y + 6, 24, 24, 8, 8);
                g2.setColor(Color.WHITE);
                g2.setFont(new Font("Segoe UI", Font.BOLD, 12));
                String letter = type.substring(0, 1);
                FontMetrics fm = g2.getFontMetrics();
                int sw = fm.stringWidth(letter);
                g2.drawString(letter, x + (24 - sw)/2, y + 6 + 17);
                g2.dispose();
            }

            @Override
            public int getIconWidth() { return 24; }

            @Override
            public int getIconHeight() { return 30; }
        };
    }
}
