/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.managermanagement;

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
import java.time.LocalDate;
import java.time.Period;
import java.util.regex.Pattern;
import model.Account;
import model.Manager;

/**
 *
 * @author LENOVO
 */
@MultipartConfig
public class EditManagerServlet extends HttpServlet {

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
            out.println("<title>Servlet EditManagerServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditManagerServlet at " + request.getContextPath() + "</h1>");
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

        String managerId = request.getParameter("managerId");
        String accountId = request.getParameter("accountId");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
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
        
        LocalDate dob = LocalDate.parse(dateofbirth);
        LocalDate now = LocalDate.now();
        int age = Period.between(dob, now).getYears();

        LocalDate hireDate = LocalDate.parse(hiredate);
        if (!isValidName(namemanager)) {
            request.setAttribute("messageerror", "Please check the name is invalid.");
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
            request.setAttribute("messageerror", "Please select a gender.");
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

        if (!isValidEmail(email)) {
            request.setAttribute("messageerror", "Please check the email is invalid.");
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

        if (dob.isAfter(now)) {
            request.setAttribute("messageerror", "Date of birth is invalid.");
            request.getRequestDispatcher("managemanager").forward(request, response);
            return;
        }
        if (!isValidPhoneNumber(phonenumber)) {
            request.setAttribute("messageerror", "Please check the phonenumber is invalid.");
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
        if (!isValidAddress(address)) {
            request.setAttribute("messageerror", "Please check the address is invalid.");
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
        if (hireDate.isBefore(dob) || hireDate.isAfter(now)) {
            request.setAttribute("messageerror", "Hire date is invalid.");
            request.getRequestDispatcher("managemanager").forward(request, response);
            return;
        }

        if (age < 18) {
            request.setAttribute("messageerror", "You must be at least 18 years old.");
            request.getRequestDispatcher("managemanager").include(request, response);
            return;
        }
        
        Account editAccount = new Account(username, password, email, phonenumber, "Manager", true);
        Manager editManager = new Manager(Integer.parseInt(managerId), Integer.parseInt(accountId), namemanager, gender, email, dateofbirth, phonenumber, address, hiredate, Float.parseFloat(salary), image, true);
        if (managerDAO.isManagerExistWhenSave(Integer.parseInt(managerId), namemanager, image, address, phonenumber, email, Float.parseFloat(salary))) {
            request.setAttribute("messageerror", "This manager is existed");
            request.setAttribute("email", email);
            request.setAttribute("username", username);
            request.setAttribute("password", password);
            request.setAttribute("phonenumber", phonenumber);
            request.setAttribute("namemanager", namemanager);
            request.setAttribute("image", image);
            request.setAttribute("selectedGender", gender);
            request.setAttribute("hireDate", hiredate);
            request.setAttribute("address", address);
            request.setAttribute("salary", salary);
            request.getRequestDispatcher("managemanager").include(request, response);
        } else {
            Part part = request.getPart("img");
            if (part != null && part.getSize() > 0) { // Check if part is not null and has content
                String contentType = part.getContentType();
                if (!isImageFile(contentType)) {
                    request.setAttribute("message", "Only image files (JPG, PNG, GIF) are allowed.");
                    request.getRequestDispatcher("manageequipment").include(request, response);
                    return;
                }
                String realPath = request.getServletContext().getRealPath("/images/Manager"); //where the photo is saved
                String source = Path.of(part.getSubmittedFileName()).getFileName().toString(); //get the original filename of the file then
                // convert it to a string, get just the filename without including the full path

                if (!source.isEmpty()) {
                    String filename = managerId + ".png";
                    if (!Files.exists(Path.of(realPath))) { // check folder /images/Manager is existed
                        Files.createDirectory(Path.of(realPath));
                    }
                    part.write(realPath + "/" + filename); //Save the uploaded file to the destination folder with a new filename.
                    editManager.setImage("/images/Manager/" + filename+ "?"+System.currentTimeMillis()); //Set the path to the image file
                }
            } else {
                Manager existingManager = managerDAO.getManagerById(Integer.parseInt(managerId));
                editManager.setImage(existingManager.getImage());
            }
            accountDAO.updateInformationIfUpdateManager(editAccount);
            managerDAO.updateManager(editManager);

            request.setAttribute("message", "Update successful");
            request.setAttribute("showEditDialog", false);
        }
        request.getRequestDispatcher("managemanager").include(request, response);
    }

    /**
     * check value of name need to follow standard
     *
     * @param name of name need to check
     * @return true if name is valid, false otherwise
     */
    private boolean isValidName(String name) {
        if (name == null || name.trim().isEmpty()) {
            return false;
        }
        for (char c : name.toCharArray()) {
            if (!Character.isLetter(c) && c != ' ') {
                return false;
            }
        }
        String[] nameParts = name.split("\\s+");
        for (String part : nameParts) {
            if (!Character.isUpperCase(part.charAt(0))) {
                return false;
            }
        }
        return true;
    }

    /**
     * check email need to follow standard
     *
     * @param email of value need to check
     * @return true if email is valid, false otherwise
     */
    private boolean isValidEmail(String email) {
        String EMAIL_PATTERN = "^[A-Za-z0-9_]+@[A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$";
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
     * check address need to follow standard
     *
     * @param address The address to check
     * @return true if the address is valid, false otherwise
     */
    private boolean isValidAddress(String address) {
        if (address == null || address.trim().isEmpty()) {
            return false;
        }

        String regex = "^[a-zA-Z\\p{L}0-9.,\\s]*$";
        if (!address.matches(regex)) {
            return false;
        }

        // Additional condition: Each word after whitespace must start with an uppercase letter
        String[] words = address.split("\\s+");
        for (String word : words) {
            if (!Character.isUpperCase(word.charAt(0))) {
                return false;
            }
        }

        return true;
    }

    /**
     * Returns a Edit Supplier Servlet of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Edit Manager Servlet";
    }

}
