
package dto;

import java.util.Date;

public class UsersDTO {
    private int userID;
    private String fullName;
    private String email;
    private Date createdAt;
    private Date updatedAt;
    private int isDeleted;

    public UsersDTO() {}

    public UsersDTO(int userID, String fullName, String email, Date createdAt, Date updatedAt, int isDeleted) {
        this.userID = userID; this.fullName = fullName; this.email = email; this.createdAt = createdAt; this.updatedAt = updatedAt; this.isDeleted = isDeleted;
    }

    public int getUserID() { return userID; }
    public void setUserID(int userID) { this.userID = userID; }
    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }
    public Date getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Date updatedAt) { this.updatedAt = updatedAt; }
    public int getIsDeleted() { return isDeleted; }
    public void setIsDeleted(int isDeleted) { this.isDeleted = isDeleted; }

}
