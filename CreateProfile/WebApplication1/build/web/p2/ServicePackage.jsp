<%-- 
    Document   : ServicePacakge
    Created on : Mar 21, 2018, 6:29:54 PM
    Author     : AZIZ
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="DatabaseHandler.DatabaseHandler"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <font style="size: 20px">Your Rate Plan is :  </font>
        <font style="size: 20px; color:orange">
        <%
            String ratePlane = request.getParameter("rateplan");
            out.print(ratePlane);
            DatabaseHandler db = new DatabaseHandler();
            String ratePlanName = request.getParameter("rateplan");
            db.addRatePlan(ratePlanName);
        %>
        </font>
        <%
            String number = request.getParameter("numberofservicepakage");
            int numberOfServicePakage = Integer.parseInt(number);
            int i = 0;
            while (i < numberOfServicePakage) {
                i++;
                //out.println("numbeeeeeeeer is "+numberOfServicePakage);

                out.println("<h3>Add Your Service Package number " + i + ":  </h3>");
                out.println("<form action='AddInfo'>");
                out.println(" Service Package Name:<br>");
                out.println("<input type='text' name='ServicePackageName" + i + "' required>");
                out.println("<br>");
                out.println("Costs Of Whole Pakage:<br>");
                out.println("<input type='text' name='costs" + i + "' required> L.E");
                out.println("<br>");
                out.println("number OF Minutes:<br>");
                out.println("<input type='number' name='numberOFMinutes" + i + "' required>Minutes");
                out.println("<br>");
                out.println("Cost OF Minutes:<br>");
                out.println("<input type='number' name='costOFMinutes" + i + "' required>L.E");
                out.println("<br>");
                out.println("number OF SMS:<br>");
                out.println("<input type='number' name='numberOFSMS" + i + "' required>Number of SMS");
                out.println("<br>");
                out.println("Cost OF SMS:<br>");
                out.println("<input type='number' name='costOFSMS" + i + "' required>L.E");
                out.println("<br>");
                out.println("number OF DATA:<br>");
                out.println("<input type='number' name='numberOFDATA" + i + "' required>MegaBytes");
                out.println("<br>");
                out.println("Cost OF Data:<br>");
                out.println("<input type='number' name='costOFDATA" + i + "' required>L.E");
                out.println("<br>");
                out.println("<br>");
                out.println("<br>");
                out.println("<br>");
            }
            out.println("<input type='hidden' name='rateplan' value='" + ratePlane + "' required>");
            out.println("<input type='hidden' name='numberofservicepakage' value='" + number + "' required>");
        %>
        <input type="submit" value="Submit">
    </form> 
</body>
</html>
