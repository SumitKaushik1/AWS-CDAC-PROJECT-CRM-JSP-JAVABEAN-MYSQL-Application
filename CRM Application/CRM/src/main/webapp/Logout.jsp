<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@  page   import="java.time.LocalDateTime"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
	<!-- JavaScript Bundle with Popper -->
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
	
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>
		<!--jquery link-->

<head>
<meta charset="ISO-8859-1">
    <title>
	  logout page
	</title>
	<script>
    //chrome javascript engine supports the node.js ie assynchronuus programming
    $(document).ready(function(){
   var time_var= setTimeout( function(){
	        var time=new Date().toLocaleTimeString();
	        $("#show_time").html(time);
	   },0) /* timout means delay for 0  second then function is executed  once */
	  
	   clearTimeout(time_var);
     
   var time_var= setInterval( function(){
	        var time=new Date().toLocaleTimeString();
	        $("#show_time").html(time);
	   },0)
	  
    })   /* set interval means  function excuted after every 1 second again and again */
	           
	          
			  
			  
			  
			  
			  
	</script>
	
	
	<style>
	
	   .column1{
	     height: 10rem;
		text-align: center;
		padding: 4rem;
		font-color: white;
		font-size: 3rem;
		font-family: inherit;
		font-style: oblique;
		color: white;
		 border-radius: 1rem;
		background-image: linear-gradient(to bottom,#3d3d55,#818586);
	  
	  
	  }
	  
	  .column2{
			 height: 4rem;
		text-align: center;
		padding: 4rem;
		font-color: black;
		font-size: 2.1rem;
		font-family: inherit;
		font-style: oblique;
		color: black;
		background-image: linear-gradient(to bottom,#818586,white);
	    border-radius: 1rem;  
	  }
	  
	
	</style>


	
</head>

<!--        
inheritly jession id come here using the c:redirect (urlrewriting(jessionid encoded in url if cookies blocked in browser)+clinetpull2)
that session or jsessionid(map)  is invalidated ie removed  -->
<%-- session.getAttribute("login").getDaoVari().cleanUp(); --%>
${sessionScope.login.daoVari.cleanUp()}
${sessionScope.customer.daoImpleCusto.cleanUp()}
${sessionScope.salesman.daoImpleSalesman.cleanUp()}
${sessionScope.product.daoImpleProduct.cleanUp()}
${pageContext.session.invalidate()} <!-- outer map is gone  all the inside maps are gone  -->


	<body style="background-image: linear-gradient( to bottom,#6a6363,gray);; margin:auto">
	
			   <div class="container-fluid /*border border-primary*/ py-4 " style="margin:auto">
			
						  <div style=" width: 84rem;height: 36rem;background-image: linear-gradient(to bottom,#3e3e48,#818586);;margin-top: 1rem;">
								  <div class="container /*border border-primary*/ text-center ">
										  <div class="row /*border border-primary*/ py-6" style="margin:auto">
												<div class="col-12 /*border border-light*/ column1" >
												 Customer Management System
												</div>
												<div class="col-12 border border-success p-2 border-opacity-10 column2"  >
												  Logged Out Successfully 
												</div>
												<div class="col-12 border border-success p-2 border-opacity-10 column2"  >
											        <a href="Login.jsp" style="text-decoration:none;font-size: x-large; ">Click here</a> <span style="font-size: smaller;">to login to CMS<span>
												</div>
												
										  </div>
								         <div  class="container /*border border-primary*/ "  style="height: 5rem;width: 15rem;margin-left: 62rem;margin-top: 14rem;font-size: 2.5rem;color: #593a3a">
                                                    <span id="show_time"></span>										

										</div>
								 </div>
						  </div>
				   
			   </div>
     </body>
</html>
	
	
	
	
	
	
	
	
	