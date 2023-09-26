package daolayer;

import static dbutils.DBUtils.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.CustomerInfoBean;
import bean.ProductInfoBean;
import bean.SalesmanInfoBean;
import pojos.Customers;
import pojos.Permission;
import pojos.Products;
import pojos.Roles;
import pojos.SalesmanNSchedule;
import pojos.Users;

public class DAOImple implements DAOIntf {

	private PreparedStatement p1, p2, p3, p4, p5, p6, p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,p17;

	private Connection cn;


	public DAOImple() throws SQLException {
		System.out.println("dao instance is made");
		cn = getConnection();
		
		p1 = cn.prepareStatement("select * from users where user_id=?");
		
		p2 = cn.prepareStatement("select * from roles where role_id=?");
		
		p3 = cn.prepareStatement("select * from permission where Roles_role_id=?");
		
		p4 = cn.prepareStatement(
				"insert into customer(cus_id, cus_first_name, cus_last_name, cus_password,cus_mobile,cus_email,cus_address,Users_user_id) values(?,?,?,?,?,?,?,?)");
		p5 = cn.prepareStatement(
				"update customer set cus_first_name=?,cus_last_name=?,cus_password=?,cus_mobile=?,cus_email=?,cus_address=? where cus_id=?");
		////no need of use_id remain same only it is same b/z in upadation only customer details has to change 
		p6 = cn.prepareStatement("select * from customer");
        
		p7 = cn.prepareStatement(
				"insert into salesman(slmn_id, slmn_first_name, slmn_last_name, slmn_password, slmn_mobile,slmn_address,Schedule_sch_id,slmn_email,Users_user_id) values(?,?,?,?,?,?,?,?,?)");
		p8= cn.prepareStatement(
				"update salesman set slmn_first_name=?,slmn_last_name=?,slmn_password=?, slmn_mobile=?,slmn_address=?, Schedule_sch_id=?,slmn_email=? where slmn_id=?");
		////no need of use_id remain same only it is same b/z in upadation only salesman details has to change 
		p9 =cn.prepareStatement("select * from salesman");
	    
		p10=cn.prepareStatement("select * from schedule where sch_id=?");
		
		p11 = cn.prepareStatement(
				"insert into product( pro_id, pro_type, pro_item_name,pro_quantity,pro_description,Users_user_id) values(?,?,?,?,?,?)");
		p12= cn.prepareStatement(
				"update product set pro_type=?,pro_item_name=?,pro_quantity=?, pro_description=? where pro_id=?");
		////no need of use_id remain same only it is same b/z in upadation only salesman details has to change 
		p13 =cn.prepareStatement("select * from product");
		
		p14=cn.prepareStatement("select * from  salesman,schedule where Schedule_sch_id=sch_id");//it is joins two tabels using the condition when matches scedule id both table
		//so multiplication of cross muliplucation will not happen
				
	    p15=cn.prepareStatement("delete from customer where cus_id=?");
	    
	    p16=cn.prepareStatement("delete from salesman where slmn_id=?");
	    
	    p17=cn.prepareStatement("delete from product where pro_id=?");
	
	}

	public void cleanUp() throws SQLException {
		System.out.println("doa instance cleanedsup");
		if (p1 != null)
			p1.close();
		if (p2 != null)
			p2.close();
		if (p3 != null)
			p3.close();
		if (p4 != null)
			p4.close();
		// note each client has sesssino and the lgoin bean boject is created accoreding
		// to
		// like how customerinfobean,later salesmaninfobeamn,later productbean created
		// each bean has the Daoimple object, each Daoimple has the p1,p2...p5 object
		// so when logout the user there i want to destroy the session of dao imple
		// calss
		// there i want to clean up resoureces
		// so the bean( in session)--conatin the Daoimple obejct-> conatin all obejcts
		// p1,p5,p6of resources

		// once the session is destroyed then the then all inside obejcts will
		// auomatcialy destroyed so we invalidate the session in the logout.jsp page
	}

	@Override
	public List<Users> verifyUsers(String userId) throws SQLException {
		System.out.println("inside the  verify user dao");
		List<Users> userList = new ArrayList<>();
		p1.setString(1, userId);

		try (ResultSet r = p1.executeQuery()) {

			if (r.next())
				userList.add(new Users(r.getString(1), r.getString(2), r.getString(3), r.getString(4), r.getLong(5),
						r.getString(6)));

		}

		System.out.println(userList);

		return userList;

	}

