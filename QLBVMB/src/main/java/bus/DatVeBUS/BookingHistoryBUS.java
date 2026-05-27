package bus.DatVeBUS;

import dao.DatVeDAO.BookingHistoryDAO;
import dto.BookingHistoryDTO;

import java.util.List;

public class BookingHistoryBUS {
    private BookingHistoryDAO dao;

    public BookingHistoryBUS() {
        this.dao = new BookingHistoryDAO();
    }

    public List<BookingHistoryDTO> getBookingHistory(String accountID) {
        return dao.getBookingHistory(accountID);
    }

    public boolean cancelBooking(String bookingID) {
        return dao.cancelBooking(bookingID, "Khách hàng yêu cầu hủy");
    }

    public boolean payBooking(String bookingID, double amount, String paymentMethod) {
        // Simulate payment success by confirming booking and tickets
        boolean bUpdated = dao.updateBookingStatus(bookingID, "CONFIRMED");
        if (bUpdated) {
            dao.updateTicketsStatus(bookingID, "PAID");
            boolean pInserted = dao.insertPayment(bookingID, amount, paymentMethod);
            if (pInserted) {
                return true;
            } else {
                // Rollback status if payment registration fails
                dao.updateBookingStatus(bookingID, "PENDING");
                dao.updateTicketsStatus(bookingID, "BOOKED");
                return false;
            }
        }
        return false;
    }
    public double getBookingAmount(String bookingID) {
        return dao.getBookingAmount(bookingID);
    }

    /** Số giây còn lại trong cửa sổ 20 phút. Trả 0 nếu đã hết hạn. */
    public int getRemainingPaymentSeconds(String bookingID) {
        return dao.getRemainingPaymentSeconds(bookingID);
    }

    public List<dto.MyFlightPassengerDTO> getPassengersByBooking(String bookingID) {
        return dao.getPassengersByBooking(bookingID);
    }

    public double getRefundAmountPreview(String bookingID) {
        return dao.getRefundAmountPreview(bookingID);
    }

    public double getOriginalTotalAmount(String bookingID) {
        return dao.getOriginalTotalAmount(bookingID);
    }
}
