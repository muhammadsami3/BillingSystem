package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Statement;

public final class addNewCustomer_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <title>New Customer</title>\r\n");
      out.write("        <meta charset=\"UTF-8\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("\t\t<link rel=\"stylesheet\" href=\"addNewCustomer.css\">\r\n");
      out.write("    </head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("  <form class=\"modal-content\" action=\"addNewCustomer\" method=\"Post\">\r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("      <h1>New Customer</h1>\r\n");
      out.write("      <p>Please fill in this form to add new Customer.</p>\r\n");
      out.write("      <hr>\r\n");
      out.write("       <label for=\"msisdn\"><b>Mobile Number</b></label>\r\n");
      out.write("      <input type=\"text\" placeholder=\"Enter Mobile Nomber\" name=\"msisdn\" required>\r\n");
      out.write("\r\n");
      out.write("      <label for=\"fname\"><b>First Name</b></label>\r\n");
      out.write("      <input type=\"text\" placeholder=\"Enter First Name\" name=\"fname\" required>\r\n");
      out.write("      \r\n");
      out.write("       <label for=\"f\\lname\"><b>Last Name</b></label>\r\n");
      out.write("      <input type=\"text\" placeholder=\"Enter Last Name\" name=\"lname\" required>\r\n");
      out.write("      \r\n");
      out.write("       <label for=\"uname\"><b>User Name</b></label>\r\n");
      out.write("      <input type=\"text\" placeholder=\"Enter User Name\" name=\"uname\" required>\r\n");
      out.write("\r\n");
      out.write("      <label for=\"password\"><b>Password</b></label>\r\n");
      out.write("      <input type=\"password\" placeholder=\"Enter Password\" name=\"password\" required>\r\n");
      out.write("\r\n");
      out.write("\t  \r\n");
      out.write("      <label for=\"birthdate\"><b> Birth date</b></label>\r\n");
      out.write("      <input type=\"text\" placeholder=\"Enter Birth date\" name=\"birthdate\" required>\r\n");
      out.write("\t  \r\n");
      out.write("\t  <label for=\"email\"><b>Email</b></label>\r\n");
      out.write("      <input type=\"text\" placeholder=\"Enter Email\" name=\"email\" required>\r\n");
      out.write("\t  \r\n");
      out.write("\t\r\n");
      out.write("\t   <label for=\"address\"><b> Address</b></label>\r\n");
      out.write("      <input type=\"text\" placeholder=\"Enter Address\" name=\"address\" required>\r\n");
      out.write("      \r\n");
      out.write("       <label for=\"profile\"><b>Select Profile</b></label>\r\n");
      out.write("            \r\n");
      out.write("      <select name =\"rateplane\">\r\n");
      out.write("          ");

               Statement stmt;
    PreparedStatement prep;
    ResultSet rs;
     Connection connect=null;
           

        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException ex) {
         //  Logger.getLogger(addNewCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            connect = DriverManager.getConnection("jdbc:postgresql://localhost:5432/billing", "postgres", "1022591400");
        } catch (SQLException ex) {
         //   Logger.getLogger(addNewCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }

          stmt = connect.createStatement();
            String queryString = new String("Select * from rateplane;");
            
            rs = stmt.executeQuery(queryString);
            while(rs.next()){
            out.println("<option value='"+rs.getInt(1)+"'>"+rs.getString(2)+"</option>");
            }
          
      out.write("\r\n");
      out.write("      </select>\r\n");
      out.write("      \r\n");
      out.write("\t  \r\n");
      out.write("\t\r\n");
      out.write("      \r\n");
      out.write("    \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("      <input type=\"submit\" value=\"ADD\"/>\r\n");
      out.write("  </form>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
      out.write("    ");
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
