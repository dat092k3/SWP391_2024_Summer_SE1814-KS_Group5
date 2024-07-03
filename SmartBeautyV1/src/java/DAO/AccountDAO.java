/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Interface.AccountInterface;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import context.DBContext;
import java.util.ArrayList;
import java.util.List;
import model.Account;

/**
 * access data in database
 *
 * @author LENOVO
 */
public class AccountDAO  extends DBContext implements AccountInterface {

    /**
     * find account in database to login
     *
     * @param username of account want to login
     * @param password of account want to login
     * @return Account
     */
    @Override
    public Account findAccount(String username, String password) {
        String sql;
        if (username.contains("@")) {
            sql = "select * from account where status=1 and  email='" + username + "' and password='" + password + "'";
        } else {
            sql = "select * from account where status=1 and username='" + username + "' and password='" + password + "'";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Account(rs);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    /**
     * check account exist
     *
     * @param username of account in database
     * @param phonenumber of account in database
     * @return Account
     */
    @Override
    public Account checkAccountExists(String username, String phonenumber) {
        String sql = "SELECT * FROM Account WHERE username = ? OR email = ? OR phonenumber=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, username); // Can check both username and email
            st.setString(3, phonenumber);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Account(rs);
            }
        } catch (SQLException ex) {
            System.out.println("Database error: " + ex.getMessage());
        }
        return null;
    }

