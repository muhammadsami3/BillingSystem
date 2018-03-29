<%-- 
    Document   : uploadCDR
    Created on : Mar 21, 2018, 10:43:35 AM
    Author     : root
--%>

<%@page import="DataBase.dbMethods"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.beans.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
<%@page import="javafx.stage.FileChooser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! String cdrLine;
    BufferedReader bufferedReader;
    String callingmsisdn, calledmsisdn, startTime;
    int serviceid;
    long unit;
    Double cost;
%>
<%

    String CDR = request.getParameter("CDR");

    try {
        File file = new File("/BillingSystem/CDR/"+CDR);
        bufferedReader = new BufferedReader(new FileReader(file));
        String line;
        while ((line = bufferedReader.readLine()) != null) {
            cdrLine = String.valueOf(line);

            String cdrInfo[] = cdrLine.split(",");
            for (int i = 0; i < cdrInfo.length; i++) {
                System.out.println("className.methodName()" + cdrInfo[i]);
            }
            callingmsisdn = cdrInfo[0];
            calledmsisdn = cdrInfo[1];
            serviceid = Integer.parseInt(cdrInfo[2]);
            unit = Long.parseLong(cdrInfo[3]);
            startTime = cdrInfo[4];
            cost = Double.parseDouble(cdrInfo[5]);
            dbMethods db = new dbMethods();
            db.connectToDatabase();
            if (serviceid != 3) {
                 cost = db.getCost(serviceid, callingmsisdn);
            }

            db.rating(cdrInfo[0], cdrInfo[1], cost, serviceid, unit, startTime);
            System.out.println("className.methodNames()" + callingmsisdn + calledmsisdn + serviceid + unit + startTime + cost);
        }
    } catch (IOException ex) {
        ex.printStackTrace();
    } finally {
        bufferedReader.close(); 
    }
    response.sendRedirect("/WebApplication1/WelcomePage.jsp");
%>

<!--
txt
Dial A, Dial B, Service ID, Duration/message/Volume, Start time, External charges
00201221234567,http://www.google.com,3,23167,10:03:20,10
00201221234567,00201001234567,1,100,10:03:20,0
Dial Format: 00201221234567
In case of Data, Dial B will be the URL
Service ID
Voice  1
SMS  2
Data  3
Duration  Seconds
Messages  (1,2,3,…)
Volume  Bytes
Time (HH[24]:MM:SS)
External fees in piasters
Name: CDRYYYYmmddHHMMSS
-->