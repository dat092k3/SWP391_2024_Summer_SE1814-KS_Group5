/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Interface.AccountInterface;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import context.DBContext;
import model.Account;

/**
 * access data in database
 *
 * @author LENOVO
 */
public class AccountDAO  extends DBContext implements AccountInterface {

    /**
     * find account in database to login
     *
     * @param username of account want to login
     * @param password of account want to login
     * @return Account
     */
    @Override
    public Account findAccount(String username, String password) {
        String sql;
        if (username.contains("@")) {
            sql = "select * from account where status=1 and  email='" + username + "' and password='" + password + "'";
        } else {
            sql = "select * from account where status=1 and username='" + username + "' and password='" + password + "'";
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
     * @param phonenumber of account in database
     * @return Account
     */
    @Override
    public Account checkAccountExists(String username, String phonenumber) {
        String sql = "SELECT * FROM Account WHERE username = ? OR email = ? OR phonenumber=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, username); // Can check both username and email
            st.setString(3, phonenumber);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Account(rs);
            }
        } catch (SQLException ex) {
            System.out.println("Database error: " + ex.getMessage());
        }
        return null;
    }

    /**
     * sign up
     *
     * @param username is value of account want to register
     * @param password is value of account want to register
     * @param email is value of account want to register
     * @param phonenumber is value of account want to register
     */
    @Override
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

    /**
     * function check email exist
     *
     * @param email of account
     * @return email
     */
    @Override
    public String checkEmailExist(String email) {
        try {
            String sql = "select * from Account where email = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return email;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    /**
     * function to do get username by email
     *
     * @param email of account
     * @return username
     */
    @Override
    public String getUserNameByEmail(String email) {
        String sql = "SELECT Top 1 username FROM Account WHERE email =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            //set ?
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String name = rs.getString(1);
                return name;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     * function to do get account by username
     *
     * @param username of account
     * @return Account
     */
    @Override
    public Account getAccountByUserName(String username) {
        String sql = "SELECT * FROM Account where username = ? and [status] = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            //set ?
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            //1
            if (rs.next()) {
                Account account = new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6));
                return account;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     * function to do update password
     *
     * @param password of account
     * @param username of account
     */
    @Override
    public void updatePassByUserName(String password, String username) {
        String sql = "update Account set password = ? where username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, password);
            st.setString(2, username);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    /**
     * function to do get email of account
     * @param account_id of user
     * @return email of account
     */
    @Override
    public String getEmailOfAccount(String account_id) {
        String sql = "select email  from Account where account_id =?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, account_id);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("email");
                }
            }
        } catch (SQLException e) {
            System.out.println("Database error while retrieving email: " + e.getMessage());
        }
        return null;
    }
     /**
     * function to do get phonenumber of account
     * @param phonenumber of user
     * @return phonenumber of account
     */
    @Override
    public String getPhoneOfAccount(String phonenumber) {
        String sql = "select phonenumber  from Account where account_id =?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, phonenumber);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("phonenumber");
                }
            }
        } catch (SQLException e) {
            System.out.println("Database error while retrieving phonenumber: " + e.getMessage());
        }
        return null;
    }
}
