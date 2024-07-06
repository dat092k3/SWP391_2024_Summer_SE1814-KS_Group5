/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interface;

import java.util.List;
import model.Supplier;

/**
 * Interface
 *
 * @author LENOVO
 */
public interface SupplierInterface {

    public List<Supplier> getAllSupplier();

    public void deleteSupplier(int suplier_id);

    public void updateSupplier(Supplier supplier);

    public void addNewSupplier(Supplier supplier);

    public Supplier getSupplierById(int id);

    public boolean isSupplierExist(String name, String phonenumber, String email);
    
    public boolean isSupplierExistWhenSave(int supplierId, String phonenumber, String email);

    public int getSupplierId();

    public List<Supplier> findSupplierByName(String nameSearch);
}
