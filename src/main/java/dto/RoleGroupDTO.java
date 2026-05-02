
package dto;

import java.util.Date;


public class RoleGroupDTO {
    private int roleGroupID;
    private String nameRoleGroup;
    private Date createdAt;
    private Date updatedAt;
    private int isDeleted;

    public RoleGroupDTO() {}

    public RoleGroupDTO(int roleGroupID, String nameRoleGroup, Date createdAt, Date updatedAt, int isDeleted) {
        this.roleGroupID = roleGroupID; this.nameRoleGroup = nameRoleGroup; this.createdAt = createdAt; this.updatedAt = updatedAt; this.isDeleted = isDeleted;
    }

    public int getRoleGroupID() { return roleGroupID; }
    public void setRoleGroupID(int roleGroupID) { this.roleGroupID = roleGroupID; }
    public String getNameRoleGroup() { return nameRoleGroup; }
    public void setNameRoleGroup(String nameRoleGroup) { this.nameRoleGroup = nameRoleGroup; }
    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }
    public Date getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Date updatedAt) { this.updatedAt = updatedAt; }
    public int getIsDeleted() { return isDeleted; }
    public void setIsDeleted(int isDeleted) { this.isDeleted = isDeleted; }

}
