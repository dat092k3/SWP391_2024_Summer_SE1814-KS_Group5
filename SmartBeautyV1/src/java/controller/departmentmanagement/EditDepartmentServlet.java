/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.departmentmanagement;

import DAO.DepartmentDAO;
import Interface.DepartmentInterface;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Department;

/**
 * edit department
 * @author LENOVO
 */
public class EditDepartmentServlet extends HttpServlet {
   
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditDepartmentServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditDepartmentServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        DepartmentInterface departmentDAO= new DepartmentDAO();
        String departmentId= request.getParameter("departmentId");
        String namedepartment=request.getParameter("namedepartment");
        String manager = request.getParameter("manager");
        if(!isValidName(namedepartment)){
            request.setAttribute("messageerror", "Please select manager for dapartment");
            request.setAttribute("namedepartment", namedepartment);
            request.setAttribute("selectedManager", manager);
            request.getRequestDispatcher("managedepartment").include(request, response);
            return;       
        }
        
        if(manager==null || manager.trim().isEmpty()){
            request.setAttribute("messageerror", "Please select manager for dapartment");
            request.setAttribute("namedepartment", namedepartment);
            request.setAttribute("selectedManager", manager);
            request.getRequestDispatcher("managedepartment").include(request, response);
            return;
        }
        
        if(departmentDAO.isDepartmentExistEdit(namedepartment, Integer.parseInt(departmentId))){
            request.setAttribute("messageerror", "This department is existed");
            request.setAttribute("namedepartment", namedepartment);
            request.setAttribute("selectedManager", manager);
            request.getRequestDispatcher("managedepartment").include(request, response);  
            return;
        }   
        
        if(departmentDAO.isManagerManingAnotherDepartment(namedepartment, Integer.parseInt(manager), Integer.parseInt(departmentId))){
            request.setAttribute("messageerror", "This manager is maning another department");
            request.setAttribute("namedepartment", namedepartment);
            request.setAttribute("selectedManager", manager);
            request.getRequestDispatcher("managedepartment").include(request, response);
            return;
        }else{
            Department editDepartment= new Department(Integer.parseInt(departmentId), namedepartment, Integer.parseInt(manager), true);
            departmentDAO.updateDepartment(editDepartment);
            request.setAttribute("message", "Update Successful");
            request.setAttribute("showEditDialog", false);
        }
        request.getRequestDispatcher("managedepartment").forward(request, response);       
    }
    
    /**
     * check value of name input
     * 
     * @param name of equipment to check
     * @return true if name is valid, false otherwise
     */
    private boolean isValidName(String name) {
        if (name == null || name.trim().isEmpty()) {
            return false;
        }
        
        String[] nameParts = name.split("\\s+");
        for (String part : nameParts) {
            if (!Character.isUpperCase(part.charAt(0))) {
                return false;
            }
        }
        
        return true;
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
