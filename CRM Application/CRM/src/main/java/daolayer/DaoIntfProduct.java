package daolayer;

import java.sql.SQLException;
import java.util.List;

import bean.ProductInfoBean;
import pojos.Products;

public interface DaoIntfProduct {
	  public String insertNUpdateProduct( ProductInfoBean productDetails) throws SQLException ;
	  public List<Products> readProducts() throws SQLException;
	  public String	productDelete(String productIdToDelete) throws SQLException;
}
