
package dto;

import java.util.Date;


public class CustomerDTO {
    private int customerID;
    private int accountID;
    private String fullName;
    private String gender;
    private Date dateOfBirth;
    private String phone;
    private String email;
    private String passportNumber;
    private String nationality;

    public CustomerDTO() {}

    public CustomerDTO(int customerID, int accountID, String fullName, String gender, Date dateOfBirth, String phone, String email, String passportNumber, String nationality) {
        this.customerID = customerID; this.accountID = accountID; this.fullName = fullName; this.gender = gender; this.dateOfBirth = dateOfBirth; this.phone = phone; this.email = email; this.passportNumber = passportNumber; this.nationality = nationality;
    }

    public int getCustomerID() { return customerID; }
    public void setCustomerID(int customerID) { this.customerID = customerID; }
    public int getAccountID() { return accountID; }
    public void setAccountID(int accountID) { this.accountID = accountID; }
    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }
    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }
    public Date getDateOfBirth() { return dateOfBirth; }
    public void setDateOfBirth(Date dateOfBirth) { this.dateOfBirth = dateOfBirth; }
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPassportNumber() { return passportNumber; }
    public void setPassportNumber(String passportNumber) { this.passportNumber = passportNumber; }
    public String getNationality() { return nationality; }
    public void setNationality(String nationality) { this.nationality = nationality; }

}
