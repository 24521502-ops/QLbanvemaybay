import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class TestDB {
    public static void main(String[] args) {
        String url = "jdbc:oracle:thin:@localhost:1521/orclpdb";
        String user = "QLBVMB";
        String pass = "123456";
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            try (Connection con = DriverManager.getConnection(url, user, pass)) {
                System.out.println("✅ Kết nối DB thành công!");
                
                try (Statement st = con.createStatement()) {
                    ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM BOOKING");
                    if (rs.next()) {
                        System.out.println("📊 Số lượng Booking trong DB: " + rs.getInt(1));
                    }
                    
                    ResultSet rs2 = st.executeQuery("SELECT COUNT(*) FROM VIEW_DASHBOARD_SUMMARY");
                    if (rs2.next()) {
                        System.out.println("✅ View VIEW_DASHBOARD_SUMMARY tồn tại!");
                    }
                } catch (Exception e) {
                    System.out.println("❌ Lỗi truy vấn View/Table: " + e.getMessage());
                }
            }
        } catch (Exception e) {
            System.out.println("❌ Lỗi kết nối DB: " + e.getMessage());
        }
    }
}
