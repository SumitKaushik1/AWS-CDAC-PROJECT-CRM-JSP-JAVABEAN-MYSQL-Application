package dbutils;
import java.sql .Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class DBUtils {
 private static Connection cn;
   
 public static Connection openConnection() throws SQLException {
	  System.out.println("opened connection");                     
	 String url="jdbc:mysql://localhost:3306/main_project?createDatabaseIfNotExist=true&useSSL=false&allowPublicKeyRetrieval=true";
	 
	 
       cn=DriverManager.getConnection(url,"root","Sumit@123");
	
	 System.out.println("implementaion class:"+cn.getClass());
	 return cn;
	 
	 
	 
 }
    
   public static Connection getConnection() throws SQLException {
	   System.out.println("got connection");
	   if(cn==null || cn.isClosed())
		 //by chance the conenction is closed in thread implicity tehn new connection si placed
		   //note closed means memory si cleaned and the resource clean 
		   //it is not according that cn become the null it will still hold the object 
		   return openConnection();
	   
	   else {
			 System.out.println("implementaion class connection interface(upcasting) is :"+cn.getClass());
		 return  cn;
	   }
	   
   }

   public static void closeConnection() throws SQLException {
	   System.out.println("closed connection");// i do not waant to close the connection for each client 
	    if(cn!=null)//b/z then for each client it will be destroyed and for new client agin connectino is made take time 
	    	cn.close();//so we maintaint he object of conncetinon inthe heap so it will  be shared accross the client 
	   // when the server is off automatically all will be off  all object will be ready for the garbage coolection b/w web serever dis of or 
	    //web contaoner will off
   }
   
}
