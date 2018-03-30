<%-- 
    Document   : addNewCustomer
    Created on : Mar 28, 2018, 10:01:38 AM
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
        <title>New Customer</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="addNewCustomer.css">
    </head>

<body>
  <form class="modal-content" action="addNewCustomer" method="Post">
    <div class="container">
      <h1>New Customer</h1>
      <p>Please fill in this form to add new Customer.</p>
      <hr>
       <label for="msisdn"><b>Mobile Number</b></label>
      <input type="text" placeholder="Enter Mobile Nomber" name="msisdn" required>

      <label for="fname"><b>First Name</b></label>
      <input type="text" placeholder="Enter First Name" name="fname" required>
      
       <label for="f\lname"><b>Last Name</b></label>
      <input type="text" placeholder="Enter Last Name" name="lname" required>
      
       <label for="uname"><b>User Name</b></label>
      <input type="text" placeholder="Enter User Name" name="uname" required>

      <label for="password"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="password" required>

	  
      <label for="birthdate"><b> Birth date</b></label>
      <input type="text" placeholder="Enter Birth date" name="birthdate" required>
	  
	  <label for="email"><b>Email</b></label>
      <input type="text" placeholder="Enter Email" name="email" required>
	  
	
	   <label for="address"><b> Address</b></label>
      <input type="text" placeholder="Enter Address" name="address" required>
      
       <label for="profile"><b>Select Profile</b></label>
            
      <select name ="rateplane">
          <%
               Statement stmt;
    PreparedStatement prep;
    ResultSet rs;
     Connection connect=null;
           

        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException ex) {
         //  Logger.getLogger(addNewCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            connect = DriverManager.getConnection("jdbc:postgresql://localhost:5432/billing", "postgres", "1022591400");
        } catch (SQLException ex) {
         //   Logger.getLogger(addNewCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }

          stmt = connect.createStatement();
            String queryString = new String("Select * from rateplane;");
            
            rs = stmt.executeQuery(queryString);
            while(rs.next()){
            out.println("<option value='"+rs.getInt(1)+"'>"+rs.getString(2)+"</option>");
            }
          %>
      </select>
      
	  
	
      
    


    </div>
      <input type="submit" value="ADD"/>
  </form>
</body>
</html>

    