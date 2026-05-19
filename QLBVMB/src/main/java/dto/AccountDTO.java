package dto;

import java.util.Date;

public class AccountDTO {
    private String accountID;
    private String userID;
    private String userName;
    private String password;
    private String status;
    private Date createdAt;
    private Date updatedAt;
    private Integer isDeleted;
    private String roleGroup;

    public AccountDTO() {}

    public AccountDTO(String accountID, String userID, String userName, String password, String status, Date createdAt, Date updatedAt, Integer isDeleted) {
        this.accountID = accountID; this.userID = userID; this.userName = userName; this.password = password; this.status = status; this.createdAt = createdAt; this.updatedAt = updatedAt; this.isDeleted = isDeleted;
    }

    public String getAccountID() { return accountID; }
    public void setAccountID(String accountID) { this.accountID = accountID; }
    public String getUserID() { return userID; }
    public void setUserID(String userID) { this.userID = userID; }
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
    public Integer getIsDeleted() { return isDeleted; }
    public void setIsDeleted(Integer isDeleted) { this.isDeleted = isDeleted; }
    public String getRoleGroup() { return roleGroup; }
    public void setRoleGroup(String roleGroup) { this.roleGroup = roleGroup; }
}