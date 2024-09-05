package daolayer;

import java.sql.SQLException;
import java.util.List;

import bean.CustomerInfoBean;
import pojos.Customers;

public interface DaoIntfCustomer {
	   public String  insertNUpdateCustomer( CustomerInfoBean customerDetails) throws SQLException;
	   public List<Customers> readCustomers ()throws SQLException;
	   public String	customerDelete( String customerIdToDelete) throws SQLException;
}
