package dto;

import java.util.Date;

public class PassengerDTO {
    private String passengerID;
    private String fullName;
    private String gender;
    private Date dateOfBirth;
    private String passportNumber;

    public PassengerDTO() {}

    public PassengerDTO(String passengerID, String fullName, String gender, Date dateOfBirth, String passportNumber) {
        this.passengerID = passengerID; this.fullName = fullName; this.gender = gender; this.dateOfBirth = dateOfBirth; this.passportNumber = passportNumber;
    }

    public String getPassengerID() { return passengerID; }
    public void setPassengerID(String passengerID) { this.passengerID = passengerID; }
    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }
    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }
    public Date getDateOfBirth() { return dateOfBirth; }
    public void setDateOfBirth(Date dateOfBirth) { this.dateOfBirth = dateOfBirth; }
    public String getPassportNumber() { return passportNumber; }
    public void setPassportNumber(String passportNumber) { this.passportNumber = passportNumber; }
}