	@Override
	public List<Roles> verifyRole(String roleId) throws SQLException {
		System.out.println("inside verify role Dao");

		List<Roles> roleList = new ArrayList<>();
		p2.setString(1, roleId);

		try (ResultSet r = p2.executeQuery()) {

			if (r.next())
				roleList.add(new Roles(r.getString(1), r.getString(2), r.getString(3)));

		}

		System.out.println(roleList);
		return roleList;

	}

	@Override
	public List<Permission> permission(String roleId) throws SQLException {
		System.out.println("inside the dao permission ");
		List<Permission> perList = new ArrayList<>();
		p3.setString(1, roleId);
		try (ResultSet r = p3.executeQuery()) {

			while (r.next()) {

				perList.add(new Permission(r.getString(1), r.getString(2), r.getString(3), r.getString(4)));

			}
			System.out.println(perList);
			return perList;
		}

	}

	@Override
	public String insertNUpdateCustomer(CustomerInfoBean customerDetails) throws SQLException {
	

		System.out.println(" insertNupdate dao ->the customer id you entered:" + customerDetails.getId());
		int noOfRowsMOdifiedForUpdation = 0;
		int noOfRowsMOdifiedForInsertion = 0;
		// (cus_id, cus_first_name, cus_last_name, cus_password,
		// cus_mobile,cus_email,cus_address,Users_user_id)
		p4.setString(1, customerDetails.getId());
		p4.setString(2, customerDetails.getFirstName());
		p4.setString(3, customerDetails.getLastName());
		p4.setString(4, customerDetails.getPassword());
		p4.setLong(5, Long.parseLong(customerDetails.getMobileNo()));
		p4.setString(6, customerDetails.getEmail());
	
		p4.setString(7, customerDetails.getAddress());
		p4.setString(8, customerDetails.getUserIdViaLoginIdCheck());

		// update customer set
		// cus_first_name=?,cus_last_name=?,cus_password=?,cus_mobile=?,cus_email=?,cus_address=?,User_user_id=?
		// where cus_id=?

		p5.setString(1, customerDetails.getFirstName());
		p5.setString(2, customerDetails.getLastName());
		p5.setString(3, customerDetails.getPassword());
		p5.setLong(4,Long.parseLong(customerDetails.getMobileNo()));
		p5.setString(5, customerDetails.getEmail());
		p5.setString(6, customerDetails.getAddress());
		p5.setString(7, customerDetails.getId());
        
		
		
		System.out.println("before update->noOfRowsMOdifiedForUpdation:" + noOfRowsMOdifiedForUpdation);
		System.out.println(" before insert->noOfRowsMOdifiedForInsertion:" + noOfRowsMOdifiedForInsertion);
		
		
		try (ResultSet r = p6.executeQuery()) {
		 System.out.println("all customers taken from  database");
			while(r.next()) {
				
		
               
				if (r.getString(1).equals(customerDetails.getId())) {
					       

						        	   System.out.println("password you entered"+customerDetails.getPassword());
						        	   System.out.println("password was in database"+r.getString(4));
						        	
										
		                	    	    System.out.println("Mobile you entered"+customerDetails.getMobileNo());
		                	    	  System.out.println("Mobile was in database to corressponding customerid"+String.valueOf(r.getLong(5)));
		                	    	         
				                	    	 noOfRowsMOdifiedForUpdation = p5.executeUpdate();
											 System.out.println("after update->noOfRowsMOdified1:" + noOfRowsMOdifiedForUpdation);
												/* p5.close();whyen page refrehes agon reqeust is sent donot close b/z if page refreshes then again reqeust si sent 
					 * if resource is close  then it will give the server side error  500  */
											 if (noOfRowsMOdifiedForUpdation != 0)
												   return "customer details updated";
	                           }	          
				
				      }     
	                 
		
			    }		
						        	   
		
		 //if the custid is not found it means customer doesnot exist so add the customer 
		 System.out.println("inside else block insertion of customers");
		 noOfRowsMOdifiedForInsertion = p4.executeUpdate();
		System.out.println(" after insert->noOfRowsMOdified2:" + noOfRowsMOdifiedForInsertion);
		/* p4.close(); whyen page refrehes agon reqeust is sent donot close b/z if page refreshes then again reqeust si sent 
					 * if resource is close  then it will give the server side error  500 */
		if (noOfRowsMOdifiedForInsertion != 0)
		  return "customer details added"; 
	   else return  "customer details not added";
		
	 }							
		                	    	
             
               	    
	                	

