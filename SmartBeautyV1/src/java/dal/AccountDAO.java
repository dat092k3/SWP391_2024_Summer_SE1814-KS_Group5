/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Account;
import ultils.MD5;

/**
 * 
 * @author LENOVO
 */
public class AccountDAO extends DBContext {
    
    public Account findAccount(String email) {
        String sql;
        if (email.contains("@")) {
            sql = "select * from account where email='" + email + "'";
        } else {
            sql = "select * from account where phonenumber='" + email + "'";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Account(rs);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }
    
    public Account findAccount(String email, String password) {
        String sql;
        if (email.contains("@")) {
            sql = "select * from users where email='" + email + "' and password='" + MD5.getMd5(password) + "'";
        } else {
            sql = "select * from users where phonenumber='" + email + "' and password='" + MD5.getMd5(password) + "'";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Account(rs);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    

    public void insertAccount(String username, String email, String phone, String password) {
        String sql = "insert into account(username, email, phonenumber, password, 1) values('" + username + "','" + email;
        sql = sql + "','" + phone + "','" + password + "','')";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
