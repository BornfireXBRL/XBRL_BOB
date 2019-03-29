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
import bean.XBRLPYM0100Bean;
import bean.XBRLSUP0100Bean;
import dao.XBRLSUP0100Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
/***************************************************************************************************************
 * * * @companyName : Bonfire Innovation Private Limited Chennai * * @project :
 * Extensible Business Reporting Language (XBRL) * * @name :
 * XBRLSUP0100Action.java * * @path : action * * @author : D PraveenBabu *
 * * @version : 1.0 * * @functionality : It contains the action with multiple
 * methods to create SUP0100 Report. * * * @relatedScripts :
 * bean.XBRLSUP0100Bean.java,dao.XBRLSUP0100Dao.java * * @creationDate : *
 * * @lastModifiedDate : * * @modificationHistory : * *
 ***************************************************************************************************************/

public class XBRLSUP0100Action {
	static Logger log = Logger.getLogger(XBRLSUP0100Action.class);
	XBRLSUP0100Bean sbn;
	public String alert;
	
public String getAlert() {
		return alert;
	}

	public void setAlert(String alert) {
		this.alert = alert;
	}

public XBRLSUP0100Bean getSbn() {
		return sbn;
	}

	public void setSbn(XBRLSUP0100Bean sbn) {
		this.sbn = sbn;
	}

public String[] SUP0100arr;


	

	
	public String[] getSUP0100arr() {
	return SUP0100arr;
}

public void setSUP0100arr(String[] sUP0100arr) {
	SUP0100arr = sUP0100arr;
}

	
	public String SUP0100data() {
		String status="";
		HttpServletRequest request = ServletActionContext.getRequest();
		XBRLSUP0100Dao bsd = new XBRLSUP0100Dao();
		
		ArrayList<String> arr=bsd.xbrlsup100(request.getParameter("dt2"), request.getParameter("curr"));
		SUP0100arr=arr.toArray(new String[arr.size()]); 
		
		return "success";
	}
	
	/***********************SUP0100 INSERT********************************/
	public String sup0100Formins() {
		HttpServletRequest request = ServletActionContext.getRequest();
		XBRLSUP0100Dao bsd = new XBRLSUP0100Dao();
		String status=bsd.sup0100Formins();
		
		if(status.equals("success")) {
		alert= "Data added successfully for the date "+request.getParameter("dt2");
		}else {
	    alert= "Data Insertion failed.Try again..";
		}
		return "success";
	}
	
	/***************************SUP0100 MODIFY*****************************/
	public String sup0100Formmod() {
		HttpServletRequest request = ServletActionContext.getRequest();
		XBRLSUP0100Dao bsd = new XBRLSUP0100Dao();
		String status=bsd.sup0100Formmod();
		
		if(status.equals("success")) {
			alert=  "Data modified successfully for the date "+request.getParameter("dt2");
		}else {
			alert=  "Data Modification failed.Try again..";
		}
		return "success";
	}
}