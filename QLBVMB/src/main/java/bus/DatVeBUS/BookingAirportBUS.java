package bus.DatVeBUS;

import java.util.List;

import dao.DatVeDAO.BookingAirportDAO;

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
