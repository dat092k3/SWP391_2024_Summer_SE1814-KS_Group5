/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interface;

import java.util.List;
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

    public void AddAccount(String username, String password, String email, String phonenumber, String role);

    public List<Account> getAccountEmployeeByRole();

    public List<Account> getAccountEmployeeByRoleAdmin();

    public Account getAccountByAccountId(int account_id);

    public void EditAccountOfEmployee(int account_id, String username, String password, String email, String phonenumber, String role, String status);

    public List<Account> SearchAccountByNameOrPhonenumber(String txtSearch);

    public List<Account> SearchAccountByNameOrPhonenumberAdmin(String txtSearch);

    public int getNewAccountIdOfEmployee();

    public int getNewAccountIdOfEmployeeAdmin();

    public int getAccountIdToAddManager();
}
