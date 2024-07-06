/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;

/**
 * history of customer register service
 *
 * @author LENOVO
 */
public class CustomerService {

    private int service_id;
    private int customer_id;
    private Timestamp  date;
    private Timestamp  end_date;
    private int employee_id;
    private float total_price;
    private String service_name;
    private String image;
    private String description;

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
    

    public CustomerService(int service_id, int customer_id, Timestamp  date, Timestamp  end_date, int employee_id, float total_price) {
        this.service_id = service_id;
        this.customer_id = customer_id;
        this.date = date;
        this.end_date = end_date;
        this.employee_id = employee_id;
        this.total_price = total_price;
    }

    public CustomerService(int service_id, int customer_id, Timestamp date, Timestamp end_date, int employee_id, float total_price, String service_name, String image, String description) {
        this.service_id = service_id;
        this.customer_id = customer_id;
        this.date = date;
        this.end_date = end_date;
        this.employee_id = employee_id;
        this.total_price = total_price;
        this.service_name = service_name;
        this.image = image;
        this.description = description;
    }

    public String getService_name() {
        return service_name;
    }

    public void setService_name(String service_name) {
        this.service_name = service_name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Timestamp  getEnd_date() {
        return end_date;
    }

    public void setEnd_date(Timestamp  end_date) {
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

    
    public int getService_id() {
        return service_id;
    }

    public void setService_id(int service_id) {
        this.service_id = service_id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public Timestamp  getDate() {
        return date;
    }

    public void setDate(Timestamp  date) {
        this.date = date;
    }
}
