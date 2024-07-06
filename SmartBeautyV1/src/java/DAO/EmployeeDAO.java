/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Interface.EmployeeInterface;
import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Employee;

/**
 *
 * @author admin
 */
public class EmployeeDAO extends DBContext implements EmployeeInterface {

    /**
     * function to do get employee by account id
     *
     * @param account_id of employee
     * @return account_id of employee
     */
    @Override
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
    
    public Employee getEmployeeByEmployeeId(int employee_id) {
        String sql = "select * from Employee where employee_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, employee_id);
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
    @Override
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

    /**
     * function to do update updateProfileEmployeePhonenumberAndEmail employee
     *
     * @param email of employee
     * @param phonenumber of employee
     * @param account_id of employee
     */
    @Override
    public void updateProfileEmployeePhonenumberAndEmail(String email, String phonenumber, int account_id) {
        String sql = "UPDATE [dbo].[Employee]\n"
                + "   SET [email] = ?\n"
                + "      ,[phonenumber] = ?\n"
                + " WHERE account_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, phonenumber);
            st.setInt(3, account_id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    /**
     * function to do insert profile of Employee
     *
     * @param account_id of Employee
     * @param fullname of Employee
     * @param gender of Employee
     * @param email of Employee
     * @param dateofbirth of Employee
     * @param phonenumber of Employee
     * @param address of Employee
     * @param image of Employee
     * @param hiredate of Employee
     * @param experience of Employee
     * @param department of Employee
     */
    @Override
    public void addProfileEmployee(String fullname, String gender, String email, String dateofbirth, String phonenumber, String address, String hiredate, String image, String experience, int department_id, int account_id) {
        String sql = "UPDATE [dbo].[Employee]\n"
                + "   SET [fullname] = ? \n"
                + "      ,[gender] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[dateofbirth] = ?\n"
                + "      ,[phonenumber] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[hiredate] = ?\n"
                + "      ,[salary] = '0'\n"
                + "      ,[image] = ?\n"
                + "      ,[experience] = ?\n"
                + "      ,[status] = '1'\n"
                + "      ,[department_id] = ?\n"
                + " WHERE account_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, fullname);
            st.setString(2, gender);
            st.setString(3, email);
            st.setString(4, dateofbirth);
            st.setString(5, phonenumber);
            st.setString(6, address);
            st.setString(7, hiredate);
            st.setString(8, image);
            st.setString(9, experience);
            st.setInt(10, department_id);
            st.setInt(11, account_id);

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    @Override
    /**
     * function to get Profile Employee By Department Id = 1
     *
     * @return List of Employee
     */
    public List<Employee> getProfileEmployeeByDepartmentId() {
        String sql = "select * from Employee where  department_id ='1' or department_id = '2'";
        List<Employee> employees = new ArrayList<>();
        try (PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                Employee employee = new Employee(
                        rs.getInt(1),
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
                employees.add(employee);
            }
        } catch (SQLException e) {
            System.out.println("Database error while retrieving accounts: " + e.getMessage());
        }
        return employees;
    }

    @Override
    public List<Employee> getPTByDepartment() {
        String sql = "select e.* from Employee e left join Department d on e.department_id = d.department_id where  department_name = 'PT'";
        List<Employee> employees = new ArrayList<>();
        try (PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                Employee employee = new Employee(
                        rs.getInt(1),
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
                employees.add(employee);
            }
        } catch (SQLException e) {
            System.out.println("Database error while retrieving accounts: " + e.getMessage());
        }
        return employees;
    }

    @Override
    /**
     * function to get Profile Employee By Department Id = 3
     *
     * @return List of Employee
     */
    public List<Employee> getProfileEmployeeByDepartmentIdAdmin() {
        String sql = "select * from Employee where  department_id ='3'";
        List<Employee> employees = new ArrayList<>();
        try (PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                Employee employee = new Employee(
                        rs.getInt(1),
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
                employees.add(employee);
            }
        } catch (SQLException e) {
            System.out.println("Database error while retrieving accounts: " + e.getMessage());
        }
        return employees;
    }

    /**
     * Function to retrieve an account by account_id
     *
     * @param account_id The ID of the account to retrieve
     * @return Account object if found, otherwise null
     */
    @Override
    public Employee getProfileEmployeeByAccountId(int account_id) {
        String sql = "SELECT * FROM Employee WHERE account_id = ? and (department_id = '1' or department_id = '2')";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, account_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Employee employee = new Employee(
                        rs.getInt(1),
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
                return employee;
            }
        } catch (SQLException e) {
            System.out.println("Database error while retrieving account: " + e.getMessage());
        }
        return null;
    }

    /**
     * Function to retrieve an account by account_id
     *
     * @param account_id The ID of the account to retrieve
     * @return Account object if found, otherwise null
     */
    @Override
    public Employee getProfileEmployeeByAccountIdAdmin(int account_id) {
        String sql = "SELECT * FROM Employee WHERE account_id = ? and (department_id = '3')";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, account_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Employee employee = new Employee(
                        rs.getInt(1),
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
                return employee;
            }
        } catch (SQLException e) {
            System.out.println("Database error while retrieving account: " + e.getMessage());
        }
        return null;
    }

    /**
     * function to do insert account_id of Employee
     *
     * @param account_id of Employee
     */
    @Override
    public void addAccounIdEmployee(int account_id) {
        String sql = "INSERT INTO [dbo].[Employee]\n"
                + "           ([account_id])\n"
                + "     VALUES(?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, account_id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    /**
     * function to do update department_id of Employee by account_id
     *
     * @param account_id of Employee
     * @param department_id to be set for the Employee
     */
    @Override
    public void addDepartmentIdByAccountId(int account_id) {
        String sql = "UPDATE [dbo].[Employee]\n"
                + "   SET [department_id] = '1'\n"
                + " WHERE account_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, account_id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Database error while updating department_id: " + e.getMessage());
        }
    }

    /**
     * function to do update department_id of Employee by account_id
     *
     * @param account_id of Employee
     * @param department_id to be set for the Employee
     */
    @Override
    public void addDepartmentIdByAccountIdAdmin(int account_id) {
        String sql = "UPDATE [dbo].[Employee]\n"
                + "   SET [department_id] = '3'\n"
                + " WHERE account_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, account_id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Database error while updating department_id: " + e.getMessage());
        }
    }
}
