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
public class EditAccountServlet extends HttpServlet {

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
            out.println("<title>Servlet EditAccountServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditAccountServlet at " + request.getContextPath() + "</h1>");
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
            request.getRequestDispatcher("viewdetailaccountptandtakecare?account_id=" + account_id).forward(request, response);
        }
        if (!email.matches("^[^\\s@]+@[^\\s@]+\\.com$")) {
            request.setAttribute("error2", "Email must be valid and contain @ and .com.");
            request.getRequestDispatcher("viewdetailaccountptandtakecare?account_id=" + account_id).forward(request, response);
        }
        if (password.isEmpty() || !password.matches("^\\S+$")) {
            request.setAttribute("error4", "Password not contain empty or Space, must > 3 character");
            request.getRequestDispatcher("viewdetailaccountptandtakecare?account_id=" + account_id).forward(request, response);
        }
        // Validate Phone Number
        if (phonenumber.isEmpty() || !phonenumber.matches("^(03[2-9]|07[0|6-9]|08[1-5]|09[2|6]|086|088|089|05[6|8]|087|059)\\d{7}$")) {
            request.setAttribute("error3", "Phone number must be valid and start with a correct prefix.");
            request.getRequestDispatcher("viewdetailaccountptandtakecare?account_id=" + account_id).forward(request, response);
        } else {
            EmployeeInterface employeeDAO = new EmployeeDAO();
            Account account = accountDAO.checkAccountExists(username, phonenumber);
            Account checkexistemailaccount = accountDAO.checkEmailAccountExists(email);
            Account checkexistphoneaccount = accountDAO.checkPhoneAccountExists(phonenumber);
            Account checkexistusernameaccount = accountDAO.checkUsernameAccountExists(username);
            String phonedao = accountDAO.getPhoneOfAccount(String.valueOf(account_id));
            String emaildao = accountDAO.getEmailOfAccount(String.valueOf(account_id));
            String usernamedao = accountDAO.getUsernameOfAccount(String.valueOf(account_id));
            if (email.equals(emaildao) && phonenumber.equals(phonedao) && username.equals(usernamedao)) {
                accountDAO.EditAccountOfEmployee(account_id, username, password, email, phonenumber, role, status);
                employeeDAO.updateProfileEmployeePhonenumberAndEmail(email, phonenumber, account_id);
                request.setAttribute("successemployee", "Update Account " + username + " Success!");
                request.getRequestDispatcher("viewaccount").forward(request, response);
            } else if (checkexistemailaccount == null && phonenumber.equals(phonedao) && username.equals(usernamedao)) {
                accountDAO.EditAccountOfEmployee(account_id, username, password, email, phonenumber, role, status);
                employeeDAO.updateProfileEmployeePhonenumberAndEmail(email, phonenumber, account_id);
                request.setAttribute("successemployee", "Update Account " + username + " Success!");
                request.getRequestDispatcher("viewaccount").forward(request, response);
            } else if (checkexistemailaccount == null && checkexistphoneaccount == null && username.equals(usernamedao)) {
                accountDAO.EditAccountOfEmployee(account_id, username, password, email, phonenumber, role, status);
                employeeDAO.updateProfileEmployeePhonenumberAndEmail(email, phonenumber, account_id);
                request.setAttribute("successemployee", "Update Account " + username + " Success!");
                request.getRequestDispatcher("viewaccount").forward(request, response);
            } else if (checkexistemailaccount == null && phonenumber.equals(phonedao) && checkexistusernameaccount == null) {
                accountDAO.EditAccountOfEmployee(account_id, username, password, email, phonenumber, role, status);
                employeeDAO.updateProfileEmployeePhonenumberAndEmail(email, phonenumber, account_id);
                request.setAttribute("successemployee", "Update Account " + username + " Success!");
                request.getRequestDispatcher("viewaccount").forward(request, response);
            } else if (checkexistphoneaccount == null && username.equals(usernamedao) && email.equals(emaildao)) {
                accountDAO.EditAccountOfEmployee(account_id, username, password, email, phonenumber, role, status);
                employeeDAO.updateProfileEmployeePhonenumberAndEmail(email, phonenumber, account_id);
                request.setAttribute("successemployee", "Update Account " + username + " Success!");
                request.getRequestDispatcher("viewaccount").forward(request, response);
            } else if (checkexistphoneaccount == null && checkexistusernameaccount == null && email.equals(emaildao)) {
                accountDAO.EditAccountOfEmployee(account_id, username, password, email, phonenumber, role, status);
                employeeDAO.updateProfileEmployeePhonenumberAndEmail(email, phonenumber, account_id);
                request.setAttribute("successemployee", "Update Account " + username + " Success!");
                request.getRequestDispatcher("viewaccount").forward(request, response);
            } else if (checkexistusernameaccount == null && phonenumber.equals(phonedao) && email.equals(emaildao)) {
                accountDAO.EditAccountOfEmployee(account_id, username, password, email, phonenumber, role, status);
                employeeDAO.updateProfileEmployeePhonenumberAndEmail(email, phonenumber, account_id);
                request.setAttribute("successemployee", "Update Account " + username + " Success!");
                request.getRequestDispatcher("viewaccount").forward(request, response);
            } else if (account == null) {
                accountDAO.EditAccountOfEmployee(account_id, username, password, email, phonenumber, role, status);
                employeeDAO.updateProfileEmployeePhonenumberAndEmail(email, phonenumber, account_id);
                request.setAttribute("successemployee", "Update Account " + username + " Success!");
                request.getRequestDispatcher("viewaccount").forward(request, response);
            } else {
                // Báo lỗi nếu tài khoản đã tồn tại
                request.setAttribute("error4", "Username, email or phone number already exists.");
                request.getRequestDispatcher("viewdetailaccountptandtakecare?account_id=" + account_id).forward(request, response);
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
