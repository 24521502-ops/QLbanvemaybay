package dao.DatVeDAO;

import dto.BookingHistoryDTO;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookingHistoryDAO {

    public List<BookingHistoryDTO> getBookingHistory(String accountID) {
        List<BookingHistoryDTO> list = new ArrayList<>();
        String sql = "{call SP_GET_BOOKING_HISTORY(?, ?)}";

        try (Connection conn = DBConnection.getConnection();
             java.sql.CallableStatement cst = conn.prepareCall(sql)) {

            cst.setString(1, accountID);
            cst.registerOutParameter(2, java.sql.Types.REF_CURSOR);
            cst.execute();

            try (ResultSet rs = (ResultSet) cst.getObject(2)) {
                while (rs.next()) {
                    BookingHistoryDTO dto = new BookingHistoryDTO();
                    dto.setBookingID(rs.getString("BookingID"));
                    dto.setBookingDate(rs.getTimestamp("BookingDate"));
                    dto.setTotalAmount(rs.getDouble("TotalAmount"));
                    dto.setBookingStatus(rs.getString("BookingStatus"));
                    dto.setPaymentMethod(rs.getString("PaymentMethod"));
                    dto.setDepartureTime(rs.getTimestamp("DepartureTime"));
                    dto.setDepIATA(rs.getString("DepIATA"));
                    dto.setArrIATA(rs.getString("ArrIATA"));
                    dto.setTicketCount(rs.getInt("TicketCount"));
                    dto.setCheckedInCount(rs.getInt("CheckedInCount"));
                    list.add(dto);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean updateBookingStatus(String bookingID, String status) {
        String sql = "UPDATE BOOKING SET Status = ? WHERE BookingID = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, status);
            pst.setString(2, bookingID);
            return pst.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean insertPayment(String bookingID, double amount, String paymentMethod) {
        String sql = "INSERT INTO PAYMENT (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod, PaymentStatus) " +
                     "VALUES ('PAY-' || TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS'), ?, SYSDATE, ?, ?, 'SUCCESS')";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, bookingID);
            pst.setDouble(2, amount);
            pst.setString(3, paymentMethod);
            return pst.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateTicketsStatus(String bookingID, String status) {
        String sql = "UPDATE TICKET SET TicketStatus = ? WHERE BookingID = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, status);
            pst.setString(2, bookingID);
            return pst.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public void applyCancellationFee(String bookingID) {
        String sql = "UPDATE BOOKING SET TotalAmount = TotalAmount * 0.3 WHERE BookingID = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, bookingID);
            pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void refundPayment(String bookingID) {
        String sql = "UPDATE PAYMENT SET PaymentStatus = 'REFUNDED' WHERE BookingID = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, bookingID);
            pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public double getBookingAmount(String bookingID) {
        String sql = "SELECT TotalAmount FROM BOOKING WHERE BookingID = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, bookingID);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) return rs.getDouble("TotalAmount");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    /** Trả về số giây còn lại trong cửa sổ thanh toán 20 phút.
     *  Nếu đã quá 20 phút, trả về 0 hoặc âm.
     */
    public int getRemainingPaymentSeconds(String bookingID) {
        String sql = "SELECT FN_GET_REMAINING_PAYMENT_SEC(?) FROM DUAL";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, bookingID);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0; // Không tìm thấy hoặc đã quá hạn
    }
}
