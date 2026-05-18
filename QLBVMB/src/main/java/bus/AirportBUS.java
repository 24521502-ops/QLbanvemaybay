package bus;

import dao.AirportDAO;
import java.util.List;

public class AirportBUS {
    private AirportDAO airportDAO = new AirportDAO();

    public List<String> getAirportDisplayList() {
        // Có thể thêm logic xử lý ở đây nếu cần
        return airportDAO.getAllAirportsForDisplay();
    }
    public String getCityByIATA(String iata) {
        return airportDAO.getCityName(iata);
    }
}
