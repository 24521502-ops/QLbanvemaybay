
package dto;

import java.util.Date;


public class TransactionHistoryDTO {
    private int transactionID;
    private int customerID;
    private int bookingID;
    private int paymentID;
    private String transactionType;
    private double amount;
    private Date transactionDate;
    private String description;

    public TransactionHistoryDTO() {}

    public TransactionHistoryDTO(int transactionID, int customerID, int bookingID, int paymentID, String transactionType, double amount, Date transactionDate, String description) {
        this.transactionID = transactionID; this.customerID = customerID; this.bookingID = bookingID; this.paymentID = paymentID; this.transactionType = transactionType; this.amount = amount; this.transactionDate = transactionDate; this.description = description;
    }

    public int getTransactionID() { return transactionID; }
    public void setTransactionID(int transactionID) { this.transactionID = transactionID; }
    public int getCustomerID() { return customerID; }
    public void setCustomerID(int customerID) { this.customerID = customerID; }
    public int getBookingID() { return bookingID; }
    public void setBookingID(int bookingID) { this.bookingID = bookingID; }
    public int getPaymentID() { return paymentID; }
    public void setPaymentID(int paymentID) { this.paymentID = paymentID; }
    public String getTransactionType() { return transactionType; }
    public void setTransactionType(String transactionType) { this.transactionType = transactionType; }
    public double getAmount() { return amount; }
    public void setAmount(double amount) { this.amount = amount; }
    public Date getTransactionDate() { return transactionDate; }
    public void setTransactionDate(Date transactionDate) { this.transactionDate = transactionDate; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

}
