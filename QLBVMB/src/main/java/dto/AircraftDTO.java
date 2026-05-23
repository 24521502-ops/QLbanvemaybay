package dto;

public class AircraftDTO {
    private String aircraftID;
    private String airlineID;
    private String model;
    private Integer capacity;
    private Integer manufactureYear;
    
    private int firstSeats;
    private int busSeats;
    private int premSeats;
    private int ecoSeats;

    public AircraftDTO() {}

    public AircraftDTO(String aircraftID, String airlineID, String model, Integer capacity, Integer manufactureYear) {
        this.aircraftID = aircraftID; this.airlineID = airlineID; this.model = model; this.capacity = capacity; this.manufactureYear = manufactureYear;
    }

    public String getAircraftID() { return aircraftID; }
    public void setAircraftID(String aircraftID) { this.aircraftID = aircraftID; }
    public String getAirlineID() { return airlineID; }
    public void setAirlineID(String airlineID) { this.airlineID = airlineID; }
    public String getModel() { return model; }
    public void setModel(String model) { this.model = model; }
    public Integer getCapacity() { return capacity; }
    public void setCapacity(Integer capacity) { this.capacity = capacity; }
    public Integer getManufactureYear() { return manufactureYear; }
    public void setManufactureYear(Integer manufactureYear) { this.manufactureYear = manufactureYear; }

    public int getFirstSeats() { return firstSeats; }
    public void setFirstSeats(int firstSeats) { this.firstSeats = firstSeats; }
    public int getBusSeats() { return busSeats; }
    public void setBusSeats(int busSeats) { this.busSeats = busSeats; }
    public int getPremSeats() { return premSeats; }
    public void setPremSeats(int premSeats) { this.premSeats = premSeats; }
    public int getEcoSeats() { return ecoSeats; }
    public void setEcoSeats(int ecoSeats) { this.ecoSeats = ecoSeats; }
}