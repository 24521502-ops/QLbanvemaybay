
package dto;

public class SeatDTO {
    private int seatID;
    private int aircraftID;
    private String seatNumber;
    private String seatClass;

    public SeatDTO() {}

    public SeatDTO(int seatID, int aircraftID, String seatNumber, String seatClass) {
        this.seatID = seatID; this.aircraftID = aircraftID; this.seatNumber = seatNumber; this.seatClass = seatClass;
    }

    public int getSeatID() { return seatID; }
    public void setSeatID(int seatID) { this.seatID = seatID; }
    public int getAircraftID() { return aircraftID; }
    public void setAircraftID(int aircraftID) { this.aircraftID = aircraftID; }
    public String getSeatNumber() { return seatNumber; }
    public void setSeatNumber(String seatNumber) { this.seatNumber = seatNumber; }
    public String getSeatClass() { return seatClass; }
    public void setSeatClass(String seatClass) { this.seatClass = seatClass; }

}
