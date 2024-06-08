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
import model.Blog;

/**
 *
 * @author admin
 */
public class BlogDAO extends DBContext {

    /**
     * function to do search blog by name
     *
     * @param txtSearch is text of search
     * @return blog
     */
    public List<Blog> searchBlogByName(String txtSearch) {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT * FROM Blog WHERE blog_name LIKE ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, "%" + txtSearch + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog(
                        rs.getString("blog_name"),
                        rs.getString("image"),
                        rs.getString("description"),
                        rs.getString("content"),
                        rs.getInt("employee_id")
                );
                list.add(blog);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    /**
     *
     * @return
     */
    public List<Blog> getAllBlog() {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT * FROM Blog"; // SQL query to select all blogs
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog(
                        rs.getString("blog_name"),
                        rs.getString("image"),
                        rs.getString("description"),
                        rs.getString("content"),
                        rs.getInt("employee_id")
                );
                list.add(blog);
            }
        } catch (SQLException e) {
            System.out.println("Error fetching all blogs: " + e.getMessage());
        }
        return list;
    }

}
