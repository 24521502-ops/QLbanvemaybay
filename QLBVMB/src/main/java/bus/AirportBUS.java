package bus;

import dao.AirportDAO;
import dto.AirportDTO;

import java.util.List;

public class AirportBUS {
    private final AirportDAO dao = new AirportDAO();

    public List<AirportDTO> getAll() {
        return dao.getAll();
    }

    public List<AirportDTO> search(String keyword) {
        if (keyword == null || keyword.trim().isEmpty()) {
            return dao.getAll();
        }
        return dao.search(keyword.trim());
    }

    public boolean insert(AirportDTO dto) {
        if (dto.getAirportID() == null || dto.getAirportID().trim().isEmpty()) return false;
        if (dto.getAirportName() == null || dto.getAirportName().trim().isEmpty()) return false;
        return dao.insert(dto);
    }

    public boolean update(AirportDTO dto) {
        if (dto.getAirportID() == null || dto.getAirportID().trim().isEmpty()) return false;
        return dao.update(dto);
    }

    public boolean delete(String airportID) {
        if (airportID == null || airportID.trim().isEmpty()) return false;
        return dao.delete(airportID);
    }

    public int count() {
        return dao.count();
    }
}
