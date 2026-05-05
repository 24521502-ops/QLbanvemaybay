package dto;

import java.util.Date;

public class RoleDTO {
    private String roleID;
    private String functionID;
    private Integer addPerm;
    private Integer editPerm;
    private Integer deletePerm;
    private Integer downloadPerm;
    private Integer viewPerm;
    private Date createdAt;
    private Date updatedAt;
    private Integer isDeleted;

    public RoleDTO() {}

    public RoleDTO(String roleID, String functionID, Integer addPerm, Integer editPerm, Integer deletePerm, Integer downloadPerm, Integer viewPerm, Date createdAt, Date updatedAt, Integer isDeleted) {
        this.roleID = roleID; this.functionID = functionID; this.addPerm = addPerm; this.editPerm = editPerm; this.deletePerm = deletePerm; this.downloadPerm = downloadPerm; this.viewPerm = viewPerm; this.createdAt = createdAt; this.updatedAt = updatedAt; this.isDeleted = isDeleted;
    }

    public String getRoleID() { return roleID; }
    public void setRoleID(String roleID) { this.roleID = roleID; }
    public String getFunctionID() { return functionID; }
    public void setFunctionID(String functionID) { this.functionID = functionID; }
    public Integer getAddPerm() { return addPerm; }
    public void setAddPerm(Integer addPerm) { this.addPerm = addPerm; }
    public Integer getEditPerm() { return editPerm; }
    public void setEditPerm(Integer editPerm) { this.editPerm = editPerm; }
    public Integer getDeletePerm() { return deletePerm; }
    public void setDeletePerm(Integer deletePerm) { this.deletePerm = deletePerm; }
    public Integer getDownloadPerm() { return downloadPerm; }
    public void setDownloadPerm(Integer downloadPerm) { this.downloadPerm = downloadPerm; }
    public Integer getViewPerm() { return viewPerm; }
    public void setViewPerm(Integer viewPerm) { this.viewPerm = viewPerm; }
    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }
    public Date getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Date updatedAt) { this.updatedAt = updatedAt; }
    public Integer getIsDeleted() { return isDeleted; }
    public void setIsDeleted(Integer isDeleted) { this.isDeleted = isDeleted; }
}