/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package controller.supplier;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;

/**
 *
 * @author LENOVO
 */
public class AddSupplierServletTest {
    private AddSupplierServlet test;
    
    public AddSupplierServletTest() {
    }
    
    @BeforeAll
    public static void setUpClass() {
        System.out.println("Start test address");
    }
    
    @AfterAll
    public static void tearDownClass() {
        System.out.println("Finsish test address");
        
    }
    
    @Before
    public void setUp() {
        test= new AddSupplierServlet();
    }
    
    @After
    public void tearDown() {
        test=null;
    }


    /**
     * Test of processRequest method, of class AddSupplierServlet.
     */
    @Test
    public void testValidAddress() {
        assertTrue(test.isValidAddress("Hà Nội"));
    }
    
     @Test
    public void testInValidAddressNull() {
        assertFalse(test.isValidAddress(""));
    }
    
     @Test
    public void testInValidAddressNoFollowStandard() {
        assertFalse(test.isValidAddress("Bắc + Kinh"));
    }
    
     @Test
    public void testInValidAddressNoUppper() {
        assertFalse(test.isValidAddress("hồ chí minh"));
    }
    @Test
    public void testValidName() {
        assertTrue(test.isValidName("Nguyễn Văn A"));
    }
    
     @Test
    public void testInValidNameNull() {
        assertFalse(test.isValidName(""));
    }
    
     @Test
    public void testInValidNameNoFollowStandard() {
        assertFalse(test.isValidName("Nguyễn @Văn #A"));
    }
    
     @Test
    public void testInValidNameNoUppper() {
        assertFalse(test.isValidName("nguyen van a"));
    }
    
    @Test
    public void testValidEmails() {
        assertTrue(test.isValidEmail("user@example.com"));  
    }

    @Test
    public void testInvalidEmails() {
        // Invalid characters
        assertFalse(test.isValidEmail("user!@example.com"));
        // No "@" symbol
        assertFalse(test.isValidEmail("userexample.com"));
        // Invalid domain
        assertFalse(test.isValidEmail("user@.com"));
        assertFalse(test.isValidEmail("user@example"));
        // Empty input
        assertFalse(test.isValidEmail(""));
        // null
        assertFalse(test.isValidEmail(null));
    }
    
    @Test
    public void testValidPhoneNumber(){
        assertTrue(test.isValidPhoneNumber("0123456789"));
    }
    
    @Test
    public void testInvalidPhoneNumbers() {
        // Too short
        assertFalse(test.isValidPhoneNumber("123456789"));
        // Too long
        assertFalse(test.isValidPhoneNumber("01234567890"));
        // Non-digit character
        assertFalse(test.isValidPhoneNumber("01234567a9"));
        // Invalid characters 
        assertFalse(test.isValidPhoneNumber("01234567@9"));
        // Empty input
        assertFalse(test.isValidPhoneNumber(""));
    }


    

    
    

    
}
