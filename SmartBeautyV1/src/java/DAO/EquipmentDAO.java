/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Equipment;
import model.TypeofEquipment;

/**
 *
 * @author LENOVO
 */
public class EquipmentDAO extends DBContext {

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
                boolean status=rs.getBoolean("status");
                list.add(new Equipment(equipment_id, equipment_name, type_id, image, price, supplier_id, quantity, description,status));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

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
            st.execute();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

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
                boolean status=rs.getBoolean("status");
                return new Equipment(equipment_id, equipment_name, type_id, image, price, supplier_id, quantity, description, status);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

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
            return false;
        }
    }

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
                + "     VALUES(?,?,?,?,?,?,1,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, equipment.getEquipment_name());
            st.setInt(2, equipment.getType_id());
            st.setFloat(3, equipment.getPrice());
            st.setString(4, equipment.getImage());
            st.setInt(5, equipment.getSupplier_id());
            st.setInt(6, equipment.getQuantity());
            st.setString(7, equipment.getDescription());
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

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

}
