<%@page import="java.sql.ResultSet"%>
<%@page import="DatabaseHandler.DatabaseHandler"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Profile</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

        <link rel="stylesheet" href="css/Profile.css">
        <link rel="stylesheet" href="css/search.css">
        <link rel="stylesheet" href="css/ProfilePageInfo.css">    
    </head>
    <body>

        <div class="container">
            <nav>
                <%
                    //out.println("hiiiiiii"+request.getParameter("search"));
                    DatabaseHandler db1 = new DatabaseHandler();
                    DatabaseHandler db2 = new DatabaseHandler();
                    ResultSet getcustomerInfo = db1.getcustomerInfo(request.getParameter("search"));
                    ResultSet getServiceInfo = db1.getContractInfo(request.getParameter("search"));

                    while (getcustomerInfo.next()) {

                        // }

                %>
            </nav>
            <article>
                <div class="cont">
                    <label for="username"><b>User Name : </b></label>
                    <label for="usernameValue">
                        <%                            out.println(getcustomerInfo.getString("uname"));

                        %>
                    </label>
                    <br/><br/><!--
                    -->                 <label for="firstname"><b>First Name : </b></label>
                    <label for="firstnameValue">
                        <%                            out.println(getcustomerInfo.getString("fname"));

                        %>
                    </label>
                    <br/><br/>
                    <label for="lastname"><b>Last Name : </b></label>
                    <label for="lastnameValue">
                        <%                            out.println(getcustomerInfo.getString("lname")
                            );

                        %>
                    </label>
                    <br/><br/>
                    <label for="password"><b>Password : </b></label>
                    <label for="passwordValue">
                        <%                            out.println("**********");
                        %>
                    </label>
                    <br/><br/>
                    <label for="email"><b>Email : </b></label>
                    <label for="emailValue">
                        <%
                            out.println(getcustomerInfo.getString("email")
                            );

                        %>
                    </label>
                    <br/><br/>

                    <label for="address"><b>Address : </b></label>
                    <label for="addressValue">
                        <%                            out.println(getcustomerInfo.getString("address")
                            );


                        %>
                    </label>
                    <br/><br/>

                    <label for="rateplane"><b>Rate Plane  : </b></label>
                    <label for="rateplaneValue">
                        <%                            while (getServiceInfo.next()) {
                                String pacakge = getServiceInfo.getString("packageid");
                                //out.println(pacakge);

                                ResultSet getServiceMoreInfo = db2.getServiceMoreInfo(3);

                                while (getServiceMoreInfo.next()) {
                                    out.println(getServiceMoreInfo.getString(3));
                        %>
                        <br/><br/>
                        <label for="address"><b>Name of Service Package : </b></label>
                        <label for="addressValue">
                            <%
                                out.println(getServiceMoreInfo.getString(2));
                            %>
                        </label>
                        <br/><br/>

                        <label for="address"><b>number of minutes: </b></label>
                        <label for="addressValue">
                            <%
                                out.println(getServiceMoreInfo.getString(4));
                            %>
                        </label>
                        <br/><br/>             

                        <label for="address"><b>number of SMS :</b></label>
                        <label for="addressValue">
                            <%
                                out.println(getServiceMoreInfo.getString(5));
                            %>
                        </label>
                        <br/><br/> 

                        <label for="address"><b>number of DATA : </b></label>
                        <label for="addressValue">
                            <%
                                out.println(getServiceMoreInfo.getString(6));
                            %>
                        </label>
                        <br/><br/> 

                        <label for="address"><b>cost: </b></label>
                        <label for="addressValue">
                            <%
                                out.println(getServiceMoreInfo.getString(7));
                            %>
                        </label>
                        <br/><br/> 

                        <%
                                    }
                                }
                            }
                        %>
                    </label>
                    <br/><br/>


                </div>  
            </article>
        </div>
        <br>


    </body>
</html>
