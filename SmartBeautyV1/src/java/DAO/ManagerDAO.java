/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Interface.ManagerInterface;
import context.DBContext;
import model.Manager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Account;

/**
 *
 * @author admin
 */
public class ManagerDAO extends DBContext implements ManagerInterface {

    /**
     * function to do get manager by manager_id
     *
     * @param account_id is id of manager
     * @return account manager
     */
    @Override
    public Manager getManagerById(int account_id) {
        String sql = "select * from Manager where account_id = ? and status=1";
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
    @Override
    public void updateProfileManager(String fullname, String gender, String email, String dateofbirth, String phonenumber, String address, String image, int account_id) {
        String sql = "UPDATE [dbo].[Manager]\n"
                + "                 SET fullname = ?, \n"
                + "                gender = ?, \n"
                + "                email = ?, \n"
                + "                dateofbirth = ?, \n"
                + "                phonenumber = ?, \n"
                + "                address = ?, \n"
                + "                image = ? \n"
                + "                WHERE account_id = ? and status=1";
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

    /**
     * function to get all managers
     *
     * @return list of all managers
     */
    @Override
    public List<Manager> getAllManagers() {
        List<Manager> list = new ArrayList<>();
        String sql = "select * from Manager and status=1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int manager_id = rs.getInt("manager_id");
                int account_id = rs.getInt("account_id");
                String fullname = rs.getString("fullname");
                String gender = rs.getString("gender");
                String email = rs.getString("email");
                String dateofbirth = rs.getString("dateofbirth");
                String phonenumber = rs.getString("phonenumber");
                String address = rs.getString("address");
                Date hiredate = rs.getDate("hiredate");
                float salary = rs.getFloat("salary");
                String image = rs.getString("image");
                boolean status = rs.getBoolean("status");
                list.add(new Manager(manager_id, account_id, fullname, gender, email, dateofbirth, phonenumber, address, hiredate, salary, image, status));

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    @Override
    public void addNewManager(Manager manager) {
        String sql = "INSERT INTO [dbo].[Manager]\n"
                + "           ([account_id]\n"
                + "           ,[fullname]\n"
                + "           ,[gender]\n"
                + "           ,[email]\n"
                + "           ,[dateofbirth]\n"
                + "           ,[phonenumber]\n"
                + "           ,[address]\n"
                + "           ,[hiredate]\n"
                + "           ,[salary]\n"
                + "           ,[image]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,?,?,1)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, manager.getAccount_id());
            st.setString(2, manager.getFullName());
            st.setString(3, manager.getGender());
            st.setString(4, manager.getEmail());
            st.setString(5, manager.getDateOfBirth());
            st.setString(6, manager.getPhoneNumber());
            st.setString(7, manager.getAddress());

            // Convert java.util.Date to java.sql.Date for SQL DATE type
            java.util.Date hireDate = manager.getHireDate();
            if (hireDate != null) {
                st.setDate(8, new java.sql.Date(hireDate.getTime()));
            } else {
                st.setDate(8, null); // or handle the case where hireDate is null
            }

            st.setFloat(9, manager.getSalary());
            st.setString(10, manager.getImage());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @Override
    public void addNewAccountManager(Account account) {
        String sql = "INSERT INTO [dbo].[Account]\n"
                + "           ([username]\n"
                + "           ,[password]\n"
                + "           ,[email]\n"
                + "           ,[phonenumber]\n"
                + "           ,[role]\n"
                + "           ,[status])\n"
                + "     VALUES(?,?,?,?,'Manager',1)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, account.getUsername());
            st.setString(2, account.getPassword());
            st.setString(3, account.getEmail());
            st.setString(4, account.getPhoneNumber());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @Override
    public boolean isManagerAccountExist(String username, String email, String phonenumber) {
        String sql = "select * from Manager\n"
                + "where username =? and address=? and email=? and phonenumber=? and status=1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, email);
            st.setString(3, phonenumber);
            ResultSet rs = st.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    @Override
    public boolean isManagerExist(String name, String address, String phonenumber) {
        String sql = "select * from Manager\n"
                + "where fullname =? and address=? and phonenumber=? and status=1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, address);
            st.setString(3, phonenumber);
            ResultSet rs = st.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    @Override
    public int getManagerId() {
        String sql = "select MAX(manager_id) from Manager";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) + 1;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }

    @Override
    public void updateManager(Manager manager) {
        String sql = "UPDATE [dbo].[Manager]\n"
                + "   SET [account_id] = ?\n"
                + "      ,[fullname] = ?\n"
                + "      ,[gender] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[dateofbirth] = ?\n"
                + "      ,[phonenumber] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[hiredate] = ?\n"
                + "      ,[salary] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[status] = 1\n"
                + " WHERE manager_id=?";
        try {
            PreparedStatement st=connection.prepareStatement(sql);
            st.setInt(1, manager.getAccount_id());
            st.setString(2, manager.getFullName());
            st.setString(3, manager.getGender());
            st.setString(4, manager.getEmail());
            st.setString(5, manager.getDateOfBirth());
            st.setString(6, manager.getPhoneNumber());
            st.setString(7, manager.getAddress());
            
            // Convert java.util.Date to java.sql.Date for SQL DATE type
            java.util.Date hireDate = manager.getHireDate();
            if (hireDate != null) {
                st.setDate(8, new java.sql.Date(hireDate.getTime()));
            } else {
                st.setDate(8, null); // or handle the case where hireDate is null
            }

            st.setFloat(9, manager.getSalary());
            st.setString(10, manager.getImage());
            st.setInt(11, manager.getManager_id());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}
