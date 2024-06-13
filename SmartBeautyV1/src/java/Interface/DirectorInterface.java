/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interface;

import DAO.*;
import model.Director;

/**
 *
 * @author LENOVO
 */
public interface DirectorInterface {

    public Director getDirectorById(int account_id);

    public void updateProfileDirector(String fullname, String gender, String email, String dateofbirth, String phonenumber, String address, String image, int account_id);

}
