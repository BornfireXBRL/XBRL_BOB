
package action;

import java.net.InetAddress;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import org.apache.log4j.Logger;
import utilities.ConnectionManager;


	/*##############################################################################################################
	#																												#
	# 	* @companyName 			:	Bonfire Innovation Private Limited Chennai										#
	# 	* @project 				:	Extensible Business Reporting Language (XBRL)									#
	# 	* @name 				:	XBRLLoginAction.java															#
	# 	* @path 				:	action																			#
	# 	* @author 				:	D PraveenBabu																	#
	# 	* @version 				: 	1.0																				#
	# 	* @functionality 		:	It contains the login action.													#
	# 	* @relatedScripts 		: 	bean.XBRLFIM0800Bean.java,dao.XBRLFIM0800Dao.java 								#
	# 	* @creationDate 		:																					#
	# 	* @lastModifiedDate 	:																					#
	# 	* @modificationHistory 	: 																					#
	#																												#
	 ###############################################################################################################*/





//import js.DateFormat;


@SuppressWarnings("serial")
public class XBRLLoginAction extends ActionSupport implements SessionAware { 
	static Logger log = Logger.getLogger(XBRLLoginAction.class);
    private String username;
    private String password;
   
   

	
	//private static Connection mconn;
	
	
	
    public String execute() throws Exception {
    	
    	HttpServletRequest request=ServletActionContext.getRequest();
    	HttpSession session=ServletActionContext.getRequest().getSession(false);    	
    	//ResourceMasterBean rmb=new ResourceMasterBean();
    	Calendar cal = Calendar.getInstance();
    	
    	session.setMaxInactiveInterval(30*60);
    	
    	SimpleDateFormat simpDate = new SimpleDateFormat("HH:mm:ss",Locale.ENGLISH	);
    	log.info("gfdgfdghdhg"+simpDate.format(cal.getTime()));
    	
    	session.setAttribute("logintime", simpDate.format(cal.getTime()));
    	
  
    	
    	log.info("UserName >>> := " + username); 
    	
    	session.setAttribute("userName", username);
    	
    	
    	session.setAttribute("sessionRecordNo", null);
    	String status="";
    	String empname="";
    	String role="";
		PreparedStatement ps = null;
		PreparedStatement ps1 = null;
		PreparedStatement ps2 = null;
		PreparedStatement ps3 = null;
		StringBuffer sql = null;		
		sql = new StringBuffer();
		StringBuffer sql1 = null;		
		sql1 = new StringBuffer();
		StringBuffer sql2 = null;		
		sql2 = new StringBuffer();
		StringBuffer sql3 = null;		
		sql3 = new StringBuffer();
		StringBuffer sql4 = null;		
		sql4 = new StringBuffer();
		StringBuffer sql5 = null;		
		sql5 = new StringBuffer();
		StringBuffer sql6 = null;		
		sql6 = new StringBuffer();
		StringBuffer sql7 = null;		
		sql7 = new StringBuffer();
		
		String Ref_id="";
		int count = 0;
		int count1 = 0;
		boolean loginSuccess = false;
		ConnectionManager connMgr = new ConnectionManager();		
		log.info("before get connecction");
		Connection conn = connMgr.getConnection();
		//AES as=new AES();
		
		InetAddress ipAddr = InetAddress.getLocalHost();
		log.info(ipAddr);// IP add
		//String pass=as.encpwd(password);
		
		
		
		try {
            
    	   // AES as=new AES();
    		//String pass=as.pwd(password);
			sql = new StringBuffer();				
			sql.append("SELECT COUNT(username) as userCount FROM XBLOGIN ");
			sql.append(" WHERE username= ? AND PASSWORD =? AND SESSION_ID is null  ");
			log.info("Query := " + sql.toString()+session.getId());
			ps = conn.prepareStatement(sql.toString());
			ps.setString(1, username);
			ps.setString(2, password);  
			ResultSet rs = ps.executeQuery();
			log.info(username);
			//log.info(password);
			if (rs.next()) {						
				count = rs.getInt("userCount"); 
				//Ref_id = rs.getString("ref_id_desc"); 
				log.info("COUNT check"+count);
				if (count > 0) {
					loginSuccess = true;
					
					log.info("loginIN");
					sql7.append("update XBLOGIN set session_id='"+session.getId()+"' where username='"+username+"'");
					
					log.info("session"+sql7.toString());
					ps3 = conn.prepareStatement(sql7.toString());
					int rs8 = ps3.executeUpdate();
					log.info("LoginInsert");
				} 
			}
			log.info("return value := " + loginSuccess);
			
			//ps.close();
			
		
    	
    	    if(loginSuccess){
    		log.info("checcc");
    		sql1.append("SELECT COUNT(USER_ID) as userCount FROM USER_LOGIN_HISTORY");
			sql1.append(" WHERE USER_ID= ?  ");
			log.info("Query := " + sql1.toString());
			ps1 = conn.prepareStatement(sql1.toString());
			ps1.setString(1, username);
			//ps.setString(2, password);  
			ResultSet rs1 = ps1.executeQuery();
			log.info(username);
			
			if (rs1.next()) {						
				count = rs1.getInt("userCount");
				log.info("COUNTTTT"+count);
				
				if (count > 0 ) {
			
					//sql2.append("update USER_LOG_HISTORY set USER_ID= '" + username	+ "',LOGIN_STATUS='ACTIVE'  where USER_ID='"+ username + "'  ");
					sql2.append("INSERT INTO USER_LOGIN_HISTORY (USER_ID,LOGIN_STATUS,session_id,IP_ADDRESS,LOGIN_TIME,LOGOUT_TIME)");
					sql2.append("values('"+username+"','ACTIVE','"+session.getId()+"','"+ipAddr+"',sysdate,sysdate) ");
					log.info("loginUPDAT"+sql2.toString()+username);
					ps1 = conn.prepareStatement(sql2.toString());
					int rs2 = ps1.executeUpdate();
					if (rs2 > 0) {

						status = "success";
					}
						
				}else{
					
					sql2.append("INSERT INTO USER_LOGIN_HISTORY (USER_ID,LOGIN_STATUS,session_id,IP_ADDRESS,LOGIN_TIME,LOGOUT_TIME)");
					sql2.append("values('"+username+"','ACTIVE','"+session.getId()+"','"+ipAddr+"',sysdate,sysdate) ");
					log.info("loginInser"+sql2.toString()+username);
					//ps = mconn.prepareStatement(sql1.toString());
					
					ps2 = conn.prepareStatement(sql2.toString());
		    		log.info("hai"+ps2.toString());
		    		int rs3 = ps2.executeUpdate();
		    		if (rs3 > 0) {
						status = "success";
					}
				}
				}
				/*catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}*/
		    		
		    }else{
		    	status="error";
		    }	
		}	catch (SQLException e) {
		    
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    		return status;
    		
    	}
    
    
public String logout() throws Exception {
    	log.info("haiii");
    	HttpServletRequest request=ServletActionContext.getRequest();
    	HttpSession session=ServletActionContext.getRequest().getSession(false);    	
    	session.getAttribute("userName");
    	log.info("fgafdsf"+session.getAttribute("userName"));
    	log.info("UserName LOGOUT>>> := " + session.getAttribute("userName")); 
    	
    	//session.setAttribute("userName", username);
    	Calendar cal = Calendar.getInstance();
    	SimpleDateFormat simpDate = new SimpleDateFormat("HH:mm:ss",Locale.ENGLISH	);
    	log.info("gfdgfdghdhg"+simpDate.format(cal.getTime()));
    	
    	//session.setAttribute("sessionRecordNo", null);
    	String status="";
		PreparedStatement ps = null;
		PreparedStatement ps1 = null;
		PreparedStatement ps2 = null;
		PreparedStatement ps3 = null;
		StringBuffer sql = null;		
		sql = new StringBuffer();
		StringBuffer sql1 = null;		
		sql1 = new StringBuffer();
		StringBuffer sql2 = null;		
		sql2 = new StringBuffer();
		StringBuffer sql3 = null;		
		sql3 = new StringBuffer();
		StringBuffer sql7 = null;		
		sql7 = new StringBuffer();
		String logintime="";
		int count = 0;
		boolean loginSuccess = false;
		ConnectionManager connMgr = new ConnectionManager();		
		log.info("before get connecction");
		Connection conn = connMgr.getConnection();
		//DateFormat df=new DateFormat();
		InetAddress ipAddr = InetAddress.getLocalHost();
		try {
			sql = new StringBuffer();				
			sql.append("INSERT INTO USER_LOGIN_HISTORY (USER_ID,LOGIN_STATUS,session_id,IP_ADDRESS,LOGIN_TIME,LOGOUT_TIME)");
			sql.append("values('"+username+"','ACTIVE','"+session.getId()+"','"+ipAddr+"',sysdate,sysdate) ");
			//log.info("Query LOGOUT:= " + sql.toString());
			ps = conn.prepareStatement(sql.toString());
			log.info("Query LOGOUT:= " + ps.toString());
			//ResultSet rs = ps.executeUpdate();
			
			int rs = ps.executeUpdate();
			log.info("LOOOGGG");
			log.info("rs"+rs);
    		if (rs > 0) {
    			log.info("rs"+rs);
    			
    		
    			
				
				
    			log.info("loginIN");
				sql7.append("update XBLOGIN set session_id='' where username='"+session.getAttribute("userName")+"'");
				
				log.info("session"+sql7.toString());
				ps3 = conn.prepareStatement(sql7.toString());
				int rs8 = ps3.executeUpdate();
				log.info("LoginUpdate");
    			
				loginSuccess = true;
			}
			log.info("return value LOGOUT := " + loginSuccess);
			//ps.close();
		}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	
    	if(loginSuccess){
    		log.info("succccccIF");
    	return "success";
    		
    	} else {
    		 addActionError(getText("error.login"));
             return "error";
    	}
 
    }
    
public static boolean expiryUpdate(String sessionId){
	
	boolean status=false;
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps1 = null;
	try {
	ps1 = conn.prepareStatement("update XBLOGIN set session_id=null where session_id =  '" + sessionId +"'  and del_flg='N' ");
	log.info("sessionIdupdate " + ps1.toString());
	int i=ps1.executeUpdate();
	if(i>0){
		status=true;			
		//log.info("Updated  Successfully..");
		
	}
	} catch (SQLException e) {
		
		e.printStackTrace();
	} finally {
		if (ps1 != null) {
			try {
				ps1.close();					
			} catch (SQLException e) {
				
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				
			}
		}
	}
	return status;
}


public String logoutUpdate(String uName){
	HttpServletRequest request=ServletActionContext.getRequest();
	HttpSession session = request.getSession(); 
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps1 = null;
	try {
	ps1 = conn.prepareStatement("update xblogin set session_id=null where USERNAME =  '" + uName +"'");
	int i=ps1.executeUpdate();
	if(i>0){
		
	}
	} catch (SQLException e) {
		
		e.printStackTrace();
	} finally {

		if (ps1 != null) {
			try {
				ps1.close();					
			} catch (SQLException e) {
				
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				
			}
		}
	}
	return "success";
}
    public String clear(){
    	log.info("clear1");
    	username="";
    	password="";
    	log.info("clear2");
    	return "clear";
    }
    
    public String getUsername() {
        return username;
    }
 
    public void setUsername(String username) {
        this.username = username;
    }
 
    public String getPassword() {
        return password;
    }
 
    public void setPassword(String password) {
        this.password = password;
    }

	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		
	}
	
}

