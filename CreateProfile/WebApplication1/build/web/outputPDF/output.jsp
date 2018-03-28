<%-- 
    Document   : Q1
    Created on : Feb 22, 2018, 12:53:54 PM
    Author     : AZIZ
--%>


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
Paragraph title11 = new Paragraph("This is Section 1 in Chapter 1", 
        FontFactory.getFont(FontFactory.HELVETICA, 16, Font.BOLD, 
        new CMYKColor(0, 255, 255,17)));
    
Paragraph title1 = new Paragraph("Welcome To Our Company", FontFactory.getFont(FontFactory.HELVETICA,18, Font.BOLDITALIC, new CMYKColor(0, 255, 255,17)));
    
Chapter chapter1 = new Chapter(title1, 1);
       chapter1.setNumberDepth(0);
Section section1 = chapter1.addSection(title11);
Paragraph someSectionText = new Paragraph("This text comes as part of section 1 of chapter 1.");
 
section1.add(someSectionText);
 
someSectionText = new Paragraph("Following is a 3 X 2 table.");
 
section1.add(someSectionText);
PdfPTable t = new PdfPTable(3);
 
      t.setSpacingBefore(25);
       
      t.setSpacingAfter(25);
       
      PdfPCell c1 = new PdfPCell(new Phrase("Header1"));  
       
      t.addCell(c1);
       
      PdfPCell c2 = new PdfPCell(new Phrase("Header2"));
       
      t.addCell(c2);
       
      PdfPCell c3 = new PdfPCell(new Phrase("Header3"));
       
      t.addCell(c3);
       
      t.addCell("1.1");
       
      t.addCell("1.2");
       
      t.addCell("1.3");
       
      section1.add(t);


%>
                
<%
    document.add(chapter1);
    writer.getDirectContent().addImage(image);
    writer.getDirectContent().addImage(image1);
    writer.getDirectContent().addImage(image2);
    document.close();
%>
