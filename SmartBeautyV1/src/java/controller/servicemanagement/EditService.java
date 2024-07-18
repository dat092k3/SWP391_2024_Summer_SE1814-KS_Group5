/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.servicemanagement;

import DAO.ServiceDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Service;

/**
 *
 * @author td532
 */
public class EditService extends HttpServlet {
   
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditService</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditService at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        // Get parameters from the request
        int serviceId = Integer.parseInt(request.getParameter("service_id").trim());
        String serviceName = request.getParameter("service_name").trim();
        String description = request.getParameter("description").trim();
        String image = request.getParameter("image").trim();
        float price = Float.parseFloat(request.getParameter("price").trim());
        float pt_price = Float.parseFloat(request.getParameter("pt_price").trim());
        int discount = Integer.parseInt(request.getParameter("discount").trim());

        // Create a Service object
        Service service = new Service();
        service.setService_id(serviceId);
        service.setService_name(serviceName);
        service.setDescription(description);
        service.setImage(image);
        service.setPrice(price);
        service.setDiscount(discount);
        service.setPt_price(pt_price);

        // Edit service in the database
        ServiceDAO serviceDAO = new ServiceDAO();
        serviceDAO.editService(service);

        // Redirect to the services page
        response.sendRedirect("searchservice");
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