/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group5.smartBeauty.core;

/**
 *
 * @author LENOVO
 */
public class PhoneNumberValidator {
    
    public boolean isValidPhoneNumber(String phoneNumber){
        if(phoneNumber == null || phoneNumber.length() != 10){
            return false;
        }
        return phoneNumber.matches("^\\d{10}$");
    
    }
}
