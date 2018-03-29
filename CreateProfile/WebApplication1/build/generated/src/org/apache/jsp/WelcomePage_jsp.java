package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class WelcomePage_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <title>W3.CSS Template</title>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://www.w3schools.com/w3css/4/w3.css\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://fonts.googleapis.com/css?family=Raleway\">\n");
      out.write("    <style>\n");
      out.write("        body,h1 {font-family: \"Raleway\", sans-serif}\n");
      out.write("        body, html {height: 100%}\n");
      out.write("        .bgimg {\n");
      out.write("            background-image: url('bg.jpg');\n");
      out.write("            min-height: 100%;\n");
      out.write("            background-position: center;\n");
      out.write("            background-size: cover;\n");
      out.write("        }\n");
      out.write("        .btn1 {\n");
      out.write("            position: absolute;\n");
      out.write("            top: 70%;\n");
      out.write("            left: 30%;\n");
      out.write("            transform: translate(-50%, -50%);\n");
      out.write("            -ms-transform: translate(-50%, -50%);\n");
      out.write("            background-color: #f1f1f1;\n");
      out.write("            color: black;\n");
      out.write("            font-size: 16px;\n");
      out.write("            padding: 16px 30px;\n");
      out.write("            border: none;\n");
      out.write("            cursor: pointer;\n");
      out.write("            border-radius: 5px;\n");
      out.write("            text-align: center;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .btn1:hover {\n");
      out.write("            background-color: orange;\n");
      out.write("            color: white;\n");
      out.write("        }\n");
      out.write("        .btn2 {\n");
      out.write("            position: absolute;\n");
      out.write("            top: 70%;\n");
      out.write("            left: 50%;\n");
      out.write("            transform: translate(-50%, -50%);\n");
      out.write("            -ms-transform: translate(-50%, -50%);\n");
      out.write("            background-color: #f1f1f1;\n");
      out.write("            color: black;\n");
      out.write("            font-size: 16px;\n");
      out.write("            padding: 16px 30px;\n");
      out.write("            border: none;\n");
      out.write("            cursor: pointer;\n");
      out.write("            border-radius: 5px;\n");
      out.write("            text-align: center;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .btn2:hover {\n");
      out.write("            background-color: orange;\n");
      out.write("            color: white;\n");
      out.write("        }\n");
      out.write("        .btn3 {\n");
      out.write("            position: absolute;\n");
      out.write("            top: 70%;\n");
      out.write("            left: 70%;\n");
      out.write("            transform: translate(-50%, -50%);\n");
      out.write("            -ms-transform: translate(-50%, -50%);\n");
      out.write("            background-color: #f1f1f1;\n");
      out.write("            color: black;\n");
      out.write("            font-size: 16px;\n");
      out.write("            padding: 16px 30px;\n");
      out.write("            border: none;\n");
      out.write("            cursor: pointer;\n");
      out.write("            border-radius: 5px;\n");
      out.write("            text-align: center;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .btn3:hover {\n");
      out.write("            background-color: orange;\n");
      out.write("            color: white;\n");
      out.write("        }\n");
      out.write("        h2{\n");
      out.write("            position: absolute;\n");
      out.write("            top: 40%;\n");
      out.write("            left: 40%;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <div class=\"bgimg w3-display-container w3-animate-opacity w3-text-white\">\n");
      out.write("            <div align=\"center\">\n");
      out.write("                <h2>Welcome To Our System</h2>\n");
      out.write("                <!--                <hr class=\"w3-border-grey\" style=\"margin:auto;width:40%\">-->\n");
      out.write("                <!--    <p class=\"w3-large w3-center\">35 days left</p>-->\n");
      out.write("                <br/>\n");
      out.write("                <form action=\"Rating/p2/index.html\">\n");
      out.write("                    <button class=\"btn1\">Rating</button>\n");
      out.write("                </form>\n");
      out.write("                <br/>\n");
      out.write("                \n");
      out.write("                <form action=\"MainPage.jsp\">\n");
      out.write("                    <button class=\"btn3\" onclick=\"\">Create Profile</button>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
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
