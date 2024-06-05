/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ultils;

/**
 * a class have information of phone number need follow
 * @author LENOVO
 */
public class PhoneNumberValidator {
    
    /**
     * check value phone number input
     * 
     * @param phoneNumber of account want to register
     * @return true false
     */
    public boolean isValidPhoneNumber(String phoneNumber){
        if(phoneNumber == null || phoneNumber.length() != 10){
            return false;
        }
        return phoneNumber.matches("^\\d{10}$");
    
    }
}
