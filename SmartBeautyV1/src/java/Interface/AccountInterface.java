/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interface;

import model.Account;

/**
 *
 * @author LENOVO
 */
public interface AccountInterface {

    public Account findAccount(String username, String password);

    public Account checkAccountExists(String username, String phonenumber);

    public void signup(String username, String password, String email, String phonenumber);

    public String checkEmailExist(String email);

    public String getUserNameByEmail(String email);

    public Account getAccountByUserName(String username);

    public void updatePassByUserName(String password, String username);

    public String getEmailOfAccount(String account_id);

    public String getPhoneOfAccount(String phonenumber);
}
