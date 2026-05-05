package dto;

public class RouteDTO {
    private String routeID;
    private String departureAirportID;
    private String arrivalAirportID;
    private Double distance;
    private Double estimatedTime;

    public RouteDTO() {}

    public RouteDTO(String routeID, String departureAirportID, String arrivalAirportID, Double distance, Double estimatedTime) {
        this.routeID = routeID; this.departureAirportID = departureAirportID; this.arrivalAirportID = arrivalAirportID; this.distance = distance; this.estimatedTime = estimatedTime;
    }

    public String getRouteID() { return routeID; }
    public void setRouteID(String routeID) { this.routeID = routeID; }
    public String getDepartureAirportID() { return departureAirportID; }
    public void setDepartureAirportID(String departureAirportID) { this.departureAirportID = departureAirportID; }
    public String getArrivalAirportID() { return arrivalAirportID; }
    public void setArrivalAirportID(String arrivalAirportID) { this.arrivalAirportID = arrivalAirportID; }
    public Double getDistance() { return distance; }
    public void setDistance(Double distance) { this.distance = distance; }
    public Double getEstimatedTime() { return estimatedTime; }
    public void setEstimatedTime(Double estimatedTime) { this.estimatedTime = estimatedTime; }
}