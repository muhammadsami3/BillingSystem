package org.apache.jsp.Invoicing.outputPDF;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.text.DecimalFormat;
import java.util.Random;
import java.math.BigDecimal;
import DataBase.DatabaseHandler;
import com.itextpdf.text.Rectangle;
import java.sql.ResultSet;
import DataBase.dbMethods;
import com.itextpdf.text.Element;
import com.itextpdf.text.ListItem;
import com.itextpdf.text.List;
import com.itextpdf.text.Chapter;
import com.itextpdf.text.Section;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Image;
import com.itextpdf.text.pdf.CMYKColor;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Anchor;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.FileOutputStream;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Document;
import com.itextpdf.text.pdf.PdfDocument;
import java.awt.Color;

public final class output_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

static int i = 0;

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write('\r');
      out.write('\n');

    Random rand = new Random(); 
int value = rand.nextInt(10000000);

    Document document = new Document(PageSize.A4, 50, 50, 50, 50);

    dbMethods db = new dbMethods();
    DatabaseHandler databaseHandler = new DatabaseHandler();
    db.connectToDatabase();

    String msisdn = (String) request.getParameter("msisdn");
    msisdn = (msisdn == null) ? "00201022591400" : msisdn;

    ResultSet rs = db.getInvoice(msisdn);
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
    t.addCell(String.valueOf(eMints * voiceCost / 100 + "  E£"));

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
    t2.addCell(String.valueOf(eSMS * smsCost / 100 + "  E£"));

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
    t3.addCell(String.valueOf(eDATA * dataCost / 100 + "  E£"));

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

    section5.add(t5);
    double cost = (eDATA * (dataCost / 100) )+ (eMints * (voiceCost / 100)) +(( smsCost * eSMS) / 100) + cost1+cost2;
    cost*=1.1;
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



      out.write("\r\n");
      out.write("\r\n");
    document.add(chapter1);

    writer.getDirectContent().addImage(image);
    writer.getDirectContent().addImage(image1);
    writer.getDirectContent().addImage(image2);
    document.close();
    response.sendRedirect("/BillingSystem/Invoicing/outputPDF/fileDownload.jsp");

      out.write('\r');
      out.write('\n');
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
