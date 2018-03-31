package org.apache.jsp.Rating;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class ratePage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/Rating/../Styling/header_footer/header.html");
    _jspx_dependants.add("/Rating/../Styling/header_footer/footer.html");
  }

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

      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("    <head>\r\n");
      out.write("        <title>Billing System</title>\r\n");
      out.write("        <meta charset=\"UTF-8\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("        <link rel=\"icon\" type=\"image/png\" href=\"/BillingSystem/Styling/images/1.jpg\"/>\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"/BillingSystem/Styling/vendor/bootstrap/css/bootstrap.min.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"/BillingSystem/Styling/fonts/font-awesome-4.7.0/css/font-awesome.min.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"/BillingSystem/Styling/vendor/animate/animate.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"/BillingSystem/Styling/vendor/css-hamburgers/hamburgers.min.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"/BillingSystem/Styling/vendor/select2/select2.min.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"/BillingSystem/Styling/css/util.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"/BillingSystem/Styling/css/main.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\r\n");
      out.write("   \r\n");
      out.write("\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("   \r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://www.w3schools.com/w3css/4/w3.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"/BillingSystem/Styling/css/toptab.css\">\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"/BillingSystem/Styling/css/homePage.css\">\r\n");
      out.write("       \r\n");
      out.write("<style>\r\n");
      out.write("    \r\n");
      out.write("body {margin:0;}\r\n");
      out.write("\r\n");
      out.write(".navbar {\r\n");
      out.write("  overflow: hidden;\r\n");
      out.write("  background-color: #000;\r\n");
      out.write("  position: fixed;\r\n");
      out.write("  top: 0;\r\n");
      out.write("  width: 1312px;\r\n");
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
      out.write("    \r\n");
      out.write("\r\n");
      out.write("<div class=\"navbar\">\r\n");
      out.write("  <a href=\"/BillingSystem/WelcomePage/home.jsp\">Home</a>\r\n");
      out.write("  <a href=\"/BillingSystem/addRateplan/ratePlaneIntro.jsp\">ADD RATE PLANE</a>\r\n");
      out.write("  <a href=\"/BillingSystem/addRateplan/addNewService.jsp\">ADD New Service</a>\r\n");
      out.write("  <a href=\"#contact\">BILL</a>\r\n");
      out.write("\r\n");
      out.write("  <a href=\"/BillingSystem/Rating/ratePage.jsp\">RATE</a>\r\n");
      out.write("\r\n");
      out.write("  <a href=\"/BillingSystem/Administration/addNewCustomer.jsp\">ADD CUSTOMER</a>\r\n");
      out.write("  <a  style=\"float:right\">\r\n");
      out.write("\r\n");
      out.write("      <form action=\"/BillingSystem/WelcomePage/profile.jsp\">\r\n");
      out.write("      <input type=\"search\" id=\"mySearch\" name=\"search\"  pattern=\"00201[0-9]{9}\" placeholder=\" Search      ex.00201xxxxxxxxx             &#9990;\" size=\"30\" required minlength=\"14\" maxlength=\"14\">\r\n");
      out.write("      <button style=\"color: white;padding-left: 10px;\"><i class=\"fa fa-search\"></i></button>\r\n");
      out.write("      <span class=\"validity\"></span>\r\n");
      out.write("      </form>\r\n");
      out.write("    </a>\r\n");
      out.write("  \r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\n");
      out.write("<link rel=\"stylesheet\" href=\"/BillingSystem/Styling/css/addNewCustomer.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"/BillingSystem/Styling/css/main.css\">\n");
      out.write("<div class=\"bg-contact2\" style=\"background-image: url('/BillingSystem/Styling/images/bg.jpg');\">\n");
      out.write("    <div class=\"container-contact2\" style=\"margin-top: 14px;\">\n");
      out.write("        <div class=\"wrap-contact2\" style=\"margin-top: 87px;\">\n");
      out.write("            <form class=\"contact2-form validate-form\" action=\"/BillingSystem/Rating/upload.jsp\" method=\"post\"  enctype = \"multipart/form-data\">\n");
      out.write("                <span class=\"contact2-form-title\">\n");
      out.write("                    Rating Process\n");
      out.write("                </span>\n");
      out.write("\n");
      out.write("\n");
      out.write("                <div class=\"container-contact2-form-btn\">\n");
      out.write("                    <div class=\"wrap-contact2-form-btn\" style=\"padding-top: 5px;padding-bottom: 5px;padding-right: 5px;padding-left: 5px;\">\n");
      out.write("                        <div class=\"contact2-form-bgbtn\" ></div>\n");
      out.write("                        <label for=\"file\"><i class=\"fa fa-refresh fa-spin\"></i> Upload CDR</label>\n");
      out.write("\n");
      out.write("                        <input type=\"file\"  id=\"file\"  name =\"file\" size = \"50\" required />\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                <div class=\"container-contact2-form-btn\">\n");
      out.write("                    <div class=\"wrap-contact2-form-btn\">\n");
      out.write("                        <div class=\"contact2-form-bgbtn\"></div>\n");
      out.write("\n");
      out.write("                        <input class=\"button\" type = \"submit\" value = \"Rate Now\" />\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </form>\n");
      out.write("            ");


                String stored = (String) session.getAttribute("stored");
                stored = (stored == null) ? "" : stored;

                if (stored.equals("y")) {
            
      out.write("\n");
      out.write("            <p>\n");
      out.write("                \n");
      out.write("              <p style=\"color: green;padding-left: 41%;padding-top: 12px;\">Rated Successfully   <i class=\"fa fa-check-circle\" style=\"font-size:20px;color:green\"></i> </p>\n");
      out.write("            ");

                }

            
      out.write("\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            ");
      out.write("<!--===============================================================================================-->\n");
      out.write("<script src=\"/BillingSystem/Styling/vendor/jquery/jquery-3.2.1.min.js\"></script>\n");
      out.write("<!--===============================================================================================-->\n");
      out.write("<script src=\"/BillingSystem/Styling/vendor/bootstrap/js/popper.js\"></script>\n");
      out.write("<script src=\"/BillingSystem/Styling/vendor/bootstrap/js/bootstrap.min.js\"></script>\n");
      out.write("<!--===============================================================================================-->\n");
      out.write("<script src=\"/BillingSystem/Styling/vendor/select2/select2.min.js\"></script>\n");
      out.write("<!--===============================================================================================-->\n");
      out.write("<script src=\"/BillingSystem/Styling/js/main.js\"></script>\n");
      out.write("\n");
      out.write("<!-- Global site tag (gtag.js) - Google Analytics -->\n");
      out.write("<script async src=\"https://www.googletagmanager.com/gtag/js?id=UA-23581568-13\"></script>\n");
      out.write("<script>\n");
      out.write("    window.dataLayer = window.dataLayer || [];\n");
      out.write("    function gtag() {\n");
      out.write("        dataLayer.push(arguments);\n");
      out.write("    }\n");
      out.write("    gtag('js', new Date());\n");
      out.write("\n");
      out.write("    gtag('config', 'UA-23581568-13');\n");
      out.write("</script>\n");
      out.write(" <footer id=\"myFooter\">\n");
      out.write("    <div class=\"w3-container w3-theme-l1\">\n");
      out.write("      <p><font>Copyright &copy; SouQ.com</font></p>\n");
      out.write("    </div>\n");
      out.write("  </footer>\n");
      out.write("</body>\n");
      out.write("</html>");
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
