package dto;

import java.util.Date;

public class UsersDTO {
    private String userID;
    private String fullName;
    private String email;
    private Date createdAt;
    private Date updatedAt;
    private Integer isDeleted;

    public UsersDTO() {}

    public UsersDTO(String userID, String fullName, String email, Date createdAt, Date updatedAt, Integer isDeleted) {
        this.userID = userID; this.fullName = fullName; this.email = email; this.createdAt = createdAt; this.updatedAt = updatedAt; this.isDeleted = isDeleted;
    }

    public String getUserID() { return userID; }
    public void setUserID(String userID) { this.userID = userID; }
    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }
    public Date getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Date updatedAt) { this.updatedAt = updatedAt; }
    public Integer getIsDeleted() { return isDeleted; }
    public void setIsDeleted(Integer isDeleted) { this.isDeleted = isDeleted; }
}