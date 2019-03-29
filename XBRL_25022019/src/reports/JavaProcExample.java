package reports;
import java.sql.*;
import org.apache.log4j.Logger;
public class JavaProcExample {
	
	static Logger log = Logger.getLogger(JavaProcExample.class);
	
 public static void main(String[] args) throws SQLException {

Connection conn = null;
 try {
  //Load and register Oracle driver
  DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
 //Establish a connection

 conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.22:1521:orcl", "xbrl", "xbrl1");
 
 
 
 CallableStatement pstmt =  conn.prepareCall("{call FINAL_REPORT_UPDATE_SP(?,?,?,?,?)}");
 pstmt.setString(1, "PYM0100");
 pstmt.setInt(2, 0);
 pstmt.setString(3, "31-MAR-2014");
 pstmt.setString(4, "01-MAR-2014");
 pstmt.setString(5, "31-MAR-2014");
 
 
 pstmt.executeUpdate();
 
 

 pstmt.close();
 conn.close();
  } catch (SQLException e) {  e.getErrorCode(); 
   System.err.println(  e.getMessage()); conn.close();}
 }
}