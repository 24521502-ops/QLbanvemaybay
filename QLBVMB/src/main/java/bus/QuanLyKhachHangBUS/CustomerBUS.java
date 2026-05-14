/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bus.QuanLyKhachHangBUS;

import java.util.List;

import dao.QuanLyKhachHangDAO.CustomerDAO;

public class CustomerBUS {
    private CustomerDAO customerDAO;

    public CustomerBUS() {
        customerDAO = new CustomerDAO();
    }

    public List<Object[]> layDanhSachKhachHang() {
        return customerDAO.layDanhSachKhachHang();
    }

    public boolean themKhachHang(String fullName, String gender, String dob, String phone, String email,
            String passport, String nationality) {
        return customerDAO.themKhachHang(fullName, gender, dob, phone, email, passport, nationality);
    }

    public boolean suaKhachHang(String customerID, String phone, String email) {
        return customerDAO.suaKhachHang(customerID, phone, email);
    }

    public String xoaKhachHang(String customerID) {
        return customerDAO.xoaKhachHang(customerID);
    }

    public String kiemTraTrungLap(String email, String passport) {
        return customerDAO.kiemTraTrungLap(email, passport);
    }
}
