/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.manager;

import DAO.AccountDAO;
import DAO.ManagerDAO;
import Interface.AccountInterface;
import Interface.ManagerInterface;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Path;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Pattern;
import model.Account;
import model.Manager;

/**
 *
 * @author LENOVO
 */
@MultipartConfig
public class AddManagerServlet extends HttpServlet {

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
            out.println("<title>Servlet AddManagerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddManagerServlet at " + request.getContextPath() + "</h1>");
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
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phonenumber = request.getParameter("phonenumber");
        String namemanager = request.getParameter("namemanager");
        String image = request.getParameter("img");
        String gender = request.getParameter("gender");
        String dateofbirth = request.getParameter("dateofbirth");
        String address = request.getParameter("address");
        String hiredate = request.getParameter("hiredate");
        String salary = request.getParameter("salary");

        ManagerInterface managerDAO = new ManagerDAO();
        AccountInterface accountDAO = new AccountDAO();
        // Define the date format
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        Date hireDate;
        try {
            hireDate = dateFormat.parse(hiredate);
        } catch (ParseException e) {
            // Handle the error properly, possibly send an error response to the client
            return;
        }
        
        if (!isValidEmail(email)) {
            request.setAttribute("message", "Please check the email is invalid.");
            request.setAttribute("name", username);
            request.setAttribute("password", password);
            request.setAttribute("email", email);
            request.setAttribute("phonenumber", phonenumber);
            request.setAttribute("namemanager", namemanager);
            request.setAttribute("image", image);
            request.setAttribute("selectedGender", gender);
            request.setAttribute("address", address);
            request.setAttribute("salary", salary);
            request.getRequestDispatcher("managemanager").include(request, response);
            return;
        }
        if (!isValidPhoneNumber(phonenumber)) {
            request.setAttribute("message", "Please check the phonenumber is invalid.");
            request.setAttribute("name", username);
            request.setAttribute("password", password);
            request.setAttribute("email", email);
            request.setAttribute("phonenumber", phonenumber);
            request.setAttribute("namemanager", namemanager);
            request.setAttribute("image", image);
            request.setAttribute("selectedGender", gender);
            request.setAttribute("address", address);
            request.setAttribute("salary", salary);
            request.getRequestDispatcher("managemanager").include(request, response);
            return;
        }
        
        if (gender == null || gender.trim().isEmpty()) {
            request.setAttribute("message", "Please select a gender.");
            request.setAttribute("name", username);
            request.setAttribute("password", password);
            request.setAttribute("email", email);
            request.setAttribute("phonenumber", phonenumber);
            request.setAttribute("namemanager", namemanager);
            request.setAttribute("image", image);
            request.setAttribute("selectedGender", gender);
            request.setAttribute("address", address);
            request.setAttribute("salary", salary);
            request.getRequestDispatcher("managemanager").include(request, response);
            return;
        }

        if (managerDAO.isManagerAccountExist(username, email, phonenumber)) {
            request.setAttribute("message", "This account is existed");
            request.setAttribute("name", username);
            request.setAttribute("password", password);
            request.setAttribute("email", email);
            request.setAttribute("phonenumber", phonenumber);
            request.setAttribute("namemanager", namemanager);
            request.setAttribute("image", image);
            request.setAttribute("selectedGender", gender);
            request.setAttribute("address", address);
            request.setAttribute("salary", salary);
            request.getRequestDispatcher("managemanager").include(request, response);
            return;
        } else {
            Account newAccount = new Account(username, email, phonenumber, "Manager", true);
            managerDAO.addNewAccountManager(newAccount);
        }

        Manager newManager = new Manager(accountDAO.getAccountIdToAddManager(), username, gender, email, dateofbirth, phonenumber, address, hireDate, Float.parseFloat(salary), "", true);
        if (managerDAO.isManagerExist(image, address, phonenumber)) {
            request.setAttribute("message", "This manager is existed");
            request.setAttribute("name", username);
            request.setAttribute("password", password);
            request.setAttribute("email", email);
            request.setAttribute("phonenumber", phonenumber);
            request.setAttribute("namemanager", namemanager);
            request.setAttribute("image", image);
            request.setAttribute("selectedGender", gender);
            request.setAttribute("address", address);
            request.setAttribute("salary", salary);
            request.getRequestDispatcher("managemanager").include(request, response);
        } else {
            Part part = request.getPart("img");
            String contentType = part.getContentType();
            String realPath = request.getServletContext().getRealPath("/images/Manager"); //where the photo is saved
            String source = Path.of(part.getSubmittedFileName()).getFileName().toString(); //get the original filename of the file then
            // convert it to a string, get just the filename without including the full path.

            if (!isImageFile(contentType)) {
                request.setAttribute("message", "Only image files (JPG, PNG, GIF) are allowed.");
                request.getRequestDispatcher("managemanager").include(request, response);
                return;
            }

            if (!source.isEmpty()) {
                String filename = managerDAO.getManagerId() + ".png";
                if (!Files.exists(Path.of(realPath))) { // check folder /images/Supplier is existed
                    Files.createDirectory(Path.of(realPath));
                }
                part.write(realPath + "/" + filename); //Save the uploaded file to the destination folder with a new filename.
                newManager.setImage("/images/Manager/" + filename); //Set the path to the image file
            }

            managerDAO.addNewManager(newManager);
            request.setAttribute("message", "Create successful");
            request.getRequestDispatcher("managemanager").include(request, response);
        }
    }

    /**
     * check email need to follow standard
     *
     * @param email of value need to check
     * @return true if email is valid, false otherwise
     */
    private boolean isValidEmail(String email) {
        String EMAIL_PATTERN = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
        return email != null && Pattern.matches(EMAIL_PATTERN, email);
    }

    /**
     * check phoneNumber need to follow standard
     *
     * @param phoneNumber of value need to check
     * @return true if phoneNumber is valid, false otherwise
     */
    private boolean isValidPhoneNumber(String phoneNumber) {
        String PHONE_PATTERN = "^\\d{10}$";
        return phoneNumber != null && Pattern.matches(PHONE_PATTERN, phoneNumber);
    }

    /**
     * check file valid
     *
     * @param contentType content of file
     * @return true if file valid, false otherwise
     */
    private boolean isImageFile(String contentType) {
        String[] validImageTypes = {"image/jpeg", "image/png", "image/gif"};
        for (String validType : validImageTypes) {
            if (validType.equals(contentType)) {
                return true;
            }
        }
        return false;
    }

    /**
     * Returns a Add Supplier Servlet of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Add Manager Servlet";
    }

}
