package action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import basecode.DateFormat;
import bean.XBRLPYM0100Bean;
import oracle.sql.CLOB;
import utilities.ConnectionManager;
import utilities.NullCheck;

import org.apache.log4j.Logger;


public class auploadAction extends ActionSupport {
	
	static Logger log = Logger.getLogger(auploadAction.class);
	private InputStream inputStream;
	private String fileName;
	private long contentLength;



	private File[] fileUpload;
	private String[] fileUploadFileName;
	private String[] fileUploadContentType;
	private String saveDirectory;

	public String doUpload() throws SQLException, IOException {
		log.info("===uploadforxls===");
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		PreparedStatement ps1 = null;
		HttpServletRequest request = ServletActionContext.getRequest();
		int rs = 0;
		StringBuffer sql = new StringBuffer();
		StringBuffer sql1 = new StringBuffer();
		String Errormsg="";
        String status="";
        CallableStatement pstmt=null;
        log.info(request.getParameter("cnt"));
        if(Integer.parseInt(request.getParameter("cnt"))>0) {
        	 sql1.append("TRUNCATE  TABLE PYM0100_MANUAL_TABLE");
        	 
        	 try {
        		 log.info(sql1.toString());
        		ps=conn.prepareStatement(sql1.toString());
        		ResultSet rs1= ps.executeQuery();
        	 }catch(SQLException e) {
        		 e.printStackTrace();
        	 }
        }
      
       
        DateFormat df=new DateFormat();
		for (int i = 0; i < fileUpload.length; i++) {
			String fileName =fileUploadFileName[i].substring(0,fileUploadFileName[i]
					.lastIndexOf("."));
			// String filename="C:/Users/ADMIN/export.xlsx";
			log.info("fileUploadFileName"+fileName);
			
			ArrayList dataHolder = null;
			ArrayList cellStoreArrayList = null;

			
			XBRLPYM0100Bean jb=new XBRLPYM0100Bean();
				dataHolder = readExcelFile(fileUpload[i].getAbsolutePath());
				log.info("xls" + dataHolder);
				log.info("xls" + dataHolder.size());
				for (int k = 1; k < dataHolder.size(); k++) {
					
					cellStoreArrayList = (ArrayList) dataHolder.get(k);
					String MODES = ( cellStoreArrayList.get(0)).toString() != null
							&& ( cellStoreArrayList.get(0)).toString().trim().length() > 0
									? ( cellStoreArrayList.get(0)).toString() : null;
					
					String CHQ_NUMBER = ( cellStoreArrayList.get(1)).toString() != null
							&& ( cellStoreArrayList.get(1)).toString().trim().length() > 0
									? ( cellStoreArrayList.get(1)).toString() : null;
					String ACCT_NUMBER = ( cellStoreArrayList.get(2)).toString() != null
							&& ( cellStoreArrayList.get(2)).toString().trim().length() > 0
									? ( cellStoreArrayList.get(2)).toString() : null;
					String ACCT_NAME = ( cellStoreArrayList.get(3)).toString() != null
							&& ( cellStoreArrayList.get(3)).toString().trim().length() > 0
									? ( cellStoreArrayList.get(3)).toString() : null;

					String TRAN_DATE = ( cellStoreArrayList.get(4)).toString() != null
							&& ( cellStoreArrayList.get(4)).toString().trim().length() > 0
									? ( cellStoreArrayList.get(4)).toString() : null;
					String VALUE_DATE = ( cellStoreArrayList.get(5)).toString() != null
							&& ( cellStoreArrayList.get(5)).toString().trim().length() > 0
									? ( cellStoreArrayList.get(5)).toString() : null;
					String CHQ_AMOUNT = ( cellStoreArrayList.get(6)).toString() != null
							&& ( cellStoreArrayList.get(6)).toString().trim().length() > 0
									? ( cellStoreArrayList.get(6)).toString() : null;
					String CRNCY = ( cellStoreArrayList.get(7)).toString() != null
							&& ( cellStoreArrayList.get(7)).toString().trim().length() > 0
									? ( cellStoreArrayList.get(7)).toString() : null;
					
					
									sql.setLength(0);
								//	String trandate=df.formatdate(TRAN_DATE);
									//String valuedate=df.formatdate(VALUE_DATE);
								  
									sql.append("insert into PYM0100_MANUAL_TABLE(MODES,CHQ_NUMBER,ACCT_NUMBER,ACCT_NAME,TRAN_DATE,VALUE_DATE,CHQ_AMOUNT,CRNCY)");
									sql.append("values('" + (NullCheck.isNotNull(MODES)) + "','" + (NullCheck.isNotNull(CHQ_NUMBER))
											+ "','" + (NullCheck.isNotNull(ACCT_NUMBER)) + "','" + (NullCheck.isNotNull(ACCT_NAME)) + "','"
											+ (NullCheck.isNotNull(TRAN_DATE)) + "','" + (NullCheck.isNotNull(VALUE_DATE.replace("null", ""))) + "','"
											+ (NullCheck.isNotNull(CHQ_AMOUNT)) + "','" + (NullCheck.isNotNull(CRNCY)) + "')");
									
									log.info("Bulk upload"+sql.toString());
									
							
									   
					try {
						ps = conn.prepareStatement(sql.toString());
			           rs = ps.executeUpdate();
			           
			          
						 if(rs>0){
							 
							  pstmt =  conn.prepareCall("{call COMMON_VALIDATION_SP(?,?,?,?)}");
							
							 pstmt.setString(1, "PYM0100_MANUAL");
							 pstmt.setString(2, "31-MAR-2014");
							 pstmt.registerOutParameter(3, java.sql.Types.VARCHAR);
							 pstmt.registerOutParameter(4, java.sql.Types.CLOB);
							
							 
							
							 pstmt.executeUpdate();
							
							// String file = pstmt.getString(1);
							 String validstat = pstmt.getString(3);
							// Clob errordetl = pstmt.getClob(4);
							 CLOB notes = (CLOB) pstmt.getClob(4);
							 
							  
							  
							   log.info(Errormsg.trim()+"ijhi");
							   
							 
								status="success";
								request.setAttribute("type","bulkupload");
								if (validstat.equals("Y")) {
                                  
									request.setAttribute("alert", "Uploaded successfully.");
									
								} else {
									  log.info("inside elss");
									  long len = notes.length();
									   Errormsg = notes.getSubString(1, (int) len);
									request.setAttribute("alert", Errormsg.trim());

									
									
								}
								
							}
					} catch (SQLException e) {
						
						e.printStackTrace();
					} finally{
		                  try {
		                        
		                        if(ps!=null) ps.close(); //close PreparedStatement FOR BULK INSERT
		                        if(pstmt!=null) pstmt.close();
		                        
		                  } catch (SQLException e) {
		                        e.printStackTrace();
		                  }
					
				}

				}

		}
		
		return "success";
	}

