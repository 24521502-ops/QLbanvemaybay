import java.sql.Connection;
import java.sql.DriverManager;

public class TestConn {
    public static void main(String[] args) {
        String user = "QLBVMB";
        String pass = "123456";
        String[] urls = {
            "jdbc:oracle:thin:@localhost:1521/XEPDB1",
            "jdbc:oracle:thin:@localhost:1521:xe",
            "jdbc:oracle:thin:@localhost:1521/xe"
        };
        
        for (String url : urls) {
            try {
                System.out.println("Trying: " + url);
                Connection con = DriverManager.getConnection(url, user, pass);
                System.out.println("✅ SUCCESS: " + url);
                con.close();
                return;
            } catch (Exception e) {
                System.out.println("❌ FAILED: " + e.getMessage());
            }
        }
    }
}
