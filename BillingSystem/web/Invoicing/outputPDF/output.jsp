<%-- 
    Document   : Q1
    Created on : Feb 22, 2018, 12:53:54 PM
    Author     : AZIZ
--%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Random"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="DataBase.DatabaseHandler"%>
<%@page import="com.itextpdf.text.Rectangle"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DataBase.dbMethods"%>
<%@page import="com.itextpdf.text.Element"%>
<%@page import="com.itextpdf.text.ListItem"%>
<%@page import="com.itextpdf.text.List"%>
<%@page import="com.itextpdf.text.Chapter"%>
<%@page import="com.itextpdf.text.Section"%>
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@page import="com.itextpdf.text.Phrase"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.Chunk"%>
<%@page import="com.itextpdf.text.Image"%>
<%@page import="com.itextpdf.text.pdf.CMYKColor"%>
<%@page import="com.itextpdf.text.FontFactory"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.Anchor"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.itextpdf.text.PageSize"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="com.itextpdf.text.pdf.PdfDocument"%>
<%@page import="java.awt.Color" %>
<%!static int i = 0;
%>
<%
    Random rand = new Random(); 
int value = rand.nextInt(10000000);

    Document document = new Document(PageSize.A4, 50, 50, 50, 50);

    dbMethods db = new dbMethods();
    DatabaseHandler databaseHandler = new DatabaseHandler();
    db.connectToDatabase();

    String msisdn = (String) session.getAttribute("msisdn");
    msisdn = (msisdn == null) ? "00201221234567" : msisdn;
