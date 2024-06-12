/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interface;

import DAO.*;
import model.Manager;

/**
 *
 * @author LENOVO
 */
public interface ManagerInterface {

    public Manager getManagerById(int account_id);

    public void updateProfileManager(String fullname, String gender, String email, String dateofbirth, String phonenumber, String address, String image, int account_id);

}
