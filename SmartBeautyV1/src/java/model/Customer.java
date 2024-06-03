/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 * a class have information of customer
 * @author LENOVO
 */
public class Customer {
    private int customer_id;
    private int account_id;
    private String fullName;
    private String gender;
    private String email;
    private Date dateOfBirth;
    private String phoneNumber;
    private String address;
    private String image;
    private float height;
    private float weight;

    public Customer() {
    }
    
    /**
     * constructor of customer
     * 
     * @param customer_id of customer
     * @param account_id of customer
     * @param fullName of customer
     * @param gender of customer
     * @param email of customer
     * @param dateOfBirth of customer
     * @param phoneNumber of customer
     * @param address of customer
     * @param image of customer
     * @param height of customer
     * @param weight of customer
     */
    
    public Customer(int customer_id, int account_id, String fullName, String gender, String email, Date dateOfBirth, String phoneNumber, String address, String image, float height, float weight) {
        this.customer_id = customer_id;
        this.account_id = account_id;
        this.fullName = fullName;
        this.gender = gender;
        this.email = email;
        this.dateOfBirth = dateOfBirth;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.image = image;
        this.height = height;
        this.weight = weight;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
    
    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public float getHeight() {
        return height;
    }

    public void setHeight(float height) {
        this.height = height;
    }

    public float getWeight() {
        return weight;
    }

    public void setWeight(float weight) {
        this.weight = weight;
    }
    
    
}
