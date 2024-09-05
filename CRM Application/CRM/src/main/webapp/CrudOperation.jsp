<%--5555555555555555555555555555555555555555555555555555555555555555555555555555555555555 --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



<%-- note all the request parameter come here  in url will be in the string format even teh input
box was declared is number in previous --%>
<%-- note each client has its seesion and setProperty and all the maps are stored in that seesion if scope is session--%>


<%System.out.println("inside CrudOperation.jsp");%>


<%-------------------------------------Insert and Update------------------------------------ --%>  
<c:choose>
       <c:when test="${crud_typeNPageName == 'customerNinsertNupdate'}">
            
              
              <%--before insert and update i want to clear the table contents of customer info   on browser--%>
             <c:set var="listOfCustomers" value="null" scope="session" />
            
             <%--System.out.println("inside customerNinsertNupdate ");--%>
               <jsp:setProperty property="*" name="customer"/> 
				  <%--its useBean tag in the .jsp page login.jsp--%>
				<%-- all setter of are called corresponding to the bean class as per the name(id in <jsp:usebean>) accordign
				   name specific come in request --%>
				   
				   <%--note the the  if the setter in the customerinfobean is setId() then teh from teh page you are getting the request  there the name attribute of the input  tag which is taking id must be equal to   name="id" --%>
				   <%--then while comming on this page the name is converted like this id-->setId-->setId()  if your name attibuet is differnt like name id_good then setter will call like setId_good() and tehre si no ssetter in teh csutomerinfobean  java file --%>
				 <%--note all the * means all names of the Login.jsp input box  ,you can specify particular name also if you want to call the setter of that--%>
				<%-- eg property="lognId"--%>
				<%--whatever in jsp:useBean id it becomes name in the jsp:setPropery --%>
				  ${sessionScope.customer.insertNUpdate()}   
				                   
                   <%--for insert and updat i need to pass the user id also b/z i have to add this to the table of customer so this we  --%>
                   <%--we are not able to do or pass the argument in the insert method,so we are not using -->${sessionScope.customer.insertNUpdate()})}  --%>
                   <c:redirect url="Customer.jsp"/>
               
                    <%--  ie redirect means client2  pull (temperory request method)using the urlrewriting ie jsessinid+url--%>
         </c:when>
         
         <c:when test="${crud_typeNPageName == 'salesmanNinsertNupdate'}">
         
              <%--before insert and update i want to clear the table contents of customer info on browser  --%>
              <c:set var="listOfSalesman" value="null" scope="session" />
         
             
               <%--System.out.println("inside salesmanNinsertNupdate ");--%>
               <jsp:setProperty property="*" name="salesman"/>
                <%--its useBean tag in the .jsp page login.jsp--%>
                		<%--   all setter of are called corresponding to the bean class as per the name(id in <jsp:usebean>) accordign
				   name specific come in request --%>
                ${sessionScope.salesman.insertNUpdate()}
                <c:redirect url="Salesman.jsp"/>
                <%--  ie redirect means client2  pull (temperory request method)using the urlrewriting ie jsessinid+url --%>
               
         
         </c:when>     
      
       <c:when test="${crud_typeNPageName == 'productNinsertNupdate'}">
       
            <%--before insert and upadate i want to clear the table contents of Products info  in the browser--%>   
              <c:set var="listOfProduct" value="null" scope="session" />
              
       
       
               <%--System.out.println("inside productNinsertNupdate ");--%>
               <jsp:setProperty property="*" name="product"/>
                <%--its useBean tag in the .jsp page login.jsp--%>
           	<%--   all setter of are called corresponding to the bean class as per the name(id in <jsp:usebean>) accordign
				   name specific come in request --%>
                ${sessionScope.product.insertNUpdate()}
                 
              <%--ie redirect means client2  pull (temperory request method)using the urlrewriting ie jsessinid+url --%>
              <c:redirect url="Product.jsp"/>
         
         </c:when>     

           
          
          


</c:choose>





</body>
</html>