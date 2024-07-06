/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Interface.DepartmentInterface;
import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Department;

/**
 *
 * @author LENOVO
 */
public class DepartmentDAO extends DBContext implements DepartmentInterface {

    /**
     * get all department
     *
     * @return list have all department
     */
    @Override
    public List<Department> getAllDepartment() {
        List<Department> list = new ArrayList<>();
        String sql = "SELECT d.department_id, d.department_name, d.manager_id, d.status, m.fullname\n"
                + "                     FROM Department d \n"
                + "                     JOIN Manager m ON d.manager_id = m.manager_id \n"
                + "                     WHERE d.status = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int departmentId = rs.getInt("department_id");
                String departmentName = rs.getString("department_name");
                int managerId = rs.getInt("manager_id");
                boolean status = rs.getBoolean("status");
                String manager_name = rs.getString("fullname"); // Lấy tên của quản lý
                list.add(new Department(departmentId, departmentName, managerId, status, manager_name));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    /**
     * get department by id
     *
     * @param id of department need to get
     * @return department
     */
    @Override
    public Department getDepartmentById(int id) {
        String sql = "select * from Department where department_id=? and status=1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int department_id = rs.getInt("department_id");
                String department_name = rs.getString("department_name");
                int manager_id = rs.getInt("manager_id");
                boolean status = rs.getBoolean("status");
                return new Department(department_id, department_name, manager_id, status);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     * check department existed or not
     *
     * @param name of department need to check
     * @param department_id of department need to check
     * @return true if existed, false otherwise
     */
    @Override
    public boolean isDepartmentExistEdit(String name, int department_id) {
        String sql = "SELECT * FROM Department WHERE (department_name = ?) AND department_id != ? AND status = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setInt(2, department_id);
            ResultSet rs = st.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    /**
     * check department existed or not
     *
     * @param name of department need to check
     * @return true if existed, false otherwise
     */
    @Override
    public boolean isDepartmentExistAdd(String name) {
        String sql = "select * from Department where department_name=? and status=1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            ResultSet rs = st.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    /**
     * check manager manage department or not
     *
     * @param name of manager need to check
     * @param manager_id of manager need to check
     * @param department_id 
     * @return true if existed, false otherwise
     */
    @Override
    public boolean isManagerManingAnotherDepartment(String name, int manager_id, int department_id) {
        String sql = "SELECT * FROM Department WHERE (department_name != ? AND manager_id = ?) and department_id !=? AND status = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setInt(2, manager_id);
            st.setInt(3, department_id);
            ResultSet rs = st.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    /**
     * add department to system
     *
     * @param department is department need to add
     */
    @Override
    public void addNewDepartment(Department department) {
        String sql = "INSERT INTO [dbo].[Department]\n"
                + "           ([department_name]\n"
                + "           ,[manager_id]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?,?,1)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, department.getDepartment_name());
            st.setInt(2, department.getManager_id());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    /**
     * update department
     *
     * @param department is department need to update information
     */
    @Override
    public void updateDepartment(Department department) {
        String sql = "UPDATE [dbo].[Department]\n"
                + "   SET [department_name] = ?\n"
                + "      ,[manager_id] = ?\n"
                + " WHERE department_id=? and status=1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, department.getDepartment_name());
            st.setInt(2, department.getManager_id());
            st.setInt(3, department.getDepartment_id());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    /**
     * delete department
     *
     * @param id of department need to delete
     */
    @Override
    public void deleteDepartment(int id) {
        String sql = "UPDATE [dbo].[Department]\n"
                + "   SET [status] = 0\n"
                + " WHERE department_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    /**
     * find department by name
     *
     * @param nameSearch is character or name of department need to find
     * @return list contains all department contain character or name
     * corresponding
     */
    @Override
    public List<Department> findDepartmentByName(String nameSearch) {
        List<Department> list = new ArrayList<>();
        String sql = "select * from Department where status=1";
        if (nameSearch != null && !nameSearch.trim().equals("")) {
            sql += "and department_name like ?";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            if (nameSearch != null && !nameSearch.trim().equals("")) {
                st.setString(1, "%" + nameSearch + "%");
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    int department_id = rs.getInt("department_id");
                    String department_name = rs.getString("department_name");
                    int manager_id = rs.getInt("manager_id");
                    boolean status = rs.getBoolean("status");
                    list.add(new Department(department_id, department_name, manager_id, status));
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;

    }

    @Override
    public void deleteAllEmployeeeIfDeleteDepartment() {
        String sql = "UPDATE \n"
                + "    Account\n"
                + "SET \n"
                + "    status = 0\n"
                + "FROM \n"
                + "    Account\n"
                + "JOIN \n"
                + "    Employee ON Account.account_id = Employee.account_id\n"
                + "JOIN \n"
                + "    Department ON Employee.department_id = Department.department_id\n"
                + "WHERE \n"
                + "    Department.status = 0;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}
