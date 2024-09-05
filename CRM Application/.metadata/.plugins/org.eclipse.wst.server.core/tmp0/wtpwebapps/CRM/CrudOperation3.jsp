<%--5555555555555555555555555555555555555555555555555555555555555555555555555555555555555 --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <%-------------------------------------Delete----------------------------------------------%>
   <c:choose>
         <c:when test="${sessionScope.requestDelete == 'CustomerDelete'}">
             <%--before deleting i want to clear the table contents of customer info   on browser--%>
             <c:set var="listOfCustomers" value="null" scope="session" />
             
              <jsp:setProperty property="customerIdToDelete" name="customer"/>
              <%--setter is called of  customerIdToDelete  ie seesion.getAttribute("customer")
              .setcustomerIdToDelete(whatever parameter come in request of same name)--%>
              ${sessionScope.customer.customerDelete()}
              
              <c:redirect url="Customer.jsp"/> 
             
         </c:when>
         
         <c:when test="${sessionScope.requestDelete == 'SalesmanDelete'}">
              
             <%--before deleting i want to clear the table contents of customer info on browser  --%>
              <c:set var="listOfSalesman" value="null" scope="session" />
             
             
              <jsp:setProperty property="salesmanIdToDelete" name="salesman"/>
              <%--setter si caleld of  customerIdToDelete  ie seesion.getAttribute("customer")
              .setcustomerIdToDelete(whateever parameter come in request of same name)--%>
              ${sessionScope.salesman.salesmanDelete()}
              <c:redirect url="Salesman.jsp"/>
         </c:when>
      
         
         <c:when test="${sessionScope.requestDelete == 'ProductDelete'}">
         
                <%--before deleting i want to clear the table contents of Products info  in the browser--%>   
              <c:set var="listOfProduct" value="null" scope="session" />
              
         
              <jsp:setProperty property="productIdToDelete" name="product"/>
              <%--setter si caleld of  customerIdToDelete  ie seesion.getAttribute("customer")
              .setcustomerIdToDelete(whateever parameter come in request of same name)--%>
              ${sessionScope.product.productDelete()}
              <c:redirect url="Product.jsp"/>
         </c:when>
   
   </c:choose>




</body>
</html>