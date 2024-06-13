/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.equipment;

import DAO.EquipmentDAO;
import DAO.SupplierDAO;
import Interface.EquipmentInterface;
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
import java.util.List;
import model.Equipment;
import model.Supplier;
import model.TypeofEquipment;

@MultipartConfig
public class ManageEquipmentServlet extends HttpServlet {

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
        SupplierInterface supplierDAO = new SupplierDAO();
        EquipmentInterface equipmentDAO = new EquipmentDAO();
        String equipmentId = request.getParameter("equipmentId");
        String message = (String) request.getAttribute("message");
        String action = request.getParameter("action");
        if (action != null && action.equals("delete")) {
            equipmentDAO.deleteEquipment(Integer.parseInt(equipmentId));
            message = "Status change successful!";
        } else {
            Boolean showEditDialog = (Boolean) request.getAttribute("showEditDialog");
            if (equipmentId != null && showEditDialog == null) {
                request.setAttribute("showEditDialog", true);
                Equipment equipment = equipmentDAO.getEquipmentById(Integer.parseInt(equipmentId));
                request.setAttribute("equipment", equipment);
            }
        }
        request.setAttribute("message", message);
        List<Equipment> allEquipment = equipmentDAO.getAllEquipment();
        request.setAttribute("listEquipment", allEquipment);
        List<Supplier> allSupplier = supplierDAO.getAllSupplier();
        request.setAttribute("listSupplier", allSupplier);
        List<TypeofEquipment> allTypeofEquipment = equipmentDAO.getAllTypeofEquipment();
        request.setAttribute("allTypeofEquipment", allTypeofEquipment);

        request.getRequestDispatcher("./managerequipment.jsp").include(request, response);
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
        EquipmentDAO equipmentDAO = new EquipmentDAO();
        String action = request.getParameter("action");
        String equipmentId = request.getParameter("equipmentId");
        String name = request.getParameter("nameequipment");
        String image = request.getParameter("image");
        String quantity = request.getParameter("quantity");
        String price = request.getParameter("price");
        String description = request.getParameter("description");
        String typeofequipment = request.getParameter("typeofequipment");
        String supplier = request.getParameter("supplier");

        // check value input by director
        if (!isValidName(name)) {
            request.setAttribute("message", "Invalid input. Please check the name format.");
            processRequest(request, response);
            return;
        }
        // Process data when the director wants to edit or delete a equipment
        switch (action) {
            // process data if director input new euipment
            case "Add" -> {
                Equipment newEquipment = new Equipment(name, Integer.parseInt(typeofequipment), "", Float.parseFloat(price), Integer.parseInt(supplier), Integer.parseInt(quantity), true, description);
                if (equipmentDAO.isEquipmentExist(name)) {
                    request.setAttribute("message", "This Equipment already exists");
                    processRequest(request, response);
                    return;
                } else {
                    //  check and up image from device
                    Part part = request.getPart("img");
                    String realPath = request.getServletContext().getRealPath("/images/Equipment");
                    String source = Path.of(part.getSubmittedFileName()).getFileName().toString();

                    if (!source.isEmpty()) {
                        String filename = equipmentDAO.getEquipmentId() + ".png";
                        if (!Files.exists(Path.of(realPath))) {
                            Files.createDirectory(Path.of(realPath));
                        }
                        part.write(realPath + "/" + filename);
                        newEquipment.setImage("/images/Equipment/" + filename);
                    }

                    equipmentDAO.addNewEquipment(newEquipment);
                    request.setAttribute("message", "Create successful!");
                }
                processRequest(request, response);
            }
            // process data if director edit information supplier
            case "Save" -> {
                Equipment editEquipment = new Equipment(Integer.parseInt(equipmentId), name, Integer.parseInt(typeofequipment), "", Float.parseFloat(price), Integer.parseInt(supplier), Integer.parseInt(quantity), true, description);
                if (!isValidName(name)) {
                    request.setAttribute("message", "Invalid input. Please check the name format.");
                    processRequest(request, response);
                    return;
                    // check equipment is existed
                } else if (equipmentDAO.isEquipmentExistWhenSave(name, image, description)) {
                    request.setAttribute("message", "This equipment already exists");
                    processRequest(request, response);
                    return;
                } else {
                    // check and upload new image from device if provided
                    Part part = request.getPart("img");
                    String realPath = request.getServletContext().getRealPath("/images/Equipment");
                    String source = Path.of(part.getSubmittedFileName()).getFileName().toString();

                    if (!source.isEmpty()) {
                        String filename = equipmentId + ".png";
                        if (!Files.exists(Path.of(realPath))) {
                            Files.createDirectory(Path.of(realPath));
                        }
                        part.write(realPath + "/" + filename);
                        editEquipment.setImage("/images/Equipment/" + filename);
                    }

                    equipmentDAO.updateEquipment(editEquipment);
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

        // Check capitalization after spaces
        String[] nameParts = name.split("\\s+");
        for (String part : nameParts) {
            if (!Character.isUpperCase(part.charAt(0))) {
                return false; // First character after space is not uppercase
            }
        }

        return true;
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
