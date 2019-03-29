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
import org.apache.log4j.Logger;

import org.apache.struts2.ServletActionContext;

import basecode.DateFormat;
import bean.XBRLFIM0200Bean;
import bean.XBRLFIM0200Bean;
import bean.XBRLFIM0100Bean;
import bean.XBRLFIM0200Bean;
import bean.XBRLFIM0200Bean;
import utilities.ConnectionManager;
import utilities.NullCheck;

public class XBRLFIM0200Dao {
	static Logger log = Logger.getLogger(XBRLFIM0200Dao.class);

	public String Reporef;

	public String getReporef() {
		return Reporef;
	}

	public void setReporef(String reporef) {
		Reporef = reporef;
	}
	
	public String resalert;
	
public String getResalert() {
		return resalert;
	}

	public void setResalert(String resalert) {
		this.resalert = resalert;
	}

public String cnt;
	
	public int cnt1;
	public String getCnt() {
		return cnt;
	}

	public void setCnt(String cnt) {
		this.cnt = cnt;
	}

	public int getCnt1() {
		return cnt1;
	}

	public void setCnt1(int cnt1) {
		this.cnt1 = cnt1;
	}

	public ArrayList<XBRLFIM0200Dao> ReporefSeq(String dt1, String dt2) {

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

		ArrayList<XBRLFIM0200Dao> arl = new ArrayList<XBRLFIM0200Dao>();
		sql.append("select REPORT_REF_NO from FIM0200_MOD_TABLE where REPORT_DATE='" + dt2 + "' ORDER BY REPORT_REF_NO");

		log.info("SELECTPROFILE" + sql.toString());

		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLFIM0200Dao xel = new XBRLFIM0200Dao();
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

public ArrayList<XBRLFIM0200Bean> xbrlfim200(String dt1,String dt2) {
	
		log.info("xbrlfim0200 List Data AB " + dt1 + "dt22222" + dt2);
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLFIM0200Bean> arl = new ArrayList<XBRLFIM0200Bean>();
		
		String status = "";
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		
		PreparedStatement ps = null;
		
		StringBuffer sql = new StringBuffer();
		
		
		DateFormat df=new DateFormat();		
		dt1 =df.formatdate(dt1);
		dt2 =df.formatdate(dt2);
		
	
		try {
		
			//sql.append("select SRL_NO,NAME_OF_CUST,CIF_ID,ACCT_NUM,ACCT_PRODUCTS,to_char(ACCT_OPN_DATE,'DD-MM-YYYY')ACCT_OPN_DATE,ACCT_CRNCY,ACCT_BAL,RATE_OF_INT,DAILY_AVG_AMT,WEIGHT_AVG_INT_RATE,INT_INC_EXP from BOP300XBRLREPORT where RPT_START_DATE='"+fromdate+"' and RPT_END_DATE='"+todate+"'");
	
			sql.append("SELECT to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,INSTITUTE_ID,TRAN_ID,INSTITUTE_NAME,INSTITUTE_CODE,PUR_CRNCY,PUR_AMT,SALE_CRNCY,SALE_AMT,RATE,to_char(VALUE_DATE,'DD-MM-YYYY')VALUE_DATE,DEL_FLG,RCRE_USER_ID, to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME  FROM FIM0200_MAST_TABLE Where  REPORT_DATE >='"+dt1+"' and REPORT_DATE <= '"+dt2+"' order by  CAST(TRAN_ID AS int)");
		
			log.info("FIMMMMMMM0200"+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				log.info("whileee");
				XBRLFIM0200Bean xb=new XBRLFIM0200Bean();
				
				
			
				xb.setRepdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
				xb.setInstiid(NullCheck.isNotNull(rs.getString("INSTITUTE_ID")));
				xb.setTranid(NullCheck.isNotNull(rs.getString("TRAN_ID")));
				xb.setInstiname(NullCheck.isNotNull(rs.getString("INSTITUTE_NAME")));
				xb.setInsticode(NullCheck.isNotNull(rs.getString("INSTITUTE_CODE")));
				xb.setPurcrncy(NullCheck.isNotNull(rs.getString("PUR_CRNCY")));
				xb.setPuramt(NullCheck.isNotNull(rs.getString("PUR_AMT")));
				xb.setSalecrncy(NullCheck.isNotNull(rs.getString("SALE_CRNCY")));
				xb.setSaleamt(NullCheck.isNotNull(rs.getString("SALE_AMT")));
				xb.setRate(NullCheck.isNotNull(rs.getString("RATE")));
				xb.setValuedate(NullCheck.isNotNull(rs.getString("VALUE_DATE")));
				
				xb.setDelflg(NullCheck.isNotNull(rs.getString("DEL_FLG")));
				xb.setRcrusrid(NullCheck.isNotNull(rs.getString("RCRE_USER_ID")));
				xb.setRcrtime(NullCheck.isNotNull(rs.getString("RCRE_TIME")));
				xb.setLchgusrid(NullCheck.isNotNull(rs.getString("LCHG_USER_ID")));
				xb.setLchgtime(NullCheck.isNotNull(rs.getString("LCHG_TIME")));
				
			
			 
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







public ArrayList<XBRLFIM0200Bean> xbrlfim200RR(String reptype,String dt1,String dt2,String reprefno,String instno,String curr) {
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLFIM0200Bean> arl = new ArrayList<XBRLFIM0200Bean>();
	NullCheck chk=new NullCheck();
	
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();
	
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	//sql.append("SELECT * FROM TABLE(FIM0200_DTL_FUN('FIM0200','0','0','31-AUG-2018','01-AUG-2018','31-AUG-2018','MUR'))");
		
	sql.append("SELECT INSTITUTE_SL_NO,TRAN_SL_NO,INSTITUTE_NAME,INSTITUTE_CODE,PUR_CRNCY,to_char(PUR_AMT, '9,999,999,999,990.99')PUR_AMT,SALE_CRNCY,to_char(SALE_AMT, '9,999,999,999,990.99')SALE_AMT,to_char(RATE, '9,999,999,999,990.99')RATE,to_char(VALUE_DATE,'DD-MM-YYYY')VALUE_DATE  FROM TABLE(FIM0200_DTL_FUN('FIM0200','"+chk.isNotZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
	log.info("DOC&&&&SELECT Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		
		XBRLFIM0200Bean xb=new XBRLFIM0200Bean();
		
		xb.setInstiidd(NullCheck.isNotNull(rs.getString("INSTITUTE_SL_NO")));
		xb.setTranidd(NullCheck.isNotNull(rs.getString("TRAN_SL_NO")));
		xb.setInstinamed(NullCheck.isNotNull(rs.getString("INSTITUTE_NAME")));
		xb.setInsticoded(NullCheck.isNotNull(rs.getString("INSTITUTE_CODE")));
		xb.setPurcrncyd(NullCheck.isNotNull(rs.getString("PUR_CRNCY")));
		xb.setPuramtd(NullCheck.isNotNull(rs.getString("PUR_AMT")));
		xb.setSalecrncyd(NullCheck.isNotNull(rs.getString("SALE_CRNCY")));
		xb.setSaleamtd(NullCheck.isNotNull(rs.getString("SALE_AMT")));
		xb.setRated(NullCheck.isNotNull(rs.getString("RATE")));
		xb.setValuedated(NullCheck.isNotNull(rs.getString("VALUE_DATE")));

		
	
		
		
		
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
public ArrayList<XBRLFIM0200Bean> xbrl1fimsumEP(String dt1,String dt2,String ReporefSeq,String curr) {
	
	log.info("FIM SUMMARY List Data AB " + dt1 + "dt22222" + dt2);
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLFIM0200Bean> arl = new ArrayList<XBRLFIM0200Bean>();
	
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
	
		
		log.info("Gnana" + ReporefSeq.trim());
		//sql.append("SELECT DYNAMIC_DOMAIN,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,INSTITUTE_ID,TRAN_ID,INSTITUTE_NAME,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,SECTOR,SPOT_RATE,FWD_RATE,to_char(DUE_DATE,'DD-MM-YYYY')DUE_DATE,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME    FROM   FIM0400_MAST_TABLE  Where  REPORT_DATE >='"+dt1+"' and REPORT_DATE <= '"+dt2+"' ORDER BY cast(TRAN_ID as int) ASC ");
		NullCheck chk=new NullCheck();
	
		
			//sql.append("SELECT /* +FIRST_ROWS(100) */DYNAMIC_DOMAIN ,TRAN_CRNCY,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,INSTITUTION_SL_NO,TRANSACTION_SL_NO,INSTITUTION_NAME,TRAN_NATURE,INSTITUTE_CODE, to_char(SM_TRAN_AMT, '9,999,999,999,990.99')SM_TRAN_AMT,to_char(SM_INT_RATE, '9,999,999,999,990.99')SM_INT_RATE, to_char(MSN_TRAN_AMT, '9,999,999,999,990.99')MSN_TRAN_AMT,to_char(MSN_START_DATE,'DD-MM-YYYY')MSN_START_DATE,to_char(MSN_END_DATE,'DD-MM-YYYY')MSN_END_DATE, to_char(MSN_INT_RATE, '9,999,999,999,990.99')MSN_INT_RATE, to_char(TM_TRAN_AMT, '9,999,999,999,990.99')TM_TRAN_AMT,to_char(TM_START_DATE,'DD-MM-YYYY')TM_START_DATE,to_char(TM_END_DATE,'DD-MM-YYYY')TM_END_DATE,to_char(TM_INT_RATE, '9,999,999,999,990.99')TM_INT_RATE FROM TABLE(FIM0100_RPT_FUN('FIM0100',0,'"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			//sql.append("SELECT REPORT_ID,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,to_char(FROM_DATE,'DD-MM-YYYY')FROM_DATE,to_char(TO_DATE,'DD-MM-YYYY')TO_DATE,VERSION_NO,CURRENCY,INSTITUTE_SL_NO,TRAN_SL_NO,INSTITUTE_NAME,INSTITUTE_CODE,PUR_CRNCY,to_char(PUR_AMT, '9,999,999,999,990.99')PUR_AMT,SALE_CRNCY,to_char(SALE_AMT, '9,999,999,999,990.99')SALE_AMT,to_char(RATE, '9,999,999,999,990.99')RATE,to_char(VALUE_DATE,'DD-MM-YYYY')VALUE_DATE  FROM TABLE(FIM0200_RPT_FUN('FIM0200','"+chk.isNotZero(ReporefSeq.trim())+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
		sql.append("SELECT INSTITUTION_SL_NO,INSTITUTE_NAME,INSTITUTE_CODE  FROM TABLE(FIM0200_S1_RPT_FUN('FIM0200','"+chk.isNotZero(ReporefSeq.trim())+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");

		
		                                                                                                                                                                                                                                                                               

		/*xbrl_report_master_tb*/
		
		log.info("FIM SUMMARY "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
		
			XBRLFIM0200Bean xb=new XBRLFIM0200Bean();
			
			//xb.setRepdate(NullCheck.isNotNull(rs.getString("SRL_NO")));
			//xb.setRepid(NullCheck.isNotNull(rs.getString("REPORT_ID")));
			//xb.setRepdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
			//xb.setFmdt(NullCheck.isNotNull(rs.getString("FROM_DATE")));
			//xb.setTodt(NullCheck.isNotNull(rs.getString("TO_DATE")));
			//xb.setVersnno(NullCheck.isNotNull(rs.getString("VERSION_NO")));
			//xb.setCurr(NullCheck.isNotNull(rs.getString("CURRENCY")));
      		xb.setInstslno(NullCheck.isNotNull(rs.getString("INSTITUTION_SL_NO")));
			//xb.setTranid(NullCheck.isNotNull(rs.getString("TRAN_SL_NO")));
			xb.setInstnam(NullCheck.isNotNull(rs.getString("INSTITUTE_NAME")));
			xb.setInstcd(NullCheck.isNotNull(rs.getString("INSTITUTE_CODE")));
			
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



public ArrayList<XBRLFIM0200Bean> xbrlfimsumEP(String dt1,String dt2,String ReporefSeq,String curr) {
	
	log.info("FIM SUMMARY List Data AB " + dt1 + "dt22222" + dt2);
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLFIM0200Bean> arl = new ArrayList<XBRLFIM0200Bean>();
	
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
	
		
		log.info("Gnana" + ReporefSeq.trim());
		//sql.append("SELECT DYNAMIC_DOMAIN,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,INSTITUTE_ID,TRAN_ID,INSTITUTE_NAME,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,SECTOR,SPOT_RATE,FWD_RATE,to_char(DUE_DATE,'DD-MM-YYYY')DUE_DATE,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME    FROM   FIM0400_MAST_TABLE  Where  REPORT_DATE >='"+dt1+"' and REPORT_DATE <= '"+dt2+"' ORDER BY cast(TRAN_ID as int) ASC ");
		NullCheck chk=new NullCheck();
	
		
			//sql.append("SELECT /* +FIRST_ROWS(100) */DYNAMIC_DOMAIN ,TRAN_CRNCY,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,INSTITUTION_SL_NO,TRANSACTION_SL_NO,INSTITUTION_NAME,TRAN_NATURE,INSTITUTE_CODE, to_char(SM_TRAN_AMT, '9,999,999,999,990.99')SM_TRAN_AMT,to_char(SM_INT_RATE, '9,999,999,999,990.99')SM_INT_RATE, to_char(MSN_TRAN_AMT, '9,999,999,999,990.99')MSN_TRAN_AMT,to_char(MSN_START_DATE,'DD-MM-YYYY')MSN_START_DATE,to_char(MSN_END_DATE,'DD-MM-YYYY')MSN_END_DATE, to_char(MSN_INT_RATE, '9,999,999,999,990.99')MSN_INT_RATE, to_char(TM_TRAN_AMT, '9,999,999,999,990.99')TM_TRAN_AMT,to_char(TM_START_DATE,'DD-MM-YYYY')TM_START_DATE,to_char(TM_END_DATE,'DD-MM-YYYY')TM_END_DATE,to_char(TM_INT_RATE, '9,999,999,999,990.99')TM_INT_RATE FROM TABLE(FIM0100_RPT_FUN('FIM0100',0,'"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			//sql.append("SELECT REPORT_ID,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,to_char(FROM_DATE,'DD-MM-YYYY')FROM_DATE,to_char(TO_DATE,'DD-MM-YYYY')TO_DATE,VERSION_NO,CURRENCY,INSTITUTE_SL_NO,TRAN_SL_NO,INSTITUTE_NAME,INSTITUTE_CODE,PUR_CRNCY,to_char(PUR_AMT, '9,999,999,999,990.99')PUR_AMT,SALE_CRNCY,to_char(SALE_AMT, '9,999,999,999,990.99')SALE_AMT,to_char(RATE, '9,999,999,999,990.99')RATE,to_char(VALUE_DATE,'DD-MM-YYYY')VALUE_DATE  FROM TABLE(FIM0200_RPT_FUN('FIM0200','"+chk.isNotZero(ReporefSeq.trim())+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
		sql.append("SELECT INSTITUTE_SL_NO,TRAN_SL_NO,INSTITUTE_NAME,INSTITUTE_CODE,PUR_CRNCY,to_char(PUR_AMT, '9,999,999,999,990.99')PUR_AMT,SALE_CRNCY,to_char(SALE_AMT, '9,999,999,999,990.99')SALE_AMT,to_char(RATE, '9,999,999,999,990.99')RATE,to_char(VALUE_DATE,'DD-MM-YYYY')VALUE_DATE  FROM TABLE(FIM0200_S2_RPT_FUN('FIM0200','"+chk.isNotZero(ReporefSeq.trim())+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");

		
		                                                                                                                                                                                                                                                                               

		/*xbrl_report_master_tb*/
		log.info("FIM SUMMARY "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
		
			XBRLFIM0200Bean xb=new XBRLFIM0200Bean();
			
			//xb.setRepdate(NullCheck.isNotNull(rs.getString("SRL_NO")));
			//xb.setRepid(NullCheck.isNotNull(rs.getString("REPORT_ID")));
			//xb.setRepdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
			//xb.setFmdt(NullCheck.isNotNull(rs.getString("FROM_DATE")));
			//xb.setTodt(NullCheck.isNotNull(rs.getString("TO_DATE")));
			//xb.setVersnno(NullCheck.isNotNull(rs.getString("VERSION_NO")));
			//xb.setCurr(NullCheck.isNotNull(rs.getString("CURRENCY")));
      		xb.setInstiid(NullCheck.isNotNull(rs.getString("INSTITUTE_SL_NO")));
			xb.setTranid(NullCheck.isNotNull(rs.getString("TRAN_SL_NO")));
			xb.setInstiname(NullCheck.isNotNull(rs.getString("INSTITUTE_NAME")));
			xb.setInsticode(NullCheck.isNotNull(rs.getString("INSTITUTE_CODE")));
			xb.setPurcrncy(NullCheck.isNotNull(rs.getString("PUR_CRNCY")));
			xb.setPuramt(NullCheck.isNotNull(rs.getString("PUR_AMT")));
			xb.setSalecrncy(NullCheck.isNotNull(rs.getString("SALE_CRNCY")));
			xb.setSaleamt(NullCheck.isNotNull(rs.getString("SALE_AMT")));
			xb.setRate(NullCheck.isNotNull(rs.getString("RATE")));
			xb.setValuedate(NullCheck.isNotNull(rs.getString("VALUE_DATE")));
		
		
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




public ArrayList<XBRLFIM0200Bean> xbrlfimajaxdetails(String repname,String reprefno,String instno,String dt2,String dt1,String curr) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("repname    " + repname + "reprefno   " + reprefno + "instno   " + instno + "dt2     " + dt2 +  "dt1    " + dt1);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLFIM0200Bean> arl = new ArrayList<XBRLFIM0200Bean>();
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
		
			
			log.info("AJAX DETAILS GNANA" + reprefno );
			
			
		//	sql.append("SELECT /* +FIRST_ROWS(100) */ MODES,CHQ_NUMBER,ACCT_NUMBER,ACCT_NAME,to_char(TRAN_DATE,'DD-MM-YYYY')TRAN_DATE,to_char(CHQ_AMOUNT, '9,999,999,999,990.99')CHQ_AMOUNT,CRNCY,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME FROM TABLE(PYM0100_DTL_FUN('PYM0100','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");
			//select * from table(FIM0100_DTL_FUN('FIM0100','0','0','31-MAR-2014','31-MAR-2014','31-MAR-2014','MUR'));
			//sql.append("SELECT /* +FIRST_ROWS(100) */ Dynamic Domain,Institution Serial Number,Transaction Serial Number,Name of Institution,Institution Code,Currency,Transaction Type,to_char(Call money,'DD-MM-YYYY')Call money,to_char(Money at Short Notice,'DD-MM-YYYY')Money at Short Notice,to_char(Team Money,'DD-MM-YYYY')Team Money,CRNCY,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME FROM TABLE(FIM0100_DTL_FUN('FIM0100','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");
			
		
			
			sql.append("SELECT INSTITUTE_SL_NO,TRAN_SL_NO,INSTITUTE_NAME,INSTITUTE_CODE,PUR_CRNCY,to_char(PUR_AMT, '9,999,999,999,990.99')PUR_AMT,SALE_CRNCY,to_char(SALE_AMT, '9,999,999,999,990.99')SALE_AMT,to_char(RATE, '9,999,999,999,990.99')RATE,to_char(VALUE_DATE,'DD-MM-YYYY')VALUE_DATE  FROM TABLE(FIM0200_DTL_FUN('FIM0200','"+chk.isNotZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");

				//sql.append("select * from table(FIM0100_DTL_FUN('FIM0100','0','0','31-MAR-2014','31-MAR-2014','31-MAR-2014','MUR'))");
			
			log.info("PYM Vinoth Kumar  "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				XBRLFIM0200Bean xb=new XBRLFIM0200Bean();
	
				xb.setInstiidd(NullCheck.isNotNull(rs.getString("INSTITUTE_SL_NO")));
				xb.setTranidd(NullCheck.isNotNull(rs.getString("TRAN_SL_NO")));
				xb.setInstinamed(NullCheck.isNotNull(rs.getString("INSTITUTE_NAME")));
				xb.setInsticoded(NullCheck.isNotNull(rs.getString("INSTITUTE_CODE")));
				xb.setPurcrncyd(NullCheck.isNotNull(rs.getString("PUR_CRNCY")));
				xb.setPuramtd(NullCheck.isNotNull(rs.getString("PUR_AMT")));
				xb.setSalecrncyd(NullCheck.isNotNull(rs.getString("SALE_CRNCY")));
				xb.setSaleamtd(NullCheck.isNotNull(rs.getString("SALE_AMT")));
				xb.setRated(NullCheck.isNotNull(rs.getString("RATE")));
				xb.setValuedated(NullCheck.isNotNull(rs.getString("VALUE_DATE")));

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

public String detailFIM0200saves() {

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


public String detailFIM0200savecheck() {

ConnectionManager connmgr=new ConnectionManager();
Connection conn=connmgr.getConnection();
ArrayList<String> arl = new ArrayList<String>();
HttpServletRequest request = ServletActionContext.getRequest();
DateFormat df = new DateFormat();
StringBuffer sql = new StringBuffer();
PreparedStatement ps = null;

sql.append("SELECT COUNT(REPORT_DATE) as repdate FROM FIM0200_S1_RPT_TB where REPORT_ID = '"+request.getParameter("reptype")+"' AND  REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ");
 System.out.println(sql.toString());

try {
ps = conn.prepareStatement(sql.toString());
ResultSet rs = ps.executeQuery();


while (rs.next()) {

cnt1=rs.getInt("repdate");

}
System.out.println("fdsafdsaf"+cnt1);




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

public String FIM0200chckmodified() {

	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	HttpSession session = request.getSession();
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	if(request.getParameter("type").equals("chkuser")) {
		sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM FIM0200_MOD_TABLE ");
	}else {
		//sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM FIM0200_MOD_TABLE WHERE REPORT_DATE='"+NullCheck.isNotNull(df.formatdate(request.getParameter("repdate")))+"'");
		sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM FIM0200_MOD_TABLE ");

	}
	
	try {
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	      while(rs.next()) {
	    	  cnt=NullCheck.isNotZero(rs.getString("CNT"));
	      }
	    
	}catch(SQLException e) {
		e.printStackTrace();
	}

	return "success";
}
public String modFIM0200cancel() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;

	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	sql.append("DELETE FROM FIM0200_MOD_TABLE WHERE  INSTITUTE_NAME='"+NullCheck.isNotNull(request.getParameter("instinamed"))+"'");

	try {
		log.info(sql.toString());
		ps=conn.prepareStatement(sql.toString());
		
	    int rs=0;
	    rs=ps.executeUpdate();
	     
	    status="success";
	}catch(SQLException e) {
		e.printStackTrace();
		status="error";
	}
	
	if(status.equals("success")) {
		resalert="Cancellation Successful";
	}else {
		resalert="Technical Issue.Try Again Later.";
	}
	
	return "success";
}

public ArrayList<XBRLFIM0200Bean> FIM0200verify(){
	
	ArrayList<XBRLFIM0200Bean> arl = new ArrayList<XBRLFIM0200Bean>();
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	sql.append("SELECT /* +FIRST_ROWS(100) */INSTITUTE_NAME,INSTITUTE_CODE,PUR_CRNCY,PUR_AMT,SALE_CRNCY,SALE_AMT,RATE,to_char(VALUE_DATE,'DD-MM-YYYY')VALUE_DATE,DECODE(DEL_FLG,'A','Added','M','Modified','D','Deleted') as DEL_FLG ,LCHG_USER_ID, TO_CHAR(REPORT_DATE,'DD-MM-YYYY')  REPORT_DATE FROM FIM0200_MOD_TABLE");
	log.info("Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		XBRLFIM0200Bean xb=new XBRLFIM0200Bean();

	
		//xb.setRepdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
		xb.setInstinamed(NullCheck.isNotNull(rs.getString("INSTITUTE_NAME")));
		xb.setInsticoded(NullCheck.isNotNull(rs.getString("INSTITUTE_CODE")));
		xb.setPurcrncyd(NullCheck.isNotNull(rs.getString("PUR_CRNCY")));
		xb.setPuramtd(NullCheck.isNotNull(rs.getString("PUR_AMT")));
		xb.setSalecrncyd(NullCheck.isNotNull(rs.getString("SALE_CRNCY")));
		xb.setSaleamtd(NullCheck.isNotNull(rs.getString("SALE_AMT")));
		xb.setRated(NullCheck.isNotNull(rs.getString("RATE")));
		xb.setValuedated(NullCheck.isNotNull(rs.getString("VALUE_DATE")));
		 xb.setModtyp(NullCheck.isNotNull(rs.getString("DEL_FLG")));
		 xb.setRepdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
	    xb.setEntryuser(NullCheck.isNotNull(rs.getString("LCHG_USER_ID")));

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

public String FIM0200verifymaster() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	HttpSession session = request.getSession();
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();	
	
	//------------------get data from mod table---------------------
	XBRLFIM0200Bean xb=new XBRLFIM0200Bean();
	
	sql.setLength(0);
	sql.append("SELECT /* +FIRST_ROWS(100) */to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,INSTITUTE_NAME,INSTITUTE_CODE,PUR_CRNCY,PUR_AMT,SALE_CRNCY,SALE_AMT,RATE,VALUE_DATE,DEL_FLG,LCHG_USER_ID FROM FIM0200_MOD_TABLE "
			+ "WHERE INSTITUTE_NAME='"+NullCheck.isNotNull(request.getParameter("instinamed"))+"' AND REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"' ");
	log.info("Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		

		xb.setRepdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
		xb.setInstinamed(NullCheck.isNotNull(rs.getString("INSTITUTE_NAME")));
		xb.setInsticoded(NullCheck.isNotNull(rs.getString("INSTITUTE_CODE")));
		xb.setPurcrncyd(NullCheck.isNotNull(rs.getString("PUR_CRNCY")));
		xb.setPuramtd(NullCheck.isNotNull(rs.getString("PUR_AMT")));
		xb.setSalecrncyd(NullCheck.isNotNull(rs.getString("SALE_CRNCY")));
		xb.setSaleamtd(NullCheck.isNotNull(rs.getString("SALE_AMT")));
		xb.setRated(NullCheck.isNotNull(rs.getString("RATE")));
		xb.setValuedated(NullCheck.isNotNull(rs.getString("VALUE_DATE")));
		xb.setModtyp(NullCheck.isNotNull(rs.getString("DEL_FLG")));
	    xb.setEntryuser(NullCheck.isNotNull(rs.getString("LCHG_USER_ID")));

		
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
		/*if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				
			}
		}*/
	}
	
	
	
	//---------------get data from mod table------------------------
	
	
	
	
	
	if (xb.getModtyp().equals("A") ) {
		
	//For Added Records
		
		
		sql.setLength(0);
		sql.append(
				" INSERT INTO FIM0200_MAST_TABLE(REPORT_DATE,INSTITUTE_NAME,INSTITUTE_CODE,PUR_CRNCY,PUR_AMT,SALE_CRNCY,SALE_AMT,RATE,VALUE_DATE,DEL_FLG,LCHG_USER_ID,LCHG_TIME,VERIFY_USER,VERIFY_TIME)" + "VALUES ('"
					+ df.formatdate(request.getParameter("date")) + "','"+request.getParameter("instinamed") +"','"
					+ request.getParameter("insticoded") + "','" + request.getParameter("purcrncyd") + "','"
						+ request.getParameter("puramtd") + "','"+ request.getParameter("salecrncyd") + "','"
						+ request.getParameter("saleamtd") + "','"+ request.getParameter("rated") + "','"
				           +df.formatdate(request.getParameter("valuedated"))+ "','"+ request.getParameter("modtype") + "','"						
								+ session.getAttribute("userName")+"',SYSDATE,'"+ session.getAttribute("userName")+"',SYSDATE)");
				
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("DELETE FROM FIM0200_MOD_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"' and INSTITUTE_NAME='"+NullCheck.isNotNull(request.getParameter("instinamed"))+"'");
		    try {
				log.info(sql.toString());
				ps=conn.prepareStatement(sql.toString());
				
			    int rs1=0;
			    rs1=ps.executeUpdate();
			     
			    status="success";
		    }
		    catch(SQLException e) {
				e.printStackTrace();
				status="error";
			}
		    
		    
		}catch(SQLException e) {
			e.printStackTrace();
			status="error";
		}
		
	}else if (xb.getModtyp().equals("M") ) {
		
	//For Modified Records
		
		sql.setLength(0);
		sql.append("UPDATE FIM0200_MAST_TABLE SET INSTITUTE_CODE='"+NullCheck.isNotNull(request.getParameter("insticoded"))+"',PUR_CRNCY='"+NullCheck.isNotNull(request.getParameter("purcrncyd"))+"',PUR_AMT='"+NullCheck.isNotNull(request.getParameter("puramtd"))+"',SALE_CRNCY='"+NullCheck.isNotNull(request.getParameter("salecrncyd"))+"',SALE_AMT='"+NullCheck.isNotNull(request.getParameter("saleamtd"))+"',RATE='"+NullCheck.isNotNull(request.getParameter("rated"))+"',VALUE_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("valuedated")))+"',REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"',VERIFY_USER_ID='"+session.getAttribute("userName")+"',VERIFY_TIME=SYSDATE WHERE INSTITUTE_NAME='"+NullCheck.isNotNull(request.getParameter("instinamed"))+"' AND REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"'"
				+ " AND PUR_CRNCY='"+NullCheck.isNotNull(request.getParameter("purcrncyd"))+"' AND SALE_CRNCY='"+NullCheck.isNotNull(request.getParameter("salecrncyd"))+"'");
		
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("DELETE FROM FIM0200_MOD_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"' and INSTITUTE_NAME='"+NullCheck.isNotNull(request.getParameter("instinamed"))+"'");
		    try {
				log.info(sql.toString());
				ps=conn.prepareStatement(sql.toString());
				
			    int rs1=0;
			    rs1=ps.executeUpdate();
			     
			    status="success";
		    }
		    catch(SQLException e) {
				e.printStackTrace();
				status="error";
			}
		    
		    
		}catch(SQLException e) {
			e.printStackTrace();
			status="error";
		}
		
		
	}else if (xb.getModtyp().equals("D") ) {
		
	//For Deleted Records
		
		sql.setLength(0);
		sql.append("DELETE FROM FIM0200_MAST_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"' and INSTITUTE_NAME='"+NullCheck.isNotNull(request.getParameter("instinamed"))+"'");
		
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("UPDATE FIM0200_MOD_TABLE SET LCHG_USER='"+session.getAttribute("userName")+"' WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"' and INSTITUTE_NAME='"+NullCheck.isNotNull(request.getParameter("instinamed"))+"'");
		    try {
				log.info(sql.toString());
				ps=conn.prepareStatement(sql.toString());
				
			    int rs1=0;
			    rs1=ps.executeUpdate();
			     
			    status="success";
		    }
		    catch(SQLException e) {
				e.printStackTrace();
				status="error";
			}
		    
		    
		    sql.setLength(0);
		    sql.append("DELETE FROM FIM0200_MOD_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"' and INSTITUTE_NAME='"+NullCheck.isNotNull(request.getParameter("instinamed"))+"'");
		    try {
				log.info(sql.toString());
				ps=conn.prepareStatement(sql.toString());
				
			    int rs1=0;
			    rs1=ps.executeUpdate();
			     
			    status="success";
		    }
		    catch(SQLException e) {
				e.printStackTrace();
				status="error";
			}
		    
		    
		}catch(SQLException e) {
			e.printStackTrace();
			status="error";
		}
	}
	
	
	
	
	
	
	return status;
}


}
