/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.36
 * Generated at: 2022-10-17 18:12:32 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.time.LocalDateTime;

public final class Logout_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/WEB-INF/lib/jstl-1.2.jar", Long.valueOf(1664452277603L));
    _jspx_dependants.put("jar:file:/C:/Users/amit/Desktop/main%20project/main%20project/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/CRM/WEB-INF/lib/jstl-1.2.jar!/META-INF/c.tld", Long.valueOf(1153365282000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.time.LocalDateTime");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<!-- CSS only -->\r\n");
      out.write("    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT\" crossorigin=\"anonymous\">\r\n");
      out.write("\t<!-- JavaScript Bundle with Popper -->\r\n");
      out.write("     <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("\t\r\n");
      out.write("\t<script src=\"https://code.jquery.com/jquery-3.6.0.js\" integrity=\"sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=\"\r\n");
      out.write("\t\tcrossorigin=\"anonymous\"></script>\r\n");
      out.write("\t\t<!--jquery link-->\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"ISO-8859-1\">\r\n");
      out.write("    <title>\r\n");
      out.write("\t  logout page\r\n");
      out.write("\t</title>\r\n");
      out.write("\t<script>\r\n");
      out.write("    //chrome javascript engine supports the node.js ie assynchronuus programming\r\n");
      out.write("    $(document).ready(function(){\r\n");
      out.write("   var time_var= setTimeout( function(){\r\n");
      out.write("\t        var time=new Date().toLocaleTimeString();\r\n");
      out.write("\t        $(\"#show_time\").html(time);\r\n");
      out.write("\t   },0) /* timout means delay for 0  second then function is executed  once */\r\n");
      out.write("\t  \r\n");
      out.write("\t   clearTimeout(time_var);\r\n");
      out.write("     \r\n");
      out.write("   var time_var= setInterval( function(){\r\n");
      out.write("\t        var time=new Date().toLocaleTimeString();\r\n");
      out.write("\t        $(\"#show_time\").html(time);\r\n");
      out.write("\t   },0)\r\n");
      out.write("\t  \r\n");
      out.write("    })   /* set interval means  function excuted after every 1 second again and again */\r\n");
      out.write("\t           \r\n");
      out.write("\t          \r\n");
      out.write("\t\t\t  \r\n");
      out.write("\t\t\t  \r\n");
      out.write("\t\t\t  \r\n");
      out.write("\t\t\t  \r\n");
      out.write("\t\t\t  \r\n");
      out.write("\t</script>\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t<style>\r\n");
      out.write("\t\r\n");
      out.write("\t   .column1{\r\n");
      out.write("\t     height: 10rem;\r\n");
      out.write("\t\ttext-align: center;\r\n");
      out.write("\t\tpadding: 4rem;\r\n");
      out.write("\t\tfont-color: white;\r\n");
      out.write("\t\tfont-size: 3rem;\r\n");
      out.write("\t\tfont-family: inherit;\r\n");
      out.write("\t\tfont-style: oblique;\r\n");
      out.write("\t\tcolor: white;\r\n");
      out.write("\t\t border-radius: 1rem;\r\n");
      out.write("\t\tbackground-image: linear-gradient(to bottom,#3d3d55,#818586);\r\n");
      out.write("\t  \r\n");
      out.write("\t  \r\n");
      out.write("\t  }\r\n");
      out.write("\t  \r\n");
      out.write("\t  .column2{\r\n");
      out.write("\t\t\t height: 4rem;\r\n");
      out.write("\t\ttext-align: center;\r\n");
      out.write("\t\tpadding: 4rem;\r\n");
      out.write("\t\tfont-color: black;\r\n");
      out.write("\t\tfont-size: 2.1rem;\r\n");
      out.write("\t\tfont-family: inherit;\r\n");
      out.write("\t\tfont-style: oblique;\r\n");
      out.write("\t\tcolor: black;\r\n");
      out.write("\t\tbackground-image: linear-gradient(to bottom,#818586,white);\r\n");
      out.write("\t    border-radius: 1rem;  \r\n");
      out.write("\t  }\r\n");
      out.write("\t  \r\n");
      out.write("\t\r\n");
      out.write("\t</style>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<!--        \r\n");
      out.write("inheritly jession id come here using the c:redirect (urlrewriting(jessionid encoded in url if cookies blocked in browser)+clinetpull2)\r\n");
      out.write("that session or jsessionid(map)  is invalidated ie removed  -->\r\n");
      out.write('\r');
      out.write('\n');
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${sessionScope.login.daoVari.cleanUp()}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write('\r');
      out.write('\n');
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${sessionScope.customer.daoImpleCusto.cleanUp()}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write('\r');
      out.write('\n');
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${sessionScope.salesman.daoImpleSalesman.cleanUp()}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write('\r');
      out.write('\n');
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${sessionScope.product.daoImpleProduct.cleanUp()}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write('\r');
      out.write('\n');
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.session.invalidate()}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write(" <!-- outer map is gone  all the inside maps are gone  -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t<body style=\"background-image: linear-gradient( to bottom,#6a6363,gray);; margin:auto\">\r\n");
      out.write("\t\r\n");
      out.write("\t\t\t   <div class=\"container-fluid /*border border-primary*/ py-4 \" style=\"margin:auto\">\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\t\t\t  <div style=\" width: 84rem;height: 36rem;background-image: linear-gradient(to bottom,#3e3e48,#818586);;margin-top: 1rem;\">\r\n");
      out.write("\t\t\t\t\t\t\t\t  <div class=\"container /*border border-primary*/ text-center \">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t  <div class=\"row /*border border-primary*/ py-6\" style=\"margin:auto\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"col-12 /*border border-light*/ column1\" >\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t Customer Management System\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"col-12 border border-success p-2 border-opacity-10 column2\"  >\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t  Logged Out Successfully \r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t<div class=\"col-12 border border-success p-2 border-opacity-10 column2\"  >\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t        <a href=\"Login.jsp\" style=\"text-decoration:none;font-size: x-large; \">Click here</a> <span style=\"font-size: smaller;\">to login to CMS<span>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t  </div>\r\n");
      out.write("\t\t\t\t\t\t\t\t         <div  class=\"container /*border border-primary*/ \"  style=\"height: 5rem;width: 15rem;margin-left: 62rem;margin-top: 14rem;font-size: 2.5rem;color: #593a3a\">\r\n");
      out.write("                                                    <span id=\"show_time\"></span>\t\t\t\t\t\t\t\t\t\t\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t </div>\r\n");
      out.write("\t\t\t\t\t\t  </div>\r\n");
      out.write("\t\t\t\t   \r\n");
      out.write("\t\t\t   </div>\r\n");
      out.write("     </body>\r\n");
      out.write("</html>\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}