/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Employee;

/**
 *
 * @author admin
 */
public class EmployeeDAO extends DBContext {

    public Employee getEmployeeById(int account_id) {
        String sql = "select * from Employee where account_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, account_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Employee(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getDate(9),
                        rs.getFloat(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getInt(13));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     * function to do update ìfnomation employee
     *
     * @param fullname of employee
     * @param gender of employee
     * @param email of employee
     * @param dateofbirth of employee
     * @param phonenumber of employee
     * @param address of employee
     * @param image of employee
     * @param account_id of employee
     */
    public void updateProfileEmployee(String fullname, String gender, String email, String dateofbirth, String phonenumber, String address, String image, int account_id) {
        String sql = "UPDATE [dbo].[Employee]\n"
                + "                                 SET fullname = ?, \n"
                + "                                gender = ?, \n"
                + "                                email = ?, \n"
                + "                                dateofbirth = ?, \n"
                + "                                phonenumber = ?, \n"
                + "                                address = ?, \n"
                + "                                image = ? \n"
                + "                                WHERE account_id = ?";
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
