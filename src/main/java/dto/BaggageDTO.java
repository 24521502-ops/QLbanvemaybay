
package dto;


public class BaggageDTO {
    private int baggageID;
    private int ticketID;
    private double weight;
    private String baggageType;

    public BaggageDTO() {}

    public BaggageDTO(int baggageID, int ticketID, double weight, String baggageType) {
        this.baggageID = baggageID; this.ticketID = ticketID; this.weight = weight; this.baggageType = baggageType;
    }

    public int getBaggageID() { return baggageID; }
    public void setBaggageID(int baggageID) { this.baggageID = baggageID; }
    public int getTicketID() { return ticketID; }
    public void setTicketID(int ticketID) { this.ticketID = ticketID; }
    public double getWeight() { return weight; }
    public void setWeight(double weight) { this.weight = weight; }
    public String getBaggageType() { return baggageType; }
    public void setBaggageType(String baggageType) { this.baggageType = baggageType; }

}
