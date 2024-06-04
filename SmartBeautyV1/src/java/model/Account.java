/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * a class have information of the account
 *
 * @author LENOVO
 */
public class Account {

    private int account_id;
    private String username;
    private String password;
    private String email;
    private String phoneNumber;
    private String role;

    public Account() {
    }

    public Account(ResultSet rs) throws SQLException {
        this.account_id = rs.getInt("account_id");
        this.username = rs.getString("username");
        this.email = rs.getString("email");
        this.phoneNumber = rs.getString("phonenumber");
        this.password = rs.getString("password");
    }

    public Account(int account_id, String username, String password, String email, String phoneNumber, String role) {
        this.account_id = account_id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.role = role;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    /**
     * constructor of account
     *
     * @param username of customer input
     * @param password of customer input
     * @param email of customer input
     * @param phoneNumber of customer input
     * @param account_id of account
     */

    public Account(int account_id, String username, String password, String email, String phoneNumber) {
        this.account_id = account_id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.phoneNumber = phoneNumber;
    }

    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

}
