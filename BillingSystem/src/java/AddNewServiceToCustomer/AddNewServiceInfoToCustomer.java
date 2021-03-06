/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AddNewServiceToCustomer;

import DataBase.DatabaseHandler;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author AZIZ
 */
@WebServlet(name = "AddNewServiceInfoToCustomer", urlPatterns = {"/AddNewServiceInfoToCustomer"})
public class AddNewServiceInfoToCustomer extends HttpServlet {

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
         processRequest(request, response);
        PrintWriter out = response.getWriter();
        DatabaseHandler d2 = new DatabaseHandler();
//        out.println(request.getParameter("serviceName"));
//        out.println(request.getParameter("serviceType"));
//        out.println(request.getParameter("description"));
//        out.println(request.getParameter("cost"));
      // d2.addAdded_service(request.getParameter("serviceName"), Double.parseDouble(request.getParameter("cost")), request.getParameter("description"),request.getParameter("serviceType"));
        //request.getParameter("numbermsisdn");
        if (request.getParameter("serviceType").equals("recurring")) {
            d2.addRecuring_service(request.getParameter("numbermsisdn"), request.getParameter("serviceName"));
        } else if (request.getParameter("serviceType").equals("onetime")) {
            d2.addOneTime(request.getParameter("numbermsisdn"), request.getParameter("serviceName"));
        }
    response.sendRedirect("/BillingSystem/WelcomePage/home.jsp");
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
        processRequest(request, response);
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