    /**
     * sign up
     *
     * @param username is value of account want to register
     * @param password is value of account want to register
     * @param email is value of account want to register
     * @param phonenumber is value of account want to register
     */
    @Override
    public void signup(String username, String password, String email, String phonenumber) {
        String sql = "INSERT INTO Account (username, password, email, phonenumber, role, status) VALUES (?, ?, ?, ?, 'Customer', 1)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            st.setString(3, email);
            st.setString(4, phonenumber);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Signup error: " + e.getMessage());
        }
    }

    /**
     * function check email exist
     *
     * @param email of account
     * @return email
     */
    @Override
    public String checkEmailExist(String email) {
        try {
            String sql = "select * from Account where email = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return email;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    /**
     * function to do get username by email
     *
     * @param email of account
     * @return username
     */
    @Override
    public String getUserNameByEmail(String email) {
        String sql = "SELECT Top 1 username FROM Account WHERE email =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            //set ?
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String name = rs.getString(1);
                return name;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     * function to do get account by username
     *
     * @param username of account
     * @return Account
     */
    @Override
    public Account getAccountByUserName(String username) {
        String sql = "SELECT * FROM Account where username = ? and [status] = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            //set ?
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            //1
            if (rs.next()) {
                Account account = new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6));
                return account;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     * function to do update password
     *
     * @param password of account
     * @param username of account
     */
    @Override
    public void updatePassByUserName(String password, String username) {
        String sql = "update Account set password = ? where username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, password);
            st.setString(2, username);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    /**
     * function to do get email of account
     * @param account_id of user
     * @return email of account
     */
    @Override
    public String getEmailOfAccount(String account_id) {
        String sql = "select email  from Account where account_id =?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, account_id);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("email");
                }
            }
        } catch (SQLException e) {
            System.out.println("Database error while retrieving email: " + e.getMessage());
        }
        return null;
    }
     /**
     * function to do get phonenumber of account
     * @param phonenumber of user
     * @return phonenumber of account
     */
    @Override
    public String getPhoneOfAccount(String account_id) {
        String sql = "select phonenumber  from Account where account_id =?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, account_id);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("phonenumber");
                }
            }
        } catch (SQLException e) {
            System.out.println("Database error while retrieving phonenumber: " + e.getMessage());
        }
        return null;
    }
    /**
     *
     * @param username is value of account want to add
     * @param password is value of account want to add 
     * @param email is value of account want to add
     * @param phonenumber is value of account want to add
     * @param role is value of account want to add
     */
    @Override
    public void AddAccount(String username, String password, String email, String phonenumber, String role) {
        String sql = "INSERT INTO Account (username, password, email, phonenumber, role, status) VALUES (?, ?, ?, ?, ?, 1)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);  
            st.setString(1, username);
            st.setString(2, password);
            st.setString(3, email);
            st.setString(4, phonenumber);
            st.setString(5, role);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("AddAccount error: " + e.getMessage());
        }
    }

    @Override
    /**
     * function to get accounts with role 'PT' or 'Takecare'
     *
     * @return List of Accounts
     */
    public List<Account> getAccountEmployeeByRole() {
        String sql = "SELECT * FROM Account WHERE role = 'PT' OR role = 'Takecare'";
        List<Account> accounts = new ArrayList<>();
        try (PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                Account account = new Account(rs.getInt("account_id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("phonenumber"),
                        rs.getString("role"),
                        rs.getString("status"));
                accounts.add(account);
            }
        } catch (SQLException e) {
            System.out.println("Database error while retrieving accounts: " + e.getMessage());
        }
        return accounts;
    }

    /**
     * Function to retrieve an account by account_id
     *
     * @param account_id The ID of the account to retrieve
     * @return Account object if found, otherwise null
     */
    @Override
    public Account getAccountByAccountId(int account_id) {
        String sql = "SELECT username, password, email, phonenumber, role, status FROM Account WHERE account_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, account_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account account = new Account(
                        account_id,
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("phonenumber"),
                        rs.getString("role"),
                        rs.getString("status")
                );
                return account;
            }
        } catch (SQLException e) {
            System.out.println("Database error while retrieving account: " + e.getMessage());
        }
        return null;
    }

    /**
     * Function to update an account's details
     *
     * @param account_id The ID of the account to update
     * @param username The new username of the account
     * @param password The new password of the account
     * @param email The new email of the account
     * @param phonenumber The new phonenumber of the account
     * @param role The new role of the account
     * @param status The new status of the account
     */
    @Override
    public void EditAccountOfEmployee(int account_id, String username, String password, String email, String phonenumber, String role, String status) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET [username] = ?\n"
                + "      ,[password] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[phonenumber] = ?\n"
                + "      ,[role] = ?\n"
                + "      ,[status] = ?\n"
                + " WHERE account_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, username);
            st.setString(2, password);
            st.setString(3, email);
            st.setString(4, phonenumber);
            st.setString(5, role);
            st.setString(6, status);
            st.setInt(7, account_id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Database error while updating account: " + e.getMessage());
        }
    }

    /**
     *
     * @param txtSearch is search
     * @return list
     */
    @Override
    public List<Account> SearchAccountByNameOrPhonenumber(String txtSearch) {
        List<Account> list = new ArrayList<>();
        String sql = "Select * from Account where  (username like ? Or phonenumber like ? Or Email like ?) And (role = 'PT' Or  role = 'Takecare')";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, "%" + txtSearch + "%");
            st.setString(2, "%" + txtSearch + "%");
            st.setString(3, "%" + txtSearch + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account account = new Account(
                        rs.getInt("account_id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("phoneNumber"),
                        rs.getString("role"),
                        rs.getString("status"));
                list.add(account);
            }
        } catch (SQLException e) {
            System.out.println(e); 
        }
        return list;
    }

    /**
     * Function to get the newest account ID of an employee with role 'PT' or
     * 'Takecare'
     *
     * @return The highest account_id of an employee with role 'PT' or 
     * 'Takecare', or -1 if no such account exists
     */
    @Override
    public int getNewAccountIdOfEmployee() {
        String sql = "SELECT MAX(account_id) FROM Account WHERE role = 'PT' OR role = 'Takecare'";
        try (PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Database error while retrieving the newest account ID: " + e.getMessage());
        }
        return -1; // Return -1 if no account is found or an error occurs
    }

    @Override
    public int getAccountIdToAddManager() {
        String sql = "SELECT MAX(account_id) FROM Account";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }
    
    public void updateInformationIfUpdateManager(Account account) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET [email] = ?\n"
                + "      ,[phonenumber] = ?\n"
                + "      ,[role] = 'Manager'\n"
                + "      ,[status] =1\n"
                + " WHERE account_id=?";
        try {
            PreparedStatement st=connection.prepareStatement(sql);
            st.setString(1, account.getEmail());
            st.setString(2, account.getPhoneNumber());
            st.setInt(3, account.getAccount_id());
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
