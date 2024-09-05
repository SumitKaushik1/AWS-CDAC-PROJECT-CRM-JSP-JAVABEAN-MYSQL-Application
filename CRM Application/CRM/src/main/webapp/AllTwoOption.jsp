<%--3333333333333333333333333333333333333333333333333333333333333333333333333333333333333 --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      
	
	   <!-- CSS only -->
          <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" 
		  rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
		  crossorigin="anonymous">	  	


		<!-- JavaScript Bundle with Popper -->
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" 
		  integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" 
		  crossorigin="anonymous"></script>   

         
       
		 
		 
	       <link rel="stylesheet" href="6.jpg.css">


<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
</head>
 <body>
 
 
 
 
 
      <jsp:useBean id="customer" class="bean.CustomerInfoBean" scope="session"/>
    <!--   to save customer details in customer.jsp i have to load the customer class -->
      
      
      
      
      
      
      
      
      
   <%--b/z i want the seperate object of customerinfo for each session which is taken from input--%>
     
     <c:set var="dashboard" value="allTwoOption"  scope="session"/>
       <%--to tell the next page that request is comming from AllTwoOPtion.jsp page --%>
       <%--it is the map which var is key is holding the value  --%>
       
	     
	          <div class="main-container" style="border: 0.4rem solid white;height: 99vh; width: 98vw;">
							                 <div class="outer-box-who">
	                                         <h5  class="loginfirstname"> Hello! ${sessionScope.login.loginFirstName}</h5> 
                                             <h5 class="loginrole">(${sessionScope.login.loginRole})</h5>
	                                        </div>
							
							
							<nav class="navbar navbar-expand-lg  navbar-light /*border border-primary*/">
								        <div class="container-fluid /*border border-dark*/">
								         
									          
								        
								        
								        
								            <span class="navbar-brand mb-0 h1 /*border*/ mx-5 px-5 "  style="flex-grow: 9;color: white;font-weight: bold;font-family: monospace;opacity: 0.6;font-size: 3rem;">CMS</span>
								
								
											<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
											<span class="navbar-toggler-icon"></span>
											</button>
								
								        <div class="collapse navbar-collapse" id="mynavbar" >
									          <div class="navbar-nav">
										          <a class="nav-link mx-4" style="color: white;font-family: unset;opacity: 0.5;font-size: 2rem;" href="Logout.jsp">LogOut</a>
									           </div>                                                                         <!-- 	pageContext.getSession().invalidate() -->
									    </div>  
									    
									  
							
								      
									  
								
								</div>
						   </nav>
									   
				   
				   
				   
			          <div class="outer-container border border primary" style="width: 71rem;">
					       
						   <div class="inner-container inner-container1 ">
						        
								DASHBOARD
						   
							</div>
							
							<div class="inner-container inner-container2">
							  
								Click On The Link For Details
							
							</div>
					         
							 <div class="inner-container">
							    
							     
                                <div class="box  /*border border-primary*/">


                                          <div class="container text-center">
														  <div class="row">
															<div class="col-6  /*border border-secondary*/ align-self-center box1">
															    <a  href="Customer.jsp"  class="border border-2 link" style="color:white"><span class="fa fa-user"></span>Customer</a>
															</div>
															<div class="col-6  /*border border-secondary*/ align-self-center box1">
															   <a  href="Salesman.jsp" class="border border-2 link" style="color:white"><span class="fa fa-user-circle-o"></span>Salesman</a>
															</div>
														
														  </div>
										  </div>								
																							
							    
								
								    
								
								
								   
		                        </div>
							 
							 
							 </div>
					  
					  
					  </div>
			  
			  
			  
			  </div>
	  
	    
	  
	  </body>
	  
</html>