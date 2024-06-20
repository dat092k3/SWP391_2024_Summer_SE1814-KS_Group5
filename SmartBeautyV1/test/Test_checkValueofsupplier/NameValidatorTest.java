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
import ultils.NameValidator;

/**
 *
 * @author LENOVO
 */
public class NameValidatorTest {
    
    private NameValidator nameValidator;
    
    @BeforeAll
    public static void setUpClass() {
        System.out.println("Start test name");
    }
    
    @AfterAll
    public static void tearDownClass() {
        System.out.println("Finsish test name");
    }
    
    @Before
    public void setUp() {
        nameValidator= new NameValidator();
    }
    
    @After
    public void tearDown() {
        nameValidator=null;
    }

   @Test
    public void testValidName() {
        assertTrue(nameValidator.isValidName("Nguyễn Văn A"));
    }
    
     @Test
    public void testInValidNameNull() {
        assertFalse(nameValidator.isValidName(""));
    }
    
     @Test
    public void testInValidNameNoFollowStandard() {
        assertFalse(nameValidator.isValidName("Nguyễn @Văn #A"));
    }
    
     @Test
    public void testInValidNameNoUppper() {
        assertFalse(nameValidator.isValidName("nguyen van a"));
    }
    
}
