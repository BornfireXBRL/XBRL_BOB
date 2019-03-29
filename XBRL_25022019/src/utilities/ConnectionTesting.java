package utilities;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import utilities.ConnectionManager;

import org.apache.log4j.Logger;

public class ConnectionTesting {
	static Logger log = Logger.getLogger(ConnectionTesting.class);
	private static Connection mconn;
	public static void main (String args[]){
		log.info("welcome"); 
		PreparedStatement ps = null;
		StringBuffer sql = null;		
		sql = new StringBuffer();
		
		ConnectionManager connMgr = new ConnectionManager();		
		log.info("before get connecction");
		mconn = connMgr.getConnection();
		
		try {
			sql = new StringBuffer();
			/* Query for Sent Message count - MainGroup */			
			sql.append("SELECT USERNAME, PASSWORD FROM ").append("XBLOGIN");			
			ps = mconn.prepareStatement(sql.toString());
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {     
				String un = (rs.getString("USERNAME"));  
				String pw = (rs.getString("PASSWORD")); 				
				    log.info("un: " + un);
				    log.info("pw: " + pw);
			}
			ps.close();
		}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
/*		try {
			sql.append("select user_name,pass_word from user_login");
			ps = conn.prepareStatement(sql.toString());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {				
				String userName = rs.getString("user_name");
				String passWord = rs.getString("pass_word");
				log.info("USER NAME :  " + userName);
				log.info("PASSWORD : = " + passWord);
			}
			ps.close();
			conn.close();				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
	}
}