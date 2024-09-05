package bean;

import java.sql.SQLException;
import java.util.List;


import daolayer.DaoImpleSalesman;
import pojos.SalesmanNSchedule;

public class SalesmanInfoBean {
	private String message;
	private String salesmanId;
	
	private String salesmanFirstName;
	private String salesmanLastName;

	private String salesmanMobileNo;
	//all salesman mobileno is in the request come are string 
	 //in dao layer you change teh datatype to store in the data base 
	private String salesmanEmail;
	private String salesmanPassword;
    private String salesmanAddress;
    private String userIdViaLoginIdCheckForSlmn;
    private String salesmanScheduleId;
    private String scheduletype;
    private String salesmanScheduleDescription;
	private DaoImpleSalesman daoImpleSalesman;
	private String message2;
	private String messageForDetetion;
	private String salesmanIdToDelete;
	
	/*
	 * java bean is generally to save the data from the browser page so state for
	 * browser+bussinesslogic +doa layer connection
	 */
    public SalesmanInfoBean() throws SQLException {
		super();
		System.out.println("salesmaninfoBean started");
		 daoImpleSalesman=new DaoImpleSalesman();
	}
















	public SalesmanInfoBean(String message, String salesmanId, String salesmanFirstName, String salesmanLastName,
			String salesmanMobileNo, String salesmanEmail, String salesmanPassword, String salesmanAddress,
			String userIdViaLoginIdCheckForSlmn, String salesmanScheduleId, String scheduletype,
			String salesmanScheduleDescription, DaoImpleSalesman daoImpleSalesman, String message2,
			String messageForDetetion, String salesmanIdToDelete) {
		super();
		this.message = message;
		this.salesmanId = salesmanId;
		this.salesmanFirstName = salesmanFirstName;
		this.salesmanLastName = salesmanLastName;
		this.salesmanMobileNo = salesmanMobileNo;
		this.salesmanEmail = salesmanEmail;
		this.salesmanPassword = salesmanPassword;
		this.salesmanAddress = salesmanAddress;
		this.userIdViaLoginIdCheckForSlmn = userIdViaLoginIdCheckForSlmn;
		this.salesmanScheduleId = salesmanScheduleId;
		this.scheduletype = scheduletype;
		this.salesmanScheduleDescription = salesmanScheduleDescription;
		this.daoImpleSalesman = daoImpleSalesman;
		this.message2 = message2;
		this.messageForDetetion = messageForDetetion;
		this.salesmanIdToDelete = salesmanIdToDelete;
	}
















	public String getMessage() {
		return message;
	}



	public void setMessage(String message) {
		this.message = message;
	}



	public String getSalesmanId() {
		System.out.println("inside the getter id of the salesman infobean");
		return salesmanId;
	}



	public void setSalesmanId(String salesmanId) {
		System.out.println("inside salesmaninfo bean id setter");
		this.salesmanId = salesmanId;
	}



	public String getSalesmanFirstName() {
		return salesmanFirstName;
	}



	public void setSalesmanFirstName(String salesmanFirstName) {
		this.salesmanFirstName = salesmanFirstName;
	}



	public String getSalesmanLastName() {
		return salesmanLastName;
	}



	public void setSalesmanLastName(String salesmanLastName) {
		this.salesmanLastName = salesmanLastName;
	}



	public String getSalesmanMobileNo() {
		return salesmanMobileNo;
	}



	public void setSalesmanMobileNo(String salesmanMobileNo) {
		this.salesmanMobileNo = salesmanMobileNo;
	}



	public String getSalesmanEmail() {
		return salesmanEmail;
	}



	public void setSalesmanEmail(String salesmanEmail) {
		this.salesmanEmail = salesmanEmail;
	}



	public String getSalesmanPassword() {
		return salesmanPassword;
	}



	public void setSalesmanPassword(String salesmanPassword) {
		this.salesmanPassword = salesmanPassword;
	}



	public String getSalesmanAddress() {
		return salesmanAddress;
	}



	public void setSalesmanAddress(String salesmanAddress) {
		this.salesmanAddress = salesmanAddress;
	}



	public String getUserIdViaLoginIdCheckForSlmn() {
		return userIdViaLoginIdCheckForSlmn;
	}



