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
        String sql = "{CALL SP_UPDATE_BOOKING_STATUS(?, ?)}";
        try (Connection conn = DBConnection.getConnection();
             java.sql.CallableStatement cst = conn.prepareCall(sql)) {
            cst.setString(1, bookingID);
            cst.setString(2, status);
            cst.execute();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean insertPayment(String bookingID, double amount, String paymentMethod) {
        String sql = "{CALL SP_INSERT_PAYMENT(?, ?, ?)}";
        try (Connection conn = DBConnection.getConnection();
             java.sql.CallableStatement cst = conn.prepareCall(sql)) {
            cst.setString(1, bookingID);
            cst.setDouble(2, amount);
            cst.setString(3, paymentMethod);
            cst.execute();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateTicketsStatus(String bookingID, String status) {
        String sql = "{CALL SP_UPDATE_TICKETS_STATUS(?, ?)}";
        try (Connection conn = DBConnection.getConnection();
             java.sql.CallableStatement cst = conn.prepareCall(sql)) {
            cst.setString(1, bookingID);
            cst.setString(2, status);
            cst.execute();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public void applyCancellationFee(String bookingID) {
        String sql = "{CALL SP_APPLY_CANCELLATION_FEE(?)}";
        try (Connection conn = DBConnection.getConnection();
             java.sql.CallableStatement cst = conn.prepareCall(sql)) {
            cst.setString(1, bookingID);
            cst.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void refundPayment(String bookingID) {
        String sql = "{CALL SP_REFUND_PAYMENT(?)}";
        try (Connection conn = DBConnection.getConnection();
             java.sql.CallableStatement cst = conn.prepareCall(sql)) {
            cst.setString(1, bookingID);
            cst.execute();
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
