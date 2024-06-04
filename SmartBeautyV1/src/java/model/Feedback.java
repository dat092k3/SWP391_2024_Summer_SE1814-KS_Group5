/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 * a class have information of feedback of customer
 * @author LENOVO
 */
public class Feedback {
    private int customer_id;
    private String description;

    public Feedback() {
    }

    public Feedback(int customer_id, String description) {
        this.customer_id = customer_id;
        this.description = description;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    /**
     * constructor of feedback
     * 
     * @param customer_id of feedback of customer 
     * @param description of feedback
     */
 
    
}
