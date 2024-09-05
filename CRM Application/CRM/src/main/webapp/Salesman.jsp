<%--444444444444444444444444444444444444444444444444444444444444444444444444444444444444444 --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
		
		<link rel="stylesheet" href="crud.css">
		
<meta charset="ISO-8859-1">
 <title> Salesman Details</title>
   		
           
		
					
	
		 <script>
			 
				     var Salesman=[];
			          
				     
				 
					 
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
							 
							 Salesman.push(temp);
							<!--console.log(Salesman[i].id1+Salesman[i].name1+Salesman[i].mobile1+Salesman[i].email1+Salesman[i].pass1+Salesman[i].address1);-->
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
			
			
			
			function fetch_Salesman_details(){
			   var html="";
			  
			   for(var i=0;i<Salesman.length;i++){
			   
			   html+="<tr><td>"+Salesman[i].id1+"</td><td>"+Salesman[i].first_name1+"</td><td>"+Salesman[i].last_name1+"</td><td>"+Salesman[i].mobile1+"</td><td>"+Salesman[i].email1+"</td><td>"+Salesman[i].address1+"</td></tr>";
			   
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
					 if(arr[0]!="s")
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
					   {document.getElementById("Id_message").innerHTML="id must start with s and  10 digit";
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
			    if(document.getElementById("email").value == ""){
				      document.getElementById("email_message").innerHTML="not valid email"
			           return false;
			    }
				      else{
					     document.getElementById("email_message").innerHTML="";
					     return  true;
				      }
			    
			   
			   }
			  
			   
			   function change_id_inputbox_value(){
				        
				       var scheduletype=document.getElementById("scheduletype").value;
				         console.log("inside box cjech for schedule")
				         
				         
				         if(scheduletype == ""){
				        	    document.getElementById("scheduletype_message").innerHTML="select schedule type";
				            return false;
				         }
				         
				         if( scheduletype == "Morning"){
				        	 document.getElementById("scheduleid").value="sh1111111111";
				             return true;}
				   
				         if( scheduletype == "Night"){
				        	 document.getElementById("scheduleid").value="sh1111111112";
				            return true;
				            }
				       
				       return false;
				       
				   
			   }
			   
			   
			   
		 
		 </script>
	
</head>

    <body>
        <%--bydefault scope is page --%>
          <c:set var="crud"  value="${false}"/>
     <!--      BY DEFAULT CONSIDERIGN THAT HE CAN READ ONLY SO CRUD IS CONSIDERED FALSE  --> 
     
     
     
       <!--  by default the scope is page -->  
       <c:set var="delete_yes" value="${false}"/>
       <!--BY DEFAULT CONSIDERING THAT HE CANNNOT DO DELETE ONLY SO CRUD IS CONSIDERED FALSE --> 
     
     
          <%System.out.println("in the salesman.jsp") ;%>
    <!-- AS SOON AS UPADATE AND INSERT PERMSSIISON COME IT IS CONSIDERED BOX WILL NOT BE DISABLED        -->
     <!--     this below for each loop and inside when condition is only for enabling or disabling the input box or tags and insert and update  -->
             <c:forEach var="crud_permission" items="${sessionScope.login.permission()}"><%--here all perNameList comes ie create, read,update delete --%>
		         <%--   <c:out value="${crud_permission}"/> --%>
		          <c:choose>
		    
		                        
		                     
		                    
		                 
		                  <c:when test="${crud_permission.toUpperCase() == 'SALESMANCREATE' }">
		                        
		                         <c:set var="crud"  value="${true}"/>
		                         <%--bydefault scope is page --%>
		                       <%--   ${pageScope.crud} --%>
		                         
		                 </c:when>
		                 
		                  <c:when test="${crud_permission.toUpperCase() == 'SALESMANUPDATE' }">
		                    
		                         <c:set var="crud"  value="${true}"/>
		                         <%--bydefault scope is page --%>
		                        
		                        
		                 </c:when>
		                 
		                 <c:when test="${crud_permission.toUpperCase() == 'SALESMANDELETE'}">
		                 
		                          <c:set var="delete_yes" value="${true}"/>
		                 
		                 
		                 
		                 </c:when>
		           
		          </c:choose>
		      
		      
		     </c:forEach>
    	       <!--     this above for each loop and inside condition is only for enabling or disabling the input bx or tags and insert and update  --> 
    
    
    
          	    
	    <!--   this if condition is only to tell to CrudOperation.jsp page that request came from salesman.jsp of insert and update ie from inputbox and then at backend accordingly the insert adn update happen  -->
	       <c:if  test="${crud == true}">
	          <c:set var="crud_typeNPageName" value="salesmanNinsertNupdate" scope="session"/>
	        </c:if>
	        
	        
	       
    
    
    
    
    
    
    
    
	  <div class="main-container" style="width: 99vw;">
			       <div class="row /*border border-primary*/" >
				        <div class="col-2 /*border border-success*/ column1">
						 CMS
						
						</div>
				         <div class="col-8 /*border border-success*/ column2">
						 
						 Salesman Details
						</div>
						<div class="col-2 /*border border-success*/ column3">
						  <a class="nav-link mx-4" style="color: white;font-family: initial;opacity: 0.5;font-size: 2rem;font-style: italic;"   href="Logout.jsp">LogOut</a>
		                                                                                                                                          <!-- 	pageContext.getSession().invalidate() -->				                                                                                       
						</div> 
						
						  <div  style="width: 13rem;height: 1rem;margin-left: 73rem;color: #f9f6f6;">
	                                   <h5  style=" font-size: 1.25rem;text-align: center;font-weight: revert-layer;"> Hello! ${sessionScope.login.loginFirstName}</h5> 
                                       <h5 style=" font-size: 1.25rem;text-align: center;font-weight: revert-layer;">(${sessionScope.login.loginRole})</h5>
	                       </div>
						 
						
						
				   </div>
		   
	          <!-- gutter making gaps b/w teh columns  ie gy (y diretcion )and gx(x direction) are making teh gaps in teh columns , py and px are padding in x and y direction , mx and mx -->
		        <div class="row /*border border-warning*/ justify-content-center align-items-center p-5  bg-light mx-5 my-5 gx-5 gy-5"  style="  background-image: linear-gradient(to bottom,#aea0a0,white);}"><!-- this row is made then only column can be there -->
							             
							                         
							       <form  action="CrudOperation.jsp" onsubmit="return confirm('submit salesaman details');"  method="post">           
								                
									         <div  class="col-12 /*border border-warning*/ " style=" color:black ;text-align:center;"><!--in this all contents are there-->
													          <h5>${sessionScope.salesman.message}</h5>
													          <%--sesssin.getAttribute("salesman").getMessage() --%>	
											</div>
											
							              
										            
										    
											   <div  class="col-4 /*border border-warning*/ bg-light shadow" style="margin: auto;"><!--in this all contents are there-->
												
												  
												   <c:choose>
														 <c:when test= "${crud == false}">
														        	 
													 <div class="mb-2">
													 
													  
														<label for="Id" class="text-color"> Salesman Id</label>
														<input  type="text" id="Id" name="salesmanId" placeholder="enter the id" class="form-control"   required onblur="validate_ID()" disabled></input>
														<span id="Id_message"></span>
														
													 </div>
													 
															
														</c:when> 
													
													<c:otherwise>
													     	 
													 <div class="mb-2">
													 
													  
														<label for="Id" class="text-color"> Salesman Id</label>
														<input  type="text" id="Id" name="salesmanId" placeholder="enter the id" class="form-control"   required onblur="validate_ID()"></input>
														<span id="Id_message"></span>
														
													 </div>
													 
													
													</c:otherwise>
													
												   </c:choose>
												       
												       
												       
												   
												   
												      <c:choose>
														 <c:when test= "${crud == false}">
														      
																	  <div class="mb-2" >
																		 
																		 <label for="first_name" class="text-color"> First Name</label>
																		 <input  type="text" id="first_name" name="salesmanFirstName" class="form-control" placeholder="enter the  first name" onblur="validate_first_name()" required disabled ></input>
																	     <span id="first_name_message"></span>
																		
																	  
																	  </div>
													  
																		
														</c:when> 
													
													<c:otherwise>
													    
													  <div class="mb-2" >
														 
														 <label for="first_name" class="text-color"> First Name</label>
														 <input  type="text" id="first_name" class="form-control" name="salesmanFirstName"  placeholder="enter the  first name" onblur="validate_first_name()" required></input>
													     <span id="first_name_message"></span>
														
													  
													  </div>
													  
													 
													
													</c:otherwise>
													
													
													
												   </c:choose>
													  
												      <c:choose>
														 <c:when test= "${crud == false}">
														 
														 
														       	
															   <div class="mb-2" >
																 
																 <label for="last_name" class="text-color"> Last Name</label>
																 <input  type="text" id="last_name" class="form-control" name="salesmanLastName" placeholder="enter the last name" onblur="validate_last_name()" required disabled ></input>
															     <span id="last_name_message"></span>
																
															  
															  </div>
													  
															
														</c:when> 
													
													<c:otherwise>
													
													
													   <div class="mb-2" >
														 
														 <label for="last_name" class="text-color"> Last Name</label>
														 <input  type="text" id="last_name" class="form-control" name="salesmanLastName" placeholder="enter the last name" onblur="validate_last_name()" required></input>
													     <span id="last_name_message"></span>
														
													  
													  </div>
													  
													     
													
													</c:otherwise>
													
												   </c:choose>
													  
											              
												   
												  <c:choose>
														 <c:when test= "${crud == false}">
														 
														         
													   <div class="mb-2">
														 
																<label for="balance" class="text-color">Mobile Number:</label>
																<input  type="text" id="mobile" class="form-control"  name="salesmanMobileNo" placeholder="enter the mobile Number" onblur="validate_mobile()" required disabled ></input>
														        <span id="mobile_message"></span>
														 </div>
															
														</c:when> 
													
													<c:otherwise>
													
													           
													   <div class="mb-2">
														 
																<label for="balance" class="text-color">Mobile Number:</label>
																<input  type="text" id="mobile" class="form-control" placeholder="enter the mobile Number"  name="salesmanMobileNo" onblur="validate_mobile()" required></input>
														        <span id="mobile_message"></span>
														 </div>
													     
													
													</c:otherwise>
													
												   </c:choose> 
													  
													  
													     <c:choose>
																 <c:when test= "${crud == false}">
																 
																     <div class="mb-1">
														
																				<label for="email" class="text-color">Email:</label>
																				<input  type="text" id="email" class="form-control"  name="salesmanEmail" placeholder="enter the email"  onblur="validate_email()" required  disabled ></input>
																		        <span id="email_message"></span>
													                </div>
													   
																 
																	
																</c:when> 
															
																<c:otherwise>
																
																
																          <div class="mb-1">
														
																				<label for="email" class="text-color">Email:</label>
																				<input  type="text" id="email" class="form-control"  name="salesmanEmail" placeholder="enter the email"  onblur="validate_email()" required></input>
																		        <span id="email_message"></span>
													                   </div>
																     
																
																</c:otherwise>
													
												          </c:choose>
													  
													  
													        <c:choose>
																 <c:when test= "${crud == false}">
																 
																       <div class="mb-2">
																                    
																		 <label for="pass" class="text-color">Password</label>
																		<input  type="password" id="pass" class="form-control"  onblur="validate_pass()" name="salesmanPassword" required  disabled ></input>
																         <span id="pass_message"></span>
														  
														              </div>
																	
																</c:when> 
															
																<c:otherwise>
																
																
																         <div class="mb-2">
														                    
																			 <label for="pass" class="text-color">Password</label>
																			<input  type="password" id="pass" class="form-control"  onblur="validate_pass()" name="salesmanPassword"  required></input>
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
																												<textarea   rows="2" cols="10"  id="address" class="form-control" name="salesmanAddress" placeholder="enter the address"  required disabled ></textarea>
																										        <span id="address_message"></span>
																									   </div>
																						
																					</c:when> 
													
																					<c:otherwise>
																					     
																								   <div class="mb-1">
																									
																											<label for="address" class="text-color">Address:</label>
																											<textarea   rows="2" cols="10"  id="address" class="form-control" name="salesmanAddress" placeholder="enter the address"  required></textarea>
																									        <span id="address_message"></span>
																								   </div>
																					
																					</c:otherwise>
													
												                             </c:choose>
												                             
												                          <c:choose>
																         <c:when test= "${crud == false}">
																		    
																			  	     <div class="mb-1" style="height: 0rem;">
																						
																								<label for="userid_via_loginid" class="text-color"></label>
																								<input type="hidden" id="userid_via_loginid" name="userIdViaLoginIdCheckForSlmn" class="form-control"   value="${sessionScope.login.userIdViaLoginId}"  disabled></input>
																						        
													                                 </div>
													   										
																      </c:when> 
																		
																		<c:otherwise>
																		
																		           <div class="mb-1">
																						
																								   
																						        <div class="mb-1" style="height: 0rem;">
																								<label for="userid_via_loginid" class="text-color"></label>
																								<input type="hidden" id="userid_via_loginid" name="userIdViaLoginIdCheckForSlmn" class="form-control"   value="${sessionScope.login.userIdViaLoginId}" ></input>
																						        </div>
													                                             
													                                 </div>
													   															          
																		  	 
																		</c:otherwise>
															
												                </c:choose>
												                
											                     <c:choose>
															         <c:when test= "${crud == false}">
																	    
																		  	     <div class="mb-1">
																					
																							<label for="scheduleid" class="text-color"></label>
																							<input type="hidden" id="scheduleid" name="salesmanScheduleId" class="form-control"    disabled></input>
																					        
												                                 </div>
												   										
															         </c:when> 
																	
																	<c:otherwise>
																	
																	           <div class="mb-1">
																					
																							   
																					        <div class="mb-1">
																							<label for="scheduleid" class="text-color"></label>
																							<input type="hidden" id="scheduleid" name="salesmanScheduleId" class="form-control" ></input>
																					        </div>
												                                             
												                                 </div>
												   															          
																	  	 
																	</c:otherwise>
														
											                </c:choose>
											                
											                <c:choose>
															     <c:when test= "${crud == false}">
																		 
																		      
																      <div class="mb-1">
																			  
																		 
																		  <label for="scheduletype"  class="text-color" >Schedule Type</label>
																	      <select id="scheduletype"  name="scheduleType" onblur="change_id_inputbox_value()" disabled>
																			  <option value="" selected></option>
																			  <option value="Morning">Morning(9amTo5pm)</option>
																			  <option value="Night">Night(8pmTo5am)</option>
																		  
																		 </select>
																		 <span id="scheduletype_message"></span>
																	   </div>
																	   
																	   
																			
																   </c:when> 
																	
																	<c:otherwise>
																		
																		 <div class="mb-1">
																			  
																		
																		      <label for="scheduletype"  class="text-color"  >Schedule Type</label>
																		      <select id="scheduletype"  name="scheduleType" onblur="change_id_inputbox_value()">
																		           <option value="" selected></option>
																		          <option value="Morning">Morning(9amTo5pm)</option>
																				  <option value="Night">Night(8pmTo5am)</option>
																			 </select>
																	           <span id="scheduletype_message"></span>
																	      </div> 
																		  
																	
																	   
																	   
																	     
																	
																	</c:otherwise>
													
												              </c:choose>
											                
											                
											                
											                
											                
											                
											                
												                
												                
													                     <c:choose>
																					 <c:when test= "${crud == false}">
																					 
																					         
																									   <div class="mb-1">
																										
																												<label for="scheduledescription" class="text-color">Schedule Description:</label>
																												<textarea   rows="2" cols="10"  id="scheduledescription" class="form-control" name="salesmanScheduleDescription" placeholder="enter schedule description"  required disabled ></textarea>
																										        <span id="scheduledescription_message"></span>
																									   </div>
																						
																					</c:when> 
													
																					<c:otherwise>
																					     
																								   <div class="mb-1">
																									
																											<label for="scheduledescription" class="text-color">Schedule Description:</label>
																											<textarea   rows="2" cols="10"  id="scheduledescription" class="form-control" name="salesmanScheduleDescription" placeholder="enter schedule description"  required></textarea>
																									        <span id="scheduledescription_message"></span>
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
																								         <button class="btn btn-primary"  disabled >Save info</button><!--save function is called to check all conditions-->
																							  </div>        
															                           </c:when>
															                            
															                            <c:when  test="${sessionScope.dashboard == 'allOneOption'}"><%--it will call the in the session.getAttribute("dashbored") --%>
																					       <div class=" mb-2 text-center">
																								          <button class="btn btn-primary"><a href='#' style="color:white ;text-decoration:none;">Back</a></button><!--save function is called to check all conditions-->
																								         <button class="btn btn-primary"  disabled >Save info</button><!--save function is called to check all conditions-->
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
																							        <input type="submit" value="Save info"   class="btn btn-primary" ></input><!--save function is called to check all conditions-->
																						  </div>        
															                        </c:when>
															                            <c:when test="${sessionScope.dashboard == 'allTwoOption'}">
																				          <div class=" mb-2 text-center">
																							          <button class="btn btn-primary"><a href='AllTwoOption.jsp' style="color:white ;text-decoration:none;">Back</a></button><!--save function is called to check all conditions-->
																							        <input type="submit" value="Save info"   class="btn btn-primary" ></input><!--save function is called to check all conditions-->
																						  </div>        
															                        </c:when>
															                           <c:when test="${sessionScope.dashboard == 'allOneOption'}">
																				          <div class=" mb-2 text-center">
																							          <button class="btn btn-primary"><a href='#' style="color:white ;text-decoration:none;">Back</a></button><!--save function is called to check all conditions-->
																							          <input type="submit" value="Save info"   class="btn btn-primary" ></input><!--save function is called to check all conditions-->
																						  </div>        
															                        </c:when>
															                       
														                       </c:choose>
											 
															          
																		  	 
																		</c:otherwise>
															
												                </c:choose>
										  
										  </div>
								  
							</form>
						     
						<form  action="CrudOperation2.jsp"  method="post"> 	
						
						
						
						         <c:set var="requestDelete" value="SalesmanDelete"  scope="session"/>
						         
						         
							       
								 <div class="col-4 /*border border-warning*/ bg-light shadow"  style=" width: 73rem"><!-- it will not work instead it will only work in case of server  b/z it will fetch data from it-->
									 <div class=" /*border border-dark*/ text-center">
									 
										   <c:set var="read_request" value="SalesmanRead" scope="session"/>
						
										   <input type="submit" class="btn btn-primary"  value="Salesman Info" /*onclick="fetch_Salesman_details()"*/ />											
									       <input type="button" class="btn btn-primary" onclick="reset_table_body()" value="clear"/>
									 </div>
									 
									 <table class="table table-striped table-hover /*border border-secondary*/">
										  
										  <thead>
										     <tr>
												   <th>Salesman Id</th>
												   <th> Salesman First Name</th>
												   <th> Salesman Last Name</th>
												   <th>Mobile Number</th>
												   <th>Email</th>
												   <th>Address</th>
												   <th>Schedule Id</th>
												   <th>Schedule Type</th>
												   <th>Schedule Description</th>
										      </tr>
										   </thead>
										   
										   <tbody id="body-inside">
										   
										       <c:if test="${sessionScope.listOfSalesman!='null'}">
											       
											        <c:forEach var="salesmandetails" items="${sessionScope.listOfSalesman}">
											              <%--sesssion.getAttribut(listOfCustomers")->return list  --%>  
											              <%--for each loop run ie salesmanNSchdule object comes  --%>  
											           
											           
											           <c:if test="${delete_yes == true}">
												              <tr>  
												                  <%--session.getAttribute("salesmandetails").getSalesmanId()--%> 
												                    <%-- salesmandetailes is key its object is returned--%>                         
													            <td>${salesmandetails.salesmanId}</td>
													            <td>${salesmandetails.salesmanFirstName}</td>
													            <td>${salesmandetails.salesmanLastName}</td>
													            <td>${salesmandetails.salesmanMobileNo}</td>
													            <td>${salesmandetails.salesmanEmail}</td>
													            <td>${salesmandetails.salesmanAddress}</td>
												                <td>${salesmandetails.salesmanScheduleId}</td>
													            <td>${salesmandetails.salesmanScheduleType}</td>
													            <td>${salesmandetails.salesmanScheduleDescription}</td>
												                <td><button type="button"  onclick="return confirm('delete salesman details');"  class="btn btn-danger"><a href="CrudOperation3.jsp?salesmanIdToDelete=${salesmandetails.salesmanId}"  style="text-decoration: none;color: black;font-weight: bolder;" >Delete</a></button></td>
												            </tr>
												           
											           
											           </c:if>
											           
											            <c:if  test="${delete_yes == false}">
											            
											                  <tr>  
												                  <%--session.getAttribute("salesman details").getSalesmanId()--%> 
												                    <%-- salesman details is key its object is returned--%>                         
													            <td>${salesmandetails.salesmanId}</td>
													            <td>${salesmandetails.salesmanFirstName}</td>
													            <td>${salesmandetails.salesmanLastName}</td>
													            <td>${salesmandetails.salesmanMobileNo}</td>
													            <td>${salesmandetails.salesmanEmail}</td>
													            <td>${salesmandetails.salesmanAddress}</td>
												                <td>${salesmandetails.salesmanScheduleId}</td>
													            <td>${salesmandetails.salesmanScheduleType}</td>
													            <td>${salesmandetails.salesmanScheduleDescription}</td>
												                
												                
												                 <%--you can remove this button also instead of disable it--%> 
												                <td><button type="button"  onclick="return confirm('delete salesman details');"  class="btn btn-danger"  disabled><a href="CrudOperation3.jsp?salesmanIdToDelete=${salesmandetails.salesmanId}"  style="text-decoration: none;color: black;font-weight: bolder;">Delete</a></button></td>
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
	   </form>  
	</body>
   
   
</html>
   
													  
													  
												  
										    
											   
													  
													