
package dto;

import java.util.Date;


public class AccountAssignRoleGroupDTO {
    private int accountID;
    private int roleGroupID;
    private Date createdAt;
    private Date updatedAt;
    private int isDeleted;

    public AccountAssignRoleGroupDTO() {}

    public AccountAssignRoleGroupDTO(int accountID, int roleGroupID, Date createdAt, Date updatedAt, int isDeleted) {
        this.accountID = accountID; this.roleGroupID = roleGroupID; this.createdAt = createdAt; this.updatedAt = updatedAt; this.isDeleted = isDeleted;
    }

    public int getAccountID() { return accountID; }
    public void setAccountID(int accountID) { this.accountID = accountID; }
    public int getRoleGroupID() { return roleGroupID; }
    public void setRoleGroupID(int roleGroupID) { this.roleGroupID = roleGroupID; }
    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }
    public Date getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Date updatedAt) { this.updatedAt = updatedAt; }
    public int getIsDeleted() { return isDeleted; }
    public void setIsDeleted(int isDeleted) { this.isDeleted = isDeleted; }

}
