package bus;

import dao.AirlineDAO;
import dto.AirlineDTO;

import java.util.List;

public class AirlineBUS {
    private final AirlineDAO dao = new AirlineDAO();

    public List<AirlineDTO> getAll() {
        return dao.getAll();
    }

    public List<AirlineDTO> search(String keyword) {
        if (keyword == null || keyword.trim().isEmpty()) {
            return dao.getAll();
        }
        return dao.search(keyword.trim());
    }

    public boolean insert(AirlineDTO dto) {
        if (dto.getAirlineID() == null || dto.getAirlineID().trim().isEmpty()) return false;
        if (dto.getAirlineName() == null || dto.getAirlineName().trim().isEmpty()) return false;
        return dao.insert(dto);
    }

    public boolean update(AirlineDTO dto) {
        if (dto.getAirlineID() == null || dto.getAirlineID().trim().isEmpty()) return false;
        return dao.update(dto);
    }

    public boolean delete(String airlineID) {
        if (airlineID == null || airlineID.trim().isEmpty()) return false;
        return dao.delete(airlineID);
    }

    public int count() {
        return dao.count();
    }
}
