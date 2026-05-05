package dto;

public class EmployeeDTO {
    private String employeeID;
    private String accountID;
    private String fullName;
    private String position;
    private String phone;
    private String email;

    public EmployeeDTO() {}

    public EmployeeDTO(String employeeID, String accountID, String fullName, String position, String phone, String email) {
        this.employeeID = employeeID; this.accountID = accountID; this.fullName = fullName; this.position = position; this.phone = phone; this.email = email;
    }

    public String getEmployeeID() { return employeeID; }
    public void setEmployeeID(String employeeID) { this.employeeID = employeeID; }
    public String getAccountID() { return accountID; }
    public void setAccountID(String accountID) { this.accountID = accountID; }
    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }
    public String getPosition() { return position; }
    public void setPosition(String position) { this.position = position; }
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
}