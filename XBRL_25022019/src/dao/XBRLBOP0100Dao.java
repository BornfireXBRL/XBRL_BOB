package dao;


import java.sql.CallableStatement;

/****************************************************************************************************************
*																												*
* 	* @companyName 			:	Bonfire Innovation Private Limited Chennai										*
* 	* @project 				:	Extensible Business Reporting Language (XBRL)									*
* 	* @name 				:	XBRLBOP0100Action.java															*
* 	* @path 				:	action																			*
* 	* @author 				:	D PraveenBabu																	*
* 	* @version 				: 	1.0																				*
* 	* @functionality 		:	It contains the action with multiple methods to create SUP01400 Report.													*
* 	* @relatedScripts 		: 	bean.XBRLBLS100Bean.java,dao.XBRLBOP0100Dao.java 								*
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

import com.google.gson.Gson;

import basecode.DateFormat;
import bean.XBRLBOP0100Bean;

import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRLBOP0100Dao {
	static Logger log = Logger.getLogger(XBRLBOP0100Dao.class);
	public String Reporef;

	public String getReporef() {
		return Reporef;
	}

	public void setReporef(String reporef) {
		Reporef = reporef;
	}
	
	public ArrayList<XBRLBOP0100Dao> ReporefSeq(String dt1, String dt2) {

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

		ArrayList<XBRLBOP0100Dao> arl = new ArrayList<XBRLBOP0100Dao>();
		sql.append("select REPORT_REF_NO from BOP0100_MOD_TABLE where REPORT_DATE='" + dt2 + "' ORDER BY REPORT_REF_NO");

		log.info("SELECTPROFILE" + sql.toString());

		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLBOP0100Dao xel = new XBRLBOP0100Dao();
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


	
public ArrayList<XBRLBOP0100Bean> xbrlBOP0100(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
		
		
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLBOP0100Bean> arl = new ArrayList<XBRLBOP0100Bean>();
		
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
		
				
				//sql.append("select SL_NO,CUST_NAME,RESIDENT_STATUS,COUNTRY,UNIQUE_IDENTITY,ISIC_CODE,ACCT_NUMBER,GROUP_CODE,to_char(OUTSTANDING_AMT, '9,999,999,999,990.99')OUTSTANDING_AMT,to_char(OUTSTANDING_NFB_AMT, '9,999,999,999,990.99')OUTSTANDING_NFB_AMT  from table(PSC0200_S1_RPT_FUN('"+reptype+"','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
				
				sql.append("SELECT INSTANCE_NAME,INSTANCE_CODE,to_char(FIN_GBC1, '9,999,999,999,990.99')FIN_GBC1,to_char(NONFIN_GBC1, '9,999,999,999,990.99')NONFIN_GBC1,to_char(GBC2, '9,999,999,999,990.99')GBC2,to_char(TRUSTS_NR_GBC, '9,999,999,999,990.99')TRUSTS_NR_GBC,to_char(NON_BNK, '9,999,999,999,990.99')NON_BNK,to_char(CREDIT_UNIONS, '9,999,999,999,990.99')CREDIT_UNIONS,to_char(INSURANCE_CORP, '9,999,999,999,990.99')INSURANCE_CORP,to_char(PENSION, '9,999,999,999,990.99')PENSION,to_char(INVESTMENT, '9,999,999,999,990.99')INVESTMENT,to_char(FINANCIAL_AUX, '9,999,999,999,990.99')FINANCIAL_AUX,to_char(CENTRAL_GOV, '9,999,999,999,990.99')CENTRAL_GOV,to_char(STATE_LOC_GOV, '9,999,999,999,990.99')STATE_LOC_GOV,to_char(PUBLIC_NON_FIN_CORP, '9,999,999,999,990.99')PUBLIC_NON_FIN_CORP,to_char(OTH_NON_FIN_CORP, '9,999,999,999,990.99')OTH_NON_FIN_CORP,to_char(HOUSEHOLD, '9,999,999,999,990.99')HOUSEHOLD,to_char(NON_PROF_INSTITUTE, '9,999,999,999,990.99')NON_PROF_INSTITUTE, 0 AS TOTAL FROM TABLE(BOP0100_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
				
				
			log.info("BOP0100 sec1 "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				XBRLBOP0100Bean xb=new XBRLBOP0100Bean();
				
			
				xb.setInstname(NullCheck.isNotNull(rs.getString("INSTANCE_NAME")));
				xb.setInstno(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
				xb.setFingbc1s(NullCheck.isNotNull(rs.getString("FIN_GBC1")));
				xb.setNonfingbc1s(NullCheck.isNotNull(rs.getString("NONFIN_GBC1")));
				xb.setGbc2s(NullCheck.isNotNull(rs.getString("GBC2")));
				xb.setTrnrsetben(NullCheck.isNotNull(rs.getString("TRUSTS_NR_GBC")));
				xb.setNbdepins(NullCheck.isNotNull(rs.getString("NON_BNK")));
				xb.setCreduni(NullCheck.isNotNull(rs.getString("CREDIT_UNIONS")));
				xb.setInscorp(NullCheck.isNotNull(rs.getString("INSURANCE_CORP")));
				xb.setPenfun(NullCheck.isNotNull(rs.getString("PENSION")));
				xb.setInvfun(NullCheck.isNotNull(rs.getString("INVESTMENT")));
				xb.setFinauxint(NullCheck.isNotNull(rs.getString("FINANCIAL_AUX")));
				xb.setCengov(NullCheck.isNotNull(rs.getString("CENTRAL_GOV")));
				xb.setStlgov(NullCheck.isNotNull(rs.getString("STATE_LOC_GOV")));
				xb.setPubnfcorp(NullCheck.isNotNull(rs.getString("PUBLIC_NON_FIN_CORP")));
				xb.setOnfcorp(NullCheck.isNotNull(rs.getString("OTH_NON_FIN_CORP")));
				xb.setHhold(NullCheck.isNotNull(rs.getString("HOUSEHOLD")));
				xb.setNpinsserhh(NullCheck.isNotNull(rs.getString("NON_PROF_INSTITUTE")));
				xb.setTotal(NullCheck.isNotNull(rs.getString("TOTAL")));




					
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
	
public ArrayList<XBRLBOP0100Bean> xbrlBOP0100ajaxdetails(String repname,String ReporefSeq,String instno,String dt2,String curr) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("repname    " + repname + "reprefno   "  + ReporefSeq + "instno"+ instno +"dt2   " + dt2 +"currency" +curr);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLBOP0100Bean> arl = new ArrayList<XBRLBOP0100Bean>();
		NullCheck chk=new NullCheck();
		String status = "";
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		
		PreparedStatement ps = null;
		
		StringBuffer sql = new StringBuffer();
		
		
		DateFormat df=new DateFormat();		
		//dt1 =df.formatdate(dt1);
		dt2 =df.formatdate(dt2);
		
		 DecimalFormat dfs = new DecimalFormat("##,##.00");  
		
	
		try {
		
		
			
		sql.append("SELECT /* +FIRST_ROWS(100) */CUST_ID,NAT_OF_CUST,NRE_FLG,PUR_OF_REM,to_char(COLL_AMT, '9,999,999,999,990.99')COLL_AMT,COLL_CRNCY,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE FROM TABLE(BOP0100_DTL_FUN('"+repname+"','"+chk.notZero(ReporefSeq)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
			log.info("BLS sec2 "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				
								
				 
				XBRLBOP0100Bean xb=new XBRLBOP0100Bean();
				
				    xb.setCusid(NullCheck.isNotNull(rs.getString("CUST_ID")));
					xb.setNatofcus(NullCheck.isNotNull(rs.getString("NAT_OF_CUST")));
					xb.setNrflg(NullCheck.isNotNull(rs.getString("NRE_FLG")));
					xb.setPorem(NullCheck.isNotNull(rs.getString("PUR_OF_REM")));
					xb.setAmt(NullCheck.isNotNull(rs.getString("COLL_AMT")));
					xb.setCurre(NullCheck.isNotNull(rs.getString("COLL_CRNCY")));
					xb.setRepodat(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
				

			
			 
				
		
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
public ArrayList<XBRLBOP0100Bean> xbrlBOP10RR(String reptype,String ReporefSeq,String instno,String dt2,String dt1,String curr) {
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLBOP0100Bean> arl = new ArrayList<XBRLBOP0100Bean>();
	NullCheck chk=new NullCheck();
	
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();
	
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	//sql.append("SELECT * FROM TABLE(BOP0100_DTL_FUN('BOP0100','0','0','31-AUG-2018','01-AUG-2018','31-AUG-2018','MUR'))");
		
	sql.append("SELECT /* +FIRST_ROWS(100) */CUST_ID,NAT_OF_CUST,NRE_FLG,PUR_OF_REM,to_char(COLL_AMT, '9,999,999,999,990.99')COLL_AMT,COLL_CRNCY,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE FROM TABLE(BOP0100_DTL_FUN('"+reptype+"','"+chk.notZero(ReporefSeq)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
	log.info("DOC&&&&SELECT Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		
		XBRLBOP0100Bean xb=new XBRLBOP0100Bean();
		
	    xb.setCusid(NullCheck.isNotNull(rs.getString("CUST_ID")));
		xb.setNatofcus(NullCheck.isNotNull(rs.getString("NAT_OF_CUST")));
		xb.setNrflg(NullCheck.isNotNull(rs.getString("NRE_FLG")));
		xb.setPorem(NullCheck.isNotNull(rs.getString("PUR_OF_REM")));
		xb.setAmt(NullCheck.isNotNull(rs.getString("COLL_AMT")));
		xb.setCurre(NullCheck.isNotNull(rs.getString("COLL_CRNCY")));
		xb.setRepodat(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
	

		
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

public String detailBOP0100saves() {

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


