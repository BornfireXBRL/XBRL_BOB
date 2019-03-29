package action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.struts2.ServletActionContext;

import com.monitorjbl.xlsx.StreamingReader;
import com.opensymphony.xwork2.ActionSupport;

import au.com.bytecode.opencsv.CSVReader;
import basecode.DateFormat;
import oracle.sql.CLOB;
import utilities.ConnectionManager;
import utilities.NullCheck;

public class BulkUploadBls0103Action extends ActionSupport 
{
	
	static Logger log = Logger.getLogger(BulkUploadBls0103Action.class);

	private InputStream inputStream;
	private String fileName;
	private long contentLength;
	private File[] fileUpload;
	private String[] fileUploadFileName;
	private String[] fileUploadContentType;
	private String saveDirectory;
	
	public String bls0103Upload() throws SQLException, IOException 
	{
		log.info("inside xcel fn");
		PreparedStatement stmt=null;
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		PreparedStatement ps1 = null;
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		int rs = 0;
		StringBuffer sql = new StringBuffer();
		StringBuffer sql1 = new StringBuffer();
		String Errormsg = "";
		String status = "";
		CallableStatement pstmt = null;
		String usr =session.getAttribute("userName").toString();
		
		if (Integer.parseInt(request.getParameter("cnt")) > 0) 
		{
			sql1.append("TRUNCATE  TABLE BLS0103_MANUAL_TABLE");

			try {
				log.info(sql1.toString());
				ps = conn.prepareStatement(sql1.toString());
				ResultSet rs1 = ps.executeQuery();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		DateFormat df = new DateFormat();
		
		for (int i = 0; i < fileUpload.length; i++) 
		{
			
			
			String fileName = fileUploadFileName[i].substring(0, fileUploadFileName[i].lastIndexOf("."));
			
			
			ArrayList cellStoreArrayList = null;
			String cellval="";
			ArrayList<String> dataHolder = new ArrayList<String>();
			
		SimpleDateFormat Format = new SimpleDateFormat("dd-MM-yyyy"); 
			
			Date date=new Date();
			
			   String findate=df.formatdate(Format.format(date));
			   
			try (InputStream is = new FileInputStream(new File(fileUpload[i].getAbsolutePath()));
					  Workbook  workbook = StreamingReader.builder()
					          .rowCacheSize(100)
					          .bufferSize(4096)
					          .open(is)) 
			{
				
				int i1=0;
					  for (Sheet s : workbook)
					  {
					    log.info(s.getSheetName());
					    for (Row r : s) 
					    {
					    	cellval = "";
							String val;
							for (int j = 0; j < 19; j++) {
								Cell cell = r.getCell(j);
								if (cell == null || cell.getStringCellValue().length() == 0) {
									val = null;
								} else {
									val = cell.getStringCellValue();
								}
								dataHolder.add(val);
							}

							if (i1 % 49 == 0) {

								conn.close();
								conn = connMgr.getConnection();
							}

							if (i1 > 0) {

								log.info(dataHolder);
								String query = "INSERT INTO BLS0103_MANUAL_TABLE(CUST_ID,CUST_NAME,UNIQ_ID,ISIC_CODE, INVEST_TYPE,INVEST_INSTRMNT_TYPE, CLASS_OF_SHARES,QUAL_FOR_DEDUCTION,CNTRY_NAME,ACQUISITION_DATE, MATURITY_DATE,CRNCY_CODE, NOMINAL_VALUE, TRADING_BOOK_COST, BANKING_BOOK_COST, SHARE_PCNT, DATE_REG_APPR, INVST_VALUE_DISPOSED, REPORT_DATE, DEL_FLG, RCRE_USER_ID, RCRE_TIME)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
								
								
								stmt = conn.prepareStatement(query);
								
								
								stmt.setString(1,dataHolder.get(0));
								stmt.setString(2,dataHolder.get(1));
								stmt.setString(3,dataHolder.get(2));
								stmt.setString(4,dataHolder.get(3));
								stmt.setString(5,dataHolder.get(4));
								stmt.setString(6,dataHolder.get(5));
								stmt.setString(7,dataHolder.get(6));
								stmt.setString(8,dataHolder.get(7));
								stmt.setString(9,dataHolder.get(8));
								stmt.setString(10,dataHolder.get(9));
				                stmt.setString(11,dataHolder.get(10));
				                stmt.setString(12,dataHolder.get(11));
				                stmt.setString(13,dataHolder.get(12));
				                stmt.setString(14,dataHolder.get(13));
				                stmt.setString(15,dataHolder.get(14));
				                stmt.setString(16,dataHolder.get(15));
				                stmt.setString(17,dataHolder.get(16));
				                stmt.setString(18,dataHolder.get(17));
				                stmt.setString(19,dataHolder.get(18));
				                stmt.setString(20,"N");
				                stmt.setString(21,session.getAttribute("userName").toString());
				                stmt.setString(22,df.formatdate(Format.format(date)));
								
								

								rs = stmt.executeUpdate();
								dataHolder.clear();
							}
							dataHolder.clear();

							i1++;
					    }
					  }
					
					
					     
		                stmt.close();
		                conn.close();
					}
			
			catch(Exception e) {
	            e.printStackTrace();   
	            
	            log.info("inside the catch");
	        }
			

				

					if (rs > 0) 
					{
						ConnectionManager connMgr1 = new ConnectionManager();
						Connection conn1 = connMgr1.getConnection();
						pstmt = conn1.prepareCall("{call COMMON_VALIDATION_SP(?,?,?,?)}");

						pstmt.setString(1, "BLS0103_MANUAL");
						pstmt.setString(2, df.formatdate(NullCheck.isNotNull(request.getParameter("dt2"))));
						pstmt.registerOutParameter(3, java.sql.Types.VARCHAR);
						pstmt.registerOutParameter(4, java.sql.Types.CLOB);

						pstmt.executeUpdate();

						// String file = pstmt.getString(1);
						String validstat = pstmt.getString(3);
						// Clob errordetl = pstmt.getClob(4);
						CLOB notes = (CLOB) pstmt.getClob(4);

						log.info(Errormsg.trim() );

						status = "success";
						request.setAttribute("Page", "bulkuploadbls103");
						
						if (validstat.equals("Y")) {

							request.setAttribute("alert", "Uploaded successfully.");

						} else {
							log.info("inside elss");
							long len = notes.length();
							Errormsg = notes.getSubString(1, (int) len);
							request.setAttribute("alert", Errormsg.trim());

						}

					}
				}
		
		
		return "success";
		
		
	} 
	
	public String bls0103Upload1() throws SQLException, IOException 
	{
		log.info("inside csv fn");
		log.info("===uploadforcsv===");
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		PreparedStatement ps1 = null;
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		int rs = 0;
		StringBuffer sql = new StringBuffer();
		StringBuffer sql1 = new StringBuffer();
		String Errormsg = "";
		String status = "";
		CallableStatement pstmt = null;
		log.info(request.getParameter("cnt"));
		
		if (Integer.parseInt(request.getParameter("cnt")) > 0) 
		{
			sql1.append("TRUNCATE  TABLE BLS0103_MANUAL_TABLE");

			try {
				log.info(sql1.toString());
				ps = conn.prepareStatement(sql1.toString());
				ResultSet rs1 = ps.executeQuery();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		DateFormat df = new DateFormat();
		
		
		for (int i = 0; i < fileUpload.length; i++) 
		{
			
			
			String fileName = fileUploadFileName[i].substring(0, fileUploadFileName[i].lastIndexOf("."));
			
			// String filename="C:/Users/ADMIN/export.xlsx";
			
			log.info("fileUploadFileName" + fileName);

			ArrayList dataHolder = null;
			ArrayList cellStoreArrayList = null;

			
			log.info(fileUpload[i].getAbsolutePath());
			SimpleDateFormat Format = new SimpleDateFormat("dd-MM-yyyy"); 
			 
			try {
			PreparedStatement pstmt1 =conn.prepareStatement("INSERT INTO BLS0103_MANUAL_TABLE(CUST_ID,CUST_NAME,UNIQ_ID,ISIC_CODE, INVEST_TYPE,INVEST_INSTRMNT_TYPE, CLASS_OF_SHARES,QUAL_FOR_DEDUCTION,CNTRY_NAME,ACQUISITION_DATE, MATURITY_DATE,CRNCY_CODE, NOMINAL_VALUE, TRADING_BOOK_COST, BANKING_BOOK_COST, SHARE_PCNT, DATE_REG_APPR, INVST_VALUE_DISPOSED, REPORT_DATE, DEL_FLG, RCRE_USER_ID, RCRE_TIME)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			@SuppressWarnings("resource")
			CSVReader reader = new CSVReader(new FileReader(fileUpload[i].getAbsolutePath()), ',');
			String[] nextLine;
			int i1 = 0;
            while((nextLine = reader.readNext()) != null) 
            {
            	
                if(i1>0) {
               	
                	
               	 Date date=new Date();
               	
               
                pstmt1.setString(1,nextLine[0]);
                pstmt1.setString(2,nextLine[1]);
                pstmt1.setString(3,nextLine[2]);
                pstmt1.setString(4,nextLine[3]);
                pstmt1.setString(5,nextLine[4]);
                pstmt1.setString(6, nextLine[5]);
                pstmt1.setString(7,nextLine[6]);
                pstmt1.setString(8,nextLine[7]);
                pstmt1.setString(9,nextLine[8]);
                pstmt1.setString(10,nextLine[9]);
                pstmt1.setString(11,nextLine[10]);
                pstmt1.setString(12,nextLine[11]);
                pstmt1.setString(13,nextLine[12]);
                pstmt1.setString(14,nextLine[13]);
                pstmt1.setString(15,nextLine[14]);
                pstmt1.setString(16,nextLine[15]);
                pstmt1.setString(17,nextLine[16]);
                pstmt1.setString(18,nextLine[17]);
                pstmt1.setString(19,nextLine[18]);
                pstmt1.setString(20,"N");
                pstmt1.setString(21,session.getAttribute("userName").toString());
                pstmt1.setString(22,df.formatdate(Format.format(date)));
                
                log.info(i1);
                rs = pstmt1.executeUpdate();
                }
                
               
                i1++;  
                 
            }
           
            pstmt1.close();
            conn.commit();
            conn.close();
			}
			
			catch(Exception e) {
	            e.printStackTrace();   
	            
	            log.info("inside the catch");
	        }
			


					if (rs > 0) 
					{
						ConnectionManager connMgr1 = new ConnectionManager();
						Connection conn1 = connMgr1.getConnection();
						pstmt = conn1.prepareCall("{call COMMON_VALIDATION_SP(?,?,?,?)}");

						pstmt.setString(1, "BLS0103_MANUAL");
						pstmt.setString(2, df.formatdate(NullCheck.isNotNull(request.getParameter("dt2"))));
						pstmt.registerOutParameter(3, java.sql.Types.VARCHAR);
						pstmt.registerOutParameter(4, java.sql.Types.CLOB);

						pstmt.executeUpdate();

						// String file = pstmt.getString(1);
						String validstat = pstmt.getString(3);
						// Clob errordetl = pstmt.getClob(4);
						CLOB notes = (CLOB) pstmt.getClob(4);

						log.info(Errormsg.trim() );

						status = "success";
						request.setAttribute("Page", "bulkuploadbls103");
						
						if (validstat.equals("Y")) {

							request.setAttribute("alert", "Uploaded successfully.");

						} else {
							log.info("inside elss");
							long len = notes.length();
							Errormsg = notes.getSubString(1, (int) len);
							request.setAttribute("alert", Errormsg.trim());

						}

					}
				}


		return "success";
	}
	

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
	public File[] getFileUpload() {
		return fileUpload;
	}
	public void setFileUpload(File[] fileUpload) {
		this.fileUpload = fileUpload;
	}
	public String[] getFileUploadFileName() {
		return fileUploadFileName;
	}
	public void setFileUploadFileName(String[] fileUploadFileName) {
		this.fileUploadFileName = fileUploadFileName;
	}
	public String[] getFileUploadContentType() {
		return fileUploadContentType;
	}
	public void setFileUploadContentType(String[] fileUploadContentType) {
		this.fileUploadContentType = fileUploadContentType;
	}
	public String getSaveDirectory() {
		return saveDirectory;
	}
	public void setSaveDirectory(String saveDirectory) {
		this.saveDirectory = saveDirectory;
	}
	
	
}
