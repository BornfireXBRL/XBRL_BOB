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
import bean.XBRLFIM1000Bean;
import bean.XBRLFIM1000Bean;
import bean.XBRLFIM1000Bean;
import bean.XBRLFIM1000Bean;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRLFIM1000Dao  {
	
	static Logger log = Logger.getLogger(XBRLFIM1000Dao.class);
	
public String Reporef;
	
	
	public String getReporef() {
		return Reporef;
	}

	public void setReporef(String reporef) {
		Reporef = reporef;
	}


	public ArrayList<XBRLFIM1000Dao> ReporefSeq(String dt1,String dt2){
		
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
		
		ArrayList<XBRLFIM1000Dao> arl = new ArrayList<XBRLFIM1000Dao>();
		sql.append("select REPORT_REF_NO from FIM1000_MOD_TABLE where REPORT_DATE BETWEEN '"+dt1+"' AND '"+dt2+"' GROUP BY REPORT_REF_NO ORDER BY REPORT_REF_NO");
		
		log.info("SELECTPROFILE"+sql.toString());
		
		try {
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
		
				XBRLFIM1000Dao xel=new XBRLFIM1000Dao();
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
	
	
	public ArrayList<XBRLFIM1000Bean> xbrlfimsumEP1(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
		
		log.info("FIM SUMMARY List Data AB " + dt1 + "dt22222" + dt2);
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLFIM1000Bean> arl = new ArrayList<XBRLFIM1000Bean>();
		
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
			
			
			
				sql.append("SELECT /* +FIRST_ROWS(500) */INSTITUTION_SL_NO,INSTITUTE_NAME FROM TABLE(FIM1000_S1_RPT_FUN('FIM1000','"+chk.notZero(ReporefSeq.trim())+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
			
			
			                                                                                                                                                                                                                                                                               
			//sql.append("SELECT /* +FIRST_ROWS(1000) */ INT_RATE,TRAN_NATURE,INSTITUTION_NAME,INSTITUTE_CODE,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,to_char(START_DATE,'DD-MM-YYYY')START_DATE,to_char(END_DATE,'DD-MM-YYYY')END_DATE FROM TABLE(FIM1000_DTL_FUN('FIM1000','"+chk.notZero(ReporefSeq)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");

			/*xbrl_report_master_tb*/
			
			log.info("FIM SUMMARY "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
			
				XBRLFIM1000Bean xb=new XBRLFIM1000Bean();
				
			
				xb.setInssrno(NullCheck.isNotNull(rs.getString("INSTITUTION_SL_NO")));
				xb.setNamins(NullCheck.isNotNull(rs.getString("INSTITUTE_NAME")));
				
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
	
	
	
	
public ArrayList<XBRLFIM1000Bean> xbrlfimsumEP2(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
	
	log.info("FIM SUMMARY List Data AB " + dt1 + "dt22222" + dt2);
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLFIM1000Bean> arl = new ArrayList<XBRLFIM1000Bean>();
	
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
		
		
		
			sql.append("SELECT /* +FIRST_ROWS(500) */DYNAMIC_DOMAIN,INSTITUTION_SL_NO,TRANSACTION_SL_NO,INSTITUTION_NAME,TRAN_NATURE,TRAN_CRNCY,to_char(CM_TRAN_AMT,'9,999,999,999,990.99')CM_TRAN_AMT,to_char(CM_INT_RATE,'9,999,999,999,990.99')CM_INT_RATE,to_char(MSN_TRAN_AMT,'9,999,999,999,990.99')MSN_TRAN_AMT,to_char(MSN_START_DATE,'DD-MM-YYYY')MSN_START_DATE,to_char(MSN_END_DATE,'DD-MM-YYYY')MSN_END_DATE,to_char(MSN_INT_RATE,'9,999,999,999,990.99')MSN_INT_RATE,to_char(TM_TRAN_AMT,'9,999,999,999,990.99')TM_TRAN_AMT,to_char(TM_START_DATE,'DD-MM-YYYY')TM_START_DATE,to_char(TM_END_DATE,'DD-MM-YYYY')TM_END_DATE,to_char(TM_INT_RATE,'9,999,999,999,990.99')TM_INT_RATE,REMARKS FROM TABLE(FIM1000_S2_RPT_FUN('FIM1000','"+chk.notZero(ReporefSeq.trim())+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
		
		
		
		                                                                                                                                                                                                                                                                               
		//sql.append("SELECT /* +FIRST_ROWS(1000) */ INT_RATE,TRAN_NATURE,INSTITUTION_NAME,INSTITUTE_CODE,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,to_char(START_DATE,'DD-MM-YYYY')START_DATE,to_char(END_DATE,'DD-MM-YYYY')END_DATE FROM TABLE(FIM1000_DTL_FUN('FIM1000','"+chk.notZero(ReporefSeq)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");

		/*xbrl_report_master_tb*/
		
		log.info("FIM SUMMARY "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
		
			XBRLFIM1000Bean xb=new XBRLFIM1000Bean();
			
		
			xb.setDynamicdomain(NullCheck.isNotNull(rs.getString("DYNAMIC_DOMAIN")));
			xb.setInstnstno(NullCheck.isNotNull(rs.getString("INSTITUTION_SL_NO")));
			xb.setTranstno(NullCheck.isNotNull(rs.getString("TRANSACTION_SL_NO")));
			xb.setInstname(NullCheck.isNotNull(rs.getString("INSTITUTION_NAME")));
			xb.setNametran(NullCheck.isNotNull(rs.getString("TRAN_NATURE")));

			xb.setCurr(NullCheck.isNotNull(rs.getString("TRAN_CRNCY")));
			xb.setCmamt(NullCheck.isNotNull(rs.getString("CM_TRAN_AMT")));			
			xb.setCmrpa(NullCheck.isNotNull(rs.getString("CM_INT_RATE")));
			
			xb.setMsnamt(NullCheck.isNotNull(rs.getString("MSN_TRAN_AMT")));			
			xb.setMsnstartdate(NullCheck.isNotNull(rs.getString("MSN_START_DATE")));			
			xb.setMsnenddate(NullCheck.isNotNull(rs.getString("MSN_END_DATE")));			
			xb.setMsnrpa(NullCheck.isNotNull(rs.getString("MSN_INT_RATE")));			
			xb.setTmamt(NullCheck.isNotNull(rs.getString("TM_TRAN_AMT")));
			xb.setTmstartdate(NullCheck.isNotNull(rs.getString("TM_START_DATE")));			
			xb.setTmenddate(NullCheck.isNotNull(rs.getString("TM_END_DATE")));			
			xb.setTmrpa(NullCheck.isNotNull(rs.getString("TM_INT_RATE")));			
			xb.setRemark(NullCheck.isNotNull(rs.getString("REMARKS")));	
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

public ArrayList<XBRLFIM1000Bean> xbrlfimajaxdetails(String reptype,String ReporefSeq,String instno,String dt2,String dt1,String curr) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("reptype    " + reptype + "ReporefSeq   " + ReporefSeq + "instno   " + instno + "dt2     " + dt2 +  "dt1    " + dt1);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLFIM1000Bean> arl = new ArrayList<XBRLFIM1000Bean>();
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
			
			
		
		
			sql.append("SELECT /* +FIRST_ROWS(500) */INSTITUTE_NAME,INSTITUTE_CODE,TRAN_NATURE,TRAN_CRNCY,TRAN_TYPE,to_char(TRAN_AMT,'9,999,999,999,990.99')TRAN_AMT,to_char(INT_START_DATE,'DD-MM-YYYY')INT_START_DATE,to_char(INT_END_DATE,'DD-MM-YYYY')INT_END_DATE,INT_RATE,REMARKS,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE FROM TABLE(FIM1000_DTL_FUN('"+reptype+"','"+ReporefSeq+"','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','MUR'))");
			
			log.info("PYM Vinoth Kumar  "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				XBRLFIM1000Bean xb=new XBRLFIM1000Bean();
	
				xb.setInsnam(NullCheck.isNotNull(rs.getString("INSTITUTE_NAME")));
				xb.setInscode(NullCheck.isNotNull(rs.getString("INSTITUTE_CODE")));
				xb.setTrannat(NullCheck.isNotNull(rs.getString("TRAN_NATURE")));
				xb.setTrancur(NullCheck.isNotNull(rs.getString("TRAN_CRNCY")));
				xb.setTrantyp(NullCheck.isNotNull(rs.getString("TRAN_TYPE")));
				xb.setTranamt(NullCheck.isNotNull(rs.getString("TRAN_AMT")));			
				xb.setInstdate(NullCheck.isNotNull(rs.getString("INT_START_DATE")));
				xb.setInendate(NullCheck.isNotNull(rs.getString("INT_END_DATE")));
				xb.setInrate(NullCheck.isNotNull(rs.getString("INT_RATE")));	
				xb.setRem(NullCheck.isNotNull(rs.getString("REMARKS")));			
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


public ArrayList<XBRLFIM1000Bean> xbrlfim1000(String reptype,String dt1,String dt2,String ReporefSeq,String instno,String curr) {
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLFIM1000Bean> arl = new ArrayList<XBRLFIM1000Bean>();
	NullCheck chk=new NullCheck();
	
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();
	log.info(dt1);
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	sql.append("SELECT /* +FIRST_ROWS(500) */INSTITUTE_NAME,INSTITUTE_CODE,TRAN_NATURE,TRAN_CRNCY,TRAN_TYPE,to_char(TRAN_AMT,'9,999,999,999,990.99')TRAN_AMT,to_char(INT_START_DATE,'DD-MM-YYYY')INT_START_DATE,to_char(INT_END_DATE,'DD-MM-YYYY')INT_END_DATE,INT_RATE,REMARKS,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE FROM TABLE(FIM1000_DTL_FUN('"+reptype+"','"+ReporefSeq+"','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','MUR'))");
		
log.info("DOC&&&&SELECT Gayu"+sql.toString());
	
	try {
		
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		
		XBRLFIM1000Bean xb=new XBRLFIM1000Bean();
		xb.setInsnam(NullCheck.isNotNull(rs.getString("INSTITUTE_NAME")));
		xb.setInscode(NullCheck.isNotNull(rs.getString("INSTITUTE_CODE")));
		xb.setTrannat(NullCheck.isNotNull(rs.getString("TRAN_NATURE")));
		xb.setTrancur(NullCheck.isNotNull(rs.getString("TRAN_CRNCY")));
		xb.setTrantyp(NullCheck.isNotNull(rs.getString("TRAN_TYPE")));
		xb.setTranamt(NullCheck.isNotNull(rs.getString("TRAN_AMT")));			
		xb.setInstdate(NullCheck.isNotNull(rs.getString("INT_START_DATE")));
		xb.setInendate(NullCheck.isNotNull(rs.getString("INT_END_DATE")));
		xb.setInrate(NullCheck.isNotNull(rs.getString("INT_RATE")));	
		xb.setRem(NullCheck.isNotNull(rs.getString("REMARKS")));			
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



public String detailFIM1000saves() {

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


