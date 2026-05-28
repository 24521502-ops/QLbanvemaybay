package bus.DatVeBUS;

import dao.DatVeDAO.MyFlightDAO;
import dto.MyFlightDTO;
import java.util.List;

public class MyFlightBUS {
    private MyFlightDAO dao;

    public MyFlightBUS() {
        dao = new MyFlightDAO();
    }

    public List<MyFlightDTO> getMyFlights(String accountID) {
        return dao.getMyFlights(accountID);
    }

    public List<dto.MyFlightPassengerDTO> getPassengers(String bookingID, String flightID) {
        return dao.getPassengers(bookingID, flightID);
    }

    public boolean checkIn(String bookingID, String flightID) {
        return dao.checkIn(bookingID, flightID);
    }
}
