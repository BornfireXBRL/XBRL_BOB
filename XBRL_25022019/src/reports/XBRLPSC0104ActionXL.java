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
import org.joda.time.LocalDateTime;

import com.opensymphony.xwork2.ActionSupport;

import bean.XBRLPSC0104Bean;
import bean.XBRLReportMasterBean;
import dao.XBRLPSC0104Dao;
import dao.XBRLReportMasterDao;
public class XBRLPSC0104ActionXL extends ActionSupport{
	static Logger log = Logger.getLogger(XBRLPSC0104ActionXL.class);
	private static final long serialVersionUID = 1L;
	private InputStream inputStream;
	private String fileName;
	private long contentLength;
	@SuppressWarnings("unchecked")
	public String PSC0104EXCEL1() throws IOException, SQLException {
		log.info("====Pondy Gnana====");
		
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session1 = ServletActionContext.getRequest().getSession(false); 
			SimpleDateFormat dtf = new SimpleDateFormat("dd-MM-yyyy @HH.mm.ss");
		     
			Date now = new Date();
			Object sessionStorage;
			
			XBRLPSC0104Dao dmd=new XBRLPSC0104Dao();
			log.info(request.getParameter("ReporefSeq"));
				ArrayList<XBRLPSC0104Bean> arl =dmd.xbrlpsc4RR1(request.getParameter("dt1"),request.getParameter("dt2"),request.getParameter("ReporefSeq"),request.getParameter("instno").trim(),request.getParameter("curr"));
			      
			XBRLReportMasterDao rm= new XBRLReportMasterDao();
		
			XBRLReportMasterBean xrm=rm.xbrlsummarypdf("PSC0104");
		log.info("wdfh"+xrm.getToolver());
			  		try {
		                	File folders=new File(getText("downloadpath"));
		                	//log.info("folders " + folders);
		            		boolean success11 = true;
		                    if (!folders.exists()) {
		                        success11 = folders.mkdirs();
		                    }
		                	String filePath=getText("downloadpath")+"/PSC0104_Report_"+"_"+request.getParameter("instno")+dtf.format(now)+".xls";
		                	
		                	
		    			if(generateExcel1(filePath,arl,request.getParameter("ReporefSeq"),xrm,request.getParameter("reptype"))){			
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
	public String PSC0104EXCEL2() throws IOException, SQLException {
		log.info("====Pondy Gnana====");
		
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session1 = ServletActionContext.getRequest().getSession(false); 
			SimpleDateFormat dtf = new SimpleDateFormat("dd-MM-yyyy @HH.mm.ss");
		     
		    LocalDateTime now = LocalDateTime.now();
			Object sessionStorage;
			
			XBRLPSC0104Dao dmd=new XBRLPSC0104Dao();
			log.info(request.getParameter("ReporefSeq"));
				ArrayList<XBRLPSC0104Bean> arl =dmd.xbrlpsc4RR2(request.getParameter("dt1"),request.getParameter("dt2"),request.getParameter("ReporefSeq"),request.getParameter("instno").trim(),request.getParameter("curr"));
			      
			XBRLReportMasterDao rm= new XBRLReportMasterDao();
		
			XBRLReportMasterBean xrm=rm.xbrlsummarypdf("PSC0104");
		log.info("wdfh"+xrm.getToolver());
			  		try {
		                	File folders=new File(getText("downloadpath"));
		                	//log.info("folders " + folders);
		            		boolean success11 = true;
		                    if (!folders.exists()) {
		                        success11 = folders.mkdirs();
		                    }
		                	String filePath=getText("downloadpath")+"/PSC0104_Report_"+"_"+request.getParameter("instno")+dtf.format(now)+".xls";
		                	
		                	
		    			if(generateExcel2(filePath,arl,request.getParameter("ReporefSeq"),xrm,request.getParameter("reptype"))){			
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
	

		private boolean generateExcel1(String filePath,ArrayList<XBRLPSC0104Bean> arl,String reportrefseq ,XBRLReportMasterBean xrm,String reptype) {
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
	        
	        Sheet sheet = workbook.createSheet("PSC0104");
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
	        cell01.setCellValue(reptype+" XBRL Report");
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
	        cell0.setCellValue("Category");
	       
	        Cell cell1 = row.createCell(1);
	        cell1.setCellStyle(headerStyle);
	        cell1.setCellValue("Fbills pur Disc");

	        Cell cell2 = row.createCell(2);
	        cell2.setCellStyle(headerStyle);
	        cell2.setCellValue("Investment Corporation Shares");
	        
	        Cell cell3= row.createCell(3);
	        cell3.setCellStyle(headerStyle);
	        cell3.setCellValue("Investment Depnt Number");
	        
	        Cell cell4 = row.createCell(4);
	        cell4.setCellStyle(headerStyle);
	        cell4.setCellValue("Investment Corp Bonds");
	        
	        Cell cell5 = row.createCell(5);
	        cell5.setCellStyle(headerStyle);
	        cell5.setCellValue("Investment Oth Depts");
	        
	        Cell cell6 = row.createCell(6);
	        cell6.setCellStyle(headerStyle);
	        cell6.setCellValue("Os loans out mur");
	        
	        
	        Cell cell7= row.createCell(7);
	        cell7.setCellStyle(headerStyle);
	        cell7.setCellValue("Os Ods Out Mur");
	        
	        Cell cell8 = row.createCell(8);
	        cell8.setCellStyle(headerStyle);
	        cell8.setCellValue("Bills Receivable");
	        
	        Cell cell9 = row.createCell(9);
	        cell9.setCellStyle(headerStyle);
	        cell9.setCellValue("Nfb Facility Amount");
	        
	        Cell cell10 = row.createCell(10);
	        cell10.setCellStyle(headerStyle);
	        cell10.setCellValue("Report Date");
	       
	        
	        int rowIndex = 12;
		      
	       /* log.info("ROWWWW=====>>>"+row);*/
	        DecimalFormat f = new DecimalFormat("##0.00");
			 
			  Iterator<XBRLPSC0104Bean> itlist=arl.iterator();
           
			  while(itlist.hasNext()){
				  XBRLPSC0104Bean xb=itlist.next();
				 
				  row = sheet.createRow(rowIndex++);
				/*log.info("rrrr"+row);*/
				 
		         cell0 = row.createCell(0);
		            cell0.setCellStyle(dataStyle);
		            cell0.setCellValue(xb.getCat1());
		            
		            cell1 = row.createCell(1);
		            cell1.setCellStyle(dataStyle);
		            cell1.setCellValue(xb.getFpd1());
	        
	        
		            cell2 = row.createCell(2);
		            cell2.setCellStyle(dataStyle);
		            cell2.setCellValue(xb.getIncosh1());
		            
		            cell3 = row.createCell(3);
		            cell3.setCellStyle(amountTitle);
		            cell3.setCellValue(xb.getIndeb1());
		            
		            cell4 = row.createCell(4);
		            cell4.setCellStyle(dataStyle);
		            cell4.setCellValue(xb.getInvcorbo1());
		            
		            cell5 = row.createCell(5);
		            cell5.setCellStyle(dataStyle);
		            cell5.setCellValue(xb.getInvotdeb1());
		            
		            
		            cell6 = row.createCell(6);
		            cell6.setCellStyle(dataStyle);
		            cell6.setCellValue(xb.getOsloan1());
		            
		            cell7 = row.createCell(7);
		            cell7.setCellStyle(dataStyle);
		            cell7.setCellValue(xb.getOsods1());
		            
		            cell8 = row.createCell(8);
		            cell8.setCellStyle(amountTitle);
		            cell8.setCellValue(xb.getBillre1());
		          
		            
		            cell9 = row.createCell(9);
		            cell9.setCellStyle(dataStyle);
		            cell9.setCellValue(xb.getNebfac1());
		            
		            
		            cell10 = row.createCell(10);
		            cell10.setCellStyle(dataStyle);
		            cell10.setCellValue(xb.getRedate1());
			 
		           
			  }
		        

		 	  if(writeExcel(workbook,filePath))
		 		  status=true;
		 		else
		 			status=false;

		 	return status;
		 	}  
			  
		  
		  private boolean generateExcel2(String filePath,ArrayList<XBRLPSC0104Bean> arl,String reportrefseq ,XBRLReportMasterBean xrm,String reptype) {
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
		        
		        Sheet sheet = workbook.createSheet("PSC0104");
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
		        cell01.setCellValue(reptype+" XBRL Report");
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
		        cell0.setCellValue("Category");
		       
		        Cell cell1 = row.createCell(1);
		        cell1.setCellStyle(headerStyle);
		        cell1.setCellValue("Fbills pur Disc");

		        Cell cell2 = row.createCell(2);
		        cell2.setCellStyle(headerStyle);
		        cell2.setCellValue("Investment Corporation Shares");
		        
		        Cell cell3= row.createCell(3);
		        cell3.setCellStyle(headerStyle);
		        cell3.setCellValue("Investment Depnt Number");
		        
		        Cell cell4 = row.createCell(4);
		        cell4.setCellStyle(headerStyle);
		        cell4.setCellValue("Investment Corp Bonds");
		        
		        Cell cell5 = row.createCell(5);
		        cell5.setCellStyle(headerStyle);
		        cell5.setCellValue("Investment Oth Depts");
		        
		        Cell cell6 = row.createCell(6);
		        cell6.setCellStyle(headerStyle);
		        cell6.setCellValue("Os loans out mur");
		        
		        
		        Cell cell7= row.createCell(7);
		        cell7.setCellStyle(headerStyle);
		        cell7.setCellValue("Os Ods Out Mur");
		        
		        Cell cell8 = row.createCell(8);
		        cell8.setCellStyle(headerStyle);
		        cell8.setCellValue("Bills Receivable");
		        
		        Cell cell9 = row.createCell(9);
		        cell9.setCellStyle(headerStyle);
		        cell9.setCellValue("Nfb Facility Amount");
		        
		        Cell cell10 = row.createCell(10);
		        cell10.setCellStyle(headerStyle);
		        cell10.setCellValue("Report Date");
		       
		       
		        
		        int rowIndex = 12;
			      
		       /* log.info("ROWWWW=====>>>"+row);*/
		        DecimalFormat f = new DecimalFormat("##0.00");
				 
				  Iterator<XBRLPSC0104Bean> itlist=arl.iterator();
	           
				  while(itlist.hasNext()){
					  XBRLPSC0104Bean xb=itlist.next();
					 
					  row = sheet.createRow(rowIndex++);
					/*log.info("rrrr"+row);*/
					 
					  cell0 = row.createCell(0);
			            cell0.setCellStyle(dataStyle);
			            cell0.setCellValue(xb.getCat2());
			            
			            cell1 = row.createCell(1);
			            cell1.setCellStyle(dataStyle);
			            cell1.setCellValue(xb.getFpd2());
		        
		        
			            cell2 = row.createCell(2);
			            cell2.setCellStyle(dataStyle);
			            cell2.setCellValue(xb.getIncosh2());
			            
			            cell3 = row.createCell(3);
			            cell3.setCellStyle(amountTitle);
			            cell3.setCellValue(xb.getIndeb2());
			            
			            cell4 = row.createCell(4);
			            cell4.setCellStyle(dataStyle);
			            cell4.setCellValue(xb.getInvcorbo2());
			            
			            cell5 = row.createCell(5);
			            cell5.setCellStyle(dataStyle);
			            cell5.setCellValue(xb.getInvotdeb2());
			            
			            
			            cell6 = row.createCell(6);
			            cell6.setCellStyle(dataStyle);
			            cell6.setCellValue(xb.getOsloan2());
			            
			            cell7 = row.createCell(7);
			            cell7.setCellStyle(dataStyle);
			            cell7.setCellValue(xb.getOsods2());
			            
			            cell8 = row.createCell(8);
			            cell8.setCellStyle(amountTitle);
			            cell8.setCellValue(xb.getBillre2());
			          
			            
			            cell9 = row.createCell(9);
			            cell9.setCellStyle(dataStyle);
			            cell9.setCellValue(xb.getNebfac2());
			            
			            
			            cell10 = row.createCell(10);
			            cell10.setCellStyle(dataStyle);
			            cell10.setCellValue(xb.getRedate2());
				 
				  }
		  
		  
		  
		  
		
		  
		 	  if(writeExcel(workbook,filePath))
		 		  status=true;
		 		else
		 			status=false;

		 	return status;
		 	}  









		  private boolean generateExcel3(String filePath,ArrayList<XBRLPSC0104Bean> arl,String reportrefseq ,XBRLReportMasterBean xrm,String reptype) {
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
		        
		        Sheet sheet = workbook.createSheet("PSC0104");
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
		        cell01.setCellValue(reptype+" XBRL Report");
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
		        cell0.setCellValue("Category");
		       
		        Cell cell1 = row.createCell(1);
		        cell1.setCellStyle(headerStyle);
		        cell1.setCellValue("Fbills pur Disc");

		        Cell cell2 = row.createCell(2);
		        cell2.setCellStyle(headerStyle);
		        cell2.setCellValue("Investment Corporation Shares");
		        
		        Cell cell3= row.createCell(3);
		        cell3.setCellStyle(headerStyle);
		        cell3.setCellValue("Investment Depnt Number");
		        
		        Cell cell4 = row.createCell(4);
		        cell4.setCellStyle(headerStyle);
		        cell4.setCellValue("Investment Corp Bonds");
		        
		        Cell cell5 = row.createCell(5);
		        cell5.setCellStyle(headerStyle);
		        cell5.setCellValue("Investment Oth Depts");
		        
		        Cell cell6 = row.createCell(6);
		        cell6.setCellStyle(headerStyle);
		        cell6.setCellValue("Os loans out mur");
		        
		        
		        Cell cell7= row.createCell(7);
		        cell7.setCellStyle(headerStyle);
		        cell7.setCellValue("Os Ods Out Mur");
		        
		        Cell cell8 = row.createCell(8);
		        cell8.setCellStyle(headerStyle);
		        cell8.setCellValue("Bills Receivable");
		        
		        Cell cell9 = row.createCell(9);
		        cell9.setCellStyle(headerStyle);
		        cell9.setCellValue("Nfb Facility Amount");
		        
		        Cell cell10 = row.createCell(10);
		        cell10.setCellStyle(headerStyle);
		        cell10.setCellValue("Report Date");
		       
		       
		        
		        int rowIndex = 12;
			      
		       /* log.info("ROWWWW=====>>>"+row);*/
		        DecimalFormat f = new DecimalFormat("##0.00");
				 
				  Iterator<XBRLPSC0104Bean> itlist=arl.iterator();
	           
				  while(itlist.hasNext()){
					  XBRLPSC0104Bean xb=itlist.next();
					 
					  row = sheet.createRow(rowIndex++);
					/*log.info("rrrr"+row);*/
					 
					  cell0 = row.createCell(0);
			            cell0.setCellStyle(dataStyle);
			            cell0.setCellValue(xb.getCat3());
			            
			            cell1 = row.createCell(1);
			            cell1.setCellStyle(dataStyle);
			            cell1.setCellValue(xb.getFpd3());
		        
		        
			            cell2 = row.createCell(2);
			            cell2.setCellStyle(dataStyle);
			            cell2.setCellValue(xb.getIncosh3());
			            
			            cell3 = row.createCell(3);
			            cell3.setCellStyle(amountTitle);
			            cell3.setCellValue(xb.getIndeb3());
			            
			            cell4 = row.createCell(4);
			            cell4.setCellStyle(dataStyle);
			            cell4.setCellValue(xb.getInvcorbo3());
			            
			            cell5 = row.createCell(5);
			            cell5.setCellStyle(dataStyle);
			            cell5.setCellValue(xb.getInvotdeb3());
			            
			            
			            cell6 = row.createCell(6);
			            cell6.setCellStyle(dataStyle);
			            cell6.setCellValue(xb.getOsloan3());
			            
			            cell7 = row.createCell(7);
			            cell7.setCellStyle(dataStyle);
			            cell7.setCellValue(xb.getOsods3());
			            
			            cell8 = row.createCell(8);
			            cell8.setCellStyle(amountTitle);
			            cell8.setCellValue(xb.getBillre3());
			          
			            
			            cell9 = row.createCell(9);
			            cell9.setCellStyle(dataStyle);
			            cell9.setCellValue(xb.getNebfac3());
			            
			            
			            cell10 = row.createCell(10);
			            cell10.setCellStyle(dataStyle);
			            cell10.setCellValue(xb.getRedate3());
				 
				  }
		  
		  
		  
		  
		
		  
		 	  if(writeExcel(workbook,filePath))
		 		  status=true;
		 		else
		 			status=false;

		 	return status;
		 	}  






















public String PSC0104EXCEL3() throws IOException, SQLException {
	log.info("====Pondy Gnana====");
	
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session1 = ServletActionContext.getRequest().getSession(false); 
		SimpleDateFormat dtf = new SimpleDateFormat("dd-MM-yyyy @HH.mm.ss");
	     
	    LocalDateTime now = LocalDateTime.now();
		Object sessionStorage;
		
		XBRLPSC0104Dao dmd=new XBRLPSC0104Dao();
		log.info(request.getParameter("ReporefSeq"));
			ArrayList<XBRLPSC0104Bean> arl =dmd.xbrlpsc4RR3(request.getParameter("dt1"),request.getParameter("dt2"),request.getParameter("ReporefSeq"),request.getParameter("instno").trim(),request.getParameter("curr"));
		      
		XBRLReportMasterDao rm= new XBRLReportMasterDao();
	
		XBRLReportMasterBean xrm=rm.xbrlsummarypdf("PSC0104");
	log.info("wdfh"+xrm.getToolver());
		  		try {
	                	File folders=new File(getText("downloadpath"));
	                	//log.info("folders " + folders);
	            		boolean success11 = true;
	                    if (!folders.exists()) {
	                        success11 = folders.mkdirs();
	                    }
	                	String filePath=getText("downloadpath")+"/PSC0104_Report_"+request.getParameter("instno")+dtf.format(now)+".xls";
	                	
	                	
	    			if(generateExcel3(filePath,arl,request.getParameter("ReporefSeq"),xrm,request.getParameter("reptype"))){			
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
