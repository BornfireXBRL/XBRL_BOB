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
import org.apache.poi.ss.util.RegionUtil;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import bean.XBRLFIM0200Bean;
import bean.XBRLReportMasterBean;
import dao.XBRLFIM0200Dao;
import dao.XBRLReportMasterDao;
public class XBRLFIM0200ActionXL extends ActionSupport{
	static Logger log = Logger.getLogger(XBRLFIM0200ActionXL.class);
	private static final long serialVersionUID = 1L;
	private InputStream inputStream;
	private String fileName;
	private long contentLength;
	@SuppressWarnings("unchecked")
	public String FIM0200EXCEL() throws IOException, SQLException {
		log.info("====FIM0200EXCEL Gayu====");
		
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session1 = ServletActionContext.getRequest().getSession(false); 
			SimpleDateFormat dtf = new SimpleDateFormat("dd-MM-yyyy @HH.mm.ss");
		     
			Date now = new Date();
			Object sessionStorage;
			
			XBRLFIM0200Dao dmd=new XBRLFIM0200Dao();
			log.info(request.getParameter("ReporefSeq"));
				ArrayList<XBRLFIM0200Bean> arl =dmd.xbrlfim200RR(request.getParameter("reptype"),request.getParameter("dt1"),request.getParameter("dt2"),request.getParameter("ReporefSeq"),request.getParameter("instno"),request.getParameter("curr"));
			      
			XBRLReportMasterDao rm= new XBRLReportMasterDao();
		
			XBRLReportMasterBean xrm=rm.xbrlsummarypdf(request.getParameter("reptype"));
			  		try {
		                	File folders=new File(getText("downloadpath"));
		                	//log.info("folders " + folders);
		            		boolean success11 = true;
		                    if (!folders.exists()) {
		                        success11 = folders.mkdirs();
		                    }
		                	String filePath=getText("downloadpath")+"/FIM0200_Report_"+dtf.format(now)+".xls";
		                	
		                	
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


		private boolean generateExcel(String filePath,ArrayList<XBRLFIM0200Bean> arl,String reportrefseq ,XBRLReportMasterBean xrm) {
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
	        
	        Sheet sheet = workbook.createSheet("FIM0200");
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
	        /*Cell cell0 = row.createCell(0);
	        cell0.setCellStyle(headerStyle);
	        cell0.setCellValue("Serial No");
	       */
	      /*  Cell cell = row.createCell(0);
	        cell.setCellValue("Statement of Interbank Foreign Exchange Market");
	        cell.setCellStyle(TitleStyle);
	       
	        sheet.addMergedRegion(new CellRangeAddress(0,0,0,11));//(rowFrom,rowTo,colFrom,colTo);
	        //sheet.addMergedRegion(new CellRangeAddress(0,0,0,12));//(rowFrom,rowTo,colFrom,colTo);
	        
	        row = sheet.createRow((short) 1);
	        Cell cell01 = row.createCell(0);
	        cell01.setCellValue("Report Ref No :"+reportseq);
	        cell01.setCellStyle(TitleStyle);
	      
	        sheet.addMergedRegion(new CellRangeAddress(1,1,0,11));//(rowFrom,rowTo,colFrom,colTo);
	        //sheet.addMergedRegion(new CellRangeAddress(1,1,0,12));//(rowFrom,rowTo,colFrom,colTo);
*/	        
	       /* row = sheet.createRow((short) 10);
	        Cell cell02 = row.createCell(0);
	        cell02.setCellValue("FIM 0200 XBRL Report ");
	        cell02.setCellStyle(TitleStyle);
	      
	        sheet.addMergedRegion(new CellRangeAddress(10,10,0,11));//(rowFrom,rowTo,colFrom,colTo);
	        //sheet.addMergedRegion(new CellRangeAddress(2,2,0,12));//(rowFrom,rowTo,colFrom,colTo);
*/	        
	        
	       
	        
	        
	        row = sheet.createRow((short) 11);
	        Cell cell0 = row.createCell(0);
	        cell0.setCellStyle(headerStyle);
	        cell0.setCellValue("Institution Serial Number");
	       
	        Cell cell1 = row.createCell(1);
	        cell1.setCellStyle(headerStyle);
	        cell1.setCellValue("Transaction Serial Number");

	        Cell cell2 = row.createCell(2);
	        cell2.setCellStyle(headerStyle);
	        cell2.setCellValue("Name of Institution");

	        Cell cell3 = row.createCell(3);
	        cell3.setCellStyle(headerStyle);
	        cell3.setCellValue("Institution Code");
	        
	        Cell cell4 = row.createCell(4);
	        cell4.setCellStyle(headerStyle);
	        cell4.setCellValue("Amount Purchased");
	        sheet.addMergedRegion(new CellRangeAddress(11,11,4,5));//(rowFrom,rowTo,colFrom,colTo);
	        RegionUtil.setBorderTop(CellStyle.BORDER_MEDIUM, new CellRangeAddress(11,11,4,5), sheet, workbook);
	        RegionUtil.setBorderBottom(CellStyle.BORDER_MEDIUM, new CellRangeAddress(11,11,4,5), sheet, workbook);
	        RegionUtil.setBorderLeft(CellStyle.BORDER_MEDIUM, new CellRangeAddress(11,11,4,5), sheet, workbook);
	        RegionUtil.setBorderRight(CellStyle.BORDER_THIN, new CellRangeAddress(11,11,4,5), sheet, workbook);
	        
	        
	       Cell cell5 = row.createCell(6);
	        cell5.setCellStyle(headerStyle);
	        cell5.setCellValue("Amount Sold");
	        sheet.addMergedRegion(new CellRangeAddress(11,11,6,7));//(rowFrom,rowTo,colFrom,colTo);
	        RegionUtil.setBorderTop(CellStyle.BORDER_MEDIUM, new CellRangeAddress(11,11,6,7), sheet, workbook);
	        RegionUtil.setBorderBottom(CellStyle.BORDER_MEDIUM, new CellRangeAddress(11,11,6,7), sheet, workbook);
	        RegionUtil.setBorderLeft(CellStyle.BORDER_MEDIUM, new CellRangeAddress(11,11,6,7), sheet, workbook);
	        
	        
	        Cell cell6 = row.createCell(8);
	        cell6.setCellStyle(headerStyle);
	        cell6.setCellValue("Rate");
	        
	        Cell cell7 = row.createCell(9);
	        cell7.setCellStyle(headerStyle);
	        cell7.setCellValue("Value date");
	        
	        
	        row = sheet.createRow((short) 12);
	        Cell cell04 = row.createCell(4);
	        cell04.setCellStyle(headerStyle);
	        cell04.setCellValue("Currency");
	        
	        
	        
	        //row = sheet.createRow((short) 1);
	        Cell cell05 = row.createCell(5);
	        cell05.setCellStyle(headerStyle);
	        cell05.setCellValue("Amount");
	        
	        
	        
	        
	        
	        //row = sheet.createRow((short) 1);
	        Cell cell004 = row.createCell(6);
	        cell004.setCellStyle(headerStyle);
	        cell004.setCellValue("Currency");
	       
	        
	        
	        //row = sheet.createRow((short) 1);
	        Cell cell005 = row.createCell(7);
	        cell005.setCellStyle(headerStyle);
	        cell005.setCellValue("Amount");
	        
	        
	        
	        row = sheet.createRow((short)13);
	        Cell cell042 = row.createCell(4);
	        cell042.setCellStyle(headerStyle);
	        cell042.setCellValue("C");
	        
	        
	        
	       // row = sheet.createRow((short) 2);
	        Cell cell052 = row.createCell(5);
	        cell052.setCellStyle(headerStyle);
	        cell052.setCellValue("D");
	        
	        
	        
	        
	        
	       // row = sheet.createRow((short) 2);
	        Cell cell0042 = row.createCell(6);
	        cell0042.setCellStyle(headerStyle);
	        cell0042.setCellValue("E");
	       
	        
	        
	      //  row = sheet.createRow((short) 2);
	        Cell cell0052 = row.createCell(7);
	        cell0052.setCellStyle(headerStyle);
	        cell0052.setCellValue("F");
	        
	        
	       // row = sheet.createRow((short) 2);
	        Cell cell00528 = row.createCell(8);
	        cell00528.setCellStyle(headerStyle);
	        cell00528.setCellValue("G");
	        
	        
	     //   row = sheet.createRow((short) 2);
	        Cell cell00529 = row.createCell(9);
	        cell00529.setCellStyle(headerStyle);
	        cell00529.setCellValue("H");
	       
	        
	        int rowIndex = 15;
		      
	       /* log.info("ROWWWW=====>>>"+row);*/
	        DecimalFormat f = new DecimalFormat("##0.00");
	        int i=1;
			  Iterator<XBRLFIM0200Bean> itlist=arl.iterator();
           
			  while(itlist.hasNext()){
				  XBRLFIM0200Bean xb=itlist.next();
				 
				  row = sheet.createRow(rowIndex++);
				/*log.info("rrrr"+row);*/
				 
					 
		            cell0 = row.createCell(0);
		            cell0.setCellStyle(dataStyle);
		            cell0.setCellValue(xb.getInstiidd());
		            
		            cell1 = row.createCell(1);
		            cell1.setCellStyle(dataStyle);
		            cell1.setCellValue(xb.getTranidd());
		            
		            cell2 = row.createCell(2);
		            cell2.setCellStyle(dataStyle);
		            cell2.setCellValue(xb.getInstinamed());
		            
		            cell3 = row.createCell(3);
		            cell3.setCellStyle(dataStyle);
		            cell3.setCellValue(xb.getInsticoded());
		            
		            cell4 = row.createCell(4);
		            cell4.setCellStyle(dataStyle);
		            //cell4.setCellStyle(AlignRight);
		            //cell4.setCellValue(f.format(rep.getOpenBal()));
		            cell4.setCellValue(xb.getPurcrncyd());
		            
		            cell5 = row.createCell(5);
		            cell5.setCellStyle(amountTitle);
		            //cell5.setCellStyle(AlignRight);
		           // cell5.setCellValue(f.format(Float.parseFloat(rep.getTotalcredBal())));
		            
		            cell5.setCellValue(xb.getPuramtd());
		            
		            cell6 = row.createCell(6);
		            cell6.setCellStyle(dataStyle);
		            //cell6.setCellStyle(AlignRight);
		           // cell6.setCellValue(f.format(Float.parseFloat(rep.getTotaldebtBal())));
		            cell6.setCellValue(xb.getSalecrncyd());
		            
		            cell7 = row.createCell(7);
		            cell7.setCellStyle(amountTitle);
		            //cell7.setCellStyle(AlignRight);
		           // cell7.setCellValue(f.format(Float.parseFloat(rep.getAccBal())));
		            cell7.setCellValue(xb.getSaleamtd());
		            
		            
		            cell04 = row.createCell(8);
		            cell04.setCellStyle(amountTitle);
		            //cell7.setCellStyle(AlignRight);
		           // cell7.setCellValue(f.format(Float.parseFloat(rep.getAccBal())));
		            cell04.setCellValue(xb.getRated());
		            
		            
		             cell05 = row.createCell(9);
		             cell05.setCellStyle(dataStyle);
		            //cell7.setCellStyle(AlignRight);
		           // cell7.setCellValue(f.format(Float.parseFloat(rep.getAccBal())));
		             cell05.setCellValue(xb.getValuedated());
		            
		             /*  cell10 = row.createCell(10);
		            cell10.setCellStyle(dataStyle);
		            //cell7.setCellStyle(AlignRight);
		           // cell7.setCellValue(f.format(Float.parseFloat(rep.getAccBal())));
		            cell10.setCellValue(xb.getIntenddate());
		            
		             cell11 = row.createCell(11);
		            cell11.setCellStyle(amountTitle);
		            //cell7.setCellStyle(AlignRight);
		           // cell7.setCellValue(f.format(Float.parseFloat(rep.getAccBal())));
		            cell11.setCellValue(f.format(Float.parseFloat(xb.getIntrate())));*/
		            
		           
		           
		            i++;
		         
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
