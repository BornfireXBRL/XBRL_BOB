package utilities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.log4j.Logger;
public class ConnectionManager extends ActionSupport{
	
	static Logger log = Logger.getLogger(ConnectionManager.class);
	Connection conn;
	public Connection getConnection() {
		try {
				Class.forName("oracle.jdbc.driver.OracleDriver");			
				DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver()) ;				 
				//log.info("1--- INSIDE CONNECTION MANAGER");
				
	conn = DriverManager.getConnection(getText("db.url")+":"+getText("db.dbname"),getText("db.username"),getText("db.password"));
				
			//	conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.22:1521:orcl","xbrl","xbrl1");	
			// log.info("INSIDE CONNECTION MANAGER");			
		}  catch (SQLException sqlexcp) {
			sqlexcp.printStackTrace();		
		} catch(Exception e){
			e.printStackTrace();
			
		}
		return conn;
	}
}
