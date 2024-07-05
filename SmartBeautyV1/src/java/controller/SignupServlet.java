/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.AccountDAO;
import Interface.AccountInterface;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;
import ultils.MD5;

/**
 * register to access system
 *
 * @author admin
 */
public class SignupServlet extends HttpServlet {

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
            out.println("<title>Servlet SignupServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SignupServlet at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        String re_password = request.getParameter("repassword").trim();
        String email = request.getParameter("email").trim();
        String phonenumber = request.getParameter("phonenumber").trim();
        if (username.isEmpty() || password.isEmpty() || re_password.isEmpty() || email.isEmpty() || phonenumber.isEmpty()) {
            request.setAttribute("messen", "Input must not be empty!");
            request.getRequestDispatcher("signup-signin.jsp").forward(request, response);
        } else if (!email.matches("^[A-Za-z0-9_]+@[A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$")) {
            request.setAttribute("err_email", "Email is invalid");
            request.getRequestDispatcher("signup-signin.jsp").forward(request, response);
        } else if (!phonenumber.matches("^(03[2-9]|07[0|6-9]|08[1-5]|09[2|6]|086|088|089|05[6|8]|087|059)\\d{7}$")) {
            request.setAttribute("err_phone", "Phone must have 10 digits, must be valid and start with a correct prefix.");
            request.getRequestDispatcher("signup-signin.jsp").forward(request, response);
        } else if (!username.matches("^[A-Za-z0-9]+[A-Za-z0-9]{3,255}$")) {
            request.setAttribute("err_username", "Username must begin with a letter and no special characters");
            request.getRequestDispatcher("signup-signin.jsp").forward(request, response);
        } else if (!password.equals(re_password)) {
            request.setAttribute("re_password", "Passwords do not match.");
            request.getRequestDispatcher("signup-signin.jsp").forward(request, response);
        } else {
            AccountInterface accountDAO = new AccountDAO();
            Account account = accountDAO.checkAccountExists(username, phonenumber);
            if (account == null) {
                accountDAO.signup(username, MD5.getMd5(password), email, phonenumber);
                request.setAttribute("messen1", "Sign Up Success, please log in.");
                request.getRequestDispatcher("signup-signin.jsp").forward(request, response);
            } else {
                request.setAttribute("messen", "Username, email or phonenumber already exists.");
                request.getRequestDispatcher("signup-signin.jsp").forward(request, response);
            }
        }
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
