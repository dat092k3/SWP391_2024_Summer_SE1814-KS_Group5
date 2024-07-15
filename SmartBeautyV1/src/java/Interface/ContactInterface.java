/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interface;
import java.util.List;
import model.Contact;
/**
 *
 * @author td532
 */
public interface ContactInterface {
    
    public boolean AddContact (Contact contact);
    
    public boolean UpdateStatus(Contact contact);
    
    public List<Contact> ContactList(String search);
    
    public List<Contact> ContactNotRespon();
}
