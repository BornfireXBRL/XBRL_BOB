package action;
import java.net.UnknownHostException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import bean.LoginBean;
import dao.LoginDao;
import dao.XBRLUserProfileDao;
import utilities.NullCheck;

import org.apache.log4j.Logger;

@SuppressWarnings("serial")
public class LoginAction extends ActionSupport implements SessionAware { 
	
	static Logger log = Logger.getLogger(LoginAction.class);
  
    private static Connection mconn;
    private Map<String, Object> sessionMap;
    LoginBean lb;
    
	public Map<String, Object> getSessionMap() {
		return sessionMap;
	}
	public void setSessionMap(Map<String, Object> sessionMap) {
		this.sessionMap = sessionMap;
	}
	public LoginBean getLb() {
		return lb;
	}
	public void setLb(LoginBean lb) {
		this.lb = lb;
	}
	LoginBean slb = new LoginBean();
	public String execute() throws ParseException, UnknownHostException, NoSuchAlgorithmException, InvalidKeySpecException {
		HttpServletRequest request = ServletActionContext.getRequest();		
		LoginDao ld = new LoginDao();
		
		HttpSession session=ServletActionContext.getRequest().getSession(false);
		Calendar cal = Calendar.getInstance();
    	String loginStatus="";
    	SimpleDateFormat simpDate = new SimpleDateFormat("kk:mm:ss",Locale.ENGLISH	);
    	
       
		if(session != null){
			if(session.getAttribute("reloadflg")!=null && session.getAttribute("reloadflg").equals("Y")) {
			
				ld.logouthistoryupd("Forced Logout");
				ld.logoutUpdate(session.getAttribute("userName").toString());
				((org.apache.struts2.dispatcher.SessionMap) sessionMap)
				.invalidate();	
				return "sesserror";
			}
			slb=ld.loginVerify(lb,session.getId());
		
			if ("success".equals(slb.getStatus())) {
				
				sessionMap.put("userName", slb.getUsername());
				sessionMap.put("logintime", simpDate.format(cal.getTime()));
				sessionMap.put("category",slb.getUsercat());
				sessionMap.put("sesid", session.getId().substring(0, 5));
				sessionMap.put("reloadflg", "N");
				loginStatus=ld.checkaccexpdate(lb);
				if(loginStatus.equals("success")){
					loginStatus=ld.checkpassdate(lb);
					if(loginStatus.equals("success")){
						ld.checkexpdate();
						
						if(Integer.parseInt(request.getAttribute("count").toString())==0) {
							ld.logoutUpdate(NullCheck.isNotNull(lb.getUsername()));
							request.setAttribute("alert","chpass");
						
							loginStatus="error";
						}else {
							loginStatus=ld.logincheck();
							if(loginStatus.equals("success")) {
							ld.loginhistoryupd("Login Successful","ACTIVE");
							loginStatus= "success";
							}else {
								request.setAttribute("alert","chpassfrst");
								request.setAttribute("oldpass1", lb.getPassword());
								
								ld.logoutUpdate(NullCheck.isNotNull(lb.getUsername()));
								loginStatus="error";
							}
							
						}
					}else{
						request.setAttribute("alert",loginStatus);
						
						loginStatus= "error";
					}
				}else {
					request.setAttribute("alert",loginStatus);
					
					loginStatus= "error";
				}
				
				
			}else {
				request.setAttribute("alert",slb.getStatus());
				
				loginStatus= "error";
			}
			
			
			
		}else{		
			
			loginStatus= "error";
			
		}
    	
		return loginStatus;
		
		
	}
	
	public String logout() throws UnknownHostException, NoSuchAlgorithmException, InvalidKeySpecException {
		HttpServletRequest request = ServletActionContext.getRequest();
		
				try {
					
					LoginDao ld = new LoginDao();
					
					
					String s=ld.logoutUpdate(request.getParameter("uName"));
					ld.logouthistoryupd("Logout Successful");
									
				} catch (IllegalStateException e) {

				}
			
				
		        ((org.apache.struts2.dispatcher.SessionMap) sessionMap)
				.invalidate();		
		        
		        request.setAttribute("Page", "Logout");
		request.setAttribute("alert", "Logged out Successfully... ");
		return SUCCESS;
	}

	@Override
	public void setSession(Map<String, Object> sessionMap) {
		this.sessionMap = sessionMap;
	}
	
}

