package controller.servicemanagement;

import DAO.EmployeeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Employee;

public class PtDetail extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String employeeId = request.getParameter("employee_id");
        EmployeeDAO employeeDAO = new EmployeeDAO();
        Employee profilept = employeeDAO.getEmployeeByEmployeeId(Integer.parseInt(employeeId));

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<html lang=\"en\">");
            out.println("<head>");
            out.println("<title>PT Detail</title>");
            out.println("<link rel=\"stylesheet\" href=\"styles/bootstrap-4.1.2/bootstrap.min.css\">");
            out.println("</head>");
            out.println("<body>");
            out.println("<div class=\"container emp-profile\">");
            out.println("<div class=\"row\">");
            out.println("<div class=\"col-md-4\">");
            out.println("<div class=\"profile-img\">");
            out.println("<img style=\"width: 200px\" src=\"" + profilept.getImage() + "\" alt=\"PT Image\"/>");
            out.println("</div></div>");
            out.println("<div class=\"col-md-8\">");
            out.println("<div class=\"tab-content profile-tab\">");
            out.println("<div class=\"tab-pane fade show active\" role=\"tabpanel\">");
            out.println("<div class=\"row\">");
            out.println("<div class=\"col-md-6\"><label>Full Name: " + profilept.getFullName() + "</label></div>");
            out.println("</div>");
            out.println("<div class=\"row\">");
            out.println("<div class=\"col-md-6\"><label>Email: " + profilept.getEmail() + "</label></div>");
            out.println("</div>");
            out.println("<div class=\"row\">");
            out.println("<div class=\"col-md-6\"><label>Phone: " + profilept.getPhoneNumber()+ "</label></div>");
            out.println("</div>");
            out.println("<div class=\"row\">");
            out.println("<div class=\"col-md-6\"><label>Experience: " + profilept.getExperience() + "</label></div>");
            out.println("</div>");
            out.println("</div></div></div></div></div>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
