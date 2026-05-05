package dto;

import java.util.Date;

public class AccountAssignRoleDTO {
    private String accountID;
    private String roleID;
    private Date createdAt;
    private Date updatedAt;
    private Integer isDeleted;

    public AccountAssignRoleDTO() {}

    public AccountAssignRoleDTO(String accountID, String roleID, Date createdAt, Date updatedAt, Integer isDeleted) {
        this.accountID = accountID; this.roleID = roleID; this.createdAt = createdAt; this.updatedAt = updatedAt; this.isDeleted = isDeleted;
    }

    public String getAccountID() { return accountID; }
    public void setAccountID(String accountID) { this.accountID = accountID; }
    public String getRoleID() { return roleID; }
    public void setRoleID(String roleID) { this.roleID = roleID; }
    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }
    public Date getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Date updatedAt) { this.updatedAt = updatedAt; }
    public Integer getIsDeleted() { return isDeleted; }
    public void setIsDeleted(Integer isDeleted) { this.isDeleted = isDeleted; }
}