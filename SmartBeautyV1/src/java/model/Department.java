/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 * a class have information of department
 * @author LENOVO
 */
public class Department {
    private int department_id;
    private String department_name;
    private int manager_id;
    private boolean status;
    private String namemanager;

    public Department() {
    }
    /**
     * constructor of department
     * @param department_id of department
     * @param department_name of department
     * @param manager_id of department
     * @param status of department
     */
    public Department(int department_id, String department_name, int manager_id, boolean status) {
        this.department_id = department_id;
        this.department_name = department_name;
        this.manager_id = manager_id;
        this.status = status;
    }
      
    public Department(String department_name, int manager_id, boolean status) {
        this.department_name = department_name;
        this.manager_id = manager_id;
        this.status = status;
    }

    public Department(int department_id, String department_name, int manager_id, boolean status, String namemanager) {
        this.department_id = department_id;
        this.department_name = department_name;
        this.manager_id = manager_id;
        this.status = status;
        this.namemanager = namemanager;
    }

    public String getNamemanager() {
        return namemanager;
    }

    public void setNamemanager(String namemanager) {
        this.namemanager = namemanager;
    }
    

    public int getDepartment_id() {
        return department_id;
    }

    public void setDepartment_id(int department_id) {
        this.department_id = department_id;
    }

    public String getDepartment_name() {
        return department_name;
    }

    public void setDepartment_name(String department_name) {
        this.department_name = department_name;
    }

    public int getManager_id() {
        return manager_id;
    }

    public void setManager_id(int manager_id) {
        this.manager_id = manager_id;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
    
}