	@Override
	public String insertNUpdateSalesman( SalesmanInfoBean salesmanDetails) throws SQLException {
	

		System.out.println(" insertNupdate dao ->the salesman id you entered:" + salesmanDetails.getSalesmanId());
		int noOfRowsMOdifiedForUpdation = 0;
		int noOfRowsMOdifiedForInsertion = 0;
		//slmn_id, slmn_first_name, slmn_last_name, slmn_password,
		//slmn_mobile,slmn_address,Schedule_sch_id,slmn_email,Users_user_id
		p7.setString(1, salesmanDetails.getSalesmanId());
		p7.setString(2, salesmanDetails.getSalesmanFirstName());
		p7.setString(3, salesmanDetails.getSalesmanLastName());
		p7.setString(4, salesmanDetails.getSalesmanPassword());
		p7.setLong(5, Long.parseLong(salesmanDetails.getSalesmanMobileNo()));
		p7.setString(6, salesmanDetails.getSalesmanAddress());
		p7.setString(7, salesmanDetails.getSalesmanScheduleId());
		p7.setString(8, salesmanDetails.getSalesmanEmail());
		p7.setString(9, salesmanDetails.getUserIdViaLoginIdCheckForSlmn());
		

	//	 slmn_first_name=?,slmn_last_name=?,slmn_password=?, slmn_mobile=?
//				 ,slmn_address=?, Schedule_sch_id=?,slmn_email=?, where slmn_id=?

		p8.setString(1, salesmanDetails.getSalesmanFirstName());
		p8.setString(2, salesmanDetails.getSalesmanLastName());
		p8.setString(3, salesmanDetails.getSalesmanPassword());
		p8.setLong(4,Long.parseLong(salesmanDetails.getSalesmanMobileNo()));
		p8.setString(5, salesmanDetails.getSalesmanAddress());
		p8.setString(6, salesmanDetails.getSalesmanScheduleId());
		p8.setString(7, salesmanDetails.getSalesmanEmail());
		p8.setString(8, salesmanDetails.getSalesmanId());
        
		
		
		p10.setString(1,salesmanDetails.getSalesmanScheduleId());
		
		System.out.println("before update->noOfRowsMOdifiedForUpdation:" + noOfRowsMOdifiedForUpdation);
		System.out.println(" before insert->noOfRowsMOdifiedForInsertion:" + noOfRowsMOdifiedForInsertion);
		
		
		try (ResultSet r = p9.executeQuery()) {
		 System.out.println("all sales taken from data base  salesaman");
			while(r.next()) {
		
				
                if (r.getString(1).equals(salesmanDetails.getSalesmanId())) {
                	
		                	  
						        	   System.out.println("password you entered"+salesmanDetails.getSalesmanPassword());
						        	   System.out.println("password was in database"+r.getString(4));
						
		                	
	                	    	         System.out.println("Mobile you entered"+salesmanDetails.getSalesmanMobileNo());
	                	    	         System.out.println("Mobile was in database to corressponding salesmanid"+String.valueOf(r.getLong(5)));
		                	    	     try(ResultSet r1=p10.executeQuery()){
		                	    	         while(r1.next()) {
			                	    	             if(salesmanDetails.getSalesmanScheduleId().equals(r1.getString(1))) {
							                	    	 noOfRowsMOdifiedForUpdation = p8.executeUpdate();
														 System.out.println("after update->noOfRowsMOdified1:" + noOfRowsMOdifiedForUpdation);
															/* p8.close(); whyen page refrehes agon reqeust is sent donot close b/z if page refreshes then again reqeust si sent 
					 * if resource is close  then it will give the server side error  500 */
														 if (noOfRowsMOdifiedForUpdation != 0)
															   return "salesman details updated";
			                	    	              }
			                	    	             
			                	    	             
			                	    	         } return"sheduled id is wrong";
		                	    	     }
						  
		                	    	
                          }	          
				
			      }     
                 
	
		    }
		
		
		 //if the slm_id is not found it means salesman doesnot exist so add the salesman
		 System.out.println("inside else block insertion of salesman");
		 noOfRowsMOdifiedForInsertion = p7.executeUpdate();
		System.out.println(" after insert->noOfRowsMOdified2:" + noOfRowsMOdifiedForInsertion);
		/* p7.close(); whyen page refrehes agon reqeust is sent donot close b/z if page refreshes then again reqeust si sent 
					 * if resource is close  then it will give the server side error  500 */
		if (noOfRowsMOdifiedForInsertion != 0)
		  return "salesman details added"; 
	   else return  "salesman details not added";
		
	 }               	    
	                	

