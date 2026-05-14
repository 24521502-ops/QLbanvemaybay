package gui.QuanLyChuyenBay;

import bus.ChuyenBayBUS;
import java.awt.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.swing.*;
import javax.swing.border.EmptyBorder;
import util.DBConnection;

public class UpdateFlightDialog extends javax.swing.JDialog {

    private static final Color PRIMARY = new Color(0, 37, 71);      
    private static final Color SURFACE_LOW = new Color(240, 244, 248);  
    private static final Color OUTLINE_VARIANT = new Color(195, 198, 207);  
    private static final Color ON_SURFACE_VAR = new Color(67, 71, 78);     

    private QuanLyChuyenBayPanel parentPanel;
    private String flightID;
    private ChuyenBayBUS bus = new ChuyenBayBUS();
    
    private JTextField txtSoHieu, txtGate;
    private JComboBox<String> cbHangBay, cbTauBay, cbSanBayDi, cbSanBayDen;
    
    // Thay JTextField bằng JSpinner
    private JSpinner spnKhoiHanh, spnHaCanh;

    public UpdateFlightDialog(Frame parent, boolean modal, QuanLyChuyenBayPanel panel, String flightID) {
        super(parent, modal);
        this.parentPanel = panel;
        this.flightID = flightID;
        initComponents();
        loadDropdownData();
        loadOldData(); 
        setLocationRelativeTo(parent);
    }

    private void initComponents() {
        setTitle("Sửa thông tin chuyến bay");
        setDefaultCloseOperation(DISPOSE_ON_CLOSE);
        getContentPane().setBackground(Color.WHITE);
        setLayout(new BorderLayout());

        JPanel header = new JPanel(new BorderLayout());
        header.setBackground(Color.WHITE);
        header.setBorder(BorderFactory.createCompoundBorder(BorderFactory.createMatteBorder(0, 0, 1, 0, OUTLINE_VARIANT), new EmptyBorder(20, 24, 20, 24)));
        JLabel lblTitle = new JLabel("Sửa thông tin chuyến bay");
        lblTitle.setFont(new Font("Inter", Font.BOLD, 22));
        lblTitle.setForeground(PRIMARY);
        header.add(lblTitle, BorderLayout.WEST);

        JPanel body = new JPanel();
        body.setLayout(new BoxLayout(body, BoxLayout.Y_AXIS));
        body.setBackground(Color.WHITE);
        body.setBorder(new EmptyBorder(20, 24, 20, 24));

        txtSoHieu = makeInputField(); body.add(makeFieldBlock("SỐ HIỆU CHUYẾN BAY", txtSoHieu)); body.add(Box.createVerticalStrut(12));
        cbHangBay = makeComboBox();   body.add(makeFieldBlock("HÃNG HÀNG KHÔNG", cbHangBay));   body.add(Box.createVerticalStrut(12));
        cbTauBay = makeComboBox();    body.add(makeFieldBlock("TÀU BAY THỰC HIỆN", cbTauBay));  body.add(Box.createVerticalStrut(12));
        cbSanBayDi = makeComboBox();  body.add(makeFieldBlock("SÂN BAY ĐI", cbSanBayDi));       body.add(Box.createVerticalStrut(12));
        cbSanBayDen = makeComboBox(); body.add(makeFieldBlock("SÂN BAY ĐẾN", cbSanBayDen));     body.add(Box.createVerticalStrut(12));
        
        // Dùng Spinner
        spnKhoiHanh = makeDateSpinner(); body.add(makeFieldBlock("THỜI GIAN KHỞI HÀNH", spnKhoiHanh)); body.add(Box.createVerticalStrut(12));
        spnHaCanh = makeDateSpinner();   body.add(makeFieldBlock("THỜI GIAN HẠ CÁNH", spnHaCanh));     body.add(Box.createVerticalStrut(12));
        
        txtGate = makeInputField();      body.add(makeFieldBlock("CỔNG (GATE)", txtGate));

        JPanel footer = new JPanel(new FlowLayout(FlowLayout.RIGHT, 12, 12));
        footer.setBackground(SURFACE_LOW);
        footer.setBorder(BorderFactory.createMatteBorder(1, 0, 0, 0, OUTLINE_VARIANT));

        JButton btnCancel = makeCancelButton("Hủy");
        btnCancel.addActionListener(e -> dispose());
        JButton btnSave = makePrimaryButton("Lưu thay đổi");
        btnSave.addActionListener(this::btnSaveAction);

        footer.add(btnCancel); footer.add(btnSave);

        add(header, BorderLayout.NORTH);
        JScrollPane scroll = new JScrollPane(body); scroll.setBorder(null); add(scroll, BorderLayout.CENTER);
        add(footer, BorderLayout.SOUTH);
        setSize(500, 680);
    }

