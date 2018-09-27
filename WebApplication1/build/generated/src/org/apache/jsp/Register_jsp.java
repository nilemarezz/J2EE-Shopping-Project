package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Register_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("  <title>My Shop</title>\n");
      out.write("  <meta charset=\"utf-8\">\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("  <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\n");
      out.write("  <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\n");
      out.write("  <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\n");
      out.write("  <link href=\"https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900\" rel=\"stylesheet\">\n");
      out.write("  <link rel=\"shortcut icon\" href=\"view/img/logo.png\" />\n");
      out.write("  \n");
      out.write("</head>\n");
      out.write("<body background-color=\"white\">\n");
      out.write("        <img class=\"background\" src=\"view/img/bglogin.jpg\" alt=\"bglogin\" width=\"100%\" height=\"100%\">\n");
      out.write("    <div class=\"container\" >\n");
      out.write("            <img class=\"logo\" src=\"view/img/logo.png\" alt=\"login\" width=\"40%\" height=\"40%\">\n");
      out.write("        \n");
      out.write("        <form>\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                  <label for=\"exampleInputEmail1\">Email address</label>\n");
      out.write("                  <input type=\"email\" class=\"form-control\" id=\"exampleInputEmail1\" aria-describedby=\"emailHelp\" placeholder=\"Enter email\">\n");
      out.write("                  <small id=\"emailHelp\" class=\"form-text text-muted\">We'll never share your email with anyone else.</small>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("                  <label for=\"exampleInputPassword1\">Password</label>\n");
      out.write("                  <input type=\"password\" class=\"form-control\" id=\"exampleInputPassword1\" placeholder=\"Password\">\n");
      out.write("                </div>\n");
      out.write("            <p style=\"color: red\">SomeThing Wrong,Try Again!!</p>\n");
      out.write("                <button type=\"submit\" class=\"btn btn-primary btn-lg btn-block\">Submit</button>\n");
      out.write("              </form>\n");
      out.write("              \n");
      out.write("              <a href=\"landing.html\" class=\"btn btn-primary btn-lg btn-block\" style=\"background-color: #FB2320;margin-top: 10px;\">Back</a>\n");
      out.write("              \n");
      out.write("    </div>    \n");
      out.write("    <style>\n");
      out.write("    .container{\n");
      out.write("        width: 400px;\n");
      out.write("        padding: 50px;\n");
      out.write("        background-color: white;\n");
      out.write("        margin-left: 500px;\n");
      out.write("        margin-top: 100px;\n");
      out.write("        \n");
      out.write("        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);\n");
      out.write("        border-radius: 10px;\n");
      out.write("        \n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    img.background {\n");
      out.write("    width: 100%;\n");
      out.write("    height: 100%;\n");
      out.write("    position: absolute;\n");
      out.write("    left: 0px;\n");
      out.write("    top: 0px;\n");
      out.write("    z-index: -1;\n");
      out.write("    -webkit-filter: blur(35px); /* Safari 6.0 - 9.0 */\n");
      out.write("    filter: blur(10px);\n");
      out.write("}\n");
      out.write(".logo{\n");
      out.write("             margin-left: 90px;\n");
      out.write("         }\n");
      out.write("    \n");
      out.write("    </style>\n");
      out.write("\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>");
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
