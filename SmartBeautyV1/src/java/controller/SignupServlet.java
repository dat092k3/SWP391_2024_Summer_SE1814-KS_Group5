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
import model.Account;

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
        String err_email = "", err_phone = "", err_username = "";
        String email = request.getParameter("email").trim();
        String phonenumber = request.getParameter("phonenumber").trim();
        String Email_Regex = "^[A-Za-z0-9]+[A-Za-z0-9]*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+){1,2}$";
        String Phone_Regex = "^\\d{10}$";
        String Username_Regex = "^[A-Za-z0-9]+[A-Za-z0-9]{4,15}$";
        boolean err = false;
        if (username.isEmpty() || password.isEmpty() || re_password.isEmpty() || email.isEmpty() || phonenumber.isEmpty()) {
            request.setAttribute("messen", "input not empty!");
            request.getRequestDispatcher("signup-signin.jsp").forward(request, response);
            return;
        }
        if (!email.matches(Email_Regex)) {
            err_email = "Email is invalid";
            request.getSession().setAttribute("err_email", err_email);
            err = true;
        } else {
            request.getSession().removeAttribute("err_email");
        }

        if (!phonenumber.matches(Phone_Regex)) {
            err_phone = "Phone has 10 digits";
            request.getSession().setAttribute("err_phone", err_phone);
            err = true;
        } else {
            request.getSession().removeAttribute("err_phone");
        }

        if (!username.matches(Username_Regex)) {
            err_username = "Username need to begin a letter and no sepcial character";
            request.getSession().setAttribute("err_username", err_username);
            err = true;
        } else {
            request.getSession().removeAttribute("err_username");
        }

        if (!password.equals(re_password)) {
            request.setAttribute("messen", "Passwords do not match.");
            request.getRequestDispatcher("signup-signin.jsp").forward(request, response);
        } else {
            if (err) {
                response.sendRedirect("signup-signin.jsp");
            } else {
                 AccountInterface accountDAO = new AccountDAO();
                Account account = accountDAO.checkAccountExists(username, phonenumber);
                if (account == null) {
                    accountDAO.signup(username, password, email, phonenumber);
                    request.setAttribute("messen1", "Sign Up Success, please log in.");
                    request.getRequestDispatcher("signup-signin.jsp").forward(request, response);
                } else {
                    request.setAttribute("messen", "Username, email or phonenumber already exists.");
                    request.getRequestDispatcher("signup-signin.jsp").forward(request, response);
                }
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