msisdn="00201221234567";
    ResultSet rs = db.getInvoice(msisdn);
    db.invoiced(msisdn);
    ResultSet PackageResultSet = db.getPackageInfo(msisdn);
    ResultSet clientInfoResultSet = databaseHandler.getcustomerInfo(msisdn);
    ResultSet rs2 = db.getRatePlaneInfo(msisdn);
    double voiceCost = db.getCost(1, msisdn);
    double smsCost = db.getCost(2, msisdn);
    double dataCost = db.getCost(3, msisdn);
    rs.next();
    rs2.next();
    PackageResultSet.next();
    clientInfoResultSet.next();
    String name = clientInfoResultSet.getString("fname") + " " + clientInfoResultSet.getString("lname");
    int eMints = Integer.parseInt(rs.getString("mins")) - Integer.parseInt(PackageResultSet.getString("numberofminutes"));
    int eSMS = Integer.parseInt(rs.getString("sms")) - Integer.parseInt(PackageResultSet.getString("numberofsms"));
    int eDATA = Integer.parseInt(rs.getString("data")) - Integer.parseInt(PackageResultSet.getString("numberofdata"));
    eMints = (eMints < 0) ? 0 : eMints;
    eSMS = (eSMS < 0) ? 0 : eSMS;
    eDATA = (eDATA < 0) ? 0 : eDATA;

    PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("e:\\bill" + value+ "."+name+".pdf"));
    
  session.setAttribute("path", "e:\\bill" + value+ "."+name+".pdf");
    document.open();
    Image image = Image.getInstance("/1.jpg");
    Image image1 = Image.getInstance("/LOGO.jpg");
    Image image2 = Image.getInstance("/iti.png");
    image.setAbsolutePosition(520f, 780f);
    image.scalePercent(40, 40);
    image1.setAbsolutePosition(10f, 780f);
    image1.scalePercent(12, 12);
    image2.setAbsolutePosition(270f, 780f);
    image2.scalePercent(50, 50);

    Paragraph title1 = new Paragraph("\nYour Bill ", FontFactory.getFont(FontFactory.HELVETICA, 15, Font.BOLDITALIC, new CMYKColor(0, 255, 255, 17)));
    Paragraph packagename = new Paragraph(""
            + "\nClient Name         : " + name
            + "\nClient Number     : " + msisdn
            + "\nRate Plane           : " + rs2.getString("name")
            + "\nService package : " + PackageResultSet.getString("name") + ""
            + "\n\n\n", FontFactory.getFont(FontFactory.HELVETICA, 10, Font.BOLDITALIC, new CMYKColor(0, 0, 0, 255)));
    title1.setAlignment(Element.ALIGN_CENTER);
    Paragraph title11 = new Paragraph("Voice Service ",
            FontFactory.getFont(FontFactory.HELVETICA, 11, Font.BOLD,
                    new CMYKColor(0, 255, 255, 17)));
    Chapter chapter1 = new Chapter(title1, 1);
    chapter1.add(packagename);
    chapter1.setNumberDepth(0);
    Section section1 = chapter1.addSection(title11);

    PdfPTable t = new PdfPTable(2);
    t.getDefaultCell().setBorder(PdfPCell.BOTTOM);
    t.setSpacingBefore(5);
    t.setSpacingAfter(5);

    PdfPCell c1 = new PdfPCell(new Phrase("Voice Calls"));
    c1.setBorder(PdfPCell.BOTTOM);
    t.addCell(c1);

    PdfPCell c2 = new PdfPCell(new Phrase(rs.getString("mins") + " Minutes"));
    c2.setBorder(PdfPCell.BOTTOM);
    t.addCell(c2);

    t.addCell("Cost/minute");
    t.addCell(String.valueOf(voiceCost) + " Piastre");

    t.addCell("Free Unit");
    t.addCell(PackageResultSet.getString("numberofminutes") + " Minutes");

    t.addCell("Extra units");
    t.addCell(String.valueOf(eMints) + " Minutes");

    t.addCell("Total cost");
    
    t.addCell(rs.getString("callsum")+"  E£");

    section1.add(t);

    Paragraph title12 = new Paragraph("SMS",
            FontFactory.getFont(FontFactory.HELVETICA, 11, Font.BOLD,
                    new CMYKColor(0, 255, 255, 17)));
    Section section2 = chapter1.addSection(title12);

    PdfPTable t2 = new PdfPTable(2);
    t2.getDefaultCell().setBorder(PdfPCell.BOTTOM);

    t2.setSpacingBefore(5);
    t2.setSpacingAfter(5);

    PdfPCell c3 = new PdfPCell(new Phrase("SMS "));
    c3.setBorder(PdfPCell.BOTTOM);
    t2.addCell(c3);

    PdfPCell c4 = new PdfPCell(new Phrase(rs.getString("sms") + " Message"));
    c4.setBorder(PdfPCell.BOTTOM);
    t2.addCell(c4);

    t2.addCell("Cost/Message");
    t2.addCell(String.valueOf(smsCost) + " piastre");

    t2.addCell("Free Unit of the service");
    t2.addCell(PackageResultSet.getString("numberofsms") + " Message");

    t2.addCell("Extra units");
    t2.addCell(String.valueOf(eSMS) + " Message   ");

    t2.addCell("Total Cost");
    t2.addCell(rs.getString("smssum") + "  E£");

    section2.add(t2);

    Paragraph title13 = new Paragraph("Data ",
            FontFactory.getFont(FontFactory.HELVETICA, 11, Font.BOLD,
                    new CMYKColor(0, 255, 255, 17)));
