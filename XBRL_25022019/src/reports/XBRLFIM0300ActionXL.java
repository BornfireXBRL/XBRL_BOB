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

import bean.XBRLFIM0300Bean;
import dao.XBRLFIM0300Dao;
public class XBRLFIM0300ActionXL {
	static Logger log = Logger.getLogger(XBRLFIM0300ActionXL.class);
	private static final long serialVersionUID = 1L;
	private InputStream inputStream;
	private String fileName;
	private long contentLength;
	@SuppressWarnings("unchecked")
	public String fim0300EXCEL() throws IOException, SQLException {
		log.info("====fim0300EXCEL====");
		
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session1 = ServletActionContext.getRequest().getSession(false); 
			SimpleDateFormat dtf = new SimpleDateFormat("dd-MM-yyyy @HH.mm.ss");
		     
			Date now = new Date();
			Object sessionStorage;
				/*DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
			Date date = new Date();
			log.info(date);
			String fdate = dateFormat.format(date);*/
			//JSON.stringify(sessionStorage);
		       // int data_arr = ((Object) sessionStorage).getItem("summaryarray");
			
			/*  Object Retaildata_arr = ((Object) sessionStorage).getItem("summaryarrayy");
			((String) Retaildata_arr).split(",")[2];
			*/
		/*String[] summaryarrayy=request.getParameterValues("summaryarrayy[]");
			

		        log.info("reqqq");
		        log.info("summaray");
		        log.info("refr"+summaryarrayy[0]);
		        log.info(summaryarrayy[1]);
		        log.info(summaryarrayy[2]);*/
			log.info("action");
			
			log.info("dt1"+request.getParameter("dt1"));
			log.info("dt2"+request.getParameter("dt2"));
			log.info("ReporefSeq"+request.getParameter("ReporefSeq"));
			 XBRLFIM0300Dao dmd=new XBRLFIM0300Dao();
			ArrayList<XBRLFIM0300Bean> arl =dmd.xbrlFIM0300ajaxdetails(request.getParameter("dt1"),request.getParameter("dt2"),request.getParameter("ReporefSeq"),"","");
			//String arl=request.getParameter("summaryarrayy");
			/*log.info("reqqqq"+arl.split(",")[0]);
			log.info("reqqqq"+arl.split(",")[1]);*/
			
		        
		        		try {
		                	File folders=new File("/home/ec2-user/FileDownloads");
		                	//log.info("folders " + folders);
		            		boolean success11 = true;
		                    if (!folders.exists()) {
		                        success11 = folders.mkdirs();
		                    }
		                	String filePath="/home/ec2-user/FileDownloads/FIM0300_Report_"+dtf.format(now)+".xls";
		                	
		                	
		    			if(generateExcel(filePath,arl,request.getParameter("ReporefSeq"))){			
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


		private boolean generateExcel(String filePath,ArrayList<XBRLFIM0300Bean> arl,String reportrefseq ) {
			boolean status=false;
			Workbook workbook = null;
	        Row row;
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
	        
	        Sheet sheet = workbook.createSheet("FIM0300");
	      sheet.setDefaultColumnWidth(20);         
	        
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
	        headerStyle.setFillForegroundColor(IndexedColors.BLUE_GREY.getIndex());
	        headerStyle.setFillPattern(CellStyle.SOLID_FOREGROUND);
	        //headerStyle.setAlignment(CellStyle.ALIGN_CENTER);
	        headerStyle.setFont(headerFont);

	        CellStyle dataStyle = workbook.createCellStyle();
	        dataStyle.cloneStyleFrom(borderStyle);
	        
	        CellStyle AlignRight = workbook.createCellStyle();
	        AlignRight.cloneStyleFrom(borderStyle);
	        AlignRight.setAlignment(CellStyle.ALIGN_RIGHT);
	       
	        CellStyle TitleStyle = workbook.createCellStyle();
	        TitleStyle.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
	        TitleStyle.setFillPattern(CellStyle.SOLID_FOREGROUND);
	        TitleStyle.setAlignment(CellStyle.ALIGN_CENTER);
	        TitleStyle.setFont(headerFont);
	        
	        
	        CellStyle TitleStyle1 = workbook.createCellStyle();
	        TitleStyle1.setFillForegroundColor(IndexedColors.CORNFLOWER_BLUE.getIndex());
	        TitleStyle1.setFillPattern(CellStyle.SOLID_FOREGROUND);
	        TitleStyle1.setAlignment(CellStyle.ALIGN_CENTER);
	        TitleStyle1.setFont(headerFont);
	        
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
	        cell.setCellValue("Statement of Interbank Foreign Exchange Market");
	        cell.setCellStyle(TitleStyle);
	       
	        sheet.addMergedRegion(new CellRangeAddress(0,0,0,7));//(rowFrom,rowTo,colFrom,colTo);
	        //sheet.addMergedRegion(new CellRangeAddress(0,0,0,12));//(rowFrom,rowTo,colFrom,colTo);
	        
	        row = sheet.createRow((short) 1);
	        Cell cell01 = row.createCell(0);
	        cell01.setCellValue("Report Ref No :"+reportseq);
	        cell01.setCellStyle(TitleStyle);
	      
	        sheet.addMergedRegion(new CellRangeAddress(1,1,0,7));//(rowFrom,rowTo,colFrom,colTo);
	        //sheet.addMergedRegion(new CellRangeAddress(1,1,0,12));//(rowFrom,rowTo,colFrom,colTo);
	        
	        row = sheet.createRow((short) 2);
	        Cell cell02 = row.createCell(0);
	        cell02.setCellValue("FIM 0300 XBRL Report ");
	        cell02.setCellStyle(TitleStyle);
	      
	        sheet.addMergedRegion(new CellRangeAddress(2,2,0,7));//(rowFrom,rowTo,colFrom,colTo);
	        //sheet.addMergedRegion(new CellRangeAddress(2,2,0,12));//(rowFrom,rowTo,colFrom,colTo);
	        
	        
	        row = sheet.createRow((short) 3);
	        Cell cell03 = row.createCell(0);
	        cell03.setCellValue("");
	        cell03.setCellStyle(TitleStyle);
	      
	        sheet.addMergedRegion(new CellRangeAddress(3,3,0,7));//(rowFrom,rowTo,colFrom,colTo);
	        //sheet.addMergedRegion(new CellRangeAddress(2,2,0,12));//(rowFrom,rowTo,colFrom,colTo);
	        
	        
	        row = sheet.createRow((short) 4);
	        Cell cell0 = row.createCell(0);
	        cell0.setCellStyle(headerStyle);
	        cell0.setCellValue("Country");
	       
	        Cell cell1 = row.createCell(1);
	        cell1.setCellStyle(headerStyle);
	        cell1.setCellValue("Currency ISO Code");

	        Cell cell2 = row.createCell(2);
	        cell2.setCellStyle(headerStyle);
	        cell2.setCellValue("Units");

	        Cell cell3 = row.createCell(3);
	        cell3.setCellStyle(headerStyle);
	        cell3.setCellValue("BUYING");
	        sheet.addMergedRegion(new CellRangeAddress(4,4,3,5));//(rowFrom,rowTo,colFrom,colTo);
	        RegionUtil.setBorderTop(CellStyle.BORDER_MEDIUM, new CellRangeAddress(4,4,3,5), sheet, workbook);
	        RegionUtil.setBorderBottom(CellStyle.BORDER_MEDIUM, new CellRangeAddress(4,4,3,5), sheet, workbook);
	        RegionUtil.setBorderLeft(CellStyle.BORDER_MEDIUM, new CellRangeAddress(4,4,3,5), sheet, workbook);
	        RegionUtil.setBorderRight(CellStyle.BORDER_THIN, new CellRangeAddress(4,4,3,5), sheet, workbook);
	        
	        Cell cell4 = row.createCell(6);
	        cell4.setCellStyle(headerStyle);
	        cell4.setCellValue("SELLING");
	        sheet.addMergedRegion(new CellRangeAddress(4,4,6,7));//(rowFrom,rowTo,colFrom,colTo);
	        RegionUtil.setBorderTop(CellStyle.BORDER_MEDIUM, new CellRangeAddress(4,4,6,7), sheet, workbook);
	        RegionUtil.setBorderBottom(CellStyle.BORDER_MEDIUM, new CellRangeAddress(4,4,6,7), sheet, workbook);
	        RegionUtil.setBorderLeft(CellStyle.BORDER_MEDIUM, new CellRangeAddress(4,4,6,7), sheet, workbook);
	        RegionUtil.setBorderRight(CellStyle.BORDER_THIN, new CellRangeAddress(4,4,6,7), sheet, workbook);
	        
	        
	        row = sheet.createRow((short) 5);
	        Cell cell53 = row.createCell(3);
	        cell53.setCellStyle(headerStyle);
	        cell53.setCellValue("T.T");
	        
	        
	        Cell cell54 = row.createCell(4);
	        cell54.setCellStyle(headerStyle);
	        cell54.setCellValue("T.C/D.D");
	        
	        Cell cell55 = row.createCell(5);
	        cell55.setCellStyle(headerStyle);
	        cell55.setCellValue("NOTES");
	        
	        
	        Cell cell56 = row.createCell(6);
	        cell56.setCellStyle(headerStyle);
	        cell56.setCellValue("T.T./D.D/T.C");
	        
	        Cell cell57 = row.createCell(7);
	        cell57.setCellStyle(headerStyle);
	        cell57.setCellValue("NOTES");
	        
	        
	        
	        
	        row = sheet.createRow((short) 6);
	        Cell cell63 = row.createCell(3);
	        cell63.setCellStyle(headerStyle);
	        cell63.setCellValue("A");
	        
	        
	        Cell cell64 = row.createCell(4);
	        cell64.setCellStyle(headerStyle);
	        cell64.setCellValue("B");
	        
	        Cell cell65 = row.createCell(5);
	        cell65.setCellStyle(headerStyle);
	        cell65.setCellValue("C");
	        
	        
	        Cell cell66 = row.createCell(6);
	        cell66.setCellStyle(headerStyle);
	        cell66.setCellValue("D");
	        
	        Cell cell67 = row.createCell(7);
	        cell67.setCellStyle(headerStyle);
	        cell67.setCellValue("E");
	        
	        
	        
	        
	        int rowIndex = 7;
	        row = sheet.createRow(rowIndex++);
	        log.info("ROWWWW=====>>>"+row);
	        DecimalFormat f = new DecimalFormat("##0.00");
			  int i=7;
			  Iterator<XBRLFIM0300Bean> itlist=arl.iterator();
           
			  while(itlist.hasNext()){
				  XBRLFIM0300Bean xb=itlist.next();
				 
				  row = sheet.createRow(rowIndex++);
				log.info("rrrr"+row);
				 
		            cell0 = row.createCell(0);
		            cell0.setCellStyle(dataStyle);
		            cell0.setCellValue(xb.getCountry());
		            
		            cell1 = row.createCell(1);
		            cell1.setCellStyle(dataStyle);
		            cell1.setCellValue(xb.getCurrencycode());
	        
	        
		            cell2 = row.createCell(2);
		            cell2.setCellStyle(dataStyle);
		            cell2.setCellValue(xb.getUnits());
		            
		            cell3 = row.createCell(3);
		            cell3.setCellStyle(amountTitle);
		            cell3.setCellValue(f.format(Float.parseFloat(xb.getTtbrate())));
	       
	        
		            cell4 = row.createCell(4);
		            cell4.setCellStyle(amountTitle);
		            //cell4.setCellStyle(AlignRight);
		            cell4.setCellValue(f.format(Float.parseFloat(xb.getTtsrate())));
		           
		            
		            cell53 = row.createCell(5);
		            cell53.setCellStyle(amountTitle);
		            //cell4.setCellStyle(AlignRight);
		            cell53.setCellValue(f.format(Float.parseFloat(xb.getTcbrate())));
		            
		            
		            cell56 = row.createCell(6);
		            cell56.setCellStyle(amountTitle);
		            //cell4.setCellStyle(AlignRight);
		            cell56.setCellValue(f.format(Float.parseFloat(xb.getNtbrate())));
		            
		            
		            cell57 = row.createCell(7);
		            cell57.setCellStyle(amountTitle);
		            //cell4.setCellStyle(AlignRight);
		            cell57.setCellValue(f.format(Float.parseFloat(xb.getNtcrate())));
		            
		            i++;
			  }
		         /*   
		            cell56 = row.createCell(5);
		            cell56.setCellStyle(amountTitle);
		            //cell4.setCellStyle(AlignRight);
		            cell56.setCellValue(f.format(Float.parseFloat(xb.getNtcrate())));*/
		            
	        /*int rowIndex = 5;
	        row = sheet.createRow(rowIndex++);
	        log.info("ROWWWW=====>>>"+row);
	        DecimalFormat f = new DecimalFormat("##0.00");
			  int i=6;
			  Iterator<XBRLFIM0300Bean> itlist=arl.iterator();
           
			  while(itlist.hasNext()){
				  XBRLFIM0300Bean xb=itlist.next();
				 
				  row = sheet.createRow(rowIndex++);
				log.info("rrrr"+row);
				 
		            cell0 = row.createCell(0);
		            cell0.setCellStyle(amountTitle);
		            cell0.setCellValue(xb.getInstiid());
		            
		            cell1 = row.createCell(1);
		            cell1.setCellStyle(amountTitle);
		            cell1.setCellValue(xb.getTranid());
		            
		            cell2 = row.createCell(2);
		            cell2.setCellStyle(dataStyle);
		            cell2.setCellValue(xb.getInstiname());
		            
		            cell3 = row.createCell(3);
		            cell3.setCellStyle(dataStyle);
		            cell3.setCellValue(xb.getInsticode());
		            
		            cell4 = row.createCell(4);
		            cell4.setCellStyle(dataStyle);
		            //cell4.setCellStyle(AlignRight);
		            //cell4.setCellValue(f.format(rep.getOpenBal()));
		            cell4.setCellValue(xb.getPurcrncy());
		            
		            cell5 = row.createCell(5);
		            cell5.setCellStyle(amountTitle);
		            //cell5.setCellStyle(AlignRight);
		           // cell5.setCellValue(f.format(Float.parseFloat(rep.getTotalcredBal())));
		            cell5.setCellValue(xb.getPuramt());
		            
		            cell6 = row.createCell(6);
		            cell6.setCellStyle(dataStyle);
		            //cell6.setCellStyle(AlignRight);
		           // cell6.setCellValue(f.format(Float.parseFloat(rep.getTotaldebtBal())));
		            cell6.setCellValue(xb.getSalecrncy());
		            
		            cell7 = row.createCell(7);
		            cell7.setCellStyle(amountTitle);
		            //cell7.setCellStyle(AlignRight);
		           // cell7.setCellValue(f.format(Float.parseFloat(rep.getAccBal())));
		            cell7.setCellValue(f.format(Float.parseFloat(xb.getSaleamt())));
		            
		            
		            cell04 = row.createCell(8);
		            cell04.setCellStyle(amountTitle);
		            //cell7.setCellStyle(AlignRight);
		           // cell7.setCellValue(f.format(Float.parseFloat(rep.getAccBal())));
		            cell04.setCellValue(f.format(Float.parseFloat(xb.getRate())));
		            
		            
		             cell05 = row.createCell(9);
		             cell05.setCellStyle(dataStyle);
		            //cell7.setCellStyle(AlignRight);
		           // cell7.setCellValue(f.format(Float.parseFloat(rep.getAccBal())));
		             cell05.setCellValue(xb.getValuedate());*/
		            
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
		            
		           
		            
		            
			/*  i++;
			  }
			 	   */
			 	   
			  
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
