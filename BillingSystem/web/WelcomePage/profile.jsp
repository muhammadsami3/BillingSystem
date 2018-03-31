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
                    session.setAttribute("msisdn", request.getParameter("search"));
                    ResultSet getcustomerInfo = db1.getcustomerInfo(request.getParameter("search"));
                    ResultSet getServiceInfo = db1.getContractInfo(request.getParameter("search"));
                    ResultSet getallRatePlane = db3.getAllRatePlane();

                    while (getcustomerInfo.next()) {
                %>
            </nav>
                <hr>
                <label for="msisdn"><b>Mobile Number</b></label>
                <input type="text" value="<%=request.getParameter("search")%> " name="msisdn" required >

                <label for="fname"><b>First Name</b></label>
                <input type="text" value="<%=getcustomerInfo.getString("fname")%>" name="fname" required>

                <label for="f\lname"><b>Last Name</b></label>
                <input type="text" value="<%=getcustomerInfo.getString("lname")%>" name="lname" required>

                <label for="uname"><b>User Name</b></label>
                <input type="text" value="<%=getcustomerInfo.getString("uname")%>" name="uname" required>

                <label for="password"><b>Password</b></label>
                <input type="password" value="<%=getcustomerInfo.getString("password")%>" name="password" required>


                <label for="birthdate"><b> Birth date</b></label>
                <input type="text" name="birthdate"  value="<%=getcustomerInfo.getString("birthdate")%>" required>   

                <label for="email"><b>Email</b></label>
                <input type="text" name="email" value="email" required>  

                <label for="address"><b> Address</b></label>
                <input type="text" value="<%=getcustomerInfo.getString("address")%>" name="address" required>
                 <%                           
                            while (getServiceInfo.next()) {
                            String pacakge = getServiceInfo.getString("packageid");

                            ResultSet getServiceMoreInfo = db2.getServiceMoreInfo(3);

                              
   
while (getServiceMoreInfo.next()) {
%>
                <label for="address"><b> Name of Service Package</b></label>
                <input type="text" value="<%=getServiceMoreInfo.getString(2)%>" name="address" required>

                <label for="address"><b> Number of Minutes</b></label>
                <input type="text" value="<%=getServiceMoreInfo.getString(4)%>" name="address" required>
                
                <label for="address"><b> Number of SMS</b></label>
                <input type="text" value="<%=getServiceMoreInfo.getString(5)%>" name="address" required>
                
                <label for="address"><b> Number of Data</b></label>
                <input type="text" value="<%=getServiceMoreInfo.getString(6)%>" name="address" required>
                
                <label for="address"><b>COST</b></label>
                <input type="text" value="<%=getServiceMoreInfo.getString(7)%>" name="address" required>

                
                <br>
                <br>
                <input class="button" type="submit" style="width: 100%;" value="SHOW HISTORY"/>
            </div>
<%
    
                                    }
                                }
                            }
                        %>
        </form>
    </body>
</html>

