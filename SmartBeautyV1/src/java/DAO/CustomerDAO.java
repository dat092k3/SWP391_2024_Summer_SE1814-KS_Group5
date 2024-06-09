/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Account;
import model.Customer;

/**
 *
 * @author admin
 */
public class CustomerDAO extends DBContext {

    /**
     * function to do get customer by customer_id
     *
     * @param customer_id is id of customer
     * @return account customer
     */
      public Customer getCustomerById(int account_id) {
        String sql = "select * from Customer where account_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, account_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Customer(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getFloat(10),
                        rs.getFloat(11)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
