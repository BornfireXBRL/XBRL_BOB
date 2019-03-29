package reports;

import java.io.*;
import java.net.URI;
import java.nio.file.FileSystem;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
import org.apache.log4j.Logger;
public class ZipFileExample {

	static Logger log = Logger.getLogger(ZipFileExample.class);
    
    
   /* private static final String INPUT_FILE = "C:\\Users\\praveen\\Desktop\\ID\\SUP0600.xml";
    private static final String OUTPUT_FILE = "C:\\Users\\praveen\\Desktop\\ID\\testFile.zip";

    public static void main(String[] args) {

        zipFile(new File(INPUT_FILE), OUTPUT_FILE);

    }*/
    
    
    
public void pymxml() throws IOException, SQLException {
		
	
	
		
		
		
        
		String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
		String JDBC_STRING = "jdbc:oracle:thin:@192.168.1.22:1521:orcl";
		String USER_NAME = "xbrl";
		String PASSWD = "xbrl1";
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt = null;
		Clob xmlClob = null;
		try{
		Class.forName(JDBC_DRIVER);
        conn = DriverManager.getConnection(JDBC_STRING, USER_NAME, PASSWD);
        stmt = conn.createStatement();
        
        
        String insertQuery = "SELECT x.XBRL_RPT.getCLOBVal() FROM PYM0100_XBRL_OUTPUT x";
        
        
        
       
		log.info("Sql String 111"+insertQuery.toString());
        
        
        rs = stmt.executeQuery(insertQuery);
        rs.next();
        xmlClob = (Clob) rs.getClob(1);
        
       
        Reader xmlReader = xmlClob.getCharacterStream();
        char[] buffer = new char[(int)xmlClob.length()];
        StringBuffer sb = new StringBuffer();
        if(xmlClob.length()>0){
        	FileWriter fw = new FileWriter("C:\\Users\\gayathiri s\\Desktop\\ID\\23423.xml");
        	
        	String xml = "C:\\Users\\gayathiri s\\Desktop\\ID\\23423.xml";
        	
        	
             
             
             String zipFile = "C:\\Users\\gayathiri s\\Desktop\\ID\\ars.zip";
     		
            
        	
        	int ch;
			while (( ch = xmlReader.read(buffer)) != -1){
        		sb.append(buffer);
        	}
			fw.append(sb.toString());
			fw.close();
        }
		}catch(SQLException sqlEx){
			sqlEx.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
				try {
					if(rs!=null) rs.close();
					if(stmt !=null) stmt.close();
					if(conn!=null) conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
	
		//return "success";
	}
    
public void blsxml() throws IOException, SQLException {
	
	
	
	
	
	
    
	String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
	String JDBC_STRING = "jdbc:oracle:thin:@192.168.1.22:1521:orcl";
	String USER_NAME = "xbrl";
	String PASSWD = "xbrl1";
	Connection conn = null;
	ResultSet rs = null;
	Statement stmt = null;
	Clob xmlClob = null;
	try{
	Class.forName(JDBC_DRIVER);
    conn = DriverManager.getConnection(JDBC_STRING, USER_NAME, PASSWD);
    stmt = conn.createStatement();
    
    
    String insertQuery = "SELECT x.XBRL_RPT.getCLOBVal() FROM BLS0100_XBRL_OUTPUT x";
    
    
    
   
	log.info("Sql String 111"+insertQuery.toString());
    
    
    rs = stmt.executeQuery(insertQuery);
    rs.next();
    xmlClob = (Clob) rs.getClob(1);
    
   
    Reader xmlReader = xmlClob.getCharacterStream();
    char[] buffer = new char[(int)xmlClob.length()];
    StringBuffer sb = new StringBuffer();
    if(xmlClob.length()>0){
    	FileWriter fw = new FileWriter("C:\\Users\\praveen\\Desktop\\ID\\23423.xml");
    	
    	String xml = "C:\\Users\\praveen\\Desktop\\ID\\23423.xml";
    	
    	
         
         
         String zipFile = "C:\\Users\\praveen\\Desktop\\ID\\ars.zip";
 		
        
    	
    	int ch;
		while (( ch = xmlReader.read(buffer)) != -1){
    		sb.append(buffer);
    	}
		fw.append(sb.toString());
		fw.close();
    }
	}catch(SQLException sqlEx){
		sqlEx.printStackTrace();
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (IOException e) {
		e.printStackTrace();
	}finally{
			try {
				if(rs!=null) rs.close();
				if(stmt !=null) stmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

	//return "success";
}
public void bls2xml() throws IOException, SQLException {
	
	
	
	
	
	
    
	String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
	String JDBC_STRING = "jdbc:oracle:thin:@192.168.1.22:1521:orcl";
	String USER_NAME = "xbrl";
	String PASSWD = "xbrl1";
	Connection conn = null;
	ResultSet rs = null;
	Statement stmt = null;
	Clob xmlClob = null;
	try{
	Class.forName(JDBC_DRIVER);
    conn = DriverManager.getConnection(JDBC_STRING, USER_NAME, PASSWD);
    stmt = conn.createStatement();
    
    
    String insertQuery = "SELECT x.XBRL_RPT.getCLOBVal() FROM BLS0100_XBRL_OUTPUT x";
    
    
    
   
	log.info("Sql String 111"+insertQuery.toString());
    
    
    rs = stmt.executeQuery(insertQuery);
    rs.next();
    xmlClob = (Clob) rs.getClob(1);
    
   
    Reader xmlReader = xmlClob.getCharacterStream();
    char[] buffer = new char[(int)xmlClob.length()];
    StringBuffer sb = new StringBuffer();
    if(xmlClob.length()>0){
    	FileWriter fw = new FileWriter("C:\\Users\\praveen\\Desktop\\ID\\23423.xml");
    	
    	String xml = "C:\\Users\\praveen\\Desktop\\ID\\23423.xml";
    	
    	
         
         
         String zipFile = "C:\\Users\\praveen\\Desktop\\ID\\ars.zip";
 		
        
    	
    	int ch;
		while (( ch = xmlReader.read(buffer)) != -1){
    		sb.append(buffer);
    	}
		fw.append(sb.toString());
		fw.close();
    }
	}catch(SQLException sqlEx){
		sqlEx.printStackTrace();
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (IOException e) {
		e.printStackTrace();
	}finally{
			try {
				if(rs!=null) rs.close();
				if(stmt !=null) stmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

	//return "success";
}
    public static void zipFile(File xml, String zipFile) {
        try {

            // Wrap a FileOutputStream around a ZipOutputStream
            // to store the zip stream to a file. Note that this is
            // not absolutely necessary
            FileOutputStream fileOutputStream = new FileOutputStream(zipFile);
            ZipOutputStream zipOutputStream = new ZipOutputStream(fileOutputStream);

            // a ZipEntry represents a file entry in the zip archive
            // We name the ZipEntry after the original file's name
            ZipEntry zipEntry = new ZipEntry(xml.getName());
            zipOutputStream.putNextEntry(zipEntry);

            FileInputStream fileInputStream = new FileInputStream(xml);
            byte[] buf = new byte[1024];
            int bytesRead;

            // Read the input file by chucks of 1024 bytes
            // and write the read bytes to the zip stream
            while ((bytesRead = fileInputStream.read(buf)) > 0) {
                zipOutputStream.write(buf, 0, bytesRead);
            }

            // close ZipEntry to store the stream to the file
            zipOutputStream.closeEntry();

            zipOutputStream.close();
            fileOutputStream.close();

            log.info("Regular file :" + xml.getCanonicalPath()+" is zipped to archive :"+zipFile);

        } catch (IOException e) {
            e.printStackTrace();
        }

    }
    
    
    
}





