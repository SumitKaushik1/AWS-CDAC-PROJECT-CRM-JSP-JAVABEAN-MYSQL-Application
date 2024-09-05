<%--5555555555555555555555555555555555555555555555555555555555555555555555555555555555555 --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%-------------------------------------Read---------------------------------------------- --%>  
   <c:choose>
   
         <c:when test="${sessionScope.read_request == 'CustomerRead'}">
                 
                   <c:set var="listOfCustomers" value="${sessionScope.customer.readCustomers()}" scope="session" />
                      <%--session.getAttribute("customer").readCustomer() --%>
                      <%--customer is the key which holds custoemrinfo bean class object of that session --%>
                      <%--we are just using thsi sobject to get details from database --%>
                
                     <c:redirect url="Customer.jsp"/> 
              
                
          </c:when>
            <c:when test="${sessionScope.read_request == 'SalesmanRead'}">
                 
                <c:set var="listOfSalesman" value="${sessionScope.salesman.readSalesmans()}" scope="session" />
                      <%--session.getAttribute("salesamn").readSalesman() --%>
                      <%--customer is the key which holds salesmaninfo bean class object of that session --%>
                      <%--we are just using thsi sobject to get details from database --%>
                <c:redirect url="Salesman.jsp"/>
              
                
          </c:when>   
            <c:when test="${sessionScope.read_request == 'ProductRead'}">
                 
                <c:set var="listOfProduct" value="${sessionScope.product.readProducts()}" scope="session" />
                      <%--session.getAttribute("product").readProduct () --%>
                      <%--customer is the key which holds productinfo bean class object of that session --%>
                      <%--we are just using thsi sobject to get details from database --%>
                <c:redirect url="Product.jsp"/>
              
                
          </c:when>   
          
          
             
   </c:choose>



</body>
</html>