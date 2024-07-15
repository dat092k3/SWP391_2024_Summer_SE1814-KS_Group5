/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Interface.ContactInterface;
import context.DBContext;
import model.Contact;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author td532
 */
public class ContactDAO extends DBContext implements ContactInterface {

    @Override
    public boolean AddContact(Contact contact) {
        String sql = "INSERT INTO Contact (name, email, date, status) VALUES (?, ?, ?, 0)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, contact.getName());
            stmt.setString(2, contact.getEmail());
            stmt.setDate(3, new java.sql.Date(contact.getDate().getTime()));
            return stmt.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.out.println("Error adding contact: " + ex.getMessage());
            return false;
        }
    }

    @Override
    public boolean UpdateStatus(Contact contact) {
        String sql = "UPDATE Contact SET status = 1 WHERE email = ? AND date = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, contact.getEmail());
            stmt.setDate(2, new java.sql.Date(contact.getDate().getTime()));
            return stmt.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.out.println("Error updating contact status: " + ex.getMessage());
            return false;
        }
    }

    @Override
    public List<Contact> ContactList(String search) {
        List<Contact> contacts = new ArrayList<>();
        String sql = "SELECT date, status, email, name FROM Contact WHERE name LIKE ? OR email LIKE ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, "%" + search + "%");
            stmt.setString(2, "%" + search + "%");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Contact contact = new Contact();
                contact.setDate(rs.getDate("date"));
                contact.setStatus(rs.getBoolean("status"));
                contact.setEmail(rs.getString("email"));
                contact.setName(rs.getString("name"));
                contacts.add(contact);
            }
        } catch (SQLException ex) {
            System.out.println("Error retrieving contact list: " + ex.getMessage());
        }
        return contacts;
    }

    @Override
    public List<Contact> ContactNotRespon() {
        List<Contact> contacts = new ArrayList<>();
        String sql = "SELECT date, status, email, name FROM Contact WHERE status = 0";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Contact contact = new Contact();
                contact.setDate(rs.getDate("date"));
                contact.setStatus(rs.getBoolean("status"));
                contact.setEmail(rs.getString("email"));
                contact.setName(rs.getString("name"));
                contacts.add(contact);
            }
        } catch (SQLException ex) {
            System.out.println("Error retrieving non-responsive contacts: " + ex.getMessage());
        }
        return contacts;
    }

}
