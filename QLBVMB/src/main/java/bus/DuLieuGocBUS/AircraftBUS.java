package bus.DuLieuGocBUS;

import dto.AircraftDTO;

import java.util.List;

import dao.DuLieuGocDAO.AircraftDAO;

public class AircraftBUS {
    private final AircraftDAO dao = new AircraftDAO();

    public List<AircraftDTO> getAll() {
        return dao.getAll();
    }

    public List<AircraftDTO> search(String keyword) {
        if (keyword == null || keyword.trim().isEmpty()) {
            return dao.getAll();
        }
        return dao.search(keyword.trim());
    }

    public boolean insert(AircraftDTO dto) {
        if (dto.getModel() == null || dto.getModel().trim().isEmpty())
            return false;
        return dao.insert(dto);
    }

    public boolean insertWithSeats(AircraftDTO dto, int first, int busi, int prem, int eco) {
        if (dto.getAirlineID() == null || dto.getAirlineID().trim().isEmpty())
            return false;
        if (dto.getModel() == null || dto.getModel().trim().isEmpty())
            return false;
        return dao.insertWithSeats(dto, first, busi, prem, eco);
    }

    public boolean update(AircraftDTO dto) {
        if (dto.getAircraftID() == null || dto.getAircraftID().trim().isEmpty())
            return false;
        return dao.update(dto);
    }

    public boolean delete(String aircraftID) {
        if (aircraftID == null || aircraftID.trim().isEmpty())
            return false;
        return dao.delete(aircraftID);
    }

    public int count() {
        return dao.count();
    }
}
