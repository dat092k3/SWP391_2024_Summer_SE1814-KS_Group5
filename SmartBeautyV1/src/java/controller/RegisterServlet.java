/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author LENOVO
 */
public class RegisterServlet extends HttpServlet {
   
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
            out.println("<title>Servlet RegisterServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath () + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        String err_email = "", err_phone = "", err_repassword = "";
        String err_username="";
        String username=request.getParameter("username");
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        String repassword=request.getParameter("password");
        String phone=request.getParameter("phone");
        String Email_Regex = "^[A-Za-z]+[A-Za-z0-9]*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)$";
        String Phone_Regex = "^\\d{10}$";
        String Username_Regex = "^[a-zA-Z][a-zA-Z0-9_]{4,15}$";
        boolean err = false;
        
        if (!email.matches(Email_Regex)) {
            err_email = "Email is invalid";
            request.getSession().setAttribute("err_email", err_email);
            err = true;
        } else {
            err_email = "";
            request.getSession().removeAttribute("err_email");
        }
        
        if (!username.matches(Username_Regex)) {
            err_username = "User is invalid";
            request.getSession().setAttribute("err_username", err_username);
            err = true;
        } else {
            err_email = "";
            request.getSession().removeAttribute("err_email");
        }

        if (!phone.matches(Phone_Regex)) {
            err_phone = "Phone has 10 digits";
            request.getSession().setAttribute("err_phone", err_phone);
            err = true;
        } else {
            err_phone = "";
            request.getSession().removeAttribute("err_phone");
        }

        if (!repassword.matches(password)) {
            err_repassword = "Not match Password";
            request.getSession().setAttribute("err_repassword", err_repassword);
            err = true;
        } else {
            err_phone = "";
            request.getSession().removeAttribute("err_repassword");
        }
        if(err){
            
        }
        
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
