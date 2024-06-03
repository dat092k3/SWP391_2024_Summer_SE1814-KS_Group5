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
    private TypeofEquipment type_id;
    private float price;
    private Supplier supplier_id;
    private int quantity;
    private String description;

    public Equipment() {
    }
    /**
     * constructor of equipment
     * 
     * @param equipment_name of equipment
     * @param type_id of equipment
     * @param price of equipment
     * @param supplier_id of equipment
     * @param quantity of equipment
     * @param description of equipment
     * @param equipment_id  of equipment
     */
    public Equipment(int equipment_id, String equipment_name, TypeofEquipment type_id, float price, Supplier supplier_id, int quantity, String description) {
        this.equipment_id = equipment_id;
        this.equipment_name = equipment_name;
        this.type_id = type_id;
        this.price = price;
        this.supplier_id = supplier_id;
        this.quantity = quantity;
        this.description = description;
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

    public TypeofEquipment getType_id() {
        return type_id;
    }

    public void setType_id(TypeofEquipment type_id) {
        this.type_id = type_id;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public Supplier getSupplier_id() {
        return supplier_id;
    }

    public void setSupplier_id(Supplier supplier_id) {
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
