/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package com.group5.smartBeauty.test.core;

import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;
import com.group5.smartBeauty.core.PhoneNumberValidator;

/**
 *
 * @author LENOVO
 */
public class PhonenumberValidatorTest {
    
    private PhoneNumberValidator phoneNumberTest;
    
    @Before
    public void setUp() {
        phoneNumberTest = new PhoneNumberValidator();
    }
    
    @Test
    public void testValidPhoneNumber(){
        assertTrue(phoneNumberTest.isValidPhoneNumber("0123456789"));
    }
    
    @Test
    public void testInvalidPhoneNumbers() {
        // Too short
        assertFalse(phoneNumberTest.isValidPhoneNumber("123456789"));
        // Too long
        assertFalse(phoneNumberTest.isValidPhoneNumber("01234567890"));
        // Non-digit character
        assertFalse(phoneNumberTest.isValidPhoneNumber("01234567a9"));
        // Invalid characters 
        assertFalse(phoneNumberTest.isValidPhoneNumber("01234567@9"));
        // Empty input
        assertFalse(phoneNumberTest.isValidPhoneNumber(""));
    }
}
