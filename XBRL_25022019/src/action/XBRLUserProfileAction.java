package action;

import java.net.UnknownHostException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import bean.XBRLUserProfileBean;

import dao.XBRLUserProfileDao;

public class XBRLUserProfileAction {

	XBRLUserProfileBean ub;
	 private String userdata[];
     private String usrid;
     
public String addUser() throws NoSuchAlgorithmException, InvalidKeySpecException {
		
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();  
		if(session==null || session.getAttribute("userName")==null){  
	    	//request.setAttribute("closeWin","yes");
	        return "login";  
	    } else{
		System.out.println("insert Action");
		XBRLUserProfileDao upd=new XBRLUserProfileDao();
		String user=session.getAttribute("userName").toString();
		
		String status=upd.insertUser(ub,user);
		request.setAttribute("Page", "userProfile");
		if(status.equals("success")){
			request.setAttribute("alert", "User Id :" + ub.getUserId() + " has been generated successfully.");
			return "success";
		}else{
			request.setAttribute("alert", "User Id  has not been generated ");
			return "success";
		}
	    }
	}
public String inqDetails() {	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	System.out.println("inside getData");
	XBRLUserProfileDao upd=new XBRLUserProfileDao();
	ArrayList<String> arl=upd.details(usrid);
	
	userdata = arl.toArray(new String[arl.size()]); 
	System.out.println("userdata"+userdata.length);
	return "success";
	
	
}
public String modifyUser() throws NoSuchAlgorithmException, InvalidKeySpecException {
HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();  
System.out.println("insert Action");
XBRLUserProfileDao upd=new XBRLUserProfileDao();
String user=session.getAttribute("userName").toString();

String status=upd.modifyUser(ub, user,request.getParameter("status"));
request.setAttribute("Page", "userProfile");
if(status.equals("success")){
	if(request.getParameter("status").equals("N")) {
		request.setAttribute("alert", "User Id :" + ub.getUserId() + " has been verified successfully.");
	}else {
		request.setAttribute("alert", "User Id :" + ub.getUserId() + " has been modified successfully.");
	}
	
	return "success";
}else{
	request.setAttribute("alert", "User Id  has not been modified ");
	return "success";
}
}
	public String[] getUserdata() {
	return userdata;
}
public void setUserdata(String[] userdata) {
	this.userdata = userdata;
}
public String getUsrid() {
	return usrid;
}
public void setUsrid(String usrid) {
	this.usrid = usrid;
}
	public XBRLUserProfileBean getUb() {
		return ub;
	}

	public void setUb(XBRLUserProfileBean ub) {
		this.ub = ub;
	}
	
	public String insertMenu() throws NoSuchAlgorithmException, InvalidKeySpecException, UnknownHostException {
		
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();  
		
		XBRLUserProfileDao upd=new XBRLUserProfileDao();
		String user=session.getAttribute("userName").toString();
	
		String status=upd.insertMenu(user);
		
		return status;
		
		
	    }

 
	public String finuserDetails() {	
		
		HttpServletRequest request = ServletActionContext.getRequest();
		System.out.println("inside getData");
		XBRLUserProfileDao upd=new XBRLUserProfileDao();
		ArrayList<String> arl=upd.findetails(usrid);
		
		userdata = arl.toArray(new String[arl.size()]); 
		System.out.println("userdata"+userdata.length);
		return "success";
		
		
	}
	
	
}
