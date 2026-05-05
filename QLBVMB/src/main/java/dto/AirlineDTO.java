package dto;

<<<<<<< HEAD
=======

>>>>>>> 269a6f14206fe8801516b8183fa33338261b487c
public class AirlineDTO {
    private String airlineID;
    private String airlineName;
    private String country;
    private String phone;
    private String email;

    public AirlineDTO() {
    }

    public AirlineDTO(String airlineID, String airlineName, String country, String phone, String email) {
        this.airlineID = airlineID;
        this.airlineName = airlineName;
        this.country = country;
        this.phone = phone;
        this.email = email;
    }

    public String getAirlineID() {
        return airlineID;
    }

    public void setAirlineID(String airlineID) {
        this.airlineID = airlineID;
    }

    public String getAirlineName() {
        return airlineName;
    }

    public void setAirlineName(String airlineName) {
        this.airlineName = airlineName;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
