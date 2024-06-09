/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 * a class have information of director
 * @author LENOVO
 */
public class Director {
    private int director_id;
    private int account_id;
    private String fullName;
    private String gender;
    private String email;
    private String dateOfBirth;
    private String phoneNumber;
    private String address;
    private Date hireDate;
    private String image;

    public Director() {
    }

    /**
     * constructor of director
     *
     * @param director_id of director
     * @param account_id of director
     * @param fullName of director
     * @param gender of director
     * @param email of director
     * @param dateOfBirth of director
     * @param phoneNumber of director
     * @param address of director
     * @param hireDate of director
     * @param image of director
     */
    public Director(int director_id, int account_id, String fullName, String gender, String email, String dateOfBirth, String phoneNumber, String address, Date hireDate, String image) {
        this.director_id = director_id;
        this.account_id = account_id;
        this.fullName = fullName;
        this.gender = gender;
        this.email = email;
        this.dateOfBirth = dateOfBirth;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.hireDate = hireDate;
        this.image = image;
    }

    public int getDirector_id() {
        return director_id;
    }

    public void setDirector_id(int director_id) {
        this.director_id = director_id;
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

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
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

    public Date getHireDate() {
        return hireDate;
    }

    public void setHireDate(Date hireDate) {
        this.hireDate = hireDate;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
    
}
