/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interface;

import java.util.List;
import model.Comment;
import model.CustomerService;
import model.Service;
import model.CustomerService;

/**
 *
 * @author admin
 */
public interface ServiceInterface {

    public List<Service> searchServiceByName(String txtSearch);

    public List<Service> getAllService();

    public Service getServiceById(int service_id);
    
    public void addService(Service service);

    public void editService(Service service);

    public boolean deleteService(int service_Id);
    
    public void addCustomerService(CustomerService customerService);
    
    public int getCustomerId(int account_Id);
    
    public void addCustomerServiceNotPT(CustomerService customerService);
    
    public List<CustomerService> Services_Registered();
    
    public List<CustomerService> searchServices_Registered(String txtSearch);
    
}
