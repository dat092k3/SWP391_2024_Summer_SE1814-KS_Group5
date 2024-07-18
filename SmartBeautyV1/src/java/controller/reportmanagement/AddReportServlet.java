/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.reportmanagement;

import DAO.ManagerDAO;
import Interface.ManagerInterface;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.regex.Pattern;
import model.Manager;
import model.Report;

/**
 *
 * @author LENOVO
 */
public class AddReportServlet extends HttpServlet {

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
            out.println("<title>Servlet AddReportServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddReportServlet at " + request.getContextPath() + "</h1>");
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
        ManagerInterface managerDAO = new ManagerDAO();
        String report_name = request.getParameter("namereport").trim();
        String description = request.getParameter("description").trim();
        String date = request.getParameter("date");
        String status = request.getParameter("status");
        String accountId = request.getParameter("accountId");

        if (!isValidFormat(report_name) || !isValidFormat(description)) {
            request.setAttribute("messageerror", "Please check value input need to follow format");
            request.setAttribute("namereport", report_name);
            request.setAttribute("description", description);
            request.getRequestDispatcher("managereport").include(request, response);
            return;
        }
        Manager manager = managerDAO.getManagerByAccountId(Integer.parseInt(accountId));
        Report report = new Report(report_name, description, date, status, manager.getManager_id());
        if (managerDAO.checkReportExist(report_name)) {
            request.setAttribute("messageerror", "This report has been reported");
            request.setAttribute("namereport", report_name);
            request.setAttribute("description", description);
            request.getRequestDispatcher("managereport").include(request, response);
        } else {
            managerDAO.addReport(report);
            request.setAttribute("message", "Report Successful");
            request.setAttribute("showEditDialog", false);
        }
        request.getRequestDispatcher("managereport").include(request, response);
    }

    /**
     * check value of name need to follow standard
     *
     * @param name of name need to check
     * @return true if name is valid, false otherwise
     */
    private boolean isValidFormat(String name) {
        // Regex pattern to match valid strings where only the first letter is capitalized
        String regex = "^[A-Z][a-z0-9 ]*$";

        // Create a Pattern object
        Pattern pattern = Pattern.compile(regex);

        // Check if the input string matches the pattern
        return pattern.matcher(name).matches();
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
