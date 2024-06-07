/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 * a class have information of supplier
 * @author LENOVO
 */
public class Supplier {
    private int supplier_id;
    private String supplier_name;
    private String image;
    private String address;
    private String phoneNumber;
    private String email;
    private boolean status;

    public Supplier() {
    }
    
    /**
     * constructor of supplier
     * 
     * @param supplier_id of supplier
     * @param supplier_name of supplier
     * @param image of supplier
     * @param address of supplier
     * @param phoneNumber of supplier
     * @param email of supplier
     * @param status of supplier
     */
    public Supplier(int supplier_id, String supplier_name, String image, String address, String phoneNumber, String email, boolean status) {
        this.supplier_id = supplier_id;
        this.supplier_name = supplier_name;
        this.image = image;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.status = status;
    }
    
    /**
     * constructor of supplier to add new supplier
     * 
     * @param supplier_name of supplier
     * @param image of supplier
     * @param address of supplier
     * @param phoneNumber of supplier
     * @param email of supplier
     * @param status of supplier
     */
    public Supplier(String supplier_name, String image, String address, String phoneNumber, String email, boolean status) {
        this.supplier_name = supplier_name;
        this.image = image;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.status = status;
    }

    public int getSupplier_id() {
        return supplier_id;
    }

    public void setSupplier_id(int supplier_id) {
        this.supplier_id = supplier_id;
    }

    public String getSupplier_name() {
        return supplier_name;
    }

    public void setSupplier_name(String supplier_name) {
        this.supplier_name = supplier_name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
    
}
