<%-- 
    Document   : invoices
    Created on : Mar 31, 2018, 10:17:47 PM
    Author     : AZIZ
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
    ResultSet rscall = db.getInvoiceRecord(msisdn);


%>

<div class="limiter">
    <div class="container-table100" style="margin-top: 0px;">
        <div class="wrap-table100">
            <div class="table100 ver1 m-b-110">
                <table data-vertable="ver1">
                    <thead>
                        <tr class="row100 head">     
                            <th class="column100 column2" data-column="column2" colspan="5"
                                style="text-align: center;">Invoice History</th>
                        </tr>

                        <tr class="row100 head">
                            <th class="column100 column1" data-column="column1">Bill number</th>
                            <th class="column100 column2" data-column="column2">Date</th>
                            <th class="column100 column3" data-column="column3">Download</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <% int i=0;
                            while (rscall.next()) {%>
                        <%
                            i++;
                            
                            String time = rscall.getString("date");
                            %>
                        <tr class="row100">
                        
                            <td class="column100 column1" data-column="column1"><%=i %></td>
                            <td class="column100 column2" data-column="column2"><%=time %></td>
                            <td class="column100 column4" data-column="column3">
                                <form Method="post" action="/BillingSystem/Invoicing/outputPDF/fileDownload.jsp">
                                    <input type="submit" value="Download File ">  <i class="fa fa-download"></i>
                                    <input type="text" name="path" value="<%=rscall.getString("path_of_file")%>" style="display: none" readonly>
                                </form>
                            </td>
                        </tr>

                        <%   }
                        %>

                    </tbody>
                </table>
                <br>
                <br>
                        
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