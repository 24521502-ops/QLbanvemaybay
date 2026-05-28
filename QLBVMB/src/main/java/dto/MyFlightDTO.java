package dto;

import java.util.Date;

public class MyFlightDTO {
    private String bookingID;
    private String flightID;
    private String departureIATA;
    private String arrivalIATA;
    private String departureCity;
    private String arrivalCity;
    private String airlineName;
    private String flightNumber;
    private String ticketStatus;
    private Date departureTime;
    private Date arrivalTime;
    private String gate;
    private String seats;
    private int estimatedTime; // in minutes

    public MyFlightDTO() {}

    public String getBookingID() { return bookingID; }
    public void setBookingID(String bookingID) { this.bookingID = bookingID; }

    public String getFlightID() { return flightID; }
    public void setFlightID(String flightID) { this.flightID = flightID; }

    public String getDepartureIATA() { return departureIATA; }
    public void setDepartureIATA(String departureIATA) { this.departureIATA = departureIATA; }

    public String getArrivalIATA() { return arrivalIATA; }
    public void setArrivalIATA(String arrivalIATA) { this.arrivalIATA = arrivalIATA; }

    public String getDepartureCity() { return departureCity; }
    public void setDepartureCity(String departureCity) { this.departureCity = departureCity; }

    public String getArrivalCity() { return arrivalCity; }
    public void setArrivalCity(String arrivalCity) { this.arrivalCity = arrivalCity; }

    public String getAirlineName() { return airlineName; }
    public void setAirlineName(String airlineName) { this.airlineName = airlineName; }

    public String getFlightNumber() { return flightNumber; }
    public void setFlightNumber(String flightNumber) { this.flightNumber = flightNumber; }

    public String getTicketStatus() { return ticketStatus; }
    public void setTicketStatus(String ticketStatus) { this.ticketStatus = ticketStatus; }

    public Date getDepartureTime() { return departureTime; }
    public void setDepartureTime(Date departureTime) { this.departureTime = departureTime; }

    public Date getArrivalTime() { return arrivalTime; }
    public void setArrivalTime(Date arrivalTime) { this.arrivalTime = arrivalTime; }

    public String getGate() { return gate; }
    public void setGate(String gate) { this.gate = gate; }

    public String getSeats() { return seats; }
    public void setSeats(String seats) { this.seats = seats; }

    public int getEstimatedTime() { return estimatedTime; }
    public void setEstimatedTime(int estimatedTime) { this.estimatedTime = estimatedTime; }
}
