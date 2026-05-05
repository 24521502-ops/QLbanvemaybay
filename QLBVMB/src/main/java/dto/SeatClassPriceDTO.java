package dto;

public class SeatClassPriceDTO {
    private String priceID;
    private String flightID;
    private String seatClass; 
    private Double price;

    public SeatClassPriceDTO() {}

    public SeatClassPriceDTO(String priceID, String flightID, String seatClass, Double price) {
        this.priceID = priceID; this.flightID = flightID; this.seatClass = seatClass; this.price = price;
    }

    public String getPriceID() { return priceID; }
    public void setPriceID(String priceID) { this.priceID = priceID; }
    public String getFlightID() { return flightID; }
    public void setFlightID(String flightID) { this.flightID = flightID; }
    public String getSeatClass() { return seatClass; }
    public void setSeatClass(String seatClass) { this.seatClass = seatClass; }
    public Double getPrice() { return price; }
    public void setPrice(Double price) { this.price = price; }
}