	@Override
	public String insertNUpdateProduct( ProductInfoBean productDetails) throws SQLException {
	

		System.out.println(" insertNupdate dao ->the product id you entered:" +productDetails.getProductId());
		int noOfRowsMOdifiedForUpdation = 0;
		int noOfRowsMOdifiedForInsertion = 0;
		
		 //pro_id, pro_type, pro_item_name,pro_quantity,pro_description,Users_user_id
		p11.setString(1, productDetails.getProductId());
		p11.setString(2, productDetails.getPrductType());
		p11.setString(3, productDetails.getProductName());
		p11.setInt(4,Integer.parseInt(productDetails.getProductQuantity()));
		p11.setString(5,productDetails.getProductDescription());
		p11.setString(6, productDetails.getUserIdViaLoginIdCheckprdct());
	
		
		
		


	//	pro_type=?,pro_item_name=?,pro_quantity=?, pro_description=? where pro_id=?
		p12.setString(1, productDetails.getPrductType());
		p12.setString(2, productDetails.getProductName());
		p12.setString(3, productDetails.getProductQuantity());
		p12.setString(4,productDetails.getProductDescription());
		p12.setString(5, productDetails.getProductId());


        
		
	
		
		System.out.println("before update->noOfRowsMOdifiedForUpdation:" + noOfRowsMOdifiedForUpdation);
		System.out.println(" before insert->noOfRowsMOdifiedForInsertion:" + noOfRowsMOdifiedForInsertion);
		
		
		try (ResultSet r = p13.executeQuery()) {
			 System.out.println("all product taken from  database");
				while(r.next()) {
					
			
	               
					if (r.getString(1).equals(productDetails.getProductId())) {
						       
							 noOfRowsMOdifiedForUpdation = p12.executeUpdate();
							 System.out.println("after update->noOfRowsMOdified1:" + noOfRowsMOdifiedForUpdation);
								/* p12.close();whyen page refrehes agon reqeust is sent  donot close b/z if page refreshes then again reqeust si sent 
					 * if resource is close  then it will give the server side error  500 */
							 if (noOfRowsMOdifiedForUpdation != 0)
								   return "product details updated";

				
							        	
											
			                	    
			                	    	         
					                	    
		                           }	          
					
					      }     
		                 
			
				    }		
							     
		 //if the productid is not found it means product doesnot exist so add the product
		 System.out.println("inside else block insertion of product");
		 noOfRowsMOdifiedForInsertion = p11.executeUpdate();
		System.out.println(" after insert->noOfRowsMOdified2:" + noOfRowsMOdifiedForInsertion);
		if (noOfRowsMOdifiedForInsertion != 0)
		  return "product details added"; 
	   else return  "product details not added";
		
	 }               	    
	                	
      @Override	
	  public List<Customers> readCustomers() throws SQLException{
    	  System.out.println("inside read customer dao ");
    	   List<Customers> custList=new ArrayList<>();
  		try (ResultSet r = p6.executeQuery()) {
  			 System.out.println("all customers taken from  database");
  				while(r.next()) {
  					
  					//cus_id, cus_first_name, cus_last_name, cus_password,
  					//cus_mobile,cus_email,cus_address,Users_user_id  
  					
  					 custList.add(new Customers(r.getString(1),r.getString(2),r.getString(3)
  							 ,r.getString(4),r.getLong(5),r.getString(6),r.getString(7),
  							 r.getString(8)//note on the browser it will be printed as string 
  							 )
  							 );
  	               
  	               
  			
  				    }
		  
		  
  				 return custList;
		  
	        }
	
      }
	
	
      @Override	
	  public List<SalesmanNSchedule> readSalesmans() throws SQLException{
    	  System.out.println("inside read salesman dao ");
    	   List<SalesmanNSchedule> slmnList=new ArrayList<>();
  		try (ResultSet r = p14.executeQuery()) {
  			 System.out.println("all salesman and its corressponding schdule taken from  database");
  				while(r.next()) {
  					
  					//slmn_id, slmn_first_name, slmn_last_name, slmn_password, 
  					//slmn_mobile,slmn_address,Schedule_sch_id,slmn_email,Users_user_id  
  					// (sch_id not include adn so donot include ), sch_type  sch_description
  					 slmnList.add(new SalesmanNSchedule(r.getString(1),r.getString(2),r.getString(3)
  							 ,r.getString(4),r.getLong(5),r.getString(6),r.getString(7),r.getString(8),
  							 r.getString(9),r.getString(11),r.getString(12)));
  							 
  							 
  	               
  					//note on the browser it will be printed as string 
  			
  				    }
		  
		  
  				 return slmnList;
		  
	        }
	
      }
	
	
      
