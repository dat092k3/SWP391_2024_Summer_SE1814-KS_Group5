package controller.equipmentmanagement;

import DAO.EquipmentDAO;
import Interface.EquipmentInterface;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Path;
import model.Equipment;

@MultipartConfig
public class EditEquipmentServlet extends HttpServlet {

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

        EquipmentInterface equipmentDAO = new EquipmentDAO();

        String equipmentId = request.getParameter("equipmentId");
        String name = request.getParameter("nameequipment");
        String quantity = request.getParameter("quantity");
        String image = request.getParameter("img");
        String price = request.getParameter("price");
        String description = request.getParameter("description");
        String typeofequipment = request.getParameter("typeofequipment");
        String supplier = request.getParameter("supplier");

        if (!isValidName(name)) {
            request.setAttribute("messageerror", "Invalid input. Please check the name format.");
            request.setAttribute("nameequipment", name);
            request.setAttribute("quantity", quantity);
            request.setAttribute("price", price);
            request.setAttribute("description", description);
            request.setAttribute("selectedType", typeofequipment);
            request.setAttribute("selectedSupplier", supplier);
            request.getRequestDispatcher("manageequipment").include(request, response);
            return;
        }
        
        if (typeofequipment == null || typeofequipment.trim().isEmpty()) {
            request.setAttribute("messageerror", "Please select a type of equipment.");
            request.setAttribute("nameequipment", name);
            request.setAttribute("quantity", quantity);
            request.setAttribute("price", price);
            request.setAttribute("description", description);
            request.setAttribute("selectedType", typeofequipment);
            request.setAttribute("selectedSupplier", supplier);
            request.getRequestDispatcher("manageequipment").include(request, response);
            return;
        }

        if (supplier == null || supplier.trim().isEmpty()) {
            request.setAttribute("messageerror", "Please select a supplier.");
            request.setAttribute("nameequipment", name);
            request.setAttribute("quantity", quantity);
            request.setAttribute("price", price);
            request.setAttribute("description", description);
            request.setAttribute("selectedType", typeofequipment);
            request.setAttribute("selectedSupplier", supplier);
            request.getRequestDispatcher("manageequipment").include(request, response);
            return;
        }

        Equipment editEquipment = new Equipment(Integer.parseInt(equipmentId), name, Integer.parseInt(typeofequipment), "", Float.parseFloat(price), Integer.parseInt(supplier), Integer.parseInt(quantity), true, description);

        if (equipmentDAO.isEquipmentExistWhenSave(name, Integer.parseInt(typeofequipment), image, Float.parseFloat(price), Integer.parseInt(supplier), Integer.parseInt(quantity), description)) {
            request.setAttribute("messageerror", "This equipment already exists");
            request.setAttribute("nameequipment", name);
            request.setAttribute("quantity", quantity);
            request.setAttribute("price", price);
            request.setAttribute("description", description);
            request.setAttribute("selectedType", typeofequipment);
            request.setAttribute("selectedSupplier", supplier);
        } else {
            Part part = request.getPart("img");
            if (part != null && part.getSize() > 0) { // Check if part is not null and has content
                String contentType = part.getContentType();
                if (!isImageFile(contentType)) {
                    request.setAttribute("message", "Only image files (JPG, PNG, GIF) are allowed.");
                    request.setAttribute("nameequipment", name);
                    request.setAttribute("quantity", quantity);
                    request.setAttribute("price", price);
                    request.setAttribute("description", description);
                    request.setAttribute("selectedType", typeofequipment);
                    request.setAttribute("selectedSupplier", supplier);
                    request.getRequestDispatcher("manageequipment").include(request, response);
                    return;
                }

                String realPath = request.getServletContext().getRealPath("/images/Equipment");
                String source = Path.of(part.getSubmittedFileName()).getFileName().toString();

                if (!source.isEmpty()) {
                    String filename = equipmentId + ".png";
                    if (!Files.exists(Path.of(realPath))) {
                        Files.createDirectory(Path.of(realPath));
                    }
                    part.write(realPath + "/" + filename);
                    editEquipment.setImage("/images/Equipment/" + filename + "?" + System.currentTimeMillis());
                }
            } else {
                Equipment existingEquipment = equipmentDAO.getEquipmentById(Integer.parseInt(equipmentId));
                editEquipment.setImage(existingEquipment.getImage());
            }

            equipmentDAO.updateEquipment(editEquipment);
            request.setAttribute("message", "Update successful!");
            request.setAttribute("showEditDialog", false);
        }

        // Forward to manage equipment servlet after processing
        request.getRequestDispatcher("/manageequipment").forward(request, response);
    }

    /**
     * check value of name input
     *
     * @param name of equipment to check
     * @return true if name is valid, false otherwise
     */
    private boolean isValidName(String name) {
        if (name == null || name.trim().isEmpty()) {
            return false;
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
     * Returns a Edit Equipment Servlet of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Edit Equipment Servlet";
    }
}
