<%-- 
    Document   : addNewService
    Created on : Mar 25, 2018, 2:30:07 PM
    Author     : AZIZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="/BillingSystem/AddNewServiceInfo">
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
        </form>
    </body>
</html>
