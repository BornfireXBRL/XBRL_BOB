package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import basecode.DateFormat;
import bean.XBRLPSC0105Bean;
import bean.XBRLPSC0105Bean;
import bean.XBRLPSC0105Bean;

import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRLPSC0105Dao {
	
	static Logger log = Logger.getLogger(XBRLPSC0105Dao.class);
	
	
	public String Reporef;

	public String getReporef() {
		return Reporef;
	}

	public void setReporef(String reporef) {
		Reporef = reporef;
	}
	
	
public ArrayList<XBRLPSC0105Dao> ReporefSeq(String dt1,String dt2){
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		String status = "";
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();
		DateFormat df=new DateFormat();		
		dt1 =df.formatdate(dt1);
		dt2 =df.formatdate(dt2);
		
		ArrayList<XBRLPSC0105Dao> arl = new ArrayList<XBRLPSC0105Dao>();
		sql.append("select REPORT_REF_NO from ( select REPORT_REF_NO from PSC0105_S1_MOD_TABLE where REPORT_DATE BETWEEN '"+dt1+"' AND '"+dt2+"') union all ( select REPORT_REF_NO from PSC0105_S2_MOD_TABLE where REPORT_DATE BETWEEN '"+dt1+"' AND '"+dt2+"' )");

		//sql.append("select(select REPORT_REF_NO from PSC0105_S1_MOD_TABLE where REPORT_DATE BETWEEN '"+dt1+"' AND '"+dt2+"' GROUP BY REPORT_REF_NO ORDER BY REPORT_REF_NO)(select REPORT_REF_NO from PSC0105_S4_MOD_TABLE where REPORT_DATE BETWEEN '"+dt1+"' AND '"+dt2+"' GROUP BY REPORT_REF_NO ORDER BY REPORT_REF_NO)");

		log.info("SELECTPROFILE"+sql.toString());
		
		try {
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
		
				XBRLPSC0105Dao xel=new XBRLPSC0105Dao();
				xel.setReporef(NullCheck.isNotNull(rs.getString("REPORT_REF_NO")));
				
				
				
		
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
	
	

	
public ArrayList<XBRLPSC0105Bean> xbrlPSC0105(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
		
		
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLPSC0105Bean> arl = new ArrayList<XBRLPSC0105Bean>();
		
		String status = "";
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		
		PreparedStatement ps = null;
		
		StringBuffer sql = new StringBuffer();
		
		
		DateFormat df=new DateFormat();		
		dt1 =df.formatdate(dt1);
		dt2 =df.formatdate(dt2);
		
		 DecimalFormat dfs = new DecimalFormat("##,##.00");  
		 NullCheck chk=new NullCheck();
	
		try {
		
				
			sql.append("SELECT  INSTANCE_NAME,INSTANCE_CODE,NO_OF_APP_RECEIVED,to_char(AMT_OF_APP_RECEIVED, '9,999,999,999,990.99')AMT_OF_APP_RECEIVED,NO_OF_APP_REJECTED,to_char(AMT_OF_APP_REJECTED, '9,999,999,999,990.99')AMT_OF_APP_REJECTED,to_char(RESTRUCTURED_AMT, '9,999,999,999,990.99')RESTRUCTURED_AMT,to_char(SME_AMT, '9,999,999,999,990.99')SME_AMT,to_char(OD_AMT, '9,999,999,999,990.99')OD_AMT,to_char(FL_AMT, '9,999,999,999,990.99')FL_AMT,to_char(OTHERS_AMT, '9,999,999,999,990.99')OTHERS_AMT,to_char(TOTAL_AMT, '9,999,999,999,990.99')TOTAL_AMT FROM TABLE(PSC0105_S1_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','MUR'))");
			
		
			log.info("PSC0105 "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				XBRLPSC0105Bean xb=new XBRLPSC0105Bean();
				

				xb.setInstnam(NullCheck.isNotNull(rs.getString("INSTANCE_NAME")));
				xb.setInstno(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
				xb.setNoofaprec(NullCheck.isNotNull(rs.getString("NO_OF_APP_RECEIVED")));
				xb.setAmtofaprec(NullCheck.isNotNull(rs.getString("AMT_OF_APP_RECEIVED")));
				xb.setNoofaprej(NullCheck.isNotNull(rs.getString("NO_OF_APP_REJECTED")));
				xb.setAmtofaprej(NullCheck.isNotNull(rs.getString("AMT_OF_APP_REJECTED")));
				xb.setResamt(NullCheck.isNotNull(rs.getString("RESTRUCTURED_AMT")));
				xb.setSmamt(NullCheck.isNotNull(rs.getString("SME_AMT")));
				xb.setOdamt(NullCheck.isNotNull(rs.getString("OD_AMT")));
				xb.setFlamt(NullCheck.isNotNull(rs.getString("FL_AMT")));
				xb.setOthersamt(NullCheck.isNotNull(rs.getString("OTHERS_AMT")));
				xb.setTotamt(NullCheck.isNotNull(rs.getString("TOTAL_AMT")));
					
			
			
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
	
public ArrayList<XBRLPSC0105Bean> xbrlPSC0105s2(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {

	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLPSC0105Bean> arl = new ArrayList<XBRLPSC0105Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	
	try {
	
			
		sql.append("SELECT  INSTANCE_NAME,INSTANCE_CODE,NO_OF_APP_RECEIVED,to_char(AMT_OF_APP_RECEIVED, '9,999,999,999,990.99')AMT_OF_APP_RECEIVED,NO_OF_APP_REJECTED,to_char(AMT_OF_APP_REJECTED, '9,999,999,999,990.99')AMT_OF_APP_REJECTED,to_char(RESTRUCTURED_AMT, '9,999,999,999,990.99')RESTRUCTURED_AMT,to_char(SME_AMT, '9,999,999,999,990.99')SME_AMT,to_char(OD_AMT, '9,999,999,999,990.99')OD_AMT,to_char(FL_AMT, '9,999,999,999,990.99')FL_AMT,to_char(OTHERS_AMT, '9,999,999,999,990.99')OTHERS_AMT,to_char(TOTAL_AMT, '9,999,999,999,990.99')TOTAL_AMT FROM TABLE(PSC0105_S2_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','MUR'))");
			
	
		log.info("PSC0105 "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLPSC0105Bean xb=new XBRLPSC0105Bean();
			
			
			xb.setInstnam(NullCheck.isNotNull(rs.getString("INSTANCE_NAME")));
			xb.setInstno(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
			xb.setNoofaprec(NullCheck.isNotNull(rs.getString("NO_OF_APP_RECEIVED")));
			xb.setAmtofaprec(NullCheck.isNotNull(rs.getString("AMT_OF_APP_RECEIVED")));
			xb.setNoofaprej(NullCheck.isNotNull(rs.getString("NO_OF_APP_REJECTED")));
			xb.setAmtofaprej(NullCheck.isNotNull(rs.getString("AMT_OF_APP_REJECTED")));
			xb.setResamt(NullCheck.isNotNull(rs.getString("RESTRUCTURED_AMT")));
			xb.setSmamt(NullCheck.isNotNull(rs.getString("SME_AMT")));
			xb.setOdamt(NullCheck.isNotNull(rs.getString("OD_AMT")));
			xb.setFlamt(NullCheck.isNotNull(rs.getString("FL_AMT")));
			xb.setOthersamt(NullCheck.isNotNull(rs.getString("OTHERS_AMT")));
			xb.setTotamt(NullCheck.isNotNull(rs.getString("TOTAL_AMT")));
				
		
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

public ArrayList<XBRLPSC0105Bean> xbrlPSC0105s3(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {

	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLPSC0105Bean> arl = new ArrayList<XBRLPSC0105Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	
	try {
	
			
		sql.append("SELECT  INSTANCE_NAME,INSTANCE_CODE,to_char(AMT_PERFORMING, '9,999,999,999,990.99')AMT_PERFORMING,to_char(AMT_IMPAIRED, '9,999,999,999,990.99')AMT_IMPAIRED,NO_OF_APP_RECEIVED,to_char(AMT_OF_APP_RECEIVED, '9,999,999,999,990.99')AMT_OF_APP_RECEIVED,NO_OF_APP_REJECTED,to_char(AMT_OF_APP_REJECTED, '9,999,999,999,990.99')AMT_OF_APP_REJECTED,to_char(RESTRUCTURED_AMT, '9,999,999,999,990.99')RESTRUCTURED_AMT,to_char(SME_AMT, '9,999,999,999,990.99')SME_AMT,to_char(OD_AMT, '9,999,999,999,990.99')OD_AMT,to_char(FL_AMT, '9,999,999,999,990.99')FL_AMT,to_char(OTHERS_AMT, '9,999,999,999,990.99')OTHERS_AMT,to_char(TOTAL_AMT, '9,999,999,999,990.99')TOTAL_AMT,to_char(OUTS_SME_AMT, '9,999,999,999,990.99')OUTS_SME_AMT,to_char(OUTS_OD_AMT, '9,999,999,999,990.99')OUTS_OD_AMT,to_char(OUTS_FL_AMT, '9,999,999,999,990.99')OUTS_FL_AMT,to_char(OUTS_OTHERS_AMT, '9,999,999,999,990.99')OUTS_OTHERS_AMT,to_char(OUTS_TOTAL_AMT, '9,999,999,999,990.99')OUTS_TOTAL_AMT FROM TABLE(PSC0105_S3_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','MUR'))");
			
	
		log.info("PSC0105 "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLPSC0105Bean xb=new XBRLPSC0105Bean();
			
			
			xb.setInstnam(NullCheck.isNotNull(rs.getString("INSTANCE_NAME")));
			xb.setInstno(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
			xb.setAmtper(NullCheck.isNotNull(rs.getString("AMT_PERFORMING")));
			xb.setAmtimp(NullCheck.isNotNull(rs.getString("AMT_IMPAIRED")));
			xb.setNoofaprec(NullCheck.isNotNull(rs.getString("NO_OF_APP_RECEIVED")));
			xb.setAmtofaprec(NullCheck.isNotNull(rs.getString("AMT_OF_APP_RECEIVED")));
			xb.setNoofaprej(NullCheck.isNotNull(rs.getString("NO_OF_APP_REJECTED")));
			xb.setAmtofaprej(NullCheck.isNotNull(rs.getString("AMT_OF_APP_REJECTED")));
			xb.setResamt(NullCheck.isNotNull(rs.getString("RESTRUCTURED_AMT")));
			xb.setSmamt(NullCheck.isNotNull(rs.getString("SME_AMT")));
			xb.setOdamt(NullCheck.isNotNull(rs.getString("OD_AMT")));
			xb.setFlamt(NullCheck.isNotNull(rs.getString("FL_AMT")));
			xb.setOthersamt(NullCheck.isNotNull(rs.getString("OTHERS_AMT")));
			xb.setTotamt(NullCheck.isNotNull(rs.getString("TOTAL_AMT")));
			xb.setSmamt3(NullCheck.isNotNull(rs.getString("OUTS_SME_AMT")));
			xb.setOdamt3(NullCheck.isNotNull(rs.getString("OUTS_OD_AMT")));
			xb.setFlamt3(NullCheck.isNotNull(rs.getString("OUTS_FL_AMT")));
			xb.setOthersamt3(NullCheck.isNotNull(rs.getString("OUTS_OTHERS_AMT")));
			xb.setTotamt3(NullCheck.isNotNull(rs.getString("OUTS_TOTAL_AMT")));
				
		
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

public ArrayList<XBRLPSC0105Bean> xbrlPSC0105s4(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {

	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLPSC0105Bean> arl = new ArrayList<XBRLPSC0105Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	
	try {
	
			
		sql.append("SELECT  INSTANCE_NAME,INSTANCE_CODE,to_char(SME_AMT, '9,999,999,999,990.99')SME_AMT,to_char(MSME_AMT, '9,999,999,999,990.99')MSME_AMT FROM TABLE(PSC0105_S4_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','MUR'))");
			
	
		log.info("PSC0105 "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLPSC0105Bean xb=new XBRLPSC0105Bean();
			
			
			xb.setInstnam(NullCheck.isNotNull(rs.getString("INSTANCE_NAME")));
			xb.setInstno(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
			xb.setSmamt(NullCheck.isNotNull(rs.getString("SME_AMT")));
			xb.setMsmeamt4(NullCheck.isNotNull(rs.getString("MSME_AMT")));
			
				
		
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




public ArrayList<XBRLPSC0105Bean> xbrlPSC0105s5(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {

	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLPSC0105Bean> arl = new ArrayList<XBRLPSC0105Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	
	try {
	
			
		sql.append("SELECT  SL_NO,ACCT_NAME,TYPE_OF_ENTITY,TYPE_OF_FACILITY,to_char(REJECTED_AMT, '9,999,999,999,990.99')REJECTED_AMT,REJECTED_REASON FROM TABLE(PSC0105_S5_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','MUR'))");
			
	
		log.info("PSC0105 "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLPSC0105Bean xb=new XBRLPSC0105Bean();
			
			
			xb.setSlno5(NullCheck.isNotNull(rs.getString("SL_NO")));
			xb.setAccnam5(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
			xb.setTypofentity5(NullCheck.isNotNull(rs.getString("TYPE_OF_ENTITY")));
			xb.setTypoffacility5(NullCheck.isNotNull(rs.getString("TYPE_OF_FACILITY")));
			xb.setRejamt5(NullCheck.isNotNull(rs.getString("REJECTED_AMT")));
			xb.setRejreason5(NullCheck.isNotNull(rs.getString("REJECTED_REASON")));
				
		
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







public ArrayList<XBRLPSC0105Bean> xbrlPSC0105d1(String reptype,String ReporefSeq,String instno,String dt2,String dt1,String curr) {
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLPSC0105Bean> arl = new ArrayList<XBRLPSC0105Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	NullCheck chk=new NullCheck();

	try {
	/*	'BLS0106','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))"
*/			
		sql.append("select /* +FIRST_ROWS(100) */ACCT_NUMBER,ACCT_NAME,SCHM_CODE,SCHM_TYPE,ISIC_CODE,SME_FLG,to_char(OUTSTANDING_AMT, '9,999,999,999,990.99')OUTSTANDING_AMT,IMPAIRED_FLAG,to_char(ACCT_OPN_DATE,'DD-MM-YYYY')ACCT_OPN_DATE,RENEWAL_DATE,SECURITY_FLG,RESTRUCTURED_FLG,to_char(RESTRUCTURED_DATE,'DD-MM-YYYY')RESTRUCTURED_DATE,to_char(SANCTION_AMT, '9,999,999,999,990.99')SANCTION_AMT,ACCT_CRNCY_CODE,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE  from table(PSC0105_S1_DTL_FUN('PSC0105','"+chk.notZero(ReporefSeq)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
	
		log.info("PSC0105d1 "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLPSC0105Bean xb=new XBRLPSC0105Bean();

			xb.setAccno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
			xb.setAcnam(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
			xb.setScode(NullCheck.isNotNull(rs.getString("SCHM_CODE")));
			xb.setStype(NullCheck.isNotNull(rs.getString("SCHM_TYPE")));
			xb.setIscode(NullCheck.isNotNull(rs.getString("ISIC_CODE")));
			xb.setSflag(NullCheck.isNotNull(rs.getString("SME_FLG")));
			xb.setOutamt(NullCheck.isNotNull(rs.getString("OUTSTANDING_AMT")));
			xb.setImpflg(NullCheck.isNotNull(rs.getString("IMPAIRED_FLAG")));
			xb.setAccopndat(NullCheck.isNotNull(rs.getString("ACCT_OPN_DATE")));
		
			xb.setRendat(NullCheck.isNotNull(rs.getString("RENEWAL_DATE")));
			xb.setSecflg(NullCheck.isNotNull(rs.getString("SECURITY_FLG")));
			xb.setReflg(NullCheck.isNotNull(rs.getString("RESTRUCTURED_FLG")));
			xb.setResdat(NullCheck.isNotNull(rs.getString("RESTRUCTURED_DATE")));
			xb.setSanamt(NullCheck.isNotNull(rs.getString("SANCTION_AMT")));
			xb.setAcccrcode(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
			xb.setRepdat(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
			
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




public ArrayList<XBRLPSC0105Bean> xbrlPSC0105d2(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLPSC0105Bean> arl = new ArrayList<XBRLPSC0105Bean>();
	NullCheck chk=new NullCheck();
	
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();
	
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	//sql.append("SELECT * FROM TABLE(PSC0105_DTL_FUN('PSC0105','0','0','31-AUG-2018','01-AUG-2018','31-AUG-2018','MUR'))");
		
	sql.append("SELECT /* +FIRST_ROWS(110) */  APPLICATION_NO,ENTITY_NAME,ENTITY_TYPE,FACILITY_TYPE,to_char(FACILITY_AMT, '9,999,999,999,990.99')FACILITY_AMT,REJ_REASON,to_char(APP_RECEIVED_DT,'DD-MM-YYYY')APP_RECEIVED_DT,to_char(APP_REJ_DT,'DD-MM-YYYY')APP_REJ_DT,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE FROM TABLE(PSC0105_S2_DTL_FUN('PSC0105','"+ReporefSeq+"','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");		log.info("DOC&&&&SELECT"+sql.toString());
	log.info("DOC&&&&SELECT Gayu"+sql.toString());
	
	try {
		
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		
		XBRLPSC0105Bean xb=new XBRLPSC0105Bean();
		xb.setAppno(NullCheck.isNotNull(rs.getString("APPLICATION_NO")));
		xb.setEntnam(NullCheck.isNotNull(rs.getString("ENTITY_NAME")));
		xb.setEntflg(NullCheck.isNotNull(rs.getString("ENTITY_TYPE")));
		xb.setFactyp(NullCheck.isNotNull(rs.getString("FACILITY_TYPE")));
		xb.setFacamt(NullCheck.isNotNull(rs.getString("FACILITY_AMT")));
		xb.setRejreason(NullCheck.isNotNull(rs.getString("REJ_REASON")));
		xb.setAprecdate(NullCheck.isNotNull(rs.getString("APP_RECEIVED_DT")));
		xb.setAprejdat(NullCheck.isNotNull(rs.getString("APP_REJ_DT")));
		xb.setRepdat(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
		
		
		
	
		
		
		
		 arl.add(xb);
	}
	}catch(SQLException e){
		e.printStackTrace();
	}
		
	
	finally {

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


public ArrayList<XBRLPSC0105Bean> xbrlpsc105(String dt1,String dt2,String reprefno,String instno,String curr) {

HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

ArrayList<XBRLPSC0105Bean> arl = new ArrayList<XBRLPSC0105Bean>();
NullCheck chk=new NullCheck();


String status = "";

ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();

PreparedStatement ps = null;

StringBuffer sql = new StringBuffer();


DateFormat df=new DateFormat();

dt1 =df.formatdate(dt1);
dt2 =df.formatdate(dt2);

//sql.append("SELECT * FROM TABLE(PSC0105_DTL_FUN('PSC0105','0','0','31-AUG-2018','01-AUG-2018','31-AUG-2018','MUR'))";

sql.append("select /* +FIRST_ROWS(100) */ACCT_NUMBER,ACCT_NAME,SCHM_CODE,SCHM_TYPE,ISIC_CODE,SME_FLG,to_char(OUTSTANDING_AMT, '9,999,999,999,990.99')OUTSTANDING_AMT,IMPAIRED_FLAG,to_char(ACCT_OPN_DATE,'DD-MM-YYYY')ACCT_OPN_DATE,RENEWAL_DATE,SECURITY_FLG,RESTRUCTURED_FLG,to_char(RESTRUCTURED_DATE,'DD-MM-YYYY')RESTRUCTURED_DATE,to_char(SANCTION_AMT, '9,999,999,999,990.99')SANCTION_AMT,ACCT_CRNCY_CODE,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE  from table(PSC0105_S1_DTL_FUN('PSC0105','0','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
log.info("DOC&&&&SELECT Gayu"+sql.toString());
try {
ps=conn.prepareStatement(sql.toString());

    ResultSet rs=ps.executeQuery();
     

while(rs.next()){

XBRLPSC0105Bean xb=new XBRLPSC0105Bean();

xb.setAccno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
xb.setAcnam(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
xb.setScode(NullCheck.isNotNull(rs.getString("SCHM_CODE")));
xb.setStype(NullCheck.isNotNull(rs.getString("SCHM_TYPE")));
xb.setIscode(NullCheck.isNotNull(rs.getString("ISIC_CODE")));
xb.setSflag(NullCheck.isNotNull(rs.getString("SME_FLG")));
xb.setOutamt(NullCheck.isNotNull(rs.getString("OUTSTANDING_AMT")));
xb.setImpflg(NullCheck.isNotNull(rs.getString("IMPAIRED_FLAG")));
xb.setAccopndat(NullCheck.isNotNull(rs.getString("ACCT_OPN_DATE")));

xb.setRendat(NullCheck.isNotNull(rs.getString("RENEWAL_DATE")));
xb.setSecflg(NullCheck.isNotNull(rs.getString("SECURITY_FLG")));
xb.setReflg(NullCheck.isNotNull(rs.getString("RESTRUCTURED_FLG")));
xb.setResdat(NullCheck.isNotNull(rs.getString("RESTRUCTURED_DATE")));
xb.setSanamt(NullCheck.isNotNull(rs.getString("SANCTION_AMT")));
xb.setAcccrcode(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
xb.setRepdat(NullCheck.isNotNull(rs.getString("REPORT_DATE")));





arl.add(xb);
}
}catch(SQLException e){
e.printStackTrace();
}


finally {

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



public ArrayList<XBRLPSC0105Bean> xbrlpsc105s2(String dt1,String dt2,String reprefno,String instno,String curr) {

HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

ArrayList<XBRLPSC0105Bean> arl = new ArrayList<XBRLPSC0105Bean>();
NullCheck chk=new NullCheck();


String status = "";

ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();

PreparedStatement ps = null;

StringBuffer sql = new StringBuffer();


DateFormat df=new DateFormat();

dt1 =df.formatdate(dt1);
dt2 =df.formatdate(dt2);

//sql.append("SELECT * FROM TABLE(PSC0105_DTL_FUN('PSC0105','0','0','31-AUG-2018','01-AUG-2018','31-AUG-2018','MUR'))";

sql.append("SELECT /* +FIRST_ROWS(110) */  APPLICATION_NO,ENTITY_NAME,ENTITY_TYPE,FACILITY_TYPE,to_char(FACILITY_AMT, '9,999,999,999,990.99')FACILITY_AMT,REJ_REASON,to_char(APP_RECEIVED_DT,'DD-MM-YYYY')APP_RECEIVED_DT,to_char(APP_REJ_DT,'DD-MM-YYYY')APP_REJ_DT,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE FROM TABLE(PSC0105_S2_DTL_FUN('PSC0105','0','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");		log.info("DOC&&&&SELECT"+sql.toString());
log.info("DOC&&&&SELECT Gayu"+sql.toString());
try {
ps=conn.prepareStatement(sql.toString());

    ResultSet rs=ps.executeQuery();
     

while(rs.next()){

XBRLPSC0105Bean xb=new XBRLPSC0105Bean();
xb.setAppno(NullCheck.isNotNull(rs.getString("APPLICATION_NO")));
xb.setEntnam(NullCheck.isNotNull(rs.getString("ENTITY_NAME")));
xb.setEntflg(NullCheck.isNotNull(rs.getString("ENTITY_TYPE")));
xb.setFactyp(NullCheck.isNotNull(rs.getString("FACILITY_TYPE")));
xb.setFacamt(NullCheck.isNotNull(rs.getString("FACILITY_AMT")));
xb.setRejreason(NullCheck.isNotNull(rs.getString("REJ_REASON")));
xb.setAprecdate(NullCheck.isNotNull(rs.getString("APP_RECEIVED_DT")));
xb.setAprejdat(NullCheck.isNotNull(rs.getString("APP_REJ_DT")));
xb.setRepdat(NullCheck.isNotNull(rs.getString("REPORT_DATE")));




arl.add(xb);
}
}catch(SQLException e){
e.printStackTrace();
}


finally {

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
