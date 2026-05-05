package dto;

import java.util.Date;

public class RoleGroupDTO {
    private String roleGroupID;
    private String nameRoleGroup;
    private Date createdAt;
    private Date updatedAt;
    private Integer isDeleted;

    public RoleGroupDTO() {}

    public RoleGroupDTO(String roleGroupID, String nameRoleGroup, Date createdAt, Date updatedAt, Integer isDeleted) {
        this.roleGroupID = roleGroupID; this.nameRoleGroup = nameRoleGroup; this.createdAt = createdAt; this.updatedAt = updatedAt; this.isDeleted = isDeleted;
    }

    public String getRoleGroupID() { return roleGroupID; }
    public void setRoleGroupID(String roleGroupID) { this.roleGroupID = roleGroupID; }
    public String getNameRoleGroup() { return nameRoleGroup; }
    public void setNameRoleGroup(String nameRoleGroup) { this.nameRoleGroup = nameRoleGroup; }
    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }
    public Date getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Date updatedAt) { this.updatedAt = updatedAt; }
    public Integer getIsDeleted() { return isDeleted; }
    public void setIsDeleted(Integer isDeleted) { this.isDeleted = isDeleted; }
}