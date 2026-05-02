
package dto;

import java.util.Date;


public class PaymentDTO {
    private int paymentID;
    private int bookingID;
    private Date paymentDate;
    private double amount;
    private String paymentMethod;
    private String paymentStatus;

    public PaymentDTO() {}

    public PaymentDTO(int paymentID, int bookingID, Date paymentDate, double amount, String paymentMethod, String paymentStatus) {
        this.paymentID = paymentID; this.bookingID = bookingID; this.paymentDate = paymentDate; this.amount = amount; this.paymentMethod = paymentMethod; this.paymentStatus = paymentStatus;
    }

    public int getPaymentID() { return paymentID; }
    public void setPaymentID(int paymentID) { this.paymentID = paymentID; }
    public int getBookingID() { return bookingID; }
    public void setBookingID(int bookingID) { this.bookingID = bookingID; }
    public Date getPaymentDate() { return paymentDate; }
    public void setPaymentDate(Date paymentDate) { this.paymentDate = paymentDate; }
    public double getAmount() { return amount; }
    public void setAmount(double amount) { this.amount = amount; }
    public String getPaymentMethod() { return paymentMethod; }
    public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; }
    public String getPaymentStatus() { return paymentStatus; }
    public void setPaymentStatus(String paymentStatus) { this.paymentStatus = paymentStatus; }

}
