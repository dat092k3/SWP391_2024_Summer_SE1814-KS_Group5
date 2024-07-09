/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
/**
 * a class have information of manager
 *
 * @author LENOVO
 */
public class Manager {

    private int manager_id;
    private int account_id;
    private String fullName;
    private String gender;
    private String email;
    private String dateOfBirth;
    private String phoneNumber;
    private String address;
    private String hireDate;
    private float salary;
    private String image;
    private boolean status;

    public Manager() {
    }

    /**
     * constructor of manager
     *
     * @param manager_id of manager
     * @param account_id of manager
     * @param fullName of manager
     * @param gender of manager
     * @param email of manager
     * @param dateOfBirth of manager
     * @param phoneNumber of manager
     * @param address of manager
     * @param hireDate of manager
     * @param image of manager
     * @param salary of manager
     */
    public Manager(int manager_id, int account_id, String fullName, String gender, String email, String dateOfBirth, String phoneNumber, String address, String hireDate, float salary, String image) {
        this.manager_id = manager_id;
        this.account_id = account_id;
        this.fullName = fullName;
        this.gender = gender;
        this.email = email;
        this.dateOfBirth = dateOfBirth;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.hireDate = hireDate;
        this.salary = salary;
        this.image = image;
    }
    

    /**
     * constructor of manager
     *
     * @param manager_id of manager
     * @param account_id of manager
     * @param fullName of manager
     * @param gender of manager
     * @param email of manager
     * @param dateOfBirth of manager
     * @param phoneNumber of manager
     * @param address of manager
     * @param hireDate of manager
     * @param image of manager
     * @param salary of manager
     * @param status of manager
     */
    public Manager(int manager_id, int account_id, String fullName, String gender, String email, String dateOfBirth, String phoneNumber, String address, String hireDate, float salary, String image, boolean status) {
        this.manager_id = manager_id;
        this.account_id = account_id;
        this.fullName = fullName;
        this.gender = gender;
        this.email = email;
        this.dateOfBirth = dateOfBirth;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.hireDate = hireDate;
        this.salary = salary;
        this.image = image;
        this.status = status;
    }

    /**
     * constructor of manager
     *
     * @param account_id of manager
     * @param fullName of manager
     * @param gender of manager
     * @param email of manager
     * @param dateOfBirth of manager
     * @param phoneNumber of manager
     * @param address of manager
     * @param hireDate of manager
     * @param image of manager
     * @param salary of manager
     * @param status of manager
     */
    public Manager(int account_id, String fullName, String gender, String email, String dateOfBirth, String phoneNumber, String address, String hireDate, float salary, String image, boolean status) {
        this.account_id = account_id;
        this.fullName = fullName;
        this.gender = gender;
        this.email = email;
        this.dateOfBirth = dateOfBirth;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.hireDate = hireDate;
        this.salary = salary;
        this.image = image;
        this.status = status;
    }

    public int getManager_id() {
        return manager_id;
    }

    public void setManager_id(int manager_id) {
        this.manager_id = manager_id;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
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

    public String getHireDate() {
        return hireDate;
    }

    public void setHireDate(String hireDate) {
        this.hireDate = hireDate;
    }
    public float getSalary() {
        return salary;
    }

    public void setSalary(float salary) {
        this.salary = salary;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

}
