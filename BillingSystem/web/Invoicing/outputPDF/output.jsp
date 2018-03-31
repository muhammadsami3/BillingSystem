<%-- 
    Document   : Q1
    Created on : Feb 22, 2018, 12:53:54 PM
    Author     : AZIZ
--%>
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
<%    Document document = new Document(PageSize.A4, 50, 50, 50, 50);

    dbMethods db = new dbMethods();
    db.connectToDatabase();
    ResultSet rs = db.getInvoice("00201022591400");
    ResultSet PackageResultSet = db.getPackageInfo("00201022591400");
    double voiceCost = db.getCost(1, "00201022591400");
    double smsCost = db.getCost(2, "00201022591400");
    double dataCost = db.getCost(3, "00201022591400");
    rs.next();
    PackageResultSet.next();
    int eMints = Integer.parseInt(rs.getString("mins")) - Integer.parseInt(PackageResultSet.getString("numberofminutes"));
    int eSMS = Integer.parseInt(rs.getString("sms")) - Integer.parseInt(PackageResultSet.getString("numberofsms"));
    int eDATA = Integer.parseInt(rs.getString("data")) - Integer.parseInt(PackageResultSet.getString("numberofdata"));
    PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("e:\\text2.pdf"));
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

    Paragraph title1 = new Paragraph("Welcome To Our Company", FontFactory.getFont(FontFactory.HELVETICA, 18, Font.BOLDITALIC, new CMYKColor(0, 255, 255, 17)));
    Paragraph packagename = new Paragraph("Service package : " + PackageResultSet.getString("name"), FontFactory.getFont(FontFactory.HELVETICA, 14, Font.BOLDITALIC, new CMYKColor(0, 255, 255, 17)));
    title1.setAlignment(Element.ALIGN_CENTER);
    Paragraph title11 = new Paragraph("Voice Service ",
            FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD,
                    new CMYKColor(0, 255, 255, 17)));
    Chapter chapter1 = new Chapter(title1, 1);
   chapter1.add(packagename);
    chapter1.setNumberDepth(0);
    Section section1 = chapter1.addSection(title11);

    PdfPTable t = new PdfPTable(2);
    t.setSpacingBefore(25);
    t.setSpacingAfter(25);

    PdfPCell c1 = new PdfPCell(new Phrase("Voice Calls"));
    t.addCell(c1);

    PdfPCell c2 = new PdfPCell(new Phrase(rs.getString("mins")));
    t.addCell(c2);

    t.addCell("Cost/minute");
    t.addCell(String.valueOf(voiceCost));

    t.addCell("Free Unit");
    t.addCell(PackageResultSet.getString("numberofminutes"));

    t.addCell("Extra units");
    t.addCell(String.valueOf(eMints));

    t.addCell("Total cost");
    t.addCell(String.valueOf(eMints*voiceCost+"  E£"));

    section1.add(t);

    Paragraph title12 = new Paragraph("SMS",
            FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD,
                    new CMYKColor(0, 100, 0, 2)));
    Section section2 = chapter1.addSection(title12);

    PdfPTable t2 = new PdfPTable(2);
    t2.setSpacingBefore(25);
    t2.setSpacingAfter(25);

    PdfPCell c3 = new PdfPCell(new Phrase("SMS "));
    t2.addCell(c3);

    PdfPCell c4 = new PdfPCell(new Phrase(rs.getString("sms")));
    t2.addCell(c4);

    t2.addCell("Cost of the Service");
    t2.addCell(String.valueOf(smsCost));

    t2.addCell("Free Unit of the service");
    t2.addCell(PackageResultSet.getString("numberofsms"));

    t2.addCell("Extra units");
    t2.addCell(String.valueOf(eSMS));

    t2.addCell("Total of Money of this service");
    t2.addCell(String.valueOf(eSMS*smsCost+"  E£"));

    section2.add(t2);

    Paragraph title13 = new Paragraph("Data ",
            FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD,
                    new CMYKColor(0, 255, 255, 17)));
//Chapter chapter3 = new Chapter(title1, 3);
//chapter3.setNumberDepth(2);
    Section section3 = chapter1.addSection(title13);

    PdfPTable t3 = new PdfPTable(2);
    t3.setSpacingBefore(25);
    t3.setSpacingAfter(25);

    PdfPCell c5 = new PdfPCell(new Phrase(" Usage "));
    t3.addCell(c5);

    PdfPCell c6 = new PdfPCell(new Phrase(rs.getString("data")+" M") );
    t3.addCell(c6);

    t3.addCell("Cost/Byte");
    t3.addCell(String.valueOf(dataCost));

    t3.addCell("Free Unit");
    t3.addCell(PackageResultSet.getString("numberofdata")+" M");
    t3.addCell("Extra units");
    t3.addCell(String.valueOf(eDATA));
    
    t3.addCell("Total of Money of this service");
    t3.addCell(String.valueOf(eDATA*dataCost+"  E£"));

    section3.add(t3);
Paragraph title14 = new Paragraph("Recuring service ",
            FontFactory.getFont(FontFactory.HELVETICA, 12, Font.BOLD,
                    new CMYKColor(0, 255, 255, 17)));
    Section section4 = chapter1.addSection(title14);

    PdfPTable t4 = new PdfPTable(1);
    t4.setSpacingBefore(5);
    t4.setSpacingAfter(5);

    PdfPCell c7 = new PdfPCell(new Phrase(" Usage "));
    t4.addCell(c7);


    t4.addCell("Cost/Byte");
    t4.addCell(String.valueOf(dataCost));

 

    section4.add(t4);

%>

<%    document.add(chapter1);

    writer.getDirectContent().addImage(image);
    writer.getDirectContent().addImage(image1);
    writer.getDirectContent().addImage(image2);
    document.close();
%>
