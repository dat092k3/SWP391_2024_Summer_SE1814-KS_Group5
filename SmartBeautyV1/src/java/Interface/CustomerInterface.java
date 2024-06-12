/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interface;

import DAO.CustomerDAO;
import model.Customer;

/**
 *
 * @author LENOVO
 */
public interface CustomerInterface {

    public Customer getCustomerById(int account_id);

    public void updateProfileCustomer(String fullname, String gender, String email, String dateofbirth, String phonenumber, String address, String image, float height, float weight, int account_id);

    public void InsertProfile(int account_id, String fullname, String gender, String email, String dateofbirth, String phonenumber, String address, String image, float height, float weight);

}