	public ArrayList readExcelFile(String fileName) {
		
		ArrayList cellArrayLisstHolder = new ArrayList();
		try {
			InputStream myInput = new FileInputStream(fileName);
			// POIFSFileSystem myFileSystem = new POIFSFileSystem(myInput);
			
			Workbook myWorkBook = WorkbookFactory.create(myInput);
	        Sheet mySheet = myWorkBook.getSheetAt(0);
			Iterator rowIter = mySheet.rowIterator();
			
			while (rowIter.hasNext()) {
				Row myRow = (Row) rowIter.next();
				Iterator cellIter = myRow.cellIterator();
				ArrayList cellStoreArrayList = new ArrayList();
				int i=0;
				while (cellIter.hasNext()) {
					Cell myCell = (Cell) cellIter.next();
					log.info(myCell+""+i++);
					cellStoreArrayList.add(getCellValueAsString(myCell));
				}
				cellArrayLisstHolder.add(cellStoreArrayList);
			}

		} catch (Exception e) {
			// logger.error("This is Error message", e);
			e.printStackTrace();
		}
		return cellArrayLisstHolder;
	}
	public static String getCellValueAsString(Cell cell) {
        String strCellValue = null;
        if (cell != null) {
            switch (cell.getCellType()) {
            case Cell.CELL_TYPE_STRING:
                strCellValue = cell.toString();
                break;
            case Cell.CELL_TYPE_NUMERIC:
                if (DateUtil.isCellDateFormatted(cell)) {
                    SimpleDateFormat dateFormat = new SimpleDateFormat(
                            "dd/MM/yyyy");
                    strCellValue = dateFormat.format(cell.getDateCellValue());
                } else {
                	if(cell.getColumnIndex()==7 || cell.getColumnIndex()==18 || cell.getColumnIndex()==28){
                		
                		strCellValue = cell.toString();
                	}else{
                    Double value = cell.getNumericCellValue();
                    Long longValue = value.longValue();
                    strCellValue = new String(longValue.toString());
                	}
                }
                break;
            case Cell.CELL_TYPE_BOOLEAN:
                strCellValue = new String(new Boolean(
                        cell.getBooleanCellValue()).toString());
                break;
            case Cell.CELL_TYPE_BLANK:
            	
                strCellValue = "null";
                break;
            }
        }
        return strCellValue;
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

	public long getContentLength() {
		return contentLength;
	}

	public String getFileName() {
		return fileName;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

}

