/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ultils;

/**
 *
 * @author LENOVO
 */
public class AddressValidator {
    /**
     * check address need to follow standard
     *
     * @param address The address to check
     * @return true if the address is valid, false otherwise
     */
    public boolean isValidAddress(String address) {
        if (address == null || address.trim().isEmpty()) {
            return false;
        }

         String regex = "^[a-zA-Z\\p{L}0-9.,\\s]*$";
        if (!address.matches(regex)) {
            return false;
        }

        // Additional condition: Each word after whitespace must start with an uppercase letter
        String[] words = address.split("\\s+");
        for (String word : words) {
            if (!Character.isUpperCase(word.charAt(0))) {
                return false;
            }
        }

        return true;
    }
}
