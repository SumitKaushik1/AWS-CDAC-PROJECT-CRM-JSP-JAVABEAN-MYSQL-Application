package daolayer;

import static dbutils.DBUtils.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.CustomerInfoBean;
import pojos.Customers;

public class DaoImpleCusto implements DaoIntfCustomer {
	private PreparedStatement p4,p5,p6,p15;
	private Connection cn;
	
	public DaoImpleCusto() throws SQLException {
		
	
		cn = getConnection();
		
		p4 = cn.prepareStatement(
				"insert into customer(cus_id, cus_first_name, cus_last_name, cus_password,cus_mobile,cus_email,cus_address,Users_user_id) values(?,?,?,?,?,?,?,?)");
		p5 = cn.prepareStatement(
				"update customer set cus_first_name=?,cus_last_name=?,cus_password=?,cus_mobile=?,cus_email=?,cus_address=? where cus_id=?");
		////no need of use_id remain same only it is same b/z in upadation only customer details has to change 
		p6 = cn.prepareStatement("select * from customer");
		
	    p15=cn.prepareStatement("delete from customer where cus_id=?");
	    System.out.println(p4.getClass());
	}
	
	public void cleanUp() throws SQLException {
		System.out.println("doa instance cleanedsup");
	
		if (p4 != null)
			p4.close();
		
		if (p5 != null)
			p5.close();
		
		if (p6 != null)
			p6.close();

		if (p15 != null)
			p15.close();
		
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
	public List<Customers> readCustomers() throws SQLException {
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
	public String customerDelete(String customerIdToDelete) throws SQLException {
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

}
