package servelettoonmysqlserverondummyQuery;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import dbutils.DBUtils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Timer;
import java.util.TimerTask;

public class HeartbeatServlet extends HttpServlet {

    /**
	 * 
	 */
	/*
	 * private static final long serialVersionUID = 1L; private static final String
	 * JDBC_URL = "jdbc:mysql://localhost:3306/"; private static final String
	 * USERNAME = "username"; private static final String PASSWORD = "password";
	 */
    private static final String HEARTBEAT_QUERY = "SELECT 1";

    @Override
    public void init() throws ServletException {
    	//System.out.println("heartbeat exectuted");
        super.init();
        // Schedule the heartbeat task to run every 5 minutes
        Timer timer = new Timer();
        timer.scheduleAtFixedRate(new HeartbeatTask(), 0, 478*60*1000 ); // 470 minutes
//wait_timeout of teh mysql servr is 28800 second is 8 hr onw 480 minute ie after that conenciton will closed automaticlay
        //i want a query before 480 minutes a query so that connection si not closed so 479 minute 
    }

    private class HeartbeatTask extends TimerTask {
        @Override
        public void run() {
            executeHeartbeatQuery();
        }
    }

    private void executeHeartbeatQuery() {
        try (Connection connection =DBUtils.getConnection();
             Statement statement = connection.createStatement()) {
        	System.out.println("connection status in timer "+connection);
            System.out.println("heartbeat exectuted");
        	statement.execute(HEARTBEAT_QUERY);
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately
        }
    }
}
