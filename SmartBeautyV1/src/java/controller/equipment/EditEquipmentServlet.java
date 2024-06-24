package controller.equipment;

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
        String image = request.getParameter("img");
        String quantity = request.getParameter("quantity");
        String price = request.getParameter("price");
        String description = request.getParameter("description");
        String typeofequipment = request.getParameter("typeofequipment");
        String supplier = request.getParameter("supplier");

        if (!isValidName(name)) {
            request.setAttribute("message", "Invalid input. Please check the name format.");
            request.getRequestDispatcher("manageequipment").include(request, response);
            return;
        }

        Equipment editEquipment = new Equipment(Integer.parseInt(equipmentId), name, Integer.parseInt(typeofequipment), "", Float.parseFloat(price), Integer.parseInt(supplier), Integer.parseInt(quantity), true, description);

        if (equipmentDAO.isEquipmentExistWhenSave(name, image, description)) {
            request.setAttribute("message", "This equipment already exists");
        } else {
            Part part = request.getPart("img");
            String realPath = request.getServletContext().getRealPath("/images/Equipment"); // where the photo is saved
            String source = Path.of(part.getSubmittedFileName()).getFileName().toString(); // get the original filename of the file then
                                                                                                // convert it to a string, get just the filename without including the full path.
            if (!source.isEmpty()) {
                String filename = equipmentId + ".png";
                if (!Files.exists(Path.of(realPath))) { // check folder /images/Equipment is existed
                    Files.createDirectory(Path.of(realPath));
                }
                part.write(realPath + "/" + filename); //Save the uploaded file to the destination folder with a new filename.
                editEquipment.setImage("/images/Equipment/" + filename + "?" + System.currentTimeMillis()); //Set the path to the image file
            } else {
                Equipment existingEquipment = equipmentDAO.getEquipmentById(Integer.parseInt(equipmentId)); // check if image don't update
                editEquipment.setImage(existingEquipment.getImage());                                       // then use old image
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
     * Returns a Edit Equipment Servlet of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Edit Equipment Servlet";
    }
}
