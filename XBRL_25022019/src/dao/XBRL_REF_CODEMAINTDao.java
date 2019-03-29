package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import basecode.DateFormat;
import bean.XBRL_REF_CODEMAINTBean;
import utilities.ConnectionManager;
import utilities.NullCheck;

import org.apache.log4j.Logger;
public class XBRL_REF_CODEMAINTDao extends ActionSupport{
	
	static Logger log = Logger.getLogger(XBRL_REF_CODEMAINTDao.class);
	
	public ArrayList<XBRL_REF_CODEMAINTBean> listDetails(String type, String refcode,String replev ) {
		
		ArrayList<XBRL_REF_CODEMAINTBean> arl = new ArrayList<XBRL_REF_CODEMAINTBean>();

		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();

	
		switch(type){
		case "cancel":
		
		default:
			sql.append("select * from XBRL_REP_REF_CODE_TABLE WHERE DEL_FLG='N' and REPORT_CODE='"+refcode+"' and REF_LEVEL='"+replev+"'");
	        break; 
		}

		try {
			log.info(sql.toString());
			ps = conn.prepareStatement(sql.toString());
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				XBRL_REF_CODEMAINTBean umb = new XBRL_REF_CODEMAINTBean();
				umb.setRepcode(NullCheck.isNotNull(rs.getString("REPORT_CODE")));
				umb.setRepcodelvl(NullCheck.isNotNull(rs.getString("REF_LEVEL")));
				umb.setRefcode(NullCheck.isNotNull(rs.getString("REF_CODE")));
				umb.setRefdesc1(NullCheck.isNotNull(rs.getString("REF_DESC_1")));
				umb.setRemarks(NullCheck.isNotNull(rs.getString("REMARKS")));
				umb.setStatus(NullCheck.isNotNull(rs.getString("DEL_FLG")));
				umb.setHeaderflg(NullCheck.isNotNull(rs.getString("HEADER_FLG")));
				umb.setRefdesc2(NullCheck.isNotNull(rs.getString("REF_DESC_2")));
				umb.setRefdesc3(NullCheck.isNotNull(rs.getString("REF_DESC_3")));
				umb.setEntitycreflg(NullCheck.isNotNull(rs.getString("ENTITY_FLG")));
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


public XBRL_REF_CODEMAINTBean detailsbean(String refcode) {
	
	ArrayList<XBRL_REF_CODEMAINTBean> arl = new ArrayList<XBRL_REF_CODEMAINTBean>();

	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	XBRL_REF_CODEMAINTBean umb = new XBRL_REF_CODEMAINTBean();

		sql.append("select * from XBRL_REP_REF_CODE_TABLE where REF_CODE='"+refcode+"'");
       
	

	try {
		log.info(sql.toString());
		ps = conn.prepareStatement(sql.toString());
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			
			umb.setRepcode(NullCheck.isNotNull(rs.getString("REPORT_CODE")));
			umb.setRepcodelvl(NullCheck.isNotNull(rs.getString("REF_LEVEL")));
			umb.setRefcode(NullCheck.isNotNull(rs.getString("REF_CODE")));
			umb.setRefdesc1(NullCheck.isNotNull(rs.getString("REF_DESC_1")));
			umb.setRemarks(NullCheck.isNotNull(rs.getString("REMARKS")));
			umb.setStatus(NullCheck.isNotNull(rs.getString("DEL_FLG")));
			umb.setHeaderflg(NullCheck.isNotNull(rs.getString("HEADER_FLG")));
			umb.setRefdesc2(NullCheck.isNotNull(rs.getString("REF_DESC_2")));
			umb.setRefdesc3(NullCheck.isNotNull(rs.getString("REF_DESC_3")));
		umb.setEntitycreflg(NullCheck.isNotNull(rs.getString("ENTITY_FLG")));
		umb.setEntryuser(NullCheck.isNotNull(rs.getString("ENTRY_USER")));
		umb.setEntrytime(NullCheck.isNotNull(rs.getString("ENTRY_TIME")));
		umb.setModifyuser(NullCheck.isNotNull(rs.getString("MODIFY_USER")));
		umb.setModifytime(NullCheck.isNotNull(rs.getString("MODIFY_TIME")));
umb.setVerifyuser(NullCheck.isNotNull(rs.getString("VERIFY_USER")));
umb.setVerifytime(NullCheck.isNotNull(rs.getString("VERIFY_TIME")));
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

	return umb;

}

public String refcodeupdate(XBRL_REF_CODEMAINTBean ub,String type) {
	String status="";
	PreparedStatement ps=null;
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();  
	StringBuffer sql=new StringBuffer();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	if(type.equals("verify")) {
		sql.append("UPDATE XBRL_REP_REF_CODE_TABLE SET ENTITY_FLG='Y',VERIFY_USER='"+session.getAttribute("userName")+"',VERIFY_TIME=current_timestamp WHERE REF_CODE='"+ub.getRefcode()+"'");
	}else if(type.equals("add")){
		sql.append("INSERT INTO XBRL_REP_REF_CODE_TABLE(REPORT_CODE,REF_LEVEL,REF_DESC_1,REF_DESC_2,REF_DESC_3,REMARKS,HEADER_FLG,REF_CODE,ENTRY_USER,ENTRY_TIME,DEL_FLG,ENTITY_FLG) ");
	sql.append("VALUES('"+ub.getRepcode()+"','"+ub.getRepcodelvl()+"','"+ub.getRefdesc1()+"','"+ub.getRefdesc2()+"','"+ub.getRefdesc3()+"','"+ub.getRemarks()+"','"+ub.getHeaderflg()+"','"+ub.getRefcode()+"','"+session.getAttribute("userName")+"',current_timestamp,'N','N')");
	}
		else {
	
		sql.append("UPDATE XBRL_REP_REF_CODE_TABLE SET REPORT_CODE='"+ub.getRepcode()+"',REF_LEVEL='"+ub.getRepcodelvl()+"',REF_DESC_1='"+ub.getRefdesc1()+"',REF_DESC_2='"+ub.getRefdesc2()+"',REF_DESC_3='"+ub.getRefdesc3()+"',REMARKS='"+ub.getRemarks()+"',HEADER_FLG='"+ub.getHeaderflg()+"',MODIFY_USER='"+session.getAttribute("userName")+"',MODIFY_TIME=current_timestamp,ENTITY_FLG='N' WHERE REF_CODE='"+ub.getRefcode()+"'");
	}
	
	try {
		log.info(sql.toString());
		ps = conn.prepareStatement(sql.toString());
		ResultSet rs=ps.executeQuery();
		status="success";
	}catch(SQLException e) {
		e.printStackTrace();
		status="error";
	}finally {

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





/************************************* start refcode  and ref level maintain refcode ajax ******************************************/

public ArrayList<XBRL_REF_CODEMAINTBean> repcodmain(String entyflg){
	
	
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRL_REF_CODEMAINTBean> arl = new ArrayList<XBRL_REF_CODEMAINTBean>();
		
		String status = "";
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		
		PreparedStatement ps = null;
		
		StringBuffer sql = new StringBuffer();
		
		
		DateFormat df=new DateFormat();		
		
		
		/* DecimalFormat dfs = new DecimalFormat("##,##.00");  */
		 NullCheck chk=new NullCheck();
	
		try {
		
				sql.append("select DISTINCT REPORT_CODE,REPORT_NAME from XBRL_REP_REF_CODE_TABLE WHERE DEL_FLG='"+entyflg+"'");
				
				
			log.info("REPORT CODE"+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				XBRL_REF_CODEMAINTBean xb=new XBRL_REF_CODEMAINTBean();
				
			
				xb.setRepcode(NullCheck.isNotNull(rs.getString("REPORT_CODE")));
					xb.setRepname(NullCheck.isNotNull(rs.getString("REPORT_NAME")));
				arl.add(xb);
			   
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



public ArrayList<XBRL_REF_CODEMAINTBean> replevel(String repcodlev){
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRL_REF_CODEMAINTBean> arl = new ArrayList<XBRL_REF_CODEMAINTBean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	
	
	/* DecimalFormat dfs = new DecimalFormat("##,##.00");  */
	 NullCheck chk=new NullCheck();

	try {
	
			sql.append("select DISTINCT REF_LEVEL from XBRL_REP_REF_CODE_TABLE WHERE DEL_FLG='N' and  REPORT_CODE='"+repcodlev+"'");
			
			
			log.info("REPORT CODE"+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRL_REF_CODEMAINTBean xb=new XBRL_REF_CODEMAINTBean();
			
		
			xb.setRepcodelvl(NullCheck.isNotNull(rs.getString("REF_LEVEL")));
				
			arl.add(xb);
		   
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

	
/************************************* End refcode maintain refcode ajax ******************************************/



}
