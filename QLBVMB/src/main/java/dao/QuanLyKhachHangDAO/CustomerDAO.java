/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao.QuanLyKhachHangDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.DBConnection;

public class CustomerDAO {

    // 1. Lấy danh sách Khách hàng đổ lên Bảng
    public List<Object[]> layDanhSachKhachHang() {
        List<Object[]> list = new ArrayList<>();
        String sql = "SELECT CustomerID, FullName, Email, Phone, PassportNumber "
                   + "FROM CUSTOMER ORDER BY CustomerID DESC";
                   
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql);
             ResultSet rs = pst.executeQuery()) {
             
            while (rs.next()) {
                String email = rs.getString("Email");
                String passport = rs.getString("PassportNumber");
                
                list.add(new Object[]{
                    rs.getString("CustomerID"),
                    rs.getString("FullName"),
                    (email == null || email.trim().isEmpty()) ? "(Chưa cập nhật)" : email,
                    rs.getString("Phone"),
                    (passport == null || passport.trim().isEmpty()) ? "(Chưa cập nhật)" : passport
                });
            }
        } catch (Exception e) { 
            e.printStackTrace(); 
        }
        return list;
    }

    // 2. Thêm Khách hàng mới (Gọi Procedure)
    // 2. Thêm Khách hàng mới (Gọi Procedure) - Đã nâng cấp Chuẩn Hàng Không
    public boolean themKhachHang(String fullName, String gender, String dob, String phone, String email, String passport, String nationality) {
        String sql = "{CALL SP_ADD_CUSTOMER(?, ?, ?, ?, ?, ?, ?, ?)}";
        try (Connection conn = DBConnection.getConnection();
             java.sql.CallableStatement cst = conn.prepareCall(sql)) {
             
            cst.setString(1, null);         // AccountID (Để null cho khách vãng lai)
            cst.setString(2, fullName);
            cst.setString(3, gender);       // 'Male', 'Female', 'Other'
            
            // Xử lý ép kiểu Ngày Sinh (dd/MM/yyyy)
            if (dob != null && !dob.isEmpty()) {
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd/MM/yyyy");
                sdf.setLenient(false); // Bắt buộc nhập đúng ngày tháng có thực
                java.util.Date parsedDate = sdf.parse(dob);
                cst.setDate(4, new java.sql.Date(parsedDate.getTime()));
            } else {
                cst.setDate(4, null);
            }
            
            cst.setString(5, phone);
            cst.setString(6, email);
            cst.setString(7, passport);
            cst.setString(8, nationality);
            
            cst.execute();
            return true;
        } catch (Exception e) { 
            e.printStackTrace(); 
            return false; 
        }
    }

    // 3. Cập nhật Khách hàng (Gọi Procedure - SQL của bạn chỉ cho cập nhật Email & Phone)
    public boolean suaKhachHang(String customerID, String phone, String email, String passport) {
        String sql = "{CALL SP_UPDATE_CUSTOMER_INFO(?, ?, ?)}";
        try (Connection conn = DBConnection.getConnection();
             java.sql.CallableStatement cst = conn.prepareCall(sql)) {
             
            cst.setString(1, customerID);
            cst.setString(2, phone);
            cst.setString(3, email);
            cst.execute();
            
            // Cập nhật riêng trường CCCD/Passport thông qua PreparedStatement do SP không hỗ trợ
            String sqlPass = "UPDATE CUSTOMER SET PassportNumber = ? WHERE CustomerID = ?";
            try (PreparedStatement ps = conn.prepareStatement(sqlPass)) {
                ps.setString(1, passport);
                ps.setString(2, customerID);
                ps.executeUpdate();
            }
            
            return true;
        } catch (Exception e) { 
            e.printStackTrace(); 
            return false; 
        }
    }

    // 4. Xóa Khách hàng (Bắt lỗi nếu khách đã từng mua vé)
    public String xoaKhachHang(String customerID) {
        String sql = "{CALL SP_DELETE_CUSTOMER(?)}";
        try (Connection conn = DBConnection.getConnection();
             java.sql.CallableStatement cst = conn.prepareCall(sql)) {
             
            cst.setString(1, customerID);
            cst.execute();
            return "SUCCESS";
            
        } catch (SQLException e) {
            // Lỗi 2292 của Oracle là vi phạm khóa ngoại (Foreign Key)
            if (e.getErrorCode() == 2292) {
                return "CONSTRAINT_ERROR"; 
            }
            e.printStackTrace();
            return "ERROR";
        }
    }
    
    // 5. Kiểm tra trùng lặp Email và Passport (Tuyệt chiêu UX)
    public String kiemTraTrungLap(String email, String passport) {
        String sql = "SELECT Email, PassportNumber FROM CUSTOMER WHERE Email = ? OR PassportNumber = ?";
        boolean trungEmail = false;
        boolean trungPassport = false;

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {

            pst.setString(1, email);
            pst.setString(2, passport);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                String dbEmail = rs.getString("Email");
                String dbPassport = rs.getString("PassportNumber");

                if (dbEmail != null && dbEmail.equalsIgnoreCase(email)) trungEmail = true;
                if (dbPassport != null && dbPassport.equalsIgnoreCase(passport)) trungPassport = true;
            }

            if (trungEmail && trungPassport) return "BOTH";
            if (trungEmail) return "EMAIL";
            if (trungPassport) return "PASSPORT";

        } catch (SQLException e) {
            e.printStackTrace();
            return "ERROR";
        }
        return "NONE"; // Không trùng gì cả -> An toàn!
    }
}
