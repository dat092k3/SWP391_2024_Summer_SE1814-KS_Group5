/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Interface.ServiceInterface;
import java.util.List;
import model.Service;
import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author admin
 */
public class ServiceDAO extends DBContext implements ServiceInterface {

    /**
     * Function get service by name in data
     *
     * @param txtSearch is text
     * @return
     */
    @Override
    public List<Service> searchServiceByName(String txtSearch) {
        List<Service> list = new ArrayList<>();
        String sql = "SELECT * FROM Service WHERE service_name LIKE ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, "%" + txtSearch + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Service service = new Service(
                        rs.getInt("service_id"),
                        rs.getString("description"),
                        rs.getFloat("price"),
                        rs.getInt("discount"),
                        rs.getString("service_name")
                );
                list.add(service);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    /**
     * Function get all service in data
     *
     * @return service
     */
    @Override
    public List<Service> getAllService() {
        List<Service> list = new ArrayList<>();
        String sql = "SELECT * FROM Service"; // SQL query to select all blogs
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Service service = new Service(
                        rs.getInt("service_id"),
                        rs.getString("description"),
                        rs.getFloat("price"),
                        rs.getInt("discount"),
                        rs.getString("service_name")
                );
                list.add(service);
            }
        } catch (SQLException e) {
            System.out.println("Error fetching all service: " + e.getMessage());
        }
        return list;
    }

    @Override
    public Service getServiceById(int service_id) {
        Service service = new Service();
        String sql = "SELECT * FROM Service WHERE service_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, service_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                service = new Service(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getFloat(3),
                        rs.getInt(4),
                        rs.getString(5)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return service;
    }
}
