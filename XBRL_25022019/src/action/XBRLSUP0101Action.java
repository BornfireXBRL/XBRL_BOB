package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;

import basecode.DateFormat;
import bean.XBRLSUP0101Bean;
import dao.XBRLSUP0101Dao;
import org.apache.log4j.Logger;
public class XBRLSUP0101Action {
	
	static Logger log = Logger.getLogger(XBRLSUP0101Action.class);
	
public String SUP0101arr;

	public String getSUP0101arr() {
	return SUP0101arr;
}

public void setSUP0101arr(String sUP0101arr) {
	SUP0101arr = sUP0101arr;
}

	public String alert;
	
	public String getAlert() {
			return alert;
		}

		public void setAlert(String alert) {
			this.alert = alert;
		}
	
	
	public String sup0101Formins() {
		HttpServletRequest request = ServletActionContext.getRequest();
		XBRLSUP0101Dao bsd = new XBRLSUP0101Dao();
		ArrayList<XBRLSUP0101Bean> arl=new ArrayList<XBRLSUP0101Bean>();
		
		for (int i = 1; i <= Integer.parseInt(request.getParameter("cnt")); i++) {
			XBRLSUP0101Bean sbn=new XBRLSUP0101Bean();
			sbn.setAdrs(request.getParameter("adrs").split("/")[i]);
			sbn.setLcn(request.getParameter("lcn").split("/")[i]);
			sbn.setNofatm(request.getParameter("nofatm").split("/")[i]);
			
			arl.add(sbn);
			
		}
		String status=bsd.sup0101Formins(arl,request.getParameter("type"));
		
		if(status.equals("success")) {
		alert= "Data added successfully for the date "+request.getParameter("dt2");
		}else {
	    alert= "Data Insertion failed.Try again..";
		}
		return "success";
	}
	
	public String sup0101Formselect() {
		XBRLSUP0101Dao bsd = new XBRLSUP0101Dao();
		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df=new DateFormat();
		ArrayList<XBRLSUP0101Bean> arl=bsd.sup0101Formselect(df.formatdate(request.getParameter("dt2")));
		
		Gson gson=new Gson();
		SUP0101arr=gson.toJson(arl);
		return "success";
	}

}
