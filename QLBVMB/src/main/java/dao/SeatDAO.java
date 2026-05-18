package dao;

import dto.SeatDTO;
import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SeatDAO {
    
    /**
     * Lấy danh sách ghế dựa trên FlightID và Hạng ghế.
     * Đã tối ưu hóa cho Oracle để tránh lỗi subquery.
     */
    public List<SeatInfo> getSeatsByFlightAndClass(String flightID, String seatClass) throws SQLException {
        List<SeatInfo> results = new ArrayList<>();
        
        String sql = "SELECT SeatID, SeatNumber, Class, IsBooked " +
                     "FROM VIEW_FLIGHT_SEAT_STATUS " +
                     "WHERE FlightID = ? " +
                     "AND UPPER(TRIM(Class)) = UPPER(TRIM(?)) " +
                     "ORDER BY SeatNumber";

        Connection conn = DBConnection.getConnection();
        if (conn == null) {
            throw new SQLException("Không thể kết nối đến Database. Vui lòng kiểm tra lại DBConnection.");
        }
        
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, flightID);
            ps.setString(2, seatClass);

            try (ResultSet rs = ps.executeQuery()) {
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
        // Lưu ý: Không đóng conn ở đây nếu DBConnection trả về connection dùng chung (singleton)
        return results;
    }

    public static class SeatInfo extends SeatDTO {
        private boolean isBooked;
        public boolean isBooked() { return isBooked; }
        public void setBooked(boolean booked) { isBooked = booked; }
    }
}
