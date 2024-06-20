/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interface;

import java.util.List;
import model.Service;

/**
 *
 * @author admin
 */
public interface ServiceInterface {

    public List<Service> searchServiceByName(String txtSearch);

    public List<Service> getAllService();

    public Service getServiceById(int service_id);
}
