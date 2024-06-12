/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Interface.CustomerInterface;
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
public class CustomerDAO extends DBContext implements CustomerInterface {

    /**
     * function to do get customer by account_id
     *
     * @param account_id is id of customer
     * @return account customer
     */
    @Override
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

    /**
     * function to do update infomation customer
     *
     * @param fullname of customer
     * @param gender of customer
     * @param email of customer
     * @param dateofbirth of customer
     * @param phonenumber of customer
     * @param address of customer
     * @param image of customer
     * @param height of customer
     * @param weight of customer
     * @param account_id of customer
     */
    @Override
    public void updateProfileCustomer(String fullname, String gender, String email, String dateofbirth, String phonenumber, String address, String image, float height, float weight, int account_id) {
        String sql = "UPDATE [dbo].[Customer] \n"
                + "                 SET fullname = ?, \n"
                + "                gender = ?, \n"
                + "                email = ?, \n"
                + "                dateofbirth = ?, \n"
                + "                phonenumber = ?, \n"
                + "                address = ?, \n"
                + "                image = ?, \n"
                + "                height = ?, \n"
                + "                weight = ? \n"
                + "                WHERE account_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, fullname);
            st.setString(2, gender);
            st.setString(3, email);
            st.setString(4, dateofbirth);
            st.setString(5, phonenumber);
            st.setString(6, address);
            st.setString(7, image);
            st.setFloat(8, height);
            st.setFloat(9, weight);
            st.setInt(10, account_id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    /**
     * function to do insert profile of customer
     *
     * @param account_id of customer
     * @param fullname of customer
     * @param gender of customer
     * @param email of customer
     * @param dateofbirth of customer
     * @param phonenumber of customer
     * @param address of customer
     * @param image of customer
     * @param height of customer
     * @param weight of customer
     */
    @Override
    public void InsertProfile(int account_id, String fullname, String gender, String email, String dateofbirth, String phonenumber, String address, String image, float height, float weight) {
        String sql = "INSERT INTO [dbo].[Customer]\n"
                + "           ([account_id]\n"
                + "           ,[fullname]\n"
                + "           ,[gender]\n"
                + "           ,[email]\n"
                + "           ,[dateofbirth]\n"
                + "           ,[phonenumber]\n"
                + "           ,[address]\n"
                + "           ,[image]\n"
                + "           ,[height]\n"
                + "           ,[weight])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, account_id);
            st.setString(2, fullname);
            st.setString(3, gender);
            st.setString(4, email);
            st.setString(5, dateofbirth);
            st.setString(6, phonenumber);
            st.setString(7, address);
            st.setString(8, image);
            st.setFloat(9, height);
            st.setFloat(10, weight);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}
