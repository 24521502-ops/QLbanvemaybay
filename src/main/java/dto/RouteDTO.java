
package dto;


public class RouteDTO {
    private int routeID;
    private int departureAirportID;
    private int arrivalAirportID;
    private int distance;
    private int estimatedTime;

    public RouteDTO() {}

    public RouteDTO(int routeID, int departureAirportID, int arrivalAirportID, int distance, int estimatedTime) {
        this.routeID = routeID; this.departureAirportID = departureAirportID; this.arrivalAirportID = arrivalAirportID; this.distance = distance; this.estimatedTime = estimatedTime;
    }

    public int getRouteID() { return routeID; }
    public void setRouteID(int routeID) { this.routeID = routeID; }
    public int getDepartureAirportID() { return departureAirportID; }
    public void setDepartureAirportID(int departureAirportID) { this.departureAirportID = departureAirportID; }
    public int getArrivalAirportID() { return arrivalAirportID; }
    public void setArrivalAirportID(int arrivalAirportID) { this.arrivalAirportID = arrivalAirportID; }
    public int getDistance() { return distance; }
    public void setDistance(int distance) { this.distance = distance; }
    public int getEstimatedTime() { return estimatedTime; }
    public void setEstimatedTime(int estimatedTime) { this.estimatedTime = estimatedTime; }

}