    private void loadDropdownData() {
        try (Connection conn = DBConnection.getConnection(); Statement stmt = conn.createStatement()) {
            ResultSet rsAL = stmt.executeQuery("SELECT AirlineID, AirlineName FROM AIRLINE");
            while(rsAL.next()) cbHangBay.addItem(rsAL.getString(1) + " - " + rsAL.getString(2));
            
            ResultSet rsAC = stmt.executeQuery("SELECT AircraftID, Model FROM AIRCRAFT");
            while(rsAC.next()) cbTauBay.addItem(rsAC.getString(1) + " - " + rsAC.getString(2));
            
            ResultSet rsAP = stmt.executeQuery("SELECT AirportID, AirportName FROM AIRPORT");
            while(rsAP.next()) { String ap = rsAP.getString(1) + " - " + rsAP.getString(2); cbSanBayDi.addItem(ap); cbSanBayDen.addItem(ap); }
        } catch (Exception e) {}
    }

    private void loadOldData() {
        Object[] oldData = bus.layChiTietChuyenBay(flightID);
        if (oldData != null) {
            txtSoHieu.setText(oldData[0].toString());
            setSelectedCombo(cbHangBay, oldData[1].toString());
            setSelectedCombo(cbTauBay, oldData[2].toString());
            setSelectedCombo(cbSanBayDi, oldData[3].toString());
            setSelectedCombo(cbSanBayDen, oldData[4].toString());
            
            // Set trực tiếp Object Date vào Spinner
            if (oldData[5] != null) spnKhoiHanh.setValue((java.util.Date) oldData[5]);
            if (oldData[6] != null) spnHaCanh.setValue((java.util.Date) oldData[6]);
            
            txtGate.setText(oldData[7] != null ? oldData[7].toString() : "");
        }
    }

    private void setSelectedCombo(JComboBox<String> cb, String id) {
        for(int i=0; i<cb.getItemCount(); i++) {
            if(cb.getItemAt(i).startsWith(id + " -")) { cb.setSelectedIndex(i); break; }
        }
    }

    private void btnSaveAction(java.awt.event.ActionEvent evt) {
        try {
            String airline = cbHangBay.getSelectedItem().toString().split(" - ")[0];
            String aircraft = cbTauBay.getSelectedItem().toString().split(" - ")[0];
            String depAp = cbSanBayDi.getSelectedItem().toString().split(" - ")[0];
            String arrAp = cbSanBayDen.getSelectedItem().toString().split(" - ")[0];

            if(depAp.equals(arrAp)) { JOptionPane.showMessageDialog(this, "Sân bay đi và đến trùng nhau!", "Lỗi", JOptionPane.ERROR_MESSAGE); return; }

            // Lấy Date từ Spinner
            java.util.Date depD = (java.util.Date) spnKhoiHanh.getValue();
            java.util.Date arrD = (java.util.Date) spnHaCanh.getValue();
            
            if (arrD.before(depD) || arrD.equals(depD)) {
                JOptionPane.showMessageDialog(this, "Thời gian hạ cánh phải sau thời gian khởi hành!", "Lỗi logic", JOptionPane.ERROR_MESSAGE);
                return;
            }

            if (bus.capNhatToanBoChuyenBay(flightID, txtSoHieu.getText(), airline, aircraft, depAp, arrAp, depD, arrD, txtGate.getText())) {
                JOptionPane.showMessageDialog(this, "Sửa chuyến bay thành công!");
                parentPanel.loadDataToTable(); dispose();
            } else { JOptionPane.showMessageDialog(this, "Lỗi cập nhật CSDL!", "Lỗi", JOptionPane.ERROR_MESSAGE); }
        } catch (Exception e) { JOptionPane.showMessageDialog(this, "Nhập sai ngày giờ!", "Lỗi", JOptionPane.ERROR_MESSAGE); }
    }

