/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.controlmanagement;

import DAO.DirectorDAO;
import Interface.DirectorInterface;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Department;
import model.Employee;
import model.Manager;

/**
 *
 * @author LENOVO
 */
public class ControlServlet extends HttpServlet {

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
            out.println("<title>Servlet ControlServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControlServlet at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        DirectorInterface directorDAO = new DirectorDAO();
        List<Manager> listManager = directorDAO.getAllManager();
        int numberAdmin = directorDAO.countAdmin();
        int numberPT = directorDAO.countPT();
        int numberTakeCare = directorDAO.countTakeCare();
        int numberManager = directorDAO.countManager();
        List<Employee> listEmployeeActive = directorDAO.getEmployeeActive();
        List<Employee> listEmployeeNonActive = directorDAO.getEmployeeNonActive();
        List<Department> listDepartmentActive = directorDAO.getDepartmentActive();
        List<Department> listDepartmentNonActive = directorDAO.getDepartmentNonActive();
        request.setAttribute("numberAdmin", numberAdmin);
        request.setAttribute("numberPT", numberPT);
        request.setAttribute("numberTakeCare", numberTakeCare);
        request.setAttribute("numberManager", numberManager);
        request.setAttribute("listManager", listManager);
        request.setAttribute("listEmployeeActive", listEmployeeActive);
        request.setAttribute("listEmployeeNonActive", listEmployeeNonActive);
        request.setAttribute("listDepartmentActive", listDepartmentActive);
        request.setAttribute("listDepartmentNonActive", listDepartmentNonActive);
        request.getRequestDispatcher("./control.jsp").forward(request, response);
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
