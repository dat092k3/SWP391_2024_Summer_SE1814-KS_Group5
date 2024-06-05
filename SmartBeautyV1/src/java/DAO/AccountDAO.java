/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import context.DBContext;
import model.Account;

/**
 * access data in database
 * @author LENOVO
 */
public class AccountDAO extends DBContext {
    
    /**
     * find account in database to login
     * 
     * @param username of account want to login
     * @param password of account want to login
     * @return Account
     */
    public Account findAccount(String username, String password) {
        String sql;
        if (username.contains("@")) {
            sql = "select * from account where email='" + username + "' and password='" + password + "'";
        } else {
            sql = "select * from account where username='" + username + "' and password='" + password + "'";
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

    /**
     * check account exist
     * 
     * @param username of account in database
     * @return Account
     */
    public Account checkAccountExists(String username) {
        String sql = "SELECT * FROM Account WHERE username = ? OR email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, username); // Can check both username and email
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Account(rs);
            }
        } catch (SQLException ex) {
            System.out.println("Database error: " + ex.getMessage());
        }
        return null;
    }

    //Function give user signup
    // Function to signup a new user securely
    public void signup(String username, String password, String email, String phonenumber) {
        String sql = "INSERT INTO Account (username, password, email, phonenumber, role, status) VALUES (?, ?, ?, ?, 'Customer', 1)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            st.setString(3, email);
            st.setString(4, phonenumber);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Signup error: " + e.getMessage());
        }
    }
}
