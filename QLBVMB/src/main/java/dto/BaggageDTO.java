package dto;

public class BaggageDTO {
    private String baggageID;
    private String ticketID;
    private Double weight;
    private String baggageType;

    public BaggageDTO() {}

    public BaggageDTO(String baggageID, String ticketID, Double weight, String baggageType) {
        this.baggageID = baggageID; this.ticketID = ticketID; this.weight = weight; this.baggageType = baggageType;
    }

    public String getBaggageID() { return baggageID; }
    public void setBaggageID(String baggageID) { this.baggageID = baggageID; }
    public String getTicketID() { return ticketID; }
    public void setTicketID(String ticketID) { this.ticketID = ticketID; }
    public Double getWeight() { return weight; }
    public void setWeight(Double weight) { this.weight = weight; }
    public String getBaggageType() { return baggageType; }
    public void setBaggageType(String baggageType) { this.baggageType = baggageType; }
}