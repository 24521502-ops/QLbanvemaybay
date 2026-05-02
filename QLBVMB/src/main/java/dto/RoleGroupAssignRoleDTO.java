
package dto;

import java.util.Date;


public class RoleGroupAssignRoleDTO {
    private int roleGroupID;
    private int roleID;
    private Date createdAt;
    private Date updatedAt;
    private int isDeleted;

    public RoleGroupAssignRoleDTO() {}

    public RoleGroupAssignRoleDTO(int roleGroupID, int roleID, Date createdAt, Date updatedAt, int isDeleted) {
        this.roleGroupID = roleGroupID; this.roleID = roleID; this.createdAt = createdAt; this.updatedAt = updatedAt; this.isDeleted = isDeleted;
    }

    public int getRoleGroupID() { return roleGroupID; }
    public void setRoleGroupID(int roleGroupID) { this.roleGroupID = roleGroupID; }
    public int getRoleID() { return roleID; }
    public void setRoleID(int roleID) { this.roleID = roleID; }
    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }
    public Date getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Date updatedAt) { this.updatedAt = updatedAt; }
    public int getIsDeleted() { return isDeleted; }
    public void setIsDeleted(int isDeleted) { this.isDeleted = isDeleted; }

}
