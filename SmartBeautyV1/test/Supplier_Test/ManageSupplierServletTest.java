/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package Supplier_Test;

import controller.supplier.ManageSupplierServlet;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;

/**
 *
 * @author LENOVO
 */
public class ManageSupplierServletTest {
    
    private ManageSupplierServlet test;
    
    
    @BeforeAll
    public static void setUpClass() {
    }
    
    @AfterAll
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
        test= new ManageSupplierServlet();
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of processRequest method, of class ManageSupplierServlet.
     */
    @Test
    public void testProcessRequest() throws Exception {
    }

    /**
     * Test of doGet method, of class ManageSupplierServlet.
     */
    @Test
    public void testDoGet() throws Exception {
    }

    /**
     * Test of doPost method, of class ManageSupplierServlet.
     */
    @Test
    public void testDoPost() throws Exception {
    }

    /**
     * Test of is InValidName method, of class ManageSupplierServlet.
     */
    @Test
    public void testInValidNameHaveSpeacialCharacter() {
        assertFalse(test.isValidName("dat!@#")); // contain speacial character
    }
    
    /**
     * Test of is InValidName method, of class ManageSupplierServlet.
     */
    @Test
    public void testInValidNameNoUpperCase() {
        assertFalse(test.isValidName("nguyen vab truong")); // No Upper Case
    }
    
    /**
     * Test of is InValidName method, of class ManageSupplierServlet.
     */
    @Test
    public void testInValidNameisNull() {
        assertFalse(test.isValidName(null)); // null
    }
    
    @Test
    public void testInValidNameisEmpty() {
        assertFalse(test.isValidName("       ")); // null
    }
    
    /**
     * Test of isValidName method, of class ManageSupplierServlet.
     */
    @Test
    public void testValidName() {
        assertTrue(test.isValidName("Nguyễn Văn Trường"));
    }

    /**
     * Test of isValidEmail method, of class ManageSupplierServlet.
     */
    @Test
    public void testValidEmail() {
        assertTrue(test.isValidEmail("user@example.com"));
    }
    
    /**
     * Test of isValidEmail method, of class ManageSupplierServlet.
     */
    @Test
    public void testInValidEmailHaveCharacterSpecial() {
        assertFalse(test.isValidEmail("user@@@@example.com"));
    }
    
    /**
     * Test of isValidEmail method, of class ManageSupplierServlet.
     */
    @Test
    public void testInValidEmailNoCharacterSpecial() {
        assertFalse(test.isValidEmail("userexample.com"));
    }

    /**
     * Test of isValidPhoneNumber method, of class ManageSupplierServlet.
     */
    @Test
    public void testValidPhoneNumber() {
        assertTrue(test.isValidPhoneNumber("0123456789"));
    }
    
    
    /**
     * Test of isValidPhoneNumber method, of class ManageSupplierServlet.
     */
    @Test
    public void testInValidPhoneNumberHaveAbove10Digit() {
        assertTrue(test.isValidPhoneNumber("0123456789245"));
    }
    
    /**
     * Test of isValidPhoneNumber method, of class ManageSupplierServlet.
     */
    @Test
    public void testInValidPhoneNumberHaveCharacterLetter() {
        assertTrue(test.isValidPhoneNumber("01234567fdgf"));
    }
    
    
}
