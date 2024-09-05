package daolayer;

import java.sql.SQLException;
import java.util.List;

import bean.SalesmanInfoBean;
import pojos.SalesmanNSchedule;

public interface DaoIntfSalesman {
	 public String insertNUpdateSalesman(SalesmanInfoBean salesmanDetails) throws SQLException;
     public List<SalesmanNSchedule> readSalesmans() throws SQLException;
     public String	salesmanDelete(String salesmanIdToDelete) throws SQLException;
}
