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
import org.apache.poi.hssf.usermodel.HSSFSheet;
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

import bean.XBRLPSC0105Bean;
import bean.XBRLReportMasterBean;
import dao.XBRLPSC0105Dao;
import dao.XBRLReportMasterDao;
public class XBRLPSC0105ActionXL extends ActionSupport{
	static Logger log = Logger.getLogger(XBRLPSC0105ActionXL.class);

	private static final long serialVersionUID = 1L;
	private InputStream inputStream;
	private String fileName;
	private long contentLength;
	@SuppressWarnings("unchecked")
	public String PSC0105EXCEL() throws IOException, SQLException {
		log.info("====Pondy Gnana====");
		
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session1 = ServletActionContext.getRequest().getSession(false); 
			SimpleDateFormat dtf = new SimpleDateFormat("dd-MM-yyyy @HH.mm.ss");
		     
			Date now = new Date();
			Object sessionStorage;
			
			XBRLPSC0105Dao dmd=new XBRLPSC0105Dao();
			log.info(request.getParameter("ReporefSeq"));
			ArrayList<XBRLPSC0105Bean> arl =dmd.xbrlpsc105(request.getParameter("dt1"),request.getParameter("dt2"),request.getParameter("ReporefSeq"),request.getParameter("instno").trim(),request.getParameter("curr"));
			      
			XBRLReportMasterDao rm= new XBRLReportMasterDao();
		
			XBRLReportMasterBean xrm=rm.xbrlsummarypdf("PSC0020");
		
			  		try {
		                	File folders=new File(getText("downloadpath"));
		                	//log.info("folders " + folders);
		            		boolean success11 = true;
		                    if (!folders.exists()) {
		                        success11 = folders.mkdirs();
		                    }
		                	String filePath=getText("downloadpath")+"/PSC0105_Report_"+dtf.format(now)+".xls";
		                	
		                	
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


		private boolean generateExcel(String filePath,ArrayList<XBRLPSC0105Bean> arl,String reportrefseq ,XBRLReportMasterBean xrm) {
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
	        
	        Sheet sheet = workbook.createSheet("S1_PSC0105");
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
	        cell0.setCellValue("Account Number");
	       
	        Cell cell1 = row.createCell(1);
	        cell1.setCellStyle(headerStyle);
	        cell1.setCellValue("Account Name");

	        Cell cell2 = row.createCell(2);
	        cell2.setCellStyle(headerStyle);
	        cell2.setCellValue("Scheme Code");
	        
	        Cell cell3= row.createCell(3);
	        cell3.setCellStyle(headerStyle);
	        cell3.setCellValue("Scheme Type");
	        
	        Cell cell4 = row.createCell(4);
	        cell4.setCellStyle(headerStyle);
	        cell4.setCellValue("ISIC Code");
	        
	        Cell cell5 = row.createCell(5);
	        cell5.setCellStyle(headerStyle);
	        cell5.setCellValue("SME Flag");
	        
	        Cell cell6 = row.createCell(6);
	        cell6.setCellStyle(headerStyle);
	        cell6.setCellValue("Outstanding Amount");
	        
	        Cell cell7 = row.createCell(7);
	        cell7.setCellStyle(headerStyle);
	        cell7.setCellValue("Impaired Flag");
	        
	        Cell cell8 = row.createCell(8);
	        cell8.setCellStyle(headerStyle);
	        cell8.setCellValue("Account Open Date");

	        Cell cell9 = row.createCell(9);
	        cell9.setCellStyle(headerStyle);
	        cell9.setCellValue("Renewal Date");

	        Cell cell10 = row.createCell(10);
	        cell10.setCellStyle(headerStyle);
	        cell10.setCellValue("Security Flag");

	        Cell cell11 = row.createCell(11);
	        cell11.setCellStyle(headerStyle);
	        cell11.setCellValue("Restructured Flag");
	        
	        Cell cell12 = row.createCell(12);
	        cell12.setCellStyle(headerStyle);
	        cell12.setCellValue("Restructured Date");
	        
	        Cell cell13 = row.createCell(13);
	        cell13.setCellStyle(headerStyle);
	        cell13.setCellValue("Sanction Amount");
	        
	        Cell cell14 = row.createCell(14);
	        cell14.setCellStyle(headerStyle);
	        cell14.setCellValue("Account Currency Code");
	        
	        Cell cell15 = row.createCell(15);
	        cell15.setCellStyle(headerStyle);
	        cell15.setCellValue("Report Date");
	       
	        
	        int rowIndex = 12;
		      
	       /* log.info("ROWWWW=====>>>"+row);*/
	        DecimalFormat f = new DecimalFormat("##0.00");
	       
			  Iterator<XBRLPSC0105Bean> itlist=arl.iterator();
           int i=0;
			  while(itlist.hasNext()){
				 
				  XBRLPSC0105Bean xb=itlist.next();
				 
				  row = sheet.createRow(rowIndex++);
				/*log.info("rrrr"+row);*/
				 
				  cell0 = row.createCell(0);
		            cell0.setCellStyle(dataStyle);
		            cell0.setCellValue(xb.getAccno());
		            
		            cell1 = row.createCell(1);
		            cell1.setCellStyle(dataStyle);
		            cell1.setCellValue(xb.getAcnam());
	        
	        
		            cell2 = row.createCell(2);
		            cell2.setCellStyle(dataStyle);
		            cell2.setCellValue(xb.getScode());
		            
		            cell3 = row.createCell(3);
		            cell3.setCellStyle(amountTitle);
		            cell3.setCellValue(xb.getStype());
		            
		            cell4 = row.createCell(4);
		            cell4.setCellStyle(dataStyle);
		            cell4.setCellValue(xb.getIscode());
		            
		            cell5 = row.createCell(5);
		            cell5.setCellStyle(dataStyle);
		            cell5.setCellValue(xb.getSflag());
		            
		            
		            cell6 = row.createCell(6);
		            cell6.setCellStyle(dataStyle);
		            cell6.setCellValue(xb.getOutamt());
		            
		            
		            cell7 = row.createCell(7);
		            cell7.setCellStyle(dataStyle);
		            cell7.setCellValue(xb.getImpflg());
		            
		            
		            cell8 = row.createCell(8);
		            cell8.setCellStyle(dataStyle);
		            cell8.setCellValue(xb.getAccopndat());
		            
		            
		            cell9 = row.createCell(9);
		            cell9.setCellStyle(dataStyle);
		            cell9.setCellValue(xb.getRendat());
		            
		            cell10 = row.createCell(10);
		            cell10.setCellStyle(dataStyle);
		            cell10.setCellValue(xb.getSecflg());
		            
		            cell11 = row.createCell(11);
		            cell11.setCellStyle(dataStyle);
		            cell11.setCellValue(xb.getReflg());
		            
		            cell12 = row.createCell(12);
		            cell12.setCellStyle(dataStyle);
		            cell12.setCellValue(xb.getResdat());
		            
		            cell13 = row.createCell(13);
		            cell13.setCellStyle(dataStyle);
		            cell13.setCellValue(xb.getSanamt());
		            
		            cell14 = row.createCell(14);
		            cell14.setCellStyle(dataStyle);
		            cell14.setCellValue(xb.getAcccrcode());
		            
		            cell15 = row.createCell(15);
		            cell15.setCellStyle(dataStyle);
		            cell15.setCellValue(xb.getRepdat());
		         
		           i++;
			  }
		        
				HttpSession session1 = ServletActionContext.getRequest().getSession(false);
	             
				XBRLPSC0105Dao cod=new XBRLPSC0105Dao();
				
				   int l=1;
					ArrayList<XBRLPSC0105Bean> arl1 =cod.xbrlpsc105s2(request.getParameter("dt1"),request.getParameter("dt2"),request.getParameter("ReporefSeq"),request.getParameter("instno").trim(),request.getParameter("curr"));
log.info(arl1.size());
	          	 String SheetS2="";
	         	l++;
				  Iterator<XBRLPSC0105Bean> itlist1=arl1.iterator();
					 HSSFSheet sheet2= (HSSFSheet) workbook.createSheet("S"+l +"_PSC0105");
					    sheet2.setDefaultColumnWidth(23);      
				  while(itlist1.hasNext()){
		
					  XBRLPSC0105Bean rep=itlist1.next();
					
					/*JournalEntriesDao je= new JournalEntriesDao();
					ArrayList<JournalEntriesBean> ar=je.outstanding(rep.getAccNum(),request.getParameter("type"));*/
				
					   
					  
				    //sheet1.setDefaultColumnWidth(17);
				    
			        row = sheet2.createRow((short) 0);
			        Cell cell69 = row.createCell(0);
			        cell69.setCellValue(xrm.getRptname());
			        cell69.setCellStyle(TitleStyle);

			       // sheet2.addMergedRegion(new CellRangeAddress(0,0,0,4));//(rowFrom,rowTo,colFrom,colTo);
			        //sheet.addMergedRegion(new CellRangeAddress(0,0,0,12));//(rowFrom,rowTo,colFrom,colTo);
			        
			       /* row = sheet.createRow((short) 1);
			        Cell cell01 = row.createCell(0);
			        cell01.setCellValue("Report Ref No :"+reportseq);
			        cell01.setCellStyle(TitleStyle);
			      
			        sheet.addMergedRegion(new CellRangeAddress(1,1,0,2));//(rowFrom,rowTo,colFrom,colTo);*/
			        //sheet.addMergedRegion(new CellRangeAddress(1,1,0,12));//(rowFrom,rowTo,colFrom,colTo);
			        
			        row = sheet2.createRow((short) 1);
			        Cell cell70= row.createCell(0);
			        cell70.setCellValue(xrm.getRprtid()+" XBRL Report");
			        cell70.setCellStyle(TitleStyle);
			        

			        //sheet2.addMergedRegion(new CellRangeAddress(1,1,0,4));//(rowFrom,rowTo,colFrom,colTo);

			        //sheet2.addMergedRegion(new CellRangeAddress(1,1,1,5));//(rowFrom,rowTo,colFrom,colTo);
			        //sheet.addMergedRegion(new CellRangeAddress(2,2,0,12));//(rowFrom,rowTo,colFrom,colTo);
			        row = sheet2.createRow((short) 2);
			       /* Cell cell71=row.createCell(0);
			        cell71.setCellValue(" ");
			        cell71.setCellStyle(TitleStyle);
			        Cell cell72 = row.createCell(1);
			        cell72.setCellValue("");
			        cell72.setCellStyle(TitleStyle);*/
			      /*  Cell cell73 = row.createCell(2);
			        cell73.setCellValue("");
			        cell73.setCellStyle(TitleStyle);*/
			        row = sheet2.createRow((short) 3);
			        Cell cell74=row.createCell(0);
			        cell74.setCellValue("Taxonomy Version");
			        cell74.setCellStyle(TitleStyle2);
			        Cell cell75=row.createCell(1);
			        cell75.setCellValue(xrm.getTaxver());
			        cell75.setCellStyle(TitleStyle2);
			        Cell cell76=row.createCell(2);
			        cell76.setCellValue("");
			        cell76.setCellStyle(TitleStyle2);
			        
			        row = sheet2.createRow((short) 4);
			        Cell cell77=row.createCell(0);
			        cell77.setCellValue("Reporting Currency");
			        cell77.setCellStyle(TitleStyle2);
			        Cell cell78=row.createCell(1);
			        cell78.setCellValue("MUR");
			        cell78.setCellStyle(TitleStyle2);
			        Cell cell79=row.createCell(2);
			        cell79.setCellValue("");
			        cell79.setCellStyle(TitleStyle2);
			        
			        row = sheet2.createRow((short) 5);
			        Cell cell80=row.createCell(0);
			        cell80.setCellValue("Reporting Frequency");
			        cell80.setCellStyle(TitleStyle2);
			        Cell cell81=row.createCell(1);
			        cell81.setCellValue(xrm.getRptfreq());
			        cell81.setCellStyle(TitleStyle2);
			        Cell cell82=row.createCell(2);
			        cell82.setCellValue("");
			        cell82.setCellStyle(TitleStyle2);
			        
			        row = sheet2.createRow((short) 6);
			        Cell cell83=row.createCell(0);
			        cell83.setCellValue("Reporting Start Date");
			        cell83.setCellStyle(TitleStyle2);
			        
			        Cell cell84=row.createCell(1);
			        cell84.setCellValue(request.getParameter("dt1"));
			        cell84.setCellStyle(TitleStyle2);
			        
			        Cell cell85=row.createCell(2);
			        cell85.setCellValue("");
			        cell85.setCellStyle(TitleStyle2);
			        
			        
			        row = sheet2.createRow((short) 7);
			        Cell cell86=row.createCell(0);
			        cell86.setCellValue("Reporting End Date");
			        cell86.setCellStyle(TitleStyle2);
			        Cell cell87=row.createCell(1);
			        cell87.setCellValue(request.getParameter("dt2"));
			        cell87.setCellStyle(TitleStyle2);
			        Cell cell88=row.createCell(2);
			        cell88.setCellValue("");
			        cell88.setCellStyle(TitleStyle2);
			        
			        row = sheet2.createRow((short) 8);
			        Cell cell89=row.createCell(0);
			        cell89.setCellValue("Report Reference No");
			        cell89.setCellStyle(TitleStyle2);
			        Cell cell90=row.createCell(1);
			        cell90.setCellValue(request.getParameter("ReporefSeq"));
			        cell90.setCellStyle(TitleStyle2);
			        Cell cell91=row.createCell(2);
			        cell91.setCellValue("");
			        cell91.setCellStyle(TitleStyle2); 
			        row = sheet2.createRow((short) 9);
			        Cell cell92=row.createCell(0);
			        cell92.setCellValue(" ");
			        cell92.setCellStyle(TitleStyle2);
			        Cell cell93=row.createCell(1);
			        cell93.setCellValue(" ");
			        cell93.setCellStyle(TitleStyle2);
			        Cell cell94=row.createCell(2);
			        cell94.setCellValue(" ");
			        cell94.setCellStyle(TitleStyle2);
			        Cell cell95=row.createCell(2);
			        cell95.setCellValue(" ");
			        cell95.setCellStyle(TitleStyle2);
			        Cell cell96=row.createCell(2);
			        cell96.setCellValue(" ");
			        cell96.setCellStyle(TitleStyle2);
			       
			        
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
			        
			        
			        row = sheet2.createRow((short) 10);
			        Cell cell0a = row.createCell(0);
			        cell0a.setCellStyle(headerStyle);
			        cell0a.setCellValue("Application Number");
			       
			        Cell cell1a = row.createCell(1);
			        cell1a.setCellStyle(headerStyle);
			        cell1a.setCellValue("Entity Name");

			        Cell cell2a = row.createCell(2);
			        cell2a.setCellStyle(headerStyle);
			        cell2a.setCellValue("Entity Type");
			        
			        Cell cell3a = row.createCell(3);
			        cell3a.setCellStyle(headerStyle);
			        cell3a.setCellValue("Facility Type");
			        
			        Cell cell4a = row.createCell(4);
			        cell4a.setCellStyle(headerStyle);
			        cell4a.setCellValue("Facility Amount");
			        
			        Cell cell5a = row.createCell(5);
			        cell5a.setCellStyle(headerStyle);
			        cell5a.setCellValue("Rejected Reason");
			        
			        Cell cell6a = row.createCell(6);
			        cell6a.setCellStyle(headerStyle);
			        cell6a.setCellValue("Application Received Date");
			        
			        Cell cell7a = row.createCell(7);
			        cell7a.setCellStyle(headerStyle);
			        cell7a.setCellValue("Application Rejected Date");
			        
			        
			        rowIndex = 12; 
			       
			      /*  log.info("ROWWWW=====>>>"+row);*/
			        DecimalFormat f1 = new DecimalFormat("#,###.00");
					  int j=5;
					  Iterator<XBRLPSC0105Bean> itlist2=arl1.iterator();
		           
					  while(itlist2.hasNext()){
						  XBRLPSC0105Bean xb=itlist2.next();
						 
						  row = sheet2.createRow(rowIndex++);
						/*log.info("rrrr"+row);*/
						  cell0a = row.createCell(0);
				            cell0a.setCellStyle(dataStyle);
				            cell0a.setCellValue(xb.getAppno());
				            
				            cell1a = row.createCell(1);
				            cell1a.setCellStyle(dataStyle);
				            cell1a.setCellValue(xb.getEntnam());
			        
			        
				            cell2a = row.createCell(2);
				            cell2a.setCellStyle(dataStyle);
				            cell2a.setCellValue(xb.getEntflg());
				           
				            cell3a = row.createCell(3);
				            cell3a.setCellStyle(dataStyle);
				            cell3a.setCellValue(xb.getFactyp());
				            
				            cell4a = row.createCell(4);
				            cell4a.setCellStyle(dataStyle);
				            cell4a.setCellValue(xb.getFacamt());
				            
				            cell5a = row.createCell(5);
				            cell5a.setCellStyle(dataStyle);
				            cell5a.setCellValue(xb.getRejreason());
				            
				            cell6a = row.createCell(6);
				            cell6a.setCellStyle(dataStyle);
				            cell6a.setCellValue(xb.getAprecdate());
				            
				            cell7a = row.createCell(7);
				            cell7a.setCellStyle(dataStyle);
				            cell7a.setCellValue(xb.getAprejdat());
				            
				         
				            

				           
				            
				            
				           
					j++;
					
					  }
					

					
			            
					  
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
