<%-- 
    Document   : history
    Created on : Mar 30, 2018, 4:36:17 PM
    Author     : Muhammad Sami
--%>

<%@page import="java.math.BigDecimal"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DataBase.dbMethods"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../Styling/header_footer/header.html" %>

<%
    String msisdn = (String) session.getAttribute("msisdn");
    String name = (String) session.getAttribute("name");
    msisdn = (msisdn==null)?"00201022591400":msisdn;
    dbMethods db = new dbMethods();
    db.connectToDatabase();
    ResultSet rscall = db.getContractHistory(msisdn, 1);
    ResultSet rssms = db.getContractHistory(msisdn, 2);
    ResultSet rsdata = db.getContractHistory(msisdn, 3);


%>

<div class="limiter">
    <div class="container-table100" style="margin-top: 69px;">
        <div class="wrap-table100">
            <div class="table100 ver1 m-b-110">
                <table data-vertable="ver1">
                    <thead>
                        <tr class="row100 head">     
                            <th class="column100 column2" data-column="column2" colspan="5"
                                style="text-align: center;">Call History</th>
                        </tr>

                        <tr class="row100 head">
                            <th class="column100 column2" data-column="column2">Dial B</th>
                            <th class="column100 column3" data-column="column3">Time</th>
                            <th class="column100 column4" data-column="column4">Start Date</th>
                            <th class="column100 column5" data-column="column5">Duration</th>
                            <th class="column100 column6" data-column="column6">Cost</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% while (rscall.next()) {%>
                        <%
                            int totalSecs = Integer.parseInt(rscall.getString("unit"));
                            int hours = totalSecs / 3600;
                            int minutes = (totalSecs % 3600) / 60;
                            int seconds = totalSecs % 60;
                            String time = rscall.getString("timezone");
                            String timearr[] = time.split(" ");
                            System.out.println("className.methodName()" + timearr[0] + time);
                            String timeString = String.format("%02d:%02d:%02d", hours, minutes, seconds);%>
                        <tr class="row100">
                            <td class="column100 column1" data-column="column1"><%=rscall.getString("calledmsisdn")%></td>
                            <td class="column100 column2" data-column="column2"><%=timearr[0]%></td>
                            <td class="column100 column3" data-column="column3"><%=rscall.getString("startdate")%></td>
                            <td class="column100 column4" data-column="column4"><%=timeString%></td>
                            <td class="column100 column5" data-column="column5"><%=rscall.getString("cost")%></td>
                        </tr>

                        <%   }
                        %>

                    </tbody>
                </table>
                <br>
                <br>
                        
                <table data-vertable="ver1">
                    <thead>
                        <tr class="row100 head">     
                            <th class="column100 column2" data-column="column2" colspan="5"
                                style="text-align: center; border-bottom: 1px solid;">Data Usage History</th>
                        </tr>


                        <tr class="row100 head">
                            <th class="column100 column2" data-column="column2">Url</th>
                            <th class="column100 column3" data-column="column3">Time</th>
                            <th class="column100 column4" data-column="column4">Start Date</th>
                            <th class="column100 column5" data-column="column5">Megabyte</th>
                            <th class="column100 column6" data-column="column6">Cost</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% while (rsdata.next()) {%>
                        <%
                            double bytes = Double.parseDouble(rsdata.getString("unit"));
                            double megas = bytes / 1000;
                            String time = rsdata.getString("timezone");
                            String timearr[] = time.split(" ");
                            System.out.println("className.methodName()" + timearr[0] + time);%>
                            
                        <tr class="row100">
                            <td class="column100 column1" data-column="column1"><%=rsdata.getString("calledmsisdn")%></td>
                            <td class="column100 column2" data-column="column2"><%=timearr[0]%></td>
                            <td class="column100 column3" data-column="column3"><%=rsdata.getString("startdate")%></td>
                            <td class="column100 column4" data-column="column4"><%=megas+" M"%></td>
                            <td class="column100 column5" data-column="column5"><%=rsdata.getString("cost")%></td>
                        </tr>

                        <%   }
                        %>

                    </tbody>
                </table>
                        
                        <br>
                        <br>
                         <table data-vertable="ver1">
                    <thead>
                        <tr class="row100 head">     
                            <th class="column100 column2" data-column="column2" colspan="5"
                                style="text-align: center; border-bottom: 1px solid;">SMS History</th>
                        </tr>


                        <tr class="row100 head">
                            <th class="column100 column2" data-column="column2">Dial B</th>
                            <th class="column100 column3" data-column="column3">Time</th>
                            <th class="column100 column4" data-column="column4">Start Date</th>
                            <th class="column100 column5" data-column="column5">SMSs</th>
                            <th class="column100 column6" data-column="column6">Cost</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% while (rssms.next()) {%>
                        <%
                            int sms =Integer.parseInt(rssms.getString("unit"));
                            String time = rssms.getString("timezone");
                            String timearr[] = time.split(" ");
                            System.out.println("className.methodName()" + timearr[0] + time);%>
                            
                        <tr class="row100">
                            <td class="column100 column1" data-column="column1"><%=rssms.getString("calledmsisdn")%></td>
                            <td class="column100 column2" data-column="column2"><%=timearr[0]%></td>
                            <td class="column100 column3" data-column="column3"><%=rssms.getString("startdate")%></td>
                            <td class="column100 column4" data-column="column4"><%=sms%></td>
                            <td class="column100 column5" data-column="column5"><%=rssms.getString("cost")%></td>
                        </tr>

                        <%   }
                        %>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>



<link rel="stylesheet" type="text/css" href="/BillingSystem/Styling/Table_Highlight_Vertical_Horizontal/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/BillingSystem/Styling/Table_Highlight_Vertical_Horizontal/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="/BillingSystem/Styling/Table_Highlight_Vertical_Horizontal/vendor/animate/animate.css">
<link rel="stylesheet" type="text/css" href="/BillingSystem/Styling/Table_Highlight_Vertical_Horizontal/vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css" href="/BillingSystem/Styling/Table_Highlight_Vertical_Horizontal/vendor/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" type="text/css" href="/BillingSystem/Styling/Table_Highlight_Vertical_Horizontal/css/util.css">
<link rel="stylesheet" type="text/css" href="/BillingSystem/Styling/Table_Highlight_Vertical_Horizontal/css/main.css">

<%@include file="../Styling/header_footer/footer.html" %>