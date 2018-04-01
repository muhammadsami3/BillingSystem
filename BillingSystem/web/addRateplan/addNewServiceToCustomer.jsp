<%-- 
    Document   : addNewService
    Created on : Mar 25, 2018, 2:30:07 PM
    Author     : AZIZ
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="links.linkto"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>ADD  NEW SERVICE</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->
        <link rel="icon" type="image/png" href="/BillingSystem/Styling/images/icons/favicon.ico"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="/BillingSystem/Styling/vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="/BillingSystem/Styling/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="/BillingSystem/Styling/vendor/animate/animate.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="/BillingSystem/Styling/vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="/BillingSystem/Styling/vendor/select2/select2.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="/BillingSystem/Styling/css/util.css">
        <link rel="stylesheet" type="text/css" href="/BillingSystem/Styling/css/main.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <link rel="stylesheet" href="/BillingSystem/Styling/css/rateplanecss.css">
<link rel="stylesheet" href="/BillingSystem/Styling/css/addNewCustomer.css">
        <link rel="stylesheet" href="/BillingSystem/Styling/css/main.css">        
        <!--===============================================================================================-->
        <%@include file="../Styling/header_footer/header.html" %>
    </head>
    <body>

        <div class="bg-contact2" style="background-image: url('/BillingSystem/Styling/images/bg.jpg');">
            <div class="container-contact2" style="
                 padding-top: 68px;
                 ">
                <div class="wrap-contact2">
                    <form class="contact2-form validate-form" action="/BillingSystem/AddNewServiceInfoToCustomer">
                        <span class="contact2-form-title">
                            ADD NEW SERVICE
                        </span>

                        <div class="wrap-input2 validate-input" data-validate="Number is required">
                            <input class="input2" type="text" name="numbermsisdn" value="<%=request.getParameter("msisdn")%>" readonly>
                            <span class="focus-input2" data-placeholder="Enter Number"></span>
                        </div>

                        <label for="profile"><b>Select Recurring Service</b></label>
                        <div class="selectWrapper">
                            <select  name ="serviceType">
                                <%
                                    Statement stmt;
                                    PreparedStatement prep;
                                    ResultSet rs;
                                    ResultSet rs1;
                                    Connection connect = null;

                                    try {
                                        Class.forName("org.postgresql.Driver");
                                        connect = DriverManager.getConnection(linkto.DB, linkto.databaseUser, linkto.dbPasswd);

                                    } catch (Exception e) {
                                        e.printStackTrace();
                                        System.out.println(e.getMessage());
                                    }
                                    stmt = connect.createStatement();
                                    String queryString = new String("Select * from added_service where type='recurring'");
                                    String queryString1 = new String("Select * from added_service where type='recurring'");

                                    rs = stmt.executeQuery(queryString);
                                   
                                    while (rs.next()) {
                                        out.println("<option value='recurring' >"+rs.getString(2)+"</option>");
                                    }
                                     rs1 = stmt.executeQuery(queryString1);
                                    while (rs1.next()) {
                                        out.println("<input type='text' style='display:none' name='serviceName' value='"+rs1.getString(2)+"' required>");
                                      
                                    }
                                %>
                            </select>
                        </div>







                        <div class="container-contact2-form-btn">
                            <div class="wrap-contact2-form-btn">
                                <div class="contact2-form-bgbtn"></div>
                                <button class="contact2-form-btn">
                                    SUBMIT
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>



        <%@include file="../Styling/header_footer/footer.html" %>


        <!--        <form action="/BillingSystem/AddNewServiceInfo">
                    Enter Name of The Service:<br>
                    <input type="text" name="serviceName" required><br>
                    Choose type The Service:<br>
                    <input type="radio" name="serviceType" value="recurring" checked>Recurring<br>
                    <input type="radio" name="serviceType" value="onetime">One Time Fee<br>
                    Cost of this service:<br>
                    <input type="number" name="cost" required><br>
                    Description of this service:<br>
                    <input type="text" name="description" required><br>
                    <input type="submit" value="Submit">
                </form>-->
    </body>
</html>
