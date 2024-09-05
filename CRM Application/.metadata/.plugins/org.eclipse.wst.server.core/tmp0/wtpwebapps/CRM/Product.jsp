<%--444444444444444444444444444444444444444444444444444444444444444444444444444444444444444 --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>

<!DOCTYPE html>


<html>
       	 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		 <!-- bootstrap css link-->
		 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
			<!--bootstrap link jquery link -->
			
		<link rel="stylesheet" href="crud.css">
		<!--my css link -->
		  
		<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>
		<!-- extra jquery link-->
	
           

<head>
<meta charset="ISO-8859-1">
 <title> Product Details</title>
   	
		
					
	
		 <script>
			  
	     
		   $(document).ready( function(){
		       
			   var Product =[];
		       	 
		 
					   
				
			      function save(){
				 
				 var id=$("#Id").val();
				 var name=$("#name").val();
				 var product_type=$("#product_type").val();
				 var quantity=$("#quantity").val();
				
				 var description=$("#description").val();
			     console.log(id+name+quantity+product_type+description);
			
			  
				 
				 
				 var id_check = validate_ID();
			     var name_check = validate_name();
				 var quantity_check =validate_quantity();
				
			   
				 
				 if(id_check && name_check && quantity_check)
				 {
						 var temp={
						 
						   id1:id,
						   name1:name,
						   product_type1:product_type,
						   quantity1:quantity,
						   description1:description,
						  
					
						 
						 }
						 
						 Product.push(temp);
						
					<!--console.log(Product[i].id1+Product[i].name1+Product[i].quantity1+Product[i].product_type1+Product[i].description1);-->
						 reset();
					  
					 return true; <!--after validation the function return   true-->
				}
		       return false;<!-- after validation the function return false if validation is not true -->
	       }
		
		     function reset(){
					 $("#Id").val("");
					 $("#name").val("");
				     $("#quantity").val("");
				    <!-- $("#product_type").val("");-->
			        
					 $("#description").val("");
				
			}
					  
		    $("#clear").click(function(){
			    	console.log("inside the table reset");
			    	document.getElementById("body-inside").innerHTML="";
			    	
			    	
			    	
			    })
		     
		
		
		$("#fetch_Product_details").click(function(){
		   var html="";
		  
		   for(var i=0;i<Product.length;i++){
		   
		   html+="<tr><td>"+Product[i].id1+"</td><td>"+Product[i].product_type1+"</td><td>"+Product[i].name1+"</td><td>"+Product[i].quantity1+"</td><td>"+Product[i].description1+"</td></tr>";
		   
		   }
		
		  $("#body-inside").html(html);
		  console.log(html);
		}
	)
		   var flag1;<!--i am considering it is a number-->
		   var count;
		   
		   
		 $("#Id").blur( function validate_ID(){
		  console.log("inside validate id");
		           count=0;
		           flag1=true;
				  var arr=[];
				  arr =($("#Id").val()).split("");
				 if(arr[0]!="p")
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
				    -
					 $("#Id_message").html("");
					  return true;
				 
				 }
			
	          else
				   {$("#Id_message").html("id must start with p and  10 digit");
					return false;
			   } 
					
			
		  
		   
			 
	   } )
	   
			 
		 $("#name").blur(   function validate_name(){
		    console.log("inside validate name");
		   	if($("#name").val().length < 1)
			    { 
					$("#name_message").html("not valid name");
					 return false;
				}
			    
		  
		  
	       else
		    {
			   $("#name_message").html("");
			   return true;
			
			}			   
		   
		   
		   })
		   
		   var flag2;
		    $("#quantity").blur( function validate_quantity(){
		    console.log("inside validate quantity");
		       flag2=true;
			   var arr=[];
			   arr =($("#quantity").val()).split("");
			   for(var i=0;i<(arr.length);i++){
				          if(isNaN(parseInt(arr[i])))
						       flag2=false;
				      
				 }
				 	 if((flag2 ) &&  (($("#quantity").val())>0))
					 {	 $("#quantity_message").html("");
						  return true;
				      }
					  else
					   {
						   $("#quantity_message").html("quantity must be number and greater than 0");
							return false;
					   }
             
		         })
				
				 
				}
					 
	  )  
						
	 
		 </script>
	   
			
		 
	
