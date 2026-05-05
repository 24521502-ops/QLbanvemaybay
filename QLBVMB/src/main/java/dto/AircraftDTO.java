package dto;

public class AircraftDTO {
    private String aircraftID;
    private String airlineID;
    private String model;
    private Integer capacity;
    private Integer manufactureYear;

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
}