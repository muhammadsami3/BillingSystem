<%-- 
    Document   : Main Page
    Created on : Mar 21, 2018, 11:00:47 AM
    Author     : AZIZ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <title>W3.CSS Template</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="/BillingSystem/Styling/css/rateplanecss.css">


    <body>

        <div class="bgimg w3-display-container w3-animate-opacity w3-text-white">
            <div align="center">
                <h2>Welcome To Our System</h2>


                <form action="ratePlaneIntro.jsp">
                    <button class="btn2" onclick="">Add Rate Plan</button>
                </form>
                <br/>
                <form action="addNewService.jsp">
                    <button class="btn3" onclick="">ADD New Service</button>
                </form>
            </div>

        </div>

    </body>
</html>

