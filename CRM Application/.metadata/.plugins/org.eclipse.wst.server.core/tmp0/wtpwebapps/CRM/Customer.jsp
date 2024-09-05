<%--444444444444444444444444444444444444444444444444444444444444444444444444444444444444444 --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
		
		<link rel="stylesheet" href="crud.css">
	
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>
		<!-- extra jquery link-->

<head>
<meta charset="ISO-8859-1">
   <title> Customer Details</title>
   		
           
		
					
	
		 <script>
			 
				     var customer=[];
			 
				     function save(){
					 
					 var id=document.getElementById("Id").value;
					 var first_name=document.getElementById("first_name").value;
					 var last_name=document.getElementById("last_name").value;
					 var pass=document.getElementById("pass").value;
					 var mobile=document.getElementById("mobile").value;
					 var email=document.getElementById("email").value; 
					 var address=document.getElementById("address").value;
				<!--	 console.log(id+name+mobile+email+pass+address);-->
					 
				  
					 
					 
					 var id_check = validate_ID();
				     var first_name_check = validate_first_name();
					 var last_name_check = validate_last_name();
					 var mobile_check =validate_mobile();
					 var pass_check =validate_pass();
					 
				   
					 
					 if(id_check && first_name_check && mobile_check &&  pass_check  && last_name_check)
					 {
							 var temp={
							 
							   id1:id,
							   first_name1:first_name,
							   last_name1:last_name,
							   pass1:pass,
							   mobile1:mobile,
							   email1:email, 
							   address1:address,
						
							 
							 }
							 
							 customer.push(temp);
							<!--console.log(customer[i].id1+customer[i].name1+customer[i].mobile1+customer[i].email1+customer[i].pass1+customer[i].address1);-->
							 reset();
						 
						 return true; <!--after validation the function return   true-->
					}
			       return false;<!-- after validation the function return false if validation is not true -->
		       }
			
			    function reset(){
						 document.getElementById("Id").value="";
						 document.getElementById("first_name").value="";
						 document.getElementById("last_name").value="";
						
						 document.getElementById("mobile").value="";
						 document.getElementById("pass").value="";
				         document.getElementById("email").value="";
						 document.getElementById("address").value="";
				}
						  
				
			    function reset_table_body(){
			    	console.log("inside the table reset");
			    	document.getElementById("body-inside").innerHTML="";
			    	
			    	
			    	
			    }
			
			
			function fetch_customer_details(){
			   var html="";
			  
			   for(var i=0;i<customer.length;i++){
			   
			   html+="<tr><td>"+customer[i].id1+"</td><td>"+customer[i].first_name1+"</td><td>"+customer[i].last_name1+"</td><td>"+customer[i].mobile1+"</td><td>"+customer[i].email1+"</td><td>"+customer[i].address1+"</td></tr>";
			   
			   }
			
			  document.getElementById("body-inside").innerHTML=html;
			  console.log(html);
			}
			  
			    var flag1;<!--i am considering it is a number-->
			   var count;
			  function validate_ID(){
			           count=0;
			           flag1=true;
					  var arr=[];
					  arr =(document.getElementById("Id").value).split("");
					 if(arr[0]!="c")
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
					   {document.getElementById("Id_message").innerHTML="id must start with c and  10 digit";
						return false;
				   } 
						
				}
			  
			   
			   
			   function validate_mobile(){
			       var arr=[];
                   arr =(document.getElementById("mobile").value).split("");
			   
			     if(arr.length==10)
				     {document.getElementById("mobile_message").innerHTML="";
					  return true;
					 
					 }
				
			  
			  
		       else
			       {document.getElementById("mobile_message").innerHTML="mobile number must have 10 digits"
				    return false;
				   }
			   
			   
			   }
			   
			   
			   function validate_first_name(){
			   
			   	if((document.getElementById("first_name").value).length < 1)
				    { 
						document.getElementById("first_name_message").innerHTML="not valid name";
						 return false;
					}
				    
			  
			  
		       else
			    {
				  document.getElementById("first_name_message").innerHTML="";
				   return true;
				
				}			   
			   
			   
			   }
			   
			     function validate_last_name(){
			   
			   	if((document.getElementById("last_name").value).length < 1)
				    { 
						document.getElementById("last_name_message").innerHTML="not valid name";
						 return false;
					}
				    
			  
			  
		       else
			    {
				  document.getElementById("last_name_message").innerHTML="";
				   return true;
				
				}			   
			   
			   
			   }
			   
			   
			   
			   function validate_pass(){
                     var arr=[];
                     arr=(document.getElementById("pass").value).split("");					
				         if(arr.length >10)
				       {document.getElementById("pass_message").innerHTML="";
					      return true;
					 
					 }
				
			  
			  
		       else
			       {document.getElementById("pass_message").innerHTML="password length must be greater than 10";
				    return false;
				   }
			   
			   
			   
			   }
			   
			     
			   
			   function validate_cpass(){
                     var arr=[];
					 var arr1=[];
					  arr=(document.getElementById("pass").value).split("");	
                     arr1=(document.getElementById("cpass").value).split("");					
				         if(arr1.length == arr.length)
				       {document.getElementById("pass_message").innerHTML="";
					      return true;
					 
					 }
				
			  
			  
		       else
			       {document.getElementById("cpass_message").innerHTML="password do not match";
				    return false;
				   }
			   
			   
			   
			   }
			   
			   function validate_email(){
			     console.log("inside email validate");
			    if(document.getElementById("email").value == "")
				      document.getElementById("email_message").innerHTML="not valid email";
					  else
					     document.getElementById("email_message").innerHTML="";
			   
			   
			   }
			   
			   
			
			   
			  
		 
		 </script>
	
	
