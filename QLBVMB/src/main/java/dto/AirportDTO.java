
package dto;

import java.util.Date;

public class AirportDTO {
    private int airportID;
    private String airportName;
    private String city;
    private String country;
    private String iataCode;

    public AirportDTO() {}

    public AirportDTO(int airportID, String airportName, String city, String country, String iataCode) {
        this.airportID = airportID; this.airportName = airportName; this.city = city; this.country = country; this.iataCode = iataCode;
    }

    public int getAirportID() { return airportID; }
    public void setAirportID(int airportID) { this.airportID = airportID; }
    public String getAirportName() { return airportName; }
    public void setAirportName(String airportName) { this.airportName = airportName; }
    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }
    public String getCountry() { return country; }
    public void setCountry(String country) { this.country = country; }
    public String getIataCode() { return iataCode; }
    public void setIataCode(String iataCode) { this.iataCode = iataCode; }
}
