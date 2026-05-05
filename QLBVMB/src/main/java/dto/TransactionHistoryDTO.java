package dto;

import java.util.Date;

public class TransactionHistoryDTO {
    private String transactionID;
    private String customerID;
    private String bookingID;
    private String paymentID;
    private String transactionType;
    private Double amount;
    private Date transactionDate;
    private String description;

    public TransactionHistoryDTO() {}

    public TransactionHistoryDTO(String transactionID, String customerID, String bookingID, String paymentID, String transactionType, Double amount, Date transactionDate, String description) {
        this.transactionID = transactionID; this.customerID = customerID; this.bookingID = bookingID; this.paymentID = paymentID; this.transactionType = transactionType; this.amount = amount; this.transactionDate = transactionDate; this.description = description;
    }

    public String getTransactionID() { return transactionID; }
    public void setTransactionID(String transactionID) { this.transactionID = transactionID; }
    public String getCustomerID() { return customerID; }
    public void setCustomerID(String customerID) { this.customerID = customerID; }
    public String getBookingID() { return bookingID; }
    public void setBookingID(String bookingID) { this.bookingID = bookingID; }
    public String getPaymentID() { return paymentID; }
    public void setPaymentID(String paymentID) { this.paymentID = paymentID; }
    public String getTransactionType() { return transactionType; }
    public void setTransactionType(String transactionType) { this.transactionType = transactionType; }
    public Double getAmount() { return amount; }
    public void setAmount(Double amount) { this.amount = amount; }
    public Date getTransactionDate() { return transactionDate; }
    public void setTransactionDate(Date transactionDate) { this.transactionDate = transactionDate; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
}