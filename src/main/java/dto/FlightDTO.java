
package dto;

import java.util.Date;

public class FlightDTO {
    private int flightID;
    private String flightNumber;
    private int airlineID;
    private int aircraftID;
    private int departureAirportID;
    private int arrivalAirportID;
    private int routeID;
    private Date departureTime;
    private Date arrivalTime;
    private String flightStatus;

    public FlightDTO() {}

    public FlightDTO(int flightID, String flightNumber, int airlineID, int aircraftID, int departureAirportID, int arrivalAirportID, int routeID, Date departureTime, Date arrivalTime, String flightStatus) {
        this.flightID = flightID; this.flightNumber = flightNumber; this.airlineID = airlineID; this.aircraftID = aircraftID; this.departureAirportID = departureAirportID; this.arrivalAirportID = arrivalAirportID; this.routeID = routeID; this.departureTime = departureTime; this.arrivalTime = arrivalTime; this.flightStatus = flightStatus;
    }

    public int getFlightID() { return flightID; }
    public void setFlightID(int flightID) { this.flightID = flightID; }
    public String getFlightNumber() { return flightNumber; }
    public void setFlightNumber(String flightNumber) { this.flightNumber = flightNumber; }
    public int getAirlineID() { return airlineID; }
    public void setAirlineID(int airlineID) { this.airlineID = airlineID; }
    public int getAircraftID() { return aircraftID; }
    public void setAircraftID(int aircraftID) { this.aircraftID = aircraftID; }
    public int getDepartureAirportID() { return departureAirportID; }
    public void setDepartureAirportID(int departureAirportID) { this.departureAirportID = departureAirportID; }
    public int getArrivalAirportID() { return arrivalAirportID; }
    public void setArrivalAirportID(int arrivalAirportID) { this.arrivalAirportID = arrivalAirportID; }
    public int getRouteID() { return routeID; }
    public void setRouteID(int routeID) { this.routeID = routeID; }
    public Date getDepartureTime() { return departureTime; }
    public void setDepartureTime(Date departureTime) { this.departureTime = departureTime; }
    public Date getArrivalTime() { return arrivalTime; }
    public void setArrivalTime(Date arrivalTime) { this.arrivalTime = arrivalTime; }
    public String getFlightStatus() { return flightStatus; }
    public void setFlightStatus(String flightStatus) { this.flightStatus = flightStatus; }

}
