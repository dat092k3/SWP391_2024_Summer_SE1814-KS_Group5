/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.accountmanagement;

import DAO.AccountDAO;
import DAO.EmployeeDAO;
import Interface.AccountInterface;
import Interface.EmployeeInterface;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;

/**
 *
 * @author admin
 */
public class EditAccountAdminServlet extends HttpServlet {

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
            out.println("<title>Servlet EditAccountAdminServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditAccountAdminServlet at " + request.getContextPath() + "</h1>");
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
        AccountInterface accountDAO = new AccountDAO();
        int account_id = Integer.parseInt(request.getParameter("account_id").trim());
        String username = request.getParameter("username").trim();
        String email = request.getParameter("email").trim();
        String password = request.getParameter("password").trim();
        String phonenumber = request.getParameter("phonenumber").trim();
        String role = request.getParameter("role").trim();
        String status = request.getParameter("status").trim();
        if (!username.matches("^[A-Za-z0-9]+[A-Za-z0-9]{3,255}$")) {
            request.setAttribute("error1", "Username must begin with a letter and no special characters");
            request.getRequestDispatcher("viewdetailaccount?account_id=" + account_id).forward(request, response);
        }
        if (!email.matches("^[^\\s@]+@[^\\s@]+\\.com$")) {
            request.setAttribute("error2", "Email must be valid and contain @ and .com.");
            request.getRequestDispatcher("viewdetailaccount?account_id=" + account_id).forward(request, response);
        }
        // Validate Phone Number
        if (phonenumber.isEmpty() || !phonenumber.matches("^(03[2-9]|07[0|6-9]|08[1-5]|09[2|6]|086|088|089|05[6|8]|087|059)\\d{7}$")) {
            request.setAttribute("error3", "Phone number must be valid and start with a correct prefix.");
            request.getRequestDispatcher("viewdetailaccount?account_id=" + account_id).forward(request, response);
        } else {
            EmployeeInterface employeeDAO = new EmployeeDAO();
            Account account = accountDAO.checkAccountExists(username, phonenumber);
            if (account == null) {
                accountDAO.EditAccountOfEmployee(account_id, username, password, email, phonenumber, role, status);
                employeeDAO.updateProfileEmployeePhonenumberAndEmail(email, phonenumber, account_id);
                request.setAttribute("successadmin", "Update Account Success!");
                request.getRequestDispatcher("viewaccountadmin").forward(request, response);
            } else {
                // Báo lỗi nếu tài khoản đã tồn tại
                request.setAttribute("error4", "Username, email or phone number already exists.");
                request.getRequestDispatcher("viewdetailaccount?account_id=" + account_id).forward(request, response);
            }
        }
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
