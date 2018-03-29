<%-- 
    Document   : selectServicePackage
    Created on : Mar 28, 2018, 3:32:39 PM
    Author     : ahmed
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Service Package</title>
    </head>
    <body>
         <form class="modal-content" action="userAddedSuccessfully.jsp?msisdn=" method="Get">
    <div class="container">
         <label for="servicepackage"><b>Select Service Package</b></label>
            
      <select name ="servicepackage">
          <%
               Statement stmt;
    PreparedStatement prep;
    ResultSet rs;
     Connection connect=null;
     int rateplaneid=0; 
     int msisdn=0;

        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException ex) {
         
        }
        try {
            connect = DriverManager.getConnection("jdbc:postgresql://localhost:5432/billing", "postgres", "postgre");
        } catch (SQLException ex) {
         
        }
          rateplaneid = Integer.parseInt(request.getParameter("rateplaneid"));
          msisdn=Integer.parseInt(request.getParameter("msisdn"));
          stmt = connect.createStatement();
            String queryString = new String("Select * from servicepackage where rateplaneid='" + rateplaneid + "';");
            
            rs = stmt.executeQuery(queryString);
            while(rs.next()){
            out.println("<option value='"+rs.getInt(1)+"'>"+rs.getString(2)+"</option>");
            }
          %>
      </select>
      
	  
    </div>
      <input type="submit" value="Submit"/>
  </form>
	
    </body>
</html>
