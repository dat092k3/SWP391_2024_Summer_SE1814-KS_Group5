/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.department;

import DAO.DepartmentDAO;
import DAO.ManagerDAO;
import Interface.DepartmentInterface;
import Interface.ManagerInterface;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Department;
import model.Manager;

/**
 * Manage all functions related to the department
 * @author LENOVO
 */
public class ManageDepartmentServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        DepartmentInterface departmentDAO= new DepartmentDAO();
        ManagerInterface managerDAO= new ManagerDAO();
        
        String departmentId = request.getParameter("departmentId");
        String message = (String) request.getAttribute("message");
        Boolean showEditDialog = (Boolean) request.getAttribute("showEditDialog");
        if (departmentId != null && showEditDialog == null) {
            request.setAttribute("showEditDialog", true);
            Department department = departmentDAO.getDepartmentById(Integer.parseInt(departmentId));
            request.setAttribute("department", department);
        }
        request.setAttribute("message", message);
        List<Department> allDepartment = departmentDAO.getAllDepartment();
        request.setAttribute("listDepartment", allDepartment);
        List<Manager> allManager= managerDAO.getAllManagers();
        request.setAttribute("listManager", allManager);
        
        request.getRequestDispatcher("./managerdepartment.jsp").forward(request, response);
        
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
