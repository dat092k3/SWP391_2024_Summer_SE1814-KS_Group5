/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 * a class have information of service
 *
 * @author LENOVO
 */
public class Service {

    private int service_id;
    private String description;
    private float price;
    private int discount;
    private String service_name;

    public Service() {
    }

    /**
     * constructor of service
     *
     * @param service_id of service
     * @param description of service
     * @param price of service
     * @param discount of service
     * @param service_name of service
     */
    public Service(int service_id, String description, float price, int discount, String service_name) {
        this.service_id = service_id;
        this.description = description;
        this.price = price;
        this.discount = discount;
        this.service_name = service_name;
    }

    public int getService_id() {
        return service_id;
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

    public String getService_name() {
        return service_name;
    }

    public void setService_name(String service_name) {
        this.service_name = service_name;
    }

}
