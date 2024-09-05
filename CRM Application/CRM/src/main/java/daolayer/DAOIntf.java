package daolayer;

import java.sql.SQLException;
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

public interface DAOIntf {
	 public List<Users> verifyUsers(String userId) throws SQLException;
	 public List<Roles> verifyRole(String roleId) throws SQLException;
	 public List<Permission> permission(String roleId)throws SQLException;

    		
}
