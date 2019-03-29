package reportsPDF;


import java.io.InputStream;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.ActionSupport;


public class XBRLBOP0300ActionPDF extends ActionSupport{
	
	static Logger log = Logger.getLogger(XBRLBOP0300ActionPDF.class);

	private InputStream inputStream;
	private String fileName;
	private long contentLength;
	
	/*public String bop0300PDF() throws SQLException {
		
		log.info("PDF BOP 0300");
		
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session1=ServletActionContext.getRequest().getSession(false);  
	
	
	
	XBRLBOP0300Dao dmd=new XBRLBOP0300Dao();
	ArrayList<XBRLBOP0300Bean> arl =dmd.xbrlpymsumEP(request.getParameter("dt1"),request.getParameter("dt2"),request.getParameter("ReporefSeq"),request.getParameter("curr"));
	XBRLReportMasterDao rnm=new XBRLReportMasterDao();
	XBRLReportMasterBean xrm=rnm.xbrlsummarypdf(request.getParameter("reptype"));

	
	File path=new File(getText("downloadpath"));
	boolean success11 = true;
    if (!path.exists()) {
        success11 = path.mkdirs();
    }
//	 String filePath="/home/ec2-user/FileDownloads/"+cl.getCliamid()+".pdf";
    
    
    
	
    String filePath=getText("downloadpath")+"/BOP0300.pdf";
    
    Document document = new Document();
	 
	 try
	 {
		// log.info(crb.getClaimId());
	     PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(filePath));
	     document.open();
	     
	     Rectangle rect= new Rectangle(15, 15, 575, 806);
	        rect.enableBorderSide(1);
	        rect.enableBorderSide(2);
	        rect.enableBorderSide(4);
	        rect.enableBorderSide(8);
	        rect.setBorder(2);
	        rect.setBorderColor(BaseColor.BLACK);
	        rect.setBorder(Rectangle.BOX);
	        rect.setBorderWidth(1);
         document.add(rect);
         
	     Font f=new Font(FontFamily.TIMES_ROMAN,20,Font.BOLD,BaseColor.BLACK);
         
         document.add(new Paragraph(" "));
         Paragraph p=new Paragraph("Report Form",f);
         p.setAlignment(Paragraph.ALIGN_CENTER);
         document.add(p);
       
        
         Font bf12 = new Font(FontFamily.TIMES_ROMAN, 11); 
         Font bf12b = new Font(FontFamily.TIMES_ROMAN,11, Font.BOLD,BaseColor.BLACK);
         Font bf13 = new Font(FontFamily.TIMES_ROMAN, 15, Font.BOLD,BaseColor.BLACK); 
         Font bf14 = new Font(FontFamily.TIMES_ROMAN, 11,Font.BOLD,BaseColor.BLACK);
         
     
    
         
         
         if(arl.size()>0){
        	
        	 Paragraph para1=new  Paragraph(xrm.getRptname()+" - "+xrm.getRprtid(),bf13);
		      
	         para1.setAlignment(Paragraph.ALIGN_CENTER);
	        
	         
        	 PdfPTable table0 = new PdfPTable(2);
        	 table0.setWidths(new int[]{1, 3});
        	 table0.setWidthPercentage(95);
        	 PdfPCell cell0 = new PdfPCell(new Paragraph("Taxonomy Version",bf12));
        	 cell0.setBorder(Rectangle.NO_BORDER); 
        	 table0.addCell(cell0);
        	 PdfPCell cell3 = new PdfPCell(new Paragraph(":  "+xrm.getTaxver(),bf12));
        	 cell3.setBorder(Rectangle.NO_BORDER); 
        	 table0.addCell(cell3);
        	 PdfPCell cell4 = new PdfPCell(new Paragraph("Reporting Currency",bf12));
        	 cell4.setBorder(Rectangle.NO_BORDER); 
        	 table0.addCell(cell4);
        	 PdfPCell cell5 = new PdfPCell(new Paragraph(":  "+request.getParameter("curr"),bf12));
        	 cell5.setBorder(Rectangle.NO_BORDER); 
        	 table0.addCell(cell5);
        	 PdfPCell cell6 = new PdfPCell(new Paragraph("Reporting Frequency",bf12));
        	 cell6.setBorder(Rectangle.NO_BORDER); 
        	 table0.addCell(cell6);
        	 PdfPCell cell7 = new PdfPCell(new Paragraph(":  "+xrm.getRptfreq(),bf12));
        	 cell7.setBorder(Rectangle.NO_BORDER); 
        	 table0.addCell(cell7);
        	 PdfPCell cell8 = new PdfPCell(new Paragraph("Reporting Start Date",bf12));
        	 cell8.setBorder(Rectangle.NO_BORDER); 
        	 table0.addCell(cell8);
        	 PdfPCell cell9 = new PdfPCell(new Paragraph(":  "+request.getParameter("dt1"),bf12));
        	 cell9.setBorder(Rectangle.NO_BORDER); 
        	 table0.addCell(cell9);
        	 PdfPCell cell10 = new PdfPCell(new Paragraph("Reporting End Date",bf12));
        	 cell10.setBorder(Rectangle.NO_BORDER); 
        	 table0.addCell(cell10);
        	 PdfPCell cell11 = new PdfPCell(new Paragraph(":  "+request.getParameter("dt2"),bf12));
        	 cell11.setBorder(Rectangle.NO_BORDER); 
        	 table0.addCell(cell11);
        	 PdfPCell cell12 = new PdfPCell(new Paragraph("Report Reference No",bf12));
        	 cell12.setBorder(Rectangle.NO_BORDER); 
        	 table0.addCell(cell12);
        	 PdfPCell cell13 = new PdfPCell(new Paragraph(":  "+request.getParameter("ReporefSeq"),bf12));
        	 cell13.setBorder(Rectangle.NO_BORDER); 
        	 table0.addCell(cell13);
        	
        	 PdfPTable table3 = new PdfPTable(1); // 3 columns.
             table3.setWidthPercentage(95);
             
             PdfPCell cell26 = new PdfPCell(new Paragraph("BOP0300 SUMMARY",bf14));
             cell26.setVerticalAlignment(Element.ALIGN_MIDDLE);
             cell26.setBorder(Rectangle.NO_BORDER); 
             cell26.setHorizontalAlignment(Element.ALIGN_CENTER);
             table3.addCell(cell26);
             
         PdfPTable table = new PdfPTable(5); // 5 columns.
         table.setWidthPercentage(100);
         PdfPCell cell;
         PdfPCell cell1;
         PdfPCell cell2;
         PdfPCell cell3;
         PdfPCell cell4;
         
         PdfPTable table4 = new PdfPTable(1); // 5 columns.
         table4.setWidthPercentage(100);
	 
         
         
         float[] columnWidths = new float[] {80f, 25f, 32.5f,35f, 32.5f};
         table.setWidths(columnWidths);
         
         float[] columnWidths1 = new float[] {85f};
         table4.setWidths(columnWidths1);
         
       
         
         cell = new PdfPCell(new Paragraph("Instance Name",bf14));	
         cell.setBackgroundColor(WebColors.getRGBColor("#8080ff"));
         //cell.setBackgroundColor(BaseColor.GRAY);
         table.addCell(cell);
         cell1 = new PdfPCell(new Paragraph("Instance No",bf14));
         //cell1.setBackgroundColor(BaseColor.GRAY);
         table.addCell(cell1);
         cell2 = new PdfPCell(new Paragraph("Daily Average Amount",bf14));
         //cell2.setBackgroundColor(BaseColor.GRAY);
       
         
         table.addCell(cell2);
         
         
         cell3 = new PdfPCell(new Paragraph("Weighted Average Interest Rate (%)",bf14));
         //cell3.setBackgroundColor(BaseColor.GRAY);
       
        
         table.addCell(cell3);
         
         
         cell4 = new PdfPCell(new Paragraph("Interest Income/Interest Expense",bf14));
         //cell4.setBackgroundColor(BaseColor.GRAY);
       
        
         table.addCell(cell4);
         
          
         
         Iterator<XBRLBOP0300Bean> itlist=arl.iterator();
         
        
         
         DecimalFormat dfs = new DecimalFormat("#,###.00");
         int count = 0;
         
        
     
		  while(itlist.hasNext()){
			  XBRLBOP0300Bean xb=itlist.next();
			  
			//Row 1
			  
			  if( count == 0 ) {
				  
				  
				  
				  
				  cell = new PdfPCell(new Paragraph("Asset",bf12));
				   cell.setColspan(5);
				   cell.setBackgroundColor(BaseColor.GRAY);
			         table.addCell(cell);
			        
			         cell1 = new PdfPCell(new Paragraph("",bf12));
				       
			         table.addCell(cell1); 
			         cell2 = new PdfPCell(new Paragraph("",bf12));
				       
			         table.addCell(cell2); 
			         cell3 = new PdfPCell(new Paragraph("",bf12));
				       
			         table.addCell(cell3); 
			         cell4 = new PdfPCell(new Paragraph("",bf12));
				       
			         table.addCell(cell4); 
			  }else if(  count == 14) {
				  cell = new PdfPCell(new Paragraph("Liability",bf12));
			        
			         cell.setColspan(5);
			         cell.setBackgroundColor(BaseColor.GRAY);
			         table.addCell(cell);
			         
			         
			         cell1 = new PdfPCell(new Paragraph("",bf12));
				       
			         table.addCell(cell1);     
			         cell2 = new PdfPCell(new Paragraph("",bf12));
				       
			         table.addCell(cell2); 
			         cell3 = new PdfPCell(new Paragraph("",bf12));
				       
			         table.addCell(cell3); 
			         cell4 = new PdfPCell(new Paragraph("",bf12));
				       
			         table.addCell(cell4);
			  }
			  
			  log.info("count"+count);
			  
			  if(count==0 || count==1 || count==2 || count==7 || count==8 ||count==9 || count==14|| count==15 || count==16 || count==21 || count==22 || count==23){
				cell = new PdfPCell(new Paragraph(xb.getInstname(),bf12b));
		       
		         table.addCell(cell);
			  }
			  else  {
				  cell = new PdfPCell(new Paragraph("         "+xb.getInstname(),bf12));
			       
			         table.addCell(cell); 
			  }
			  
			
			  
		         cell1 = new PdfPCell(new Paragraph(xb.getInstcode(),bf12));
		         cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
		         table.addCell(cell1);
		        //
		         
		         cell2 = new PdfPCell(new Paragraph(xb.getDailyavgamt(),bf12));
		         cell2.setHorizontalAlignment(Element.ALIGN_RIGHT);
		         table.addCell(cell2);
		         
		         
		         cell3 = new PdfPCell(new Paragraph(xb.getWgtavgrate(),bf12));
		         cell3.setHorizontalAlignment(Element.ALIGN_RIGHT);
		         table.addCell(cell3);
		         
		         
		         cell4 = new PdfPCell(new Paragraph(xb.getIntincexp(),bf12));
		         cell4.setHorizontalAlignment(Element.ALIGN_RIGHT);
		         table.addCell(cell4);
		         
		         count++;
		       
				}
		  document.add(para1);
		  document.add(para2);
		  document.add(para3);
		  document.add(para4);
		  document.add(para5);
		  document.add(para6);
		  document.add(para7);
		  document.add(new Paragraph(" "));
		  document.add(table0);
		  document.add(table1);
		  document.add(table2);
		
		  
		  document.add(table3);
		  document.add(new Paragraph(" "));
			 document.add(table);
			 document.add(table4);
			}
   	else{
   		
   	
   		PdfPTable table1 = new PdfPTable(1); // 1 columns.
	         float[] columnWidths = new float[] {78f, 22f, 32.5f,32f, 32.5f};
	         table1.setWidths(columnWidths);
	         PdfPCell cell1;	        	 
	         cell1 = new PdfPCell(new Paragraph("No Records Found",bf12));
	         table1.addCell(cell1);
	         
	         document.add(table1);
   }
	 
         document.close();
	     writer.close();
	     File fileToDownload = new File(filePath);
	     inputStream = new FileInputStream(fileToDownload);
			fileName = fileToDownload.getName();
			contentLength = fileToDownload.length();
			boolean success = (new File(filePath)).delete();
	 } catch (Exception e)
	 {
	     e.printStackTrace();
	 }
	

return "success";
	 
	}
*/
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
