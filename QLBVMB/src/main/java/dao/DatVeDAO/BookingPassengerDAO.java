package dao.DatVeDAO;

import dto.PassengerDTO;
import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingPassengerDAO {

    /**
     * Thêm hành khách mới vào cơ sở dữ liệu.
     * Sử dụng Trigger TRG_PASSENGER_ID để tự động sinh ID.
     * 
     * @param p Đối tượng PassengerDTO
     * @return PassengerID được sinh ra, hoặc null nếu thất bại.
     */
    public String addPassenger(PassengerDTO p) {
        String sql = "{CALL SP_GET_OR_CREATE_PASSENGER(?, ?, ?, ?, ?)}";
        String generatedId = null;

        try (Connection conn = DBConnection.getConnection();
             java.sql.CallableStatement cst = conn.prepareCall(sql)) {

            cst.setString(1, p.getFullName());
            cst.setString(2, p.getGender());
            if (p.getDateOfBirth() != null) {
                cst.setDate(3, new java.sql.Date(p.getDateOfBirth().getTime()));
            } else {
                cst.setNull(3, Types.DATE);
            }
            cst.setString(4, p.getPassportNumber());
            cst.registerOutParameter(5, Types.VARCHAR);

            cst.execute();
            generatedId = cst.getString(5);
        } catch (SQLException e) {
            System.err.println("Error adding passenger: " + e.getMessage());
            e.printStackTrace();
        }
        return generatedId;
    }

    public List<PassengerDTO> getAllPassengers() {
        List<PassengerDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM PASSENGER";
        try (Connection conn = DBConnection.getConnection();
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery(sql)) {

            while (rs.next()) {
                list.add(new PassengerDTO(
                        rs.getString("PassengerID"),
                        rs.getString("FullName"),
                        rs.getString("Gender"),
                        rs.getDate("DateOfBirth"),
                        rs.getString("PassportNumber")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
