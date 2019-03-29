package dao;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import basecode.DateFormat;
import basecode.MyStringRandomGen;
import basecode.PasswordEncryption;
import bean.XBRLUserProfileBean;
import utilities.ConnectionManager;
import utilities.NullCheck;

public class XBRLUserProfileDao {
private String passcheck;

	public String getPasscheck() {
	return passcheck;
}
public void setPasscheck(String passcheck) {
	this.passcheck = passcheck;
}
	public String insertUser(XBRLUserProfileBean ub,String user) throws NoSuchAlgorithmException, InvalidKeySpecException{	
		  
		String status="";
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		int rs=0;
		StringBuffer sql = new StringBuffer();
		DateFormat df=new DateFormat();
		String accExpDate=df.formatdate(ub.getExpiryDate());
		String disaStratDate=df.formatdate(ub.getDisableDate());
		String disaEndDate=df.formatdate(ub.getDisableTilDate());
		String passExpDate=df.formatdate(ub.getPassExDate());
	/*System.out.println("PASS"+ub.getPass()+"PASS");*/
		sql.append("insert into XBRL_USER_PROFILE_TABLE(BANK_CODE,BANK_NAME,BRANCH_CODE,BRANCH_NAME,EMP_ID,EMP_NAME,USER_ID,USER_NAME,INACTIVE_TIME,ACC_EXP_DATE,LOGIN_LOW,LOGIN_HIGH,DISABLE_START_DATE,DISABLE_END_DATE,PASSWORD,PASS_EXP_DATE,USER_STATUS,LOGIN_STATUS,VIRTUAL_FLG,WORK_CLASS,MOB_NUMBER,EMAIL_ID,ROLE_ID,ROLE_DESC,PERMISSIONS,PER_EFFCTIVE_DATE,ADMIN,XBRL_CONFIGURATION,XBRL_REPORT,SCHEDULER,EXECUTION,MIS_REPORTS,XML_REPORTS,ARCHIVEL,GENERAL_INQ,AUDIT_INQ,CHANNEL,ENTRY_USER,ENTRY_TIME,MODIFY_USER,MODIFY_TIME,ENTITY_FLG,DEL_FLG,USER_LOCKED_FLG,MODIFY_FLG)");
		sql.append("values('"+ub.getBankCode()+"','"+ub.getBankName()+"','"+ub.getBranchCode()+"','"+ub.getBranchName()+"','"+ub.getEmpId()+"','"+ub.getEmpName()+"','"+ub.getUserId()+"','"+ub.getUserName()+"','"+ub.getInactiveTime()+"','"+accExpDate+"','"+ub.getLoginLow()+"','"+ub.getLoginHigh()+"','"+disaStratDate+"','"+disaEndDate+"','"+PasswordEncryption.getEncryptedPassword(ub.getPass())+"','"+passExpDate+"','"+ub.getUserStatus()+"','"+ub.getLoginStatus()+"','"+ub.getVirtual()+"','"+ub.getWorkClass()+"','"+ub.getMobNo()+"','"+ub.getEmailId()+"','"+ub.getRoleId()+"','"+ub.getRoleDesc()+"','"+ub.getPermission()+"','"+ub.getEffectiveTill()+"','"+ub.getAdmin()+"','"+ub.getConfig()+"','"+ub.getReports()+"','"+ub.getBjsch()+"','"+ub.getBjExc()+"','"+ub.getMisReport()+"','"+ub.getXmlReport()+"','"+ub.getArch()+"','"+ub.getGenInq()+"','"+ub.getAudInq()+"','"+ub.getChnl()+"','"+user+"',current_timestamp,'"+user+"',current_timestamp,'N','N','A','A')");
		System.out.println("user query"+sql.toString());
		try {
			ps = conn.prepareStatement(sql.toString());
           rs = ps.executeUpdate();
			 if(rs>0){
					
					status="success";
				}
		} catch (SQLException e) {
			status="error";
			e.printStackTrace();
		} finally {

			if (ps != null) {
				try {
					ps.close();
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
public ArrayList<XBRLUserProfileBean> listDetails() {
		
		ArrayList<XBRLUserProfileBean> arl = new ArrayList<XBRLUserProfileBean>();

		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();
			
			sql.append("select USER_ID,USER_NAME,EMP_ID,ROLE_ID,ENTITY_FLG,USER_LOCKED_FLG from XBRL_USER_PROFILE_TABLE where DEL_FLG='N'");
	      
		try {
			ps = conn.prepareStatement(sql.toString());
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				XBRLUserProfileBean umb = new XBRLUserProfileBean();
				
				umb.setUserId(NullCheck.isNotNull(rs.getString("USER_ID")));
				
				umb.setUserName(NullCheck.isNotNull(rs.getString("USER_NAME")));
				
				umb.setEmpId(NullCheck.isNotNull(rs.getString("EMP_ID")));
				
				umb.setRoleId(NullCheck.isNotNull(rs.getString("ROLE_ID")));
				
				umb.setUserStatus(NullCheck.isNotNull(rs.getString("ENTITY_FLG")));
								
				
				arl.add(umb);

			}

		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {

			if (ps != null) {
				try {
					ps.close();
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

		return arl;

	}
public ArrayList<String> details(String userid) {
	
	ArrayList<String> arl = new ArrayList<String>();

	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();

	sql.append("select BANK_CODE,BANK_NAME,BRANCH_CODE,BRANCH_NAME,EMP_ID,EMP_NAME,USER_ID,USER_NAME,INACTIVE_TIME,to_char(ACC_EXP_DATE,'dd-mm-yyyy')ACC_EXP_DATE,LOGIN_LOW,LOGIN_HIGH,to_char(DISABLE_START_DATE,'dd-mm-yyyy')DISABLE_START_DATE,to_char(DISABLE_END_DATE,'dd-mm-yyyy')DISABLE_END_DATE,PASSWORD,to_char(PASS_EXP_DATE,'dd-mm-yyyy')PASS_EXP_DATE,USER_STATUS,LOGIN_STATUS,VIRTUAL_FLG,WORK_CLASS,MOB_NUMBER,EMAIL_ID,ROLE_ID,ROLE_DESC,PERMISSIONS,PER_EFFCTIVE_DATE,ADMIN,XBRL_CONFIGURATION,XBRL_REPORT,SCHEDULER,EXECUTION,MIS_REPORTS,XML_REPORTS,ARCHIVEL,GENERAL_INQ,AUDIT_INQ,CHANNEL,ENTRY_USER,to_char(ENTRY_TIME,'dd-mm-yyyy')ENTRY_TIME,MODIFY_USER,to_char(MODIFY_TIME,'dd-mm-yyyy')MODIFY_TIME,AUTH_USER,to_char(AUTH_TIME,'dd-mm-yyyy')AUTH_TIME,ENTITY_FLG from XBRL_USER_PROFILE_TABLE where USER_ID='"+userid+"' and DEL_FLG='N'");
	

	try {
		System.out.println(sql.toString());
		ps = conn.prepareStatement(sql.toString());
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			
			arl.add(NullCheck.isNotNull(rs.getString("BANK_CODE")));
			arl.add(NullCheck.isNotNull(rs.getString("BANK_NAME")));
			arl.add(NullCheck.isNotNull(rs.getString("BRANCH_CODE")));
			arl.add(NullCheck.isNotNull(rs.getString("BRANCH_NAME")));
			arl.add(NullCheck.isNotNull(rs.getString("EMP_ID")));
			arl.add(NullCheck.isNotNull(rs.getString("EMP_NAME")));
			arl.add(NullCheck.isNotNull(rs.getString("USER_ID")));
			arl.add(NullCheck.isNotNull(rs.getString("USER_NAME")));
			arl.add(NullCheck.isNotNull(rs.getString("INACTIVE_TIME")));
			arl.add(NullCheck.isNotNull(rs.getString("ACC_EXP_DATE")));
			arl.add(NullCheck.isNotNull(rs.getString("LOGIN_LOW")));         //10
		    arl.add(NullCheck.isNotNull(rs.getString("LOGIN_HIGH")));
		    arl.add(NullCheck.isNotNull(rs.getString("DISABLE_START_DATE")));
		    arl.add(NullCheck.isNotNull(rs.getString("DISABLE_END_DATE")));
		    arl.add(NullCheck.isNotNull(rs.getString("PASSWORD")));
			arl.add(NullCheck.isNotNull(rs.getString("PASS_EXP_DATE")));
			arl.add(NullCheck.isNotNull(rs.getString("USER_STATUS")));
			arl.add(NullCheck.isNotNull(rs.getString("LOGIN_STATUS")));
			arl.add(NullCheck.isNotNull(rs.getString("VIRTUAL_FLG")));
			arl.add(NullCheck.isNotNull(rs.getString("WORK_CLASS")));
			arl.add(NullCheck.isNotNull(rs.getString("MOB_NUMBER")));         //20
			arl.add(NullCheck.isNotNull(rs.getString("EMAIL_ID")));
			arl.add(NullCheck.isNotNull(rs.getString("ROLE_ID")));
			arl.add(NullCheck.isNotNull(rs.getString("ROLE_DESC")));
			arl.add(NullCheck.isNotNull(rs.getString("PERMISSIONS")));
		    arl.add(NullCheck.isNotNull(rs.getString("PER_EFFCTIVE_DATE")));
		    arl.add(NullCheck.isNotNull(rs.getString("ADMIN")));
		    arl.add(NullCheck.isNotNull(rs.getString("XBRL_CONFIGURATION")));
		    arl.add(NullCheck.isNotNull(rs.getString("XBRL_REPORT")));
			arl.add(NullCheck.isNotNull(rs.getString("SCHEDULER")));
			arl.add(NullCheck.isNotNull(rs.getString("EXECUTION")));          //30
			arl.add(NullCheck.isNotNull(rs.getString("MIS_REPORTS")));
			arl.add(NullCheck.isNotNull(rs.getString("XML_REPORTS")));
			arl.add(NullCheck.isNotNull(rs.getString("ARCHIVEL")));
			arl.add(NullCheck.isNotNull(rs.getString("GENERAL_INQ")));
			arl.add(NullCheck.isNotNull(rs.getString("AUDIT_INQ")));
			arl.add(NullCheck.isNotNull(rs.getString("CHANNEL")));
			arl.add(NullCheck.isNotNull(rs.getString("ENTRY_USER")));
			arl.add(NullCheck.isNotNull(rs.getString("ENTRY_TIME")));
		    arl.add(NullCheck.isNotNull(rs.getString("AUTH_USER")));
		    arl.add(NullCheck.isNotNull(rs.getString("AUTH_TIME")));
		    arl.add(NullCheck.isNotNull(rs.getString("MODIFY_USER")));
		    arl.add(NullCheck.isNotNull(rs.getString("MODIFY_TIME")));
		    arl.add(NullCheck.isNotNull(rs.getString("ENTITY_FLG")));

		}

	} catch (SQLException e) {
		
		e.printStackTrace();
	} finally {

		if (ps != null) {
			try {
				ps.close();
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

	return arl;

}
public String modifyUser(XBRLUserProfileBean ub,String user,String verfystatus) throws NoSuchAlgorithmException, InvalidKeySpecException{	
	  
	String status="";
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	int rs=0;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();
	
	String accExpDate=df.formatdate(ub.getExpiryDate());
	String disaStratDate=df.formatdate(ub.getDisableDate());
	String disaEndDate=df.formatdate(ub.getDisableTilDate());
	String passExpDate=df.formatdate(ub.getPassExDate());
	String modifyDate=df.formatdate(ub.getModifytime());
	String verifyDate=df.formatdate(ub.getVerifytime());
	 if(verfystatus.equals("Y")) {
	sql.append("update XBRL_USER_PROFILE_TABLE set INACTIVE_TIME='"+NullCheck.isNotNull(ub.getInactiveTime())+"',ACC_EXP_DATE='"+NullCheck.isNotNull(accExpDate)+"',LOGIN_LOW='"+NullCheck.isNotNull(ub.getLoginLow())+"',LOGIN_HIGH='"+NullCheck.isNotNull(ub.getLoginHigh())+"',DISABLE_START_DATE='"+NullCheck.isNotNull(disaStratDate)+"',DISABLE_END_DATE='"+NullCheck.isNotNull(disaEndDate)+"',PASSWORD='"+PasswordEncryption.getEncryptedPassword(NullCheck.isNotNull(ub.getPass()))+"',PASS_EXP_DATE='"+NullCheck.isNotNull(passExpDate)+"',USER_STATUS='"+NullCheck.isNotNull(ub.getUserStatus())+"',"
			+ "LOGIN_STATUS='"+NullCheck.isNotNull(ub.getLoginStatus())+"',VIRTUAL_FLG='"+NullCheck.isNotNull(ub.getVirtual())+"',WORK_CLASS='"+NullCheck.isNotNull(ub.getWorkClass())+"'"
	+ ",MOB_NUMBER='"+NullCheck.isNotNull(ub.getMobNo())+"',EMAIL_ID='"+NullCheck.isNotNull(ub.getEmailId())+"',ROLE_ID='"+NullCheck.isNotNull(ub.getRoleId())+"',ROLE_DESC='"+NullCheck.isNotNull(ub.getRoleDesc())+"',PERMISSIONS='"+NullCheck.isNotNull(ub.getPermission())+"',PER_EFFCTIVE_DATE='"+NullCheck.isNotNull(ub.getEffectiveTill())+"',"
			+ "ADMIN='"+NullCheck.isNotNull(ub.getAdmin())+"',XBRL_CONFIGURATION='"+NullCheck.isNotNull(ub.getConfig())+"',XBRL_REPORT='"+NullCheck.isNotNull(ub.getReports())+"',SCHEDULER='"+NullCheck.isNotNull(ub.getBjsch())+"',EXECUTION='"+NullCheck.isNotNull(ub.getBjExc())+"',MIS_REPORTS='"+NullCheck.isNotNull(ub.getMisReport())+"',XML_REPORTS='"+NullCheck.isNotNull(ub.getXmlReport())+"',ARCHIVEL='"+NullCheck.isNotNull(ub.getArch())+"',GENERAL_INQ='"+NullCheck.isNotNull(ub.getGenInq())+"',AUDIT_INQ='"+NullCheck.isNotNull(ub.getAudInq())+"',CHANNEL='"+NullCheck.isNotNull(ub.getChnl())+"',MODIFY_USER='"+ub.getModifyuser()+"',MODIFY_TIME='"+modifyDate+"',AUTH_USER='"+ub.getVerifyuser()+"',AUTH_TIME='"+verifyDate+"',ENTITY_FLG='N',MODIFY_FLG='Y' where USER_ID='"+NullCheck.isNotNull(ub.getUserId())+"'");
	 }else  if(verfystatus.equals("N")){
		 sql.append("update XBRL_USER_PROFILE_TABLE set INACTIVE_TIME='"+NullCheck.isNotNull(ub.getInactiveTime())+"',ACC_EXP_DATE='"+NullCheck.isNotNull(accExpDate)+"',LOGIN_LOW='"+NullCheck.isNotNull(ub.getLoginLow())+"',LOGIN_HIGH='"+NullCheck.isNotNull(ub.getLoginHigh())+"',DISABLE_START_DATE='"+NullCheck.isNotNull(disaStratDate)+"',DISABLE_END_DATE='"+NullCheck.isNotNull(disaEndDate)+"',PASS_EXP_DATE='"+NullCheck.isNotNull(passExpDate)+"',USER_STATUS='"+NullCheck.isNotNull(ub.getUserStatus())+"',"
					+ "LOGIN_STATUS='"+NullCheck.isNotNull(ub.getLoginStatus())+"',VIRTUAL_FLG='"+NullCheck.isNotNull(ub.getVirtual())+"',WORK_CLASS='"+NullCheck.isNotNull(ub.getWorkClass())+"'"
			+ ",MOB_NUMBER='"+NullCheck.isNotNull(ub.getMobNo())+"',EMAIL_ID='"+NullCheck.isNotNull(ub.getEmailId())+"',ROLE_ID='"+NullCheck.isNotNull(ub.getRoleId())+"',ROLE_DESC='"+NullCheck.isNotNull(ub.getRoleDesc())+"',PERMISSIONS='"+NullCheck.isNotNull(ub.getPermission())+"',PER_EFFCTIVE_DATE='"+NullCheck.isNotNull(ub.getEffectiveTill())+"',"
					+ "ADMIN='"+NullCheck.isNotNull(ub.getAdmin())+"',XBRL_CONFIGURATION='"+NullCheck.isNotNull(ub.getConfig())+"',XBRL_REPORT='"+NullCheck.isNotNull(ub.getReports())+"',SCHEDULER='"+NullCheck.isNotNull(ub.getBjsch())+"',EXECUTION='"+NullCheck.isNotNull(ub.getBjExc())+"',MIS_REPORTS='"+NullCheck.isNotNull(ub.getMisReport())+"',XML_REPORTS='"+NullCheck.isNotNull(ub.getXmlReport())+"',ARCHIVEL='"+NullCheck.isNotNull(ub.getArch())+"',GENERAL_INQ='"+NullCheck.isNotNull(ub.getGenInq())+"',AUDIT_INQ='"+NullCheck.isNotNull(ub.getAudInq())+"',CHANNEL='"+NullCheck.isNotNull(ub.getChnl())+"',MODIFY_USER='"+ub.getModifyuser()+"',MODIFY_TIME='"+modifyDate+"',AUTH_USER='"+ub.getVerifyuser()+"',AUTH_TIME='"+verifyDate+"',ENTITY_FLG='Y',MODIFY_FLG='N' where USER_ID='"+NullCheck.isNotNull(ub.getUserId())+"'");
	 }
	System.out.println("user query"+sql.toString());
	try {
		ps = conn.prepareStatement(sql.toString());
       rs = ps.executeUpdate();
		 if(rs>0){
				
				status="success";
			}
	} catch (SQLException e) {
		status="error";
		e.printStackTrace();
	} finally {

		if (ps != null) {
			try {
				ps.close();
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
/***********************CHECK PASSWORD
 * @throws InvalidKeySpecException 
 * @throws NoSuchAlgorithmException *************************/
public String checkpass() throws NoSuchAlgorithmException, InvalidKeySpecException{
	String status="";
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	String password="";
	StringBuffer sql = new StringBuffer();
	HttpServletRequest request = ServletActionContext.getRequest();
	sql.append("SELECT PASSWORD FROM USR WHERE USER_ID='"+request.getParameter("userName")+"'");
	try{
		System.out.println(sql.toString());
		ps = conn.prepareStatement(sql.toString());
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
			password=NullCheck.isNotNull(rs.getString("PASSWORD"));
		}
		if(PasswordEncryption.validatePassword(request.getParameter("oldpass"),password)){
			
			if(PasswordEncryption.validatePassword(request.getParameter("newpass"),password)){
				passcheck="newpassmatch";
				
			}else{
				
				passcheck="success";
			}
		}else{
			passcheck="oldpassnmatch";
		}
	}catch (SQLException e) {
		status="error";
		e.printStackTrace();
	} finally {

		if (ps != null) {
			try {
				ps.close();
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


/*****************************UPDATE PASSWORD
 * @throws InvalidKeySpecException 
 * @throws NoSuchAlgorithmException *******************/
public String updpass() throws NoSuchAlgorithmException, InvalidKeySpecException{
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	  SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");  
	Date dt=new Date();
	String date="";
	DateFormat df=new DateFormat();
	int mon=Integer.parseInt(""+dt.getMonth())+2;
	dt.setMonth(mon);
	String dat=formatter.format(dt);
	date=df.formatdate(dat);
	
	HttpSession session=ServletActionContext.getRequest().getSession(false);
	
	//System.out.println("session.getId()------>>> "+session.getId());
	//System.out.println("pass-------------->"+request.getParameter("newpass"));
	
	if(request.getParameter("typ").equals("login")){
		sql.append("UPDATE USR SET PASSWORD='"+PasswordEncryption.getEncryptedPassword(request.getParameter("newpass"))+"',USER_LOCKED_FLG='N',SESSION_ID='"+session.getId()+"' WHERE USER_ID='"+request.getParameter("userName")+"' ");
		}else{
		sql.append("UPDATE USR SET PASSWORD='"+PasswordEncryption.getEncryptedPassword(request.getParameter("newpass"))+"',PASS_EXP_DATE='"+NullCheck.isNotNull(date)+"',SESSION_ID='"+session.getId()+"'  WHERE USER_ID='"+request.getParameter("userName")+"' ");
		}
	try{
		System.out.println(sql.toString());
		ps = conn.prepareStatement(sql.toString());
		int rs=ps.executeUpdate();
if(rs>0){
	status="success";
}else{
	status="error";
}
	}catch (SQLException e) {
		status="error";
		e.printStackTrace();
	} finally {

		if (ps != null) {
			try {
				ps.close();
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
	passcheck=status;
	return "success";	
}


public String insertMenu(String user) throws NoSuchAlgorithmException, InvalidKeySpecException, UnknownHostException{	
	  
	String status="";
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	int rs=0;
	StringBuffer sql = new StringBuffer();
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	InetAddress ipAddr = InetAddress.getLocalHost();
	MyStringRandomGen msr=new MyStringRandomGen();
	String menuID=msr.main();
	String mid=request.getParameter("menuid")+menuID;

	updateMenu();
	if(request.getParameter("menutyp").equals("logout")) {
		sql.append("insert into SESSION_TABLE(MENU,MENU_ID,SESSION_ID,USER_ID,IP_ADDR,ENTRY_TIME,STATUS)");
		sql.append("values('LOGOUT','"+mid+"','"+session.getId()+"','"+session.getAttribute("userName").toString()+"','"+ipAddr+"',current_timestamp,'IN-ACTIVE')");
		
	}else {
		sql.append("insert into SESSION_TABLE(MENU,MENU_ID,SESSION_ID,USER_ID,IP_ADDR,ENTRY_TIME,STATUS)");
		sql.append("values('"+NullCheck.isNotNull(request.getParameter("menuid"))+"','"+mid+"','"+session.getId()+"','"+session.getAttribute("userName").toString()+"','"+ipAddr+"',current_timestamp,'ACTIVE')");
		
	}
	
	try {
		ps = conn.prepareStatement(sql.toString());
       rs = ps.executeUpdate();
		 if(rs>0){
				
				status="success";
			}
	} catch (SQLException e) {
		status="error";
		e.printStackTrace();
	} finally {

		if (ps != null) {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	return status;
}
public String updateMenu() throws NoSuchAlgorithmException, InvalidKeySpecException, UnknownHostException{	
	  
	String status="";
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	int rs=0;
	StringBuffer sql = new StringBuffer();
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	sql.append("UPDATE SESSION_TABLE SET STATUS='IN-ACTIVE' WHERE SESSION_ID='"+session.getId()+"' AND USER_ID='"+session.getAttribute("userName").toString()+"'");
	try {
		ps = conn.prepareStatement(sql.toString());
       rs = ps.executeUpdate();
		 if(rs>0){
				
				status="success";
			}
	} catch (SQLException e) {
		status="error";
		e.printStackTrace();
	} finally {

		if (ps != null) {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	return status;
}


public String sessionreset(){
	
	System.out.println("inside the passwordreset method");
	  
	String status="";
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	String userid=request.getParameter("usrid");
	PreparedStatement ps = null;
	int rs=0;
	StringBuffer sql = new StringBuffer();
	
	sql.append("UPDATE XBRL_USER_PROFILE_TABLE SET SESSION_ID=NULL WHERE  USER_ID='"+userid+"'");
	try {
		System.out.println("This Query Used For Session Clear "+sql.toString());
		ps = conn.prepareStatement(sql.toString());
       rs = ps.executeUpdate();
		 if(rs>0){
				
				status="success";
			}
	} catch (SQLException e) {
		status="error";
		e.printStackTrace();
	} finally {

		if (ps != null) {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	return status;
}

public String passwordreset() throws NoSuchAlgorithmException, InvalidKeySpecException, UnknownHostException{	
	
	System.out.println("inside the passwordreset method");
	  
	String status="";
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	String userid=request.getParameter("usrid");
	String newpassword = request.getParameter("newpswd");
	
	PreparedStatement ps = null;
	int rs=0;
	StringBuffer sql = new StringBuffer();
	
	sql.append("UPDATE XBRL_USER_PROFILE_TABLE SET PASSWORD='"+PasswordEncryption.getEncryptedPassword(newpassword)+"',USER_LOCKED_FLG='A',Pass_Exp_Date=sysdate+30 WHERE USER_ID='"+userid+"'");
	try {
		
		System.out.println("This Query Used For Password Update "+sql.toString());
		ps = conn.prepareStatement(sql.toString());
       rs = ps.executeUpdate();
		 if(rs>0){
				
				status="success";
			}
	} catch (SQLException e) {
		status="error";
		e.printStackTrace();
	} finally {

		if (ps != null) {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	return status;
}


public ArrayList<XBRLUserProfileBean> listOfFinUser() {
	
	ArrayList<XBRLUserProfileBean> arl = new ArrayList<XBRLUserProfileBean>();

	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();

	
		sql.append("Select UPR.SOL_ID," + 
				"UPR.USER_ID," + 
				"UPR.USER_EMP_ID," + 
				"to_char(UPR.USER_ACCT_EXPY_DATE,'dd-mm-yyyy')USER_ACCT_EXPY_DATE, " + 
				"NVL2(USR.USER_ID,'Y','N') AS STATUS" + 
				" From UPR " + 
				" LEFT JOIN USR ON UPR.USER_ID=USR.USER_ID " + 
				" WHERE UPR.DEL_FLG='N' and UPR.ENTITY_CRE_FLG='Y'");		

	try {
		System.out.println(sql.toString());
		ps = conn.prepareStatement(sql.toString());
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			XBRLUserProfileBean upb = new XBRLUserProfileBean();
			upb.setBranchCode(NullCheck.isNotNull(rs.getString("SOL_ID")));
			upb.setUserId(NullCheck.isNotNull(rs.getString("USER_ID")));
			upb.setEmpId(NullCheck.isNotNull(rs.getString("USER_EMP_ID")));
			upb.setExpiryDate(NullCheck.isNotNull(rs.getString("USER_ACCT_EXPY_DATE")));
			upb.setUserStatus(rs.getString("STATUS"));
				
		   arl.add(upb);
			
		}	

	} catch (SQLException e) {
		
		e.printStackTrace();
	} finally {

		if (ps != null) {
			try {
				ps.close();
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

	return arl;

}

public ArrayList<String> findetails(String userid) {
	
	System.out.println("inside the findetails");
	
	ArrayList<String> arl = new ArrayList<String>();

	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();

	sql.append("select " + 
			"SOL_ID," + 
			"USER_ID," + 
			"USER_EMP_ID," + 
			"to_char(USER_ACCT_EXPY_DATE,'dd-mm-yyyy')USER_ACCT_EXPY_DATE," + 
			"USER_WORK_CLASS," + 
			"USER_MAX_INACTIVE_TIME," + 
			"to_char(USER_DISABLED_FROM_DATE,'dd-mm-yyyy')USER_DISABLED_FROM_DATE," + 
			"to_char(USER_DISABLED_UPTO_DATE,'dd-mm-yyyy')USER_DISABLED_UPTO_DATE," + 
			"to_char(USER_LOGIN_TIME_LOW,'HH24:MI:SS')USER_LOGIN_TIME_LOW," + 
			"to_char(USER_LOGIN_TIME_HIGH,'HH24:MI:SS')USER_LOGIN_TIME_HIGH," + 
			"VIRTUAL_FLG " + 
			"from USER_PROFILE_TABLE WHERE DEL_FLG='N' and ENTITY_CRE_FLG='Y' and  USER_ID='"+userid+"'");
	
	
	try {
		System.out.println(sql.toString());
		ps = conn.prepareStatement(sql.toString());
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			
			
			arl.add(NullCheck.isNotNull(rs.getString("SOL_ID")));
			arl.add(NullCheck.isNotNull(rs.getString("USER_ID")));
			arl.add(NullCheck.isNotNull(rs.getString("USER_EMP_ID")));
			arl.add(NullCheck.isNotNull(rs.getString("USER_ACCT_EXPY_DATE")));
			arl.add(NullCheck.isNotNull(rs.getString("USER_WORK_CLASS")));
			arl.add(NullCheck.isNotNull(rs.getString("USER_MAX_INACTIVE_TIME")));      //5   
		    arl.add(NullCheck.isNotNull(rs.getString("USER_DISABLED_FROM_DATE")));
		    arl.add(NullCheck.isNotNull(rs.getString("USER_DISABLED_UPTO_DATE")));
		    arl.add(NullCheck.isNotNull(rs.getString("USER_LOGIN_TIME_LOW")));
		    arl.add(NullCheck.isNotNull(rs.getString("USER_LOGIN_TIME_HIGH")));
			arl.add(NullCheck.isNotNull(rs.getString("VIRTUAL_FLG")));
			
	
		}

	} catch (SQLException e) {
		
		e.printStackTrace();
	} finally {

		if (ps != null) {
			try {
				ps.close();
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

	return arl;

}

}