</head>


 <body>
 <%--bydefault scope is page --%>
     <c:set var="crud"  value="${false}}"/>
   <!--      BY DEFAULT CONSIDERIGN THAT HE CAN READ ONLY SO CRUD IS CONSIDERED FALSE  --> 
 
     <!--  by default the scope is page -->  
       <c:set var="delete_yes" value="${false}"/>
       <!--BY DEFAULT CONSIDERING THAT HE CANNNOT DO DELETE ONLY SO CRUD IS CONSIDERED FALSE --> 
 
  <%System.out.println("in the product.jsp");%>

 
 <!-- AS SOON AS UPADATE AND INSERT PERMSSIISON COME IT IS CONSIDERED BOX WILL NOT BE DISABLED        -->
   <!--     this below for each loop and inside when condition is only for enabling or disabling the input box or tags  and insert and update -->
            <c:forEach var="crud_permission" items="${sessionScope.login.permission()}"><%--here all perNameList comes ie create, read,update delete --%>
		         
											
		           
		           
		           
		            <%--  <c:out value="${crud_permission}"/>  --%>
		          <c:choose>
		          
		                  <c:when test="${crud_permission.toUpperCase() == 'PRODUCTCREATE' }">
		                       
		                         <c:set var="crud"  value="${true}"/>
		                         <%--bydefault scope is page --%>
		                       <%--   ${pageScope.crud} --%>
		                     
		                 </c:when>
		                 
		                  <c:when test="${crud_permission.toUpperCase() == 'PRODUCTUPDATE' }">
		                       
		                         <c:set var="crud"  value="${true}"/>
		                         <%--bydefault scope is page --%>
		                        <%--  ${pageScope.crud} --%>
		                         
		                 </c:when>
		                 
		                  <c:when test="${crud_permission.toUpperCase() == 'PRODUCTDELETE'}">
		                 
		                          <c:set var="delete_yes" value="${true}"/>
		                 
		                 
		                 
		                 </c:when>
		          
		                
		          </c:choose>
		      
		      
		     </c:forEach>
    			       <!--     this above for each loop and inside condition is only for enabling or disabling the input bx or tags and insert and update  -->               
	
		    
	    <!--   this if condition is only to tell to CrudOperation.jsp page that request came from product.jsp of insert and update ie from inputbox and then at backend accordingly the insert adn update happen  -->
	       <c:if  test="${crud == true}">
	          <c:set var="crud_typeNPageName" value="productNinsertNupdate" scope="session"/>
	        </c:if>
	        
	        
	       
	
	
	
	
	
	
	
   <div class="main-container" style="width: 99vw;">
		       <div class="row /*border border-primary*/" >
					        <div class="col-2 /*border border-success*/ column1">
							 CMS
							
							</div>
					         <div class="col-8 /*border border-success*/ column2">
							 
							 Product Details
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
			                                 
							          <form  action="CrudOperation.jsp"   onsubmit="return confirm('submit product details');"  method="post">           
							                
									         <div  class="col-12 /*border border-warning*/ " style=" color:black ;text-align:center;"><!--in this all contents are there-->
													         <h5>${sessionScope.product.message}</h5>	 	
											</div>
										
										            
										    
											   <div  class="col-4 /*border border-warning*/ bg-light shadow"  style="margin: auto;"><!--in this all contents are there-->
													   				             
							                    <c:choose>
														 <c:when test= "${crud == false}">
														   	 <div class="mb-2">
														    
																	<label for="Id" class="text-color"> Product  Id</label>
																	<input  type="text" id="Id" name="productId" placeholder="enter the id" class="form-control"   required /*onblur="validate_ID()"*/ disabled ></input>
																	<span id="Id_message"></span>
															  </div>
													     
														</c:when> 
													
													<c:otherwise>
													
													   <div class="mb-2">
													 
														  
															<label for="Id" class="text-color"> Product  Id</label>
															<input  type="text" id="Id" name="productId" placeholder="enter the id" class="form-control"   required /*onblur="validate_ID()"*/></input>
															<span id="Id_message"></span>
														
													  </div>
													     
													
													</c:otherwise>
													
												   </c:choose>
													  
													 				             
							                    <c:choose>
														 <c:when test= "${crud == false}">
														 
														      
												      <div class="mb-1">
															  
														 <label for="product_type" class="text-color">Product Type</label>
														
													      <select id="product_type"  name="prductType" disabled>
														      <option value="" selected></option>
															  <option value="Electronic" >Electronic</option>
															  <option value="Home Appliance">Home Appliance</option>
															  <option value="Sports">Sports</option>
															  <option value="Automobile">Automobile</option>
														 </select>
													   </div>
													   
													   
															
														</c:when> 
													
													<c:otherwise>
													  	 <div class="mb-1">
															  
														 <label for="product_type" class="text-color">Product Type</label>
														
													      <select id="product_type"  name="prductType">
															  <option value="" selected></option>
															  <option value="Electronic" >Electronic</option>
															  <option value="Home Appliance">Home Appliance</option>
															  <option value="Sports">Sports</option>
															  <option value="Automobile">Automobile</option>
														 </select>
													   </div>
													   
													   
													     
													
													</c:otherwise>
													
												   </c:choose>
													  
													<c:choose>
														 <c:when test= "${crud == false}">
														 
														      
												     
													 
														  <div class="mb-2" >
															 
															 <label for="name" class="text-color"> Product Item Name</label>
															 <input  type="text" id="name" name="productName" class="form-control" placeholder="enter the name" /*onblur="validate_name()"*/ required  disabled ></input>
														     <span id="name_message"></span>
															
														  
														  </div>
													  
													   
															
														</c:when> 
													
													<c:otherwise>
												 
													  <div class="mb-2" >
														 
														 <label for="name" class="text-color"> Product Item Name</label>
														 <input  type="text" id="name"  name="productName" class="form-control" placeholder="enter the name" /*onblur="validate_name()"*/ required></input>
													     <span id="name_message"></span>
														
													  
													  </div>
													  
													   
													     
													
													</c:otherwise>
													
												   </c:choose>
													 
													 
													 <c:choose>
														 <c:when test= "${crud == false}">
														 
														      
												      
														     <div class="mb-2">
															 
																	<label for="quantity" class="text-color">Product Quantity:</label>
																	<input  type="text" id="quantity" name="productQuantity" class="form-control" placeholder="enter the quantity" /*onblur="validate_quantity()"*/ required disabled></input>
															        <span id="quantity_message"></span>
															 </div>
															 
												
													   
															
														</c:when> 
													
														<c:otherwise>
													 
															 
															   <div class="mb-2">
																 
																		<label for="quantity" class="text-color">Product Quantity:</label>
																		<input  type="text" id="quantity" name="productQuantity" class="form-control" placeholder="enter the quantity" /*onblur="validate_quantity()"/ required></input>
																        <span id="quantity_message"></span>
																 </div>
															 
													
														  
														   
														     
														
														</c:otherwise>
													
												   </c:choose>
													 
													 
											        <c:choose>
													     <c:when test= "${crud == false}">
															 
															      
											                 <div class="mb-2">
															                    
																	 <label for="description" class="text-color">Product Description</label>
																	 <textarea  id="description" class="form-control " name="productDescription" required disabled ></textarea>
															         <span id="description_message"></span>
															  
															  </div>
														   
																
														</c:when> 
													
													<c:otherwise>
												 
													   <div class="mb-2">
														                    
																 <label for="description" class="text-color">Product Description</label>
																<textarea  id="description" class="form-control "  name="productDescription" required></textarea>
														         <span id="description_message"></span>
														  
														</div>
												
													  
													   
													     
													
													</c:otherwise>
													
												   </c:choose>
													                 <c:choose>
																         <c:when test= "${crud == false}">
																		    
																			  	     <div class="mb-1" style="height: 0rem;">
																						
																								<label for="userid_via_loginid" class="text-color"></label>
																								<input type="hidden" id="userid_via_loginid" name="userIdViaLoginIdCheckprdct" class="form-control"   value="${sessionScope.login.userIdViaLoginId}"  disabled></input>
																						        
													                                 </div>
													   										
																      </c:when> 
																		
																		<c:otherwise>
																		
																		           <div class="mb-1">
																						
																								   
																						        <div class="mb-1" style="height: 0rem;">
																								<label for="userid_via_loginid" class="text-color"></label>
																								<input type="hidden" id="userid_via_loginid" name="userIdViaLoginIdCheckprdct" class="form-control"   value="${sessionScope.login.userIdViaLoginId}" ></input>
																						        </div>
													                                             
													                                 </div>
													   															          
																		  	 
																		</c:otherwise>
															
												                </c:choose>
												
													
													  
													 	 
														 
														 
														
										
										           	 <c:choose>
													         <c:when test= "${crud == false}">
													              <%--    <%System.out.println("inside the button where it is disabled"); %> --%><%--it is scriplet for java code and it is for the server side  --%>
												<%-- 	     <%System.out.println("inside the button where it is disabled"+session.getAttribute("dashboard"));%> --%><%--convert teh while transition phasw from teh jsp to .java there it will convert teh out --%>
													                 <c:choose>
														                  <c:when  test="${sessionScope.dashboard == 'allThreeOption'}"><%--it will call the in the session.getAttribute("dashbored") --%>
																		       <div class=" mb-2 text-center">
																		                     <%System.out.println("inside the button where it is all three option &disabled save button  only"); %><%--it is scriplet for java code and it is for the server side  --%>
																					         <button class="btn btn-primary"><a href='AllThreeOption.jsp' style="color:white ;text-decoration:none;">Back</a></button><!--save function is called to check all conditions-->
																					         <button class="btn btn-primary"  disabled >Save info</button><!--save function is called to check all conditions-->
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
																					          <button class="btn btn-primary"><a href='AllOneOption.jsp' style="color:white ;text-decoration:none;">Back</a></button><!--save function is called to check all conditions-->
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
																				         <input type="submit" value="Save info"  id="save" class="btn btn-primary" ></input><!--save function is called to check all conditions-->
																			  </div>        
												                        </c:when>
												                            <c:when test="${sessionScope.dashboard == 'allTwoOption'}">
																	          <div class=" mb-2 text-center">
																				          <button class="btn btn-primary"><a href='AllTwoOption.jsp' style="color:white ;text-decoration:none;">Back</a></button><!--save function is called to check all conditions-->
																				          <input type="submit" value="Save info"  id="save" class="btn btn-primary" ></input><!--save function is called to check all conditions-->
																			  </div>        
												                        </c:when>
												                           <c:when test="${sessionScope.dashboard == 'allOneOption'}">
																	          <div class=" mb-2 text-center">
																				          <button class="btn btn-primary"><a href='AllOneOption.jsp' style="color:white ;text-decoration:none;">Back</a></button><!--save function is called to check all conditions-->
																				          <input type="submit" value="Save info"  id="save" class="btn btn-primary" ></input><!--save function is called to check all conditions-->
																			  </div>        
												                        </c:when>
												                       
											                       </c:choose>
								 
												          
															  	 
															</c:otherwise>
												
									                </c:choose>
										 
									
								   
							  
							  </div>
					  	
				  </form>							  
											  
										 
										  
										   
										
										
														
												
														  
														  
					<form  action="CrudOperation2.jsp"  method="post">							
						
						<c:set var="requestDelete" value="ProductDelete"  scope="session"/>	
						      
									
						<div class="col-4 /*border border-warning*/ bg-light shadow"  style=" width: 73rem"><!-- it will not work instead it will only work in case of server  b/z it will fetch data from it-->
									 
									 
									 <div class=" /*border border-dark*/ text-center">
										   <c:set var="read_request" value="ProductRead" scope="session"/>
						
										   <input type="submit" class="btn btn-primary" value="Product Info" id="fetch_Product_details"></input>											
									      <input type="button"  id="clear" class="btn btn-primary"  value="clear"/>
									 </div>
									 
									 
									 
									 <table class="table table-striped table-hover /*border border-secondary*/">
										  
										  <thead>
										     <tr>
												   <th>Product Id</th>
												    <th> Product Item Type</th>
												   <th> Product Name</th>
												   <th> Product Quantity</th>
												   <th> Product Description</th>
												  
										      </tr>
										   </thead>
										   
										   <tbody id="body-inside">
										                <c:if test="${sessionScope.listOfProduct !='null'}">
											       
											        <c:forEach var="productdetails" items="${sessionScope.listOfProduct}">
											              <%--sesssion.getAttribut("listOfProduct")->return list  --%>  
											                <%-- product details is key its object is returned--%>   
											           
											            <c:if test="${delete_yes == true }">
											            
												             <tr>      
												                 <%--session.getAttribue("product details").getProdcutId() --%>                  
													            <td>${productdetails.productId}</td>
													            <td>${productdetails.productType}</td>
													            <td>${productdetails.productItemName}</td>
													            <td>${productdetails.productQuantity}</td>
													            <td>${productdetails.productDescription}</td>
													             <td><button type="button"  onclick="return confirm('delete product details');"  class="btn btn-danger"><a href="CrudOperation3.jsp?productIdToDelete=${productdetails.productId}"  style="text-decoration: none;color: black;font-weight: bolder;" >Delete</a></button></td>
												            </tr>
											           
											           </c:if>
											           
											           
											           <c:if test="${ delete_yes == false }">
											                    <tr>      
												                 <%--session.getAttribue("product details").getProdcutId() --%>                  
													            <td>${productdetails.productId}</td>
													            <td>${productdetails.productType}</td>
													            <td>${productdetails.productItemName}</td>
													            <td>${productdetails.productQuantity}</td>
													            <td>${productdetails.productDescription}</td>
													            <td><button type="button"  onclick="return confirm('delete product details');"  class="btn btn-danger" disabled><a href="CrudOperation3.jsp?productIdToDelete=${productdetails.productId}"  style="text-decoration: none;color: black;font-weight: bolder;">Delete</a></button></td>
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
    
    
 
 
 
 
 
 
 
 
 
 
