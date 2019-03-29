package action;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

import bean.XBRL_REF_CODEMAINTBean;
import dao.XBRL_REF_CODEMAINTDao;

import org.apache.log4j.Logger;


public class XBRL_REF_CODEMAINTAction extends ActionSupport{
	
	static Logger log = Logger.getLogger(XBRL_REF_CODEMAINTAction.class);
	XBRL_REF_CODEMAINTBean ub;
    
	public XBRL_REF_CODEMAINTBean getUb() {
		return ub;
	}

	public void setUb(XBRL_REF_CODEMAINTBean ub) {
		this.ub = ub;
	}

	public String refcodeupdate() {
		HttpServletRequest request = ServletActionContext.getRequest();
		XBRL_REF_CODEMAINTDao rcdm=new XBRL_REF_CODEMAINTDao();
		
		String status=rcdm.refcodeupdate(ub,request.getParameter("type"));
		request.setAttribute("Page", "refcodemaint");
		if(request.getParameter("type").equals("verify")) {
			
			if(status.equals("success")) {
				request.setAttribute("alert","Verified Successfully");
			}else {
				request.setAttribute("alert","Technical Issue..Please Try again..");
			}
		}else if(request.getParameter("type").equals("add")) {
			if(status.equals("success")) {
				request.setAttribute("alert","Reference Code Added Successfully");
			}else {
				request.setAttribute("alert","Technical Issue..Please Try again..");
			}
		
		}	else {
		
			
			if(status.equals("success")) {
				request.setAttribute("alert","Updated Successfully");
			}else {
				request.setAttribute("alert","Technical Issue..Please Try again..");
			}
		}
		
		
		return status;
	}
	
	
/******************************* start repcode and repcodlev in maintain*************************/
	
	public String repcodmain;
	public String repcodlev;
	
	
	

	public String getRepcodlev() {
		return repcodlev;
	}

	public void setRepcodlev(String repcodlev) {
		this.repcodlev = repcodlev;
	}

	public String getRepcodmain() {
		return repcodmain;
	}

	public void setRepcodmain(String repcodmain) {
		this.repcodmain = repcodmain;
	}

	

	
public String repcodmain() throws SQLException {
	
	HttpServletRequest request = ServletActionContext.getRequest();
		
	XBRL_REF_CODEMAINTDao rem=new XBRL_REF_CODEMAINTDao();
		
		
	ArrayList<XBRL_REF_CODEMAINTBean> arl=  rem.repcodmain(request.getParameter("entyflg"));
		Gson gson =new Gson();
		
		repcodmain=gson.toJson(arl);
		log.info("repcomain"+repcodmain);
		return "success";
	}

public String replevel() throws SQLException {
	
	HttpServletRequest request = ServletActionContext.getRequest();
	
	XBRL_REF_CODEMAINTDao rem=new XBRL_REF_CODEMAINTDao();
		
		
	ArrayList<XBRL_REF_CODEMAINTBean> arl=  rem.replevel(request.getParameter("repcode"));
		Gson gson =new Gson();
		
		repcodlev=gson.toJson(arl);
		log.info("repcodlev"+repcodlev);
		return "success";
	}
	
		/******************************* end repcode and repcodlev in maintain*************************/



}
