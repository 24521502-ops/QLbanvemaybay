package dto;

public class TicketDTO {
    private String ticketID;
    private String bookingID;
    private String flightID;
    private String seatID;
    private String passengerID;
    private Double price;
    private String ticketStatus;

    public TicketDTO() {}

    public TicketDTO(String ticketID, String bookingID, String flightID, String seatID, String passengerID, Double price, String ticketStatus) {
        this.ticketID = ticketID; this.bookingID = bookingID; this.flightID = flightID; this.seatID = seatID; this.passengerID = passengerID; this.price = price; this.ticketStatus = ticketStatus;
    }

    public String getTicketID() { return ticketID; }
    public void setTicketID(String ticketID) { this.ticketID = ticketID; }
    public String getBookingID() { return bookingID; }
    public void setBookingID(String bookingID) { this.bookingID = bookingID; }
    public String getFlightID() { return flightID; }
    public void setFlightID(String flightID) { this.flightID = flightID; }
    public String getSeatID() { return seatID; }
    public void setSeatID(String seatID) { this.seatID = seatID; }
    public String getPassengerID() { return passengerID; }
    public void setPassengerID(String passengerID) { this.passengerID = passengerID; }
    public Double getPrice() { return price; }
    public void setPrice(Double price) { this.price = price; }
    public String getTicketStatus() { return ticketStatus; }
    public void setTicketStatus(String ticketStatus) { this.ticketStatus = ticketStatus; }
}