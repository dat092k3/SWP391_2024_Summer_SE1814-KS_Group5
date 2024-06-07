/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

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
public class DepartmentDAO extends DBContext{
    
    public List<Department> getAllDepartment(){
        List<Department> list= new ArrayList<>();
        String sql="select * from Department";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Department department = new Department(rs.getInt("department_id"),rs.getString("department_name") , rs.getInt("manager_id"));
                list.add(department);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    
    }
}
