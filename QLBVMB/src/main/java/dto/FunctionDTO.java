package dto;

import java.util.Date;

public class FunctionDTO {
    private String functionID;
    private String nameFunction;
    private Date createdAt;
    private Date updatedAt;
    private Integer isDeleted;

    public FunctionDTO() {}

    public FunctionDTO(String functionID, String nameFunction, Date createdAt, Date updatedAt, Integer isDeleted) {
        this.functionID = functionID; this.nameFunction = nameFunction; this.createdAt = createdAt; this.updatedAt = updatedAt; this.isDeleted = isDeleted;
    }

    public String getFunctionID() { return functionID; }
    public void setFunctionID(String functionID) { this.functionID = functionID; }
    public String getNameFunction() { return nameFunction; }
    public void setNameFunction(String nameFunction) { this.nameFunction = nameFunction; }
    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }
    public Date getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Date updatedAt) { this.updatedAt = updatedAt; }
    public Integer getIsDeleted() { return isDeleted; }
    public void setIsDeleted(Integer isDeleted) { this.isDeleted = isDeleted; }
}