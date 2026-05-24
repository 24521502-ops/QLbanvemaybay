package dao.QuanLyChuyenBayDAO;

import dto.FlightDTO;
import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ChuyenBayDAO {

    public List<Object[]> layDanhSachChuyenBay() {
        List<Object[]> list = new ArrayList<>();
        String sql = "SELECT FlightNumber, Route_IATA, DepartureTime, ArrivalTime, AircraftModel, Gate, PricesHTML, FlightStatus, FlightID FROM VW_FLIGHT_LIST";
        String countSql = "SELECT COUNT(*) AS total FROM FLIGHT";
        
        try (Connection conn = DBConnection.getConnection()) {
            conn.setAutoCommit(false); // Bắt đầu Transaction
            
            // 1. SET MỨC CÔ LẬP THEO YÊU CẦU CỦA CÔ
            // Mức READ_COMMITTED sẽ bị lỗi Bóng Ma (Phantom Read) - Đọc 2 lần ra 2 kết quả khác nhau
            conn.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);
            // Mở dòng dưới đây để KHẮC PHỤC lỗi Bóng Ma (Đọc 2 lần kết quả giống y hệt nhau)
            // conn.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);

            // --- LẦN ĐỌC THỨ NHẤT ---
            int count1 = 0;
            try (PreparedStatement psCount = conn.prepareStatement(countSql);
                 ResultSet rsCount = psCount.executeQuery()) {
                if (rsCount.next()) count1 = rsCount.getInt("total");
                System.out.println("\n========== BẮT ĐẦU DEMO PHANTOM READ ==========");
                System.out.println("[Giao dịch 1] Lần đọc 1: Tổng số chuyến bay là: " + count1);
            }

            // --- NGỦ 10 GIÂY ---
            // Tranh thủ lúc này, bạn qua Cửa sổ 2 bấm THÊM 1 chuyến bay mới nha!
            System.out.println("[Giao dịch 1] Đang chờ 10s... Nhanh tay qua cửa sổ kia THÊM chuyến bay đi bạn!");
            try { Thread.sleep(10000); } catch (InterruptedException e) { e.printStackTrace(); }

            // --- LẦN ĐỌC THỨ HAI (TRONG CÙNG 1 GIAO DỊCH) ---
            int count2 = 0;
            try (PreparedStatement psCount2 = conn.prepareStatement(countSql);
                 ResultSet rsCount2 = psCount2.executeQuery()) {
                if (rsCount2.next()) count2 = rsCount2.getInt("total");
                System.out.println("[Giao dịch 1] Lần đọc 2 (Sau 10s): Tổng số chuyến bay là: " + count2);
                
                if (count1 != count2) {
                    System.out.println("=> LỖI BÓNG MA (PHANTOM READ) XUẤT HIỆN! Đang cùng 1 giao dịch mà số lượng lại tăng lên!");
                } else {
                    System.out.println("=> KHÔNG BỊ BÓNG MA! Số lượng vẫn được giữ nguyên (nhờ SERIALIZABLE).");
                }
                System.out.println("================================================\n");
            }

            // Lấy dữ liệu thật đổ ra UI
            try (PreparedStatement ps = conn.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(new Object[] {
                            rs.getString("FlightNumber"), rs.getString("Route_IATA"), rs.getTimestamp("DepartureTime"),
                            rs.getTimestamp("ArrivalTime"), rs.getString("AircraftModel"), rs.getString("Gate"),
                            rs.getString("PricesHTML"), rs.getString("FlightStatus"), rs.getString("FlightID")
                    });
                }
            }
            conn.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // LẤY CHI TIẾT 1 CHUYẾN BAY ĐỂ ĐỔ LÊN FORM SỬA
    public Object[] layChiTietChuyenBay(String flightID) {
        String sql = "SELECT f.FlightNumber, f.AirlineID, f.AircraftID, r.DepartureAirportID, r.ArrivalAirportID, f.DepartureTime, f.ArrivalTime, f.Gate "
                +
                "FROM FLIGHT f JOIN ROUTE r ON f.RouteID = r.RouteID WHERE f.FlightID = ?";
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, flightID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Object[] {
                        rs.getString("FlightNumber"), rs.getString("AirlineID"), rs.getString("AircraftID"),
                        rs.getString("DepartureAirportID"), rs.getString("ArrivalAirportID"),
                        rs.getTimestamp("DepartureTime"), rs.getTimestamp("ArrivalTime"), rs.getString("Gate")
                };
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // LƯU CẬP NHẬT TOÀN BỘ CHUYẾN BAY
    public boolean capNhatToanBoChuyenBay(String flightID, String flightNum, String airlineID, String aircraftID,
            String depAirport, String arrAirport, java.util.Date depTime, java.util.Date arrTime, String gate) {
        String sql = "{CALL SP_UPDATE_FLIGHT_FULL(?, ?, ?, ?, ?, ?, ?, ?, ?)}";
        try (Connection conn = DBConnection.getConnection(); CallableStatement cs = conn.prepareCall(sql)) {
            cs.setString(1, flightID);
            cs.setString(2, flightNum);
            cs.setString(3, airlineID);
            cs.setString(4, aircraftID);
            cs.setString(5, depAirport);
            cs.setString(6, arrAirport);
            cs.setTimestamp(7, new java.sql.Timestamp(depTime.getTime()));
            cs.setTimestamp(8, new java.sql.Timestamp(arrTime.getTime()));
            cs.setString(9, gate);
            cs.execute();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean huyChuyenBay(String flightID) {
        String sql = "{call SP_CANCEL_FLIGHT(?)}";
        try (Connection conn = DBConnection.getConnection(); CallableStatement cs = conn.prepareCall(sql)) {
            cs.setString(1, flightID);
            cs.execute();
            return true;
        } catch (SQLException e) {
            return false;
        }
    }

    public boolean delayChuyenBay(String flightID, java.util.Date newTime) {
        String sql = "{call SP_DELAY_FLIGHT(?, ?)}";
        try (Connection conn = DBConnection.getConnection(); CallableStatement cs = conn.prepareCall(sql)) {
            cs.setString(1, flightID);
            cs.setTimestamp(2, new java.sql.Timestamp(newTime.getTime()));
            cs.execute();
            return true;
        } catch (SQLException e) {
            return false;
        }
    }

    private boolean insertBasePrice(Connection conn, String flightID, String seatClass, double price) throws SQLException {
        String sql = "INSERT INTO SEATCLASSPRICE (PriceID, FlightID, Class, Price) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "PR" + java.util.UUID.randomUUID().toString().substring(0, 8).toUpperCase());
            ps.setString(2, flightID);
            ps.setString(3, seatClass);
            ps.setDouble(4, price);
            ps.executeUpdate();
            return true;
        }
    }

    public double[] layGiaChuyenBay(String flightID) {
        double[] prices = new double[4];
        String sql = "SELECT Class, Price FROM SEATCLASSPRICE WHERE FlightID = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, flightID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String seatClass = rs.getString("Class");
                double price = rs.getDouble("Price");
                switch (seatClass) {
                    case "Economy": prices[0] = price; break;
                    case "Business": prices[1] = price; break;
                    case "Premium Economy": prices[2] = price; break;
                    case "First Class": prices[3] = price; break;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return prices;
    }

    public boolean capNhatGiaChuyenBay(String flightID, double priceEco, double priceBus, double pricePrem, double priceFirst) {
        try (Connection conn = DBConnection.getConnection()) {
            conn.setAutoCommit(false);
            updateOrInsertPrice(conn, flightID, "Economy", priceEco);
            updateOrInsertPrice(conn, flightID, "Business", priceBus);
            updateOrInsertPrice(conn, flightID, "Premium Economy", pricePrem);
            updateOrInsertPrice(conn, flightID, "First Class", priceFirst);
            conn.commit();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private void updateOrInsertPrice(Connection conn, String flightID, String seatClass, double price) throws SQLException {
        String sqlUpdate = "UPDATE SEATCLASSPRICE SET Price = ? WHERE FlightID = ? AND Class = ?";
        try (PreparedStatement psUpdate = conn.prepareStatement(sqlUpdate)) {
            psUpdate.setDouble(1, price);
            psUpdate.setString(2, flightID);
            psUpdate.setString(3, seatClass);
            int rows = psUpdate.executeUpdate();
            if (rows == 0) {
                insertBasePrice(conn, flightID, seatClass, price);
            }
        }
    }

    public boolean themChuyenBayUI(FlightDTO flight, String depAirport, String arrAirport, double priceEco, double priceBus, double pricePrem, double priceFirst) {
        String sqlAdd = "{call SP_ADD_FLIGHT_UI(?, ?, ?, ?, ?, ?, ?, ?, ?)}";
        String sqlGetId = "SELECT FlightID FROM FLIGHT WHERE FlightNumber = ? AND DepartureTime = ? ORDER BY FlightID DESC";
        
        try (Connection conn = DBConnection.getConnection()) {
            conn.setAutoCommit(false); // Bắt đầu transaction
            try (CallableStatement cs = conn.prepareCall(sqlAdd)) {
                cs.setString(1, flight.getFlightNumber());
                cs.setString(2, flight.getAirlineID());
                cs.setString(3, flight.getAircraftID());
                cs.setString(4, depAirport);
                cs.setString(5, arrAirport);
                cs.setTimestamp(6, new java.sql.Timestamp(flight.getDepartureTime().getTime()));
                cs.setTimestamp(7, new java.sql.Timestamp(flight.getArrivalTime().getTime()));
                cs.setString(8, flight.getGate());
                cs.setString(9, "SCHEDULED");
                cs.execute();
            }
            
            // Lấy ID vừa sinh
            String newFlightID = null;
            try (PreparedStatement ps = conn.prepareStatement(sqlGetId)) {
                ps.setString(1, flight.getFlightNumber());
                ps.setTimestamp(2, new java.sql.Timestamp(flight.getDepartureTime().getTime()));
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        newFlightID = rs.getString("FlightID");
                    }
                }
            }
            
            // Chèn giá nền nếu lấy được ID
            if (newFlightID != null) {
                insertBasePrice(conn, newFlightID, "Economy", priceEco);
                insertBasePrice(conn, newFlightID, "Business", priceBus);
                insertBasePrice(conn, newFlightID, "Premium Economy", pricePrem);
                insertBasePrice(conn, newFlightID, "First Class", priceFirst);
            }
            
            conn.commit(); // Commit transaction
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}