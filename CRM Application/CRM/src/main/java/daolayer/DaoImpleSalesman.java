package daolayer;

import static dbutils.DBUtils.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.SalesmanInfoBean;
import pojos.SalesmanNSchedule;

public class DaoImpleSalesman implements DaoIntfSalesman {

	private PreparedStatement p7,p8,p9,p10,p14,p16;
	private Connection cn;
	
	public DaoImpleSalesman() throws SQLException {
		System.out.println("dao instance is made");
		cn = getConnection();
		
		p7 = cn.prepareStatement(
				"insert into salesman(slmn_id, slmn_first_name, slmn_last_name, slmn_password, slmn_mobile,slmn_address,Schedule_sch_id,slmn_email,Users_user_id) values(?,?,?,?,?,?,?,?,?)");
		
		p8= cn.prepareStatement(
				"update salesman set slmn_first_name=?,slmn_last_name=?,slmn_password=?, slmn_mobile=?,slmn_address=?, Schedule_sch_id=?,slmn_email=? where slmn_id=?");
		////no need of use_id remain same only it is same b/z in upadation only salesman details has to change 
		
		p9 =cn.prepareStatement("select * from salesman");
	    
		p10=cn.prepareStatement("select * from schedule where sch_id=?");
		
		p14=cn.prepareStatement("select * from  salesman,schedule where Schedule_sch_id=sch_id");//it is joins two tabels using the condition when matches scedule id both table
		//so multiplication of cross muliplucation will not happen
		
		p16=cn.prepareStatement("delete from salesman where slmn_id=?");
		
		System.out.println(p7.getClass());
	}


	public void cleanUp() throws SQLException {
		System.out.println("doa instance cleanedsup");
		if (p7 != null)
			p7.close();
		
		if (p8 != null)
			p8.close();
		
		if (p9 != null)
			p9.close();
		
		if (p10 != null)
			p10.close();
		
		if (p16 != null)
			p16.close();
	}
	
	@Override
	public String insertNUpdateSalesman(SalesmanInfoBean salesmanDetails) throws SQLException {
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
		
		//ie before inserting i have to check that schedule id that i entered on front end 
		//is it correct  or not from schedule table 
        try(ResultSet r1=p10.executeQuery()){	
        	
        	
		    if(r1.next()) {
		    	System.out.println( "inside salesman insertupdate"+r1.getString(1));
        	salesmanDetails.getSalesmanId().equals(r1.getString(1));//ie is is matching 
		    //if the slm_id is not found it means salesman doesnot exist so add the salesman
			System.out.println("inside else block insertion of salesman");
			 noOfRowsMOdifiedForInsertion = p7.executeUpdate();
			System.out.println(" after insert->noOfRowsMOdified2:" + noOfRowsMOdifiedForInsertion);
			/* p7.close(); when page refrehes agon reqeust is sent donot close b/z if page refreshes then again reqeust si sent 
						 * if resource is close  then it will give the server side error  500 */
		    }
			
		 
        }
        
    	if (noOfRowsMOdifiedForInsertion != 0)
			  return "salesman details added"; 
		   else return  "salesman details not added";
      
	}

	@Override
	public List<SalesmanNSchedule> readSalesmans() throws SQLException {
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
	public String salesmanDelete(String salesmanIdToDelete) throws SQLException {
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

}
