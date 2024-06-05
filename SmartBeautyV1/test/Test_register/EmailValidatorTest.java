/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package Test_register;

import ultils.EmailValidator;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author LENOVO
 */
public class EmailValidatorTest {
    
    private EmailValidator emailvalidatorTest;
    
    @Before
    public void setUp() {
        emailvalidatorTest= new EmailValidator();
    }
    
    @Test
    public void testValidEmails() {
        assertTrue(emailvalidatorTest.isValidEmail("user@example.com"));
    }

    @Test
    public void testInvalidEmails() {
        // First character non-letter
        assertFalse(emailvalidatorTest.isValidEmail("1user@example.com"));
        // Invalid characters
        assertFalse(emailvalidatorTest.isValidEmail("user!@example.com"));
        // No "@" symbol
        assertFalse(emailvalidatorTest.isValidEmail("userexample.com"));
        // Invalid domain
        assertFalse(emailvalidatorTest.isValidEmail("user@.com"));
        assertFalse(emailvalidatorTest.isValidEmail("user@example"));
        // Empty input
        assertFalse(emailvalidatorTest.isValidEmail(""));
        // null
        assertFalse(emailvalidatorTest.isValidEmail(null));
    }
    
}
