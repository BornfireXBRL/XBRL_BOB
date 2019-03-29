package dao;


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

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import basecode.DateFormat;
import bean.XBRLPSC0030Bean;
import bean.XBRLPYM0100Bean;
import bean.XBRLReportMasterBean;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRLPSC0030Dao {
	
	static Logger log = Logger.getLogger(XBRLPSC0030Dao.class);
	
	
	
	
	public String Reporef;
	
	
	
	
	

		
		
	public String getReporef() {
		return Reporef;
	}

	public void setReporef(String reporef) {
		Reporef = reporef;
	}

	public ArrayList<XBRLPYM0100Bean> xbrlpym400(String dt1,String dt2,String curr) {
		
			log.info("FIM0100 List Data AB " + dt1 + "dt22222" + dt2);
			
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			
			ArrayList<XBRLPYM0100Bean> arl = new ArrayList<XBRLPYM0100Bean>();
			
			String status = "";
			
			ConnectionManager connMgr = new ConnectionManager();
			Connection conn = connMgr.getConnection();
			
			PreparedStatement ps = null;
			
			StringBuffer sql = new StringBuffer();
			
			
			DateFormat df=new DateFormat();		
			dt1 =df.formatdate(dt1);
			dt2 =df.formatdate(dt2);
			
		
			try {
			
				
		
				//sql.append("SELECT DYNAMIC_DOMAIN,to_char(REP_DATE,'DD-MM-YYYY')REP_DATE,INSTITUTE_ID,TRAN_ID,INSTITUTE_NAME,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,SECTOR,SPOT_RATE,FWD_RATE,to_char(DUE_DATE,'DD-MM-YYYY')DUE_DATE,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME    FROM   FIM0400_MAST_TABLE  Where  REP_DATE >='"+dt1+"' and REP_DATE <= '"+dt2+"' ORDER BY cast(TRAN_ID as int) ASC ");
				
				//sql.append("SELECT MODES,CHQ_ALPHA,CHQ_NUMBER,ACCT_NUMBER,ACCT_NAME,to_char(TRAN_DATE,'DD-MM-YYYY')TRAN_DATE,to_char(VALUE_DATE,'DD-MM-YYYY')VALUE_DATE,CHQ_AMOUNT,CRNCY,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME    FROM   PYM0100_MAST_TABLE  Where  TRAN_DATE >='"+dt1+"' and TRAN_DATE <= '"+dt2+"' ORDER BY TRAN_DATE  ASC ");
				
				
				
				sql.append("SELECT /* +FIRST_ROWS(100) */ MODES,CHQ_NUMBER,ACCT_NUMBER,ACCT_NAME,to_char(TRAN_DATE,'DD-MM-YYYY')TRAN_DATE,CHQ_AMOUNT,CRNCY,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME FROM TABLE(PYM0100_DTL_FUN('PYM0100','0','0','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");
				
				
				
				log.info("Normal Vinoth PYM"+sql.toString());
				
				ps=conn.prepareStatement(sql.toString());
				
			    ResultSet rs=ps.executeQuery();
			     

				while(rs.next()){
				//	log.info("whileee");
					XBRLPYM0100Bean xb=new XBRLPYM0100Bean();
					
					
				
					
					xb.setModes(NullCheck.isNotNull(rs.getString("MODES")));					
					/*xb.setChequeAlpha(NullCheck.isNotNull(rs.getString("CHQ_ALPHA")));*/
					xb.setChequeNumber(NullCheck.isNotNull(rs.getString("CHQ_NUMBER")));
					xb.setAccountNumber(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
					xb.setAccountName(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
					xb.setTransactionDate(NullCheck.isNotNull(rs.getString("TRAN_DATE")));
					/*xb.setValueDate(NullCheck.isNotNull(rs.getString("VALUE_DATE")));*/
					xb.setChequeAmount(NullCheck.isNotNull(rs.getString("CHQ_AMOUNT")));
					xb.setCurrency(NullCheck.isNotNull(rs.getString("CRNCY")));
					
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

	public ArrayList<XBRLPYM0100Bean> xbrlpym4RR(String dt1,String dt2,String ReporefSeq,String instno,String curr) {
	
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLPYM0100Bean> arl = new ArrayList<XBRLPYM0100Bean>();
		
		
		
		String status = "";
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		
		PreparedStatement ps = null;
		
		StringBuffer sql = new StringBuffer();
		
		
		DateFormat df=new DateFormat();
		
		dt1 =df.formatdate(dt1);
		dt2 =df.formatdate(dt2);
		
		
		

		try {
		
			/*sql.append("SELECT MODES,CHQ_ALPHA,CHQ_NUMBER,ACCT_NUMBER,ACCT_NAME,to_char(TRAN_DATE,'DD-MM-YYYY')TRAN_DATE,to_char(VALUE_DATE,'DD-MM-YYYY')VALUE_DATE,CHQ_AMOUNT,CRNCY,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME    FROM   PYM0100_MAST_TABLE where TRAN_DATE >='"+dt1+"' and TRAN_DATE <= '"+dt2+"'  and CHQ_NUMBER not in (Select CHQ_NUMBER from PYM0100_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq+"')	UNION all	SELECT MODES,CHQ_ALPHA,CHQ_NUMBER,ACCT_NUMBER,ACCT_NAME,to_char(TRAN_DATE,'DD-MM-YYYY')TRAN_DATE,to_char(VALUE_DATE,'DD-MM-YYYY')VALUE_DATE,CHQ_AMOUNT,CRNCY,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME    FROM   PYM0100_MOD_TABLE Where   REPORT_REF_NO ='"+ReporefSeq+"' ") ;*/
			
			sql.append("SELECT /* +FIRST_ROWS(100) */ MODES,CHQ_NUMBER,ACCT_NUMBER,ACCT_NAME,to_char(TRAN_DATE,'DD-MM-YYYY')TRAN_DATE,CHQ_AMOUNT,CRNCY,DEL_FLG,RCRE_USER_ID,RCRE_TIME,LCHG_USER_ID,LCHG_TIME FROM TABLE(PYM0100_DTL_FUN('PYM0100','"+ReporefSeq+"','"+instno+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");
			
		log.info("DOC&&&&SELECT"+sql.toString());
		try {
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			
			XBRLPYM0100Bean xb=new XBRLPYM0100Bean();
			
			xb.setModes(NullCheck.isNotNull(rs.getString("MODES")));
			/*log.info("rs.getString======"+rs.getString("CHQ_ALPHA"));
			
			
			
			xb.setChequeAlpha(NullCheck.isNotNull(rs.getString("CHQ_ALPHA")));
			
			log.info("XBBB"+xb.getChequeAlpha());
			if(xb.getChequeAlpha().equals("null")){
				xb.setChequeAlpha("");
				
			}*/
			
			
			xb.setChequeNumber(NullCheck.isNotNull(rs.getString("CHQ_NUMBER")));
			xb.setAccountNumber(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
			xb.setAccountName(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
			xb.setTransactionDate(NullCheck.isNotNull(rs.getString("TRAN_DATE")));
			/*xb.setValueDate(NullCheck.isNotNull(rs.getString("VALUE_DATE")));*/
			xb.setChequeAmount(NullCheck.isNotNull(rs.getString("CHQ_AMOUNT")));
			xb.setCurrency(NullCheck.isNotNull(rs.getString("CRNCY")));			
			xb.setDelflg(NullCheck.isNotNull(rs.getString("DEL_FLG")));
			xb.setRcrusrid(NullCheck.isNotNull(rs.getString("RCRE_USER_ID")));
			xb.setRcrtime(NullCheck.isNotNull(rs.getString("RCRE_TIME")));
			xb.setLchgusrid(NullCheck.isNotNull(rs.getString("LCHG_USER_ID")));
			xb.setLchgtime(NullCheck.isNotNull(rs.getString("LCHG_TIME")));
			
			
			
			
			
			 arl.add(xb);
		}
		}catch(SQLException e){
			e.printStackTrace();
		}
			
		
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
	
	
	
	
	
	public ArrayList<XBRLPSC0030Dao> ReporefSeq(String dt1,String dt2){
		
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
		
		ArrayList<XBRLPSC0030Dao> arl = new ArrayList<XBRLPSC0030Dao>();
		sql.append("select REPORT_REF_NO from PYM0100_MOD_TABLE where TRAN_DATE BETWEEN '"+dt1+"' AND '"+dt2+"' GROUP BY REPORT_REF_NO ORDER BY REPORT_REF_NO");
		
		log.info("SELECTPROFILE"+sql.toString());
		
		try {
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
		
				XBRLPSC0030Dao xel=new XBRLPSC0030Dao();
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
	
	
	
	
	
	
	
	
	
	
	
	
	public ArrayList<XBRLPYM0100Bean> xbrlpymSum() {
		
		
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLPYM0100Bean> arl = new ArrayList<XBRLPYM0100Bean>();
		
		String status = "";
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		
		PreparedStatement ps = null;
		
		StringBuffer sql = new StringBuffer();
		
		
		/*DateFormat df=new DateFormat();		
		dt1 =df.formatdate(dt1);
		dt2 =df.formatdate(dt2);*/
		
	
		try {
		
			
	
			//sql.append("SELECT DYNAMIC_DOMAIN,to_char(REP_DATE,'DD-MM-YYYY')REP_DATE,INSTITUTE_ID,TRAN_ID,INSTITUTE_NAME,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,SECTOR,SPOT_RATE,FWD_RATE,to_char(DUE_DATE,'DD-MM-YYYY')DUE_DATE,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME    FROM   FIM0400_MAST_TABLE  Where  REP_DATE >='"+dt1+"' and REP_DATE <= '"+dt2+"' ORDER BY cast(TRAN_ID as int) ASC ");
			
			//sql.append("SELECT MODES,CHQ_ALPHA,CHQ_NUMBER,ACCT_NUMBER,ACCT_NAME,to_char(TRAN_DATE,'DD-MM-YYYY')TRAN_DATE,to_char(VALUE_DATE,'DD-MM-YYYY')VALUE_DATE,CHQ_AMOUNT,CRNCY,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME    FROM   PYM0100_MAST_TABLE  Where  TRAN_DATE >='"+dt1+"' and TRAN_DATE <= '"+dt2+"' ORDER BY TRAN_DATE  ASC ");
			
			
			
			sql.append("SELECT COUNT(MODES) as cnt	FROM PYM0100_MAST_TABLE	WHERE MODES='A'");
			
			
			
			log.info("CRRRRRRRRRRRRRR"+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				log.info("whileee");
				XBRLPYM0100Bean xb=new XBRLPYM0100Bean();
				
				
				status=NullCheck.isNotZero(rs.getString("cnt"));
				
				
				
				
			
			 
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
	
	
	
	/***********PDF and EXCEL HEADER FROM XBRL REPORT MASTER***************//*
	public XBRLReportMasterBean xbrlsummarypdf(String ReporefSeq){
	
		XBRLReportMasterBean xb=new XBRLReportMasterBean();
		HttpServletRequest request=ServletActionContext.getRequest();
		ConnectionManager conmgr=new ConnectionManager();
		Connection conn=conmgr.getConnection();
		PreparedStatement ps=null;
		StringBuffer sql=new StringBuffer();
		
		sql.append("SELECT * FROM XBRL_REPORT_MASTER_TB WHERE REPORT_ID='"+ReporefSeq+"'");
		try {
			log.info(sql.toString());
			 ps=conn.prepareStatement(sql.toString());
			
			 ResultSet rs=ps.executeQuery();
			 while(rs.next()) {
				 xb.setRprtid(rs.getString("REPORT_ID"));
				 xb.setRptname(rs.getString("REPORT_NAME"));
				 xb.setRptfreq(rs.getString("REPORT_FREQUENCY"));
				 xb.setTaxver(rs.getString("XBRL_TAXONOMY_VERSION"));
				 xb.setInstcode(rs.getString("INSTITUTION_CODE"));
				 xb.setInstname(rs.getString("INSTITUTION_NAME"));
				 xb.setInstcat(rs.getString("INSTITUTION_CATEGORY"));
				 xb.setToolname(rs.getString("TOOL_NAME"));
				 xb.setToolver(rs.getString("TOOL_VERSION"));
				
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
	
		return xb;
			
	}
		*/
		
	/*************DB Link****************/
	
	public ArrayList<XBRLPSC0030Bean> xbrlpsc0030sumEP(String dt1,String dt2,String ReporefSeq,String curr,String reptype) {
		
		log.info("PYM SUMMARY List Data AB " + dt1 + "dt22222" + dt2);
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLPSC0030Bean> arl = new ArrayList<XBRLPSC0030Bean>();
		
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
			//sql.append("SELECT DYNAMIC_DOMAIN,to_char(REP_DATE,'DD-MM-YYYY')REP_DATE,INSTITUTE_ID,TRAN_ID,INSTITUTE_NAME,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,SECTOR,SPOT_RATE,FWD_RATE,to_char(DUE_DATE,'DD-MM-YYYY')DUE_DATE,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME    FROM   FIM0400_MAST_TABLE  Where  REP_DATE >='"+dt1+"' and REP_DATE <= '"+dt2+"' ORDER BY cast(TRAN_ID as int) ASC ");
			
			
			
				
				//sql.append("SELECT REPORT_REF_NO,MODES,CHQ_NUMBER,ACCT_NUMBER,ACCT_NAME,to_char(TRAN_DATE,'DD-MM-YYYY')TRAN_DATE,CHQ_AMOUNT,CRNCY,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME  FROM TABLE(PYM0100_RPT_FUN('PYM0100','"+ReporefSeq.trim()+"','31-MAR-2014','31-MAR-2014','31-MAR-2014'))");
				
				
				/*to_char(CHQ_AMOUNT, '9,999,999,999,990.99')CHQ_AMOUNT*/
			log.info(reptype.toUpperCase());
			if(reptype.toUpperCase().equals("PSC0500")) {
				
				sql.append("SELECT  INSTANCE_NAME,INSTANCE_CODE,LOANS_APPROVED,to_char(OUTSTANDING_AMT, '9,999,999,999,990.99')OUTSTANDING_AMT,to_char(MIN_INT_RATE, '9,999,999,999,990.99')MIN_INT_RATE,to_char(MAX_INT_RATE, '9,999,999,999,990.99')MAX_INT_RATE FROM TABLE(PSC0500_RPT_FUN('"+reptype.toUpperCase()+"','"+chk.isNotZero(ReporefSeq.trim())+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
				
				
			}else {
				sql.append("SELECT to_char(APP_SUBMITED_DATE,'DD-MM-YYYY')APP_SUBMITED_DATE,NAME,REJECTION_REASON FROM TABLE(PSC0501_RPT_FUN('"+reptype.toUpperCase()+"','"+chk.isNotZero(ReporefSeq.trim())+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
				
			}
			log.info("PYM SUMMARY "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				XBRLPSC0030Bean xb=new XBRLPSC0030Bean();
				
				if(reptype.toUpperCase().equals("PSC0500")) {
					xb.setInstname(NullCheck.isNotNull(rs.getString("INSTANCE_NAME")));
					xb.setInstcode(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
					xb.setLoanapprvd(NullCheck.isNotNull(rs.getString("LOANS_APPROVED")));
					xb.setOutstndingamt(NullCheck.isNotNull(rs.getString("OUTSTANDING_AMT")));
					xb.setMinintrate(NullCheck.isNotNull(rs.getString("MIN_INT_RATE")));
					xb.setMaxintrate(NullCheck.isNotNull(rs.getString("MAX_INT_RATE")));
				}else {
					xb.setApsubdate(NullCheck.isNotNull(rs.getString("APP_SUBMITED_DATE")));
					xb.setName(NullCheck.isNotNull(rs.getString("NAME")));
					xb.setRejctdreason(NullCheck.isNotNull(rs.getString("REJECTION_REASON")));
				}
			
			
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
	
	
	
	
	/*************************Details PYM0100***********************/
	
	
	
	
	
public ArrayList<XBRLPSC0030Bean> xbrlpsc0030ajaxdetails(String repname,String reprefno,String instno,String dt2,String dt1,String curr) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("repname    " + repname + "reprefno   " + reprefno + "instno   " + instno + "dt2     " + dt2 +  "dt1    " + dt1);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLPSC0030Bean> arl = new ArrayList<XBRLPSC0030Bean>();
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
			
			sql.append("select /* +FIRST_ROWS(100) */ APPLICATION_NO,APPLICANT_NAME,SCHM_TYPE,CURRENCY,to_char(OUTSTANDING_BALANCE, '9,999,999,999,990.99')OUTSTANDING_BALANCE,to_char(INTEREST_RATE, '9,999,999,999,990.99')INTEREST_RATE,to_char(ACCT_OPN_DATE,'DD-MM-YYYY')ACCT_OPN_DATE,to_char(RECEIVED_DATE,'DD-MM-YYYY')RECEIVED_DATE,to_char(APPROVED_DATE,'DD-MM-YYYY')APPROVED_DATE,to_char(REJECTED_DATE,'DD-MM-YYYY')REJECTED_DATE,REJECTION_REASON from table(PSC0030_DTL_FUN('PSC0030','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");
			
			
			log.info("PYM Vinoth Kumar  "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				//log.info("whileee");
				
				
				 
				XBRLPSC0030Bean xb=new XBRLPSC0030Bean();
				
				xb.setApplno(NullCheck.isNotNull(rs.getString("APPLICATION_NO")));
				xb.setAplcantname(NullCheck.isNotNull(rs.getString("APPLICANT_NAME")));
				xb.setSchmtyp(NullCheck.isNotNull(rs.getString("SCHM_TYPE")));
				xb.setCurr(NullCheck.isNotNull(rs.getString("CURRENCY")));
				xb.setOutstndingamt(NullCheck.isNotNull(rs.getString("OUTSTANDING_BALANCE")));
				xb.setIntrate(NullCheck.isNotNull(rs.getString("INTEREST_RATE")));
				xb.setActopndate(NullCheck.isNotNull(rs.getString("ACCT_OPN_DATE")));
				xb.setRcvddate(NullCheck.isNotNull(rs.getString("RECEIVED_DATE")));
				xb.setApprvddate(NullCheck.isNotNull(rs.getString("RECEIVED_DATE")));
				xb.setRejctdate(NullCheck.isNotNull(rs.getString("REJECTED_DATE")));
				xb.setRejctdreason(NullCheck.isNotNull(rs.getString("REJECTION_REASON")));
			
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







public String detailPYM0100saves() {
		
	HttpServletRequest request = ServletActionContext.getRequest();
DateFormat df=new DateFormat();
			
	

		Connection conn = null;
		 try {
		  //Load and register Oracle driver
		  DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
		 //Establish a connection

		 conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.22:1521:orcl", "xbrl", "xbrl1");
		 
		
		 
		 CallableStatement pstmt =  conn.prepareCall("{call FINAL_REPORT_UPDATE_SP(?,?,?,?,?)}");
		 pstmt.setString(1, request.getParameter("reptype"));
		 pstmt.setInt(2, 0);
		 pstmt.setString(3,df.formatdate(request.getParameter("dt2")) );
		 pstmt.setString(4, df.formatdate(request.getParameter("dt1")));
		 pstmt.setString(5, df.formatdate(request.getParameter("dt2")));
		 
		 
		 pstmt.executeUpdate();
		 
		 

		 pstmt.close();
		 conn.close();

		 }catch (SQLException e) {
				
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
	




