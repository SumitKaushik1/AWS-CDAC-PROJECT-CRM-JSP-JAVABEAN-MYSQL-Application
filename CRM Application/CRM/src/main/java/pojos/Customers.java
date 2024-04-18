package pojos;

public class Customers {
private String customerId;
private String customerfirstName;
private String customerLastName;
private String  customerPassword;
private Long customerMobileNo;
private String customerEmail;
private String customerAddress;
private String userId;




public Customers() {
	super();
	// TODO Auto-generated constructor stub
}




public Customers(String customerId, String customerfirstName, String customerLastName, String customerPassword,
		Long customerMobileNo, String customerEmail, String customerAddress, String userId) {
	super();
	this.customerId = customerId;
	this.customerfirstName = customerfirstName;
	this.customerLastName = customerLastName;
	this.customerPassword = customerPassword;
	this.customerMobileNo = customerMobileNo;
	this.customerEmail = customerEmail;
	this.customerAddress = customerAddress;
	this.userId = userId;
}




public String getCustomerId() {
	return customerId;
}




public void setCustomerId(String customerId) {
	this.customerId = customerId;
}




public String getCustomerfirstName() {
	return customerfirstName;
}




public void setCustomerfirstName(String customerfirstName) {
	this.customerfirstName = customerfirstName;
}




public String getCustomerLastName() {
	return customerLastName;
}




public void setCustomerLastName(String customerLastName) {
	this.customerLastName = customerLastName;
}




public String getCustomerPassword() {
	return customerPassword;
}




public void setCustomerPassword(String customerPassword) {
	this.customerPassword = customerPassword;
}




public Long getCustomerMobileNo() {
	return customerMobileNo;
}




public void setCustomerMobileNo(Long customerMobileNo) {
	this.customerMobileNo = customerMobileNo;
}




public String getCustomerEmail() {
	return customerEmail;
}




public void setCustomerEmail(String customerEmail) {
	this.customerEmail = customerEmail;
}




public String getCustomerAddress() {
	return customerAddress;
}




public void setCustomerAddress(String customerAddress) {
	this.customerAddress = customerAddress;
}




public String getUserId() {
	return userId;
}




public void setUserId(String userId) {
	this.userId = userId;
}




@Override
public String toString() {
	return "Customers [customerId=" + customerId + ", customerfirstName=" + customerfirstName + ", customerLastName="
			+ customerLastName + ", customerPassword=" + customerPassword + ", customerMobileNo=" + customerMobileNo
			+ ", customerEmail=" + customerEmail + ", customerAddress=" + customerAddress + ", userId=" + userId + "]";
}




}
