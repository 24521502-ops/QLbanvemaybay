package bus;

import dao.ChuyenBayDAO;
import dto.FlightDTO;
import java.util.List;

public class ChuyenBayBUS {
    private ChuyenBayDAO chuyenBayDAO = new ChuyenBayDAO();

    public List<Object[]> layDanhSachChuyenBay() { return chuyenBayDAO.layDanhSachChuyenBay(); }
    public boolean huyChuyenBay(String flightID) { return chuyenBayDAO.huyChuyenBay(flightID); }
    public boolean delayChuyenBay(String flightID, java.util.Date newTime) { return chuyenBayDAO.delayChuyenBay(flightID, newTime); }
    public boolean themChuyenBay(FlightDTO flight, String depAirport, String arrAirport) {
        if (flight.getFlightNumber() == null || flight.getFlightNumber().isEmpty()) return false;
        return chuyenBayDAO.themChuyenBayUI(flight, depAirport, arrAirport);
    }
    
    // GỌI HÀM LẤY CHI TIẾT & SỬA
    public Object[] layChiTietChuyenBay(String flightID) {
        return chuyenBayDAO.layChiTietChuyenBay(flightID);
    }
    public boolean capNhatToanBoChuyenBay(String flightID, String flightNum, String airlineID, String aircraftID, String depAirport, String arrAirport, java.util.Date depTime, java.util.Date arrTime, String gate) {
        return chuyenBayDAO.capNhatToanBoChuyenBay(flightID, flightNum, airlineID, aircraftID, depAirport, arrAirport, depTime, arrTime, gate);
    }
}