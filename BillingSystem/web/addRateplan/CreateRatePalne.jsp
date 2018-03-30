<%-- 
    Document   : CreateRatePalne
    Created on : Mar 21, 2018, 11:35:45 AM
    Author     : AZIZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Rate Plan</title>
    </head>
    <body>
        <form action="ServicePacakge.jsp">
            ADD Rate Plan:<br>
            <input type="text" name="rateplan" required>
            <br>
            How Many Service Package you want to add:<br>
            <input type="number" name="numberofservicepakage" required>
            <br>
            <input type="submit" value="Submit">
        </form>
    </body>
</html>
