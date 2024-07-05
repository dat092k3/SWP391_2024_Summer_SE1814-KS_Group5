/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.employeemanagement;

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
import java.time.LocalDate;
import java.time.Period;

/**
 *
 * @author admin
 */
public class AddProfileEmployeeEmptyServlet extends HttpServlet {

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
            out.println("<title>Servlet AddProfileEmployeeEmptyServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProfileEmployeeEmptyServlet at " + request.getContextPath() + "</h1>");
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
        int account_id = Integer.parseInt(request.getParameter("account_id"));
        String fullname = request.getParameter("fullname");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String dateofbirth = request.getParameter("dateofbirth");
        String phonenumber = request.getParameter("phonenumber");
        String city = request.getParameter("city");
        String district = request.getParameter("district");
        String ward = request.getParameter("ward");
        String address = city + " " + district + " " + ward;
        String image = request.getParameter("image");
        String hiredate = request.getParameter("hiredate");
        int department_id = Integer.parseInt(request.getParameter("department"));
        String experience = request.getParameter("experience");
        // Validate Full Name
        if (fullname.isEmpty() || !fullname.matches("^[A-ZÀ-Ỵ][a-zà-ỹ]+( [A-ZÀ-Ỵ][a-zà-ỹ]+)+")) {
            request.setAttribute("error1", "Full name must start with a capital letter and contain spaces between names.");
            request.getRequestDispatcher("viewprofileemployeeptandtakecare").forward(request, response);
            return;
        }
        // Validate Phone Number
        if (phonenumber.isEmpty() || !phonenumber.matches("^(03[2-9]|07[0|6-9]|08[1-5]|09[2|6]|086|088|089|05[6|8]|087|059)\\d{7}$")) {
            request.setAttribute("error3", "Phone number must be valid and start with a correct prefix.");
            request.getRequestDispatcher("viewprofileemployeeptandtakecare").forward(request, response);
            return;
        }
        // Validate Date of Birth and Age
        LocalDate dob = LocalDate.parse(dateofbirth);
        LocalDate now = LocalDate.now();
        int age = Period.between(dob, now).getYears();
        if (age < 18 || age > 100) {
            request.setAttribute("error10", "You must be at least 18-100 years old.");
            request.getRequestDispatcher("viewprofileemployeeptandtakecare").forward(request, response);
            return;
        }
        // Validate Hire Date
        LocalDate hireDate = LocalDate.parse(hiredate);
        if (!hireDate.isAfter(dob.plusYears(18)) || hireDate.isAfter(now)) {
            request.setAttribute("error10", "Hire date must be at least 18 years after date of birth and not in the future.");
            request.getRequestDispatcher("viewprofileemployeeptandtakecare").forward(request, response); 
            return;
        }
        // Validate Image URL
        if (image.isEmpty()) {
            request.setAttribute("error5", "Image URL must not be empty.");
            request.getRequestDispatcher("viewprofileemployeeptandtakecare").forward(request, response);
            return;
        }
        // Validate Email
        String phonenumberofaccount = accountDAO.getPhoneOfAccount(String.valueOf(account_id));
        String emailofaccount = accountDAO.getEmailOfAccount(String.valueOf(account_id));
        if (email.isEmpty() || !email.matches("^[^\\s@]+@[^\\s@]+\\.com$")) {
            request.setAttribute("error2", "Email must be valid and contain @ and .com.");
            request.getRequestDispatcher("viewprofileemployeeptandtakecare").forward(request, response);
            return;
        }
        if (!email.equals(emailofaccount)) {
            request.setAttribute("error8", "Emails do not match with account Signup.");
            request.getRequestDispatcher("viewprofileemployeeptandtakecare").forward(request, response);
            return;
        }
        if (!phonenumber.equals(phonenumberofaccount)) {
            request.setAttribute("error9", "Phonenumber do not match with account Signup.");
            request.getRequestDispatcher("viewprofileemployeeptandtakecare").forward(request, response);
            return;
        }
        System.out.println("accid" + account_id + "fullname" + fullname + "gender" + gender + "email" + email + "date" + dateofbirth + "phonenumber" + phonenumber + "address" + address + "image" + image + "hiredate" + hiredate + "department" + department_id + "expert" + experience);
        EmployeeInterface employeeDAO = new EmployeeDAO();
        employeeDAO.addProfileEmployee(fullname, gender, email, dateofbirth, phonenumber, address, hiredate, image, experience, department_id, account_id);
        request.setAttribute("success", "Insert Profile Of Employee Susscess");
        request.getRequestDispatcher("viewprofileemployeeptandtakecare").forward(request, response);
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
