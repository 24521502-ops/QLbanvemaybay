package dto;

import java.util.Date;

public class RoleGroupAssignRoleDTO {
    private String roleGroupID;
    private String roleID;
    private Date createdAt;
    private Date updatedAt;
    private Integer isDeleted;

    public RoleGroupAssignRoleDTO() {}

    public RoleGroupAssignRoleDTO(String roleGroupID, String roleID, Date createdAt, Date updatedAt, Integer isDeleted) {
        this.roleGroupID = roleGroupID; this.roleID = roleID; this.createdAt = createdAt; this.updatedAt = updatedAt; this.isDeleted = isDeleted;
    }

    public String getRoleGroupID() { return roleGroupID; }
    public void setRoleGroupID(String roleGroupID) { this.roleGroupID = roleGroupID; }
    public String getRoleID() { return roleID; }
    public void setRoleID(String roleID) { this.roleID = roleID; }
    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }
    public Date getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Date updatedAt) { this.updatedAt = updatedAt; }
    public Integer getIsDeleted() { return isDeleted; }
    public void setIsDeleted(Integer isDeleted) { this.isDeleted = isDeleted; }
}