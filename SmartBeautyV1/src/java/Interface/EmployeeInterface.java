/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interface;

import model.Employee;

/**
 *
 * @author LENOVO
 */
public interface EmployeeInterface {

    public Employee getEmployeeById(int account_id);

    public void updateProfileEmployee(String fullname, String gender, String email, String dateofbirth, String phonenumber, String address, String image, int account_id);

}
