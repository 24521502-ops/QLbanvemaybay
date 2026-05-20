package dto;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class FlightSearchResultDTO {
    private String flightID;
    private String airlineName;
    private String aircraftModel;
    private String departureCode;
    private String arrivalCode;
    private Date departureTime;
    private Date arrivalTime;
    
    // Danh sách các hạng vé động
    private List<SeatClassInfo> seatClasses = new ArrayList<>();

    public FlightSearchResultDTO() {}

    public String getFlightID() { return flightID; }
    public void setFlightID(String flightID) { this.flightID = flightID; }
    
    public String getAirlineName() { return airlineName; }
    public void setAirlineName(String airlineName) { this.airlineName = airlineName; }
    
    public String getAircraftModel() { return aircraftModel; }
    public void setAircraftModel(String aircraftModel) { this.aircraftModel = aircraftModel; }
    
    public String getDepartureCode() { return departureCode; }
    public void setDepartureCode(String departureCode) { this.departureCode = departureCode; }
    
    public String getArrivalCode() { return arrivalCode; }
    public void setArrivalCode(String arrivalCode) { this.arrivalCode = arrivalCode; }
    
    public Date getDepartureTime() { return departureTime; }
    public void setDepartureTime(Date departureTime) { this.departureTime = departureTime; }
    
    public Date getArrivalTime() { return arrivalTime; }
    public void setArrivalTime(Date arrivalTime) { this.arrivalTime = arrivalTime; }

    public List<SeatClassInfo> getSeatClasses() { return seatClasses; }
    public void setSeatClasses(List<SeatClassInfo> seatClasses) { this.seatClasses = seatClasses; }
    
    public void addSeatClass(String className, double price, int seats) {
        this.seatClasses.add(new SeatClassInfo(className, price, seats));
    }

    public static class SeatClassInfo {
        private String className;
        private double price;
        private int availableSeats;

        public SeatClassInfo(String className, double price, int availableSeats) {
            this.className = className;
            this.price = price;
            this.availableSeats = availableSeats;
        }

        public String getClassName() { return className; }
        public double getPrice() { return price; }
        public int getAvailableSeats() { return availableSeats; }
    }
}
