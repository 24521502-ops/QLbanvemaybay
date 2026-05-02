
package dto;


public class SeatClassPriceDTO {
    private int priceID;
    private int flightID;
    private String seatClass;
    private double price;

    public SeatClassPriceDTO() {}

    public SeatClassPriceDTO(int priceID, int flightID, String seatClass, double price) {
        this.priceID = priceID; this.flightID = flightID; this.seatClass = seatClass; this.price = price;
    }

    public int getPriceID() { return priceID; }
    public void setPriceID(int priceID) { this.priceID = priceID; }
    public int getFlightID() { return flightID; }
    public void setFlightID(int flightID) { this.flightID = flightID; }
    public String getSeatClass() { return seatClass; }
    public void setSeatClass(String seatClass) { this.seatClass = seatClass; }
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

}
