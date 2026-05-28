package dto;

public class NotificationDTO {
    private String type; // "FLIGHT_URGENT", "BOOKING_EXPIRING"
    private String message;
    private String timeInfo;
    private String referenceId; // FlightID or BookingID

    public NotificationDTO() {
    }

    public NotificationDTO(String type, String message, String timeInfo, String referenceId) {
        this.type = type;
        this.message = message;
        this.timeInfo = timeInfo;
        this.referenceId = referenceId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getTimeInfo() {
        return timeInfo;
    }

    public void setTimeInfo(String timeInfo) {
        this.timeInfo = timeInfo;
    }

    public String getReferenceId() {
        return referenceId;
    }

    public void setReferenceId(String referenceId) {
        this.referenceId = referenceId;
    }
}
