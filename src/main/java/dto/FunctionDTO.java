
package dto;

import java.util.Date;


public class FunctionDTO {
    private int functionID;
    private String nameFunction;
    private Date createdAt;
    private Date updatedAt;
    private int isDeleted;

    public FunctionDTO() {}

    public FunctionDTO(int functionID, String nameFunction, Date createdAt, Date updatedAt, int isDeleted) {
        this.functionID = functionID; this.nameFunction = nameFunction; this.createdAt = createdAt; this.updatedAt = updatedAt; this.isDeleted = isDeleted;
    }

    public int getFunctionID() { return functionID; }
    public void setFunctionID(int functionID) { this.functionID = functionID; }
    public String getNameFunction() { return nameFunction; }
    public void setNameFunction(String nameFunction) { this.nameFunction = nameFunction; }
    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }
    public Date getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Date updatedAt) { this.updatedAt = updatedAt; }
    public int getIsDeleted() { return isDeleted; }
    public void setIsDeleted(int isDeleted) { this.isDeleted = isDeleted; }

}
