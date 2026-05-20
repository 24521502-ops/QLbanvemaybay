package dao.QuanLyKhachHangDAO;

import dto.CustomerDTO;
import util.DBConnection;

import java.sql.*;

public class ProfileDAO {

    public CustomerDTO getProfileByCustomerID(String customerID) {
        String sql = "SELECT c.CustomerID, c.AccountID, c.FullName, c.Gender, c.DateOfBirth, " +
                     "c.Phone, c.Email, c.PassportNumber, c.Nationality " +
                     "FROM CUSTOMER c WHERE c.CustomerID = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, customerID);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    CustomerDTO dto = new CustomerDTO();
                    dto.setCustomerID(rs.getString("CustomerID"));
                    dto.setAccountID(rs.getString("AccountID"));
                    dto.setFullName(rs.getString("FullName"));
                    dto.setGender(rs.getString("Gender"));
                    dto.setDateOfBirth(rs.getDate("DateOfBirth"));
                    dto.setPhone(rs.getString("Phone"));
                    dto.setEmail(rs.getString("Email"));
                    dto.setPassportNumber(rs.getString("PassportNumber"));
                    dto.setNationality(rs.getString("Nationality"));
                    return dto;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateProfile(String customerID, String phone, String email) {
        String sql = "{CALL SP_UPDATE_CUSTOMER_INFO(?, ?, ?)}";
        try (Connection conn = DBConnection.getConnection();
             CallableStatement cst = conn.prepareCall(sql)) {
            cst.setString(1, customerID);
            cst.setString(2, phone);
            cst.setString(3, email);
            cst.execute();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateProfile(CustomerDTO customer) {
        String sql = "UPDATE CUSTOMER SET FullName = ?, Gender = ?, DateOfBirth = ?, Phone = ?, Email = ?, PassportNumber = ?, Nationality = ? WHERE CustomerID = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, customer.getFullName());
            pst.setString(2, customer.getGender());
            if (customer.getDateOfBirth() != null) {
                pst.setDate(3, new java.sql.Date(customer.getDateOfBirth().getTime()));
            } else {
                pst.setNull(3, Types.DATE);
            }
            pst.setString(4, customer.getPhone());
            pst.setString(5, customer.getEmail());
            pst.setString(6, customer.getPassportNumber());
            pst.setString(7, customer.getNationality());
            pst.setString(8, customer.getCustomerID());
            return pst.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
