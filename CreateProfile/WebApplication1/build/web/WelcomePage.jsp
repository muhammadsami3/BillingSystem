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
    <style>
        body,h1 {font-family: "Raleway", sans-serif}
        body, html {height: 100%}
        .bgimg {
            background-image: url('bg.jpg');
            min-height: 100%;
            background-position: center;
            background-size: cover;
        }
        .btn1 {
            position: absolute;
            top: 70%;
            left: 30%;
            transform: translate(-50%, -50%);
            -ms-transform: translate(-50%, -50%);
            background-color: #f1f1f1;
            color: black;
            font-size: 16px;
            padding: 16px 30px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            text-align: center;
        }

        .btn1:hover {
            background-color: orange;
            color: white;
        }
        .btn2 {
            position: absolute;
            top: 70%;
            left: 50%;
            transform: translate(-50%, -50%);
            -ms-transform: translate(-50%, -50%);
            background-color: #f1f1f1;
            color: black;
            font-size: 16px;
            padding: 16px 30px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            text-align: center;
        }

        .btn2:hover {
            background-color: orange;
            color: white;
        }
        .btn3 {
            position: absolute;
            top: 70%;
            left: 70%;
            transform: translate(-50%, -50%);
            -ms-transform: translate(-50%, -50%);
            background-color: #f1f1f1;
            color: black;
            font-size: 16px;
            padding: 16px 30px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            text-align: center;
        }

        .btn3:hover {
            background-color: orange;
            color: white;
        }
        h2{
            position: absolute;
            top: 40%;
            left: 40%;
        }
    </style>
    <body>

        <div class="bgimg w3-display-container w3-animate-opacity w3-text-white">
            <div align="center">
                <h2>Welcome To Our System</h2>
                <!--                <hr class="w3-border-grey" style="margin:auto;width:40%">-->
                <!--    <p class="w3-large w3-center">35 days left</p>-->
                <br/>
                <form action="Rating/p2/index.html">
                    <button class="btn1">Rating</button>
                </form>
                <br/>
                
                <form action="MainPage.jsp">
                    <button class="btn3" onclick="">Create Profile</button>
                </form>
            </div>

        </div>

    </body>
</html>

