package bus;

import javax.swing.*;

public class BookingFlightBUS {

    /**
     * Kiểm tra tính hợp lệ của thông tin tìm kiếm chuyến bay.
     * @param from Sân bay đi
     * @param to Sân bay đến
     * @return true nếu hợp lệ, false nếu có lỗi
     */
    public boolean validateSearch(String from, String to) {
        if (from == null || to == null) {
            JOptionPane.showMessageDialog(null, 
                "Vui lòng chọn đầy đủ điểm đi và điểm đến!", 
                "Thông báo", JOptionPane.WARNING_MESSAGE);
            return false;
        }

        if (from.equalsIgnoreCase(to)) {
            JOptionPane.showMessageDialog(null, 
                "Điểm đi và điểm đến không được trùng nhau!", 
                "Lỗi tìm kiếm", JOptionPane.ERROR_MESSAGE);
            return false;
        }

        return true;
    }

    /**
     * Kiểm tra tính hợp lệ cho tìm kiếm nhiều chặng (Multi-city).
     * @param airports Mảng các sân bay theo thứ tự chặng
     * @return true nếu tất cả các chặng hợp lệ
     */
    public boolean validateMultiCitySearch(String[] airports) {
        for (int i = 0; i < airports.length - 1; i++) {
            if (airports[i].equalsIgnoreCase(airports[i+1])) {
                JOptionPane.showMessageDialog(null, 
                    "Sân bay đi và đến ở chặng " + (i + 1) + " không được trùng nhau!", 
                    "Lỗi tìm kiếm", JOptionPane.ERROR_MESSAGE);
                return false;
            }
        }
        return true;
    }

    public java.util.List<dto.FlightSearchResultDTO> searchFlights(String depIATA, String arrIATA, String dateStr) {
        return new dao.BookingFlightDAO().searchFlights(depIATA, arrIATA, dateStr);
    }
}
