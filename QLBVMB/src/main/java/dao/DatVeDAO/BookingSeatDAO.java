package dao.DatVeDAO;

import dto.SeatDTO;
import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingSeatDAO {

    /**
     * Lấy danh sách ghế dựa trên FlightID và Hạng ghế qua Stored Procedure.
     */
    public List<SeatInfo> getSeatsByFlightAndClass(String flightID, String seatClass) throws SQLException {
        List<SeatInfo> results = new ArrayList<>();

        String sql = "{call SP_GET_SEATS_BY_FLIGHT_AND_CLASS(?, ?, ?)}";

        Connection conn = DBConnection.getConnection();
        if (conn == null) {
            throw new SQLException("Không thể kết nối đến Database. Vui lòng kiểm tra lại DBConnection.");
        }

        try (CallableStatement cst = conn.prepareCall(sql)) {
            cst.setString(1, flightID);
            cst.setString(2, seatClass);
            cst.registerOutParameter(3, java.sql.Types.REF_CURSOR);

            cst.execute();

            try (ResultSet rs = (ResultSet) cst.getObject(3)) {
                while (rs.next()) {
                    SeatInfo info = new SeatInfo();
                    info.setSeatID(rs.getString("SeatID"));
                    info.setSeatNumber(rs.getString("SeatNumber"));
                    info.setSeatClass(rs.getString("Class"));
                    info.setBooked(rs.getInt("IsBooked") > 0);
                    results.add(info);
                }
            }
        }
        return results;
    }

    public static class SeatInfo extends SeatDTO {
        private boolean isBooked;

        public boolean isBooked() {
            return isBooked;
        }

        public void setBooked(boolean booked) {
            isBooked = booked;
        }
    }
}
