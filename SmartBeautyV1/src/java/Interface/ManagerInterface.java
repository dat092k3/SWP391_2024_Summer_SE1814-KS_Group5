/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interface;

import java.util.List;
import model.Account;
import model.Manager;
import model.Report;

/**
 *
 * @author LENOVO
 */
public interface ManagerInterface {

    public Manager getManagerById(int account_id);

    public void updateProfileManager(String fullname, String gender, String email, String dateofbirth, String phonenumber, String address, String image, int account_id);

    public List<Manager> getAllManagers();

    public void addNewManager(Manager manager);

    public boolean isManagerExistWhenSave(int managerId, String name, String image, String address, String phonenumber, String email, float salary);

    public boolean isManagerExist(String name, String address, String phonenumber);

    public int getManagerId();

    public boolean isManagerAccountExist(String username, String email, String phonenumber);

    public void addNewAccountManager(Account account);

    public void deleteManager(int id);

    public void updateManager(Manager manager);

    public List<Manager> findManager(String nameSearch);

    public Manager getManagerByAccountId(int account_id);

    public void addReport(Report report);

    public boolean checkReportExist(String name);

    public List<Report> getReportByDirector();

    public void updateReport(int id);

    public void RefuseReport(int id);

    public List<Report> getListReportForManager(int id);

    public List<Report> findReport(String nameSearch);

    public List<Report> getAllReport();

    public List<Report> getAllReport(int id);

    public List<Report> findReportForManager(String nameSearch, int id);

}
