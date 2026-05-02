
package dto;

import java.util.Date;


public class RoleDTO {
    private int roleID;
    private int functionID;
    private int addPerm;
    private int editPerm;
    private int deletePerm;
    private int downloadPerm;
    private int viewPerm;
    private Date createdAt;
    private Date updatedAt;
    private int isDeleted;

    public RoleDTO() {}

    public RoleDTO(int roleID, int functionID, int addPerm, int editPerm, int deletePerm, int downloadPerm, int viewPerm, Date createdAt, Date updatedAt, int isDeleted) {
        this.roleID = roleID; this.functionID = functionID; this.addPerm = addPerm; this.editPerm = editPerm; this.deletePerm = deletePerm; this.downloadPerm = downloadPerm; this.viewPerm = viewPerm; this.createdAt = createdAt; this.updatedAt = updatedAt; this.isDeleted = isDeleted;
    }

    public int getRoleID() { return roleID; }
    public void setRoleID(int roleID) { this.roleID = roleID; }
    public int getFunctionID() { return functionID; }
    public void setFunctionID(int functionID) { this.functionID = functionID; }
    public int getAddPerm() { return addPerm; }
    public void setAddPerm(int addPerm) { this.addPerm = addPerm; }
    public int getEditPerm() { return editPerm; }
    public void setEditPerm(int editPerm) { this.editPerm = editPerm; }
    public int getDeletePerm() { return deletePerm; }
    public void setDeletePerm(int deletePerm) { this.deletePerm = deletePerm; }
    public int getDownloadPerm() { return downloadPerm; }
    public void setDownloadPerm(int downloadPerm) { this.downloadPerm = downloadPerm; }
    public int getViewPerm() { return viewPerm; }
    public void setViewPerm(int viewPerm) { this.viewPerm = viewPerm; }
    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }
    public Date getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Date updatedAt) { this.updatedAt = updatedAt; }
    public int getIsDeleted() { return isDeleted; }
    public void setIsDeleted(int isDeleted) { this.isDeleted = isDeleted; }

}
