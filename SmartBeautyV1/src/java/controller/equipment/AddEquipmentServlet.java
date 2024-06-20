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
public class AddEquipmentServlet extends HttpServlet {

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

        String name = request.getParameter("nameequipment");
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

        Equipment newEquipment = new Equipment(name, Integer.parseInt(typeofequipment), "", Float.parseFloat(price), Integer.parseInt(supplier), Integer.parseInt(quantity), true, description);

        if (equipmentDAO.isEquipmentExist(name)) {
            request.setAttribute("message", "This Equipment already exists");
        } else {
            Part part = request.getPart("img");
            String realPath = request.getServletContext().getRealPath("/images/Equipment"); //where the photo is saved
            String source = Path.of(part.getSubmittedFileName()).getFileName().toString(); //get the original filename of the file then
                                                                                                // convert it to a string, get just the filename without including the full path.

            if (!source.isEmpty()) {
                String filename = equipmentDAO.getEquipmentId() + ".png";
                if (!Files.exists(Path.of(realPath))) { // check folder /images/Equipment is existed
                    Files.createDirectory(Path.of(realPath));
                }
                part.write(realPath + "/" + filename); //Save the uploaded file to the destination folder with a new filename.
                newEquipment.setImage("/images/Equipment/" + filename); //Set the path to the image file
            }

            equipmentDAO.addNewEquipment(newEquipment);
            request.setAttribute("message", "Create successful!");
        }

        request.getRequestDispatcher("manageequipment").include(request, response);
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

        String[] nameParts = name.split("\\s+");
        for (String part : nameParts) {
            if (!Character.isUpperCase(part.charAt(0))) {
                return false;
            }
        }

        return true;
    }


    /**
     * Returns a Add Equipment Servlet of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Add Equipment Servlet";
    }
}