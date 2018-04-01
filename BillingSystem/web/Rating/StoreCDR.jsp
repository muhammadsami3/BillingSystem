<%-- 
    Document   : uploadCDR
    Created on : Mar 21, 2018, 10:43:35 AM
    Author     : root
--%>

<%@page import="links.linkto"%>
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

    try {
        String CDR = (String) session.getAttribute("cdr");

        ServletContext context = pageContext.getServletContext();
        String cdrPath = context.getInitParameter("file-upload");
        File file = new File(cdrPath + CDR);
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

            if (serviceid == 1) {
                unit =(int)Math.ceil((double) unit / 60);
//          double newUnit=(double)unit;
//          newUnit=cell
//          newUnit/=60;
//          unit=(int)newUnit;
            }

            if (serviceid != 3) {
                cost = db.getCost(serviceid, callingmsisdn);
                cost *= unit;
            }

            System.out.println("className.methodName()" + cost);
            db.rating(cdrInfo[0], cdrInfo[1], cost, serviceid, unit, startTime);
            System.out.println("className.methodNames()" + callingmsisdn + calledmsisdn + serviceid + unit + startTime + cost);
        }
    } catch (IOException ex) {
        ex.printStackTrace();
    } finally {
        bufferedReader.close();
        session.setAttribute("stored", "y");
    }
    response.sendRedirect(linkto.ratePage);
%>
