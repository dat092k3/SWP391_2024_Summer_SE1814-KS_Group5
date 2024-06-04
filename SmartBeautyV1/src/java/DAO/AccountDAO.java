/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import ultils.MD5;
import context.DBContext;
import model.Account;

/**
 *
 * @author LENOVO
 */
public class AccountDAO extends DBContext{
    
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
}
