/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interface;

import java.util.List;
import model.Department;

/**
 *
 * @author LENOVO
 */
public interface DepartmentInterface {
    public List<Department> getAllDepartment();
    
    public Department getDepartmentById(int id);
    
    public boolean isDepartmentExistEdit(String name, int department_id);
    
    public boolean isDepartmentExistAdd(String name);
    
    public boolean isManagerManingAnotherDepartment(String name, int manager_id, int department_id);
    
    public void addNewDepartment(Department department);
    
    public void updateDepartment(Department department);
    
    public void deleteDepartment(int id);
    
    public List<Department> findDepartmentByName(String nameSearch);
    
    public void deleteAllEmployeeeIfDeleteDepartment();
}

