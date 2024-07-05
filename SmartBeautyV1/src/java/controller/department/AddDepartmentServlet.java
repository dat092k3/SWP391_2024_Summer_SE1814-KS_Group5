/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.department;

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
 * Handles the add department function
 * @author LENOVO
 */
public class AddDepartmentServlet extends HttpServlet {
   
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
            out.println("<title>Servlet AddDepartmentServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddDepartmentServlet at " + request.getContextPath () + "</h1>");
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
        
        String namedepartment = request.getParameter("namedepartment").trim();
        String manager=request.getParameter("manager").trim();
        
        DepartmentInterface departmentDAO= new DepartmentDAO();
        if(manager==null || manager.trim().isEmpty()){
            request.setAttribute("message", "Please select manager for dapartment");
            request.setAttribute("namedepartment", namedepartment);
            request.setAttribute("selectedManager", manager);
            request.getRequestDispatcher("managedepartment").include(request, response);
            return;
        }
        
        if(namedepartment==null || !isValidName(namedepartment)  ||namedepartment.trim().isEmpty()){
            request.setAttribute("message", "Name department is invalid.");
            request.setAttribute("namedepartment", namedepartment);
            request.setAttribute("selectedManager", manager);
            request.getRequestDispatcher("managedepartment").include(request, response);
            return;
        }
        
        if(departmentDAO.isDepartmentExist(namedepartment)){
            request.setAttribute("message", "This department is existed");
            request.setAttribute("namedepartment", namedepartment);
            request.setAttribute("selectedManager", manager);
            request.getRequestDispatcher("managedepartment").include(request, response);  
            return;
        }   
        
        if(departmentDAO.isManagerManingAnotherDepartment(namedepartment, Integer.parseInt(manager))){
            request.setAttribute("message", "This manager is maning another department");
            request.setAttribute("namedepartment", namedepartment);
            request.setAttribute("selectedManager", manager);
            request.getRequestDispatcher("managedepartment").include(request, response);  
            return;
        }else{
            Department newDepartment= new Department(namedepartment, Integer.parseInt(manager), true);
            departmentDAO.addNewDepartment(newDepartment);
            request.setAttribute("message", "Create successful");
        }
        request.getRequestDispatcher("managedepartment").include(request, response);

    }
    
    /**
     * check value of name need to follow standard
     *
     * @param name of value need to check
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
