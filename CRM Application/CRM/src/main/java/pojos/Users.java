package pojos;

public class Users {
	private String userId;
	private String userFirstName;
	private String userLastName;
	private String password;
	private long mobileNo;
	private String address;
	
	
	public Users() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Users(String userId, String userFirstName, String userLastName, String password, long mobileNo,
			String address) {
		super();
		this.userId = userId;
		this.userFirstName = userFirstName;
		this.userLastName = userLastName;
		this.password = password;
		this.mobileNo = mobileNo;
		this.address = address;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserFirstName() {
		return userFirstName;
	}


	public void setUserFirstName(String userFirstName) {
		this.userFirstName = userFirstName;
	}


	public String getUserLastName() {
		return userLastName;
	}


	public void setUserLastName(String userLastName) {
		this.userLastName = userLastName;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public long getMobileNo() {
		return mobileNo;
	}


	public void setMobileNo(long mobileNo) {
		this.mobileNo = mobileNo;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	@Override
	public String toString() {
		return "Users [userId=" + userId + ", userFirstName=" + userFirstName + ", userLastName=" + userLastName
				+ ", password=" + password + ", mobileNo=" + mobileNo + ", address=" + address + "]";
	}
	
	
	
	

}
