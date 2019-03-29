package action;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;

import bean.XBRL_CONFIGBean;
import dao.XBRL_CONFIGDao;

public class XBRL_CONFIG {
	
	static Logger log = Logger.getLogger(XBRL_CONFIG.class);
private String refcodetyp;

	public String getRefcodetyp() {
	return refcodetyp;
}
private String refcode;
private String refcodelist;
private String status;
public String getStatus() {
	return status;
}

public void setStatus(String status) {
	this.status = status;
}

public String getRefcodelist() {
	return refcodelist;
}

public void setRefcodelist(String refcodelist) {
	this.refcodelist = refcodelist;
}

public String getRefcode() {
	return refcode;
}

public void setRefcode(String refcode) {
	this.refcode = refcode;
}

public void setRefcodetyp(String refcodetyp) {
	this.refcodetyp = refcodetyp;
}

	public String refcodeType() throws SQLException {
	XBRL_CONFIGDao conf=new XBRL_CONFIGDao();
	ArrayList<XBRL_CONFIGBean> arr= conf.refcodetype();
	Gson gson=new Gson();
	refcodetyp=gson.toJson(arr);
		return "success";
	}
	
	public String refcode() {
		HttpServletRequest request= ServletActionContext.getRequest();
		XBRL_CONFIGDao conf=new XBRL_CONFIGDao();
		ArrayList<XBRL_CONFIGBean> arl=conf.refcodearr(request.getParameter("refcodetype"));
		Gson gson=new Gson();
		refcode=gson.toJson(arl);
		return "success";
	}
	
	public String refcodelist() {
		HttpServletRequest request= ServletActionContext.getRequest();
		XBRL_CONFIGDao conf=new XBRL_CONFIGDao();
		ArrayList<XBRL_CONFIGBean> arl=conf.refcodelist();
		Gson gson=new Gson();
		refcodelist=gson.toJson(arl);
		return "success";
	}
	
	public String syscodeupd() {
		HttpServletRequest request= ServletActionContext.getRequest();
		XBRL_CONFIGDao conf=new XBRL_CONFIGDao();
		String stats=conf.syscodeupdate();
		
		status=stats;
		return status;
	}
}
