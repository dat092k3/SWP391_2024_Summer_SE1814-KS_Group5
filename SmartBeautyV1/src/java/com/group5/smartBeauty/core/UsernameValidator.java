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

    public boolean isValidUsername(String username) {
        if (username == null || username.length() < 4 || username.length() > 15) {
            return false;
        }
        return username.matches("^[A-Za-z][A-Za-z0-9]*$");
    }
}
