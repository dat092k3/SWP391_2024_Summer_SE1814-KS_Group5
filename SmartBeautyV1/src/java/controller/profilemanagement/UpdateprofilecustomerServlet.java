/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.profilemanagement;

import DAO.AccountDAO;
import DAO.CustomerDAO;
import DAO.DirectorDAO;
import DAO.EmployeeDAO;
import DAO.ManagerDAO;
import Interface.AccountInterface;
import Interface.CustomerInterface;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.Period;

/**
 *
 * @author admin
 */
public class UpdateprofilecustomerServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateprofilecustomerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateprofilecustomerServlet at " + request.getContextPath() + "</h1>");
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
        String fullname = request.getParameter("fullname");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String dateofbirth = request.getParameter("dateofbirth");
        String phonenumber = request.getParameter("phonenumber");
        //
        String city = request.getParameter("city");
        String district = request.getParameter("district");
        String ward = request.getParameter("ward");
        //
        String address = city + " " + district + " " + ward;
        String image = request.getParameter("image");
        float height = Float.parseFloat(request.getParameter("height"));
        float weight = Float.parseFloat(request.getParameter("weight"));
        int account_id = Integer.parseInt(request.getParameter("account_id"));
        // Validate age
        LocalDate dob = LocalDate.parse(dateofbirth);
        LocalDate now = LocalDate.now();
        int age = Period.between(dob, now).getYears();

        if (age < 15) {
            request.setAttribute("error", "You must be at least 15 years old.");
            request.getRequestDispatcher("profile?account_id=" + account_id).forward(request, response);
            return;
        }
        CustomerInterface customerDAO = new CustomerDAO();
        customerDAO.updateProfileCustomer(fullname, gender, email, dateofbirth, phonenumber, address, image, height, weight, account_id);
        response.sendRedirect("profile?account_id=" + account_id);
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
        int account_id = Integer.parseInt(request.getParameter("account_id"));
        String fullname = request.getParameter("fullname").trim();
        String gender = request.getParameter("gender").trim();
        String email = request.getParameter("email").trim();
        String dateofbirth = request.getParameter("dateofbirth").trim();
        String phonenumber = request.getParameter("phonenumber").trim();
        String city = request.getParameter("city").trim();
        String district = request.getParameter("district").trim();
        String ward = request.getParameter("ward").trim();
        String address = city + " " + district + " " + ward;
        String image = request.getParameter("image").trim();
        String heightStr = request.getParameter("height").trim();
        String weightStr = request.getParameter("weight").trim();
        // Validate Full Name
        if (fullname.isEmpty() || !fullname.matches("^[A-ZÀ-Ỵ][a-zà-ỹ]+( [A-ZÀ-Ỵ][a-zà-ỹ]+)+")) {
            request.setAttribute("error1", "Full name must start with a capital letter and contain spaces between names.");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
            return;
        }
        // Validate Phone Number
        if (phonenumber.isEmpty() || !phonenumber.matches("^(03[2-9]|07[0|6-9]|08[1-5]|09[2|6]|086|088|089|05[6|8]|087|059)\\d{7}$")) {
            request.setAttribute("error3", "Phone number must be valid and start with a correct prefix.");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
            return;
        }
        // Validate Date of Birth and Age
        LocalDate dob = LocalDate.parse(dateofbirth);
        LocalDate now = LocalDate.now();
        int age = Period.between(dob, now).getYears();
        if (age < 15 || age > 150) {
            request.setAttribute("error4", "You must be at least 15-150  years old.");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
            return;
        }
        // Validate Image URL
        if (image.isEmpty()) {
            request.setAttribute("error5", "Image URL must not be empty.");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
            return;
        }
        // Validate Height
        if (heightStr.isEmpty() || !heightStr.matches("\\d+(\\.\\d+)?")) {
            request.setAttribute("error6", "Height must be a valid number.");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
            return;
        }
        float height = Float.parseFloat(heightStr);
        // Validate Weight
        if (weightStr.isEmpty() || !weightStr.matches("\\d+(\\.\\d+)?")) {
            request.setAttribute("error7", "Weight must be a valid number.");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
            return;
        }
        float weight = Float.parseFloat(weightStr);
        // Continue with database operations
        // Validate Email
        AccountInterface accountDAO = new AccountDAO();
        String phonenumberofaccount = accountDAO.getPhoneOfAccount(String.valueOf(account_id));
        String emailofaccount = accountDAO.getEmailOfAccount(String.valueOf(account_id));
        if (email.isEmpty() || !email.matches("^[^\\s@]+@[^\\s@]+\\.com$")) {
            request.setAttribute("error2", "Email must be valid and contain @ and .com.");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
            return;
        }
        if (!email.equals(emailofaccount)) {
            request.setAttribute("error8", "Emails do not match with account Signup.");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
            return;
        }
        if (!phonenumber.equals(phonenumberofaccount)) {
            request.setAttribute("error9", "Phonenumber do not match with account Signup.");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
            return;
        }
        CustomerInterface customerDAO = new CustomerDAO();
        customerDAO.InsertProfile(account_id, fullname, gender, email, dateofbirth, phonenumber, address, image, height, weight);
        request.setAttribute("success", "Insert Profile Susscess");
        response.sendRedirect("profile?account_id=" + account_id);

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
