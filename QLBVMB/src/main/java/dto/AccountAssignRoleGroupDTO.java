package dto;

import java.util.Date;

public class AccountAssignRoleGroupDTO {
    private String accountID;
    private String roleGroupID;
    private Date createdAt;
    private Date updatedAt;
    private Integer isDeleted;

    public AccountAssignRoleGroupDTO() {}

    public AccountAssignRoleGroupDTO(String accountID, String roleGroupID, Date createdAt, Date updatedAt, Integer isDeleted) {
        this.accountID = accountID; this.roleGroupID = roleGroupID; this.createdAt = createdAt; this.updatedAt = updatedAt; this.isDeleted = isDeleted;
    }

    public String getAccountID() { return accountID; }
    public void setAccountID(String accountID) { this.accountID = accountID; }
    public String getRoleGroupID() { return roleGroupID; }
    public void setRoleGroupID(String roleGroupID) { this.roleGroupID = roleGroupID; }
    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }
    public Date getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Date updatedAt) { this.updatedAt = updatedAt; }
    public Integer getIsDeleted() { return isDeleted; }
    public void setIsDeleted(Integer isDeleted) { this.isDeleted = isDeleted; }
}