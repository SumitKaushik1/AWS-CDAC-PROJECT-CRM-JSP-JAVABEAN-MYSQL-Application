<%--2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222 --%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>authentication</title>
</head>
<body>



<%--its useBean tag in the login.jsp page --%>
<jsp:setProperty property="*" name="login"/>
<!-- ITS CLASS LOAD INTHE LOGIN.JSP -->
   <%--note the the  if the setter in the loginbean is setLoginId() then teh from teh page you are getting the request  there the name attribute of the input  tag which is taking id must be equal to   name="loginid" --%>
   <%--then while comming on this page the name is converted like this id-->setLoginId-->setLoginId()  if your name attibuet is differnt like name id_good then setter will call like setId_good() and tehre si no ssetter in teh login bean  java file  and setter si notcaled --%>

<%System.out.println("inside verify.jsp") ;%>



<%--note all the * means all names of the Login.jsp input box  ,you can specify particular name also if you want to call the setter of that--%>
<%--eg property=lognId--%>
<%--whatever in jsp:useBean id it becomes name in the jsp:setPropery --%>
<%--  ${sessionScope.login.verifyUsers()} --%>
 <%--use here jstl tag for the if condition --%>
 <%--login page  --%>
<%--${sessionScope.login.message} --%>

 <%-- <c:if test="${sessionScope.login.verifyUsers() == false}"><c:redirect url="Login.jsp"/></c:if> --%>
<%-- note test is the attribute to whatever expression you wnt to test it must insde the "${}" --%>
<!-- or -->
<%-- <c:if test="${sessionScope.login.verifyUsers() eq false}"><c:redirect url="Login.jsp"/></c:if> --%>
 
 
  <%--since i have to get which role it is i set the value in one adn will be used further  --%>>

                          	<%-- session.getAttribute("login").verifyUsers()--%>
 <c:choose>
 		<c:when test="${sessionScope.login.verifyUsers() == false}">
 		<%-- session.getAttribute("loginRole")--> it will return string that it has--%>
 		<c:redirect url="Login.jsp"/>
 		</c:when>	
 
		 <c:otherwise>
		            
	             <c:choose>
		                 
		                   <%--c:redirecting mean url rewriting (jessiionid in the url is send inthe request ,if cookie off) --%>
		                   <%--if cookie on then jesssion id in the cookie is send  --%>
		           <c:when test="${sessionScope.login.verifyRole()  == 'ADMIN' }"><c:redirect url="AllThreeOption.jsp"/></c:when>
		             <%--we have got the call teh verify Role once then loginRole si teh field in the login bean
		                   after tehat is assigned so later no need to call jsut use that to compare --%>
		           
		           <%--sesssin.getAttribute("login").getLoginRole() --%>
		           <c:when test="${sessionScope.login.loginRole  == 'MANAGER' }"><c:redirect url="AllTwoOption.jsp"/></c:when>
		            <c:when test="${sessionScope.login.loginRole  == 'ENGINEER' }"><c:redirect url="AllOneOption.jsp"/></c:when>
		            <c:when test="${sessionScope.login.loginRole == 'CEO' }"><c:redirect url="AllThreeOption.jsp"/></c:when>
		            <c:otherwise><c:redirect url="Login.jsp"/></c:otherwise>
		            
		         </c:choose>
		           
		 
		 
		 </c:otherwise>

</c:choose>
<%-- note test is the attribute to whatever expression you wnt to test it must insde the "${}"  eq is the symbol for == , when jstl tag is used laong teh choode tag --%>
</body>
</html>