    // --- Helpers ---
    private JSpinner makeDateSpinner() {
        SpinnerDateModel model = new SpinnerDateModel(new java.util.Date(), null, null, java.util.Calendar.MINUTE);
        JSpinner spinner = new JSpinner(model);
        JSpinner.DateEditor editor = new JSpinner.DateEditor(spinner, "yyyy-MM-dd HH:mm:ss");
        spinner.setEditor(editor);
        JFormattedTextField tf = editor.getTextField();
        tf.setFont(new Font("Inter", Font.PLAIN, 14));
        tf.setBackground(SURFACE_LOW);
        tf.setForeground(ON_SURFACE_VAR);
        tf.setBorder(BorderFactory.createCompoundBorder(
                BorderFactory.createLineBorder(new Color(OUTLINE_VARIANT.getRed(), OUTLINE_VARIANT.getGreen(), OUTLINE_VARIANT.getBlue(), 80)),
                new EmptyBorder(8, 12, 8, 12)));
        return spinner;
    }

    private JPanel makeFieldBlock(String label, JComponent field) {
        JPanel block = new JPanel(); block.setLayout(new BoxLayout(block, BoxLayout.Y_AXIS)); block.setOpaque(false); block.setAlignmentX(LEFT_ALIGNMENT);
        JLabel lbl = new JLabel(label); lbl.setFont(new Font("Inter", Font.BOLD, 11)); lbl.setForeground(ON_SURFACE_VAR); lbl.setAlignmentX(LEFT_ALIGNMENT);
        field.setAlignmentX(LEFT_ALIGNMENT); field.setMaximumSize(new Dimension(Integer.MAX_VALUE, 36));
        block.add(lbl); block.add(Box.createVerticalStrut(4)); block.add(field); return block;
    }
    private JTextField makeInputField() { JTextField tf = new JTextField(); tf.setFont(new Font("Inter", Font.PLAIN, 14)); tf.setBackground(SURFACE_LOW); tf.setBorder(BorderFactory.createCompoundBorder(BorderFactory.createLineBorder(OUTLINE_VARIANT), new EmptyBorder(8,12,8,12))); return tf; }
    private JComboBox<String> makeComboBox() { JComboBox<String> cb = new JComboBox<>(); cb.setFont(new Font("Inter", Font.PLAIN, 14)); cb.setBackground(SURFACE_LOW); return cb; }
    private JButton makePrimaryButton(String text) {
        JButton btn = new JButton(text){ 
            @Override protected void paintComponent(Graphics g){ 
                Graphics2D g2=(Graphics2D)g.create(); 
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON); 
                g2.setColor(PRIMARY); 
                g2.fillRoundRect(0,0,getWidth(),getHeight(),8,8); 
                g2.dispose();
                super.paintComponent(g); 
            }
        };
        btn.setFont(new Font("Inter", Font.BOLD, 13)); 
        btn.setForeground(Color.WHITE); 
        btn.setContentAreaFilled(false); 
        btn.setBorderPainted(false); 
        btn.setCursor(new Cursor(Cursor.HAND_CURSOR));
        
        // CHỈNH Ở ĐÂY: Ép 150 để nút Lưu bự bằng nút Hủy
        btn.setPreferredSize(new Dimension(150, 36)); 
        return btn;
    }
    private JButton makeCancelButton(String text) {
        JButton btn = new JButton(text) {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                GradientPaint gp = new GradientPaint(0, 0, new Color(186, 26, 26), getWidth(), getHeight(), new Color(140, 15, 15));
                g2.setPaint(gp);
                g2.fillRoundRect(0, 0, getWidth(), getHeight(), 8, 8);
                g2.dispose();
                super.paintComponent(g);
            }
        };
        btn.setFont(new Font("Inter", Font.BOLD, 13));
        btn.setForeground(Color.WHITE);
        btn.setContentAreaFilled(false);
        btn.setBorderPainted(false);
        btn.setFocusPainted(false);
        btn.setCursor(new Cursor(Cursor.HAND_CURSOR));
        
        // CHỈNH Ở ĐÂY: Để 150 cho đều tăm tắp
        btn.setPreferredSize(new Dimension(150, 36)); 
        return btn;
    }
}