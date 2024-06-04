/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package com.group5.smartBeauty.test.core;

import ultils.*;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 * test username input
 * @author LENOVO
 */
public class UsernameValidatorTest {
    
    private UsernameValidator usernameTest;
    
    @Before
    public void setUp() {
         usernameTest= new UsernameValidator();
    }
    /**
     * test username satisfy the condition
     */
    @Test
    public void testValidUsername(){
        assertTrue(usernameTest.isValidUsername("user123"));
        assertTrue(usernameTest.isValidUsername("usernameislong"));
    }
    
    /**
     * test username condition are not met
     */
    @Test
    public void testInvalidUsernames() {
        // Invalid length
        assertFalse(usernameTest.isValidUsername("usr"));
        assertTrue(usernameTest.isValidUsername("thisusernameiswaytoolong"));
        // Invalid characters
        assertFalse(usernameTest.isValidUsername("user!@#"));
        // Starts with non-letter
        assertFalse(usernameTest.isValidUsername("1username"));
        // empty input
        assertFalse(usernameTest.isValidUsername(""));
        // null
        assertFalse(usernameTest.isValidUsername(null));
    }
}
