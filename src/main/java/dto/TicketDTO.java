
package dto;


public class TicketDTO {
    private int ticketID;
    private int bookingID;
    private int flightID;
    private int seatID;
    private double price;
    private String ticketStatus;

    public TicketDTO() {}

    public TicketDTO(int ticketID, int bookingID, int flightID, int seatID, double price, String ticketStatus) {
        this.ticketID = ticketID; this.bookingID = bookingID; this.flightID = flightID; this.seatID = seatID; this.price = price; this.ticketStatus = ticketStatus;
    }

    public int getTicketID() { return ticketID; }
    public void setTicketID(int ticketID) { this.ticketID = ticketID; }
    public int getBookingID() { return bookingID; }
    public void setBookingID(int bookingID) { this.bookingID = bookingID; }
    public int getFlightID() { return flightID; }
    public void setFlightID(int flightID) { this.flightID = flightID; }
    public int getSeatID() { return seatID; }
    public void setSeatID(int seatID) { this.seatID = seatID; }
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
    public String getTicketStatus() { return ticketStatus; }
    public void setTicketStatus(String ticketStatus) { this.ticketStatus = ticketStatus; }

}
