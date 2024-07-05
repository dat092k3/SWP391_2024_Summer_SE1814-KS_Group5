/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Interface.EquipmentInterface;
import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Equipment;
import model.TypeofEquipment;

/**
 * access database of equipment
 *
 * @author LENOVO
 */
public class EquipmentDAO extends DBContext implements EquipmentInterface {

    /**
     * get all equipment
     *
     * @return list contain all equipment
     */
    @Override
    public List<Equipment> getAllEquipment() {
        List<Equipment> list = new ArrayList<>();
        String sql = "SELECT [equipment_id]\n"
                + "      ,[equipment_name]\n"
                + "      ,[type_id]\n"
                + "      ,[price]\n"
                + "      ,[image]\n"
                + "      ,[suplier_id]\n"
                + "      ,[quantity]\n"
                + "      ,[status]\n"
                + "      ,[description]\n"
                + "  FROM [dbo].[Equipment]\n"
                + "where status=1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int equipment_id = rs.getInt("equipment_id");
                String equipment_name = rs.getString("equipment_name");
                int type_id = rs.getInt("type_id");
                float price = rs.getFloat("price");
                String image = rs.getString("image");
                int supplier_id = rs.getInt("suplier_id");
                int quantity = rs.getInt("quantity");
                String description = rs.getString("description");
                boolean status = rs.getBoolean("status");
                list.add(new Equipment(equipment_id, equipment_name, type_id, image, price, supplier_id, quantity, status, description));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    /**
     * delete equipment
     *
     * @param equipment_id of equipment need to delete
     */
    @Override
    public void deleteEquipment(int equipment_id) {
        String sql = "UPDATE [dbo].[Equipment]\n"
                + "   SET [status] = 0\n"
                + " WHERE equipment_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, equipment_id);
            st.execute();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    /**
     * update equipment
     *
     * @param equipment is object need to update
     */
    @Override
    public void updateEquipment(Equipment equipment) {
        String sql = "UPDATE [dbo].[Equipment]\n"
                + "   SET [equipment_name] = ?\n"
                + "      ,[type_id] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[suplier_id] = ?\n"
                + "      ,[quantity] = ?\n"
                + "      ,[status] = 1\n"
                + "      ,[description] = ?\n"
                + " WHERE equipment_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, equipment.getEquipment_name());
            st.setInt(2, equipment.getType_id());
            st.setFloat(3, equipment.getPrice());
            st.setString(4, equipment.getImage());
            st.setInt(5, equipment.getSupplier_id());
            st.setInt(6, equipment.getQuantity());
            st.setString(7, equipment.getDescription());
            st.setInt(8, equipment.getEquipment_id());
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    /**
     * get equipment by id of equipment
     *
     * @param id of equipment need to get
     * @return equipment is geted
     */
    @Override
    public Equipment getEquipmentById(int id) {
        String sql = "select * from Equipment where status=1 and equipment_id=" + id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int equipment_id = rs.getInt("equipment_id");
                String equipment_name = rs.getString("equipment_name");
                int type_id = rs.getInt("type_id");
                float price = rs.getFloat("price");
                String image = rs.getString("image");
                int supplier_id = rs.getInt("suplier_id");
                int quantity = rs.getInt("quantity");
                String description = rs.getString("description");
                boolean status = rs.getBoolean("status");
                return new Equipment(equipment_id, equipment_name, type_id, image, price, supplier_id, quantity, status, description);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     * check equipment is exited
     *
     * @param name of equipment need to check
     * @return true false
     */
    @Override
    public boolean isEquipmentExist(String name) {
        String sql = "SELECT * from Equipment\n"
                + "where equipment_name=? and status=1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            ResultSet rs = st.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    /**
     * check equipment is existed when save
     *
     * @param name of equipment need to check
     * @param type_id of equipment need to check
     * @param image of equipment need to check
     * @param price of equipment need to check
     * @param supplier_id of equipment need to check
     * @param description of equipment need to check
     * @param quantity of equipment need to check
     * @return true if existed, false otherwise
     */
    @Override
    public boolean isEquipmentExistWhenSave(String name,int type_id, String image ,float price, int supplier_id, int quantity ,String description) {
        String sql = "SELECT * from Equipment\n"
                + "where equipment_name=? and type_id=? and image=? and price=? and suplier_id=? and quantity=? and description=? and status=1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setInt(2, type_id);
            st.setFloat(3, price);
            st.setInt(4, supplier_id);
            st.setInt(5, quantity);
            st.setString(6, description);
            ResultSet rs = st.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println(e);
        }           
        return false;
    }

    /**
     * add new equipment
     *
     * @param equipment is object equipment is added
     */
    @Override
    public void addNewEquipment(Equipment equipment) {
        String sql = "INSERT INTO [dbo].[Equipment]\n"
                + "           ([equipment_name]\n"
                + "           ,[type_id]\n"
                + "           ,[price]\n"
                + "           ,[image]\n"
                + "           ,[suplier_id]\n"
                + "           ,[quantity]\n"
                + "           ,[status]\n"
                + "           ,[description])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,1,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, equipment.getEquipment_name());
            st.setInt(2, equipment.getType_id());
            st.setFloat(3, equipment.getPrice());
            st.setString(4, equipment.getImage());
            st.setInt(5, equipment.getSupplier_id());
            st.setInt(6, equipment.getQuantity());
            st.setString(7, equipment.getDescription());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    /**
     * get id of equipment
     *
     * @return int
     */
    @Override
    public int getEquipmentId() {
        String sql = "select MAX(equipment_id) from Equipment";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) + 1;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return -1;
    }

    /**
     * get all type of equipment
     *
     * @return list contain type of equipment
     */
    @Override
    public List<TypeofEquipment> getAllTypeofEquipment() {
        List<TypeofEquipment> list = new ArrayList<>();
        String sql = "SELECT * from TypeOfEquipment";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int type_id = rs.getInt("type_id");
                String name = rs.getString("name");
                list.add(new TypeofEquipment(type_id, name));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    /**
     * find equipment by name
     *
     * @param nameSearch equipment need to search
     * @return list equipment are found
     */
    @Override
    public List<Equipment> findEquipmentByName(String nameSearch) {
        List<Equipment> list = new ArrayList<>();
        String sql = "select * from Equipment where status=1";
        if (nameSearch != null && !nameSearch.trim().equals("")) {
            sql += "and equipment_name like ?";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            if (nameSearch != null && !nameSearch.trim().equals("")) {
                st.setString(1, "%" + nameSearch + "%");
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    int equipment_id = rs.getInt("equipment_id");
                    String equipment_name = rs.getString("equipment_name");
                    int type_id = rs.getInt("type_id");
                    float price = rs.getFloat("price");
                    String image = rs.getString("image");
                    int supplier_id = rs.getInt("suplier_id");
                    int quantity = rs.getInt("quantity");
                    String description = rs.getString("description");
                    boolean status = rs.getBoolean("status");
                    list.add(new Equipment(equipment_id, equipment_name, type_id, image, price, supplier_id, quantity, status, description));
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;

    }

}
