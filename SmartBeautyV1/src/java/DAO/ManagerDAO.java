/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import context.DBContext;
import model.Manager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author admin
 */
public class ManagerDAO extends DBContext {

    /**
     * function to do get manager by manager_id
     *
     * @param manager_id is id of manager
     * @return account manager
     */
    public Manager getManagerById(int account_id) {
        String sql = "select * from Manager where account_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, account_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Manager(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getDate(9),
                        rs.getFloat(10),
                        rs.getString(11));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     * function to do update information Manager
     *
     * @param fullname of Manager
     * @param gender of Manager
     * @param email of Manager
     * @param dateofbirth of Manager
     * @param phonenumber of Manager
     * @param address of Manager
     * @param image of Manager
     * @param account_id of Manager
     */
    public void updateProfileManager(String fullname, String gender, String email, String dateofbirth, String phonenumber, String address, String image, int account_id) {
        String sql = "UPDATE [dbo].[Manager]\n"
                + "                 SET fullname = ?, \n"
                + "                gender = ?, \n"
                + "                email = ?, \n"
                + "                dateofbirth = ?, \n"
                + "                phonenumber = ?, \n"
                + "                address = ?, \n"
                + "                image = ? \n"
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
            st.setInt(8, account_id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
