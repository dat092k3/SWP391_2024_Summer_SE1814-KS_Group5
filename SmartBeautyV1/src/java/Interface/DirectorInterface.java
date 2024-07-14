/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interface;

import java.util.List;
import model.Department;
import model.Director;
import model.Employee;
import model.Manager;

/**
 *
 * @author LENOVO
 */
public interface DirectorInterface {

    public Director getDirectorById(int account_id);

    public void updateProfileDirector(String fullname, String gender, String email, String dateofbirth, String phonenumber, String address, String image, int account_id);
    
    public List<Manager> getAllManager();

    public int countAdmin();

    public int countPT();

    public int countTakeCare();

    public int countManager();
    
    public List<Employee> getEmployeeActive();
    
    public List<Employee> getEmployeeNonActive();
    
    public List<Department> getDepartmentActive();
    
    public List<Department> getDepartmentNonActive();
    
}
