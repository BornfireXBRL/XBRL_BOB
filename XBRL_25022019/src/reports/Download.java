package reports;
 
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
 
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import oracle.xdb.XMLType;

import org.apache.struts2.ServletActionContext;
import org.apache.log4j.Logger;
/**
 * A servlet that retrieves a file from MySQL database and lets the client
 * downloads the file.
 * @author www.codejava.net
 */
@WebServlet("/downloadFileServlet")
public class Download extends HttpServlet {
	static Logger log = Logger.getLogger(Download.class);
 
    // size of byte buffer to send file
    private static final int BUFFER_SIZE = 4096;   
     
    // database connection settings
   /* private String dbURL = "jdbc:mysql://localhost:3306/FileDB";
    private String dbUser = "root";
    private String dbPass = "secret";*/
     
    public String downs() throws IOException, SQLException {
    	
   
    	
    	HttpServletRequest request = ServletActionContext.getRequest();
    	HttpServletResponse response = ServletActionContext.getResponse();
		HttpSession session1 = ServletActionContext.getRequest().getSession(false); 
		
   
        // get upload id from URL's parameters
        int uploadId = 1;
         
        Connection conn = null; // connection to the database
         
        try {
            // connects to the database
            try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
            conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.22:1521:orcl","xbrl","xbrl1");
            
           
            // queries the database
           /* String sql = "SELECT * FROM PYM0100_XBRL_OUTPUT";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, uploadId);*/
 
           
            PreparedStatement stmt =  conn.prepareStatement(
                    "SELECT * FROM PYM0100_XBRL_OUTPUT"); 
          ResultSet rset = stmt.executeQuery(); 
          
          while(rset.next())
          { 
          // get the XMLType 
          XMLType poxml = (XMLType)rset.getObject(1); 

          // get the XML as a string...
          String poString = poxml.getStringVal();
           } 
        } catch (SQLException ex) {
            ex.printStackTrace();
            response.getWriter().print("SQL Error: " + ex.getMessage());
        }  finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }          
        }
        return "success";
    }
    }





