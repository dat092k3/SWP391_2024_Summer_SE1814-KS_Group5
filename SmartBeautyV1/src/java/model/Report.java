/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author LENOVO
 */
public class Report {
    private int report_id;
    private String report_name;
    private String description;
    private String date;
    private String status;
    private int manager_id;
    private String manager_name;

    public Report() {
    }
    
    public Report(String report_name, String description, String date, String status, int manager_id) {
        this.report_name = report_name;
        this.description = description;
        this.date = date;
        this.status = status;
        this.manager_id = manager_id;
    }

    public Report(int report_id, String report_name, String description, String date, String status, int manager_id, String manager_name) {
        this.report_id = report_id;
        this.report_name = report_name;
        this.description = description;
        this.date = date;
        this.status = status;
        this.manager_id = manager_id;
        this.manager_name = manager_name;
    }
    
    public Report(int report_id, String report_name, String description, String date, String status, String manager_name) {
        this.report_id = report_id;
        this.report_name = report_name;
        this.description = description;
        this.date = date;
        this.status = status;
        this.manager_name = manager_name;
    }
    
    public Report(int report_id, String report_name, String description, String date, String status) {
        this.report_id = report_id;
        this.report_name = report_name;
        this.description = description;
        this.date = date;
        this.status = status;
    }
    
    public Report(int report_id,String status) {
        this.report_id = report_id;
        this.status = status;
    }
    
    public String getManager_name() {
        return manager_name;
    }

    public void setManager_name(String manager_name) {
        this.manager_name = manager_name;
    }
    

    public int getReport_id() {
        return report_id;
    }

    public void setReport_id(int report_id) {
        this.report_id = report_id;
    }

    public String getReport_name() {
        return report_name;
    }

    public void setReport_name(String report_name) {
        this.report_name = report_name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getManager_id() {
        return manager_id;
    }

    public void setManager_id(int manager_id) {
        this.manager_id = manager_id;
    }
    
}
