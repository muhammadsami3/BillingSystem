<%-- 
    Document   : userAddedSuccessful.jsp
    Created on : Mar 28, 2018, 5:59:38 PM
    Author     : ahmed
--%>

<%@page import="links.linkto"%>
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
        <title>Customer Added Successfully</title>
    </head>
    <body>
        <h1 align = center>congratulation , Customer Added Successfully</h1>
        <%
            PreparedStatement prep;
            Connection connect = null;

            try {
                Class.forName("org.postgresql.Driver");
                connect = DriverManager.getConnection(linkto.DB, linkto.databaseUser, linkto.dbPasswd);

            } catch (Exception e) {
                e.printStackTrace();
                System.out.println(e.getMessage());
            }
            int Customerid = (int) session.getAttribute("customerid");
            String msisdn = (String) session.getAttribute("msisdn");
            String queryString = new String("Insert into contract(Customerid,msisdn,packageid)values(?,?,?)");
            prep = connect.prepareStatement(queryString);
            prep.setInt(1, Customerid);
            prep.setString(2, msisdn);
            prep.setInt(3, Integer.parseInt(request.getParameter("servicepackage")));
            prep.execute();

        %>

    </body>
</html>
