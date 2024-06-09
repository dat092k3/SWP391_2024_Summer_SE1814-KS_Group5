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
import model.Supplier;

/**
 *
 * @author LENOVO
 */
public class SupplierDAO extends DBContext {

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
            st.execute();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

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

    public boolean isSupplierExist(String name, String address) {
        String sql = "select * from Suplier\n"
                + "where suplier_name =? and address=? and status=1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, address);
            ResultSet rs = st.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    public boolean isSupplierExistWhenSave(String name, String address, String phonenumber, String email) {
        String sql = "select * from Suplier\n"
                + "where suplier_name =? and address=? and phonenumber=? and email=? and status=1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, address);
            st.setString(3, phonenumber);
            st.setString(4, email);
            ResultSet rs = st.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    public void addNewSupplier(Supplier supplier) {
        String sql = "INSERT INTO [dbo].[Suplier]\n"
                + "           ([suplier_name]\n"
                + "           ,[image]\n"
                + "           ,[address]\n"
                + "           ,[phonenumber]\n"
                + "           ,[email]\n"
                + "           ,[status])\n"
                + "     VALUES(?, ?, ?, ?, ?, 1)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, supplier.getSupplier_name());
            st.setString(2, supplier.getImage());
            st.setString(3, supplier.getAddress());
            st.setString(4, supplier.getPhoneNumber());
            st.setString(5, supplier.getEmail());
            st.executeQuery();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

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
}
