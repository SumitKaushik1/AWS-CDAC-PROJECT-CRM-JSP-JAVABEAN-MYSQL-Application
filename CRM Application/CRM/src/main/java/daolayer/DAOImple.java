package daolayer;

import static dbutils.DBUtils.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.CustomerInfoBean;
import bean.ProductInfoBean;
import bean.SalesmanInfoBean;
import pojos.Customers;
import pojos.Permission;
import pojos.Products;
import pojos.Roles;
import pojos.SalesmanNSchedule;
import pojos.Users;

public class DAOImple implements DAOIntf {

	private PreparedStatement p1, p2, p3;

	private Connection cn;


	public DAOImple() throws SQLException {
		System.out.println("dao instance is made");
		cn = getConnection();
	
		p1 = cn.prepareStatement("select * from users where user_id=?");
		
		p2 = cn.prepareStatement("select * from roles where role_id=?");
		
		p3 = cn.prepareStatement("select * from permission where Roles_role_id=?");
		
		System.out.println(p1.getClass());
	
	}

	public void cleanUp() throws SQLException {
		System.out.println("doa instance cleanedsup");
		if (p1 != null)
			p1.close();
		if (p2 != null)
			p2.close();
		if (p3 != null)
			p3.close();
		
		// note each client has sesssino and the lgoin bean boject is created accoreding
		// to
		// like how customerinfobean,later salesmaninfobeamn,later productbean created
		// each bean has the Daoimple object, each Daoimple has the p1,p2...p5 object
		// so when logout the user there i want to destroy the session of dao imple
		// calss
		// there i want to clean up resoureces
		// so the bean( in session)--conatin the Daoimple obejct-> conatin all obejcts
		// p1,p5,p6of resources

		// once the session is destroyed then the then all inside obejcts will
		// auomatcialy destroyed so we invalidate the session in the logout.jsp page
	}

	@Override
	public List<Users> verifyUsers(String userId) throws SQLException {
		System.out.println("inside the  verify user dao");
		List<Users> userList = new ArrayList<>();
		p1.setString(1, userId);

		try (ResultSet r = p1.executeQuery()) {

			if (r.next())
				userList.add(new Users(r.getString(1), r.getString(2), r.getString(3), r.getString(4), r.getLong(5),
						r.getString(6)));

		}

		System.out.println(userList);

		return userList;

	}

	@Override
	public List<Roles> verifyRole(String roleId) throws SQLException {
		System.out.println("inside verify role Dao");

		List<Roles> roleList = new ArrayList<>();
		p2.setString(1, roleId);

		try (ResultSet r = p2.executeQuery()) {

			if (r.next())
				roleList.add(new Roles(r.getString(1), r.getString(2), r.getString(3)));

		}

		System.out.println(roleList);
		return roleList;

	}

	@Override
	public List<Permission> permission(String roleId) throws SQLException {
		System.out.println("inside the dao permission ");
		List<Permission> perList = new ArrayList<>();
		p3.setString(1, roleId);
		try (ResultSet r = p3.executeQuery()) {

			while (r.next()) {

				perList.add(new Permission(r.getString(1), r.getString(2), r.getString(3), r.getString(4)));

			}
			System.out.println(perList);
			return perList;
		}

	}

     	
      
      
  		
  		
  

}
      
	
      
			       	    





		      

		
		


	
	


