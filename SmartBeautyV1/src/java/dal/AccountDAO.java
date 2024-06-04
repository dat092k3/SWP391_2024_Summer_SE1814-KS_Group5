/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Account;

/**
 *
 * @author LENOVO
 */
public class AccountDAO extends DBContext {
    /**
     *
     * @param username of account
     * @param password of account
     * @return account of user
     */
    public Account Login(String username, String password) {
        String sql = "SELECT * FROM Account WHERE username = ? AND password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int account_id = rs.getInt("account_id");
                String email = rs.getString("email");
                String phonenumber = rs.getString("phonenumber");
                return new Account(account_id, username, password, email, phonenumber);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return null;
    }

}
