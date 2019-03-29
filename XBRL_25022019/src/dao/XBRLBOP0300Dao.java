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
import bean.XBRLBOP0300Bean;
import bean.XBRLPYM0100Bean;
import bean.XBRLReportMasterBean;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRLBOP0300Dao {
	
	static Logger log = Logger.getLogger(XBRLBOP0300Dao.class);
	
	
	public String Reporef;
	
	
	
	
	

		
		
	public String getReporef() {
		return Reporef;
	}

	public void setReporef(String reporef) {
		Reporef = reporef;
	}

	
	
	
	public ArrayList<XBRLBOP0300Dao> ReporefSeq(String dt1,String dt2){
		
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
		
		ArrayList<XBRLBOP0300Dao> arl = new ArrayList<XBRLBOP0300Dao>();
		sql.append("select REPORT_REF_NO from BOP0300_MOD_TABLE where TRAN_DATE BETWEEN '"+dt1+"' AND '"+dt2+"' GROUP BY REPORT_REF_NO ORDER BY REPORT_REF_NO");
		
		log.info("SELECTPROFILE"+sql.toString());
		
		try {
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
		
				XBRLBOP0300Dao xel=new XBRLBOP0300Dao();
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
	
	
	
	
	
	
	
	
	
	
	
	
	public ArrayList<XBRLBOP0300Bean> xbrlpymSum() {
		
		
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLBOP0300Bean> arl = new ArrayList<XBRLBOP0300Bean>();
		
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
			
			//sql.append("SELECT MODES,CHQ_ALPHA,CHQ_NUMBER,ACCT_NUMBER,ACCT_NAME,to_char(TRAN_DATE,'DD-MM-YYYY')TRAN_DATE,to_char(VALUE_DATE,'DD-MM-YYYY')VALUE_DATE,CHQ_AMOUNT,CRNCY,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME    FROM   BOP0300_MAST_TABLE  Where  TRAN_DATE >='"+dt1+"' and TRAN_DATE <= '"+dt2+"' ORDER BY TRAN_DATE  ASC ");
			
			
			
			sql.append("SELECT COUNT(MODES) as cnt	FROM BOP0300_MAST_TABLE	WHERE MODES='A'");
			
			
			
			log.info("CRRRRRRRRRRRRRR"+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				log.info("whileee");
				XBRLBOP0300Bean xb=new XBRLBOP0300Bean();
				
				
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
	
	
	
	
		
		
	/*************DB Link****************/
	
	public ArrayList<XBRLBOP0300Bean> xbrlpymsumEP(String dt1,String dt2,String ReporefSeq,String curr) {
		
		log.info("PYM SUMMARY List Data AB " + dt1 + "dt22222" + dt2);
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLBOP0300Bean> arl = new ArrayList<XBRLBOP0300Bean>();
		
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
		
			
			
			//sql.append("SELECT DYNAMIC_DOMAIN,to_char(REP_DATE,'DD-MM-YYYY')REP_DATE,INSTITUTE_ID,TRAN_ID,INSTITUTE_NAME,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,SECTOR,SPOT_RATE,FWD_RATE,to_char(DUE_DATE,'DD-MM-YYYY')DUE_DATE,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME    FROM   FIM0400_MAST_TABLE  Where  REP_DATE >='"+dt1+"' and REP_DATE <= '"+dt2+"' ORDER BY cast(TRAN_ID as int) ASC ");
			NullCheck chk=new NullCheck();
			
			
				
				
				sql.append("SELECT INSTANCE_CODE,INSTANCE_NAME,to_char(DAILY_AVG_AMOUNT, '9,999,999,999,990.99')DAILY_AVG_AMOUNT,to_char(WGT_AVG_INT_RATE, '9,999,999,999,990.99')WGT_AVG_INT_RATE,to_char(INT_INCOME_EXP, '9,999,999,999,990.99')INT_INCOME_EXP FROM TABLE(BOP0300_RPT_FUN('BOP0300','"+chk.isNotZero(ReporefSeq.trim())+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
			
			
			
			
			/*xbrl_report_master_tb*/
			
			
		   
			
			log.info("BOP SUMMARY "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				XBRLBOP0300Bean xb=new XBRLBOP0300Bean();
				xb.setInstcode(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
				xb.setInstname(NullCheck.isNotNull(rs.getString("INSTANCE_NAME")));			
				xb.setDailyavgamt(NullCheck.isNotNull(rs.getString("DAILY_AVG_AMOUNT")));
				xb.setWgtavgrate(NullCheck.isNotNull(rs.getString("WGT_AVG_INT_RATE")));
				xb.setIntincexp(NullCheck.isNotNull(rs.getString("INT_INCOME_EXP")));
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
	
	
	
	
	/*************************Details BOP0300***********************/
	
	
	
	
	
public ArrayList<XBRLBOP0300Bean> xbrlbopajaxdetails(String repname,String reprefno,String instno,String dt2,String dt1,String curr) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("repname    " + repname + "reprefno   " + reprefno + "instno   " + instno + "dt2     " + dt2 +  "dt1    " + dt1);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLBOP0300Bean> arl = new ArrayList<XBRLBOP0300Bean>();
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
			
			sql.append("SELECT ASSET_LIAB_NR_FLG,ACCT_CRNCY_CODE,NRE_FLG,to_char(BALANCE_AMT, '9,999,999,999,990.99')BALANCE_AMT,to_char(WEIGHTED_AVG_INT_RATE, '9,999,999,999,990.99')WEIGHTED_AVG_INT_RATE,to_char(INTEREST_INCOME_EXP_QTR, '9,999,999,999,990.99')INTEREST_INCOME_EXP_QTR,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE FROM TABLE(BOP0300_DTL_FUN('BOP0300','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");
			
			
			log.info("PYM Vinoth Kumar  "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				//log.info("whileee");
				
				
				 
				XBRLBOP0300Bean xb=new XBRLBOP0300Bean();
				
				
				xb.setAssetlib(NullCheck.isNotNull(rs.getString("ASSET_LIAB_NR_FLG")));
				
				
				xb.setActcrcycode(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
				xb.setNreflg(NullCheck.isNotNull(rs.getString("NRE_FLG")));
				xb.setBalamt(NullCheck.isNotNull(rs.getString("BALANCE_AMT")));
				xb.setWgtavgrate(NullCheck.isNotNull(rs.getString("WEIGHTED_AVG_INT_RATE")));			
				xb.setIntincexp(NullCheck.isNotNull(rs.getString("INTEREST_INCOME_EXP_QTR")));
				xb.setRptDate(df.formatdate(NullCheck.isNotNull(rs.getString("REPORT_DATE"))));			
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







public String detailBOP0300saves() {
		
	HttpServletRequest request = ServletActionContext.getRequest();
DateFormat df=new DateFormat();
ConnectionManager connmgr= new ConnectionManager();
Connection conn=connmgr.getConnection();
	

		
		 try {
		
		 log.info(request.getParameter("refno"));
		 CallableStatement pstmt =  conn.prepareCall("{call FINAL_REPORT_UPDATE_SP(?,?,?,?,?,?)}");
		 pstmt.setString(1, request.getParameter("reptype"));
		 pstmt.setString(2, NullCheck.isNotZero(request.getParameter("refno")));
		 pstmt.setString(3,df.formatdate(request.getParameter("dt2")) );
		 pstmt.setString(4, df.formatdate(request.getParameter("dt1")));
		 pstmt.setString(5, df.formatdate(request.getParameter("dt2")));
		 pstmt.setString(6, request.getParameter("curr"));
		 
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
		
	


public ArrayList<XBRLBOP0300Bean> xbrlBOP4RR(String dt1,String dt2,String ReporefSeq,String instno,String curr) {
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLBOP0300Bean> arl = new ArrayList<XBRLBOP0300Bean>();
	
	
	
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
		
		sql.append("SELECT /* +FIRST_ROWS(100) */ ASSET_LIAB_NR_FLG,ACCT_CRNCY_CODE,NRE_FLG,to_char(BALANCE_AMT, '9,999,999,999,990.99')BALANCE_AMT,to_char(WEIGHTED_AVG_INT_RATE, '9,999,999,999,990.99')WEIGHTED_AVG_INT_RATE,to_char(INTEREST_INCOME_EXP_QTR, '9,999,999,999,990.99')INTEREST_INCOME_EXP_QTR,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,DEL_FLG,RCRE_USER_ID,RCRE_TIME,LCHG_USER_ID,LCHG_TIME FROM TABLE(BOP0300_DTL_FUN('BOP0300','"+ReporefSeq+"','"+instno+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");
		
	log.info("DOC&&&&SELECT"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		
		XBRLBOP0300Bean xb=new XBRLBOP0300Bean();
		
	
		/*log.info("rs.getString======"+rs.getString("CHQ_ALPHA"));
		
		
		
		xb.setChequeAlpha(NullCheck.isNotNull(rs.getString("CHQ_ALPHA")));
		
		log.info("XBBB"+xb.getChequeAlpha());
		if(xb.getChequeAlpha().equals("null")){
			xb.setChequeAlpha("");
			
		}*/
		
		xb.setAssetlib(NullCheck.isNotNull(rs.getString("ASSET_LIAB_NR_FLG")));
		
		
		xb.setActcrcycode(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
		xb.setNreflg(NullCheck.isNotNull(rs.getString("NRE_FLG")));
		xb.setBalamt(NullCheck.isNotNull(rs.getString("BALANCE_AMT")));
		xb.setWgtavgrate(NullCheck.isNotNull(rs.getString("WEIGHTED_AVG_INT_RATE")));			
		xb.setIntincexp(NullCheck.isNotNull(rs.getString("INTEREST_INCOME_EXP_QTR")));
		xb.setRptDate(df.formatdate(NullCheck.isNotNull(rs.getString("REPORT_DATE"))));		
		
		
		
		
		
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

}
	




