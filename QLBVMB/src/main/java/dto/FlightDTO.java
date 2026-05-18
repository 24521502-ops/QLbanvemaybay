package dto;

import java.util.Date;

public class FlightDTO {
    private String flightID;
    private String flightNumber;
    private String airlineID;
    private String aircraftID;
    private String routeID;
    private Date departureTime;
    private Date arrivalTime;
    private String gate;
    private String flightStatus;

    public FlightDTO() {
    }

    public FlightDTO(String flightID, String flightNumber, String airlineID, String aircraftID, String routeID,
            Date departureTime, Date arrivalTime, String gate, String flightStatus) {
        this.flightID = flightID;
        this.flightNumber = flightNumber;
        this.airlineID = airlineID;
        this.aircraftID = aircraftID;
        this.routeID = routeID;
        this.departureTime = departureTime;
        this.arrivalTime = arrivalTime;
        this.gate = gate;
        this.flightStatus = flightStatus;
    }

    public String getFlightID() {
        return flightID;
    }

    public void setFlightID(String flightID) {
        this.flightID = flightID;
    }

    public String getFlightNumber() {
        return flightNumber;
    }

    public void setFlightNumber(String flightNumber) {
        this.flightNumber = flightNumber;
    }

    public String getAirlineID() {
        return airlineID;
    }

    public void setAirlineID(String airlineID) {
        this.airlineID = airlineID;
    }

    public String getAircraftID() {
        return aircraftID;
    }

    public void setAircraftID(String aircraftID) {
        this.aircraftID = aircraftID;
    }

    public String getRouteID() {
        return routeID;
    }

    public void setRouteID(String routeID) {
        this.routeID = routeID;
    }

    public Date getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(Date departureTime) {
        this.departureTime = departureTime;
    }

    public Date getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(Date arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    public String getGate() {
        return gate;
    }

    public void setGate(String gate) {
        this.gate = gate;
    }

    public String getFlightStatus() {
        return flightStatus;
    }

    public void setFlightStatus(String flightStatus) {
        this.flightStatus = flightStatus;
    }
}