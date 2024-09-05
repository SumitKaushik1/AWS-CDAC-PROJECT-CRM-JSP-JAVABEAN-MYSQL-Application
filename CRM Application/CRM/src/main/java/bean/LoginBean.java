package bean;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import daolayer.DAOImple;
import pojos.Permission;
import pojos.Roles;
import pojos.Users;

public class LoginBean {
	private String loginId;
	private String loginRoleId;
	private String loginFirstName;
	private String loginLastName;
	private  String loginPassword;
	
	private DAOImple daoVari;
	
	private String message;
	private String userIdViaLoginId;
	private String loginRole;
	
	
	
	public LoginBean() throws SQLException {
	
		super();
		System.out.println("login bean started");
		daoVari=new DAOImple();
	   
	}
	
	
	
	
	
	public LoginBean(String loginId, String loginRoleId, String loginFirstName, String loginLastName,
			String loginPassword, DAOImple daoVari, String message, String userIdViaLoginId, String loginRole) {
		super();
		this.loginId = loginId;
		this.loginRoleId = loginRoleId;
		this.loginFirstName = loginFirstName;
		this.loginLastName = loginLastName;
		this.loginPassword = loginPassword;
		this.daoVari = daoVari;
		this.message = message;
		this.userIdViaLoginId = userIdViaLoginId;
		this.loginRole = loginRole;
	}





	//setters and getters to take input value from page
	public String getLoginId() {
		
		return loginId;
	}
	public void setLoginId(String loginId) {
		System.out.println("loginid is setter is called");
		this.loginId = loginId;
	}
	public String getLoginRoleId() {
		System.out.println("loginRoleid is setter is called");
		return loginRoleId;
	}
	public void setLoginRoleId(String loginRoleId) {
		this.loginRoleId = loginRoleId;
	}
	public String getLoginFirstName() {
		return loginFirstName;
	}
	public void setLoginFirstName(String loginFirstName) {
		this.loginFirstName = loginFirstName;
	}
	public String getLoginLastName() {
		return loginLastName;
	}
	public void setLoginLastName(String loginLastName) {
		this.loginLastName = loginLastName;
	}
	public String getLoginPassword() {
		return loginPassword;
	}
	public void setLoginPassword(String loginPassword) {
		this.loginPassword = loginPassword;
	}
	
	public DAOImple getDaoVari() {
		return daoVari;
	}
	public void setDaoVari(DAOImple daoVari) {
		this.daoVari = daoVari;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	
	public String getUserIdViaLoginId() {
		return userIdViaLoginId;
	}
	public void setUserIdViaLoginId(String userIdViaLoginId) {
		this.userIdViaLoginId = userIdViaLoginId;
		
		
	}
	
	public String getLoginRole() {
		return loginRole;
	}





	public void setLoginRole(String loginRole) {
		this.loginRole = loginRole;
	}





	public boolean verifyUsers() throws SQLException {
		System.out.println("inside verify users login bean"+ toString());
		
		List<Users> usersList;
		Users user;
		usersList=daoVari.verifyUsers(loginId);

		//users class to string is called 
	   if(usersList.isEmpty()) {message="Wrong Credentials"; return false;}
	   else {
		user=usersList.get(0);
		if(user==null)
		   {message="User Donot Match";return false;}
			  else if(!(user.getUserFirstName().equals(loginFirstName)))
			         {message=" First Name Donot Match";return false;}
		                 else if(!(user.getUserLastName().equals(loginLastName)))
			                      { message= " Last Name Do Not Match";return false;}
		                               else if(!(user.getPassword().equals(loginPassword)))
		                                               {message="Wrong Password";return false;}
		this. userIdViaLoginId=user.getUserId();//it will be used while inserting and updating the details in customer table(cusomter.jsp b/z there is one more column in that table there user_id)
		//
		this.message=null;return true; 
	   }	
	   
	}
	
	@SuppressWarnings("unused")
	public String verifyRole() throws SQLException {
		System.out.println("inside verify role loginbean"+toString());
		 List<Roles>roleList;
		 Roles role=null;
		roleList= daoVari.verifyRole(loginRoleId);
	
		//Roles class class to string is called 
		 if(roleList.isEmpty())
		      {loginRole="User Has No Role"; return "false";}
		 else {
			       role=roleList.get(0);
			   if(role==null)
			       {loginRole="Role Donot Match"; return "false";}
			   else if((role.getRoleName().toUpperCase()).equals("ADMIN"))
 	                       {loginRole="ADMIN";return "ADMIN";}
                     else if((role.getRoleName().toUpperCase()).equals("MANAGER"))
                         {loginRole="MANAGER";return "MANAGER";    }
                               else if((role.getRoleName().toUpperCase()).equals("ENGINEER"))
                                   { loginRole="ENGINEER";  return "ENGINEER";}
									         else if((role.getRoleName().toUpperCase()).equals("CEO"))
									         { loginRole="CEO"; return "CEO"; }      
											 }        	     
	 
			 
		return "true";
		 
		 
	 }
	
	
	public List<String> permission() throws SQLException{
		System.out.println("inside permssion loginbean"+ toString());
	
		List<Permission> perList;
	    List<String>perNameList=new ArrayList<>();
		perList=daoVari.permission(loginRoleId);
		
		perList.forEach(s->{ 
			
			perNameList.add(s.getPerModule()+s.getPerName());
			
			
			
		});
		System.out.println(perNameList);
		return perNameList;
		
	}





	@Override
	public String toString() {
		return "LoginBean [loginId=" + loginId + ", loginRoleId=" + loginRoleId + ", loginFirstName=" + loginFirstName
				+ ", loginLastName=" + loginLastName + ", loginPassword=" + loginPassword + ", daoVari=" + daoVari
				+ ", message=" + message + ", userIdViaLoginId=" + userIdViaLoginId + ", loginRole=" + loginRole + "]";
	}
	
	
	

	   
	

}
	

