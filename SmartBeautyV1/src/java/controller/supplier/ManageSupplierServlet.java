/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.supplier;

import DAO.SupplierDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;
import java.util.regex.Pattern;
import model.Supplier;

@MultipartConfig
public class ManageSupplierServlet extends HttpServlet {

    // Standard value of email and phonenumber need to follow
    private static final String EMAIL_PATTERN = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
    private static final String PHONE_PATTERN = "^\\d{10}$";

    /**
     * Up data from database to web
     *
     * @param request of director with data
     * @param response of system after director required
     * @throws ServletException
     * @throws IOException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        SupplierDAO supplierDAO = new SupplierDAO();

        String supplier_id = request.getParameter("supplierId");
        String message = (String) request.getAttribute("message");

        String action = request.getParameter("action");
        if (action != null && action.equals("delete")) {
            supplierDAO.deleteSupplier(Integer.parseInt(supplier_id));
            message = "Status change successful!";
        } else {
            Boolean showEditDialog = (Boolean) request.getAttribute("showEditDialog");
            if (supplier_id != null && showEditDialog == null) {
                request.setAttribute("showEditDialog", true);
                Supplier supplier = supplierDAO.getSupplierById(Integer.parseInt(supplier_id));
                request.setAttribute("supplier", supplier);
            }
        }
        request.setAttribute("message", message);
        List<Supplier> allSupplier = supplierDAO.getAllSupplier();
        request.setAttribute("listSupplier", allSupplier);
        request.getRequestDispatcher("./managerSupplier.jsp").include(request, response);
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        SupplierDAO supplierDAO = new SupplierDAO();
        String action = request.getParameter("action");
        String supplierId = request.getParameter("supplierId");
        String name = request.getParameter("name");
        String image = request.getParameter("img");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phonenumber");
        String email = request.getParameter("email");

        // check value input by director
        if (!isValidName(name) || !isValidEmail(email) || !isValidPhoneNumber(phoneNumber)) {
            request.setAttribute("message", "Invalid input. Please check the name, email, and phone number format.");
            processRequest(request, response);
            return;
        }
        // Process data when the director wants to edit or delete a supplier
        switch (action) {
            // process data if director input new supplier
            case "Add" -> {
                Supplier newSupplier = new Supplier(name, "", address, phoneNumber, email, true);
                if (supplierDAO.isSupplierExist(name, address)) {
                    request.setAttribute("message", "This supplier already exists");
                    processRequest(request, response);
                    return;
                } else {
                    //  check and up image from device
                    Part part = request.getPart("img");
                    String realPath = request.getServletContext().getRealPath("/images/Accounts");
                    String source = Path.of(part.getSubmittedFileName()).getFileName().toString();

                    if (!source.isEmpty()) {
                        String filename = supplierDAO.getSupplierId() + ".png";
                        if (!Files.exists(Path.of(realPath))) {
                            Files.createDirectory(Path.of(realPath));
                        }
                        part.write(realPath + "/" + filename);
                        newSupplier.setImage("/images/Accounts/" + filename);
                    }

                    supplierDAO.addNewSupplier(newSupplier);
                    request.setAttribute("message", "Create successful!");
                }
                processRequest(request, response);
            }
            // process data if director edit information supplier
            case "Save" -> {
                Supplier editSupplier = new Supplier(Integer.parseInt(supplierId), name, image, address, phoneNumber, email, true);
                if (!isValidName(name) || !isValidEmail(email) || !isValidPhoneNumber(phoneNumber)) {
                    request.setAttribute("message", "Invalid input. Please check the name, email, and phone number format.");
                    processRequest(request, response);
                    return;
                    // check supplier is existed
                } else if (supplierDAO.isSupplierExistWhenSave(name, address,image, phoneNumber, email)) {
                    request.setAttribute("message", "This supplier already exists");
                    processRequest(request, response);
                    return;
                } else {
                    supplierDAO.updateSupplier(editSupplier);
                    request.setAttribute("message", "Update successful!");
                    request.setAttribute("showEditDialog", false);
                    processRequest(request, response);
                }
            }
        }
    }

    /**
     * check name supplier of director input
     *
     * @param name of director input
     * @return true false
     */
    private boolean isValidName(String name) {
        if (name == null || name.trim().isEmpty()) { // name isn't null
            return false;
        }

        for (char c : name.toCharArray()) { // check name have no digits 
            if (!Character.isLetter(c) && c != ' ') {
                return false; // Contains non-letter characters and not a space
            }
        }

        // Check capitalization after spaces
        String[] nameParts = name.split("\\s+");
        for (String part : nameParts) {
            if (!Character.isUpperCase(part.charAt(0))) {
                return false; // First character after space is not uppercase
            }
        }

        return true;
    }

    /**
     * check email need to follow standard Email_pattern
     *
     * @param email of supplier director input
     * @return true false
     */
    private boolean isValidEmail(String email) {
        return email != null && Pattern.matches(EMAIL_PATTERN, email);
    }

    /**
     * check phonNumber need to follow standard Phone pattern
     *
     * @param phoneNumber of supplier director input
     * @return true false
     */
    private boolean isValidPhoneNumber(String phoneNumber) {
        return phoneNumber != null && Pattern.matches(PHONE_PATTERN, phoneNumber);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
