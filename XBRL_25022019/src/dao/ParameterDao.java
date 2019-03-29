package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import bean.XBRLPARAMBean;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class ParameterDao {
	static Logger log = Logger.getLogger(ParameterDao.class);
	
	public String parm;
	public int parms;
	
	
	


public String getParm() {
		return parm;
	}



	public void setParm(String parm) {
		this.parm = parm;
	}



	public int getParms() {
		return parms;
	}



	public void setParms(int parms) {
		this.parms = parms;
	}



public ArrayList<ParameterDao> parm(){
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		String status = "";
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();
		
		
		ArrayList<ParameterDao> arl = new ArrayList<ParameterDao>();
		sql.append("select REF_CODE from REF_CODE_MASTER GROUP BY REF_CODE ORDER BY REF_CODE");
		
		log.info("SELECTPROFILE"+sql.toString());
		
		try {
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
		
				ParameterDao xel=new ParameterDao();
				//xel.setReporef(NullCheck.isNotNull(rs.getString("REF_CODE")));
				
				
				
				xel.setParm(NullCheck.isNotNull(rs.getString("REF_CODE")));
				
				
				
				
		
		arl.add(xel);
			}
		}catch (SQLException e) {
			
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



public String ParmcriteriaCheck(){
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	
	
	
	sql.append("select count(ACCT_OPN_DATE) as parmeter from LOAN_MASTER_TABLE where ACCT_OPN_DATE = '"+request.getParameter("dt1")+"' ORDER BY ACCT_OPN_DATE ASC ");
	
	log.info("SELECTPROFILE"+sql.toString());
	
	try {
		ps=conn.prepareStatement(sql.toString());
		
	   
	     

	    ResultSet rs = ps.executeQuery();
		if (rs.next()) {						
			parms = rs.getInt("parmeter"); 
		
			log.info("FUNnnn------====="+parms);
	}
	}catch (SQLException e) {
		
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




public ArrayList<XBRLPARAMBean> xbrefcode(){
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	
	
	ArrayList<XBRLPARAMBean> arl = new ArrayList<XBRLPARAMBean>();
	sql.append("select REF_CODE_TYPE,REF_CODE,REF_CODE_DESC,SOURCE_SYS_CODE from GEN_REF_CODE_MAST_TB GROUP BY REF_CODE_TYPE,REF_CODE,REF_CODE_DESC,SOURCE_SYS_CODE ORDER BY REF_CODE_TYPE");
	
	log.info("SELECTPROFILE"+sql.toString());
	
	try {
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
	
			XBRLPARAMBean xel=new XBRLPARAMBean();
			
			
			
			xel.setRefCode(NullCheck.isNotNull(rs.getString("REF_CODE_TYPE")));
			xel.setRefCodes(NullCheck.isNotNull(rs.getString("REF_CODE")));
			xel.setRefCodedisc(NullCheck.isNotNull(rs.getString("REF_CODE_DESC")));
			xel.setSourceSyscode(NullCheck.isNotNull(rs.getString("SOURCE_SYS_CODE")));
			
			
	
	arl.add(xel);
		}
	}catch (SQLException e) {
		
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
