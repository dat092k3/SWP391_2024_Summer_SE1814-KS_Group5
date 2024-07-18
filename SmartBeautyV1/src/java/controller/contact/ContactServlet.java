/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.contact;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Contact;
import Interface.ContactInterface;
import DAO.ContactDAO;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author td532
 */
public class ContactServlet extends HttpServlet {

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
            out.println("<title>Servlet Contact</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Contact at " + request.getContextPath() + "</h1>");
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
        String name = request.getParameter("name").trim();
        String email = request.getParameter("email").trim();
        String message = request.getParameter("message").trim();

        // Validate Name
        if (name.isEmpty() || !name.matches("^[A-ZÀ-Ỵ][a-zà-ỹ]+( [A-ZÀ-Ỵ][a-zà-ỹ]+)+")) {
            request.setAttribute("name", name);
            request.setAttribute("email", email);
            request.setAttribute("message", message);
            request.setAttribute("error1", "Full name must start with a capital letter and contain spaces between names.");
            request.getRequestDispatcher("contact.jsp").forward(request, response);
            return;
        }
        // Validate Email
        if (email.isEmpty() || !email.matches("^[^\\s@]+@[^\\s@]+\\.com$")) {
            request.setAttribute("name", name);
            request.setAttribute("email", email);
            request.setAttribute("message", message);
            request.setAttribute("error2", "Email must be valid and contain @ and .com.");
            request.getRequestDispatcher("contact.jsp").forward(request, response);
            return;
        }
        // Validate Message
        if (message.isEmpty()) {
            request.setAttribute("name", name);
            request.setAttribute("email", email);
            request.setAttribute("message", message);
            request.setAttribute("error3", "Message must be not null");
            request.getRequestDispatcher("contact.jsp").forward(request, response);
            return;
        }

        ContactInterface contactdao = new ContactDAO();
        LocalDateTime localDate = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSSSS");
        String formattedDateTime = localDate.format(formatter);
        Contact contact = new Contact(name, formattedDateTime, email, message, true);
        boolean addStatus = contactdao.AddContact(contact);
        request.setAttribute("addStatus", addStatus);
        request.setAttribute("name", name);
        request.setAttribute("email", email);
        request.setAttribute("message", message);
        if (addStatus) {
            request.setAttribute("successMessage", "Contact added successfully!");
        } else {
            request.setAttribute("errorMessage", "Failed to add contact.");
        }
        request.getRequestDispatcher("contact.jsp").forward(request, response);
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
