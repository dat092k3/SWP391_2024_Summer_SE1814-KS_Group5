/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 * a class have information of employee
 * @author LENOVO
 */
public class Employee {
    private int employee_id;
    private int account_id;
    private String fullName;
    private String gender;
    private String email;
    private String dateOfBirth;
    private String phoneNumber;
    private String address;
    private Date hireDate;
    private float salary;
    private String image;
    private String experience;
    private int department_id;

    public Employee() {
    }

    /**
     * constructor of employee
     *
     * @param employee_id of employee
     * @param account_id of employee
     * @param fullName of employee
     * @param gender of employee
     * @param email of employee
     * @param dateOfBirth of employee
     * @param phoneNumber of employee
     * @param address of employee
     * @param hireDate of employee
     * @param salary of employee
     * @param image of employee
     * @param department_id of employee
     * @param experience of employee
     */
    public Employee(int employee_id, int account_id, String fullName, String gender, String email, String dateOfBirth, String phoneNumber, String address, Date hireDate, float salary, String image, String experience, int department_id) {
        this.employee_id = employee_id;
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
        this.experience = experience;
        this.department_id = department_id;
    }

    public int getEmployee_id() {
        return employee_id;
    }

    public void setEmployee_id(int employee_id) {
        this.employee_id = employee_id;
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

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public int getDepartment_id() {
        return department_id;
    }

    public void setDepartment_id(int department_id) {
        this.department_id = department_id;
    }

  
  
    
}
