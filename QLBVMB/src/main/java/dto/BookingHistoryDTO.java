package dto;

import java.sql.Timestamp;

public class BookingHistoryDTO {
    private String bookingID;
    private Timestamp bookingDate;
    private double totalAmount;
    private String bookingStatus;
    private String paymentMethod;
    private Timestamp departureTime;
    private String depIATA;
    private String arrIATA;
    private int ticketCount;
    private int checkedInCount;

    public String getBookingID() { return bookingID; }
    public void setBookingID(String bookingID) { this.bookingID = bookingID; }

    public Timestamp getBookingDate() { return bookingDate; }
    public void setBookingDate(Timestamp bookingDate) { this.bookingDate = bookingDate; }

    public double getTotalAmount() { return totalAmount; }
    public void setTotalAmount(double totalAmount) { this.totalAmount = totalAmount; }

    public String getBookingStatus() { return bookingStatus; }
    public void setBookingStatus(String bookingStatus) { this.bookingStatus = bookingStatus; }

    public String getPaymentMethod() { return paymentMethod; }
    public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; }

    public Timestamp getDepartureTime() { return departureTime; }
    public void setDepartureTime(Timestamp departureTime) { this.departureTime = departureTime; }

    public String getDepIATA() { return depIATA; }
    public void setDepIATA(String depIATA) { this.depIATA = depIATA; }

    public String getArrIATA() { return arrIATA; }
    public void setArrIATA(String arrIATA) { this.arrIATA = arrIATA; }

    public int getTicketCount() { return ticketCount; }
    public void setTicketCount(int ticketCount) { this.ticketCount = ticketCount; }

    public int getCheckedInCount() { return checkedInCount; }
    public void setCheckedInCount(int checkedInCount) { this.checkedInCount = checkedInCount; }
}
