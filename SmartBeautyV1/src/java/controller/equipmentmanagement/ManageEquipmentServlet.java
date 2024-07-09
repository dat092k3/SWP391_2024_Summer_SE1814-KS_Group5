package controller.equipmentmanagement;

import DAO.EquipmentDAO;
import DAO.SupplierDAO;
import Interface.EquipmentInterface;
import Interface.SupplierInterface;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Equipment;
import model.Supplier;
import model.TypeofEquipment;


public class ManageEquipmentServlet extends HttpServlet {
    
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        SupplierInterface supplierDAO = new SupplierDAO();
        EquipmentInterface equipmentDAO = new EquipmentDAO();

        String equipmentId = request.getParameter("equipmentId");
        String message = (String) request.getAttribute("message");
        Boolean showEditDialog = (Boolean) request.getAttribute("showEditDialog");
        if (equipmentId != null && showEditDialog == null) {
            request.setAttribute("showEditDialog", true);
            Equipment equipment = equipmentDAO.getEquipmentById(Integer.parseInt(equipmentId));
            request.setAttribute("equipment", equipment);
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

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
    
    
    /** 
     * Returns a Manage Equipment Servlet of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Manage Equipment Servlet";
    }
}
