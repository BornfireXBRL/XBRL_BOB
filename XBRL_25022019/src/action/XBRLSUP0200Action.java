package action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;

import basecode.DateFormat;
import bean.XBRLSUP0200Bean;
import bean.XBRLSUP0200Bean;
import bean.XBRLSUP0200Bean;
import dao.XBRLSUP0200Dao;
import dao.XBRLSUP0200Dao;
import dao.XBRLSUP0200Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
/***************************************************************************************************************
 * * * @companyName : Bonfire Innovation Private Limited Chennai * * @project :
 * Extensible Business Reporting Language (XBRL) * * @name :
 * XBRLSUP0200Action.java * * @path : action * * @author : D PraveenBabu *
 * * @version : 1.0 * * @functionality : It contains the action with multiple
 * methods to create SUP0200 Report. * * * @relatedScripts :
 * bean.XBRLSUP0200Bean.java,dao.XBRLSUP0200Dao.java * * @creationDate : *
 * * @lastModifiedDate : * * @modificationHistory : * *
 ***************************************************************************************************************/

public class XBRLSUP0200Action {
	
	static Logger log = Logger.getLogger(XBRLSUP0200Action.class);
	XBRLSUP0200Bean sbs;
	public String alert;
	
public String getAlert() {
		return alert;
	}

	public void setAlert(String alert) {
		this.alert = alert;
	}


public XBRLSUP0200Bean getSbs() {
		return sbs;
	}

	public void setSbs(XBRLSUP0200Bean sbs) {
		this.sbs = sbs;
	}


public String SUP0200s1arr;

public String[] SUP0200arr;
	
	

	public String[] getSUP0200arr() {
	return SUP0200arr;
}

public void setSUP0200arr(String[] sUP0200arr) {
	SUP0200arr = sUP0200arr;
}

	public String getSUP0200s1arr() {
	return SUP0200s1arr;
}

public void setSUP0200s1arr(String sUP0200s1arr) {
	SUP0200s1arr = sUP0200s1arr;
}

	public String SUP0200data() {
		String status="";
		HttpServletRequest request = ServletActionContext.getRequest();
		XBRLSUP0200Dao bsd = new XBRLSUP0200Dao();
		
		ArrayList<String> arr=bsd.xbrlsup100(request.getParameter("dt2"), request.getParameter("curr"));
		SUP0200arr=arr.toArray(new String[arr.size()]); 
		
		return "success";
	}
	
	/***********************SUP0200 INSERT********************************/
	public String SUP0200Formins() {
		HttpServletRequest request = ServletActionContext.getRequest();
		XBRLSUP0200Dao bsd = new XBRLSUP0200Dao();
		String status=bsd.SUP0200Formins();
		
		if(status.equals("success")) {
		alert= "Data added successfully for the date "+request.getParameter("dt2");
		}else {
	    alert= "Data Insertion failed.Try again..";
		}
		return "success";
	}
	
	/***************************SUP0200 MODIFY*****************************/
	public String SUP0200Formmod() {
		HttpServletRequest request = ServletActionContext.getRequest();
		XBRLSUP0200Dao bsd = new XBRLSUP0200Dao();
		String status=bsd.SUP0200Formmod();
		
		if(status.equals("success")) {
			alert=  "Data modified successfully for the date "+request.getParameter("dt2");
		}else {
			alert=  "Data Modification failed.Try again..";
		}
		return "success";
	}
	
	public String sup0200s1Formselect() {
		XBRLSUP0200Dao bsd = new XBRLSUP0200Dao();
		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df=new DateFormat();
		ArrayList<XBRLSUP0200Bean> arl=bsd.sup0200s1Formselect(df.formatdate(request.getParameter("dt2")));
		
		Gson gson=new Gson();
		SUP0200s1arr=gson.toJson(arl);
		return "success";
	}
	
	
	public String sup0200sec1ajaxins() {
		
		HttpServletRequest request = ServletActionContext.getRequest();
		XBRLSUP0200Dao bsd = new XBRLSUP0200Dao();
		ArrayList<XBRLSUP0200Bean> arl=new ArrayList<XBRLSUP0200Bean>();
	
		
		for (int i = 1; i <= Integer.parseInt(request.getParameter("cnt")); i++) {
			XBRLSUP0200Bean sbs=new XBRLSUP0200Bean();
			
			sbs.setTypofbsns(request.getParameter("typofbsns").split("/")[i]);
			
			sbs.setNmeofadrs(request.getParameter("nmeofadrs").split("/")[i]);
			
			sbs.setLcn(request.getParameter("lcn").split("/")[i]);
			
			sbs.setNmeofchrg(request.getParameter("nmeofchrg").split("/")[i]);
			
			arl.add(sbs);
			
		}
		
		String status=bsd.sup0200s1Formins(arl,request.getParameter("typo"));
		
		if(status.equals("success")) {
		alert= "Data added successfully for the date "+request.getParameter("dt2");
		}else {
	    alert= "Data Insertion failed.Try again..";
		}
		return "success";
	}
	
}