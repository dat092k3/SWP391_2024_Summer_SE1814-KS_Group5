/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Interface.BlogInterface;
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
public class BlogDAO extends DBContext implements BlogInterface {

    /**
     * function to do search blog by name
     *
     * @param txtSearch is text of search
     * @return blog
     */
    @Override
    public List<Blog> searchBlogByName(String txtSearch) {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT * FROM Blog WHERE blog_name LIKE ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, "%" + txtSearch + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog(
                        rs.getInt("blog_id"),
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
    @Override
    public List<Blog> getAllBlog() {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT * FROM Blog"; // SQL query to select all blogs
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog(
                        rs.getInt("blog_id"),
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

    /**
     * function to do take blog information by id
     *
     * @param blogId is text of search
     * @return blog
     */
    @Override
    public Blog takeBlogById(int blogId) {
        Blog blog = new Blog();
        String sql = "SELECT * FROM Blog WHERE blog_id LIKE ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, "%" + blogId + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                blog = new Blog(
                        rs.getInt("blog_id"),
                        rs.getString("blog_name"),
                        rs.getString("image"),
                        rs.getString("description"),
                        rs.getString("content"),
                        rs.getInt("employee_id")
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return blog;
    }

    @Override
    public List<Blog> blogSameAuthor(int empId) {
        List<Blog> list = new ArrayList<>();
        String sql = "SELECT * FROM Blog WHERE employee_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, empId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog(
                        rs.getInt("blog_id"),
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

    @Override
    public void addBlog(Blog blog) {
        String sql = "INSERT INTO [dbo].[Blog] ([blog_name], [image], [description], [content], [employee_id]) VALUES (?, ?, ?, ?, ?);";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, blog.getBlog_name());
            st.setString(2, blog.getImage());
            st.setString(3, blog.getDescription());
            st.setString(4, blog.getContent());
            st.setInt(5, blog.getEmployee_id());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error add blogs: " + e.getMessage());
        }
    }

    @Override
    public void editBlog(Blog blog) {
        String sql = "UPDATE Blog SET [blog_name] = ?, [image] = ?, [description] = ?, [content] = ?, [employee_id] = ?  WHERE blog_id = ?";
        try{
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, blog.getBlog_name());
            st.setString(2, blog.getImage());
            st.setString(3, blog.getDescription());
            st.setString(4, blog.getContent());
            st.setInt(5, blog.getEmployee_id());
            st.setInt(6, blog.getBlog_id());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error add blogs: " + e.getMessage());
        }
    }

    @Override
    public void deleteBlog(int blogId) {
        String sql = "DELETE FROM Blog WHERE blog_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, blogId);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error delete blogs: " + e.getMessage());
        }
    }

    @Override

    public int posterId(int accountId) {
        int empId = 0;
        String sql = "SELECT * FROM Employee where account_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, accountId);
            ResultSet rs = st.executeQuery();
            rs.getInt("employee_id");
        } catch (SQLException e) {
            System.out.println(e);
        }
        return empId;
    }

}
