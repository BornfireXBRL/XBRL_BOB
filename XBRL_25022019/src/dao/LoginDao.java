package dao;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import basecode.PasswordEncryption;
import bean.LoginBean;
import utilities.ConnectionManager;
import utilities.NullCheck;

import org.apache.log4j.Logger;

public class LoginDao {
	
	static Logger log = Logger.getLogger(LoginDao.class);
	private int countdays;
	
	
	public int getCountdays() {
		return countdays;
	}
	public void setCountdays(int countdays) {
		this.countdays = countdays;
	}
	public LoginBean loginVerify(LoginBean lb,String sessId) throws UnknownHostException {
		HttpSession session=ServletActionContext.getRequest().getSession(false);
		LoginBean Lbb = new LoginBean();
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		PreparedStatement ps1 = null;	
		PreparedStatement ps2 = null;
		log.info(session.getAttribute("userName"));
		try {
			if(lb !=null && sessId != null){
				StringBuffer sql = new StringBuffer();
				sql.append("SELECT * FROM USR");			
					sql.append(" WHERE DEL_FLG='N' and ENTITY_FLG='Y' and USER_ID =  '" + lb.getUsername()
							+ "'");
					log.info(sql.toString());
				ps = conn.prepareStatement(sql.toString());
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					try {
						if(NullCheck.isNotNull(rs.getString("USER_LOCKED_FLG")).equals("Y")) {
							Lbb.setStatus("Account Locked !");
							loginhistoryupd(Lbb.getStatus(),lb.getUsername());
						}else if(checkDisable(lb.getUsername())){
							Lbb.setStatus("Account Disabled !");
							loginhistoryupd(Lbb.getStatus(),lb.getUsername());
						}else {
							log.info(PasswordEncryption.validatePassword(lb.getPassword(), rs.getString("PASSWORD")));
							
						if(PasswordEncryption.validatePassword(lb.getPassword(),rs.getString("PASSWORD"))){
						ps2 = conn.prepareStatement(sql.append("AND SESSION_ID is null").toString());
						ResultSet rs1 = ps2.executeQuery();
						if (rs1.next()) {
						ps1 = conn.prepareStatement("update USR set SESSION_ID='"+sessId+"',NO_OF_ATTMP=null where USER_ID =  '" + lb.getUsername()+"'");
					
						int i= ps1.executeUpdate();
						
						if(i>0){
						
							Lbb.setUsername(rs.getString("USER_ID"));
							Lbb.setPassexpdate(rs.getString("PASS_EXP_DATE"));
							Lbb.setUsercat(rs.getString("ROLE_ID"));
							Lbb.setStatus("success");
						
						}
						}else{
							
							Lbb.setStatus("Session Already Available...");
							loginhistoryupd(Lbb.getStatus(),lb.getUsername());
						}
						}else{
							Lbb.setStatus("Invalid Password..");
							accLockUpdate(lb.getUsername());
							loginhistoryupd(Lbb.getStatus(),lb.getUsername());
						}	
					}
					} catch (NoSuchAlgorithmException e) {
						
						Lbb.setStatus("Invalid Password...");
						
						loginhistoryupd(Lbb.getStatus(),lb.getUsername());
						accLockUpdate(lb.getUsername());
						e.printStackTrace();
					} catch (InvalidKeySpecException e) {
						
						Lbb.setStatus("Invalid Password...");
						loginhistoryupd(Lbb.getStatus(),lb.getUsername());
						accLockUpdate(lb.getUsername());
						e.printStackTrace();
					}				
				}else{
					Lbb.setStatus("Invalid UserName...");		
					loginhistoryupd(Lbb.getStatus(),lb.getUsername());
				}
				return Lbb;
			}else {
				Lbb.setStatus("UnAuthorized Access..");	
				loginhistoryupd(Lbb.getStatus(),lb.getUsername());
				
				
			}
	} catch (SQLException e) {
		Lbb.setStatus("Server Issue Please Try Again Later...");
		loginhistoryupd(Lbb.getStatus(),lb.getUsername());
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

		return Lbb;
}
	public String logoutUpdate(String uName) throws NoSuchAlgorithmException, InvalidKeySpecException, UnknownHostException{
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		try {
			XBRLUserProfileDao up=new XBRLUserProfileDao();
			up.updateMenu();
		ps = conn.prepareStatement("update USR set SESSION_ID=null where USER_ID = '" + uName +"'");
		
		int i=ps.executeUpdate();
		if(i>0){
			
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
		return "success";
	}
	/************************ CHECK ACCOUNT EXPIRY DATE 
	 * @throws UnknownHostException 
	 * @throws InvalidKeySpecException 
	 * @throws NoSuchAlgorithmException ***********************/
	public String checkaccexpdate(LoginBean lb) throws UnknownHostException, NoSuchAlgorithmException, InvalidKeySpecException{
		String status="";
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
	int count=0;
		PreparedStatement ps = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT COUNT(*) AS CNT FROM USR WHERE USER_ID='"+NullCheck.isNotNull(lb.getUsername())+"' and ACC_EXP_DATE >= SYSDATE");
		log.info(sql.toString());
		try {
			ps = conn.prepareStatement(sql.toString());
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				count=Integer.parseInt(rs.getString("CNT"));
			}
			if(count==0){
				status="Account Expired";
				loginhistoryupd(status,lb.getUsername());
				logoutUpdate(NullCheck.isNotNull(lb.getUsername()));
			}else{
				status="success";
			}
		}catch (SQLException e) {
			logoutUpdate(NullCheck.isNotNull(lb.getUsername()));
			status="Technical Issue.Try Again Later";
			loginhistoryupd(status,lb.getUsername());
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
	
	/****************CHECK PASSWORD EXPIRY DATE
	 * @throws UnknownHostException 
	 * @throws InvalidKeySpecException 
	 * @throws NoSuchAlgorithmException *******************/
	public String checkpassdate(LoginBean lb) throws UnknownHostException, NoSuchAlgorithmException, InvalidKeySpecException{
		String status="";
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
	int count=0;
		PreparedStatement ps = null;
		Date dt=new Date();
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT COUNT(*) AS CNT,to_char(PASS_EXP_DATE,'dd-mm-yyyy')PASS_EXP_DATE,LOGIN_HIGH,LOGIN_LOW FROM USR WHERE USER_ID='"+NullCheck.isNotNull(lb.getUsername())+"' and PASS_EXP_DATE >= SYSDATE GROUP BY PASS_EXP_DATE,LOGIN_HIGH,LOGIN_LOW");
		log.info(sql.toString());
		try {
			ps = conn.prepareStatement(sql.toString());
			
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				count=Integer.parseInt(rs.getString("CNT"));
				lb.setPassexpdate(NullCheck.isNotNull(rs.getString("PASS_EXP_DATE")));
				lb.setLoginhigh(NullCheck.isNotNull(rs.getString("LOGIN_HIGH").trim()));
				lb.setLoginlow(NullCheck.isNotNull(rs.getString("LOGIN_LOW").trim()));
			}
			if(count==0){
				status="Password Expired";
				logoutUpdate(NullCheck.isNotNull(lb.getUsername()));
			}else{
		
				if(dt.getHours() >= Integer.parseInt(lb.getLoginlow().split(":")[0])  && dt.getHours() <= Integer.parseInt(lb.getLoginhigh().split(":")[0]) ){
					status="success";
					if(dt.getHours()== Integer.parseInt(lb.getLoginlow().split(":")[0]) && dt.getHours() == Integer.parseInt(lb.getLoginhigh().split(":")[0])){
						if ( dt.getMinutes() >= Integer.parseInt(lb.getLoginlow().split(":")[1]) && dt.getMinutes() <= Integer.parseInt(lb.getLoginhigh().split(":")[1])){
							status="success";
						}else{
							status="Login Not Permitted";
							loginhistoryupd(status,lb.getUsername());
							logoutUpdate(NullCheck.isNotNull(lb.getUsername()));
						}
					}
					else if(dt.getHours()== Integer.parseInt(lb.getLoginlow().split(":")[0]) ){
						if ( dt.getMinutes() >= Integer.parseInt(lb.getLoginlow().split(":")[1])){
						status="success";
						}else{
							status="Login Not Permitted";
							loginhistoryupd(status,lb.getUsername());
							logoutUpdate(NullCheck.isNotNull(lb.getUsername()));
						}
					}else if(dt.getHours() == Integer.parseInt(lb.getLoginhigh().split(":")[0])){
						if(dt.getMinutes() <= Integer.parseInt(lb.getLoginhigh().split(":")[1])){
							status="success";
						}else{
							status="Login Not Permitted";
							loginhistoryupd(status,lb.getUsername());
							logoutUpdate(NullCheck.isNotNull(lb.getUsername()));
						}
						
					}
					log.info(lb.getPassexpdate().equals(dt.getDate()+"-"+dt.getMonth()+"-"+dt.getYear()));
					if(lb.getPassexpdate().equals(dt.getDate()+"-"+dt.getMonth()+"-"+dt.getYear())){
						status="changepass";
					}
				}else{
					status="Login Not Permitted";
					loginhistoryupd(status,lb.getUsername());
					logoutUpdate(NullCheck.isNotNull(lb.getUsername()));
				}
				
				
			}
		}catch (SQLException e) {
			status="Technical Issue.Try Again Later";
			loginhistoryupd(status,lb.getUsername());
			logoutUpdate(NullCheck.isNotNull(lb.getUsername()));
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
	/*******************COUNT EXPIRY DAYS************************/
	
public String checkexpdate() {
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
int count=0;
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	sql.append("SELECT ROUND(PASS_EXP_DATE-SYSDATE) CNT FROM USR WHERE USER_ID='"+session.getAttribute("userName")+"'");
	try {
		log.info(sql.toString());
		ps = conn.prepareStatement(sql.toString());
		
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			count=rs.getInt("CNT");
			request.setAttribute("count", count);
		}
	}catch(SQLException e) {
		e.printStackTrace();
	}
	countdays=count;
	return "success";
}

/*******************LOGIN HISTORY UPDATE
 * @throws UnknownHostException ********************/
public String loginhistoryupd(String remarks,String username) throws UnknownHostException {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	InetAddress ipAddr = InetAddress.getLocalHost();
	StringBuffer sql = new StringBuffer();
	if(remarks.equals("Login Successful")) {
	sql.append("INSERT INTO USER_LOGIN_HISTORY (USER_ID,LOGIN_TIME,LOGIN_STATUS,session_id,IP_ADDRESS,REMARKS)");
	sql.append("values('"+NullCheck.isNotNull(username)+"',sysdate,'ACTIVE','"+session.getId()+"','"+ipAddr+"','"+NullCheck.isNotNull(remarks)+"') ");
	}else {
		sql.append("INSERT INTO USER_LOGIN_HISTORY (USER_ID,LOGIN_TIME,LOGIN_STATUS,session_id,IP_ADDRESS,REMARKS)");
		sql.append("values('"+NullCheck.isNotNull(username)+"',sysdate,'IN-ACTIVE','"+session.getId()+"','"+ipAddr+"','"+NullCheck.isNotNull(remarks)+"') ");
	}
	try {
		ps = conn.prepareStatement(sql.toString());
		int rs=ps.executeUpdate();
		if(rs>0) {
			status="success";
		}else {
			status="error";
		}
	}catch(SQLException e) {
		e.printStackTrace();
	}
	return status;
}
/*******************LOGOUT HISTORY UPDATE********************/
public String logouthistoryupd(String remarks) throws UnknownHostException {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	InetAddress ipAddr = InetAddress.getLocalHost();
	StringBuffer sql = new StringBuffer();
	sql.append("INSERT INTO USER_LOGIN_HISTORY (USER_ID,LOGOUT_TIME,LOGIN_STATUS,session_id,IP_ADDRESS,REMARKS)");
	sql.append("values('"+session.getAttribute("userName")+"',sysdate,'IN-ACTIVE','"+session.getId()+"','"+ipAddr+"','"+NullCheck.isNotNull(remarks)+"') ");
	try {
		ps = conn.prepareStatement(sql.toString());
		int rs=ps.executeUpdate();
		if(rs>0) {
			status="success";
		}else {
			status="error";
		}
	}catch(SQLException e) {
		e.printStackTrace();
	}
	return status;
}


/**********************CHECK FOR 1ST TIME LOGIN********************/
public String logincheck() {
String status="";
HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();
ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();
PreparedStatement ps = null;
StringBuffer sql = new StringBuffer();
int flg=0;
sql.append("SELECT count(USER_LOCKED_FLG)as cnt FROM XBRL_USER_PROFILE_TABLE WHERE USER_ID='"+session.getAttribute("userName")+"' AND USER_LOCKED_FLG='A'");
try {
log.info(sql.toString());
ps = conn.prepareStatement(sql.toString());
ResultSet rs=ps.executeQuery();
while(rs.next()) {
flg=rs.getInt("cnt");
}
if(flg==0) {
status="success";
}else {
status="error";
}
}catch(SQLException e) {
e.printStackTrace();
}
log.info(status);
return status;
}


public String accLockUpdate(String userid) throws UnknownHostException {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	sql.append("UPDATE USR SET NO_OF_ATTMP=(SELECT decode(NO_OF_ATTMP,null,1,0,1,1,2,2,3) FROM USR WHERE USER_ID='"+userid+"'),USER_LOCKED_FLG=(SELECT decode(NO_OF_ATTMP,3,'Y','N') FROM USR WHERE USER_ID='"+userid+"') WHERE USER_ID='"+userid+"'");
	try {
		ps = conn.prepareStatement(sql.toString());
		int rs=ps.executeUpdate();
		if(rs>0) {
			status="success";
		}else {
			status="error";
		}
	}catch(SQLException e) {
		e.printStackTrace();
	}
	return status;
}
public boolean checkDisable(String userid) {
	boolean status=true;
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	int count=0;
	sql.append("select count(*)cnt from USR where SYSDATE between DISABLE_START_DATE and DISABLE_END_DATE and USER_ID = '"+userid+"'");
	try {
		ps = conn.prepareStatement(sql.toString());
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			count=rs.getInt("CNT");
		}
		if(count>0) {
			status=true;
		}else {
			status=false;
		}
	}catch(SQLException e) {
		e.printStackTrace();
	}
	return status;
}
}
