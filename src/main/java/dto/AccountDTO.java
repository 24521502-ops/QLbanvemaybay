
package dto;

import java.util.Date;


public class AccountDTO {
    private int accountID;
    private int userID;
    private String userName;
    private String password;
    private String status;
    private Date createdAt;
    private Date updatedAt;
    private int isDeleted;

    public AccountDTO() {}

    public AccountDTO(int accountID, int userID, String userName, String password, String status, Date createdAt, Date updatedAt, int isDeleted) {
        this.accountID = accountID; this.userID = userID; this.userName = userName; this.password = password; this.status = status; this.createdAt = createdAt; this.updatedAt = updatedAt; this.isDeleted = isDeleted;
    }

    public int getAccountID() { return accountID; }
    public void setAccountID(int accountID) { this.accountID = accountID; }
    public int getUserID() { return userID; }
    public void setUserID(int userID) { this.userID = userID; }
    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }
    public Date getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Date updatedAt) { this.updatedAt = updatedAt; }
    public int getIsDeleted() { return isDeleted; }
    public void setIsDeleted(int isDeleted) { this.isDeleted = isDeleted; }

}
