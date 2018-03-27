/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AddInfoAboutService;

import DatabaseHandler.DatabaseHandler;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author AZIZ
 */
public class AddInfo extends HttpServlet {

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
        
        
        PrintWriter out = response.getWriter();
        DatabaseHandler d =new DatabaseHandler();
        String rate=request.getParameter("rateplan");
        int count=Integer.parseInt(request.getParameter("numberofservicepakage"));
        int i=0;
        String servicePackageName;
        double numberOFMinutes;
        double numberOFSMS;
        double numberOFDATA;
        
        String serviceName;
        double costOFMinutes;
        double costOFSMS;
        double costOFDATA;
        
        double cost;
        
        
        
        while(i<count){
            i++;                    
         servicePackageName=request.getParameter("ServicePackageName"+i);
         numberOFMinutes=Double.parseDouble(request.getParameter("numberOFMinutes"+i));
         numberOFSMS=Double.parseDouble(request.getParameter("numberOFSMS"+i));
         numberOFDATA=Double.parseDouble(request.getParameter("numberOFDATA"+i));
         cost=Double.parseDouble(request.getParameter("costs"+i));
         
          d.addServicePackage(rate,servicePackageName, numberOFMinutes,numberOFSMS, numberOFDATA, cost);
         
         serviceName=request.getParameter("ServicePackageName"+i);
         costOFMinutes=Double.parseDouble(request.getParameter("costOFMinutes"+i));
         d.addService_Servicepackage(servicePackageName, "voice", costOFMinutes);
//         d.addService("voice Of "+serviceName, costOFMinutes, servicePackageName);
         costOFSMS=Double.parseDouble(request.getParameter("costOFSMS"+i));
         d.addService_Servicepackage(servicePackageName, "sms", costOFSMS);

//         d.addService("SMS Of "+serviceName, costOFSMS, servicePackageName);
         costOFDATA=Double.parseDouble(request.getParameter("costOFDATA"+i));
         d.addService_Servicepackage(servicePackageName, "data", costOFDATA);
//         d.addService("Cost Of "+serviceName, costOFDATA, servicePackageName);
         
//         d.addService_Servicepackage(servicePackageName, "voice", cost);
        
       
        
//        out.println("<h>"+request.getParameter("ServicePackageName"+i)+"</h>");
//        out.print("<br>");
//        out.println("<h>"+request.getParameter("costs"+i)+"</h>");
//        out.print("<br>");
//        out.println("<h>"+request.getParameter("numberOFMinutes"+i)+"</h>");
//        out.print("<br>");
//        out.println("<h>"+request.getParameter("numberOFSMS"+i)+"</h>");
//        out.print("<br>");
//        out.println("<h>"+request.getParameter("numberOFDATA"+i)+"</h>");
//        out.print("<br>");
        }
        
        System.out.println(request.getParameter("ServicePackageName"));
        System.out.println(request.getParameter(" costs"));
        System.out.println(request.getParameter(" numberOFMinutes"));
        System.out.println(request.getParameter(" numberOFSMS"));
        System.out.println(request.getParameter(" numberOFDATA"));
        
        response.sendRedirect("addServices.jsp");
       
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
