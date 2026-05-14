package bus.BaoCaoThongKeBUS;

import java.sql.Date;
import java.util.List;

import dao.BaoCaoThongKeDAO.BaoCaoTKDAO;

public class BaoCaoTKBUS {

    private final BaoCaoTKDAO dao = new BaoCaoTKDAO();

    public List<Object[]> getAllAirlines() {
        return dao.getAllAirlines();
    }

    // ==================== DỮ LIỆU TỪ VIEW (NEW) ====================
    public Object[] getDashboardSummary() {
        return dao.getDashboardSummary();
    }

    public double[] getRevenueByMonth(int year) {
        return dao.getRevenueByMonth(year);
    }

    public List<Object[]> getBookingStatusStats(Date tuNgay, Date denNgay, String hangBay) {
        List<Object[]> list = dao.getBookingStatusStats(tuNgay, denNgay, hangBay);
        // Tính % thực tế
        double total = 0;
        for (Object[] row : list)
            total += (double) row[1];
        if (total > 0) {
            for (Object[] row : list)
                row[2] = ((double) row[1] / total) * 100.0;
        }
        return list;
    }

    public List<Object[]> getRevenueByClass() {
        return dao.getRevenueByClass();
    }

    // ==================== CÁC HÀM THỐNG KÊ TỔNG QUÁT ====================
    public double getTongDoanhThu(Date tuNgay, Date denNgay, String hangBay) {
        return dao.getTongDoanhThu(tuNgay, denNgay, hangBay);
    }

    public int getTongDatCho(Date tuNgay, Date denNgay, String hangBay) {
        return dao.getTongDatCho(tuNgay, denNgay, hangBay);
    }

    public double getTyLeLapDay(Date tuNgay, Date denNgay, String hangBay) {
        return dao.getTyLeLapDay(tuNgay, denNgay, hangBay);
    }

    public int getSoChuyenBayHoanThanh(Date tuNgay, Date denNgay, String hangBay) {
        return dao.getSoChuyenBayHoanThanh(tuNgay, denNgay, hangBay);
    }

    // ==================== XU HƯỚNG THEO THÁNG/NĂM ====================
    public double[] getDoanhThuTheoThang(int nam, String hangBay) {
        return dao.getDoanhThuTheoThang(nam, hangBay);
    }

    // ==================== PHÂN TÍCH CHI TIẾT THEO HẠNG GHẾ ====================
    public List<Object[]> getDoanhThuTheoHang(Date tuNgay, Date denNgay, String hangBay) {
        return dao.getDoanhThuTheoHang(tuNgay, denNgay, hangBay);
    }

    public List<Object[]> getSoVeTheoHang(Date tuNgay, Date denNgay, String hangBay) {
        return dao.getSoVeTheoHang(tuNgay, denNgay, hangBay);
    }

    public double[] getTyLeLapDayTheoHang(Date tuNgay, Date denNgay, String hangBay) {
        return dao.getTyLeLapDayTheoHang(tuNgay, denNgay, hangBay);
    }

    // ==================== PHÂN TÍCH THEO TUYẾN BAY ====================
    public List<Object[]> getDoanhThuTheoTuyen(Date tuNgay, Date denNgay, String hangBay) {
        return dao.getDoanhThuTheoTuyen(tuNgay, denNgay, hangBay);
    }

    public List<Object[]> getTyLeLapDayTheoTuyen(Date tuNgay, Date denNgay, String hangBay) {
        return dao.getTyLeLapDayTheoTuyen(tuNgay, denNgay, hangBay);
    }

    public List<Object[]> getSoChuyenBayTheoTuyen(Date tuNgay, Date denNgay, String hangBay) {
        return dao.getSoChuyenBayTheoTuyen(tuNgay, denNgay, hangBay);
    }

    // ==================== BÁO CÁO CHI TIẾT THEO CHUYẾN BAY ====================
    public List<Object[]> getThongTinChuyenBayChiTiet(Date tuNgay, Date denNgay, String hangBay) {
        return dao.getThongTinChuyenBayChiTiet(tuNgay, denNgay, hangBay);
    }

    // ==================== XU HƯỚNG DOANH THU THEO TUYẾN BAY (biểu đồ đường)
    // ====================
    public double[] getDoanhThuTheoTuyenDuong(String tuyenBay, int nam) {
        return dao.getDoanhThuTheoTuyenDuong(tuyenBay, nam);
    }

    // ==================== DANH MỤC ====================
    public List<String> getDanhSachHangBay() {
        return dao.getDanhSachHangBay();
    }

    public List<String> getDanhSachTuyenBay() {
        return dao.getDanhSachTuyenBay();
    }

    public java.sql.Date[] getDateRange() {
        return dao.getDateRange();
    }
}
