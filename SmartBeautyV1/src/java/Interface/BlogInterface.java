/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interface;

import DAO.*;
import java.util.List;
import model.Blog;
import model.Comment;

/**
 *
 * @author LENOVO
 */
public interface BlogInterface {

    public List<Blog> searchBlogByName(String txtSearch);

    public List<Blog> getAllBlog();

    public Blog takeBlogById(int blogId);

    public List<Blog> blogSameAuthor(int empId);

    public void addBlog(Blog blog);

    public void editBlog(Blog blog);

    public boolean deleteBlog(int blogId);

    public int posterId(int accountId);

    public List<Comment> BlogComments(int blogId);

    public List<Comment> MyComments(int customerId);

    public void addComment(Comment comment);

    public void editComment(String content, int commentId);

    public boolean deleteComment(int commentId);
    
    public int commentAuthorId(int accountId);
}
