
package dto;

import java.util.Date;


public class BookingDTO {
    private int bookingID;
    private int customerID;
    private int employeeID;
    private Date bookingDate;
    private double totalAmount;
    private String status;

    public BookingDTO() {}

    public BookingDTO(int bookingID, int customerID, int employeeID, Date bookingDate, double totalAmount, String status) {
        this.bookingID = bookingID; this.customerID = customerID; this.employeeID = employeeID; this.bookingDate = bookingDate; this.totalAmount = totalAmount; this.status = status;
    }

    public int getBookingID() { return bookingID; }
    public void setBookingID(int bookingID) { this.bookingID = bookingID; }
    public int getCustomerID() { return customerID; }
    public void setCustomerID(int customerID) { this.customerID = customerID; }
    public int getEmployeeID() { return employeeID; }
    public void setEmployeeID(int employeeID) { this.employeeID = employeeID; }
    public Date getBookingDate() { return bookingDate; }
    public void setBookingDate(Date bookingDate) { this.bookingDate = bookingDate; }
    public double getTotalAmount() { return totalAmount; }
    public void setTotalAmount(double totalAmount) { this.totalAmount = totalAmount; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

}
