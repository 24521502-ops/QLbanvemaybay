package dto;

public class SeatDTO {
    private String seatID;
    private String aircraftID;
    private String seatNumber;
    private String seatClass; 

    public SeatDTO() {}

    public SeatDTO(String seatID, String aircraftID, String seatNumber, String seatClass) {
        this.seatID = seatID; this.aircraftID = aircraftID; this.seatNumber = seatNumber; this.seatClass = seatClass;
    }

    public String getSeatID() { return seatID; }
    public void setSeatID(String seatID) { this.seatID = seatID; }
    public String getAircraftID() { return aircraftID; }
    public void setAircraftID(String aircraftID) { this.aircraftID = aircraftID; }
    public String getSeatNumber() { return seatNumber; }
    public void setSeatNumber(String seatNumber) { this.seatNumber = seatNumber; }
    public String getSeatClass() { return seatClass; }
    public void setSeatClass(String seatClass) { this.seatClass = seatClass; }
}