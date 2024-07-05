/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 * history of customer register service
 *
 * @author LENOVO
 */
public class CustomerService {

    private Service service_id;
    private int customer_id;
    private Date date;
    private Date end_date;
    private int employee_id;
    private float total_price;

    public CustomerService() {
    }

    /**
     * constructor of CustomerService
     *
     * @param service_id of service
     * @param customer_id of customer register service
     * @param date of register service
     * @param end_date
     * @param employee_id
     * @param total_price
     */
    

    public CustomerService(Service service_id, int customer_id, Date date, Date end_date, int employee_id, float total_price) {
        this.service_id = service_id;
        this.customer_id = customer_id;
        this.date = date;
        this.end_date = end_date;
        this.employee_id = employee_id;
        this.total_price = total_price;
    }

    public Date getEnd_date() {
        return end_date;
    }

    public void setEnd_date(Date end_date) {
        this.end_date = end_date;
    }

    public int getEmployee_id() {
        return employee_id;
    }

    public void setEmployee_id(int employee_id) {
        this.employee_id = employee_id;
    }

    public float getTotal_price() {
        return total_price;
    }

    public void setTotal_price(float total_price) {
        this.total_price = total_price;
    }

    
    public Service getService_id() {
        return service_id;
    }

    public void setService_id(Service service_id) {
        this.service_id = service_id;
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
