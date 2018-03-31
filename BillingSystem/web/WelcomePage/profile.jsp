<%@page import="java.sql.Statement"%>
<%@page import="DataBase.DatabaseHandler"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../Styling/header_footer/header.html" %>
<title>New Customer</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/BillingSystem/Styling/css/addNewCustomer.css">
<link rel="stylesheet" href="/BillingSystem/Styling/css/main.css">

</head>

<body>
    <form class="modal-content" action="history.jsp" method="post">
        <div class="container">
            <h1>Customer Profile</h1>
            <nav>
                <%
                    DatabaseHandler db1 = new DatabaseHandler();
                    DatabaseHandler db2 = new DatabaseHandler();
                    DatabaseHandler db3 = new DatabaseHandler();
                    DatabaseHandler db4 = new DatabaseHandler();
                    session.setAttribute("msisdn", request.getParameter("search"));
                    ResultSet getcustomerInfo = db1.getcustomerInfo(request.getParameter("search"));
                    ResultSet getServiceInfo = db1.getContractInfo(request.getParameter("search"));
                    ResultSet getallRatePlane = db3.getAllRatePlane();
                    getallRatePlane.next();

                    while (getcustomerInfo.next()) {
                %>
            </nav>
            <article>
                <div class="cont">
                    <label for="username"><b>User Name : </b></label>
                    <label for="usernameValue">
                        <%
                            session.setAttribute("name", getcustomerInfo.getString("fname") + " " + getcustomerInfo.getString("lname"));
                            out.println(getcustomerInfo.getString("uname"));


                        %>
                    </label>
                    <br/><br/>

                    <hr>
                    <label for="msisdn"><b>Mobile Number</b></label>
                    <input type="text" value="<%=request.getParameter("search")%> " name="msisdn" readonly >

                    <label for="fname"><b>First Name</b></label>
                    <input type="text" value="<%=getcustomerInfo.getString("fname")%>" name="fname" readonly>

                    <label for="f\lname"><b>Last Name</b></label>
                    <input type="text" value="<%=getcustomerInfo.getString("lname")%>" name="lname" readonly>

                    <label for="uname"><b>User Name</b></label>
                    <input type="text" value="<%=getcustomerInfo.getString("uname")%>" name="uname" readonly>

                    <label for="password"><b>Password</b></label>
                    <input type="password" value="<%=getcustomerInfo.getString("password")%>" name="password" readonly>


                    <label for="birthdate"><b> Birth date</b></label>
                    <input type="text" name="birthdate"  value="<%=getcustomerInfo.getString("birthdate")%>" readonly>   

                    <label for="email"><b>Email</b></label>
                    <input type="text" name="email" value="email" readonly>  

                    <label for="address"><b> Address</b></label>
                    <input type="text" value="<%=getcustomerInfo.getString("address")%>" name="address" readonly>
                    <%
                        while (getServiceInfo.next()) {
                            String pacakge = getServiceInfo.getString("packageid");

                            ResultSet getServiceMoreInfo = db2.getServiceMoreInfo(3);


                            while (getServiceMoreInfo.next()) {
                    %>
                    <label for="address"><b>Rate Plan</b></label>
                    <input type="text" value="<%=getallRatePlane.getString("name")%>" name="address" readonly>               

                    <label for="address"><b>Service Package</b></label>
                    <input type="text" value="<%=getServiceMoreInfo.getString(2)%>" name="address" readonly>

                    <label for="address"><b> Number of Minutes</b></label>
                    <input type="text" value="<%=getServiceMoreInfo.getString(4)%>" name="address" readonly>

                    <label for="address"><b> Number of SMS</b></label>
                    <input type="text" value="<%=getServiceMoreInfo.getString(5)%>" name="address" readonly>

                    <label for="address"><b> Number of Data</b></label>
                    <input type="text" value="<%=getServiceMoreInfo.getString(6)%>" name="address" readonly>

                    <label for="address"><b>COST</b></label>
                    <input type="text" value="<%=getServiceMoreInfo.getString(7)%>" name="address" readonly>
                    <%
                         ResultSet getallRService = db4.getAllrecuring_service(request.getParameter("search"));
                         while(getallRService.next()){
                             %>
                             <label for="address"><font color="red"><b>Recurring Service name</b></font></label>
                    <input type="text" value="<%=getallRService.getString("name")%>" name="address" readonly>
                    <label for="address"><b>Description</b></label>
                    <input type="text" value="<%=getallRService.getString("description")%>" name="address" readonly>
                    <label for="address"><b>Cost</b></label>
                    <input type="text" value="<%=getallRService.getString("cost")%>" name="address" readonly>
                    
                         <%
                         }
                        %>
                        <%
                         ResultSet getallOService = db4.getAllonetime_fee_service(request.getParameter("search"));
                         while(getallOService.next()){
                             %>
                    <label for="address"><font color="red"><b>One Time Service name</b></font></label>
                    <input type="text" value="<%=getallOService.getString("name")%>" name="address" readonly>
                    <label for="address"><b>Description</b></label>
                    <input type="text" value="<%=getallOService.getString("description")%>" name="address" readonly>
                    <label for="address"><b>Cost</b></label>
                    <input type="text" value="<%=getallOService.getString("cost")%>" name="address" readonly>
                    
                         <%
                         }
                        %>

                    <br>
                    <br>
                    <input class="button" type="submit" style="width: 100%;" value="SHOW HISTORY"/>
                     <a href="/BillingSystem/addRateplan/addNewServiceToCustomer.jsp?msisdn=<%=request.getParameter("search")%>" class="button"  style="width: 100%;" >ADD NEW SERVICE</a>
                     <a href="/BillingSystem/addRateplan/ShowAddedServices/ShowAddedServices.jsp?msisdn=<%=request.getParameter("search")%>" class="button"  style="width: 100%;" >DELETE ADDED SERVICE</a>
                </div>
                <%

                            }
                        }
                    }
                %>
                </form>
                </body>
                </html>


