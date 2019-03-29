package reports;



import java.awt.Desktop;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import basecode.DateFormat;
import bean.XBRLReportMasterBean;
import dao.XBRLPYM0100Dao;
import dao.XBRLReportMasterDao;
import utilities.ConnectionManager;
import org.apache.log4j.Logger;
/**
 * @author http://kodehelp.com
 *
 */







public class XMLDOWNLOAD extends ActionSupport {
	
	static Logger log = Logger.getLogger(XMLDOWNLOAD.class);
	
	
	


private InputStream inputStream;
private String fileName;
private long contentLength;

DateFormat df1 = new DateFormat();



	public InputStream getInputStream() {
	return inputStream;
}





public void setInputStream(InputStream inputStream) {
	this.inputStream = inputStream;
}





public String getFileName() {
	return fileName;
}





public void setFileName(String fileName) {
	this.fileName = fileName;
}





public long getContentLength() {
	return contentLength;
}





public void setContentLength(long contentLength) {
	this.contentLength = contentLength;
}





	/**
	 * This class contains the logic for reading the XML from XMLType column from 
	 * database using JDBC.
	 * @param args
	 * @throws ClassNotFoundException 
	 */
	
	public String pymxml() throws IOException, SQLException, ClassNotFoundException {
				
		HttpServletRequest request = ServletActionContext.getRequest();
        
		ResultSet rs = null;
		Statement stmt = null;
		Clob xmlClob = null;
		XBRLReportMasterDao dmd=new XBRLReportMasterDao();
		String reportid = request.getParameter("reptype");
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();


		 XBRLReportMasterBean xrm=dmd.xbrlsummarypdf(request.getParameter("reptype"));

		try{
		
        stmt = conn.createStatement();
    

        
        String insertQuery = "SELECT x.XBRL_RPT.getCLOBVal() FROM "+reportid+"_XBRL_OUTPUT x WHERE REPORT_DATE='"+df1.formatdate(request.getParameter("dt2"))+"'";
        
    
       
       
		log.info("Sql String 111"+insertQuery.toString());
        
        
        rs = stmt.executeQuery(insertQuery);
        rs.next();
        xmlClob = (Clob) rs.getClob(1);
        
       
        Reader xmlReader = xmlClob.getCharacterStream();
        char[] buffer = new char[(int)xmlClob.length()];
        StringBuffer sb = new StringBuffer();
        if(xmlClob.length()>0){
        	File xml = new File(getText("downloadpath")+request.getParameter("reptype"));
    		// log.info("folders " + folders);
    		boolean success11 = true;
    		if (!xml.exists()) {
    		success11 = xml.mkdirs();
    		}
        	FileWriter fw = new FileWriter(getText("downloadpath")+request.getParameter("reptype")+"/"+request.getParameter("reptype")+"_"+xrm.getInstcode()+"_"+request.getParameter("dt2")+".xml");
        	
        	//File xml = new File("/XBRL_REPORT/"+request.getParameter("reptype"));
        	
        	/* File fileToDownload = new File("E:/Download/struts-2.3.12-src.zip");
        	 */
        	
           //  inputStream = new FileInputStream(xml);
             fileName = xml.getName();
             contentLength = xml.length();
             
             
        	if (Desktop.isDesktopSupported()) {
				Desktop.getDesktop().open(xml);
			} else {
				log.info("Awt Desktop is not supported!");
			}
        	
        	int ch;
        	
			while (( ch = xmlReader.read(buffer)) != -1){
				
        		sb.append(buffer);
        	}
			fw.append(sb.toString());
			fw.close();
        }
		}catch(SQLException sqlEx){
			sqlEx.printStackTrace();
		}
		
		
		String zipFile = getText("downloadpath")+request.getParameter("reptype")+"/"+request.getParameter("reptype")+"_"+xrm.getInstcode()+"_"+request.getParameter("dt2")+".zip";
		
		String srcFiles =  getText("downloadpath")+request.getParameter("reptype")+"/"+request.getParameter("reptype")+"_"+xrm.getInstcode()+"_"+request.getParameter("dt2")+".xml";
		
		try {
			
			// create byte buffer
			byte[] buffer = new byte[1024];

			FileOutputStream fos = new FileOutputStream(zipFile);

			ZipOutputStream zos = new ZipOutputStream(fos);
			
			
				
				File srcFile = new File(srcFiles);

				FileInputStream fis = new FileInputStream(srcFile);

				// begin writing a new ZIP entry, positions the stream to the start of the entry data
				zos.putNextEntry(new ZipEntry(srcFile.getName()));
				
				int length;

				while ((length = fis.read(buffer)) > 0) {
					zos.write(buffer, 0, length);
				}

				zos.closeEntry();

				// close the InputStream
				fis.close();
				
		

			// close the ZipOutputStream
			zos.close();
			File fileToDownload = new File(zipFile);
			  inputStream = new FileInputStream(fileToDownload);
			  fileName = fileToDownload.getName();
			 

			  log.info("--->file download"+fileToDownload.getName());
			  contentLength = fileToDownload.length();
			  boolean success = (new File(zipFile)).delete();
			
			
		}
		
		
		
		
		catch (IOException e) {
			
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
	
		return "success";
	}
public String blsxml() throws IOException, SQLException, ClassNotFoundException {
		
	
	
		
		
		HttpServletRequest request = ServletActionContext.getRequest();
        
		ResultSet rs = null;
		Statement stmt = null;
		Clob xmlClob = null;
		XBRLReportMasterDao dmd=new XBRLReportMasterDao();
		String reportid = request.getParameter("reptype");
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
	  
		 XBRLReportMasterBean xrm=dmd.xbrlsumpdf(request.getParameter("reptype"));
		try{
		
        stmt = conn.createStatement();
        
        
        String insertQuery = "SELECT x.XBRL_RPT.getCLOBVal() FROM "+reportid+"_XBRL_OUTPUT x WHERE REPORT_DATE='"+df1.formatdate(request.getParameter("dt2"))+"'";
        
    
       
       
		log.info("Sql String 111"+insertQuery.toString());
        
        
        rs = stmt.executeQuery(insertQuery);
        rs.next();
        xmlClob = (Clob) rs.getClob(1);
        
       
        Reader xmlReader = xmlClob.getCharacterStream();
        char[] buffer = new char[(int)xmlClob.length()];
        StringBuffer sb = new StringBuffer();
        if(xmlClob.length()>0){
        	File xml = new File(getText("downloadpath")+request.getParameter("reptype"));
    		// log.info("folders " + folders);
    		boolean success11 = true;
    		if (!xml.exists()) {
    		success11 = xml.mkdirs();
    		}
        	FileWriter fw = new FileWriter(getText("downloadpath")+request.getParameter("reptype")+"/"+request.getParameter("reptype")+"_"+xrm.getInstcode()+"_"+request.getParameter("dt2")+".xml");
        	
        	//File xml = new File("/XBRL_REPORT/"+request.getParameter("reptype"));
        	
        	/* File fileToDownload = new File("E:/Download/struts-2.3.12-src.zip");
        	 */
        	
           //  inputStream = new FileInputStream(xml);
             fileName = xml.getName();
             contentLength = xml.length();
             
             
        	if (Desktop.isDesktopSupported()) {
				Desktop.getDesktop().open(xml);
			} else {
				log.info("Awt Desktop is not supported!");
			}
        	
        	int ch;
        	
			while (( ch = xmlReader.read(buffer)) != -1){
				
        		sb.append(buffer);
        	}
			fw.append(sb.toString());
			fw.close();
        }
		}catch(SQLException sqlEx){
			sqlEx.printStackTrace();
		}
		
		String zipFile = getText("downloadpath")+request.getParameter("reptype")+"/"+request.getParameter("reptype")+"_"+xrm.getInstcode()+"_"+request.getParameter("dt2")+".zip";
		
		String srcFiles =  getText("downloadpath")+request.getParameter("reptype")+"/"+request.getParameter("reptype")+"_"+xrm.getInstcode()+"_"+request.getParameter("dt2")+".xml";
		
		try {
			
			// create byte buffer
			byte[] buffer = new byte[1024];

			FileOutputStream fos = new FileOutputStream(zipFile);

			ZipOutputStream zos = new ZipOutputStream(fos);
			
			
				
				File srcFile = new File(srcFiles);

				FileInputStream fis = new FileInputStream(srcFile);

				// begin writing a new ZIP entry, positions the stream to the start of the entry data
				zos.putNextEntry(new ZipEntry(srcFile.getName()));
				
				int length;

				while ((length = fis.read(buffer)) > 0) {
					zos.write(buffer, 0, length);
				}

				zos.closeEntry();
				

				// close the InputStream
				fis.close();
				
		

			// close the ZipOutputStream
			zos.close();
			File fileToDownload = new File(zipFile);
			  inputStream = new FileInputStream(fileToDownload);
			  fileName = fileToDownload.getName();
			 

			  log.info("--->file download"+fileToDownload.getName());
			  contentLength = fileToDownload.length();
			  boolean success = (new File(zipFile)).delete();
			
			
		}
		
		
		
		
		catch (IOException e) {
			
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
	
		return "success";
	}
public String bls2xml() throws IOException, SQLException, ClassNotFoundException {
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
    
	ResultSet rs = null;
	Statement stmt = null;
	Clob xmlClob = null;
	XBRLReportMasterDao dmd=new XBRLReportMasterDao();
	String reportid = "BLS0100";
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
  
	 XBRLReportMasterBean xrm=dmd.xbrlsumpdf("BLS0100");
	try{
	
    stmt = conn.createStatement();
    
    
    String insertQuery = "SELECT x.XBRL_RPT.getCLOBVal() FROM "+reportid+"_XBRL_OUTPUT x WHERE REPORT_DATE='"+df1.formatdate(request.getParameter("dt2"))+"'";
    

   
   
	log.info("Sql String 111"+insertQuery.toString());
    
    
    rs = stmt.executeQuery(insertQuery);
    rs.next();
    xmlClob = (Clob) rs.getClob(1);
    
   
    Reader xmlReader = xmlClob.getCharacterStream();
    char[] buffer = new char[(int)xmlClob.length()];
    StringBuffer sb = new StringBuffer();
    if(xmlClob.length()>0){
    	File xml = new File(getText("downloadpath")+request.getParameter("reptype"));
		// log.info("folders " + folders);
		boolean success11 = true;
		if (!xml.exists()) {
		success11 = xml.mkdirs();
		}
    	FileWriter fw = new FileWriter(getText("downloadpath")+request.getParameter("reptype")+"/"+request.getParameter("reptype")+"_"+xrm.getInstcode()+"_"+request.getParameter("dt2")+".xml");
    	
    	//File xml = new File("/XBRL_REPORT/"+request.getParameter("reptype"));
    	
    	/* File fileToDownload = new File("E:/Download/struts-2.3.12-src.zip");
    	 */
    	
       //  inputStream = new FileInputStream(xml);
         fileName = xml.getName();
         contentLength = xml.length();
         
         
    	if (Desktop.isDesktopSupported()) {
			Desktop.getDesktop().open(xml);
		} else {
			log.info("Awt Desktop is not supported!");
		}
    	
    	int ch;
    	
		while (( ch = xmlReader.read(buffer)) != -1){
			
    		sb.append(buffer);
    	}
		fw.append(sb.toString());
		fw.close();
    }
	}catch(SQLException sqlEx){
		sqlEx.printStackTrace();
	}
	
	String zipFile = getText("downloadpath")+request.getParameter("reptype")+"/"+request.getParameter("reptype")+"_"+xrm.getInstcode()+"_"+request.getParameter("dt2")+".zip";
	
	String srcFiles =  getText("downloadpath")+request.getParameter("reptype")+"/"+request.getParameter("reptype")+"_"+xrm.getInstcode()+"_"+request.getParameter("dt2")+".xml";


	try {
		
		// create byte buffer
		byte[] buffer = new byte[1024];

		FileOutputStream fos = new FileOutputStream(zipFile);

		ZipOutputStream zos = new ZipOutputStream(fos);
		
		
			
			File srcFile = new File(srcFiles);

			FileInputStream fis = new FileInputStream(srcFile);

			// begin writing a new ZIP entry, positions the stream to the start of the entry data
			zos.putNextEntry(new ZipEntry(srcFile.getName()));
			
			int length;

			while ((length = fis.read(buffer)) > 0) {
				zos.write(buffer, 0, length);
			}

			zos.closeEntry();
			

			// close the InputStream
			fis.close();
			
	

		// close the ZipOutputStream
		zos.close();
		File fileToDownload = new File(zipFile);
		  inputStream = new FileInputStream(fileToDownload);
		  fileName = fileToDownload.getName();
		 

		  log.info("--->file download"+fileToDownload.getName());
		  contentLength = fileToDownload.length();
		  boolean success = (new File(zipFile)).delete();
		
		
	}
	
	
	
	
	catch (IOException e) {
		
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

	return "success";
}

public String fim0400() throws IOException, SQLException, ClassNotFoundException {
	
	
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
    
	ResultSet rs = null;
	Statement stmt = null;
	Clob xmlClob = null;
	XBRLReportMasterDao dmd=new XBRLReportMasterDao();
	String reportid = "FIM0400";
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
  
	 XBRLReportMasterBean xrm=dmd.xbrlsumpdf(request.getParameter("reptype"));
	try{
	
    stmt = conn.createStatement();
    
    
    String insertQuery = "SELECT x.XBRL_RPT.getCLOBVal() FROM "+reportid+"_XBRL_OUTPUT x WHERE REPORT_DATE='"+df1.formatdate(request.getParameter("dt2"))+"'";
    

   
   
	log.info("Sql String 111"+insertQuery.toString());
    
    
    rs = stmt.executeQuery(insertQuery);
    rs.next();
    xmlClob = (Clob) rs.getClob(1);
    
   
    Reader xmlReader = xmlClob.getCharacterStream();
    char[] buffer = new char[(int)xmlClob.length()];
    StringBuffer sb = new StringBuffer();
    if(xmlClob.length()>0){
    	File xml = new File(getText("downloadpath")+request.getParameter("reptype"));
		// log.info("folders " + folders);
		boolean success11 = true;
		if (!xml.exists()) {
		success11 = xml.mkdirs();
		}
    	FileWriter fw = new FileWriter(getText("downloadpath")+request.getParameter("reptype")+"/"+request.getParameter("reptype")+"_"+xrm.getInstcode()+"_"+request.getParameter("dt2")+".xml");
    	
    	//File xml = new File("/XBRL_REPORT/"+request.getParameter("reptype"));
    	
    	/* File fileToDownload = new File("E:/Download/struts-2.3.12-src.zip");
    	 */
    	
       //  inputStream = new FileInputStream(xml);
         fileName = xml.getName();
         contentLength = xml.length();
         
         
    	if (Desktop.isDesktopSupported()) {
			Desktop.getDesktop().open(xml);
		} else {
			log.info("Awt Desktop is not supported!");
		}
    	
    	int ch;
    	
		while (( ch = xmlReader.read(buffer)) != -1){
			
    		sb.append(buffer);
    	}
		fw.append(sb.toString());
		fw.close();
    }
	}catch(SQLException sqlEx){
		sqlEx.printStackTrace();
	}
	
	String zipFile = getText("downloadpath")+request.getParameter("reptype")+"/"+request.getParameter("reptype")+"_"+xrm.getInstcode()+"_"+request.getParameter("dt2")+".zip";
	
	String srcFiles =  getText("downloadpath")+request.getParameter("reptype")+"/"+request.getParameter("reptype")+"_"+xrm.getInstcode()+"_"+request.getParameter("dt2")+".xml";


	try {
		
		// create byte buffer
		byte[] buffer = new byte[1024];

		FileOutputStream fos = new FileOutputStream(zipFile);

		ZipOutputStream zos = new ZipOutputStream(fos);
		
		
			
			File srcFile = new File(srcFiles);

			FileInputStream fis = new FileInputStream(srcFile);

			// begin writing a new ZIP entry, positions the stream to the start of the entry data
			zos.putNextEntry(new ZipEntry(srcFile.getName()));
			
			int length;

			while ((length = fis.read(buffer)) > 0) {
				zos.write(buffer, 0, length);
			}

			zos.closeEntry();
			

			// close the InputStream
			fis.close();
			
	

		// close the ZipOutputStream
		zos.close();
		File fileToDownload = new File(zipFile);
		  inputStream = new FileInputStream(fileToDownload);
		  fileName = fileToDownload.getName();
		 

		  log.info("--->file download"+fileToDownload.getName());
		  contentLength = fileToDownload.length();
		  boolean success = (new File(zipFile)).delete();
		
		
	}
	
	
	
	
	catch (IOException e) {
		
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

	return "success";
}


public String p20xml() throws IOException, SQLException, ClassNotFoundException {
	
	
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
    
	ResultSet rs = null;
	Statement stmt = null;
	Clob xmlClob = null;
	XBRLReportMasterDao dmd=new XBRLReportMasterDao();
	String reportid = "PSC0020";
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
  
	 XBRLReportMasterBean xrm=dmd.xbrlsumpdf(request.getParameter("reptype"));
	try{
	
    stmt = conn.createStatement();
    
    
    String insertQuery = "SELECT x.XBRL_RPT.getCLOBVal() FROM "+reportid+"_XBRL_OUTPUT x WHERE REPORT_DATE='"+df1.formatdate(request.getParameter("dt2"))+"'";
    

   
   
	log.info("Sql String 111"+insertQuery.toString());
    
    
    rs = stmt.executeQuery(insertQuery);
    rs.next();
    xmlClob = (Clob) rs.getClob(1);
    
   
    Reader xmlReader = xmlClob.getCharacterStream();
    char[] buffer = new char[(int)xmlClob.length()];
    StringBuffer sb = new StringBuffer();
    if(xmlClob.length()>0){
    	File xml = new File(getText("downloadpath")+request.getParameter("reptype"));
		// log.info("folders " + folders);
		boolean success11 = true;
		if (!xml.exists()) {
		success11 = xml.mkdirs();
		}
    	FileWriter fw = new FileWriter(getText("downloadpath")+request.getParameter("reptype")+"/"+request.getParameter("reptype")+"_"+xrm.getInstcode()+"_"+request.getParameter("dt2")+".xml");
    	
    	//File xml = new File("/XBRL_REPORT/"+request.getParameter("reptype"));
    	
    	/* File fileToDownload = new File("E:/Download/struts-2.3.12-src.zip");
    	 */
    	
       //  inputStream = new FileInputStream(xml);
         fileName = xml.getName();
         contentLength = xml.length();
         
         
    	if (Desktop.isDesktopSupported()) {
			Desktop.getDesktop().open(xml);
		} else {
			log.info("Awt Desktop is not supported!");
		}
    	
    	int ch;
    	
		while (( ch = xmlReader.read(buffer)) != -1){
			
    		sb.append(buffer);
    	}
		fw.append(sb.toString());
		fw.close();
    }
	}catch(SQLException sqlEx){
		sqlEx.printStackTrace();
	}
	
	
	String zipFile = getText("downloadpath")+request.getParameter("reptype")+"/"+request.getParameter("reptype")+"_"+xrm.getInstcode()+"_"+request.getParameter("dt2")+".zip";
	
	String srcFiles =  getText("downloadpath")+request.getParameter("reptype")+"/"+request.getParameter("reptype")+"_"+xrm.getInstcode()+"_"+request.getParameter("dt2")+".xml";
	
	try {
		
		// create byte buffer
		byte[] buffer = new byte[1024];

		FileOutputStream fos = new FileOutputStream(zipFile);

		ZipOutputStream zos = new ZipOutputStream(fos);
		
		
			
			File srcFile = new File(srcFiles);

			FileInputStream fis = new FileInputStream(srcFile);

			// begin writing a new ZIP entry, positions the stream to the start of the entry data
			zos.putNextEntry(new ZipEntry(srcFile.getName()));
			
			int length;

			while ((length = fis.read(buffer)) > 0) {
				zos.write(buffer, 0, length);
			}

			zos.closeEntry();
			

			// close the InputStream
			fis.close();
			
	

		// close the ZipOutputStream
		zos.close();
		File fileToDownload = new File(zipFile);
		  inputStream = new FileInputStream(fileToDownload);
		  fileName = fileToDownload.getName();
		 

		  log.info("--->file download"+fileToDownload.getName());
		  contentLength = fileToDownload.length();
		  boolean success = (new File(zipFile)).delete();
		
		
	}
	
	
	
	
	catch (IOException e) {
		
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

	return "success";
}
public String bls5xml() throws IOException, SQLException, ClassNotFoundException {
	
	
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
    
	ResultSet rs = null;
	Statement stmt = null;
	Clob xmlClob = null;
	XBRLReportMasterDao dmd=new XBRLReportMasterDao();
	String reportid = "BLS0010";
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
  
	 XBRLReportMasterBean xrm=dmd.xbrlsumpdf("BLS0010");
	try{
	
    stmt = conn.createStatement();
    
    
    String insertQuery = "SELECT x.XBRL_RPT.getCLOBVal() FROM "+reportid+"_XBRL_OUTPUT x WHERE REPORT_DATE='"+df1.formatdate(request.getParameter("dt2"))+"'";
    

   
   
	log.info("Sql String 111"+insertQuery.toString());
    
    
    rs = stmt.executeQuery(insertQuery);
    rs.next();
    xmlClob = (Clob) rs.getClob(1);
    
   
    Reader xmlReader = xmlClob.getCharacterStream();
    char[] buffer = new char[(int)xmlClob.length()];
    StringBuffer sb = new StringBuffer();
    if(xmlClob.length()>0){
    	File xml = new File(getText("downloadpath")+request.getParameter("reptype"));
		// log.info("folders " + folders);
		boolean success11 = true;
		if (!xml.exists()) {
		success11 = xml.mkdirs();
		}
    	FileWriter fw = new FileWriter(getText("downloadpath")+request.getParameter("reptype")+"/"+request.getParameter("reptype")+"_"+xrm.getInstcode()+"_"+request.getParameter("dt2")+".xml");
    	
    	//File xml = new File("/XBRL_REPORT/"+request.getParameter("reptype"));
    	
    	/* File fileToDownload = new File("E:/Download/struts-2.3.12-src.zip");
    	 */
    	
       //  inputStream = new FileInputStream(xml);
         fileName = xml.getName();
         contentLength = xml.length();
         
         
    	if (Desktop.isDesktopSupported()) {
			Desktop.getDesktop().open(xml);
		} else {
			log.info("Awt Desktop is not supported!");
		}
    	
    	int ch;
    	
		while (( ch = xmlReader.read(buffer)) != -1){
			
    		sb.append(buffer);
    	}
		fw.append(sb.toString());
		fw.close();
    }
	}catch(SQLException sqlEx){
		sqlEx.printStackTrace();
	}
	
	
	String zipFile = getText("downloadpath")+request.getParameter("reptype")+"/"+request.getParameter("reptype")+"_"+xrm.getInstcode()+"_"+request.getParameter("dt2")+".zip";
	
	String srcFiles =  getText("downloadpath")+request.getParameter("reptype")+"/"+request.getParameter("reptype")+"_"+xrm.getInstcode()+"_"+request.getParameter("dt2")+".xml";
	
	try {
		
		// create byte buffer
		byte[] buffer = new byte[1024];

		FileOutputStream fos = new FileOutputStream(zipFile);

		ZipOutputStream zos = new ZipOutputStream(fos);
		
		
			
			File srcFile = new File(srcFiles);

			FileInputStream fis = new FileInputStream(srcFile);

			// begin writing a new ZIP entry, positions the stream to the start of the entry data
			zos.putNextEntry(new ZipEntry(srcFile.getName()));
			
			int length;

			while ((length = fis.read(buffer)) > 0) {
				zos.write(buffer, 0, length);
			}

			zos.closeEntry();
			

			// close the InputStream
			fis.close();
			
	

		// close the ZipOutputStream
		zos.close();
		File fileToDownload = new File(zipFile);
		  inputStream = new FileInputStream(fileToDownload);
		  fileName = fileToDownload.getName();
		 

		  log.info("--->file download"+fileToDownload.getName());
		  contentLength = fileToDownload.length();
		  boolean success = (new File(zipFile)).delete();
		
		
	}
	
	
	
	
	catch (IOException e) {
		
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

	return "success";
}


public String bls0106xml() throws IOException, SQLException, ClassNotFoundException {
	
	
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
    
	ResultSet rs = null;
	Statement stmt = null;
	Clob xmlClob = null;
	XBRLReportMasterDao dmd=new XBRLReportMasterDao();
	String reportid = "BLS0106";
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
  
	 XBRLReportMasterBean xrm=dmd.xbrlsumpdf(request.getParameter("reptype"));
	try{
	
    stmt = conn.createStatement();
    
    
    String insertQuery = "SELECT x.XBRL_RPT.getCLOBVal() FROM "+reportid+"_XBRL_OUTPUT x WHERE REPORT_DATE='"+df1.formatdate(request.getParameter("dt2"))+"'";
    

   
   
	log.info("Sql String 111"+insertQuery.toString());
    
    
    rs = stmt.executeQuery(insertQuery);
    rs.next();
    xmlClob = (Clob) rs.getClob(1);
    
   
    Reader xmlReader = xmlClob.getCharacterStream();
    char[] buffer = new char[(int)xmlClob.length()];
    StringBuffer sb = new StringBuffer();
    if(xmlClob.length()>0){
    	File xml = new File(getText("downloadpath")+request.getParameter("reptype"));
		// log.info("folders " + folders);
		boolean success11 = true;
		if (!xml.exists()) {
		success11 = xml.mkdirs();
		}
    	FileWriter fw = new FileWriter(getText("downloadpath")+request.getParameter("reptype")+"/"+request.getParameter("reptype")+"_"+xrm.getInstcode()+"_"+request.getParameter("dt2")+".xml");
    	
    	//File xml = new File("/XBRL_REPORT/"+request.getParameter("reptype"));
    	
    	/* File fileToDownload = new File("E:/Download/struts-2.3.12-src.zip");
    	 */
    	
       //  inputStream = new FileInputStream(xml);
         fileName = xml.getName();
         contentLength = xml.length();
         
         
    	if (Desktop.isDesktopSupported()) {
			Desktop.getDesktop().open(xml);
		} else {
			log.info("Awt Desktop is not supported!");
		}
    	
    	int ch;
    	
		while (( ch = xmlReader.read(buffer)) != -1){
			
    		sb.append(buffer);
    	}
		fw.append(sb.toString());
		fw.close();
    }
	}catch(SQLException sqlEx){
		sqlEx.printStackTrace();
	}
	
	
	String zipFile = getText("downloadpath")+request.getParameter("reptype")+"/"+request.getParameter("reptype")+"_"+xrm.getInstcode()+"_"+request.getParameter("dt2")+".zip";
	
	String srcFiles =  getText("downloadpath")+request.getParameter("reptype")+"/"+request.getParameter("reptype")+"_"+xrm.getInstcode()+"_"+request.getParameter("dt2")+".xml";
	
	try {
		
		// create byte buffer
		byte[] buffer = new byte[1024];

		FileOutputStream fos = new FileOutputStream(zipFile);

		ZipOutputStream zos = new ZipOutputStream(fos);
		
		
			
			File srcFile = new File(srcFiles);

			FileInputStream fis = new FileInputStream(srcFile);

			// begin writing a new ZIP entry, positions the stream to the start of the entry data
			zos.putNextEntry(new ZipEntry(srcFile.getName()));
			
			int length;

			while ((length = fis.read(buffer)) > 0) {
				zos.write(buffer, 0, length);
			}

			zos.closeEntry();
			

			// close the InputStream
			fis.close();
			
	

		// close the ZipOutputStream
		zos.close();
		File fileToDownload = new File(zipFile);
		  inputStream = new FileInputStream(fileToDownload);
		  fileName = fileToDownload.getName();
		 

		  log.info("--->file download"+fileToDownload.getName());
		  contentLength = fileToDownload.length();
		  boolean success = (new File(zipFile)).delete();
		
		
	}
	
	
	
	
	catch (IOException e) {
		
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

	return "success";
}
public String  supxml() throws IOException, SQLException, ClassNotFoundException {
	
	
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
    
	ResultSet rs = null;
	Statement stmt = null;
	Clob xmlClob = null;
	XBRLReportMasterDao dmd=new XBRLReportMasterDao();
	String reportid = "SUP0100";
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
  
	 XBRLReportMasterBean xrm=dmd.xbrlsumpdf(request.getParameter("reptype"));
	try{
	
    stmt = conn.createStatement();
    
    
    String insertQuery = "SELECT x.XBRL_RPT.getCLOBVal() FROM "+reportid+"_XBRL_OUTPUT x WHERE REPORT_DATE='"+df1.formatdate(request.getParameter("dt2"))+"'";
    

   
   
	log.info("Sql String 111"+insertQuery.toString());
    
    
    rs = stmt.executeQuery(insertQuery);
    rs.next();
    xmlClob = (Clob) rs.getClob(1);
    
   
    Reader xmlReader = xmlClob.getCharacterStream();
    char[] buffer = new char[(int)xmlClob.length()];
    StringBuffer sb = new StringBuffer();
    if(xmlClob.length()>0){
    	File xml = new File(getText("downloadpath")+request.getParameter("reptype"));
		// log.info("folders " + folders);
		boolean success11 = true;
		if (!xml.exists()) {
		success11 = xml.mkdirs();
		}
    	FileWriter fw = new FileWriter(getText("downloadpath")+request.getParameter("reptype")+"/"+request.getParameter("reptype")+"_"+xrm.getInstcode()+"_"+request.getParameter("dt2")+".xml");
    	
    	//File xml = new File("/XBRL_REPORT/"+request.getParameter("reptype"));
    	
    	/* File fileToDownload = new File("E:/Download/struts-2.3.12-src.zip");
    	 */
    	
       //  inputStream = new FileInputStream(xml);
         fileName = xml.getName();
         contentLength = xml.length();
         
         
    	if (Desktop.isDesktopSupported()) {
			Desktop.getDesktop().open(xml);
		} else {
			log.info("Awt Desktop is not supported!");
		}
    	
    	int ch;
    	
		while (( ch = xmlReader.read(buffer)) != -1){
			
    		sb.append(buffer);
    	}
		fw.append(sb.toString());
		fw.close();
    }
	}catch(SQLException sqlEx){
		sqlEx.printStackTrace();
	}
	
	
	String zipFile = getText("downloadpath")+request.getParameter("reptype")+"/"+request.getParameter("reptype")+"_"+xrm.getInstcode()+"_"+request.getParameter("dt2")+".zip";
	
	String srcFiles =  getText("downloadpath")+request.getParameter("reptype")+"/"+request.getParameter("reptype")+"_"+xrm.getInstcode()+"_"+request.getParameter("dt2")+".xml";
	
	try {
		
		// create byte buffer
		byte[] buffer = new byte[1024];

		FileOutputStream fos = new FileOutputStream(zipFile);

		ZipOutputStream zos = new ZipOutputStream(fos);
		
		
			
			File srcFile = new File(srcFiles);

			FileInputStream fis = new FileInputStream(srcFile);

			// begin writing a new ZIP entry, positions the stream to the start of the entry data
			zos.putNextEntry(new ZipEntry(srcFile.getName()));
			
			int length;

			while ((length = fis.read(buffer)) > 0) {
				zos.write(buffer, 0, length);
			}

			zos.closeEntry();
			

			// close the InputStream
			fis.close();
			
	

		// close the ZipOutputStream
		zos.close();
		File fileToDownload = new File(zipFile);
		  inputStream = new FileInputStream(fileToDownload);
		  fileName = fileToDownload.getName();
		 

		  log.info("--->file download"+fileToDownload.getName());
		  contentLength = fileToDownload.length();
		  boolean success = (new File(zipFile)).delete();
		
		
	}
	
	
	
	
	catch (IOException e) {
		
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

	return "success";
}
public String  sup6xml() throws IOException, SQLException, ClassNotFoundException {
	
	
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
    
	ResultSet rs = null;
	Statement stmt = null;
	Clob xmlClob = null;
	XBRLReportMasterDao dmd=new XBRLReportMasterDao();
	String reportid = "SUP0010";
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
  
	 XBRLReportMasterBean xrm=dmd.xbrlsumpdf("SUP0010");
	try{
	
    stmt = conn.createStatement();
    
    
    String insertQuery = "SELECT x.XBRL_RPT.getCLOBVal() FROM "+reportid+"_XBRL_OUTPUT x WHERE REPORT_DATE='"+df1.formatdate(request.getParameter("dt2"))+"'";
    

   
   
	log.info("Sql String 111"+insertQuery.toString());
    
    
    rs = stmt.executeQuery(insertQuery);
    rs.next();
    xmlClob = (Clob) rs.getClob(1);
    
   
    Reader xmlReader = xmlClob.getCharacterStream();
    char[] buffer = new char[(int)xmlClob.length()];
    StringBuffer sb = new StringBuffer();
    if(xmlClob.length()>0){
    	File xml = new File(getText("downloadpath")+request.getParameter("reptype"));
		// log.info("folders " + folders);
		boolean success11 = true;
		if (!xml.exists()) {
		success11 = xml.mkdirs();
		}
    	FileWriter fw = new FileWriter(getText("downloadpath")+request.getParameter("reptype")+"/"+request.getParameter("reptype")+"_"+xrm.getInstcode()+"_"+request.getParameter("dt2")+".xml");
    	
    	//File xml = new File("/XBRL_REPORT/"+request.getParameter("reptype"));
    	
    	/* File fileToDownload = new File("E:/Download/struts-2.3.12-src.zip");
    	 */
    	
       //  inputStream = new FileInputStream(xml);
         fileName = xml.getName();
         contentLength = xml.length();
         
         
    	if (Desktop.isDesktopSupported()) {
			Desktop.getDesktop().open(xml);
		} else {
			log.info("Awt Desktop is not supported!");
		}
    	
    	int ch;
    	
		while (( ch = xmlReader.read(buffer)) != -1){
			
    		sb.append(buffer);
    	}
		fw.append(sb.toString());
		fw.close();
    }
	}catch(SQLException sqlEx){
		sqlEx.printStackTrace();
	}
	log.info(xrm.getInstcode());

	
	String zipFile = getText("downloadpath")+request.getParameter("reptype")+"/"+request.getParameter("reptype")+"_"+xrm.getInstcode()+"_"+request.getParameter("dt2")+".zip";
	
	String srcFiles =  getText("downloadpath")+request.getParameter("reptype")+"/"+request.getParameter("reptype")+"_"+xrm.getInstcode()+"_"+request.getParameter("dt2")+".xml";
	
	try {
		
		// create byte buffer
		byte[] buffer = new byte[1024];

		FileOutputStream fos = new FileOutputStream(zipFile);

		ZipOutputStream zos = new ZipOutputStream(fos);
		
		
			
			File srcFile = new File(srcFiles);

			FileInputStream fis = new FileInputStream(srcFile);

			// begin writing a new ZIP entry, positions the stream to the start of the entry data
			zos.putNextEntry(new ZipEntry(srcFile.getName()));
			
			int length;

			while ((length = fis.read(buffer)) > 0) {
				zos.write(buffer, 0, length);
			}

			zos.closeEntry();
			

			// close the InputStream
			fis.close();
			
	

		// close the ZipOutputStream
		zos.close();
		File fileToDownload = new File(zipFile);
		  inputStream = new FileInputStream(fileToDownload);
		  fileName = fileToDownload.getName();
		 

		  log.info("--->file download"+fileToDownload.getName());
		  contentLength = fileToDownload.length();
		  boolean success = (new File(zipFile)).delete();
		
		
	}
	
	
	
	
	catch (IOException e) {
		
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

	return "success";
}
}
