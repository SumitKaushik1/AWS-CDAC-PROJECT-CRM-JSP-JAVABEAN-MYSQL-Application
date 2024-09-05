package daolayer;

import static dbutils.DBUtils.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.ProductInfoBean;
import pojos.Products;

public class DaoImpleProduct implements DaoIntfProduct {
	private Connection cn;
	private PreparedStatement p11,p12,p13,p17;
	
	
	public DaoImpleProduct() throws SQLException {
		System.out.println("dao instance is made");
		cn = getConnection();
	
		p11 = cn.prepareStatement(
				"insert into product( pro_id, pro_type, pro_item_name,pro_quantity,pro_description,Users_user_id) values(?,?,?,?,?,?)");
		p12= cn.prepareStatement(
				"update product set pro_type=?,pro_item_name=?,pro_quantity=?, pro_description=? where pro_id=?");
		////no need of use_id remain same only it is same b/z in upadation only salesman details has to change 
		p13 =cn.prepareStatement("select * from product");
		
	    p17=cn.prepareStatement("delete from product where pro_id=?");
			System.out.println(p11.getClass());
	}

	
	public void cleanUp() throws SQLException {
		System.out.println("doa instance  cleanedsup in product");

		
		if (p11 != null)
			p11.close();
		
		if (p12 != null)
			p12.close();
		
		if (p13 != null)
			p13.close();
		
	
		
		if (p17 != null)
			p17.close();
	}
	
	
	@Override
	public String insertNUpdateProduct(ProductInfoBean productDetails) throws SQLException {

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
	public List<Products> readProducts() throws SQLException {
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
	public String productDelete(String productIdToDelete) throws SQLException {
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
