package bean;

import java.sql.SQLException;
import java.util.List;

import daolayer.DAOImple;
import daolayer.DaoImpleCusto;
import pojos.Customers;

public class CustomerInfoBean {
	//bean is always for the input parameter+ bussiness login + setter and getter to save value
	//not via html all strings come 
	
	private String id;
	private String firstName;
	private String lastName;
	private String mobileNo;
	//all mobileno is in the request come are string 
	 //in dao layer you change teh datatype to store in the data base 
	private String email;
	private String password;
	private String address;
	
	private String message;
	private DaoImpleCusto daoImpleCusto;
	private String userIdViaLoginIdCheck;
	private String message2;
	
	private String customerIdToDelete;
	private String messageForDetetion;







	public CustomerInfoBean(String id, String firstName, String lastName, String mobileNo, String email,
			String password, String address, String message, DaoImpleCusto daoImpleCusto, String userIdViaLoginIdCheck,
			String message2, String customerIdToDelete, String messageForDetetion) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.mobileNo = mobileNo;
		this.email = email;
		this.password = password;
		this.address = address;
		this.message = message;
		this.daoImpleCusto = daoImpleCusto;
		this.userIdViaLoginIdCheck = userIdViaLoginIdCheck;
		this.message2 = message2;
		this.customerIdToDelete = customerIdToDelete;
		this.messageForDetetion = messageForDetetion;
	}

	
	public CustomerInfoBean() throws SQLException {
		super();
		System.out.println("customerinfobean started");
		daoImpleCusto=new DaoImpleCusto();
	}

	public String getId() {
		System.out.println("inside the getter id of the customer infobean");
		return id;
		
	}

	public void setId(String id) {
		System.out.println("inside customerinfo bean id setter");
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	
	
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}


	



	public DaoImpleCusto getDaoImpleCusto() {
		return daoImpleCusto;
	}

	public void setDaoImpleCusto(DaoImpleCusto daoImpleCusto) {
		this.daoImpleCusto = daoImpleCusto;
	}

	public String getUserIdViaLoginIdCheck() {
		return userIdViaLoginIdCheck;
	}

	public void setUserIdViaLoginIdCheck(String userIdViaLoginIdCheck) {
		this.userIdViaLoginIdCheck = userIdViaLoginIdCheck;
	}
	
	
	
	

	public String getMessage2() {
		return message2;
	}

	public void setMessage2(String message2) {
		this.message2 = message2;
	}

	
	
	public String getCustomerIdToDelete() {
		return customerIdToDelete;
	}

	public void setCustomerIdToDelete(String customerIdToDelete) {
		this.customerIdToDelete = customerIdToDelete;
	}
	
	

	public String getMessageForDetetion() {
		return messageForDetetion;
	}

	public void setMessageForDetetion(String messageForDetetion) {
		this.messageForDetetion = messageForDetetion;
	}





	@Override
	public String toString() {
		return "CustomerInfoBean [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", mobileNo="
				+ mobileNo + ", email=" + email + ", password=" + password + ", address=" + address + ", message="
				+ message + ", daoImpleCusto=" + daoImpleCusto + ", userIdViaLoginIdCheck=" + userIdViaLoginIdCheck
				+ ", message2=" + message2 + ", customerIdToDelete=" + customerIdToDelete + ", messageForDetetion="
				+ messageForDetetion + "]";
	}

	public void insertNUpdate() throws SQLException {
		String countMobileNoFormat=null;
		String mesg=null;
		System.out.println("inside customer bean info bean insertUPdate");
		System.out.println("customer details you entered :"+toString());
		if(mobileNo.length()==10) {
		      try {
		    	  
		    	  Long.parseLong(mobileNo);
		    	  mesg= daoImpleCusto.insertNUpdateCustomer(this); //tostring is called of current object
		  		  System.out.println(mesg);
		    	  if(!(mesg.equals("doNothing"))) {
		    		  System.out.println("inside insertNUpdate messsage"+mesg);
		    		  this.message=mesg;
		    		  System.out.println("inside insertNUpdate messsage"+this);
		    	  }
		  			 
		  		  
		      }catch(NumberFormatException n) {
		    	   message="mobileNo must have digits";
		    	  
		      }
		   
		   
		}else this.message="mobileNo must have 10 digits";
		
		
		
		
	}
	
	public List<Customers> readCustomers() throws SQLException{
		message=null;//when deletion and read happens request is sent i am making the status of insertion and updation to null ie not seen  
		System.out.println("inside readCustomers customerinfobean");
		 List<Customers> custList=null;
		 custList=daoImpleCusto.readCustomers();
		 
		 if(custList!=null)
		          return custList;
		 else
		 {
			 message2="no customer details";
			 return null;
		 }
		
		
	}
	
    public void	customerDelete() throws SQLException{
              
    	 message=null;//when deletion request is sent i am making the status of insertino and updation to null ie not seen  
    	messageForDetetion=daoImpleCusto.customerDelete(customerIdToDelete);
    	System.out.println(messageForDetetion);
		
		
	}

}
