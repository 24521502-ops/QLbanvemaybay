package demo;

import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LostUpdateDemo {

    // Tạo một chuyến bay giả định để demo (tránh làm hỏng dữ liệu thật)
    private static void setupDatabase() {
        try (Connection conn = DBConnection.getConnection()) {
            try {
                // Thử tạo bảng tạm cho việc demo giá vé nếu chưa có
                String createTable = "CREATE TABLE DEMO_GIA_VE (" +
                                     "FlightID VARCHAR2(50), " +
                                     "Class VARCHAR2(50), " +
                                     "Price NUMBER, " +
                                     "PRIMARY KEY (FlightID, Class))";
                conn.createStatement().execute(createTable);
                
                String insertData = "INSERT INTO DEMO_GIA_VE (FlightID, Class, Price) VALUES ('VN123', 'Economy', 1000)";
                conn.createStatement().execute(insertData);
                System.out.println("Đã tạo bảng DEMO_GIA_VE và thêm chuyến bay VN123 (Giá: 1000).");
            } catch (SQLException e) {
                // Bảng đã tồn tại, reset lại giá vé về 1000
                conn.createStatement().execute("UPDATE DEMO_GIA_VE SET Price = 1000 WHERE FlightID = 'VN123' AND Class = 'Economy'");
                System.out.println("Đã reset giá vé chuyến VN123 (Economy) về 1000.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static void checkPrice() {
        try (Connection conn = DBConnection.getConnection()) {
            ResultSet rs = conn.createStatement().executeQuery("SELECT Price FROM DEMO_GIA_VE WHERE FlightID = 'VN123' AND Class = 'Economy'");
            if (rs.next()) {
                System.out.println("=> GIÁ VÉ HIỆN TẠI TRONG DATABASE: " + rs.getDouble("Price"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void demoLostUpdate() throws InterruptedException {
        System.out.println("\n--- BẮT ĐẦU DEMO LOST UPDATE (CẬP NHẬT GIÁ VÉ) ---");
        setupDatabase();
        checkPrice();

        Thread nhanVien1 = new Thread(() -> {
            try (Connection conn = DBConnection.getConnection()) {
                conn.setAutoCommit(false);
                System.out.println("Nhân viên 1: Mở form sửa giá vé chuyến bay VN123...");
                
                // 1. NV1 lấy giá vé hiện tại lên form
                PreparedStatement ps = conn.prepareStatement("SELECT Price FROM DEMO_GIA_VE WHERE FlightID = 'VN123' AND Class = 'Economy'");
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    double currentPrice = rs.getDouble("Price");
                    System.out.println("Nhân viên 1: Đọc được giá vé = " + currentPrice);
                    
                    // Giả lập NV1 đang ngâm cứu, đi nghe điện thoại hoặc gõ phím chậm
                    Thread.sleep(3000);
                    
                    // NV1 quyết định TĂNG giá vé do mùa cao điểm
                    double newPrice = currentPrice + 200; 
                    System.out.println("Nhân viên 1: Quyết định TĂNG giá lên " + newPrice + " và bấm LƯU.");
                    
                    // 2. NV1 lưu xuống Database
                    PreparedStatement psUpdate = conn.prepareStatement("UPDATE DEMO_GIA_VE SET Price = ? WHERE FlightID = 'VN123' AND Class = 'Economy'");
                    psUpdate.setDouble(1, newPrice);
                    psUpdate.executeUpdate();
                    
                    conn.commit();
                    System.out.println("Nhân viên 1: Đã lưu thành công!");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        });

        Thread nhanVien2 = new Thread(() -> {
            try (Connection conn = DBConnection.getConnection()) {
                conn.setAutoCommit(false);
                Thread.sleep(1000); // Đảm bảo NV2 mở form sau NV1 một chút
                System.out.println("Nhân viên 2: Mở form sửa giá vé chuyến bay VN123...");
                
                // 1. NV2 lấy giá vé. Vì NV1 chưa bấm lưu (chưa commit), NV2 vẫn đọc được giá cũ là 1000
                PreparedStatement ps = conn.prepareStatement("SELECT Price FROM DEMO_GIA_VE WHERE FlightID = 'VN123' AND Class = 'Economy'");
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    double currentPrice = rs.getDouble("Price");
                    System.out.println("Nhân viên 2: Đọc được giá vé = " + currentPrice);
                    
                    // NV2 quyết định GIẢM giá để khuyến mãi
                    double newPrice = currentPrice - 100; 
                    System.out.println("Nhân viên 2: Quyết định GIẢM giá xuống " + newPrice + " và bấm LƯU.");
                    
                    // 2. NV2 lưu xuống Database
                    PreparedStatement psUpdate = conn.prepareStatement("UPDATE DEMO_GIA_VE SET Price = ? WHERE FlightID = 'VN123' AND Class = 'Economy'");
                    psUpdate.setDouble(1, newPrice);
                    psUpdate.executeUpdate();
                    
                    conn.commit();
                    System.out.println("Nhân viên 2: Đã lưu thành công!");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        });

        nhanVien1.start();
        nhanVien2.start();

        nhanVien1.join();
        nhanVien2.join();

        System.out.println("KẾT THÚC DEMO LOST UPDATE.");
        checkPrice();
        System.out.println("-> GIẢI THÍCH LỖI:");
        System.out.println("- NV2 đã lưu giá giảm thành 900 trước.");
        System.out.println("- Nhưng sau đó NV1 bấm lưu (chậm hơn), ghi đè giá 1200 lên Database.");
        System.out.println("=> Mọi thao tác và tính toán của NV2 đã bị MẤT HOÀN TOÀN (Lost Update)!");
    }

    public static void demoFixedUpdate() throws InterruptedException {
        System.out.println("\n==================================================================");
        System.out.println("--- BẮT ĐẦU DEMO KHẮC PHỤC (DÙNG SELECT FOR UPDATE) ---");
        setupDatabase();
        checkPrice();

        Thread nhanVien1 = new Thread(() -> {
            try (Connection conn = DBConnection.getConnection()) {
                conn.setAutoCommit(false);
                System.out.println("Nhân viên 1: Mở form sửa giá vé...");
                
                // Dùng FOR UPDATE để khóa (lock) dữ liệu chuyến bay này lại
                PreparedStatement ps = conn.prepareStatement("SELECT Price FROM DEMO_GIA_VE WHERE FlightID = 'VN123' AND Class = 'Economy' FOR UPDATE");
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    double currentPrice = rs.getDouble("Price");
                    System.out.println("Nhân viên 1: Đã KHÓA chuyến bay. Đọc được giá vé = " + currentPrice);
                    
                    Thread.sleep(3000); // Ngâm cứu 3 giây
                    
                    double newPrice = currentPrice + 200;
                    System.out.println("Nhân viên 1: Quyết định TĂNG giá lên " + newPrice + " và bấm LƯU.");
                    
                    PreparedStatement psUpdate = conn.prepareStatement("UPDATE DEMO_GIA_VE SET Price = ? WHERE FlightID = 'VN123' AND Class = 'Economy'");
                    psUpdate.setDouble(1, newPrice);
                    psUpdate.executeUpdate();
                    
                    conn.commit();
                    System.out.println("Nhân viên 1: Đã lưu và NHẢ KHÓA (unlock)!");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        });

        Thread nhanVien2 = new Thread(() -> {
            try (Connection conn = DBConnection.getConnection()) {
                conn.setAutoCommit(false);
                Thread.sleep(1000); 
                System.out.println("Nhân viên 2: Mở form sửa giá vé (Sẽ bị Block đợi NV1)...");
                
                // Bị đứng chờ ở câu lệnh này cho đến khi NV1 bấm Lưu xong
                PreparedStatement ps = conn.prepareStatement("SELECT Price FROM DEMO_GIA_VE WHERE FlightID = 'VN123' AND Class = 'Economy' FOR UPDATE");
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    double currentPrice = rs.getDouble("Price");
                    // Lúc này NV1 đã lưu xong, nên NV2 sẽ đọc được giá CẬP NHẬT MỚI NHẤT của NV1
                    System.out.println("Nhân viên 2: Đã lấy được khóa. Đọc được giá vé MỚI NHẤT = " + currentPrice);
                    
                    double newPrice = currentPrice - 100; 
                    System.out.println("Nhân viên 2: Quyết định GIẢM giá xuống " + newPrice + " và bấm LƯU.");
                    
                    PreparedStatement psUpdate = conn.prepareStatement("UPDATE DEMO_GIA_VE SET Price = ? WHERE FlightID = 'VN123' AND Class = 'Economy'");
                    psUpdate.setDouble(1, newPrice);
                    psUpdate.executeUpdate();
                    
                    conn.commit();
                    System.out.println("Nhân viên 2: Đã lưu thành công!");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        });

        nhanVien1.start();
        nhanVien2.start();

        nhanVien1.join();
        nhanVien2.join();

        System.out.println("KẾT THÚC DEMO KHẮC PHỤC.");
        checkPrice();
        System.out.println("-> KẾT QUẢ: Hệ thống bắt NV2 phải đợi NV1 làm xong mới được chỉnh sửa. Giá trị cuối cùng là 1000 + 200 - 100 = 1100. Không bị mất dữ liệu!");
    }

    public static void main(String[] args) {
        try {
            demoLostUpdate();
            demoFixedUpdate();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
