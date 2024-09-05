
<%--11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111--%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <title> LoginIn Page</title>
   		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
		
		
           
		<style>
			 body{
			 
		          background-image: linear-gradient( to bottom,#6a6363,gray);
			 }
			 .text-color{
			 
			   color:red;
			
			 }
		 
		 .visits-outer-box{
		   font-size: 1.3rem;
		   text-decoration: underline;
			margin-left: 77rem;
			margin-bottom: -6rem;
			color: white;
		 
		 
		 }
		 
		 
		 .visits-inne-box{
		   font-size: 2rem;
			text-align: center;
			width: 6rem;
		 
		 }
		  
		
		</style>
	
		 <script>
			 
			
			
			    function reset(){
						 document.getElementById("Id").value="";
						 document.getElementById("role_id").value="";
						
						 document.getElementById("first_name").value="";
						 document.getElementById("last_name").value="";
						 document.getElementById("passoword").value="";
				
				}
						  
				
			
			
			
			
			  
			  
			
			    var flag1;<!--i am considering it is a number-->
			   var count;
			  function validate_ID(){
			           count=0;
			           flag1=true;
					  var arr=[];
					  arr =(document.getElementById("Id").value).split("");
					 if(arr[0]!="u")
                        flag1=false;
				     else 
					 {
			            for(var i=1;i<arr.length;++i){
						       count++;
						       if(isNaN(parseInt(arr[i])))
									flag1=false;
                       	 }
				    } 
					 console.log(count)
			         if(flag1 && (count==10))
				     {   
					    
						 document.getElementById("Id_message").innerHTML="";
						  return true;
					 
					 }
				
		          else
					   {document.getElementById("Id_message").innerHTML="id must start with u and  10 digit";
						return false;
				   } 
						
				}
			   
			   
			    var flag2;<!--i am considering it is a number-->
			   var count;
			  function validate_role_ID(){
			           count=0;
			           flag2=true;
					  var arr=[];
					  arr =(document.getElementById("role_id").value).split("");
					 if(arr[0]!="r")
                        flag2=false;
				     else 
					 {
			            for(var i=1;i<arr.length;++i){
						       count++;
						       if(isNaN(parseInt(arr[i])))
									flag2=false;
                       	 }
				    } 
					 console.log(count)
			         if(flag2 && (count==10))
				     {   
					    
						 document.getElementById("role_message").innerHTML="";
						  return true;
					 
					 }
				
		          else
					   {document.getElementById("role_message").innerHTML="id must start with r and  10 digit";
						return false;
				   } 
						
				}
			   
			   
				 
			  function validate_first_name(){
			   
			   	if(document.getElementById("first_name").value.length < 1)
				    { document.getElementById("first_name_message").innerHTML="enter the correct first name";
					 return false;
					}
				    
			  
			  
		       else
			    {document.getElementById("first_name_message").innerHTML="";
				   return true;
				
				}			   
			   
			   
			   }
			   
			     function validate_last_name(){
			   
			   	if(document.getElementById("last_name").value.length < 1)
				    { document.getElementById("last_name_message").innerHTML="enter the correct last name";
					 return false;
					}
				    
			  
			  
		       else
			    {document.getElementById("last_name_message").innerHTML="";
				   return true;
				
				}			   
			   
			   
			   }
			   
			   
		 
		 </script>
	
	
	  
</head>
 
<%--note you must mention name attribute in the box to submit the input value in the box --%>
<body>
    		<div class="visits-outer-box">
		<%--application scope means this variable for that particualr  page is one only for whole application   --%>
		 <c:choose>
		                        <%-- application.getAtrribue("visits")   is  not made so it will give null initially --%>
		       <c:when test="${applicationScope.visits==null || applicationScope.visits==0}">
		                   <%--when  application.getAtrribue("visits")  --%>      
				        <div class="visits-inne-box">
				         <c:out value="${1}"/> 
				          
				         </div>
				         
				         
				         <%-- 1 will be printed on browser --%>
				          <c:out value="Total Visits"/><%-- string will be printed on browser as itsis  --%>
				          <c:set var="visits" value="${2}" scope="application"/> <%--2 will be saved in visits applcation scope  --%>
				         
				  </c:when>
		        <c:otherwise>
		                 <%--when somenone vists 2nd time --%>  
		                <%--when  application.getAtrribue("visits")  --%>  
				       
				      <div class="visits-inne-box"> 
				       <c:out value="${applicationScope.visits}"/><%-- saved valeu i s prinetd on browser  --%>
				      </div>
				      
				      
				      
				      <c:out value="Total Visits"/><%-- string will be printed on browser as itsis  --%>
				       <c:set var="visits" value="${applicationScope.visits+1}" scope="application"/> <%--  whatever teh value incremeted one is saved   --%>
				       <%--note if you write like this ${visits} then it will search with getAttribute inthe page scope
				          then request, session scope,application scope(at last in the applicaiton scope it will find that)--%>
		              
		       
		       
		        </c:otherwise>     
				                            
			 </c:choose>	       
				      
		 </div> 




 
<!--  first time from browser come request then webcontainer see this ->  jsp:useBean  id="login" class="bean.LoginBean" scope="session"
 internally browser do request.getSession() if previously from browser jsessinid(session) shared then it will not make the session if
 not any session then webcontainer will make the new session -->
 
 <jsp:useBean  id="login" class="bean.LoginBean" scope="session"/>
<!--  CLASS LOAD HERE and method area of server having id and scope as specified above
 ITS SETSPROPERTY(SETTER) IN THE VERIFY.JSP -->
 
 <jsp:useBean id="customer" class="bean.CustomerInfoBean" scope="session"/> 
<!--  CLASS LOAD HERE and method area of server having id and scope as specified above
 ITS SETSPROPERTY(SETTER) IN THE VERIFY.JSP -->
 
 
 <jsp:useBean id="salesman" class="bean.SalesmanInfoBean" scope="session"/>
<!--  CLASS LOAD HERE and method area of server having id and scope as specified above
 ITS SETSPROPERTY(SETTER) IN THE VERIFY.JSP -->
 
 <jsp:useBean id ="product" class="bean.ProductInfoBean" scope="session"/>
<!--  CLASS LOAD HERE and method area of server having id and scope as specified above
 ITS SETSPROPERTY(SETTER) IN THE VERIFY.JSP -->
  
  <form action="verify.jsp" method="post">
  
	    <div class="container-fluid /*border border-primary*/ py-4 " >
			    <div class="/*border border-secondary*/ text-center fs-1">
				   <div class="row">
						    <div class="col-2" Style="font-weight: bolder;opacity: 0.5;color: #130c17;font-family: monopause;">
						         <a href="Welcome.jsp" style="color: #130c17;text-decoration: none;">Home</a>
						    </div>
						    <div class="col-8">
						      LogIn
						     </div>
				  </div>
				  
				<!--   <span class="p" style="color: #312424; font-style: oblique;">Home</span>
                   style="color: #312424; font-style: oblique;" -->
		      
			    </div>
			        <div class="row /*border border-warning*/ justify-content-center align-items-center p-5  bg-light mx-5 my-5 gx-5 gy-4"><!-- this row is made then only column can be there -->
												    <div  class="col-12 /*border border-warning*/ " style=" color:black ;text-align:center;"><!--in this all contents are there-->
												            <h5>${sessionScope.login.message}</h5>		
													</div>	            
																	 
											    
												   <div  class="col-4 /*border border-warning*/ bg-light shadow"><!--in this all contents are there-->
														 
														 
														 <div class="mb-2">
														 
														  
															<label for="Id" class="text-color"> Login Id</label>
															<input  type="text" id="Id"  name="loginId"  placeholder="enter the id" class="form-control"   required onblur="validate_ID()"></input>
															<span id="Id_message"></span>
															
														 </div>
														 
														 
														 
														  <div class="mb-2" >
															 
															 <label for="role_id" class="text-color"> Login Role Id</label>
															 <input  type="text" id="role_id" name="loginRoleId" class="form-control" placeholder="enter the role id" onblur="validate_role_ID()" required></input>
														     <span id="role_message"></span>
															
														  
														  </div>
														  
														  
														 
														
														   
														
														
															 <div class="mb-2">
															 
																	<label for="first_name" class="text-color">First Name:</label>
																	<input  type="text" id="first_name"   name="loginFirstName" class="form-control" placeholder="enter the first name" onblur="validate_first_name()" required></input>
															        <span id="first_name_message"></span>
															 </div>
															 
															  <div class="mb-2">
															 
																	<label for="last_name" class="text-color">Last Name:</label>
																	<input  type="text" id="last_name"   name="loginLastName" class="form-control" placeholder="enter the last name" onblur="validate_last_name()" required></input>
															        <span id="last_name_message"></span>
															 </div>
															 
															 
															 
															  <div class="mb-2">
															                    
																	 <label for="password" class="text-color">Password</label>
																	<input  type="password" id="passoword"  name="loginPassword" class="form-control" placeholder="enter the passoword"required></input>
															        <span id="pass_message"></span>
															  
															  </div>
															  
															
												               <div class=" mb-2 text-center">
															   
															         <input type="submit" value="Login"  class="btn btn-primary" onclick="validate_status()"/>
															          <button class="btn btn-primary" onclick="reset()">clear</button>
															         <span id="status_message"></span>
															         <%--${sessionScope.login.message} --%>
															            <%--session.getAttribute("login").getMessage()--%>
															   </div>
												  
												           
												 
														 
													
												   
											  
											  </div>
									 
								
							      
									
									
													
													
													
													
													
													
							
							</div>
					
				
					
					
					</div>
				

	     
     </form>


</body>
</html>