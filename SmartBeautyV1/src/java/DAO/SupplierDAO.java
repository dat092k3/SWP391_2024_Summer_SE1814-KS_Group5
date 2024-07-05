/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Interface.SupplierInterface;
import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Supplier;

/**
 * access database of supplier
 *
 * @author LENOVO
 */
public class SupplierDAO extends DBContext implements SupplierInterface {

    /**
     * get all supplier
     *
     * @return list supplier
     */
    @Override
    public List<Supplier> getAllSupplier() {
        List<Supplier> listSupplier = new ArrayList<>();
        String sql = "SELECT [suplier_id]\n"
                + "      ,[suplier_name]\n"
                + "      ,[image]\n"
                + "      ,[address]\n"
                + "      ,[phonenumber]\n"
                + "      ,[email]\n"
                + "      ,[status]\n"
                + "  FROM [dbo].[Suplier]\n"
                + "  where status=1 ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int supplier_id = rs.getInt("suplier_id");
                String suplier_name = rs.getString("suplier_name");
                String image = rs.getString("image");
                String address = rs.getString("address");
                String phonenumber = rs.getString("phonenumber");
                String email = rs.getString("email");
                boolean status = rs.getBoolean("status");
                listSupplier.add(new Supplier(supplier_id, suplier_name, image, address, phonenumber, email, status));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listSupplier;
    }

    /**
     * delete supplier
     *
     * @param suplier_id of supplier need to delete
     */
    @Override
    public void deleteSupplier(int suplier_id) {
        String sql = "UPDATE [dbo].[Suplier]\n"
                + "   SET [status] = 0\n"
                + " WHERE suplier_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, suplier_id);
            st.execute();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    /**
     *
     * update information of supplier
     *
     * @param supplier is object supplier need to update
     */
    @Override
    public void updateSupplier(Supplier supplier) {
        String sql = "UPDATE [dbo].[Suplier]\n"
                + "   SET [suplier_name] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[phonenumber] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[status] = 1\n"
                + " WHERE suplier_id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, supplier.getSupplier_name());
            st.setString(2, supplier.getImage());
            st.setString(3, supplier.getAddress());
            st.setString(4, supplier.getPhoneNumber());
            st.setString(5, supplier.getEmail());
            st.setInt(6, supplier.getSupplier_id());
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    /**
     * get supplier want choose
     *
     * @param id of supplier is choose
     * @return supplier is choose
     */
    @Override
    public Supplier getSupplierById(int id) {
        String sql = "select * from Suplier where status=1 and suplier_id=" + id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int supplier_id = rs.getInt("suplier_id");
                String suplier_name = rs.getString("suplier_name");
                String image = rs.getString("image");
                String address = rs.getString("address");
                String phonenumber = rs.getString("phonenumber");
                String email = rs.getString("email");
                boolean status = rs.getBoolean("status");
                return new Supplier(supplier_id, suplier_name, image, address, phonenumber, email, status);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    /**
     * check supplier is existed
     *
     * @param name of supplier need to check
     * @param phonenumber of supplier need to check
     * @param email of supplier need to check
     * @return true if existed false otherwise
     */
    @Override
    public boolean isSupplierExist(String name, String phonenumber, String email) {
        String sql = "select * from Suplier\n"
                + "where suplier_name =? and phonenumber=? and email=? status=1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, phonenumber);
            st.setString(3, email);
            st.setString(4, phonenumber);
            st.setString(5, email);
            ResultSet rs = st.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    /**
     * check supplier is existed when save
     *
     * @param name of supplier need to check
     * @param address of supplier need to check
     * @param image of supplier need to check
     * @param phonenumber of supplier need to check
     * @param email of supplier need to check
     * @return true if existed false otherwise
     */
    @Override
    public boolean isSupplierExistWhenSave(String name, String address, String image, String phonenumber, String email) {
        String sql = "SELECT * FROM Suplier WHERE suplier_name = ? AND address = ? AND image = ? AND phonenumber = ? AND email = ? AND status = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, address);
            st.setString(3, image);
            st.setString(4, phonenumber);
            st.setString(5, email);
            ResultSet rs = st.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println("SQL Exception: " + e.getMessage());
        }
        return false;
    }
    /**
     * add supplier
     *
     * @param supplier need to add
     */
    @Override
    public void addNewSupplier(Supplier supplier) {
        String sql = "INSERT INTO [dbo].[Suplier]\n"
                + "           ([suplier_name]\n"
                + "           ,[image]\n"
                + "           ,[address]\n"
                + "           ,[phonenumber]\n"
                + "           ,[email]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,1)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, supplier.getSupplier_name());
            st.setString(2, supplier.getImage());
            st.setString(3, supplier.getAddress());
            st.setString(4, supplier.getPhoneNumber());
            st.setString(5, supplier.getEmail());
            st.execute();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    /**
     * get id of supplier
     *
     * @return int
     */
    @Override
    public int getSupplierId() {
        String sql = "select MAX(suplier_id) from Suplier";
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
     * find supplier by name
     *
     * @param nameSearch of supplier need to find
     * @return list supplier found
     */
    @Override
    public List<Supplier> findSupplierByName(String nameSearch) {
        List<Supplier> list = new ArrayList<>();
        String sql = "select * from Suplier where status=1";
        if (nameSearch != null && !nameSearch.trim().equals("")) {
            sql += "and suplier_name like ?";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + nameSearch + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int supplier_id = rs.getInt("suplier_id");
                String supplier_name = rs.getString("suplier_name");
                String image = rs.getString("image");
                String address = rs.getString("address");
                String phonenumber = rs.getString("phonenumber");
                String email = rs.getString("email");
                boolean status = rs.getBoolean("status");
                list.add(new Supplier(supplier_id, supplier_name, image, address, phonenumber, email, status));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
