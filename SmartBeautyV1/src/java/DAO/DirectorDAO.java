/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Interface.DirectorInterface;
import context.DBContext;
import model.Director;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Department;
import model.Employee;
import model.Manager;

/**
 *
 * @author admin
 */
public class DirectorDAO extends DBContext implements DirectorInterface {

    /**
     * function to do get director by director_id
     *
     * @param account_id is id of director
     * @return account director
     */
    @Override
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
    @Override
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

    @Override
    public List<Manager> getAllManager() {
        List<Manager> list = new ArrayList<>();
        String sql = "select * from Manager join Department\n"
                + "on Manager.manager_id = Department.manager_id";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int managerId = rs.getInt("manager_id");
                String manager_name = rs.getString("fullname");
                String address = rs.getString("address");
                String phonenumber = rs.getString("phonenumber");
                String department_name = rs.getString("department_name"); // Lấy tên của phòng ban
                list.add(new Manager(managerId, manager_name, phonenumber, address, department_name));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    @Override
    public int countAdmin() {
        String sql = "select count(*) as totalAdmin from Account where role='Admin'";
        int count = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("totalAdmin");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return count;
    }

    @Override
    public int countPT() {
        String sql = "select count(*) as totalPT from Account where role='PT'";
        int count = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("totalPT");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return count;
    }

    @Override
    public int countTakeCare() {
        String sql = "select count(*) as totalTakecare from Account where role='Takecare'";
        int count = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("totalTakecare");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return count;
    }

    @Override
    public int countManager() {
        String sql = "select count(*) as totalManager from Account where role='Manager'";
        int count = 0;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt("totalManager");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return count;
    }

    @Override
    public List<Employee> getEmployeeActive() {
        List<Employee> list = new ArrayList<>();
        String sql = "select * from Employee join Department\n"
                + "on Employee.department_id = Department.department_id\n"
                + "where Employee.status=1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int employee__id = rs.getInt("employee_id");
                String employee_name = rs.getString("fullname");
                String address = rs.getString("address");
                String phonenumber = rs.getString("phonenumber");
                String department_name = rs.getString("department_name");
                list.add(new Employee(employee__id, employee_name, phonenumber, address, department_name));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    /**
     *
     * @return
     */
    @Override
    public List<Employee> getEmployeeNonActive() {
        List<Employee> list = new ArrayList<>();
        String sql = "select * from Employee join Department\n"
                + "on Employee.department_id = Department.department_id\n"
                + "where Employee.status = 0";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int employee__id = rs.getInt("employee_id");
                String employee_name = rs.getString("fullname");
                String address = rs.getString("address");
                String phonenumber = rs.getString("phonenumber");
                String department_name = rs.getString("department_name");
                list.add(new Employee(employee__id, employee_name, phonenumber, address, department_name));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    @Override
    public List<Department> getDepartmentActive() {
        List<Department> list = new ArrayList<>();
        String sql = "select * from Department\n"
                + "where status=1";
        try {
            PreparedStatement st= connection.prepareStatement(sql);
            ResultSet rs= st.executeQuery();
            while(rs.next()){
               int department_id=rs.getInt("department_id");
               String department_name=rs.getString("department_name");
               list.add(new Department(department_id, department_name));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    @Override
    public List<Department> getDepartmentNonActive() {
        List<Department> list = new ArrayList<>();
        String sql = "select * from Department\n"
                + "where status=0";
        try {
            PreparedStatement st= connection.prepareStatement(sql);
            ResultSet rs= st.executeQuery();
            while(rs.next()){
               int department_id=rs.getInt("department_id");
               String department_name=rs.getString("department_name");
               list.add(new Department(department_id, department_name));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
