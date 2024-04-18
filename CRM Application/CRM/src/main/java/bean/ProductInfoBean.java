	package bean;
	
	import java.sql.SQLException;
import java.util.List;

import daolayer.DAOImple;
import pojos.Products;
	
	public class ProductInfoBean {
	 private String productId;
	 private String prductType;
	 private String productName;
	 private String productQuantity;//all quatitiis in the request come are string 
	 //in dao layer you change teh datatype to store in the data base 
	 private String  productDescription;
	 private String message;
	 private DAOImple daoImple;
	 private String userIdViaLoginIdCheckprdct;
	 
	 private String message2;
	 private String productIdToDelete;
	 
	 private String messageForDetetion;
	 
	 
	 
	 
	 
	public ProductInfoBean() throws SQLException {
		super();
		System.out.println("product infobean started");
		daoImple=new DAOImple();
		
		
	}
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	



















	public ProductInfoBean(String productId, String prductType, String productName, String productQuantity,
			String productDescription, String message, DAOImple daoImple, String userIdViaLoginIdCheckprdct,
			String message2, String productIdToDelete, String messageForDetetion) {
		super();
		this.productId = productId;
		this.prductType = prductType;
		this.productName = productName;
		this.productQuantity = productQuantity;
		this.productDescription = productDescription;
		this.message = message;
		this.daoImple = daoImple;
		this.userIdViaLoginIdCheckprdct = userIdViaLoginIdCheckprdct;
		this.message2 = message2;
		this.productIdToDelete = productIdToDelete;
		this.messageForDetetion = messageForDetetion;
	}






































	public String getProductId() {
		System.out.println("inside the getter id of the product infobean");
		return productId;
	}
	
	
	
	
	
	public void setProductId(String productId) {
		System.out.println("inside the getter id of the product infobean");
		this.productId = productId;
	}
	
	
	
	
	
	public String getPrductType() {
		return prductType;
	}
	
	
	
	
	
	public void setPrductType(String prductType) {
		this.prductType = prductType;
	}
	
	
	
	
	
	public String getProductName() {
		return productName;
	}
	
	
	
	
	
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	
	
	
	
	public String getProductQuantity() {
		return productQuantity;
	}
	
	
	
	
	
	public void setProductQuantity(String productQuantity) {
		this.productQuantity = productQuantity;
	}
	
	
	
	
	
	public String getProductDescription() {
		return productDescription;
	}
	
	
	
	
	
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}
	
	
	
	
	
	public String getMessage() {
		return message;
	}
	
	
	
	
	
	public void setMessage(String message) {
		this.message = message;
	}
	
	
	
	
	
	public DAOImple getDaoImple() {
		return daoImple;
	}
	
	
	
	
	
	public void setDaoImple(DAOImple daoImple) {
		this.daoImple = daoImple;
	}
	
	
	
	
	
	
	
	
	
	
	public String getUserIdViaLoginIdCheckprdct() {
		return userIdViaLoginIdCheckprdct;
	}
	
	
	
	
	
	public void setUserIdViaLoginIdCheckprdct(String userIdViaLoginIdCheckprdct) {
		this.userIdViaLoginIdCheckprdct = userIdViaLoginIdCheckprdct;
	}
	
	
	
	
	








		public String getMessage2() {
		return message2;
	}










	public void setMessage2(String message2) {
		this.message2 = message2;
	}










		public String getProductIdToDelete() {
		return productIdToDelete;
	}



















	public void setProductIdToDelete(String productIdToDelete) {
		this.productIdToDelete = productIdToDelete;
	}



























		public String getMessageForDetetion() {
		return messageForDetetion;
	}






































	public void setMessageForDetetion(String messageForDetetion) {
		this.messageForDetetion = messageForDetetion;
	}



















































		@Override
	public String toString() {
		return "ProductInfoBean [productId=" + productId + ", prductType=" + prductType + ", productName=" + productName
				+ ", productQuantity=" + productQuantity + ", productDescription=" + productDescription + ", message="
				+ message + ", daoImple=" + daoImple + ", userIdViaLoginIdCheckprdct=" + userIdViaLoginIdCheckprdct
				+ ", message2=" + message2 + ", productIdToDelete=" + productIdToDelete + ", messageForDetetion="
				+ messageForDetetion + "]";
	}






































		public void insertNUpdate() throws SQLException {
			String productQuantityFormat=null;
			String mesg=null;
			System.out.println("inside product  bean info bean insertUPdate");
			System.out.println("product details you entered :"+toString());
			
			      try {
			    	  
			    	  Long.parseLong(productQuantity);
			    	  mesg= daoImple.insertNUpdateProduct(this); //tostring is called of current object
						if(mesg!="doNothing")
							message=mesg;
						  
			  		  
			      }catch(NumberFormatException n) {
			    	  productQuantityFormat="quantity must have digits";
			      }
			      message=productQuantityFormat;
			   
		
			
			
			
			
			
			
			
		}


		
	public List<Products> readProducts() throws SQLException{
		message=null;//when deletion and read happens request is sent i am making the status of insertion and updation to null ie not seen 
		System.out.println("inside readSalesman customerinfobean");
		 List<Products> proList=null;
		 proList=daoImple.readProducts();
		 
		 if(proList!=null)
		          return proList;
		 else
		 {
			 message2="no product details";
			 return null;
		 }
		
		
		
	}


	
    public void productDelete() throws SQLException{
        
    	 message=null;//when deletion request is sent i am making the status of insertino and updation to null ie not seen  
    	messageForDetetion=daoImple.productDelete(productIdToDelete);
    	System.out.println(messageForDetetion);
		
		
	}
	






   
 }
