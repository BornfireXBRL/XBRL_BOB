package reportsPDF;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import basecode.DateFormat;
import bean.XBRLReportMasterBean;
import dao.XBRLReportMasterDao;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;
import utilities.ConnectionManager;
public class XBRLCRR0100ActionPDF extends ActionSupport {
	
	static Logger log = Logger.getLogger(XBRLCRR0100ActionPDF.class);
	private static final long serialVersionUID = 1L;
	private InputStream inputStream;
	private String fileName;
	private long contentLength;

	@SuppressWarnings({ "unchecked", "deprecation" })
	public String CRR0100PDF() throws IOException, SQLException {
		log.info("====CRR0100EXCEL Sums Gnana====");

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session1 = ServletActionContext.getRequest().getSession(false);
		SimpleDateFormat dtf = new SimpleDateFormat("dd-MM-yyyy @HH.mm.ss");
		DateFormat df = new DateFormat();
		ServletContext context = ServletActionContext.getServletContext();
	/*	java.net.URL main = context.getResource("./JasperResource/CRR0100/CRR0100_MAIN.jasper");
		java.net.URL s1 = context.getResource("./JasperResource/CRR0100/CRR0100_S1.jasper");
		java.net.URL s2 = context.getResource("./JasperResource/CRR0100/CRR0100_S2.jasper");
		java.net.URL s3 = context.getResource("./JasperResource/CRR0100/CRR0100_S3.jasper");
		java.net.URL s4 = context.getResource("./JasperResource/CRR0100/CRR0100_S4.jasper");*/
		String main_report = context.getRealPath("./JasperResource/CRR0100/CRR0100_MAIN.jasper");
		String subReport1 = context.getRealPath("./JasperResource/CRR0100/CRR0100_S1.jasper");
		String subReport10 = context.getRealPath("./JasperResource/CRR0100/CRR0100_S10.jasper");
		

		Date now = new Date();
		Object sessionStorage;

		log.info("action");
		log.info("dt1" + request.getParameter("dt1"));
		log.info("dt2" + request.getParameter("dt2"));
		log.info("ReporefSeq" + request.getParameter("ReporefSeq"));

		XBRLReportMasterDao rm = new XBRLReportMasterDao();

		XBRLReportMasterBean xrm = rm.xbrlsummarypdf(request.getParameter("reptype"));

		try {
			File folders = new File(getText("downloadpath"));
			boolean success11 = true;
			if (!folders.exists()) {
				success11 = folders.mkdirs();
			}
			String filePath = getText("downloadpath") + "/CRR0100_Report_" + dtf.format(now) + ".pdf";

			// Jasper Report Call

			ConnectionManager conn = new ConnectionManager();
			Connection con = conn.getConnection();
			HashMap map = new HashMap();

			// Assign Parameters

			log.info(xrm.getRptfreq());
			log.info(xrm.getTaxver());
			
			File subrep1 = new File(subReport1);
			
			File subrep10 = new File(subReport10);
			
			map.put("REPORT_ID", request.getParameter("reptype"));
			map.put("VERSION_NO", request.getParameter("ReporefSeq"));
			map.put("REPORT_DATE", df.formatdate(request.getParameter("dt2")));
			map.put("FROM_DATE", df.formatdate(request.getParameter("dt1")));
			map.put("TO_DATE", df.formatdate(request.getParameter("dt2")));
			map.put("CRNCY_CODE", request.getParameter("curr"));
			map.put("TAXONOMY", xrm.getTaxver());
			map.put("REPORTING_FREQUENCY", xrm.getRptfreq());
			map.put("SUB_REPORT_DIR1", subrep1);
			
			map.put("SUB_REPORT_DIR10", subrep10);
			

			File jasperFile = new File(main_report);

			JasperReport jr = (JasperReport) JRLoader.loadObject(jasperFile);
			log.info("filling report");

			

			JasperPrint jp = JasperFillManager.fillReport(jr, map, con);
			
			
			// To export in PDF Format
			JasperExportManager.exportReportToPdfFile(jp,filePath);
						
			//JRXlsxExporter exporter = new JRXlsxExporter();
			//exporter.setParameter(JRXlsExporterParameter.JASPER_PRINT, jp);
			//exporter.setParameter(JRXlsExporterParameter.OUTPUT_FILE_NAME, filePath);
			//exporter.exportReport();
			log.info("report generated");

			// Jasper Report call ends

			if (true) {
				File fileToDownload = new File(filePath);
				inputStream = new FileInputStream(fileToDownload);
				fileName = fileToDownload.getName();
				contentLength = fileToDownload.length();

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "success";
	}

	private static Object checkForNull(Object obj) {
		if (obj == null) {
			return "";
		} else {
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
