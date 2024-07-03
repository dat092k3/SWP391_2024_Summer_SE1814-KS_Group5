/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interface;

import java.util.List;
import model.Account;
import model.Manager;

/**
 *
 * @author LENOVO
 */
public interface ManagerInterface {

    public Manager getManagerById(int account_id);

    public void updateProfileManager(String fullname, String gender, String email, String dateofbirth, String phonenumber, String address, String image, int account_id);

    public List<Manager> getAllManagers();

    public void addNewManager(Manager manager);

    public boolean isManagerExist(String name, String address, String phonenumber);

    public int getManagerId();

    public boolean isManagerAccountExist(String username, String email, String phonenumber);

    public void addNewAccountManager(Account account);

    public void updateManager(Manager manager);
}
