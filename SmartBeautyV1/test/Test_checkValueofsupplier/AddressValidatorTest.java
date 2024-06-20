/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package Test_checkValueofsupplier;

import org.junit.After;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import org.junit.Before;
import org.junit.Test;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import ultils.AddressValidator;

/**
 *
 * @author LENOVO
 */
public class AddressValidatorTest {
    
    private AddressValidator addressValidator;
    
    
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
        addressValidator= new AddressValidator();
    }
    
    @After
    public void tearDown() {
        addressValidator=null;
    }

    @Test
    public void testValidAddress() {
        assertTrue(addressValidator.isValidAddress("Hà Nội"));
    }
    
     @Test
    public void testInValidAddressNull() {
        assertFalse(addressValidator.isValidAddress(""));
    }
    
     @Test
    public void testInValidAddressNoFollowStandard() {
        assertFalse(addressValidator.isValidAddress("Bắc + Kinh"));
    }
    
     @Test
    public void testInValidAddressNoUppper() {
        assertFalse(addressValidator.isValidAddress("hồ chí minh"));
    }
    
    
}
