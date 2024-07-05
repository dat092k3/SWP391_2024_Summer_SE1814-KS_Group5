/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.servicemanagement;

import DAO.EmployeeDAO;
import DAO.ServiceDAO;
import Interface.EmployeeInterface;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import model.CustomerService;
import model.Employee;
import model.Service;

/**
 *
 * @author td532
 */
public class RegisterService extends HttpServlet {

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
            out.println("<title>Servlet RegisterService</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterService at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
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
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ServiceDAO serviceDAO = new ServiceDAO();
        // Retrieve form parameters
        int serviceId = Integer.parseInt(request.getParameter("service_id"));
        int customerId = serviceDAO.getCustomerId(Integer.parseInt(request.getParameter("customer_id")));
        String dateString = request.getParameter("date");
        String endDateString = request.getParameter("end_date");
        System.out.println("dateString " + dateString);
        System.out.println("endDateString " + endDateString);
        int employeeId = request.getParameter("pt").isEmpty() ? 0 : Integer.parseInt(request.getParameter("pt"));
        float totalPrice = Float.parseFloat(request.getParameter("total_price"));
        if (!request.getParameter("customer_id").isEmpty()) {
            // Convert date strings to Date objects
            Timestamp date = Timestamp.valueOf(dateString);
            Timestamp endDate = Timestamp.valueOf(endDateString);
            System.out.println("date " + date);
            System.out.println("enddate " + endDate);
            // Create CustomerService object
            
            CustomerService customerService = new CustomerService(serviceId, customerId, date, endDate, employeeId, totalPrice);

            // Save the CustomerService object to the database
            if (employeeId == 0) {
                serviceDAO.addCustomerServiceNotPT(customerService);
            } else {
                serviceDAO.addCustomerService(customerService);
            }

            request.setAttribute("mes", "Register Successful");
            request.setAttribute("err", "");
        } else {
            request.setAttribute("mes", "");
            request.setAttribute("err", "Register Not Success");
        }

        // Redirect or forward to a success page or back to the service details page
        Service service = serviceDAO.getServiceById(serviceId);
        EmployeeInterface employeeDAO = new EmployeeDAO();
        List<Employee> list_pt = employeeDAO.getPTByDepartment();
        request.setAttribute("list_pt", list_pt);
        request.setAttribute("service", service);
        request.getRequestDispatcher("servicedetails.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
