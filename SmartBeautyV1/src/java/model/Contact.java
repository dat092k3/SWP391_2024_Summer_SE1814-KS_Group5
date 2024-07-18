/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


/**
 * a class have information of customer want to contact
 * @author LENOVO
 */
public class Contact {
    private String name;
    private String date;
    private String email;
    private String message;
    private boolean status;
    private int key;

    public Contact() {
    }

    public Contact(String name, String date) {
        this.name = name;
        this.date = date;
    }

    public Contact(String name, String date, String email, String message, boolean status, int key) {
        this.name = name;
        this.date = date;
        this.email = email;
        this.message = message;
        this.status = status;
        this.key = key;
    }

    public Contact(String name, String date, String email, String message, boolean status) {
        this.name = name;
        this.date = date;
        this.email = email;
        this.message = message;
        this.status = status;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getKey() {
        return key;
    }

    public void setKey(int key) {
        this.key = key;
    }

    

    
}
