package action;

import java.text.ParseException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;

import bean.XBRLReportCodeSetUpBean;
import dao.ReportCodeSetUpDao;
import org.apache.log4j.Logger;


public class XBRLReportCodeSetUpAction {
	
	static Logger log = Logger.getLogger(XBRLReportCodeSetUpAction.class);

	private String details;
	private String reportId;

	public String getReportId() {
		return reportId;
	}

	public void setReportId(String reportId) {
		this.reportId = reportId;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}
	
	public String reportsetUp() throws ParseException {

		HttpServletRequest request = ServletActionContext.getRequest();
		log.info("inside getData");
      
        ReportCodeSetUpDao cod = new ReportCodeSetUpDao();
		ArrayList<XBRLReportCodeSetUpBean> arl = cod.detReportsetup(request.getParameter("reportId"));
		Gson gson = new Gson();
		
		details = gson.toJson(arl);
		
		return "success";

	}
}
