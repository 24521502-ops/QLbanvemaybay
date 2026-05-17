
package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String URL = "jdbc:oracle:thin:@localhost:1521/orclpdb";
    private static final String USER = "QLBVMB";
    private static final String PASS = "123456";

    public static Connection getConnection() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection conn = DriverManager.getConnection(URL, USER, PASS);
            if (conn != null) {
                System.out.println(">>> KẾT NỐI DATABASE THÀNH CÔNG!");
            }
            return conn;
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("!!! LỖI KẾT NỐI CSDL: " + e.getMessage());
            return null;
        }
    }
}
