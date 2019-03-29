package reports;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import bean.XBRLReportMasterBean;
import bean.XBRLSUP0900Bean;
import dao.XBRLReportMasterDao;
import dao.XBRLSUP0900Dao;
public class XBRLSUP0900ActionXL extends ActionSupport{
	static Logger log = Logger.getLogger(XBRLSUP0900ActionXL.class);
	private static final long serialVersionUID = 1L;
	private InputStream inputStream;
	private String fileName;
	private long contentLength;
	@SuppressWarnings("unchecked")
	public String SUP0900EXCEL() throws IOException, SQLException {
		log.info("====Pondy Gnanaaaaa====");
		
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session1 = ServletActionContext.getRequest().getSession(false); 
			SimpleDateFormat dtf = new SimpleDateFormat("dd-MM-yyyy @HH.mm.ss");
		     
			Date now = new Date();
			Object sessionStorage;
			
			XBRLSUP0900Dao dmd=new XBRLSUP0900Dao();
			
			ArrayList<XBRLSUP0900Bean> arl =dmd.xbrlsup0900(request.getParameter("reptype"),request.getParameter("dt1"),request.getParameter("dt2"),request.getParameter("ReporefSeq"),request.getParameter("instno"),request.getParameter("curr"));
			      
			XBRLReportMasterDao rm= new XBRLReportMasterDao();
		
			XBRLReportMasterBean xrm=rm.xbrlsummarypdf("SUP0900");
			  		try {
		                	File folders=new File(getText("downloadpath"));
		                	//log.info("folders " + folders);
		            		boolean success11 = true;
		                    if (!folders.exists()) {
		                        success11 = folders.mkdirs();
		                    }
		                	String filePath=getText("downloadpath")+"/SUP0900_Report_"+dtf.format(now)+".xls";
		                	
		                	
		    			if(generateExcel(filePath,arl,request.getParameter("ReporefSeq"),xrm)){			
		    	                File fileToDownload = new File(filePath);
		    	                inputStream = new FileInputStream(fileToDownload);
		    	        		fileName = fileToDownload.getName();
		    	        		contentLength = fileToDownload.length();
		    	        		
		    			}
		    			
		    				 
		    			} catch(Exception e){
		    				e.printStackTrace();
		    			}
		        		
		        	
		        	
		        	
		
			  return "success";
		}


