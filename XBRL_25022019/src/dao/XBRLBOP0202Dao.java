package dao;



import java.sql.CallableStatement;

/****************************************************************************************************************
*																												*
* 	* @companyName 			:	Bonfire Innovation Private Limited Chennai										*
* 	* @project 				:	Extensible Business Reporting Language (XBRL)									*
* 	* @name 				:	XBRLSUP1400Action.java															*
* 	* @path 				:	action																			*
* 	* @author 				:	D PraveenBabu																	*
* 	* @version 				: 	1.0																				*
* 	* @functionality 		:	It contains the action with multiple methods to create SUP01400 Report.													*
* 	* @relatedScripts 		: 	bean.XBRLSUP1400Bean.java,dao.XBRLSUP1400Dao.java 								*
* 	* @creationDate 		:																					*
* 	* @lastModifiedDate 	:																					*
* 	* @modificationHistory 	: 																					*
*																												*
****************************************************************************************************************/

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
import bean.XBRLBOPBean;
import bean.XBRLBOP0202Bean;

import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRLBOP0202Dao  {
	
	static Logger log = Logger.getLogger(XBRLBOP0202Dao.class);
	
public String Reporef;
	
	
	public String getReporef() {
		return Reporef;
	}

	public void setReporef(String reporef) {
		Reporef = reporef;
	}

	
	
	
	public ArrayList<XBRLBOP0202Dao> ReporefSeq(String dt1, String dt2) {

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		String status = "";

		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();
		DateFormat df = new DateFormat();
		dt1 = df.formatdate(dt1);
		dt2 = df.formatdate(dt2);

		ArrayList<XBRLBOP0202Dao> arl = new ArrayList<XBRLBOP0202Dao>();
		sql.append("select REPORT_REF_NO from BOP0202_MOD_TABLE where REPORT_DATE='" + dt2 + "' ORDER BY REPORT_REF_NO");

		log.info("SELECTPROFILE" + sql.toString());

		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLBOP0202Dao xel = new XBRLBOP0202Dao();
				xel.setReporef(NullCheck.isNotNull(rs.getString("REPORT_REF_NO")));

				arl.add(xel);
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

	
	
	
public ArrayList<XBRLBOP0202Bean> xbrlfimsumEP1(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
	
	log.info("FIM SUMMARY List Data AB " + dt1 + "dt22222" + dt2);
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLBOP0202Bean> arl = new ArrayList<XBRLBOP0202Bean>();
	
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
	
		
		log.info("Gnana" + ReporefSeq.trim());
		
		
		
			sql.append("SELECT /* +FIRST_ROWS(500) */DYNAMIC_DOMAIN,SL_NO,NAME_OF_INSTITUTE,UNIQUE_ID,COUNTRY,TYPE_OF_TRANSACTION,PCNT_SHARE_OPN,PCNT_SHARE_CLS,OPN_POSITION,ADDITIONS,REDUCTIONS,OTH_CHG_IN_VOL,REVALUATION,CLOSING_POSITION FROM TABLE(BOP0202_RPT_FUN('"+reptype+"','"+chk.notZero(ReporefSeq.trim())+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
		
		
		
		log.info("FIM SUMMARY "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
		
			XBRLBOP0202Bean xb=new XBRLBOP0202Bean();
			
		
			xb.setDynamicdomain(NullCheck.isNotNull(rs.getString("DYNAMIC_DOMAIN")));
			xb.setSrno(NullCheck.isNotNull(rs.getString("SL_NO")));
			xb.setInstname(NullCheck.isNotNull(rs.getString("NAME_OF_INSTITUTE")));
			xb.setUnid(NullCheck.isNotNull(rs.getString("UNIQUE_ID")));
			xb.setCntry(NullCheck.isNotNull(rs.getString("COUNTRY")));

			xb.setTrantyp(NullCheck.isNotNull(rs.getString("TYPE_OF_TRANSACTION")));
			xb.setPeropnpos(NullCheck.isNotNull(rs.getString("PCNT_SHARE_OPN")));			
			xb.setPerclspos(NullCheck.isNotNull(rs.getString("PCNT_SHARE_CLS")));
			
			xb.setOpnposs(NullCheck.isNotNull(rs.getString("OPN_POSITION")));			
			xb.setAddtns(NullCheck.isNotNull(rs.getString("ADDITIONS")));			
			xb.setRedctns(NullCheck.isNotNull(rs.getString("REDUCTIONS")));			
			xb.setOthrchnges(NullCheck.isNotNull(rs.getString("OTH_CHG_IN_VOL")));			
			xb.setRevchnge(NullCheck.isNotNull(rs.getString("REVALUATION")));
			xb.setClspos(NullCheck.isNotNull(rs.getString("CLOSING_POSITION")));			
		
			arl.add(xb);
		   
		}
	
	
	log.info("ARLLL"+arl.size());
	
	
	
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

public ArrayList<XBRLBOP0202Bean> xbrlbop0202details(String reptype,String ReporefSeq,String instno,String dt2,String dt1,String curr) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("reptype    " + reptype + "ReporefSeq   " + ReporefSeq + "instno   " + instno + "dt2     " + dt2 +  "dt1    " + dt1);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLBOP0202Bean> arl = new ArrayList<XBRLBOP0202Bean>();
		NullCheck chk=new NullCheck();
		String status = "";
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		
		PreparedStatement ps = null;
		
		StringBuffer sql = new StringBuffer();
		
		
		DateFormat df=new DateFormat();		
		dt1 =df.formatdate(dt1);
		dt2 =df.formatdate(dt2);
		
		 DecimalFormat dfs = new DecimalFormat("##,##.00");  
		
	
		try {
		
			
			log.info("AJAX DETAILS GNANA" + ReporefSeq );
			
			
		
		
			sql.append("SELECT /* +FIRST_ROWS(500) */NAME_INS,UNIQ_ID,CNTRY,TRAN_TYPE,SHR_OPN_PCNT,SHR_CLS_PCNT,OPN_POS,ADDNS,REDNS,OTH_VOL_CHG,REVAL,CLS_POS,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE FROM TABLE(BOP0202_DTL_FUN('"+reptype+"','"+ReporefSeq+"','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
			log.info("PYM Vinoth Kumar  "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				XBRLBOP0202Bean xb=new XBRLBOP0202Bean();
	

			
				xb.setInstname(NullCheck.isNotNull(rs.getString("NAME_INS")));
				xb.setUnid(NullCheck.isNotNull(rs.getString("UNIQ_ID")));
				xb.setCntry(NullCheck.isNotNull(rs.getString("CNTRY")));

				xb.setTrantyp(NullCheck.isNotNull(rs.getString("TRAN_TYPE")));
				xb.setPeropnpos(NullCheck.isNotNull(rs.getString("SHR_OPN_PCNT")));			
				xb.setPerclspos(NullCheck.isNotNull(rs.getString("SHR_CLS_PCNT")));
				
				xb.setOpnposs(NullCheck.isNotNull(rs.getString("OPN_POS")));			
				xb.setAddtns(NullCheck.isNotNull(rs.getString("ADDNS")));			
				xb.setRedctns(NullCheck.isNotNull(rs.getString("REDNS")));			
				xb.setOthrchnges(NullCheck.isNotNull(rs.getString("OTH_VOL_CHG")));			
				xb.setRevchnge(NullCheck.isNotNull(rs.getString("REVAL")));
				xb.setClspos(NullCheck.isNotNull(rs.getString("CLS_POS")));	
				xb.setReportsd(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
				arl.add(xb);
			    
			}
		
		
		log.info("ARLLL"+arl.size());
		
		
		
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


public ArrayList<XBRLBOP0202Bean> xbrlbop202xcl(String reptype,String ReporefSeq,String instno,String dt2,String dt1,String curr) {
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLBOP0202Bean> arl = new ArrayList<XBRLBOP0202Bean>();
	NullCheck chk=new NullCheck();
	log.info("hjghhj");
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();
	log.info(dt1);
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	sql.append("SELECT /* +FIRST_ROWS(500) */NAME_INS,UNIQ_ID,CNTRY,TRAN_TYPE,SHR_OPN_PCNT,SHR_CLS_PCNT,OPN_POS,ADDNS,REDNS,OTH_VOL_CHG,REVAL,CLS_POS,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE FROM TABLE(BOP0202_DTL_FUN('"+reptype+"','"+ReporefSeq+"','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
		
log.info("DOC&&&&SELECT Gayu"+sql.toString());
	
	try {
		
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		
		XBRLBOP0202Bean xb=new XBRLBOP0202Bean();

		
		xb.setInstname(NullCheck.isNotNull(rs.getString("NAME_INS")));
		xb.setUnid(NullCheck.isNotNull(rs.getString("UNIQ_ID")));
		xb.setCntry(NullCheck.isNotNull(rs.getString("CNTRY")));

		xb.setTrantyp(NullCheck.isNotNull(rs.getString("TRAN_TYPE")));
		xb.setPeropnpos(NullCheck.isNotNull(rs.getString("SHR_OPN_PCNT")));			
		xb.setPerclspos(NullCheck.isNotNull(rs.getString("SHR_CLS_PCNT")));
		
		xb.setOpnposs(NullCheck.isNotNull(rs.getString("OPN_POS")));			
		xb.setAddtns(NullCheck.isNotNull(rs.getString("ADDNS")));			
		xb.setRedctns(NullCheck.isNotNull(rs.getString("REDNS")));			
		xb.setOthrchnges(NullCheck.isNotNull(rs.getString("OTH_VOL_CHG")));			
		xb.setRevchnge(NullCheck.isNotNull(rs.getString("REVAL")));
		xb.setClspos(NullCheck.isNotNull(rs.getString("CLS_POS")));	
		xb.setReportsd(NullCheck.isNotNull(rs.getString("REPORT_DATE")));	
	
		
		
		
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




public String detailBOP0202saves() {

ConnectionManager connmgr=new ConnectionManager();
Connection conn=connmgr.getConnection();
		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("{call FINAL_REPORT_UPDATE_SP('"+request.getParameter("reptype")+"','"+NullCheck.isNotZero(request.getParameter("refno"))+"','"+df.formatdate(request.getParameter("dt2"))+"','"+df.formatdate(request.getParameter("dt1"))+"','"+df.formatdate(request.getParameter("dt2"))+"','"+request.getParameter("curr")+"')}");
		
		try {
		

			CallableStatement pstmt = conn.prepareCall("{call FINAL_REPORT_UPDATE_SP(?,?,?,?,?,?)}");
			pstmt.setString(1, request.getParameter("reptype"));
			pstmt.setString(2, NullCheck.isNotZero(request.getParameter("refno")));
			pstmt.setString(3, df.formatdate(request.getParameter("dt2")));
			pstmt.setString(4, df.formatdate(request.getParameter("dt1")));
			pstmt.setString(5, df.formatdate(request.getParameter("dt2")));
			pstmt.setString(6, request.getParameter("curr"));

			pstmt.executeUpdate();

			pstmt.close();
			conn.close();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {

				}
			}
		}
		return "success";
	}



}


