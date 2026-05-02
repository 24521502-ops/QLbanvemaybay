
package dto;

import java.util.Date;

public class AirlineDTO {
    private int airlineID;
    private String airlineName;
    private String country;
    private String phone;
    private String email;

    public AirlineDTO() {}

    public AirlineDTO(int airlineID, String airlineName, String country, String phone, String email) {
        this.airlineID = airlineID; this.airlineName = airlineName; this.country = country; this.phone = phone; this.email = email;
    }

    public int getAirlineID() { return airlineID; }
    public void setAirlineID(int airlineID) { this.airlineID = airlineID; }
    public String getAirlineName() { return airlineName; }
    public void setAirlineName(String airlineName) { this.airlineName = airlineName; }
    public String getCountry() { return country; }
    public void setCountry(String country) { this.country = country; }
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
}
