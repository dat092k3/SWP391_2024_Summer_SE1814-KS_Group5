/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 * a class have information of customer want to contact
 * @author LENOVO
 */
public class Contact {
    private Customer customer_id;
    private Date date;
    private String status;

    public Contact() {
    }
    
    /**
     * constructor of contact
     * 
     * @param customer_id of customer want to contact
     * @param date of customer want to contact
     * @param status of customer want to contact
     */
    public Contact(Customer customer_id, Date date, String status) {
        this.customer_id = customer_id;
        this.date = date;
        this.status = status;
    }

    public Customer getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(Customer customer_id) {
        this.customer_id = customer_id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
}
