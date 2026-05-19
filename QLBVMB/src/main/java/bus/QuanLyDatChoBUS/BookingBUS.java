/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bus.QuanLyDatChoBUS;

import java.util.List;

import dao.QuanLyDatChoDAO.BookingDAO;

public class BookingBUS {
    private BookingDAO bookingDAO;

    public BookingBUS() {
        bookingDAO = new BookingDAO();
    }

    public List<Object[]> layDanhSachDatCho() {
        List<Object[]> list = bookingDAO.layDanhSachDatCho();

        for (Object[] row : list) {
            // Xử lý Hạng ghế (Cột số 5 giữ nguyên)
            String hangGhe = (String) row[5];
            if (hangGhe != null) {
                if (hangGhe.equalsIgnoreCase("Economy"))
                    row[5] = "Hạng Phổ thông";
                else if (hangGhe.equalsIgnoreCase("Business"))
                    row[5] = "Hạng Thương gia";
                else if (hangGhe.equalsIgnoreCase("Premium Economy"))
                    row[5] = "Hạng Phổ thông đặc biệt";
                else if (hangGhe.equalsIgnoreCase("First Class"))
                    row[5] = "Hạng nhất";
            } else {
                row[5] = "Chưa xếp ghế";
            }

            // ĐÃ SỬA: Đổi row[7] thành row[8] cho Trạng thái
            String status = (String) row[8];
            if (status != null) {
                if (status.equalsIgnoreCase("CONFIRMED") || status.equalsIgnoreCase("COMPLETED")) {
                    row[8] = "Đã xác nhận";
                } else if (status.equalsIgnoreCase("PENDING")) {
                    row[8] = "Chờ thanh toán";
                } else if (status.equalsIgnoreCase("CANCELLED")) {
                    row[8] = "Đã hủy";
                }
            }
        }
        return list;
    }

    public List<String> layDanhSachKhachHang() {
        return bookingDAO.layDanhSachKhachHang();
    }

    public List<String> layDanhSachChuyenBay() {
        return bookingDAO.layDanhSachChuyenBay();
    }

    public List<String> layDanhSachGheTrong(String flightID) {
        return bookingDAO.layDanhSachGheTrong(flightID);
    }

    public boolean taoDatChoMoi(String customerID, String employeeID, String flightID, String seatID) {
        return bookingDAO.taoDatChoMoi(customerID, employeeID, flightID, seatID);
    }

    public boolean huyDatCho(String bookingID, String reason) {
        return bookingDAO.huyDatCho(bookingID, reason);
    }

    public String layTicketIDTuBooking(String bookingID) {
        return bookingDAO.layTicketIDTuBooking(bookingID);
    }

    public boolean doiChuyenBayVaGhe(String ticketID, String newFlightID, String newSeatID) {
        return bookingDAO.doiChuyenBayVaGhe(ticketID, newFlightID, newSeatID);
    }
}
