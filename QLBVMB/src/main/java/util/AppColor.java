package util;

import java.awt.Color;

public class AppColor {
    // CÁCH DÙNG
    // Thay vì viết formPanel.setBackground(new Color(2, 132, 199));
    // Có thể viết formPanel.setBackground(AppColor.BACKGROUND);

    // MÀU THƯƠNG HIỆU (BRAND COLORS) - Dựa trên nút "Lưu thông tin", "In vé" và
    // tone màu hàng không (SkyBlue/Teal)
    public static final Color PRIMARY = Color.decode("#0284C7"); // Xanh dương đậm (Sky 600)
    public static final Color PRIMARY_HOVER = Color.decode("#0EA5E9"); // Xanh dương sáng khi hover (Sky 500)
    public static final Color PRIMARY_ACTIVE = Color.decode("#0369A1"); // Xanh dương sẫm khi click (Sky 700)

    // MÀU NỀN & BỀ MẶT (BACKGROUND & SURFACE) - Nền ứng dụng và các Card trắng chứa
    // bảng dữ liệu
    public static final Color BACKGROUND = Color.decode("#F3F4F6"); // Xám nhạt làm nền tổng thể (Gray 100)
    public static final Color SURFACE = Color.decode("#FFFFFF"); // Trắng tinh cho các bảng, form, thẻ (Card)

    // MÀU CHỮ (TEXT COLORS)
    public static final Color TEXT_PRIMARY = Color.decode("#111827"); // Đen xám cho text chính (Gray 900)
    public static final Color TEXT_SECONDARY = Color.decode("#6B7280"); // Xám cho text phụ, label (Gray 500)

    // MÀU VIỀN (BORDER COLORS) - Dùng cho viền của input, bảng dữ liệu (Table)
    public static final Color BORDER = Color.decode("#E5E7EB"); // Xám sáng (Gray 200)

    // MÀU TRẠNG THÁI (SEMANTIC COLORS) - Dựa trên các Tag trạng thái trong quản lý
    // chuyến bay/đặt chỗ
    // Success (VD: Chuyến bay "Đúng giờ", "Đã xác nhận")
    public static final Color SUCCESS = Color.decode("#10B981"); // Xanh ngọc (Emerald 500)
    public static final Color SUCCESS_HOVER = Color.decode("#34D399");
    public static final Color SUCCESS_ACTIVE = Color.decode("#059669");

    // Error/Danger (VD: Trạng thái "Đã hủy")
    public static final Color ERROR = Color.decode("#EF4444"); // Đỏ (Red 500)
    public static final Color ERROR_HOVER = Color.decode("#F87171");
    public static final Color ERROR_ACTIVE = Color.decode("#DC2626");

    // Warning (VD: Trạng thái "Delay", "Chờ thanh toán")
    public static final Color WARNING = Color.decode("#F59E0B"); // Vàng cam (Amber 500)
    public static final Color WARNING_HOVER = Color.decode("#FBBF24");
    public static final Color WARNING_ACTIVE = Color.decode("#D97706");

    // Info (VD: Các badge thông tin, "Đã xác nhận" trên vé)
    public static final Color INFO = Color.decode("#38BDF8"); // Xanh lơ sáng (Sky 400)
    public static final Color INFO_HOVER = Color.decode("#7DD3FC");
    public static final Color INFO_ACTIVE = Color.decode("#0284C7");

    // Secondary (Thường dùng cho nút Hủy/Đóng hoặc các nút phụ trợ màu xám)
    public static final Color SECONDARY_HOVER = Color.decode("#F3F4F6"); // Xám nhạt
    public static final Color SECONDARY_ACTIVE = Color.decode("#E5E7EB"); // Xám viền

    // MÀU DÀNH RIÊNG CHO SIDEBAR / LOGIN PANEL (DARK THEME)
    // Dựa trên bảng điều khiển bên trái màn hình đăng nhập SkyManage (Trang 2)
    public static final Color SIDEBAR_BG = Color.decode("#0F172A"); // Xanh đen đậm (Slate 900)
    public static final Color SIDEBAR_HOVER = Color.decode("#1E293B"); // Sáng hơn chút khi di chuột (Slate 800)
    public static final Color SIDEBAR_ACTIVE = Color.decode("#334155"); // Khi đang chọn menu (Slate 700)
}
