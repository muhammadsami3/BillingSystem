package org.apache.jsp.user;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import DatabaseHandler.DatabaseHandler;

public final class homee_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


        String productName = "";
    
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
      response.setContentType("text/html;charset=UTF-8");
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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("<style>\r\n");
      out.write("body {margin:0;}\r\n");
      out.write("\r\n");
      out.write(".navbar {\r\n");
      out.write("  overflow: hidden;\r\n");
      out.write("  background-color: #333;\r\n");
      out.write("  position: fixed;\r\n");
      out.write("  top: 0;\r\n");
      out.write("  width: 100%;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".navbar a {\r\n");
      out.write("  float: left;\r\n");
      out.write("  display: block;\r\n");
      out.write("  color: #f2f2f2;\r\n");
      out.write("  text-align: center;\r\n");
      out.write("  padding: 14px 16px;\r\n");
      out.write("  text-decoration: none;\r\n");
      out.write("  font-size: 17px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".navbar a:hover {\r\n");
      out.write("  background: #ddd;\r\n");
      out.write("  color: black;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".main {\r\n");
      out.write("  padding: 16px;\r\n");
      out.write("  margin-top: 30px;\r\n");
      out.write("  height: 1500px; /* Used in this example to enable scrolling */\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("`\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://www.w3schools.com/w3css/4/w3.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/search.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/toptab.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/aboutMe.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/homePage.css\">\r\n");
      out.write("        \r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("    \r\n");
      out.write("\r\n");
      out.write("<div class=\"navbar\">\r\n");
      out.write("  <a href=\"/WebApplication1/user/homee.jsp\">Home</a>\r\n");
      out.write("  <a href=\"../MainPage.jsp\">ADD RATE PLANE</a>\r\n");
      out.write("  <a href=\"#contact\">BILL</a>\r\n");
      out.write("  <a href=\"../Rating/p2/index.html\">RATE</a>\r\n");
      out.write("  <a href=\"#news\">SEARCH</a>\r\n");
      out.write("  <a href=\"#contact\">ADD CUSTOMER</a>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<div class=\"header\" style=\"width:100% ;height: 600px \">\r\n");
      out.write("    <img class=\"mySlides\" src=\"Img/SlideShowPic/1.jpg\" style=\"width:100% ;height: 600px \">\r\n");
      out.write("    <img class=\"mySlides\" src=\"Img/SlideShowPic/LOGO.jpg\" style=\"width:100% ;height: 600px \">\r\n");
      out.write("   \r\n");
      out.write("    <!--</div>-->\r\n");
      out.write("\r\n");
      out.write("    <script>\r\n");
      out.write("        var myIndex = 0;\r\n");
      out.write("        carousel();\r\n");
      out.write("\r\n");
      out.write("        function carousel() {\r\n");
      out.write("            var i;\r\n");
      out.write("            var x = document.getElementsByClassName(\"mySlides\");\r\n");
      out.write("            for (i = 0; i < x.length; i++) {\r\n");
      out.write("                x[i].style.display = \"none\";\r\n");
      out.write("            }\r\n");
      out.write("            myIndex++;\r\n");
      out.write("            if (myIndex > x.length) {\r\n");
      out.write("                myIndex = 1\r\n");
      out.write("            }\r\n");
      out.write("            x[myIndex - 1].style.display = \"block\";\r\n");
      out.write("            setTimeout(carousel, 2000); // Change image every 2 seconds\r\n");
      out.write("        }\r\n");
      out.write("    </script>\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"leftcolumn\"> \r\n");
      out.write("    <div class=\"card2\" style=\"border-width:5px;  margin:5px; border-style:inset;border-color:#707694;\">\r\n");
      out.write("        \r\n");
      out.write("    ");

           out.println("<p style='font-family:serif' align='center'><font size='6' color='black'>RATE PLANES</font></p>");
            int sectionId=0;
            DatabaseHandler dbHandler = new DatabaseHandler();
            
            ResultSet categories = dbHandler.getAllRatePlane();
            while (categories.next()) {
                sectionId++;
                
              out.println("<div class='fakeimg'><a style='text-decoration: none;' href='#section" + sectionId + "'  style='float:center'><button class='catbutton' style=' font-family:serif ;width:100%'><font size='6' color='white'>" + categories.getString(2).toUpperCase() + "</font></button></a></div>");
            }
        
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("    \r\n");
      out.write("</div>\r\n");
      out.write("<!--        <h3>Categories</h3>\r\n");
      out.write("        <div class=\"fakeimg\"><a href=\"#C1\"  style=\"float:left\">\r\n");
      out.write("                <!input type=\"image\"  id=\"catImg1\" src=\"Img/mobileCat.png\" alt=\"Submit\"-- >Mobiles</a></div>\r\n");
      out.write("        <div class=\"fakeimg\"><a href=\"#C2\"  style=\"float:left\"><!input type=\"image\"  id=\"catImg2\" src=\"Img/laptops.png\" alt=\"Submit\"-- >Laptops</a></div>\r\n");
      out.write("        <div class=\"fakeimg\"><a href=\"#C3\"  style=\"float:left\"><!input type=\"image\"  id=\"catImg3\" src=\"Img/cameraCat.png\" alt=\"Submit\"-- >Cameras</a></div>-->\r\n");
      out.write("    \r\n");
      out.write("        \r\n");
      out.write("    \r\n");
      out.write("<!--    <div class=\"card\">\r\n");
      out.write("        <h3>Follow Me</h3>\r\n");
      out.write("        <p>Some text..</p>\r\n");
      out.write("    </d-->\r\n");
      out.write("\r\n");
      out.write("        \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"rightcolumn\" >\r\n");
      out.write("    ");
      out.write("\r\n");
      out.write("    ");

        int sectionId1 = 0;
        DatabaseHandler dbHandler1 = new DatabaseHandler();
        ResultSet categories1 = dbHandler1.getAllRatePlane();
        while (categories1.next()) {
            sectionId1++;
            out.println("<div class='card3' style='border-width:5px;  margin:5px; border-style:inset;border-color:#707694;'>");
    
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    ");

        out.println("<a name='section" + sectionId1 + "'><p style='font-family:serif' align='center'><font size='6' color='black'>" + categories1.getString(2).toUpperCase() + "</font></p></a>");
        out.println("<div class='fakeimg grid-container' style='height:500px; overflow-y: scroll' >");
        ResultSet products = dbHandler1.getAllServicePackage(categories1.getString(2));
        while (products.next()) {
//            if (products.getInt(3) != 0) {
                productName = products.getString(2);
                out.println("<div class='grid-item'>");
////                out.println("<img src=" + products.getString(4) + ">");
                out.println("<br/>");
                
                out.println(products.getString(2).toUpperCase());
                out.println("<br/>");
                out.println("<br/>");
                out.println("<br/>");
                out.println("<br/>");
                
                out.println("<h4 style='font-family:Tahoma ;text-align: left'><font size='3' color='black'><b>Number Of Minutes : </b>" + products.getDouble(4) + "<b>Minutes</b></font></h4>");
                out.println("<h4 style='font-family:Tahoma ; text-align: left' ><font size='3' color='black'><b>Number Of SMS : </b>" + products.getDouble(5) + "<b>SMS</b></font></h4>");
                out.println("<h4 style='font-family:Tahoma ;text-align: left'><font size='3' color='black'><b>Number Of Data : </b>" + products.getDouble(6) + "<b>MigaBytes</b></font></h4>");
                out.println("<h4 style='font-family:Tahoma ; text-align: left' ><font size='3' color='black'><b>Cost of Service : </b>" +products.getDouble(7) + "<b>L.E</b></font></h4>");
    
      out.write("\r\n");
      out.write("   \r\n");
      out.write("        ");

                       out.println("</div>");
                //    }
                }
                out.println("</div>");
                 out.println("</div>");
            }  
        
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("<script>\r\n");
      out.write("    function addToCart(productName) {\r\n");
      out.write("        document.location.href = \"CartPage.jsp?productName=\" + productName;\r\n");
      out.write("    }\r\n");
      out.write("    function showProductDescription(productName) {\r\n");
      out.write("        document.location.href = \"productDescription.jsp?productName=\" + productName;\r\n");
      out.write("    }\r\n");
      out.write("</script>\r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
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
