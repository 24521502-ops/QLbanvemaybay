
package dto;

import java.util.Date;

public class AircraftDTO {
    private int aircraftID;
    private int airlineID;
    private String model;
    private int capacity;
    private int manufactureYear;

    public AircraftDTO() {}

    public AircraftDTO(int aircraftID, int airlineID, String model, int capacity, int manufactureYear) {
        this.aircraftID = aircraftID; this.airlineID = airlineID; this.model = model; this.capacity = capacity; this.manufactureYear = manufactureYear;
    }

    public int getAircraftID() { return aircraftID; }
    public void setAircraftID(int aircraftID) { this.aircraftID = aircraftID; }
    public int getAirlineID() { return airlineID; }
    public void setAirlineID(int airlineID) { this.airlineID = airlineID; }
    public String getModel() { return model; }
    public void setModel(String model) { this.model = model; }
    public int getCapacity() { return capacity; }
    public void setCapacity(int capacity) { this.capacity = capacity; }
    public int getManufactureYear() { return manufactureYear; }
    public void setManufactureYear(int manufactureYear) { this.manufactureYear = manufactureYear; }

}
