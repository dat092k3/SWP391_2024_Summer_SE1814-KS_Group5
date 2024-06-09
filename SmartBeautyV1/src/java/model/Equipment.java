/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 * a class have information of equipment
 * @author LENOVO
 */
public class Equipment {
    private int equipment_id;
    private String equipment_name;
    private int type_id;
    private String image;
    private float price;
    private int supplier_id;
    private int quantity;
    private String description;
    private boolean status;

    public Equipment() {
    }
    /**
     * constructor of equipment
     * 
     * @param equipment_name of equipment
     * @param type_id of equipment
     * @param image of equipment
     * @param price of equipment
     * @param supplier_id of equipment
     * @param quantity of equipment
     * @param description of equipment
     * @param equipment_id  of equipment
     * @param status of equipment
     */
   
    public Equipment(int equipment_id, String equipment_name, int type_id, String image, float price, int supplier_id, int quantity, String description, boolean status) {
        this.equipment_id = equipment_id;
        this.equipment_name = equipment_name;
        this.type_id = type_id;
        this.image=image;
        this.price = price;
        this.supplier_id = supplier_id;
        this.quantity = quantity;
        this.description = description;
        this.status=status;
    }
    
    public Equipment(String equipment_name, int type_id, String image ,float price, int supplier_id, int quantity, String description, boolean status) {
        this.equipment_name = equipment_name;
        this.type_id = type_id;
        this.image=image;
        this.price = price;
        this.supplier_id = supplier_id;
        this.quantity = quantity;
        this.description = description;
        this.status=status;
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
    
    

    public int getEquipment_id() {
        return equipment_id;
    }

    public void setEquipment_id(int equipment_id) {
        this.equipment_id = equipment_id;
    }

    public String getEquipment_name() {
        return equipment_name;
    }

    public void setEquipment_name(String equipment_name) {
        this.equipment_name = equipment_name;
    }

    public int getType_id() {
        return type_id;
    }

    public void setType_id(int type_id) {
        this.type_id = type_id;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getSupplier_id() {
        return supplier_id;
    }

    public void setSupplier_id(int supplier_id) {
        this.supplier_id = supplier_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    
    
    
}
