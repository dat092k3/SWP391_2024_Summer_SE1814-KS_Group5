/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 * a class have information of Type of equipment
 * @author LENOVO
 */
public class TypeofEquipment {
    private int type_id;
    private String name;

    public TypeofEquipment() {
    }
    /**
     * constructor of TypeofEquipment
     * 
     * @param name of equipment
     * @param type_id of equipment
     */
    public TypeofEquipment(int type_id, String name) {
        this.type_id = type_id;
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getType_id() {
        return type_id;
    }

    public void setType_id(int type_id) {
        this.type_id = type_id;
    }
    
    
    
}
