<%-- 
    Document   : showServicePackage
    Created on : Mar 30, 2018, 7:27:00 PM
    Author     : AZIZ
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="links.linkto"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="DataBase.DatabaseHandler"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href='https://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="/BillingSystem/Administration/table/tablecss.css">
        <link href='https://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>

    </head>
   
<body>
  <h1 class="title"> Service Packages</h1>
  
  
    
      <%
                        Statement stmt;
                        PreparedStatement prep;
                        ResultSet rs;
                        Connection connect = null;
                        int rateplaneid = 0;
                        int msisdn = 0;

                        try {
                            Class.forName("org.postgresql.Driver");
                        } catch (ClassNotFoundException ex) {

                        }
                        try {
                            connect = DriverManager.getConnection(linkto.DB, linkto.databaseUser, linkto.dbPasswd);
                        } catch (SQLException ex) {

                        }
                        rateplaneid = Integer.parseInt(request.getParameter("rateplaneid"));
                        stmt = connect.createStatement();
                        String queryString = new String("Select * from servicepackage where rateplaneid='" + rateplaneid + "'");

                        rs = stmt.executeQuery(queryString);
                            //out.println("<option value='" + rs.getInt(1) + "'>" + rs.getString(2) + "</option>");
                        
                    %>
                      <div id="container">
                                               

                    <%
   while (rs.next()) {
       
      out.println("<div class='pricetab'>");
      out.println("<h1>Service Package</h1>");
                out.println("<div class='price'>"); 
                out.println("<h2 style='align-self: center;font-size: x-large;font-style: bold;font-weight:bold;color:white;bottom: -8%;padding-top: 30px;margin-top: 10px;'"
                        +rs.getString(2)+"</h2>"); 
                out.println("</div>");
      out.println("<div class='infos'>");
        out.println("<h3>Number Of Minutes = "+rs.getDouble("numberofminutes")+"</h3>");
        out.println("<h3>Number Of SMS = "+rs.getDouble("numberofsms")+"</h3>");
        out.println("<h3>Number Of Data = "+rs.getDouble("numberofdata")+"</h3>");
        
        out.println("<h3>Cost = "+rs.getDouble("cost")+"</h3>");
      out.println("</div>");
      
      out.println("<div class='pricefooter'>");
        out.println("<div class='button'>");
            out.println(" <form class='modal-content' action='/BillingSystem/Administration/userAddedSuccessfully.jsp' method='Get'>");
        %>
        <input type="text" style="display: none" name="servicepackage" value="<%=rs.getInt(1)%>">
        <%
            
            out.println("<input type='submit' value='Submit'/>");
            out.println("</form>");
            

        out.println("</div>");

      out.println(" </div>");
       out.println("</div>");

     }

%>
      
  
<!--    <div class="pricetab">
      <h1> FREE </h1>
      <div class="price"> 
        <h2> Free </h2> 
      </div>
      <div class="infos">
        <h3> Premium Profile Listing </h3>
        <h3> Unlimited File Access </h3>
        <h3> Free Appointments </h3>
        <h3> 0 Bonus Points every month</h3>
        <h3> Customizable Profile Page</h3>
        <h3> 1 month support</h3>
      </div>
      
    </div>
        <div class="pricetab">
      <h1> FREE </h1>
      <div class="price"> 
        <h2> Free </h2> 
      </div>
      <div class="infos">
        <h3> Premium Profile Listing </h3>
        <h3> Unlimited File Access </h3>
        <h3> Free Appointments </h3>
        <h3> 0 Bonus Points every month</h3>
        <h3> Customizable Profile Page</h3>
        <h3> 1 month support</h3>
      </div>
        </div>-->
    
                      
                      </div>
    
 
</body>