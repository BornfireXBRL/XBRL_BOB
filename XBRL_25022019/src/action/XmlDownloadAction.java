package action;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
 
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.struts2.ServletActionContext;



import com.opensymphony.xwork2.ActionSupport;
import org.apache.log4j.Logger;
public class XmlDownloadAction extends ActionSupport {
	
	static Logger log = Logger.getLogger(XmlDownloadAction.class);
	private static final long serialVersionUID = 1L;
	private InputStream inputStream;
	private String fileName;
	private long contentLength;
	
	
	public String execute() throws IOException, SQLException {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session1 = ServletActionContext.getRequest().getSession(false); 
		
		log.info("excelll");
		  /*if(session1==null || session1.getAttribute("username")==null){  
	        	//request.setAttribute("closeWin","yes");
	        	return "login";  
	        } else{
	        	if(!session1.getAttribute("category").toString().equals("Admin") && !session1.getAttribute("category").toString().equals("SA")){ 
	        		return "login";
	        	}else{
	        	
	        	
	        	
	        	
	        	*/
	        	try {
                	File folders=new File("/home/ec2-user/FileDownloads/");
                	log.info("folders " + folders);
            		boolean success11 = true;
                    if (!folders.exists()) {
                        log.info("mkdir"+folders.mkdirs());
                    	success11 = folders.mkdirs();
                    	log.info("ssss"+success11);
                    }
                	//String filePath="/home/ec2-user/FileDownloads/ComplianceFormat.xls";
                  // String filePath="/home/ec2-user/FileDownloads/"+"Resource.xls";
                    
                   String filePath="C:/Users/admin/Downloads/BOP0300_BBON_2017-06-30.xml";
                    
                    //String filePath="E:/WorkSpace1/XBRL_BOP/WebContent/images/BOP0300_BBON_2017-06-30.xml";
                    
                   log.info("bhfhghh"+filePath);
                	//if(generateExcel(filePath)){	
                		log.info("filePath " + filePath);
    	                File fileToDownload = new File(filePath);
    	                inputStream = new FileInputStream(fileToDownload);
    	        		fileName = fileToDownload.getName();
    	        		
    	        		contentLength = fileToDownload.length();
    	        		
    			//}
                	
                	
	        	} catch(Exception e){
    				e.printStackTrace();
    			}
        		
        	
        	
	        	

	  return SUCCESS;
	        	}
	        	

	
	 	 
	 	private static Object checkForNull(Object obj) {  
	 	if(obj == null) {  
	 	 return "";  
	 	}  
	 	else {  
	 	 return obj;  
	 	}  
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
