/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interface;

import java.util.List;
import model.Equipment;
import model.TypeofEquipment;

/**
 *
 * @author LENOVO
 */
public interface EquipmentInterface {

    public List<Equipment> getAllEquipment();

    public void deleteEquipment(int equipment_id);

    public void updateEquipment(Equipment equipment);

    public Equipment getEquipmentById(int id);

    public boolean isEquipmentExist(String name);

    public boolean isEquipmentExistWhenSave(String name, String image, String description);

    public void addNewEquipment(Equipment equipment);

    public int getEquipmentId();

    public List<TypeofEquipment> getAllTypeofEquipment();

    public List<Equipment> findEquipmentByName(String nameSearch);

}