	public void setUserIdViaLoginIdCheckForSlmn(String userIdViaLoginIdCheckForSlmn) {
		this.userIdViaLoginIdCheckForSlmn = userIdViaLoginIdCheckForSlmn;
	}



	public String getSalesmanScheduleId() {
		return salesmanScheduleId;
	}



	public void setSalesmanScheduleId(String salesmanScheduleId) {
		this.salesmanScheduleId = salesmanScheduleId;
	}



	public String getScheduletype() {
		return scheduletype;
	}



	public void setScheduletype(String scheduletype) {
		this.scheduletype = scheduletype;
	}



	public String getSalesmanScheduleDescription() {
		return salesmanScheduleDescription;
	}



	public void setSalesmanScheduleDescription(String salesmanScheduleDescription) {
		this.salesmanScheduleDescription = salesmanScheduleDescription;
	}



	



	



		public DaoImpleSalesman getDaoImpleSalesman() {
		return daoImpleSalesman;
	}













	public void setDaoImpleSalesman(DaoImpleSalesman daoImpleSalesman) {
		this.daoImpleSalesman = daoImpleSalesman;
	}













		public String getMessage2() {
		return message2;
	}





	public void setMessage2(String message2) {
		this.message2 = message2;
	}





		public String getMessageForDetetion() {
		return messageForDetetion;
	}









	public void setMessageForDetetion(String messageForDetetion) {
		this.messageForDetetion = messageForDetetion;
	}













		public String getSalesmanIdToDelete() {
		return salesmanIdToDelete;
	}













	public void setSalesmanIdToDelete(String salesmanIdToDelete) {
		this.salesmanIdToDelete = salesmanIdToDelete;
	}

































		@Override
	public String toString() {
		return "SalesmanInfoBean [message=" + message + ", salesmanId=" + salesmanId + ", salesmanFirstName="
				+ salesmanFirstName + ", salesmanLastName=" + salesmanLastName + ", salesmanMobileNo="
				+ salesmanMobileNo + ", salesmanEmail=" + salesmanEmail + ", salesmanPassword=" + salesmanPassword
				+ ", salesmanAddress=" + salesmanAddress + ", userIdViaLoginIdCheckForSlmn="
				+ userIdViaLoginIdCheckForSlmn + ", salesmanScheduleId=" + salesmanScheduleId + ", scheduletype="
				+ scheduletype + ", salesmanScheduleDescription=" + salesmanScheduleDescription + ", daoImpleSalesman="
				+ daoImpleSalesman + ", message2=" + message2 + ", messageForDetetion=" + messageForDetetion
				+ ", salesmanIdToDelete=" + salesmanIdToDelete + "]";
	}













		public void insertNUpdate() throws SQLException {
		
			String mesg=null;
			
			System.out.println("inside salesman bean info bean insertUPdate");
			System.out.println("salesman details you entered :"+toString());
			if(salesmanMobileNo.length()==10) {
			      try {
			    	  
			    	  Long.parseLong(salesmanMobileNo);
			    		mesg=  daoImpleSalesman.insertNUpdateSalesman(this); //tostring is called of current object
						if(mesg!="doNothing")
							message=mesg;
			  		  
			      }catch(NumberFormatException n) {
			              message="mobileNo must have digits";
			    	  
			      }
			     
			   
			}else message="mobileNo must have 10 digits";
			
			
			
		}	
			
		
			  
			
			
			
	
		
		
		public List<SalesmanNSchedule> readSalesmans() throws SQLException{
			message=null;//when we do deletion and read happens request is sent i am making the status of insertion and updation to null ie not seen 
			System.out.println("inside readSalesman salesmaninfobean");
			 List<SalesmanNSchedule> slmnList=null;
			 slmnList= daoImpleSalesman.readSalesmans();
			 System.out.println("all details of salesman in database:"+slmnList);
			 if(slmnList!=null)
			          return slmnList;
			 else
			 {
				 message2="no customer details";
				 return null;
			 }
			
			
			
		}
	
	    public void salesmanDelete() throws SQLException{
            
	    	 message=null;//when deletion request is sent i am making the status of insertino and updation to null ie not seen  
	    	messageForDetetion= daoImpleSalesman.salesmanDelete(salesmanIdToDelete);
	    	System.out.println(messageForDetetion);
			
			
		}
		
		
    
    
}
