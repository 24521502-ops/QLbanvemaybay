package bus;

import dao.BookingAirportDAO;
import java.util.List;

public class BookingAirportBUS {
    private BookingAirportDAO airportDAO = new BookingAirportDAO();

    public List<String> getAirportDisplayList() {
        // Có thể thêm logic xử lý ở đây nếu cần
        return airportDAO.getAllAirportsForDisplay();
    }
    public String getCityByIATA(String iata) {
        return airportDAO.getCityName(iata);
    }
}
