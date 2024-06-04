/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 * a class have information schedule of customer
 * @author LENOVO
 */
public class Schedule {
    private Slot slot_id;
    private int employee_id;
    private int customer_id;
    private Date date;

    public Schedule() {
    }
    /**
     * constructor of schedule
     * 
     * @param slot_id of slot
     * @param employee_id of employee
     * @param customer_id of customer
     * @param date of schedule have that slot
     */

   

    public Schedule(Slot slot_id, int employee_id, int customer_id, Date date) {
        this.slot_id = slot_id;
        this.employee_id = employee_id;
        this.customer_id = customer_id;
        this.date = date;
    }

    public Slot getSlot_id() {
        return slot_id;
    }

    public void setSlot_id(Slot slot_id) {
        this.slot_id = slot_id;
    }

    public int getEmployee_id() {
        return employee_id;
    }

    public void setEmployee_id(int employee_id) {
        this.employee_id = employee_id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    
    
    
}
