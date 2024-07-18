/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.managermanagement;

import DAO.AccountDAO;
import DAO.DirectorDAO;
import DAO.ManagerDAO;
import Interface.AccountInterface;
import Interface.DirectorInterface;
import Interface.ManagerInterface;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Path;
import java.time.LocalDate;
import java.time.Period;
import java.util.regex.Pattern;
import model.Account;
import model.Manager;

/**
 *
 * @author LENOVO
 */
@MultipartConfig
public class EditManagerServlet extends HttpServlet {

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
            out.println("<title>Servlet EditManagerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditManagerServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String managerId = request.getParameter("managerId");
        String salary = request.getParameter("salary").trim();
        String newsalaryStr = request.getParameter("newsalary").trim();
        try {
            // Check if salaryStr is a valid float number
            float newsalary = Float.parseFloat(newsalaryStr);
            DirectorInterface directorDAO = new DirectorDAO();
            directorDAO.updateSalary(Integer.parseInt(managerId), newsalary);
            request.setAttribute("message", "Update successful");
            request.setAttribute("showEditDialog", false);
        } catch (NumberFormatException e) {
            // Handle the case where salary is not a valid float number
            request.setAttribute("newsalary", salary);
            request.setAttribute("salary", salary);
            request.setAttribute("messageerror", "Invalid salary value. Please enter a valid number.");
        }
        request.getRequestDispatcher("managemanager").forward(request, response);

    }

    /**
     * Returns a Edit Supplier Servlet of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Edit Manager Servlet";
    }

}
