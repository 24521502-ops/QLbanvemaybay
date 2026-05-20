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
        // Cancel booking and tickets
        boolean bUpdated = dao.updateBookingStatus(bookingID, "CANCELLED");
        if (bUpdated) {
            dao.updateTicketsStatus(bookingID, "CANCELLED");
            dao.applyCancellationFee(bookingID); // Set TotalAmount to 30% as cancellation fee
            dao.refundPayment(bookingID); // Mark payment as REFUNDED if exists
            return true;
        }
        return false;
    }

    public boolean payBooking(String bookingID, double amount, String paymentMethod) {
        // Simulate payment success by confirming booking and tickets
        boolean bUpdated = dao.updateBookingStatus(bookingID, "CONFIRMED");
        if (bUpdated) {
            dao.updateTicketsStatus(bookingID, "PAID");
            dao.insertPayment(bookingID, amount, paymentMethod);
            return true;
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
}
