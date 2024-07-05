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
import model.CustomerService;

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
                        rs.getString("service_name"),
                        rs.getString("image"),
                        rs.getBoolean("status"),
                        rs.getFloat("pt_price")
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
                        rs.getString("service_name"),
                        rs.getString("image"),
                        rs.getBoolean("status"),
                        rs.getFloat("pt_price")
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
                        rs.getInt("service_id"),
                        rs.getString("description"),
                        rs.getFloat("price"),
                        rs.getInt("discount"),
                        rs.getString("service_name"),
                        rs.getString("image"),
                        rs.getBoolean("status"),
                        rs.getFloat("pt_price")
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return service;
    }

    @Override
    public void addService(Service service) {
        String sql = "INSERT INTO [dbo].[Service] (description, price, discount, service_name, image, pt_price) VALUES (?, ?, ?, ?, ?, ?);";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, service.getDescription());
            st.setFloat(2, service.getPrice());
            st.setInt(3, service.getDiscount());
            st.setString(4, service.getService_name());
            st.setString(5, service.getImage());
            st.setFloat(6, service.getPt_price());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error adding service: " + e.getMessage());
        }
    }

    @Override
    public void editService(Service service) {
        String sql = "UPDATE [dbo].[Service] SET description = ?, price = ?, discount = ?, service_name = ?, image = ?, pt_price = ? WHERE service_id = ?;";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, service.getDescription());
            st.setFloat(2, service.getPrice());
            st.setInt(3, service.getDiscount());
            st.setString(4, service.getService_name());
            st.setString(5, service.getImage());
            st.setFloat(6, service.getPt_price());
            st.setInt(7, service.getService_id());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error editing service: " + e.getMessage());
        }
    }

    @Override
    public boolean deleteService(int serviceId) {
        String sql = "UPDATE [dbo].[Service] SET status = 0 WHERE service_id = ?;";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, serviceId);
            int affectedRows = st.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            System.err.println("Error deleting service: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public void addCustomerService(CustomerService customerService) {
        String sql = "INSERT INTO CustomerService (service_id, customer_id, date, end_date, employee_id, total_price) VALUES (?, ?, ?, ?, ?, ?);";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, customerService.getService_id()); // Assuming Service class has getService_id method
            st.setInt(2, customerService.getCustomer_id());
            st.setTimestamp(3, customerService.getDate()); // Convert java.util.Date to java.sql.Date
            st.setTimestamp(4, customerService.getEnd_date()); // Convert java.util.Date to java.sql.Date
            st.setInt(5, customerService.getEmployee_id());
            st.setFloat(6, customerService.getTotal_price());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error adding customer service: " + e.getMessage());
        }
    }
    
    @Override
    public void addCustomerServiceNotPT(CustomerService customerService) {
        String sql = "INSERT INTO CustomerService (service_id, customer_id, date, end_date, total_price) VALUES (?, ?, ?, ?, ?);";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, customerService.getService_id()); // Assuming Service class has getService_id method
            st.setInt(2, customerService.getCustomer_id());
            st.setTimestamp(3, customerService.getDate()); // Convert java.util.Date to java.sql.Date
            st.setTimestamp(4, customerService.getEnd_date()); // Convert java.util.Date to java.sql.Date
            st.setFloat(5, customerService.getTotal_price());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error adding customer service: " + e.getMessage());
        }
    }

    @Override
    public int getCustomerId(int account_Id) {
        String sql = "SELECT TOP(1) customer_id FROM Customer WHERE account_id = ?";
        int customerId = -1;
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, account_Id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                customerId = rs.getInt("customer_id");
            }
        } catch (SQLException e) {
            System.out.println("Error fetching customer ID: " + e.getMessage());
        }
        return customerId;
    }
    
    

}
