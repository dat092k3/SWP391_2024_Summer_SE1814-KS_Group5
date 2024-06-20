package controller.supplier;

import DAO.SupplierDAO;
import Interface.SupplierInterface;
import java.io.IOException;
import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Supplier;

public class ManageSupplierServlet extends HttpServlet {

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

        String supplier_id = request.getParameter("supplierId");
        String message = (String) request.getAttribute("message");

        Boolean showEditDialog = (Boolean) request.getAttribute("showEditDialog"); // get to check display form edit
        if (supplier_id != null && showEditDialog == null) {
            request.setAttribute("showEditDialog", true);
            Supplier supplier = supplierDAO.getSupplierById(Integer.parseInt(supplier_id));
            request.setAttribute("supplier", supplier);
        }

        request.setAttribute("message", message);
        List<Supplier> allSupplier = supplierDAO.getAllSupplier();
        request.setAttribute("listSupplier", allSupplier);
        request.getRequestDispatcher("./managersupplier.jsp").include(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    

    }
