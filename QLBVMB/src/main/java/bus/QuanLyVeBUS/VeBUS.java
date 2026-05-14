package bus;

import dao.VeDAO;
import java.text.DecimalFormat;
import java.util.List;

public class VeBUS {
    private VeDAO veDAO;

    public VeBUS() {
        veDAO = new VeDAO();
    }

    public List<Object[]> layDanhSachVe() {
        List<Object[]> list = veDAO.layDanhSachVeChoGUI();
        DecimalFormat df = new DecimalFormat("#,### VNĐ");
        
        for (Object[] row : list) {
            formatTicketRow(row, df);
        }
        return list;
    }

    public Object[] layThongTinChiTietVe(String maDatCho) {
        Object[] row = veDAO.layThongTinChiTietVe(maDatCho);
        if (row != null) {
            DecimalFormat df = new DecimalFormat("#,### VNĐ");
            // Trong Chi tiết vé, Hạng ghế ở cột 3, Giá cột 4, Status cột 5
            String seatClass = (String) row[3];
            if (seatClass != null) {
                if (seatClass.equalsIgnoreCase("Economy")) row[3] = "Phổ thông";
                else if (seatClass.equalsIgnoreCase("Business")) row[3] = "Thương gia";
                else if (seatClass.equalsIgnoreCase("Premium Economy")) row[3] = "Phổ thông đặc biệt";
                else if (seatClass.equalsIgnoreCase("First Class")) row[3] = "Hạng nhất";
            }
            if (row[4] instanceof Number) row[4] = df.format(((Number) row[4]).doubleValue());
            
            String status = (String) row[5];
            if (status != null) {
                if (status.equalsIgnoreCase("BOOKED")) row[5] = "Chờ thanh toán";
                else if (status.equalsIgnoreCase("PAID")) row[5] = "Đã xác nhận";
                else if (status.equalsIgnoreCase("CANCELLED")) row[5] = "Đã hủy";
                else if (status.equalsIgnoreCase("CHECKED-IN")) row[5] = "Đã lên máy bay";
            }
        }
        return row;
    }

    private void formatTicketRow(Object[] row, DecimalFormat df) {
        // Do bảng Danh sách đã thêm 2 cột, nên Hạng vé dời sang cột 5, Giá cột 6, Status cột 7
        String seatClass = (String) row[5];
        if (seatClass != null) {
            if (seatClass.equalsIgnoreCase("Economy")) row[5] = "Phổ thông";
            else if (seatClass.equalsIgnoreCase("Business")) row[5] = "Thương gia";
            else if (seatClass.equalsIgnoreCase("Premium Economy")) row[5] = "Phổ thông đặc biệt";
            else if (seatClass.equalsIgnoreCase("First Class")) row[5] = "Hạng nhất";
        } else {
            row[5] = "Chưa xếp ghế";
        }

        if (row[6] instanceof Number) {
            double price = ((Number) row[6]).doubleValue();
            row[6] = df.format(price);
        }

        String status = (String) row[7];
        if (status != null) {
            if (status.equalsIgnoreCase("BOOKED")) row[7] = "Chờ thanh toán";
            else if (status.equalsIgnoreCase("PAID")) row[7] = "Đã xác nhận";
            else if (status.equalsIgnoreCase("CANCELLED")) row[7] = "Đã hủy";
            else if (status.equalsIgnoreCase("CHECKED-IN")) row[7] = "Đã lên máy bay";
        }
    }
    
    public boolean huyVe(String ticketID) {
        return veDAO.huyVe(ticketID);
    }
    
    public Object[] layThongTinVeDeSua(String ticketID) {
        return veDAO.layThongTinVeDeSua(ticketID);
    }
    
    public List<String> layDanhSachGheTrong(String flightID) {
        return veDAO.layDanhSachGheTrong(flightID);
    }
    
    public boolean doiVeNangHang(String ticketID, String newFlightID, String newSeatID) {
        return veDAO.doiVeNangHang(ticketID, newFlightID, newSeatID);
    }
}