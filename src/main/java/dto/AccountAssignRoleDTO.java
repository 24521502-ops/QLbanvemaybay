
package dto;

import java.util.Date;


public class AccountAssignRoleDTO {
    private int accountID;
    private int roleID;
    private Date createdAt;
    private Date updatedAt;
    private int isDeleted;

    public AccountAssignRoleDTO() {}

    public AccountAssignRoleDTO(int accountID, int roleID, Date createdAt, Date updatedAt, int isDeleted) {
        this.accountID = accountID; this.roleID = roleID; this.createdAt = createdAt; this.updatedAt = updatedAt; this.isDeleted = isDeleted;
    }

    public int getAccountID() { return accountID; }
    public void setAccountID(int accountID) { this.accountID = accountID; }
    public int getRoleID() { return roleID; }
    public void setRoleID(int roleID) { this.roleID = roleID; }
    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }
    public Date getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Date updatedAt) { this.updatedAt = updatedAt; }
    public int getIsDeleted() { return isDeleted; }
    public void setIsDeleted(int isDeleted) { this.isDeleted = isDeleted; }

}