</head>
 <body>
    <!--  by default the scope is page -->
        <c:set var="crud"  value="${false}}"/>
   <!--      BY DEFAULT CONSIDERIGN THAT HE CAN READ ONLY SO CRUD IS CONSIDERED FALSE  --> 
         
         
         
     <!--  by default the scope is page -->      
       <c:set var="delete_yes" value="${false}"/>
     <!--BY DEFAULT CONSIDERING THAT HE CANNNOT DO DELETE ONLY SO CRUD IS CONSIDERED FALSE -->     
    
               
       <c:set var="user_id_via_login_id" value="${sessionScope.login.loginId}" scope="request"/>
       <%-- <c:out value="${user_id_via_login_id}"/> --%>
      <%System.out.println("in the customer.jsp") ;%>
        
        
        
        
         <!-- AS SOON AS UPADATE AND INSERT PERMSSIISON COME IT IS CONSIDERED BOX WILL NOT BE DISABLED        -->
        <!--     this below for each loop and inside when condition is only for enabling or disabling the input box or tags if read and insert and update  -->
			      <c:forEach var="crud_permission" items="${sessionScope.login.permission()}"><%--here all perNameList comes ie create, read,update delete --%>
			       
			        <%--    <c:out value="${crud_permission}"/>  --%>
			          <c:choose>
			                          
			                      
			                
			                  <c:when test="${crud_permission.toUpperCase() == 'CUSTOMERCREATE' }">
			                        
			                        <%-- <c:out value="${'inside create  when'}"/>   --%>
			                         <c:set var="crud"  value="${true}"/>
			                         <%--bydefault scope is page --%>
			                      
			                   
			                 </c:when>
			                 
			                  <c:when test="${crud_permission.toUpperCase() == 'CUSTOMERUPDATE' }">
			                         <%-- <c:out value="${'inside update when'}"/>  --%> 
			                         <c:set var="crud"  value="${true}"/>
			                         <%--bydefault scope is page --%>
			                           
			                        
			                 </c:when>
			                 
			                 <c:when test="${crud_permission.toUpperCase() == 'CUSTOMERDELETE'}">
			                       <c:set var="delete_yes" value="${true}"/>
			                 </c:when>
			             
			                
			          </c:choose>
			      
			      
			     </c:forEach>
			       <%--   <h1>${pageScope.crud}</h1>  
                   or --%>
                   
              <%--      <c:out value="${crud}"/> --%>
	       <!--     this above for each loop and inside condition is only for enabling or disabling the input bx or tags   -->  
	         
	    
	  
	  
	    <!--   this if condition is only to tell to CrudOperation.jsp page that request came from customer.jsp for insert or update ie from inputbox  values and then at backend accordingly the insert adn update happen  -->
	       <c:if  test="${crud == true}">
	          <c:set var="crud_typeNPageName" value="customerNinsertNupdate" scope="session"/>
	        </c:if>
      
      
      
      
      
      
      
      <%--ie i want to sent the data to server inthe response body not url b/z larger data --%>	            
		  <div class="main-container" style="width: 99vw;">
		  
		 
				       <div class="row /*border border-primary*/" >
						        <div class="col-2 /*border border-success*/ column1">
								 CMS
								
								</div>
						         <div class="col-8 /*border border-success*/ column2">
								 
								 Customer Details
								</div>
								<div class="col-2 /*border border-success*/ column3">
								  <a class="nav-link mx-4" style="color: white;font-family: initial;opacity: 0.5;font-size: 2rem;font-style: italic;"  href="Logout.jsp">LogOut</a>
								                                                                                                                             <!-- 	pageContext.getSession().invalidate() -->
								</div>
								
							   <div  style="width: 13rem;height: 1rem;margin-left: 73rem;color: #f9f6f6;">
	                                   <h5  style=" font-size: 1.25rem;text-align: center;font-weight: revert-layer;"> Hello! ${sessionScope.login.loginFirstName}</h5> 
                                       <h5 style=" font-size: 1.25rem;text-align: center;font-weight: revert-layer;">(${sessionScope.login.loginRole})</h5>
	                         </div>
								
								
								
							
					   </div>
		    <%-- <!-- gutter making gaps b/w teh columns  ie gy (y diretcion )and gx(x direction) are making teh gaps in teh columns , py and px are padding in x and y direction , mx and mx --> --%>
	         
		           <div class="row /*border border-warning*/ justify-content-center align-items-center p-5  bg-light mx-5 my-5 gx-5 gy-5"  style="  background-image: linear-gradient(to bottom,#aea0a0,white);}"><!-- this row is made then only column can be there -->
							            
							       <form  action="CrudOperation.jsp" onsubmit="return confirm('submit customer details');" method="post">           
								                
									         <div  class="col-12 /*border border-warning*/ " style=" color:black ;text-align:center;"><%--<!--in this all contents are there--> --%>
													         <h5>${sessionScope.customer.message}</h5>	
													           <%--sesssin.getAttribute("customer").getMessage() --%>		
													      <%--customerinfobean object has state messge ,getmessage is called --> --%>   
											</div>
											
							           
                                       
                                           <div  class="col-4 /*border border-warning*/ bg-light shadow" style="margin: auto;"><%-- <!--in this all contents are there-->--%>
													
													 
												<c:choose>
													
														 <c:when test= "${crud == false}">
																 <div class="mb-2">
																 
																  
																	<label for="Id" class="text-color"> Customer Id</label>
																	<input  type="text" id="Id"  name="id" placeholder="enter the id" class="form-control"   required onblur="validate_ID()"  disabled></input>
																	<span id="Id_message"></span>
																	
																 </div>
														</c:when> 
													
													<c:otherwise>
													        <div class="mb-2">
															 
															  
																<label for="Id" class="text-color"> Customer Id</label>
																<input  type="text" id="Id"  name="id" placeholder="enter the id" class="form-control"   required onblur="validate_ID()" />
																<span id="Id_message"></span>
																
															 </div>
													
													</c:otherwise>
													
												   </c:choose>
													 
													 <c:choose>
															 <c:when test= "${crud == false}">
																	        <div class="mb-2" >
																			 
																			 <label for="first_name" class="text-color"> First Name</label>
																			 <input  type="text"  id="first_name"  name="firstName" class="form-control" placeholder="enter the  first name" onblur="validate_first_name()" required  disabled></input>
																		     <span id="first_name_message"></span>
																			
																		  
																		  </div>
															</c:when> 
															
															<c:otherwise>
															          
																		  <div class="mb-2" >
																			 
																			 <label for="first_name" class="text-color"> First Name</label>
																			 <input  type="text"  id="first_name"  name="firstName" class="form-control" placeholder="enter the  first name" onblur="validate_first_name()" required></input>
																		     <span id="first_name_message"></span>
																			
																		  
																		  </div>
															</c:otherwise>
															
												   </c:choose>
													 
													 
													 <c:choose>
															 <c:when test= "${crud == false}">
																	    
															  	  <div class="mb-2" >
																	 
																	 <label for="last_name" class="text-color"> Last Name</label>
																	 <input  type="text" id="last_name" class="form-control" name="lastName" placeholder="enter the last name" onblur="validate_last_name()" required disabled></input>
																     <span id="last_name_message"></span>
																	
													  
													               </div>
															</c:when> 
															
															<c:otherwise>
												          
															  	  <div class="mb-2" >
																	 
																	 <label for="last_name" class="text-color"> Last Name</label>
																	 <input  type="text" id="last_name" class="form-control"  name="lastName" placeholder="enter the last name" onblur="validate_last_name()" required></input>
																     <span id="last_name_message"></span>
																	
													  
													               </div>
															</c:otherwise>
															
												      </c:choose>
													    		 <c:choose>
																         <c:when test= "${crud == false}">
																		    
																			  	 <div class="mb-2">
																				 
																						<label for="mobile" class="text-color">Mobile Number:</label>
																						<input  type="text" id="mobile"  name="mobileNo" class="form-control" placeholder="enter the mobile Number" onblur="validate_mobile()" required  disabled></input>
																				        <span id="mobile_message"></span>
																				 </div>
																      </c:when> 
																		
																		<c:otherwise>
															                      <div class="mb-2">
																				 
																						<label for="mobile" class="text-color">Mobile Number:</label>
																						<input  type="text" id="mobile"  name="mobileNo" class="form-control" placeholder="enter the mobile Number" onblur="validate_mobile()" required></input>
																				        <span id="mobile_message"></span>
																				 </div>
																		  	 
																		</c:otherwise>
															
												                </c:choose>
												                
												                
													 	       <c:choose>
																         <c:when test= "${crud == false}">
																		    
																			  	  <div class="mb-1">
																			
																					<label for="email" class="text-color">Email:</label>
																					<input  type="text" id="email"   name="email" class="form-control" placeholder="enter the email"  onblur="validate_email()" required disabled></input>
																			        <span id="email_message"></span>
													                              </div>
																        </c:when> 
																		
																		<c:otherwise>
															                     <div class="mb-1">
																			
																					<label for="email" class="text-color">Email:</label>
																					<input  type="text" id="email" class="form-control"  name="email" placeholder="enter the email"  onblur="validate_email()" required></input>
																			        <span id="email_message"></span>
													                              </div>
													   
																		  	 
																		</c:otherwise>
															
												                </c:choose>
													            	 <c:choose>
																         <c:when test= "${crud == false}">
																		    
																			  	   <div class="mb-2">
														                    
																						 <label for="pass" class="text-color">Password</label>
																						 <input  type="password" id="pass" class="form-control" name="password" onblur="validate_pass()" required disabled ></input>
																				         <span id="pass_message"></span>
															  
														                            </div>
													 			      </c:when> 
																		
																		<c:otherwise> 
																		
																		     
																			  	   <div class="mb-2">
														                    
																						 <label for="pass" class="text-color">Password</label>
																						 <input  type="password" id="pass" name="password" class="form-control"  onblur="validate_pass()" required  ></input>
																				         <span id="pass_message"></span>
															  
														                            </div>
															          
																		  	 
																		</c:otherwise>
															
												                </c:choose>
													 
													 
													 	 <c:choose>
																         <c:when test= "${crud == false}">
																		    
																			  	 <div class="mb-2">
														                    
																						 <label for="cpass" class="text-color"> Confirm Password</label>
																						<input  type="password" id="cpass" class="form-control"  onblur="validate_cpass()" required  disabled ></input>
																				         <span id="cpass_message"></span>
														  
														                        </div>
																      </c:when> 
																		
																		<c:otherwise>
															                    <div class="mb-2">
														                    
																						 <label for="cpass" class="text-color"> Confirm Password</label>
																						<input  type="password" id="cpass" class="form-control"  onblur="validate_cpass()" required></input>
																				         <span id="cpass_message"></span>
														  
														                        </div>
																		  	 
																		</c:otherwise>
															
												           </c:choose>
													 
													               	 <c:choose>
																         <c:when test= "${crud == false}">
																		    
																			  	     <div class="mb-1">
																						
																								<label for="address" class="text-color">Address:</label>
																								<textarea   rows="2" cols="10"  id="address" name="address" class="form-control" placeholder="enter the address"  required disabled></textarea>
																						        <span id="address_message"></span>
													                                 </div>
													   										
																      </c:when> 
																		
																		<c:otherwise>
																		
																		           <div class="mb-1">
																						
																								<label for="address" class="text-color">Address:</label>
																								<textarea   rows="2" cols="10"  id="address"  name="address" class="form-control" placeholder="enter the address"  required></textarea>
																						        <span id="address_message"></span>
													                                 </div>
													   															          
																		  	 
																		</c:otherwise>
															
												                </c:choose>
													 
													 
													               <c:choose>
																         <c:when test= "${crud == false}">
																		    
																			  	     <div class="mb-1">
																						
																								<label for="userid_via_loginid" class="text-color"></label>
																								<input type="hidden" id="userid_via_loginid" name="userIdViaLoginIdCheck" class="form-control"   value="${sessionScope.login.userIdViaLoginId}"  disabled></input>
																						        
													                                 </div>
													   										
																      </c:when> 
																		
																		<c:otherwise>
																		
																		           <div class="mb-1">
																						
																								   
																						        <div class="mb-1">
																								<label for="userid_via_loginid" class="text-color"></label>
																								<input type="hidden" id="userid_via_loginid" name="userIdViaLoginIdCheck" class="form-control"   value="${sessionScope.login.userIdViaLoginId}" ></input>
																						        </div>
													                                             
													                                 </div>
													   															          
																		  	 
																		</c:otherwise>
															
												                </c:choose>
													 
													 
													 
													 
													 
													           	 <c:choose>
																         <c:when test= "${crud == false}">
																              <%--    <%System.out.println("inside the button where it is disabled"); %> --%><%--it is scriplet for java code and it is for the server side  --%>
															<%-- 	                 <%System.out.println("inside the button where it is disabled"+session.getAttribute("dashboard"));%> --%><%--convert teh while transition phasw from teh jsp to .java there it will convert teh out --%>
																                 <c:choose>
																	                  <c:when  test="${sessionScope.dashboard == 'allThreeOption'}"><%--it will call the in the session.getAttribute("dashbored") --%>
																					       <div class=" mb-2 text-center">
																					                     <%System.out.println("inside the button where it is all three option &disabled save button  only"); %><%--it is scriplet for java code and it is for the server side  --%>
																								         <button class="btn btn-primary"><a href='AllThreeOption.jsp' style="color:white ;text-decoration:none;">Back</a></button><!--save function is called to check all conditions-->
																								         <button class="btn btn-primary"   disabled >Save info</button><!--save function is called to check all conditions-->
																							  </div>        
															                           </c:when>
															                           
															                            <c:when  test="${sessionScope.dashboard == 'allTwoOption'}"><%--it will call the in the session.getAttribute("dashbored") --%>
																					       <div class=" mb-2 text-center">
																					                   <%--  <%System.out.println("inside the button where it is all two option &disabled save button  only"); %> --%><%--it is scriplet for java code and it is for the server side  --%>
																								         <button class="btn btn-primary"><a href='AllTwoOption.jsp' style="color:white ;text-decoration:none;">Back</a></button><!--save function is called to check all conditions-->
																								         <button class="btn btn-primary"   disabled >Save info</button><!--save function is called to check all conditions-->
																							  </div>        
															                           </c:when>
															                            
															                            <c:when  test="${sessionScope.dashboard == 'allOneOption'}"><%--it will call the in the session.getAttribute("dashbored") --%>
																					       <div class=" mb-2 text-center">
																								          <button class="btn btn-primary"><a href='#' style="color:white ;text-decoration:none;">Back</a></button><!--save function is called to check all conditions-->
																								         <button class="btn btn-primary"   disabled >Save info</button><!--save function is called to check all conditions-->
																							  </div>        
															                           </c:when>
														                        </c:choose>
														                           
																      </c:when> 
																		
																		<c:otherwise>
																		              <%--  <%System.out.println("inside the button where it is enabled"); %> --%><%--it is scriplet for java code and it is for the server side  --%>
																		       <c:choose>
																			        <c:when test="${sessionScope.dashboard == 'allThreeOption'}">
																				          <div class=" mb-2 text-center">
																							           <button class="btn btn-primary"><a href='AllThreeOption.jsp' style="color:white ;text-decoration:none;">Back</a></button><!--save function is called to check all conditions-->
																							            <input type="submit"  value="Save info" class="btn btn-primary" ></input><!--save function is called to check all conditions-->
																						  </div>        
															                        </c:when>
															                            <c:when test="${sessionScope.dashboard == 'allTwoOption'}">
																				          <div class=" mb-2 text-center">
																							          <button class="btn btn-primary"><a href='AllTwoOption.jsp' style="color:white ;text-decoration:none;">Back</a></button><!--save function is called to check all conditions-->
																							          <input type="submit" value="Save info" class="btn btn-primary" ></input><!--save function is called to check all conditions-->
																						  </div>        
															                        </c:when>
															                           <c:when test="${sessionScope.dashboard == 'allOneOption'}">
																				          <div class=" mb-2 text-center">
																							         <button class="btn btn-primary"><a href='AllTwoOption.jsp' style="color:white ;text-decoration:none;">Back</a></button><!--save function is called to check all conditions-->
																							          <input type="submit" value="Save info" class="btn btn-primary" ></input><!--save function is called to check all conditions-->
																						  </div>        
															                        </c:when>
															                       
														                       </c:choose>
											 
															          
																		  	 
																		</c:otherwise>
															
												                </c:choose>
													 
													 
										    </div>
								
							</form>
							
							
							
							
						<form  action="CrudOperation2.jsp" method="post">
						         
						      
						          	     
												       
	
						           
						          <c:set var="requestDelete" value="CustomerDelete"  scope="session"/>
						      
						
						
								
								 <div class="col-4 /*border border-warning*/ bg-light shadow"  style=" width: 73rem"><!-- it will not work instead it will only work in case of server  b/z it will fetch data from it-->
										
											<div class=" /*border border-dark*/ text-center">
													
											        <c:set var="read_request" value="CustomerRead" scope="session"/>
													
													<input type="submit" value="Customer Info" class="btn btn-primary"  /*onclick="fetch_customer_details()"*/ ></input>											
												    <input type="button" class="btn btn-primary"  onclick="reset_table_body()" value="clear"/>
												    
											</div>	 
											 
											 <table class="table table-striped table-hover /*border border-secondary*/">
												  
												  <thead>
												     <tr>
														   <th>Customer Id</th>
														   <th> Customer First Name</th>
														   <th> Customer Last Name</th>
														   <th>Mobile Number</th>
														   <th>Email</th>
														   <th>Address</th>
												      </tr>
												   </thead>  
												      
												      
												   
												   
												   <tbody id="body-inside">
											
												       <c:if test="${sessionScope.listOfCustomers !='null'}">
												       
												        <c:forEach var="customerdetails" items="${sessionScope.listOfCustomers}">
												              
												              <%--sesssion.getAttribut("listOfCustomers")->return list  --%>  
								                                <%--for each loop run ie salesmanNSchdule object comes  --%>  
								                              
								                             <c:if test="${delete_yes == true}">
								                             
									                             <tr>   
													                  <%--session.getAttribute("customerdetails").getCustomerId()--%>  
													                 <%-- customerdetailes is key its object is returned--%> 
													                 <%--pojo of customer--%>                            
														            <td>${customerdetails.customerId}</td>
														            <td>${customerdetails.customerfirstName}</td>
														            <td>${customerdetails.customerLastName}</td>
														            <td>${customerdetails.customerMobileNo}</td>
														            <td>${customerdetails.customerEmail}</td>
														            <td>${customerdetails.customerAddress}</td> 
														            <td><button type="button"  onclick="return confirm('delete customer details');" class="btn btn-danger"><a href="CrudOperation3.jsp?customerIdToDelete=${customerdetails.customerId}"  style="text-decoration: none;color: black;font-weight: bolder;" >Delete</a></button></td>
													            </tr>
								                             
								                             </c:if>
								                            
								                            
								                              <c:if test="${delete_yes == false}">
								                             
									                             <tr>   
													                  <%--session.getAttribute("customer details").getCustomerId()--%>  
													                 <%-- customer details is key its object is returned--%> 
													                 <%--pojo of customer--%>                            
														            <td>${customerdetails.customerId}</td>
														            <td>${customerdetails.customerfirstName}</td>
														            <td>${customerdetails.customerLastName}</td>
														            <td>${customerdetails.customerMobileNo}</td>
														            <td>${customerdetails.customerEmail}</td>
														            <td>${customerdetails.customerAddress}</td> 
														            
														            <%--you can remove this button also instead of disable it--%> 
														            <td><button type="button"  onclick="return confirm('delete customer details');" class="btn btn-danger" disabled><a href="CrudOperation3.jsp?customerIdToDelete=${customerdetails.customerId}"  style="text-decoration: none;color: black;font-weight: bolder;" >Delete</a></button></td>
													            </tr>
								                             
								                             </c:if> 
								                             
								                           
								                              
								                              
								                                				              
												                                        
												         </c:forEach>   
												            
												       </c:if>   
												            
												       
												   </tbody>
													   
												   
												 
											 
											 
											 
											 
											</table>
										       
										      
										       
										       
										
							 		</div>									
									
								
						</form>
				

	 
	           
	           
	           
	           
         </div>
	   
	 
	  </div>
	  
	  
	  
						      
	</body>
   
   
</html>			
																
					          
									
									
								
												
												
												
												
						
						
			
				
				
											 
													 
												
													  
													  
													  
													  
													  
													 
														 
													
													 	 
														 
														 
														
														  
														  
														  
														
														  
														  
													 
													
													   
													
													       
													
														  
														  
											             
											 
													 
												
											   
										  

   