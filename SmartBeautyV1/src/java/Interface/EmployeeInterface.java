/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interface;

import java.util.List;
import model.Employee;
import model.CustomerService;

/**
 *
 * @author LENOVO
 */
public interface EmployeeInterface {

    public Employee getEmployeeById(int account_id);

    public void updateProfileEmployee(String fullname, String gender, String email, String dateofbirth, String phonenumber, String address, String image, int account_id);

    public void updateProfileEmployeePhonenumberAndEmail(String email, String phonenumber, int account_id); 

    public void addProfileEmployee(String fullname, String gender, String email, String dateofbirth, String phonenumber, String address, String hiredate, String image, String experience, int department_id, int account_id);

    public List<Employee> getProfileEmployeeByDepartmentId();

    public List<Employee> getPTByDepartment();

    public List<Employee> getProfileEmployeeByDepartmentIdAdmin();

    public Employee getProfileEmployeeByAccountId(int account_id);

    public Employee getProfileEmployeeByAccountIdAdmin(int account_id);

    public void addAccounIdEmployee(int account_id);

    public void addDepartmentIdByAccountId(int account_id);

    public void addDepartmentIdByAccountIdAdmin(int account_id);

}
