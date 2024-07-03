package controller.blogmanagement;

import DAO.BlogDAO;
import Interface.BlogInterface;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Blog;

public class EditBlog extends HttpServlet {

    private final BlogInterface blogDAO = new BlogDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int blogid = Integer.parseInt(request.getParameter("blog_id"));
        String blogname = request.getParameter("blog_name").trim();
        String blogimage = request.getParameter("image").trim();
        String blogdescription = request.getParameter("description").trim();
        String blogcontent = request.getParameter("content").trim();
        int account_id = Integer.parseInt(request.getParameter("account_id"));
        int employee_id = blogDAO.posterId(account_id);
        System.out.println(blogname + " " + blogimage + " " + blogdescription + " " + blogcontent + " " + employee_id);
        
        // Kiểm tra các thông tin cần thiết trước khi cập nhật
        if (blogname != null && blogimage != null && blogdescription != null && blogcontent != null) {
            Blog blog = new Blog(blogid, blogname, blogimage, blogdescription, blogcontent, employee_id);
            blogDAO.editBlog(blog);
            request.setAttribute("blog", blog);
            request.getRequestDispatcher("blog_details.jsp").forward(request, response);
        } else {
            // Xử lý lỗi nếu các thông tin bị thiếu
            response.getWriter().println("False");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
