/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

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
    //Search Blog by name
    public List<Blog> searchBlogByName(String txtSearch) {
        List<Blog> list = new ArrayList<>();
        String sql = "select * from Blog where blog_name like '?'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + txtSearch + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Blog blog = new Blog(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4));
                list.add(blog);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    //
}
