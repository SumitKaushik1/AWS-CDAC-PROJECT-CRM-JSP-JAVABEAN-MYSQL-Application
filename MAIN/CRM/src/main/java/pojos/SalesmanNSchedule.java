package pojos;
//pojos for mapping to the database table 
public class SalesmanNSchedule {
  private String salesmanId;
  private String salesmanFirstName;
  private String salesmanLastName;
  private String salesmanPassword;
  private Long salesmanMobileNo;//wrapper class Long
  private String salesmanAddress;
  private String salesmanScheduleId;
  private String salesmanEmail;
  private String userId;
  private String salesmanScheduleType;
  private String salesmanScheduleDescription;

public SalesmanNSchedule(String salesmanId, String salesmanFirstName, String salesmanLastName, String salesmanPassword,
		Long salesmanMobileNo, String salesmanAddress, String salesmanScheduleId, String salesmanEmail, String userId,
		String salesmanScheduleType, String salesmanScheduleDescription) {
	super();
	this.salesmanId = salesmanId;
	this.salesmanFirstName = salesmanFirstName;
	this.salesmanLastName = salesmanLastName;
	this.salesmanPassword = salesmanPassword;
	this.salesmanMobileNo = salesmanMobileNo;
	this.salesmanAddress = salesmanAddress;
	this.salesmanScheduleId = salesmanScheduleId;
	this.salesmanEmail = salesmanEmail;
	this.userId = userId;
	this.salesmanScheduleType = salesmanScheduleType;
	this.salesmanScheduleDescription = salesmanScheduleDescription;
}
public String getSalesmanId() {
	return salesmanId;
}
public void setSalesmanId(String salesmanId) {
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
public String getSalesmanPassword() {
	return salesmanPassword;
}
public void setSalesmanPassword(String salesmanPassword) {
	this.salesmanPassword = salesmanPassword;
}
public Long getSalesmanMobileNo() {
	return salesmanMobileNo;
}
public void setSalesmanMobileNo(Long salesmanMobileNo) {
	this.salesmanMobileNo = salesmanMobileNo;
}
public String getSalesmanAddress() {
	return salesmanAddress;
}
public void setSalesmanAddress(String salesmanAddress) {
	this.salesmanAddress = salesmanAddress;
}
public String getSalesmanScheduleId() {
	return salesmanScheduleId;
}
public void setSalesmanScheduleId(String salesmanScheduleId) {
	this.salesmanScheduleId = salesmanScheduleId;
}
public String getSalesmanEmail() {
	return salesmanEmail;
}
public void setSalesmanEmail(String salesmanEmail) {
	this.salesmanEmail = salesmanEmail;
}
public String getUserId() {
	return userId;
}
public void setUserId(String userId) {
	this.userId = userId;
}
public String getSalesmanScheduleType() {
	return salesmanScheduleType;
}
public void setSalesmanScheduleType(String salesmanScheduleType) {
	this.salesmanScheduleType = salesmanScheduleType;
}
public String getSalesmanScheduleDescription() {
	return salesmanScheduleDescription;
}
public void setSalesmanScheduleDescription(String salesmanScheduleDescription) {
	this.salesmanScheduleDescription = salesmanScheduleDescription;
}
@Override
public String toString() {
	return "SalesmanNSchedule [salesmanId=" + salesmanId + ", salesmanFirstName=" + salesmanFirstName
			+ ", salesmanLastName=" + salesmanLastName + ", salesmanPassword=" + salesmanPassword
			+ ", salesmanMobileNo=" + salesmanMobileNo + ", salesmanAddress=" + salesmanAddress
			+ ", salesmanScheduleId=" + salesmanScheduleId + ", salesmanEmail=" + salesmanEmail + ", userId=" + userId
			+ ", salesmanScheduleType=" + salesmanScheduleType + ", salesmanScheduleDescription="
			+ salesmanScheduleDescription + "]";
}
	
  
  
  
  
}