      @Override	
	  public List<Products> readProducts() throws SQLException{
    	  System.out.println("inside read Product dao ");
    	   List<Products> prodctList=new ArrayList<>();
  		try (ResultSet r = p13.executeQuery()) {
  			 System.out.println("all products taken from  database");
  				while(r.next()) {
  					
					/*
					 * pro_id, pro_type, pro_item_name,pro_quantity,pro_description,Users_user_id
					 * 
					 * 
					 */
  					prodctList.add(new Products(r.getString(1),r.getString(2),r.getString(3)
  							 ,r.getInt(4),r.getString(5),r.getString(6)
  							//note on the browser it will be printed as string 
  							 )
  							 );
  	               
  	               
  			
  				    }
		  
		  
  				 return  prodctList;
		  
	        }
  		
  		
  		
  		
	
      }
	
      
   @Override
      public String	customerDelete(String customerIdToDelete) throws SQLException{
           p15.setString(1, customerIdToDelete);   
    	  int noOfRowsDeleted=0;  
              noOfRowsDeleted=p15.executeUpdate();
              System.out.println("no. of rows deleted:"+noOfRowsDeleted);
              if(noOfRowsDeleted!=0) {
					/* p15.close(); whyen page refrehes agon reqeust is sent donot close b/z if page refreshes then again reqeust si sent 
					 * if resource is close  then it will give the server side error  500 */
            	  return "customer deleted";
              }
              else
              {
					/* p15.close(); whyen page refrehes agon reqeust is sent donot close b/z if page refreshes then again reqeust si sent 
					 * if resource is close  then it will give the server side error  500 */
            	return "customer not exist";
            	  
              }
            	  
      }
      	     
   @Override
      public String	salesmanDelete(String salesmanIdToDelete) throws SQLException{
          p16.setString(1, salesmanIdToDelete);   
   	  int noOfRowsDeleted=0;  
             noOfRowsDeleted=p16.executeUpdate();
             System.out.println("no. of rows deleted:"+noOfRowsDeleted);
             if(noOfRowsDeleted!=0) {
					/* p16.close(); whyen page refrehes agon reqeust is sent donot close b/z if page refreshes then again reqeust si sent 
					 * if resource is close  then it will give the server side error  500 */
           	  return "salesman deleted";
             }
             else
             {
					/* p16.close(); whyen page refrehes agon reqeust is sent donot close b/z if page refreshes then again reqeust si sent 
					 * if resource is close  then it will give the server side error  500 */
           	return "salesman not exist";
           	  
             }
           	  
     }
      
   @Override
      public String	productDelete(String productIdToDelete) throws SQLException{
          p17.setString(1, productIdToDelete);   
   	  int noOfRowsDeleted=0;  
             noOfRowsDeleted=p17.executeUpdate();
             System.out.println("no. of rows deleted:"+noOfRowsDeleted);
             if(noOfRowsDeleted!=0) {
					/* p16.close(); whyen page refrehes agon reqeust is sent donot close b/z if page refreshes then again reqeust si sent 
					 * if resource is close  then it will give the server side error  500 */
           	  return "product deleted";
             }
             else
             {
					/* p16.close(); whyen page refrehes agon reqeust is sent donot close b/z if page refreshes then again reqeust si sent 
					 * if resource is close  then it will give the server side error  500 */
           	return "product not exist";
           	  
             }
           	  
     }
     	
      
      
  		
  		
  

}
      
	
      
			       	    





		      

		
		


	
	


