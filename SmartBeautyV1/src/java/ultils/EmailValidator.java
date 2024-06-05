/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ultils;

/**
 * a class have information of email need follow
 * @author LENOVO
 */
public class EmailValidator {
    
    /**
     * check value email input 
     * 
     * @param email of account want to register
     * @return true false
     */
    public boolean isValidEmail(String email) {
        if (email == null || !email.contains("@") || email.startsWith("@") || email.endsWith("@")) {
            return false;
        }
        String[] parts = email.split("@");
        if (parts.length != 2) {
            return false;
        }
        String domain = parts[1];
        return domain.matches("^[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$");
    }

}
