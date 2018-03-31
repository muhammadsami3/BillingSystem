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
<%@include file="../../Styling/header_footer/header.html" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; chagetallRServiceet=UTF-8">
        <title>JSP Page</title>
        <link href='https://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="/BillingSystem/Administration/table/tablecss.css">
        <link href='https://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>

    </head>
   
<body>
  <h1 class="title"> Service Packages</h1>
  
  
    
      <%
                        DatabaseHandler db4 = new DatabaseHandler();
                        ResultSet getallRService = db4.getAllrecuring_service(request.getParameter("msisdn"));
//                         while(getallRService.next()){
                    %>
                      <div id="container">
                                               

                    <%
   while (getallRService.next()) {
       
      out.println("<div class='pricetab'>");
      out.println("<h1>Service Package</h1>");
                out.println("<div class='price'>"); 
                out.println("<font align-self: center;font-size: x-large;font-style: bold;font-weight: bold;color: white;bottom: -8%;padding-top: 0px;margin-top: 0px;"
                        + ">"+getallRService.getString("name")+"</font>"); 
                out.println("</div>");
      out.println("<div class='infos'>");
        out.println("<h3>Description : "+getallRService.getString("description")+"</h3>");
        out.println("<h3>Cost= "+getallRService.getString("cost")+"</h3>");
        
      out.println("</div>");
      
      out.println("<div class='pricefooter'>");
        out.println("<div class='button'>");
            out.println(" <form class='modal-content' action='/BillingSystem/DeleteAddedService' method='Get'>");
        %>
        <input type="text" style="display: none" name="serviceid" value="000">
        <%
            
            out.println("<input type='submit' value='DELETE'/>");
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