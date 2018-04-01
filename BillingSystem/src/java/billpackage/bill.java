
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package billpackage;

import DataBase.dbMethods;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
@WebServlet(name = "bill", urlPatterns = {"/bill"})

public class bill extends HttpServlet {

    double calcNewcost(int unit, double freeunits, double cost, double unitprice) {
        double newcost = 0.0;

        if (freeunits >= unit) {
            newcost = 0;
            freeunits = freeunits - unit;
        } else if (freeunits == 0) {
            newcost = cost;
        } else if (freeunits < unit) {
            newcost = unitprice * (unit - freeunits);
            freeunits = 0;
        }

        return newcost;
    }

    double calcDatacost(int unit, double freeunits, double cost, double unitprice) {
        double newcost = 0.0;

        if (freeunits > unit) {
            newcost = 0;
            freeunits = freeunits - unit;
        } else if (freeunits <= unit) {
            newcost = cost;
        }

        return newcost;
    }

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

            
            String msisdn =request.getParameter("msisdn");
            msisdn=(msisdn==null)?"00201221234567":msisdn;
            HttpSession session=request.getSession(true);
            session.setAttribute("msisdn", msisdn);

            dbMethods obj = new dbMethods();
            obj.connectToDatabase();

            int unit, contractid, serviceid;
            int packageid;
            double unitprice;
            double freeunits;
            double cost;
            double newcost = 0.0;

            ResultSet rs;
            ResultSet rs2;

            try {
                rs = obj.getuserCdrs(msisdn);
                while (rs.next()) {

                    if (rs.getBoolean("isbilled") == false) {

                        unit = rs.getInt("unit");

                        contractid = rs.getInt("contractid");
                        cost = rs.getDouble("cost");
                        packageid = obj.getPackageId(contractid);

                        serviceid = rs.getInt("serviceid");

                        unitprice = obj.getUnitPriceById(serviceid, packageid);
                        unitprice/=100;
                        
                        freeunits = obj.getNumofFreeunits1(contractid, serviceid);
                        System.out.println(freeunits);
                        if (serviceid != 3) {
                            newcost = calcNewcost(unit, freeunits, cost, unitprice);
                        } else {
                            newcost = calcDatacost(unit, freeunits, cost, unitprice);

                        }
                        obj.isbilled(rs.getInt("udrid"));
                        obj.addhistory(serviceid, rs.getInt("udrid"), msisdn, newcost, false, rs.getInt("unit"));

                        out.println(newcost);
                    }
                }
                response.sendRedirect("/BillingSystem/bill_invoice");

            } catch (SQLException ex) {
                Logger.getLogger(bill.class.getName()).log(Level.SEVERE, null, ex);
            }

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
