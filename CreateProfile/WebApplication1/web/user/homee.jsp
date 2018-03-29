<%-- 
    Document   : userHomePage
    Created on : Feb 25, 2018, 8:39:42 PM
    Author     : MohamedSalah
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="DatabaseHandler.DatabaseHandler"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {margin:0;}

.navbar {
  overflow: hidden;
  background-color: #333;
  position: fixed;
  top: 0;
  width: 100%;
}

.navbar a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.navbar a:hover {
  background: #ddd;
  color: black;
}

.main {
  padding: 16px;
  margin-top: 30px;
  height: 1500px; /* Used in this example to enable scrolling */
}
</style>
`
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="css/search.css">
        <link rel="stylesheet" href="css/toptab.css">
        <link rel="stylesheet" href="css/aboutMe.css">
        <link rel="stylesheet" href="css/homePage.css">
        
</head>
<body>

    

<div class="navbar">
  <a href="#home">Home</a>
  <a href="#news">News</a>
  <a href="#contact">Contact</a>
  <a href="#home">Home</a>
  <a href="#news">News</a>
  <a href="#contact">Contact</a>
</div>

<div class="header" style="width:100% ;height: 600px ">
    <img class="mySlides" src="Img/SlideShowPic/1.jpg" style="width:100% ;height: 600px ">
    <img class="mySlides" src="Img/SlideShowPic/LOGO.jpg" style="width:100% ;height: 600px ">
   
    <!--</div>-->

    <script>
        var myIndex = 0;
        carousel();

        function carousel() {
            var i;
            var x = document.getElementsByClassName("mySlides");
            for (i = 0; i < x.length; i++) {
                x[i].style.display = "none";
            }
            myIndex++;
            if (myIndex > x.length) {
                myIndex = 1
            }
            x[myIndex - 1].style.display = "block";
            setTimeout(carousel, 2000); // Change image every 2 seconds
        }
    </script>

</div>

    
    
    
<div >
  
</div>

<div class="leftcolumn"> 
    <div class="card" >
        
    <%
           out.println("<p style='font-family:serif' align='center'><font size='6' color='black'>RATE PLANES</font></p>");
            int sectionId=0;
            DatabaseHandler dbHandler = new DatabaseHandler();
            
            ResultSet categories = dbHandler.getAllRatePlane();
            while (categories.next()) {
                sectionId++;
                
              out.println("<div class='fakeimg'><a style='text-decoration: none;' href='#section" + sectionId + "'  style='float:center'><button class='catbutton' style=' font-family:serif ;width:100%'><font size='6' color='white'>" + categories.getString(2).toUpperCase() + "</font></button></a></div>");
            }
        %>
    
<!--        <h3>Categories</h3>
        <div class="fakeimg"><a href="#C1"  style="float:left">
                <!input type="image"  id="catImg1" src="Img/mobileCat.png" alt="Submit"-- >Mobiles</a></div>
        <div class="fakeimg"><a href="#C2"  style="float:left"><!input type="image"  id="catImg2" src="Img/laptops.png" alt="Submit"-- >Laptops</a></div>
        <div class="fakeimg"><a href="#C3"  style="float:left"><!input type="image"  id="catImg3" src="Img/cameraCat.png" alt="Submit"-- >Cameras</a></div>-->
    </div>
        
    
<!--    <div class="card">
        <h3>Follow Me</h3>
        <p>Some text..</p>
    </div>-->
</div>
        


<div class="rightcolumn" >
    <%!
        String productName = "";
    %>
    <%
        int sectionId1 = 0;
        DatabaseHandler dbHandler1 = new DatabaseHandler();
        ResultSet categories1 = dbHandler1.getAllRatePlane();
        while (categories1.next()) {
            sectionId1++;
            out.println("<div class='card3' style='border-width:5px;  margin:5px; border-style:inset;border-color:#707694;'>");
    %>



    <%
        out.println("<a name='section" + sectionId1 + "'><p style='font-family:serif' align='center'><font size='6' color='black'>" + categories1.getString(2).toUpperCase() + "</font></p></a>");
        out.println("<div class='fakeimg grid-container' style='height:500px; overflow-y: scroll' >");
        ResultSet products = dbHandler1.getAllServicePackage(categories1.getString(2));
        while (products.next()) {
//            if (products.getInt(3) != 0) {
                productName = products.getString(2);
                out.println("<div class='grid-item'>");
////                out.println("<img src=" + products.getString(4) + ">");
                out.println("<br/>");
                
                out.println(products.getString(2).toUpperCase());
                out.println("<br/>");
                out.println("<br/>");
                out.println("<br/>");
                out.println("<br/>");
                
                out.println("<h4 style='font-family:Tahoma ;text-align: left'><font size='3' color='black'><b>Number Of Minutes: </b>" + products.getDouble(4) + "<b>Minutes</b></font></h4>");
                out.println("<h4 style='font-family:Tahoma ; text-align: left' ><font size='3' color='black'><b>Number Of SMS </b>" + products.getDouble(5) + "<b>SMS</b></font></h4>");
                out.println("<h4 style='font-family:Tahoma ;text-align: left'><font size='3' color='black'><b>Number Of Data </b>" + products.getDouble(6) + "<b>MigaBytes</b></font></h4>");
                out.println("<h4 style='font-family:Tahoma ; text-align: left' ><font size='3' color='black'><b>Cost of Service : </b>" +products.getDouble(7) + "<b>L.E</b></font></h4>");
    %>
   
        <%
                       out.println("</div>");
                //    }
                }
                out.println("</div>");
                 out.println("</div>");
            }
        %>
</div>
<script>
    function addToCart(productName) {
        document.location.href = "CartPage.jsp?productName=" + productName;
    }
    function showProductDescription(productName) {
        document.location.href = "productDescription.jsp?productName=" + productName;
    }
</script>
    
    
    
</body>
</html>
