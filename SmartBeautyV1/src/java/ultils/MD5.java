/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ultils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * encrypts user passwords
 * @author LENOVO
 */
public class MD5 {
    
    /**
     * separates the value the user enters
     * @param password of user
     * @return 
     */
    public static String getName(String password) {
        String s = "";
        for (int i = password.length() - 1; i >= 0; i--) {
            if (password.charAt(i) == ' ') {
                break;
            }
            s = password.charAt(i) + s;
        }
        return s;
    }
    
    /**
     * encrypts passwords
     * 
     * @param input of value need encrypts
     * @return encrypted string
     */
    public static String getMd5(String input) {
        try {

            //tạo ra một đối tượng MessageDigest có khả năng tính toán giá trị băm MD5.
            MessageDigest md = MessageDigest.getInstance("MD5");

            //tính toán giá trị băm cho mảng byte của đầu vào
            byte[] messageDigest = md.digest(input.getBytes());

            //Mảng byte của giá trị băm MD5 được chuyển đổi thành một đối tượng BigInteger
            BigInteger no = new BigInteger(1, messageDigest);

            //chuyển đổi thành chuỗi cơ 16
            String hashtext = no.toString(16);
            // thêm các ký tự 0 vào phía trước cho đến khi đạt được độ dài 32 ký tự.
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            // trả về 1 chuỗi được mã hóa md5
            return hashtext;
        } 
        catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
}
