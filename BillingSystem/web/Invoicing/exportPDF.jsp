<%@page import="java.sql.ResultSet"%>
<%@page import="DataBase.dbMethods"%>
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
PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("/myprojects/text.pdf"));
document.open();
//Anchor anchorTarget = new Anchor("First page of the document.");
//      anchorTarget.setName("BackToTop");
//      Paragraph paragraph1 = new Paragraph();
// 
//      paragraph1.setSpacingBefore(50);
// 
//      paragraph1.add(anchorTarget);
//      document.add(paragraph1);
// 
dbMethods db=new dbMethods();
//db.connectToDatabase();
ResultSet rs=db.getInvoice("00201022591400");
while (rs.next()) {        
       document.add(new Paragraph("Mins: "+rs.getString("mins")+", sms:  "+rs.getString("sms")+
               ", dajujta:"+rs.getString("data")
        ,FontFactory.getFont(FontFactory.COURIER, 14, Font.BOLD, new CMYKColor(0, 255, 0, 0))));
    }

 
//Image image = Image.getInstance("C:\\Users\\AZIZ\\Desktop\\1.jpg");
//image.setAlignment(Image.ALIGN_TOP);
//        image.setAbsolutePosition(500f,0f);
//        image.scalePercent(25, 25);
//        Chunk chunk = new Chunk(image,0,0);
//document.add(image);
        
document.close();
%>