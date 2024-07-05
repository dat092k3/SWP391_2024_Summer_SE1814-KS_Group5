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
    private String image;
    private boolean status;
    private float pt_price;

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
     * @param image
     * @param status
     * @param pt_price
     */


    public Service(int service_id, String description, float price, int discount, String service_name, String image, boolean status, float pt_price) {
        this.service_id = service_id;
        this.description = description;
        this.price = price;
        this.discount = discount;
        this.service_name = service_name;
        this.image = image;
        this.status = status;
        this.pt_price = pt_price;
    }

    public Service(String description, float price, int discount, String service_name, String image, boolean status, float pt_price) {
        this.description = description;
        this.price = price;
        this.discount = discount;
        this.service_name = service_name;
        this.image = image;
        this.status = status;
        this.pt_price = pt_price;
    }

    public float getPt_price() {
        return pt_price;
    }

    public void setPt_price(float pt_price) {
        this.pt_price = pt_price;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
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
