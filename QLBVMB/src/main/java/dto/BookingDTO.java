package dto;

import java.util.Date;

public class BookingDTO {
    private String bookingID;
    private String customerID;
    private String employeeID;
    private Date bookingDate;
    private Double totalAmount;
    private String status;

    public BookingDTO() {}

    public BookingDTO(String bookingID, String customerID, String employeeID, Date bookingDate, Double totalAmount, String status) {
        this.bookingID = bookingID; this.customerID = customerID; this.employeeID = employeeID; this.bookingDate = bookingDate; this.totalAmount = totalAmount; this.status = status;
    }

    public String getBookingID() { return bookingID; }
    public void setBookingID(String bookingID) { this.bookingID = bookingID; }
    public String getCustomerID() { return customerID; }
    public void setCustomerID(String customerID) { this.customerID = customerID; }
    public String getEmployeeID() { return employeeID; }
    public void setEmployeeID(String employeeID) { this.employeeID = employeeID; }
    public Date getBookingDate() { return bookingDate; }
    public void setBookingDate(Date bookingDate) { this.bookingDate = bookingDate; }
    public Double getTotalAmount() { return totalAmount; }
    public void setTotalAmount(Double totalAmount) { this.totalAmount = totalAmount; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}