/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group5.smartBeauty.core;

/**
 *
 * @author LENOVO
 */
public class UsernameValidator {
    
    public boolean isValidUsername(String username){
        if(username == null || username.length() < 5 || username.length()> 16 ){
            return false;
        } 
        return username.matches("^[A-Za-z0-9]+[A-Za-z0-9]{4,15}$");
        
    }
}
