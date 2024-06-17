/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.blogmanagement;

import DAO.BlogDAO;
import Interface.BlogInterface;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import model.Blog;

/**
 *
 * @author td532
 */
public class DeleteBlog extends HttpServlet {

    BlogInterface blogDAO = new BlogDAO();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DeleteBlog</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteBlog at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy giá trị của tham số blog_id từ request
        String blogIdStr = request.getParameter("blog_id");

        // Kiểm tra xem blog_id có tồn tại và có định dạng hợp lệ không
        if (blogIdStr == null || blogIdStr.isEmpty()) {
            // Nếu không tồn tại hoặc không hợp lệ, có thể xử lý lỗi 400 Bad Request
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing blog_id parameter");
            return;
        }

        // Chuyển đổi blog_id từ String sang kiểu int
        int blogId;
        try {
            blogId = Integer.parseInt(blogIdStr);
        } catch (NumberFormatException e) {
            // Nếu không thể chuyển đổi, xử lý lỗi 400 Bad Request
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid blog_id parameter");
            return;
        }

        // Thực hiện xóa blog từ BlogDAO
        boolean deleted = blogDAO.deleteBlog(blogId);

        // Gửi kết quả về client
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(String.valueOf(deleted));
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
