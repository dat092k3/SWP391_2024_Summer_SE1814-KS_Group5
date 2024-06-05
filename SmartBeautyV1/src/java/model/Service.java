/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 * a class have information of service
 * @author LENOVO
 */
public class Service {
    private int service_id;
    private String description;
    private float price;
    private int discount;

    public Service() {
    }

    

    public int getService_id() {
        return service_id;
    }

    /**
     * constructor of service
     * 
     * @param service_id of service
     * @param description of service
     * @param price of service
     * @param discount of service
     */
    
    
    public Service(int service_id, String description, float price, int discount) {    
        this.service_id = service_id;
        this.description = description;
        this.price = price;
        this.discount = discount;
    }

    public void setService_id(int service_id) {
        this.service_id = service_id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }
    
    
}
