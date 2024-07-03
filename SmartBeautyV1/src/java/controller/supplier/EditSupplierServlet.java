package controller.supplier;

import DAO.SupplierDAO;
import Interface.SupplierInterface;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.regex.Pattern;
import model.Supplier;

@MultipartConfig
public class EditSupplierServlet extends HttpServlet {

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

        String supplierId = request.getParameter("supplierId");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phonenumber");
        String email = request.getParameter("email");
        String image = request.getParameter("img");

        if (!isValidName(name) || !isValidEmail(email) || !isValidPhoneNumber(phoneNumber) || !isValidAddress(address)) {
            request.setAttribute("message", "Invalid input. Please check the name, email, address and phone number format.");
            request.getRequestDispatcher("managesupplier").include(request, response);
            return;
        }

        Supplier editSupplier = new Supplier(Integer.parseInt(supplierId), name, "", address, phoneNumber, email, true);

        if (supplierDAO.isSupplierExistWhenSave(name, address, image, phoneNumber, email)) {
            request.setAttribute("message", "This supplier already exists");
        } else {
            Part part = request.getPart("img");
            String contentType = part.getContentType();
            String realPath = request.getServletContext().getRealPath("/images/Supplier"); //where the photo is saved
            String source = Path.of(part.getSubmittedFileName()).getFileName().toString(); //get the original filename of the file then
            // convert it to a string, get just the filename without including the full path.
            if (!isImageFile(contentType)) {
                request.setAttribute("message", "Only image files (JPG, PNG, GIF) are allowed.");
                request.getRequestDispatcher("managesupplier").include(request, response);
                return;
            }
            if (!source.isEmpty()) {
                String filename = supplierId + ".png";
                if (!Files.exists(Path.of(realPath))) { // check folder /images/Supplier is existed
                    Files.createDirectory(Path.of(realPath));
                }
                part.write(realPath + "/" + filename); //Save the uploaded file to the destination folder with a new filename.
                editSupplier.setImage("/images/Supplier/" + filename + "?" + System.currentTimeMillis()); //Set the path to the image file
            } else {
                Supplier existingSupplier = supplierDAO.getSupplierById(Integer.parseInt(supplierId));
                editSupplier.setImage(existingSupplier.getImage());
            }
            supplierDAO.updateSupplier(editSupplier);
            request.setAttribute("message", "Update successful!");
            request.setAttribute("showEditDialog", false);
        }
        request.getRequestDispatcher("managesupplier").include(request, response);
    }

    /**
     * check value of name need to follow standard
     *
     * @param name of value need to check
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
        return "Edit Supplier Servlet";
    }
}
