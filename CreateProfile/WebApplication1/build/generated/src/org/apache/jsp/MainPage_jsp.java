package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class MainPage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <title>W3.CSS Template</title>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://www.w3schools.com/w3css/4/w3.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/css?family=Raleway\">\r\n");
      out.write("    <style>\r\n");
      out.write("        body,h1 {font-family: \"Raleway\", sans-serif}\r\n");
      out.write("        body, html {height: 100%}\r\n");
      out.write("        .bgimg {\r\n");
      out.write("            background-image: url('bg.jpg');\r\n");
      out.write("            min-height: 100%;\r\n");
      out.write("            background-position: center;\r\n");
      out.write("            background-size: cover;\r\n");
      out.write("        }\r\n");
      out.write("        .btn1 {\r\n");
      out.write("            position: absolute;\r\n");
      out.write("            top: 70%;\r\n");
      out.write("            left: 30%;\r\n");
      out.write("            transform: translate(-50%, -50%);\r\n");
      out.write("            -ms-transform: translate(-50%, -50%);\r\n");
      out.write("            background-color: #f1f1f1;\r\n");
      out.write("            color: black;\r\n");
      out.write("            font-size: 16px;\r\n");
      out.write("            padding: 16px 30px;\r\n");
      out.write("            border: none;\r\n");
      out.write("            cursor: pointer;\r\n");
      out.write("            border-radius: 5px;\r\n");
      out.write("            text-align: center;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .btn1:hover {\r\n");
      out.write("            background-color: orange;\r\n");
      out.write("            color: white;\r\n");
      out.write("        }\r\n");
      out.write("        .btn2 {\r\n");
      out.write("            position: absolute;\r\n");
      out.write("            top: 70%;\r\n");
      out.write("            left: 50%;\r\n");
      out.write("            transform: translate(-50%, -50%);\r\n");
      out.write("            -ms-transform: translate(-50%, -50%);\r\n");
      out.write("            background-color: #f1f1f1;\r\n");
      out.write("            color: black;\r\n");
      out.write("            font-size: 16px;\r\n");
      out.write("            padding: 16px 30px;\r\n");
      out.write("            border: none;\r\n");
      out.write("            cursor: pointer;\r\n");
      out.write("            border-radius: 5px;\r\n");
      out.write("            text-align: center;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .btn2:hover {\r\n");
      out.write("            background-color: orange;\r\n");
      out.write("            color: white;\r\n");
      out.write("        }\r\n");
      out.write("        .btn3 {\r\n");
      out.write("            position: absolute;\r\n");
      out.write("            top: 70%;\r\n");
      out.write("            left: 70%;\r\n");
      out.write("            transform: translate(-50%, -50%);\r\n");
      out.write("            -ms-transform: translate(-50%, -50%);\r\n");
      out.write("            background-color: #f1f1f1;\r\n");
      out.write("            color: black;\r\n");
      out.write("            font-size: 16px;\r\n");
      out.write("            padding: 16px 30px;\r\n");
      out.write("            border: none;\r\n");
      out.write("            cursor: pointer;\r\n");
      out.write("            border-radius: 5px;\r\n");
      out.write("            text-align: center;\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        .btn3:hover {\r\n");
      out.write("            background-color: orange;\r\n");
      out.write("            color: white;\r\n");
      out.write("        }\r\n");
      out.write("        h2{\r\n");
      out.write("            position: absolute;\r\n");
      out.write("            top: 40%;\r\n");
      out.write("            left: 40%;\r\n");
      out.write("        }\r\n");
      out.write("    </style>\r\n");
      out.write("    <body>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"bgimg w3-display-container w3-animate-opacity w3-text-white\">\r\n");
      out.write("            <div align=\"center\">\r\n");
      out.write("                <h2>Welcome To Our System</h2>\r\n");
      out.write("                <!--                <hr class=\"w3-border-grey\" style=\"margin:auto;width:40%\">-->\r\n");
      out.write("                <!--    <p class=\"w3-large w3-center\">35 days left</p>-->\r\n");
      out.write("                <br/>\r\n");
      out.write("                <form action=\"index.html\">\r\n");
      out.write("                    <button class=\"btn1\">Show Rate Plans</button>\r\n");
      out.write("                </form>\r\n");
      out.write("                <br/>\r\n");
      out.write("                <form action=\"p1/index.html\">\r\n");
      out.write("                    <button class=\"btn2\" onclick=\"\">Create Rate Plan</button>\r\n");
      out.write("                </form>\r\n");
      out.write("                <br/>\r\n");
      out.write("                <form action=\"addNewService.jsp\">\r\n");
      out.write("                    <button class=\"btn3\" onclick=\"\">ADD New Service</button>\r\n");
      out.write("                </form>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
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