		private boolean generateExcel(String filePath,ArrayList<XBRLSUP0900Bean> arl,String reportrefseq ,XBRLReportMasterBean xrm) {
			boolean status=false;
			HttpServletRequest request= ServletActionContext.getRequest();
			Workbook workbook = null;
	        Row row;
	     
	       /* log.info("adfasfadsf"+reportrefseq);*/
	        if (filePath.endsWith("xlsx")) {
	            workbook = new XSSFWorkbook();
	        } else if (filePath.endsWith("xls")) {
	            workbook = new HSSFWorkbook();
	        }
String reportseq="";
	        if(reportrefseq.equals("null")){
	        	reportseq="";
	        	
	        	/*log.info("IIFFFF");*/
	        }else{
	        	reportseq=reportrefseq;
	        	/*log.info("elsssss");*/
	        }
	        
	        Sheet sheet = workbook.createSheet("SUP0900");
	      sheet.setDefaultColumnWidth(23);         
	        
	        //sheet.autoSizeColumn(1000000);
	        //sheet.setColumnWidth(0, 27);
	       

	        // Create border style and clone it for header and data part
	        CellStyle borderStyle = workbook.createCellStyle();
	        borderStyle.setBorderBottom(CellStyle.BORDER_THIN);
	        borderStyle.setBorderTop(CellStyle.BORDER_THIN);
	        borderStyle.setBorderRight(CellStyle.BORDER_THIN);
	        borderStyle.setBorderLeft(CellStyle.BORDER_THIN);

	        // First clone the border style and then apply font styling
	        CellStyle headerStyle = workbook.createCellStyle();
	        headerStyle.cloneStyleFrom(borderStyle);
	        Font headerFont = workbook.createFont();
	        headerFont.setBoldweight(Font.BOLDWEIGHT_BOLD);
	        headerStyle.setFillForegroundColor(IndexedColors.PALE_BLUE.getIndex());
	        headerStyle.setFillPattern(CellStyle.SOLID_FOREGROUND);
	        //headerStyle.setAlignment(CellStyle.ALIGN_CENTER);
	        headerStyle.setFont(headerFont);

	        CellStyle dataStyle = workbook.createCellStyle();
	        dataStyle.cloneStyleFrom(borderStyle);
	        
	        CellStyle AlignRight = workbook.createCellStyle();
	        AlignRight.cloneStyleFrom(borderStyle);
	        AlignRight.setAlignment(CellStyle.ALIGN_RIGHT);
	       
	        CellStyle TitleStyle = workbook.createCellStyle();
	        TitleStyle.setFillForegroundColor(IndexedColors.PALE_BLUE.getIndex());
	        TitleStyle.setFillPattern(CellStyle.SOLID_FOREGROUND);
	        TitleStyle.setAlignment(CellStyle.ALIGN_CENTER);
	        TitleStyle.setFont(headerFont);
	        
	        
	        CellStyle TitleStyle1 = workbook.createCellStyle();
	        TitleStyle1.setFillForegroundColor(IndexedColors.CORNFLOWER_BLUE.getIndex());
	        TitleStyle1.setFillPattern(CellStyle.SOLID_FOREGROUND);
	        TitleStyle1.setAlignment(CellStyle.ALIGN_CENTER);
	        TitleStyle1.setFont(headerFont);
	        CellStyle TitleStyle2 = workbook.createCellStyle();
	      
	        TitleStyle2.setAlignment(CellStyle.ALIGN_LEFT);
	        TitleStyle2.setFont(headerFont); 
	        
	        
	        CellStyle amountTitle = workbook.createCellStyle();
	        amountTitle.setFont(headerFont);
	        amountTitle.setAlignment(CellStyle.ALIGN_RIGHT);
	        amountTitle.setBorderBottom(CellStyle.BORDER_THIN);
	        amountTitle.setBorderTop(CellStyle.BORDER_THIN);
	        amountTitle.setBorderRight(CellStyle.BORDER_THIN);
	        amountTitle.setBorderLeft(CellStyle.BORDER_THIN);
	        
	        
	        
	        
	        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
	        Date crdate = new Date();
	        String curdate=dateFormat.format(crdate);
	        
	        row = sheet.createRow((short) 0);
	        Cell cell = row.createCell(0);
	        cell.setCellValue(xrm.getRptname());
	        cell.setCellStyle(TitleStyle);
	       
	        sheet.addMergedRegion(new CellRangeAddress(0,0,0,8));//(rowFrom,rowTo,colFrom,colTo);
	        //sheet.addMergedRegion(new CellRangeAddress(0,0,0,12));//(rowFrom,rowTo,colFrom,colTo);
	        
	        row = sheet.createRow((short) 1);
	        Cell cell01 = row.createCell(0);
	        cell01.setCellValue(xrm.getRprtid()+" XBRL Report");
	        cell01.setCellStyle(TitleStyle);
	      
	        sheet.addMergedRegion(new CellRangeAddress(1,1,0,8));//(rowFrom,rowTo,colFrom,colTo);
	        //sheet.addMergedRegion(new CellRangeAddress(1,1,0,12));//(rowFrom,rowTo,colFrom,colTo);
	        
	       
	        
	       
	      
	       
	        //sheet.addMergedRegion(new CellRangeAddress(2,2,0,12));//(rowFrom,rowTo,colFrom,colTo);
	        row = sheet.createRow((short) 2);
	        Cell cell36=row.createCell(0);
	        cell36.setCellValue(" ");
	        cell36.setCellStyle(TitleStyle);
	        sheet.addMergedRegion(new CellRangeAddress(2,2,0,8));
	        row = sheet.createRow((short) 3);
	        Cell cell33=row.createCell(0);
	        cell33.setCellValue("Taxonomy Version");
	        cell33.setCellStyle(TitleStyle2);
	        Cell cell34=row.createCell(1);
	        
	        cell34.setCellValue(xrm.getTaxver());
	        cell34.setCellStyle(TitleStyle2);
	        Cell cell35=row.createCell(2);
	        cell35.setCellValue("");
	        cell35.setCellStyle(TitleStyle2);
	        
	        row = sheet.createRow((short) 4);
	        Cell cell37=row.createCell(0);
	        cell37.setCellValue("Reporting Currency");
	        cell37.setCellStyle(TitleStyle2);
	        Cell cell38=row.createCell(1);
	        cell38.setCellValue("MUR");
	        cell38.setCellStyle(TitleStyle2);
	        Cell cell39=row.createCell(2);
	        cell39.setCellValue("");
	        cell39.setCellStyle(TitleStyle2);
	        
	        row = sheet.createRow((short) 5);
	        Cell cell40=row.createCell(0);
	        cell40.setCellValue("Reporting Frequency");
	        cell40.setCellStyle(TitleStyle2);
	        Cell cell41=row.createCell(1);
	        cell41.setCellValue(xrm.getRptfreq());
	        cell41.setCellStyle(TitleStyle2);
	        Cell cell42=row.createCell(2);
	        cell42.setCellValue("");
	        cell42.setCellStyle(TitleStyle2);
	        
	        row = sheet.createRow((short) 6);
	        Cell cell43=row.createCell(0);
	        cell43.setCellValue("Reporting Start Date");
	        cell43.setCellStyle(TitleStyle2);
	        Cell cell44=row.createCell(1);
	       
	        cell44.setCellValue(request.getParameter("dt1"));
	        cell44.setCellStyle(TitleStyle2);
	        Cell cell45=row.createCell(2);
	        cell45.setCellValue("");
	        cell45.setCellStyle(TitleStyle2);
	        
	        
	        row = sheet.createRow((short) 7);
	        Cell cell46=row.createCell(0);
	        cell46.setCellValue("Reporting End Date");
	        cell46.setCellStyle(TitleStyle2);
	        Cell cell47=row.createCell(1);
	        cell47.setCellValue(request.getParameter("dt2"));
	        cell47.setCellStyle(TitleStyle2);
	        Cell cell48=row.createCell(2);
	        cell48.setCellValue("");
	        cell48.setCellStyle(TitleStyle2);
	        
	        row = sheet.createRow((short) 8);
	        Cell cell49=row.createCell(0);
	        cell49.setCellValue("Report Reference No");
	        cell49.setCellStyle(TitleStyle2);
	        Cell cell50=row.createCell(1);
	        cell50.setCellValue(request.getParameter("ReporefSeq"));
	        cell50.setCellStyle(TitleStyle2);
	        Cell cell51=row.createCell(2);
	        cell51.setCellValue("");
	        cell51.setCellStyle(TitleStyle2); 
	       /* row = sheet.createRow((short) 9);
	        Cell cell52=row.createCell(0);
	        cell52.setCellValue(" ");
	        cell52.setCellStyle(TitleStyle2);
	        Cell cell53=row.createCell(1);
	        cell53.setCellValue(" ");
	        cell53.setCellStyle(TitleStyle2);
	        Cell cell54=row.createCell(2);
	        cell54.setCellValue(" ");
	        cell54.setCellStyle(TitleStyle2);*/
	        
	        row = sheet.createRow((short) 10);
	        Cell cell0 = row.createCell(0);
	        cell0.setCellStyle(headerStyle);
	        cell0.setCellValue("Type Of Event");
	       
	        Cell cell1 = row.createCell(1);
	        cell1.setCellStyle(headerStyle);
	        cell1.setCellValue("Instance Code");

	        Cell cell2 = row.createCell(2);
	        cell2.setCellStyle(headerStyle);
	        cell2.setCellValue("Corporate finance Loss");
	        
	        Cell cell3= row.createCell(3);
	        cell3.setCellStyle(headerStyle);
	        cell3.setCellValue("Corporate finance Insurance");
	        
	        Cell cell4 = row.createCell(4);
	        cell4.setCellStyle(headerStyle);
	        cell4.setCellValue("Trading and sales Loss");
	        
	        Cell cell5 = row.createCell(5);
	        cell5.setCellStyle(headerStyle);
	        cell5.setCellValue("Trading and sales Insurance");
	       

	        Cell cell6 = row.createCell(6);
	        cell6.setCellStyle(headerStyle);
	        cell6.setCellValue("Retail banking Loss");
	        

	        Cell cell7 = row.createCell(7);
	        cell7.setCellStyle(headerStyle);
	        cell7.setCellValue("Retail banking Insurance");
	        

	        Cell cell8 = row.createCell(8);
	        cell8.setCellStyle(headerStyle);
	        cell8.setCellValue("Commercial banking	Loss");
	        

	        Cell cell9 = row.createCell(9);
	        cell9.setCellStyle(headerStyle);
	        cell9.setCellValue("Commercial banking Insurance");
	        

	        Cell cell10 = row.createCell(10);
	        cell10.setCellStyle(headerStyle);
	        cell10.setCellValue("Payment and Settlement	 Loss");
	        

	        Cell cell11 = row.createCell(11);
	        cell11.setCellStyle(headerStyle);
	        cell11.setCellValue("Payment and Settlement Insurance");
	        

	        Cell cell12 = row.createCell(12);
	        cell12.setCellStyle(headerStyle);
	        cell12.setCellValue("Agency services Loss");
	        

	        Cell cell13 = row.createCell(13);
	        cell13.setCellStyle(headerStyle);
	        cell13.setCellValue("Agency services Insurance");
	        

	        Cell cell14 = row.createCell(14);
	        cell14.setCellStyle(headerStyle);
	        cell14.setCellValue("Asset Management Loss");
	        

	        Cell cell15 = row.createCell(15);
	        cell15.setCellStyle(headerStyle);
	        cell15.setCellValue("Asset Management Insurance");
	        
	        Cell cell16 = row.createCell(16);
	        cell16.setCellStyle(headerStyle);
	        cell16.setCellValue("Retail brokerage Loss");
	        
	        Cell cell17 = row.createCell(17);
	        cell17.setCellStyle(headerStyle);
	        cell17.setCellValue("Retail brokerage Insurance");
	        
	        Cell cell18 = row.createCell(18);
	        cell18.setCellStyle(headerStyle);
	        cell18.setCellValue("Report Date");
	        
	       
	        
	        
	        

	       
	        int rowIndex = 12;
		      
	       /* log.info("ROWWWW=====>>>"+row);*/
	        DecimalFormat f = new DecimalFormat("##0.00");
			 
			  Iterator<XBRLSUP0900Bean> itlist=arl.iterator();
           
			  while(itlist.hasNext()){
				  XBRLSUP0900Bean xb=itlist.next();
				 
				  row = sheet.createRow(rowIndex++);
				/*log.info("rrrr"+row);*/
				 
		            cell0 = row.createCell(0);
		            cell0.setCellStyle(dataStyle);
		            cell0.setCellValue(xb.getTyeve());
		            
		            cell1 = row.createCell(1);
		            cell1.setCellStyle(dataStyle);
		            cell1.setCellValue(xb.getInco());
	        
	        
		            cell2 = row.createCell(2);
		            cell2.setCellStyle(amountTitle);
		            cell2.setCellValue(xb.getCfl());
		            
		            cell3 = row.createCell(3);
		            cell3.setCellStyle(amountTitle);
		            cell3.setCellValue(xb.getCfi());
		            
		            cell4 = row.createCell(4);
		            cell4.setCellStyle(amountTitle);
		            cell4.setCellValue(xb.getCfl1());
		            
		            cell5= row.createCell(5);
		            cell5.setCellStyle(amountTitle);
		            cell5.setCellValue(xb.getCfi1());
		          
		            
		            cell6 = row.createCell(6);
		            cell6.setCellStyle(amountTitle);
		            cell6.setCellValue(xb.getCfl2());
		            
		            
		            cell7 = row.createCell(7);
		            cell7.setCellStyle(amountTitle);
		            cell7.setCellValue(xb.getCfi2());
		            
		            cell8 = row.createCell(8);
		            cell8.setCellStyle(amountTitle);
		            cell8.setCellValue(xb.getCfl3());
		            
		            cell9 = row.createCell(9);
		            cell9.setCellStyle(amountTitle);
		            cell9.setCellValue(xb.getCfi3());
		            
		            cell10 = row.createCell(10);
		            cell10.setCellStyle(amountTitle);
		            cell10.setCellValue(xb.getCfl4());
		            
		            cell11 = row.createCell(11);
		            cell11.setCellStyle(amountTitle);
		            cell11.setCellValue(xb.getCfi4());
		        
		        
		            cell12 = row.createCell(12);
		            cell12.setCellStyle(amountTitle);
		            cell12.setCellValue(xb.getCfl5());
		            
		            cell13 = row.createCell(13);
		            cell13.setCellStyle(amountTitle);
		            cell13.setCellValue(xb.getCfi5());
		            
		           
		            
		            cell14 = row.createCell(14);
		            cell14.setCellStyle(amountTitle);
		            cell14.setCellValue(xb.getCfl6());
		            
		            cell15 = row.createCell(15);
		            cell15.setCellStyle(amountTitle);
		            cell15.setCellValue(xb.getCfi6());
		            
		            
		            cell16 = row.createCell(16);
		            cell16.setCellStyle(amountTitle);
		            cell16.setCellValue(xb.getCfl7());
		            
		            cell17 = row.createCell(17);
		            cell17.setCellStyle(amountTitle);
		            cell17.setCellValue(xb.getCfi7());
		            
		            cell18 = row.createCell(18);
		            cell18.setCellStyle(dataStyle);
		            cell18.setCellValue(xb.getRedat());
		        
		        
		            

		           
		           
		            
		           
			  }
		        
			 	   
			  
			 	  if(writeExcel(workbook,filePath))
			 		  status=true;
			 		else
			 			status=false;

			 	return status;
			 	}   
			 	 
			 	private boolean writeExcel(Workbook workbook,String filePath) {  
			 	String l_str_file_out = filePath; //Give the location suitable to your requirement  
			 	FileOutputStream fileOut;  
			 	boolean status=false;
			 	try {  
			 	 fileOut = new FileOutputStream(l_str_file_out);  
			 	 workbook.write(fileOut);  
			 	 fileOut.close();
			 	 status=true;
			 	} catch (FileNotFoundException e) {  
			 	 e.printStackTrace();  
			 	 
			 	 status=false;
			 	} catch (IOException e) {  
			 	 e.printStackTrace();  

			 	 status=false;
			 	}
			 	return status;
			 	}  
			 	 
			 	private static Object checkForNull(Object obj) {  
			 	if(obj == null) {  
			 	 return "";  
			 	}  
			 	else {  
			 	 return obj;  
			 	}  
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
}
