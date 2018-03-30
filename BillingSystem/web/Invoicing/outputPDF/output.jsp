<%-- 
    Document   : Q1
    Created on : Feb 22, 2018, 12:53:54 PM
    Author     : AZIZ
--%>
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
<%
    Document document = new Document(PageSize.A4, 50, 50, 50, 50);
    PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("E:\\iti_38 Never say i can't\\text1.pdf"));
    document.open();
    Image image = Image.getInstance("C:\\Users\\AZIZ\\Desktop\\1.jpg");
    Image image1 = Image.getInstance("C:\\Users\\AZIZ\\Desktop\\LOGO.jpg");
    Image image2 = Image.getInstance("C:\\Users\\AZIZ\\Desktop\\iti.png");
    image.setAbsolutePosition(520f, 780f);
    image.scalePercent(40, 40);
    image1.setAbsolutePosition(10f, 780f);
    image1.scalePercent(12, 12);
    image2.setAbsolutePosition(270f, 780f);
    image2.scalePercent(50, 50);

    Paragraph title1 = new Paragraph("Welcome To Our Company", FontFactory.getFont(FontFactory.HELVETICA, 18, Font.BOLDITALIC, new CMYKColor(0, 255, 255, 17)));
    title1.setAlignment(Element.ALIGN_CENTER);
    Paragraph title11 = new Paragraph("Voice Service Costs",
            FontFactory.getFont(FontFactory.HELVETICA, 16, Font.BOLD,
                    new CMYKColor(0, 255, 255, 17)));
    Chapter chapter1 = new Chapter(title1, 1);
    chapter1.setNumberDepth(0);
    Section section1 = chapter1.addSection(title11);

    PdfPTable t = new PdfPTable(2);
    t.setSpacingBefore(25);
    t.setSpacingAfter(25);

    PdfPCell c1 = new PdfPCell(new Phrase("Voice Service Name "));
    t.addCell(c1);

    PdfPCell c2 = new PdfPCell(new Phrase("Its Name from DB"));
    t.addCell(c2);

    t.addCell("Cost of its Service");
    t.addCell("Its Cost from DB");

    t.addCell("Free Unit of its service");
    t.addCell("Get Free Unit From DataBase");

    t.addCell("Total of Money of this service");
    t.addCell("Calculate it");

    section1.add(t);

    Paragraph title12 = new Paragraph("SMS Service Costs",
            FontFactory.getFont(FontFactory.HELVETICA, 16, Font.BOLD,
                    new CMYKColor(0, 255, 255, 17)));
//Chapter chapter2 = new Chapter(title1, 2);
//chapter2.setNumberDepth(1);
    Section section2 = chapter1.addSection(title12);

    PdfPTable t2 = new PdfPTable(2);
    t2.setSpacingBefore(25);
    t2.setSpacingAfter(25);

    PdfPCell c3 = new PdfPCell(new Phrase("SMS Service Name "));
    t2.addCell(c3);

    PdfPCell c4 = new PdfPCell(new Phrase("Its Name from DB"));
    t2.addCell(c4);

    t2.addCell("Cost of its Service");
    t2.addCell("Its Cost from DB");

    t2.addCell("Free Unit of its service");
    t2.addCell("Get Free Unit From DataBase");

    t2.addCell("Total of Money of this service");
    t2.addCell("Calculate it");

    section2.add(t2);

    Paragraph title13 = new Paragraph("Data Service Costs",
            FontFactory.getFont(FontFactory.HELVETICA, 16, Font.BOLD,
                    new CMYKColor(0, 255, 255, 17)));
//Chapter chapter3 = new Chapter(title1, 3);
//chapter3.setNumberDepth(2);
    Section section3 = chapter1.addSection(title13);

    PdfPTable t3 = new PdfPTable(2);
    t3.setSpacingBefore(25);
    t3.setSpacingAfter(25);

    PdfPCell c5 = new PdfPCell(new Phrase("Data Service Name "));
    t3.addCell(c5);

    PdfPCell c6 = new PdfPCell(new Phrase("Its Name from DB"));
    t3.addCell(c6);

    t3.addCell("Cost of its Service");
    t3.addCell("Its Cost from DB");

    t3.addCell("Free Unit of its service");
    t3.addCell("Get Free Unit From DataBase");

    t3.addCell("Total of Money of this service");
    t3.addCell("Calculate it");

    section3.add(t3);

    double total = 0;
    Paragraph title2 = new Paragraph("Total Anmount OF Money To Pay : " + total,
            FontFactory.getFont(FontFactory.HELVETICA, 16, Font.BOLD,
                    new CMYKColor(0, 255, 255, 17)));
//    Chapter chapter2 = new Chapter(title2, 1);
//    chapter2.setNumberDepth(0);
    Section section4 = chapter1.addSection(title2);

%>

<%    document.add(chapter1);
    
    writer.getDirectContent().addImage(image);
    writer.getDirectContent().addImage(image1);
    writer.getDirectContent().addImage(image2);
    document.close();
%>
