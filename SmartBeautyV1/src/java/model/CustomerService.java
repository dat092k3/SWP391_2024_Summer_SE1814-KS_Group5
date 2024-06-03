/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 * history of customer register service
 * @author LENOVO
 */
public class CustomerService {
    private Service service_id;
    private Customer customer_id;
    private Date date;

    public CustomerService() {
    }
    /**
     * constructor of CustomerService
     * 
     * @param service_id of service
     * @param customer_id of customer register service
     * @param date of register service
     */
    public CustomerService(Service service_id, Customer customer_id, Date date) {
        this.service_id = service_id;
        this.customer_id = customer_id;
        this.date = date;
    }

    public Service getService_id() {
        return service_id;
    }

    public void setService_id(Service service_id) {
        this.service_id = service_id;
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
    
    
}
