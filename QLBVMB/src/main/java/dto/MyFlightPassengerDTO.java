package dto;

import java.util.Date;

public class MyFlightPassengerDTO {
    private String fullName;
    private String passportNumber;
    private String seatNumber;
    private Date dateOfBirth;
    private String flightNumber;
    private String route;

    public MyFlightPassengerDTO() {}

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getPassportNumber() { return passportNumber; }
    public void setPassportNumber(String passportNumber) { this.passportNumber = passportNumber; }

    public String getSeatNumber() { return seatNumber; }
    public void setSeatNumber(String seatNumber) { this.seatNumber = seatNumber; }

    public Date getDateOfBirth() { return dateOfBirth; }
    public void setDateOfBirth(Date dateOfBirth) { this.dateOfBirth = dateOfBirth; }

    public String getFlightNumber() { return flightNumber; }
    public void setFlightNumber(String flightNumber) { this.flightNumber = flightNumber; }

    public String getRoute() { return route; }
    public void setRoute(String route) { this.route = route; }

    public boolean isAdult() {
        if (dateOfBirth == null) return true;
        long diff = new Date().getTime() - dateOfBirth.getTime();
        long years = diff / (1000L * 60 * 60 * 24 * 365);
        return years >= 12;
    }
}
