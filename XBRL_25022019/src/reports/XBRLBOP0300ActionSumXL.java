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

import bean.XBRLBOP0300Bean;
import bean.XBRLReportMasterBean;
import dao.XBRLBOP0300Dao;
import dao.XBRLReportMasterDao;
public class XBRLBOP0300ActionSumXL extends ActionSupport{
	static Logger log = Logger.getLogger(XBRLBOP0300ActionSumXL.class);
	private static final long serialVersionUID = 1L;
	private InputStream inputStream;
	private String fileName;
	private long contentLength;
	@SuppressWarnings("unchecked")
	public String bop0300EXCELSums() throws IOException, SQLException {
		log.info("====bop0300EXCEL Sums Gnana====");
		
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session1 = ServletActionContext.getRequest().getSession(false); 
			SimpleDateFormat dtf = new SimpleDateFormat("dd-MM-yyyy @HH.mm.ss");
		     
			Date now = new Date();
			Object sessionStorage;
				
			log.info("action");			
			log.info("dt1"+request.getParameter("dt1"));
			log.info("dt2"+request.getParameter("dt2"));
			log.info("ReporefSeq"+request.getParameter("ReporefSeq"));
			
			 XBRLBOP0300Dao dmd=new XBRLBOP0300Dao();
			ArrayList<XBRLBOP0300Bean> arl =dmd.xbrlpymsumEP(request.getParameter("dt1"),request.getParameter("dt2"),request.getParameter("ReporefSeq"),request.getParameter("curr"));
			XBRLReportMasterDao rm= new XBRLReportMasterDao();
			
			XBRLReportMasterBean xrm=rm.xbrlsummarypdf(request.getParameter("reptype"));
			//String arl=request.getParameter("summaryarrayy");
			/*log.info("reqqqq"+arl.split(",")[0]);
			log.info("reqqqq"+arl.split(",")[1]);*/
			
		        
		        		try {
		                	File folders=new File(getText("downloadpath"));
		                	//log.info("folders " + folders);
		            		boolean success11 = true;
		                    if (!folders.exists()) {
		                        success11 = folders.mkdirs();
		                    }
		                	String filePath=getText("downloadpath")+"/BOP0300_Report_"+dtf.format(now)+".xls";
		                	
		                	
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


		private boolean generateExcel(String filePath,ArrayList<XBRLBOP0300Bean> arl,String reportrefseq ,XBRLReportMasterBean xrm) {
			boolean status=false;
			Workbook workbook = null;
	        Row row; HttpServletRequest request=ServletActionContext.getRequest();
	        log.info("adfasfadsf"+reportrefseq);
	        if (filePath.endsWith("xlsx")) {
	            workbook = new XSSFWorkbook();
	        } else if (filePath.endsWith("xls")) {
	            workbook = new HSSFWorkbook();
	        }
String reportseq="";
	        if(reportrefseq.equals("null")){
	        	reportseq="";
	        	
	        	log.info("IIFFFF");
	        }else{
	        	reportseq=reportrefseq;
	        	log.info("elsssss");
	        }
	        
	        Sheet sheet = workbook.createSheet("BOP0300");
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
	        
	        CellStyle dataStyle1 = workbook.createCellStyle();
	        dataStyle1.cloneStyleFrom(borderStyle);
	        headerFont.setBoldweight(Font.BOLDWEIGHT_BOLD);
	        dataStyle1.setFont(headerFont);
	        
	        CellStyle dataStyle2 = workbook.createCellStyle();
	        dataStyle2.cloneStyleFrom(borderStyle);
	        dataStyle2.setAlignment(CellStyle.ALIGN_CENTER);
	        dataStyle2.setFont(headerFont);
	        
	        
	        
	        CellStyle AlignRight = workbook.createCellStyle();
	        AlignRight.cloneStyleFrom(borderStyle);
	        AlignRight.setAlignment(CellStyle.ALIGN_RIGHT);
	       
	        CellStyle TitleStyle = workbook.createCellStyle();
	        TitleStyle.setFillForegroundColor(IndexedColors.PALE_BLUE.getIndex());
	        TitleStyle.setFillPattern(CellStyle.SOLID_FOREGROUND);
	        TitleStyle.setAlignment(CellStyle.ALIGN_CENTER);
	        TitleStyle.setFont(headerFont);
	        
	        CellStyle TitleStyle2 = workbook.createCellStyle();
	       // TitleStyle2.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
	       // TitleStyle2.setFillPattern(CellStyle.SOLID_FOREGROUND);
	        TitleStyle2.setAlignment(CellStyle.ALIGN_LEFT);
	        TitleStyle2.setFont(headerFont); 
	        
	        
	        
	        CellStyle TitleStyle3 = workbook.createCellStyle();
		       // TitleStyle2.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
		       // TitleStyle2.setFillPattern(CellStyle.SOLID_FOREGROUND);
		        TitleStyle3.setAlignment(CellStyle.ALIGN_CENTER);
		        TitleStyle3.setFont(headerFont); 
	        
	        
	        CellStyle TitleStyle1 = workbook.createCellStyle();
	        TitleStyle1.setFillForegroundColor(IndexedColors.CORNFLOWER_BLUE.getIndex());
	        TitleStyle1.setFillPattern(CellStyle.SOLID_FOREGROUND);
	        TitleStyle1.setAlignment(CellStyle.ALIGN_CENTER);
	        TitleStyle1.setFont(headerFont);
	        
	        
		       // TitleStyle2.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
		       // TitleStyle2.setFillPattern(CellStyle.SOLID_FOREGROUND);
		      
		      
	        
	        
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
	       
	        sheet.addMergedRegion(new CellRangeAddress(0,0,0,4));//(rowFrom,rowTo,colFrom,colTo);
	        //sheet.addMergedRegion(new CellRangeAddress(0,0,0,12));//(rowFrom,rowTo,colFrom,colTo);
	        
	       /* row = sheet.createRow((short) 1);
	        Cell cell01 = row.createCell(0);
	        cell01.setCellValue("Report Ref No :"+reportseq);
	        cell01.setCellStyle(TitleStyle);
	      
	        sheet.addMergedRegion(new CellRangeAddress(1,1,0,2));//(rowFrom,rowTo,colFrom,colTo);*/
	        //sheet.addMergedRegion(new CellRangeAddress(1,1,0,12));//(rowFrom,rowTo,colFrom,colTo);
	        
	        row = sheet.createRow((short) 1);
	        Cell cell01 = row.createCell(0);
	        cell01.setCellValue(xrm.getRprtid()  +"  XBRL Report ");
	        cell01.setCellStyle(TitleStyle);
	      
	        sheet.addMergedRegion(new CellRangeAddress(1,2,0,4));//(rowFrom,rowTo,colFrom,colTo);
	        //sheet.addMergedRegion(new CellRangeAddress(2,2,0,12));//(rowFrom,rowTo,colFrom,colTo);
	        row = sheet.createRow((short) 2);
	        Cell cell36=row.createCell(0);
	        cell36.setCellValue(" ");
	        cell36.setCellStyle(TitleStyle);
	        Cell cell031 = row.createCell(1);
	        cell031.setCellValue("");
	        cell031.setCellStyle(TitleStyle);
	        Cell cell032 = row.createCell(2);
	        cell032.setCellValue("");
	        cell032.setCellStyle(TitleStyle);
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
	        cell38.setCellValue(request.getParameter("curr"));
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
	        row = sheet.createRow((short) 9);
	        Cell cell52=row.createCell(0);
	        cell52.setCellValue(" ");
	        cell52.setCellStyle(TitleStyle2);
	        Cell cell53=row.createCell(1);
	        cell53.setCellValue(" ");
	        cell53.setCellStyle(TitleStyle2);
	        Cell cell54=row.createCell(2);
	        cell54.setCellValue(" ");
	        cell54.setCellStyle(TitleStyle2);
	       /*
	        row = sheet.createRow((short) 3);
	        Cell cell03 = row.createCell(0);
	        cell03.setCellValue("");
	        cell03.setCellStyle(TitleStyle);
	        
	      
	        Cell cell031 = row.createCell(1);
	        cell031.setCellValue("");
	        cell031.setCellStyle(TitleStyle);
	        
	        
	        
	        Cell cell032 = row.createCell(2);
	        cell032.setCellValue("");
	        cell032.setCellStyle(TitleStyle);*/
	      
	        //sheet.addMergedRegion(new CellRangeAddress(3,3,0,10));//(rowFrom,rowTo,colFrom,colTo);
	        //sheet.addMergedRegion(new CellRangeAddress(2,2,0,12));//(rowFrom,rowTo,colFrom,colTo);
	        
	        
	        row = sheet.createRow((short) 10);
	        
	       
	        
	        
	        Cell cell0 = row.createCell(0);
	        cell0.setCellStyle(headerStyle);
	        cell0.setCellValue("Instance Name");
	       
	        Cell cell1 = row.createCell(1);
	        cell1.setCellStyle(headerStyle);
	        cell1.setCellValue("Instance No");

	        Cell cell2 = row.createCell(2);
	        cell2.setCellStyle(headerStyle);
	        cell2.setCellValue("Daily Average Amount");
	        
	        Cell cell3= row.createCell(3);
	        cell3.setCellStyle(headerStyle);
	        cell3.setCellValue("Weighted Average Interest Rate (%)");
	        
	        Cell cell4 = row.createCell(4);
	        cell4.setCellStyle(headerStyle);
	        cell4.setCellValue("Interest Income/Interest Expense");
	        
	       
	        int count=0;
	        
	        int rowIndex = 11;
	       
	        log.info("ROWWWW=====>>>"+row);
	        DecimalFormat f = new DecimalFormat("#,###.00");
			  int i=0;
			  Iterator<XBRLBOP0300Bean> itlist=arl.iterator();
           
			  while(itlist.hasNext()){
				  
				  
				  
				
				  XBRLBOP0300Bean xb=itlist.next();
				 
			
				
				if(i==0){
					 row = sheet.createRow(rowIndex++);
					 cell0 = row.createCell(0);
			        cell0.setCellStyle(TitleStyle1);
			        cell0.setCellValue("Asset");
			       
			        cell1 = row.createCell(1);
			        cell1.setCellStyle(TitleStyle1);
			        cell1.setCellValue("");
			       
			        cell2 = row.createCell(2);
			        cell2.setCellStyle(TitleStyle1);
			        cell2.setCellValue("");
			      
			        cell3 = row.createCell(3);
			        cell3.setCellStyle(TitleStyle1);
			        cell3.setCellValue("");
			       
			        cell4 = row.createCell(4);
			        cell4.setCellStyle(TitleStyle1);
			        cell4.setCellValue("");
			        
			        row = sheet.createRow(rowIndex++);
			        
			        
			        
			        cell0 = row.createCell(0);
		            cell0.setCellStyle(dataStyle1);
		            cell0.setCellValue(xb.getInstname());	
		            cell1 = row.createCell(1);
		            cell1.setCellStyle(dataStyle2);
		            cell1.setCellValue(xb.getInstcode());
	        
	        
		            cell2 = row.createCell(2);
		            cell2.setCellStyle(amountTitle);
		            cell2.setCellValue(xb.getDailyavgamt());
		            
		            cell3 = row.createCell(3);
		            cell3.setCellStyle(amountTitle);
		            cell3.setCellValue(xb.getWgtavgrate());
		            
		            cell4 = row.createCell(4);
		            cell4.setCellStyle(amountTitle);
		            cell4.setCellValue(xb.getIntincexp());
			     
				}else if(i==14){
					 row = sheet.createRow(rowIndex++);
					 
					  cell = row.createCell(0);
				        cell.setCellStyle(TitleStyle1);
				       
				        cell.setCellValue("Liability");
				        
				        
				         
				       
				       
				      cell1 = row.createCell(1);
				        cell1.setCellStyle(TitleStyle1);
				        cell1.setCellValue("");
				       
				        cell2 = row.createCell(2);
				        cell2.setCellStyle(TitleStyle1);
				        cell2.setCellValue("");
				      
				        cell3 = row.createCell(3);
				        cell3.setCellStyle(TitleStyle1);
				        cell3.setCellValue("");
				       
				        cell4 = row.createCell(4);
				        cell4.setCellStyle(TitleStyle1);
				        cell4.setCellValue("");
				        
				        row = sheet.createRow(rowIndex++); 
				        
				     cell0 = row.createCell(0);
			            cell0.setCellStyle(dataStyle1);
			            cell0.setCellValue(xb.getInstname());	
			            cell1 = row.createCell(1);
			            cell1.setCellStyle(dataStyle2);
			            cell1.setCellValue(xb.getInstcode());
		        
		        
			            cell2 = row.createCell(2);
			            cell2.setCellStyle(amountTitle);
			            cell2.setCellValue(xb.getDailyavgamt());
			            
			            cell3 = row.createCell(3);
			            cell3.setCellStyle(amountTitle);
			            cell3.setCellValue(xb.getWgtavgrate());
			            
			            cell4 = row.createCell(4);
			            cell4.setCellStyle(amountTitle);
			            cell4.setCellValue(xb.getIntincexp());
				        
				        
				}
				else if( i==1 || i==2 || i==8 || i==9 || i==7 || i==15 || i==16 || i==21 || i==22 || i==23){
					 row = sheet.createRow(rowIndex++);
					
					 cell0 = row.createCell(0);
			            cell0.setCellStyle(dataStyle1);
			            cell0.setCellValue(xb.getInstname());	
			            cell1 = row.createCell(1);
			            cell1.setCellStyle(dataStyle2);
			            cell1.setCellValue(xb.getInstcode());
		        
		        
			            cell2 = row.createCell(2);
			            cell2.setCellStyle(amountTitle);
			            cell2.setCellValue(xb.getDailyavgamt());
			            
			            cell3 = row.createCell(3);
			            cell3.setCellStyle(amountTitle);
			            cell3.setCellValue(xb.getWgtavgrate());
			            
			            cell4 = row.createCell(4);
			            cell4.setCellStyle(amountTitle);
			            cell4.setCellValue(xb.getIntincexp());
				}
			
				
					  else  {
							
						  row = sheet.createRow(rowIndex++);
						
						  cell0 = row.createCell(0);
				            cell0.setCellStyle(dataStyle);
				            cell0.setCellValue("          "+xb.getInstname());
				            cell1 = row.createCell(1);
				            cell1.setCellStyle(dataStyle2);
				            cell1.setCellValue(xb.getInstcode());
			        
			        
				            cell2 = row.createCell(2);
				            cell2.setCellStyle(amountTitle);
				            cell2.setCellValue(xb.getDailyavgamt());
				            
				            cell3 = row.createCell(3);
				            cell3.setCellStyle(amountTitle);
				            cell3.setCellValue(xb.getWgtavgrate());
				            
				            cell4 = row.createCell(4);
				            cell4.setCellStyle(amountTitle);
				            cell4.setCellValue(xb.getIntincexp());
					  }
				  
	            
	           
	       
		            
		          
		            
					 
		          
		            i++;
		         
		            count++;
		          
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
