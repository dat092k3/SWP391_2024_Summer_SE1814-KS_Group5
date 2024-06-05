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
    private int deparment_id;
    private String department_name;
    private int manager_id;

    public Department() {
    }
    
    /**
     * constructor of department
     * 
     * @param deparment_id of department
     * @param department_name of department
     * @param manager_id of department
     */
    

    public Department(int deparment_id, String department_name, int manager_id) {
        this.deparment_id = deparment_id;
        this.department_name = department_name;
        this.manager_id = manager_id;
    }

    public int getDeparment_id() {
        return deparment_id;
    }

    public void setDeparment_id(int deparment_id) {
        this.deparment_id = deparment_id;
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
    
    
    
}
