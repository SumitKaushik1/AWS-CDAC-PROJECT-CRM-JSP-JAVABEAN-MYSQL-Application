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

     public String  insertNUpdateCustomer( CustomerInfoBean customerDetails) throws SQLException;
     public String insertNUpdateSalesman(SalesmanInfoBean customerDetails) throws SQLException;
     public String insertNUpdateProduct( ProductInfoBean productDetails) throws SQLException ;
     public List<Customers> readCustomers ()throws SQLException;
	  public List<SalesmanNSchedule> readSalesmans() throws SQLException;
	  public List<Products> readProducts() throws SQLException;
      public String	customerDelete( String customerIdToDelete) throws SQLException;
      public String	salesmanDelete(String salesmanIdToDelete) throws SQLException;
      public String	productDelete(String productIdToDelete) throws SQLException;
    		
}
