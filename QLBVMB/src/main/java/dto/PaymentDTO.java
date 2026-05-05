package dto;

import java.util.Date;

public class PaymentDTO {
    private String paymentID;
    private String bookingID;
    private Date paymentDate;
    private Double amount;
    private String paymentMethod;
    private String paymentStatus;

    public PaymentDTO() {}

    public PaymentDTO(String paymentID, String bookingID, Date paymentDate, Double amount, String paymentMethod, String paymentStatus) {
        this.paymentID = paymentID; this.bookingID = bookingID; this.paymentDate = paymentDate; this.amount = amount; this.paymentMethod = paymentMethod; this.paymentStatus = paymentStatus;
    }

    public String getPaymentID() { return paymentID; }
    public void setPaymentID(String paymentID) { this.paymentID = paymentID; }
    public String getBookingID() { return bookingID; }
    public void setBookingID(String bookingID) { this.bookingID = bookingID; }
    public Date getPaymentDate() { return paymentDate; }
    public void setPaymentDate(Date paymentDate) { this.paymentDate = paymentDate; }
    public Double getAmount() { return amount; }
    public void setAmount(Double amount) { this.amount = amount; }
    public String getPaymentMethod() { return paymentMethod; }
    public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; }
    public String getPaymentStatus() { return paymentStatus; }
    public void setPaymentStatus(String paymentStatus) { this.paymentStatus = paymentStatus; }
}