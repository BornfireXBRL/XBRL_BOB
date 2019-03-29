package action;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;

import bean.XBRL_REPREF_MAPPINGBean;
import dao.XBRL_REPREF_MAPPINGDao;

import org.apache.log4j.Logger;

public class XBRL_REPREF_MAPPINGAction {
	
	static Logger log = Logger.getLogger(XBRL_REPREF_MAPPINGAction.class);
public String repnum;
public String entdet;
public  String sts;




public String getSts() {
	return sts;
}

public void setSts(String sts) {
	this.sts = sts;
}
int count;
public int getCount() {
	return count;
}

public void setCount(int count) {
	this.count = count;
}

public String getEntdet() {
	return entdet;
}

public void setEntdet(String entdet) {
	this.entdet = entdet;
}
XBRL_REPREF_MAPPINGBean rmb;

	public XBRL_REPREF_MAPPINGBean getRmb() {
	return rmb;
}

public void setRmb(XBRL_REPREF_MAPPINGBean rmb) {
	this.rmb = rmb;
}

	public String getRepnum() {
	return repnum;
}

public void setRepnum(String repnum) {
	this.repnum = repnum;
}

	public String repdet() throws SQLException {
		
		XBRL_REPREF_MAPPINGDao rem=new XBRL_REPREF_MAPPINGDao();
		
		
		ArrayList<XBRL_REPREF_MAPPINGBean> arl=  rem.repdetails();
		Gson gson =new Gson();
		
		repnum=gson.toJson(arl);
	
		return "success";
	}

	public String repcodeupdate() {
		HttpServletRequest request = ServletActionContext.getRequest();
		XBRL_REPREF_MAPPINGDao rem=new XBRL_REPREF_MAPPINGDao();
		log.info(rmb.getRepnum2()+"fhfgh");
		int rs=rem.refcodeupdate(rmb,request.getParameter("type"));
		request.setAttribute("Page", "repcodeupdate");
		request.setAttribute("alert", rs+" rows Updated");
		return "success";
	}
public String entitydet() throws SQLException {
		
		XBRL_REPREF_MAPPINGDao rem=new XBRL_REPREF_MAPPINGDao();
		
		
		ArrayList<XBRL_REPREF_MAPPINGBean> arl=  rem.entitydet();
		Gson gson =new Gson();
		
		entdet=gson.toJson(arl);
	
		return "success";
	}

public String actvali() throws SQLException {
	
	XBRL_REPREF_MAPPINGDao rem=new XBRL_REPREF_MAPPINGDao();	
	int cnt=  rem.actvali();
	
	count=cnt;

	return "success";
}


public String custvali() throws SQLException {
	
	XBRL_REPREF_MAPPINGDao rem=new XBRL_REPREF_MAPPINGDao();	
	int cnt=  rem.custvali();
	
	count=cnt;

	return "success";
}

public String upcount() throws SQLException {
	
	XBRL_REPREF_MAPPINGDao rem=new XBRL_REPREF_MAPPINGDao();	
	int cnt=  rem.upcount();
	
	count=cnt;

	return "success";
}

public String repupdate() {
	XBRL_REPREF_MAPPINGDao rem=new XBRL_REPREF_MAPPINGDao();	
	String cnt=rem.repupdatecol();
	sts=cnt;
	return "success";
}


/********************* report  code details *********************/


public String repdet1() throws SQLException {
	
	XBRL_REPREF_MAPPINGDao rem=new XBRL_REPREF_MAPPINGDao();
	
	
	ArrayList<XBRL_REPREF_MAPPINGBean> arl=  rem.repdetails1();
	Gson gson =new Gson();
	
	repnum=gson.toJson(arl);

	return "success";
}

/********************* report  code details *********************/
}
