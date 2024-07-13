package controller.suppliermanagement;

import DAO.SupplierDAO;
import Interface.SupplierInterface;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.regex.Pattern;
import model.Supplier;

@MultipartConfig // can receive and process HTTP requests sent as multipart/form-data
public class AddSupplierServlet extends HttpServlet {

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
            out.println("<title>Servlet SearchEquipmentServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchEquipmentServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        SupplierInterface supplierDAO = new SupplierDAO();

        String name = request.getParameter("name").trim();
        String address = request.getParameter("address").trim();
        String phoneNumber = request.getParameter("phonenumber").trim();
        String email = request.getParameter("email").trim();

        if (!isValidName(name)) {
            request.setAttribute("messageerror", "Please check the name is invalid.");
            request.setAttribute("name", name);
            request.setAttribute("address", address);
            request.setAttribute("phonenumber", phoneNumber);
            request.setAttribute("email", email);
            request.getRequestDispatcher("managesupplier").include(request, response);
            return;
        }

        if (!isValidEmail(email)) {
            request.setAttribute("messageerror", "Please check the email is invalid.");
            request.setAttribute("name", name);
            request.setAttribute("address", address);
            request.setAttribute("phonenumber", phoneNumber);
            request.setAttribute("email", email);
            request.getRequestDispatcher("managesupplier").include(request, response);
            return;
        }
        if (!isValidPhoneNumber(phoneNumber)) {
            request.setAttribute("messageerror", "Please check the phone number is invalid.");
            request.setAttribute("name", name);
            request.setAttribute("address", address);
            request.setAttribute("phonenumber", phoneNumber);
            request.setAttribute("email", email);
            request.getRequestDispatcher("managesupplier").include(request, response);
            return;
        }
        if (!isValidAddress(address)) {
            request.setAttribute("messageerror", "Please check the address is invalid.");
            request.setAttribute("name", name);
            request.setAttribute("address", address);
            request.setAttribute("phonenumber", phoneNumber);
            request.setAttribute("email", email);
            request.getRequestDispatcher("managesupplier").include(request, response);
            return;
        }

        Supplier newSupplier = new Supplier(name, "", address, phoneNumber, email, true);
        if (supplierDAO.isSupplierExist(name, phoneNumber, email)){
            request.setAttribute("messageerror", "This supplier already exists");
            request.setAttribute("name", name);
            request.setAttribute("address", address);
            request.setAttribute("phonenumber", phoneNumber);
            request.setAttribute("email", email);
        } else {
            Part part = request.getPart("img");
            String contentType = part.getContentType();
            if (!isImageFile(contentType)) {
                request.setAttribute("message", "Only image files (JPG, PNG, GIF) are allowed.");
                request.setAttribute("name", name);
                request.setAttribute("address", address);
                request.setAttribute("phonenumber", phoneNumber);
                request.setAttribute("email", email);
                request.getRequestDispatcher("managesupplier").include(request, response);
                return;
            }
            String realPath = request.getServletContext().getRealPath("/images/Supplier"); //where the photo is saved
            String source = Path.of(part.getSubmittedFileName()).getFileName().toString(); //get the original filename of the file then
            // convert it to a string, get just the filename without including the full path.

            if (!source.isEmpty()) {
                String filename = supplierDAO.getSupplierId() + ".png";
                if (!Files.exists(Path.of(realPath))) { // check folder /images/Supplier is existed
                    Files.createDirectory(Path.of(realPath));
                }
                part.write(realPath + "/" + filename); //Save the uploaded file to the destination folder with a new filename.
                newSupplier.setImage("/images/Supplier/" + filename); //Set the path to the image file
            }

            supplierDAO.addNewSupplier(newSupplier);
            request.setAttribute("message", "Create successful!");
        }
        request.getRequestDispatcher("managesupplier").include(request, response);
    }

    /**
     * check value of name need to follow standard
     *
     * @param name of name need to check
     * @return true if name is valid, false otherwise
     */
    public boolean isValidName(String name) {
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
     * check file valid
     *
     * @param contentType content of file
     * @return true if file valid, false otherwise
     */
    public boolean isImageFile(String contentType) {
        String[] validImageTypes = {"image/jpeg", "image/png", "image/gif"};
        for (String validType : validImageTypes) {
            if (validType.equals(contentType)) {
                return true;
            }
        }
        return false;
    }

    /**
     * check email need to follow standard
     *
     * @param email of value need to check
     * @return true if email is valid, false otherwise
     */
    public boolean isValidEmail(String email) {
        String EMAIL_PATTERN = "^[A-Za-z0-9_]+@[A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$";
        return email != null && Pattern.matches(EMAIL_PATTERN, email);
    }

    /**
     * check phoneNumber need to follow standard
     *
     * @param phoneNumber of value need to check
     * @return true if phoneNumber is valid, false otherwise
     */
    public boolean isValidPhoneNumber(String phoneNumber) {
        String PHONE_PATTERN = "^\\d{10}$";
        return phoneNumber != null && Pattern.matches(PHONE_PATTERN, phoneNumber);
    }

    /**
     * check address need to follow standard
     *
     * @param address The address to check
     * @return true if the address is valid, false otherwise
     */
    public boolean isValidAddress(String address) {
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
     * Returns a Add Supplier Servlet of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Add Supplier Servlet";
    }
}
