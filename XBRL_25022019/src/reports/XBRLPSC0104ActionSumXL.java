package reports;

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
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;
import net.sf.jasperreports.engine.export.ooxml.JRXlsxExporter;
import net.sf.jasperreports.engine.util.JRLoader;
import utilities.ConnectionManager;
public class XBRLPSC0104ActionSumXL extends ActionSupport {
	static Logger log = Logger.getLogger(XBRLPSC0104ActionSumXL.class);
	private static final long serialVersionUID = 1L;
	private InputStream inputStream;
	private String fileName;
	private long contentLength;

	@SuppressWarnings({ "unchecked", "deprecation" })
	public String PSC0104EXCELSums() throws IOException, SQLException {
		log.info("====PSC0104EXCEL Sums Gnana====");

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session1 = ServletActionContext.getRequest().getSession(false);
		SimpleDateFormat dtf = new SimpleDateFormat("dd-MM-yyyy @HH.mm.ss");
		DateFormat df = new DateFormat();
		ServletContext context = ServletActionContext.getServletContext();
		java.net.URL main = context.getResource("./JasperResource/PSC0104/PSC0104_MAIN.jasper");
		java.net.URL s1 = context.getResource("./JasperResource/PSC0104/PSC0104_S1.jasper");
		java.net.URL s2 = context.getResource("./JasperResource/PSC0104/PSC0104_S2.jasper");
		java.net.URL s3 = context.getResource("./JasperResource/PSC0104/PSC0104_S3.jasper");
		/*java.net.URL s4 = context.getResource("./JasperResource/PSC0104/PSC0104_S4.jasper");*/
		String main_report = main.getFile();
		String subReport1 = s1.getFile();
		String subReport2 = s2.getFile();
		String subReport3 = s3.getFile();
		/*String subReport4 = s4.getFile();*/

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
			String filePath = getText("downloadpath") + "/PSC0104_Report_" + dtf.format(now) + ".xlsx";

			// Jasper Report Call

			ConnectionManager conn = new ConnectionManager();
			Connection con = conn.getConnection();
			HashMap map = new HashMap();

			// Assign Parameters

			log.info(xrm.getRptfreq());
			log.info(xrm.getTaxver());
			
			File subrep1 = new File(subReport1);
			File subrep2 = new File(subReport2);
			File subrep3 = new File(subReport3);
			/*File subrep4 = new File(subReport4);*/

			map.put("REPORT_ID", request.getParameter("reptype"));
			map.put("VERSION_NO", request.getParameter("ReporefSeq"));
			map.put("REPORT_DATE", df.formatdate(request.getParameter("dt2")));
			map.put("FROM_DATE", df.formatdate(request.getParameter("dt1")));
			map.put("TO_DATE", df.formatdate(request.getParameter("dt2")));
			map.put("CRNCY_CODE", request.getParameter("curr"));
			map.put("TAXONOMY", xrm.getTaxver());
			map.put("REPORTING_FREQUENCY", xrm.getRptfreq());
			map.put("SUB_REPORT_DIR1", subrep1);
			map.put("SUB_REPORT_DIR2", subrep2);
			map.put("SUB_REPORT_DIR3", subrep3);
		/*	map.put("SUB_REPORT_DIR4", subrep4);*/

			File jasperFile = new File(main_report);

			JasperReport jr = (JasperReport) JRLoader.loadObject(jasperFile);
			log.info("filling report");

			// To export in PDF Format
			// JasperExportManager.exportReportToPdfFile(jp,"\\home\\test.pdf");

			JasperPrint jp = JasperFillManager.fillReport(jr, map, con);
			JRXlsxExporter exporter = new JRXlsxExporter();
			exporter.setParameter(JRXlsExporterParameter.JASPER_PRINT, jp);
			exporter.setParameter(JRXlsExporterParameter.OUTPUT_FILE_NAME, filePath);
			exporter.exportReport();
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
