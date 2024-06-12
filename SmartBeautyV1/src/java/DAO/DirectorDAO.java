/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import context.DBContext;
import model.Director;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author admin
 */
public class DirectorDAO extends DBContext {

    /**
     * function to do get director by director_id
     *
     * @param account_id is id of director
     * @return account director
     */
    public Director getDirectorById(int account_id) {
        String sql = "select * from Director where account_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, account_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Director(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getDate(9),
                        rs.getString(10));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     * function to do update information Director
     *
     * @param fullname of Director
     * @param gender of Director
     * @param email of Director
     * @param dateofbirth of Director
     * @param phonenumber of Director
     * @param address of Director
     * @param image of Director
     * @param account_id of Director
     */
    public void updateProfileDirector(String fullname, String gender, String email, String dateofbirth, String phonenumber, String address, String image, int account_id) {
        String sql = "UPDATE [dbo].[Director]\n"
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