//Chapter chapter3 = new Chapter(title1, 3);
//chapter3.setNumberDepth(2);
    Section section3 = chapter1.addSection(title13);

    PdfPTable t3 = new PdfPTable(2);
    t3.setSpacingBefore(5);
    t3.setSpacingAfter(5);
    t3.getDefaultCell().setBorder(PdfPCell.BOTTOM);
    PdfPCell c5 = new PdfPCell(new Phrase("Usage "));
    c5.setBorder(PdfPCell.BOTTOM);
    t3.addCell(c5);
    double megas = Double.parseDouble(rs.getString("data")) / 1000;

    PdfPCell c6 = new PdfPCell(new Phrase(megas + " Mega    "));
    c6.setBorder(PdfPCell.BOTTOM);
    t3.addCell(c6);

    t3.addCell("Cost/Byte");
    t3.addCell(String.valueOf(dataCost) + " piastre");
    megas = Double.parseDouble(PackageResultSet.getString("numberofdata")) / 1000;

    t3.addCell("Free Unit");
    t3.addCell(megas + " Mega");
    t3.addCell("Extra units");
    megas = Double.parseDouble(String.valueOf(eDATA)) / 1000;

    t3.addCell(megas + " Mega");

    t3.addCell("Total Cost");
    t3.addCell(rs.getString("datasum")+"  E£");

    section3.add(t3);
    //add recuring servicess

    Paragraph title14 = new Paragraph("Recuring service ",
            FontFactory.getFont(FontFactory.HELVETICA, 11, Font.BOLD,
                    new CMYKColor(0, 255, 255, 17)));

    Section section4 = chapter1.addSection(title14);

    PdfPTable t4 = new PdfPTable(1);
    t4.getDefaultCell().setBorder(PdfPCell.BOTTOM);
    t4.setSpacingBefore(5);
    t4.setSpacingAfter(5);
    ResultSet rs3 = databaseHandler.getAllrecuring_service(msisdn);
        double cost2=0;

    while (rs3.next()) {
        t4.addCell("service Name" + rs3.getString("name"));
        t4.addCell("Costs " + rs3.getString("cost") + " E£");
        double temp=Double.parseDouble(rs3.getString("cost"));
        cost2+=temp;
    }

    section4.add(t4);

    Paragraph title15 = new Paragraph("one time fee service/s",
            FontFactory.getFont(FontFactory.HELVETICA, 11, Font.BOLD,
                    new CMYKColor(0, 255, 255, 17)));

    Section section5 = chapter1.addSection(title15);

    PdfPTable t5 = new PdfPTable(1);
    t5.getDefaultCell().setBorder(PdfPCell.BOTTOM);
    t5.setSpacingBefore(5);
    t5.setSpacingAfter(5);

    ResultSet rs4 = databaseHandler.getAllonetime_fee_service(msisdn);
    double cost1=0;
    while (rs4.next()) {
        t5.addCell("service Name " + rs4.getString("name"));
        t5.addCell("Costs " +rs4.getString("cost") + " E£");
        double temp=Double.parseDouble(rs4.getString("cost"));
        cost1+=temp;
    }
   int id=databaseHandler.getContractId(msisdn);
   databaseHandler.onetime_fee_service_remove(id);
    
double cost=Double.parseDouble(rs.getString("finalcost"));
    section5.add(t5);
   cost = cost + cost1*1.1 +cost2*1.1;
    
    DecimalFormat df2 = new DecimalFormat(".##");
    cost=Double.parseDouble(df2.format(cost));
    Paragraph title16 = new Paragraph("\n\nTotal Cost : " + cost + " E£",
            FontFactory.getFont(FontFactory.HELVETICA, 18, Font.BOLD,
                    new CMYKColor(0, 255, 255, 100)));
title16.setAlignment(Element.ALIGN_CENTER);
    chapter1.add(title16);
       Paragraph title17 = new Paragraph("\n\nAdded Taxes: 10%",
            FontFactory.getFont(FontFactory.HELVETICA, 8, Font.BOLD,
                    new CMYKColor(0, 255, 255, 255)));
    chapter1.add(title17);


%>

<%    document.add(chapter1);

    writer.getDirectContent().addImage(image);
    writer.getDirectContent().addImage(image1);
    writer.getDirectContent().addImage(image2);
    document.close();
    
    db.invoice_record(msisdn, (String)session.getAttribute("path"), cost);
    response.sendRedirect("/BillingSystem/Invoicing/outputPDF/fileDownload.jsp?path="+(String)session.getAttribute("path"));
%>
