/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interface;

import DAO.*;
import java.util.List;
import model.Blog;

/**
 *
 * @author LENOVO
 */
public interface BlogInterface {

    public List<Blog> searchBlogByName(String txtSearch);

    public List<Blog> getAllBlog();

    public Blog takeBlogById(int blogId);
}
