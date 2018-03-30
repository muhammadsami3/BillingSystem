/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Administration;

import static DataBase.dbMethods.conn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import links.linkto;

/**
 *
 * @author Muhammad Sami
 */
@WebServlet(name = "addCustomer", urlPatterns = {"/addCustomer"})
public class addCustomer extends HttpServlet {

    Connection connect;
    String fname = "";
    String lname = "";
    String uname = "";
    String password = "";
    String birthdate = "";
    String email = "";
    String job = "";
    String address = "";
    String profile = "";
    String msisdn = "";

    PreparedStatement stmt;
    PreparedStatement prep;
    ResultSet rs;
    Boolean islogin = true;
    boolean flag = false;

    public void init() {

        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(addCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            connect = DriverManager.getConnection(linkto.DB, linkto.databaseUser, linkto.dbPasswd);
        } catch (SQLException ex) {
            Logger.getLogger(addCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        fname = request.getParameter("fname");
        lname = request.getParameter("lname");
        uname = request.getParameter("uname");
        password = request.getParameter("password");
        birthdate = request.getParameter("birthdate");
        email = request.getParameter("email");
        msisdn = request.getParameter("msisdn");
        address = request.getParameter("address");
        profile = request.getParameter("rateplane");
        System.out.println("Administration.addCustomer.doPost()" + msisdn);

        try {
            String queryString = new String("Select * from contract where msisdn=?");
            stmt = connect.prepareStatement(queryString);
            stmt.setString(1, msisdn);
            rs = stmt.executeQuery();

            if (!rs.next()) {

                String queryString1 = new String("Select * from Customer where uname=?");
                stmt = connect.prepareStatement(queryString);
                stmt.setString(1, msisdn);
                rs = stmt.executeQuery();
                if (!rs.next()) {
                    flag = true;
                } else {
                    out.println("This User Name is exist, please enter another one");

                }

            } else {
                out.println("This Mobile Number is exist, please enter another one");

            }

            if (flag) {
                queryString = new String("Insert into Customer(fname,lname,uname,password,birthdate,email,address)values(?,?,?,?,?,?,?);");

                prep = connect.prepareStatement(queryString);
                prep.setString(1, fname);
                prep.setString(2, lname);
                prep.setString(3, uname);
                prep.setString(4, password);
                ///datetimeformat
                prep.setDate(5, new Date(new java.util.Date().getTime()));
                prep.setString(6, email);
                prep.setString(7, address);

                prep.executeUpdate();
                String queryString2 = new String("Select customerid from Customer where uname=?;");
                prep = connect.prepareStatement(queryString2);
                prep.setString(1, uname);
                rs = prep.executeQuery();
                rs.next();
                int Customerid = rs.getInt(1);
                queryString = new String("Insert into contract(Customerid,msisdn)values(?,?);");
                prep = connect.prepareStatement(queryString);
                prep.setInt(1, Customerid);
                prep.setString(2, msisdn);
                prep.executeUpdate();
                response.sendRedirect("selectServicePackage.jsp?msisdn=" + msisdn + "&rateplaneid=" + profile);
            }
        } catch (Exception ex) {
            Logger.getLogger(addCustomer.class.getName()).log(Level.SEVERE, null, ex);
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

}
