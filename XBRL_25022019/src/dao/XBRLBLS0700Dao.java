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
import bean.XBRLBLS0700Bean;
import bean.XBRLPYM0100Bean;
import bean.XBRLReportMasterBean;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRLBLS0700Dao {
	
	static Logger log = Logger.getLogger(XBRLBLS0700Dao.class);
	
	
	public String Reporef;
	
	
	
	
	

		
		
	public String getReporef() {
		return Reporef;
	}

	public void setReporef(String reporef) {
		Reporef = reporef;
	}

	
	
	public ArrayList<XBRLBLS0700Dao> ReporefSeq(String dt1, String dt2) {

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

		ArrayList<XBRLBLS0700Dao> arl = new ArrayList<XBRLBLS0700Dao>();
		sql.append("select REPORT_REF_NO from BLS0700_MOD_TABLE where REPORT_DATE='" + dt2 + "' ORDER BY REPORT_REF_NO");

		log.info("SELECTPROFILE" + sql.toString());

		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLBLS0700Dao xel = new XBRLBLS0700Dao();
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

		
		
	/*************DB Link****************/
	
	public ArrayList<XBRLBLS0700Bean> xbrlpymsumEP(String reptype,String ReporefSeq,String dt1,String dt2,String curr) {
		
		log.info("BLS SUMMARY List Data AB " + dt1 + "dt22222" + dt2);
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLBLS0700Bean> arl = new ArrayList<XBRLBLS0700Bean>();
		
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
			
			
				
				
				sql.append("SELECT INSTANCE_NAME,INSTANCE_CODE,to_char(USD_DEP, '9,999,999,999,990.99')USD_DEP,to_char(EUR_DEP, '9,999,999,999,990.99')EUR_DEP,to_char(GBP_DEP, '9,999,999,999,990.99')GBP_DEP,to_char(RAND_DEP, '9,999,999,999,990.99')RAND_DEP,to_char(OTH_DEP, '9,999,999,999,990.99')OTH_DEP,to_char(USD_NEW_MIN_INT, '9,999,999,999,990.99')USD_NEW_MIN_INT,to_char(USD_NEW_MAX_INT, '9,999,999,999,990.99')USD_NEW_MAX_INT,to_char(USD_NEW_WEIGHTED_AVG, '9,999,999,999,990.99')USD_NEW_WEIGHTED_AVG,to_char(USD_OVERALL_MIN_INT, '9,999,999,999,990.99')USD_OVERALL_MIN_INT,to_char(USD_OVERALL_MAX_INT, '9,999,999,999,990.99')USD_OVERALL_MAX_INT,to_char(USD_OVERALL_WEIGHTED_AVG, '9,999,999,999,990.99')USD_OVERALL_WEIGHTED_AVG,to_char(EUR_NEW_MIN_INT, '9,999,999,999,990.99')EUR_NEW_MIN_INT,to_char(EUR_NEW_MAX_INT, '9,999,999,999,990.99')EUR_NEW_MAX_INT,to_char(EUR_NEW_WEIGHTED_AVG, '9,999,999,999,990.99')EUR_NEW_WEIGHTED_AVG,to_char(EUR_OVERALL_MIN_INT, '9,999,999,999,990.99')EUR_OVERALL_MIN_INT,to_char(EUR_OVERALL_MAX_INT, '9,999,999,999,990.99')EUR_OVERALL_MAX_INT,to_char(EUR_OVERALL_WEIGHTED_AVG, '9,999,999,999,990.99')EUR_OVERALL_WEIGHTED_AVG,to_char(GBP_NEW_MIN_INT, '9,999,999,999,990.99')GBP_NEW_MIN_INT,to_char(GBP_NEW_MAX_INT, '9,999,999,999,990.99')GBP_NEW_MAX_INT,to_char(GBP_NEW_WEIGHTED_AVG, '9,999,999,999,990.99')GBP_NEW_WEIGHTED_AVG,to_char(GBP_OVERALL_MIN_INT, '9,999,999,999,990.99')GBP_OVERALL_MIN_INT,to_char(GBP_OVERALL_MAX_INT, '9,999,999,999,990.99')GBP_OVERALL_MAX_INT,to_char(GBP_OVERALL_WEIGHTED_AVG, '9,999,999,999,990.99')GBP_OVERALL_WEIGHTED_AVG,to_char(RAND_NEW_MIN_INT, '9,999,999,999,990.99')RAND_NEW_MIN_INT,to_char(RAND_NEW_MAX_INT, '9,999,999,999,990.99')RAND_NEW_MAX_INT,to_char(RAND_NEW_WEIGHTED_AVG, '9,999,999,999,990.99')RAND_NEW_WEIGHTED_AVG,to_char(RAND_OVERALL_MIN_INT, '9,999,999,999,990.99')RAND_OVERALL_MIN_INT, to_char(RAND_OVERALL_MAX_INT, '9,999,999,999,990.99')RAND_OVERALL_MAX_INT,to_char(RAND_OVERALL_WEIGHTED_AVG, '9,999,999,999,990.99')RAND_OVERALL_WEIGHTED_AVG FROM TABLE(BLS0700_RPT_FUN('"+reptype+"','"+chk.isNotZero(ReporefSeq.trim())+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
			
			
			
			
			/*xbrl_report_master_tb*/
			
			
		   
			
			log.info("BLS SUMMARY "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				XBRLBLS0700Bean xb=new XBRLBLS0700Bean();
				xb.setInstname(NullCheck.isNotNull(rs.getString("INSTANCE_NAME")));
				xb.setInstcode(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
				xb.setDepusd(NullCheck.isNotNull(rs.getString("USD_DEP")));
				xb.setDepeuro(NullCheck.isNotNull(rs.getString("EUR_DEP")));
				xb.setDepgbp(NullCheck.isNotNull(rs.getString("GBP_DEP")));
				xb.setDeprand(NullCheck.isNotNull(rs.getString("RAND_DEP")));
				xb.setDepothers(NullCheck.isNotNull(rs.getString("OTH_DEP")));
				xb.setMinusd(NullCheck.isNotNull(rs.getString("USD_NEW_MIN_INT")));
				xb.setMaxusd(NullCheck.isNotNull(rs.getString("USD_NEW_MAX_INT")));
				xb.setWgtusd(NullCheck.isNotNull(rs.getString("USD_NEW_WEIGHTED_AVG")));
				xb.setOllminusd(NullCheck.isNotNull(rs.getString("USD_OVERALL_MIN_INT")));
				xb.setOllmaxusd(NullCheck.isNotNull(rs.getString("USD_OVERALL_MAX_INT")));
				xb.setOllwgtusd(NullCheck.isNotNull(rs.getString("USD_OVERALL_WEIGHTED_AVG")));
				xb.setMineuro(NullCheck.isNotNull(rs.getString("EUR_NEW_MIN_INT")));
				xb.setMaxeuro(NullCheck.isNotNull(rs.getString("EUR_NEW_MAX_INT")));
				xb.setWgteuro(NullCheck.isNotNull(rs.getString("EUR_NEW_WEIGHTED_AVG")));
				xb.setOllmineuro(NullCheck.isNotNull(rs.getString("EUR_OVERALL_MIN_INT")));
				xb.setOllmaxeuro(NullCheck.isNotNull(rs.getString("EUR_OVERALL_MAX_INT")));
				xb.setOllwgteuro(NullCheck.isNotNull(rs.getString("EUR_OVERALL_WEIGHTED_AVG")));
				xb.setMingbp(NullCheck.isNotNull(rs.getString("GBP_NEW_MIN_INT")));
				xb.setMaxgbp(NullCheck.isNotNull(rs.getString("GBP_NEW_MAX_INT")));
				xb.setWgtgbp(NullCheck.isNotNull(rs.getString("GBP_NEW_WEIGHTED_AVG")));
				xb.setOllmingbp(NullCheck.isNotNull(rs.getString("GBP_OVERALL_MIN_INT")));
				xb.setOllmaxgbp(NullCheck.isNotNull(rs.getString("GBP_OVERALL_MAX_INT")));
				xb.setOllwgtgbp(NullCheck.isNotNull(rs.getString("GBP_OVERALL_WEIGHTED_AVG")));
				xb.setMinrand(NullCheck.isNotNull(rs.getString("RAND_NEW_MIN_INT")));
				xb.setMaxrand(NullCheck.isNotNull(rs.getString("RAND_NEW_MAX_INT")));
				xb.setWgtrand(NullCheck.isNotNull(rs.getString("RAND_NEW_WEIGHTED_AVG")));
				xb.setOllminrand(NullCheck.isNotNull(rs.getString("RAND_OVERALL_MIN_INT")));
				xb.setOllmaxrand(NullCheck.isNotNull(rs.getString("RAND_OVERALL_MAX_INT")));
				xb.setOllwgtrand(NullCheck.isNotNull(rs.getString("RAND_OVERALL_WEIGHTED_AVG")));

				
				
				
				
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
	
	
	
	
	/*************************Details BLS0700***********************/
	
	
	
	
	
public ArrayList<XBRLBLS0700Bean> xbrlBLSajaxdetails(String repname,String reprefno,String instno,String dt2,String dt1,String curr) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("repname    " + repname + "reprefno   " + reprefno + "instno   " + instno + "dt2     " + dt2 +  "dt1    " + dt1);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLBLS0700Bean> arl = new ArrayList<XBRLBLS0700Bean>();
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
			
			sql.append("SELECT ACCOUNT_NUMBER,ACCOUNT_NAME,SCHEM_TYPE,to_char(INTEREST_RATE, '9,999,999,999,990.99')INTEREST_RATE,INTEREST_PERIOD_DAYS,CURRENCY,to_char(BALANCE_AMT, '9,999,999,999,990.99')BALANCE_AMT,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE FROM TABLE(BLS0700_DTL_FUN('"+repname+"','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");
			
			
			log.info("PYM Vinoth Kumar  "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				//log.info("whileee");
				
				
				 
				XBRLBLS0700Bean xb=new XBRLBLS0700Bean();
				
				xb.setAccno(NullCheck.isNotNull(rs.getString("ACCOUNT_NUMBER")));
				xb.setAccname(NullCheck.isNotNull(rs.getString("ACCOUNT_NAME")));
				xb.setSchmtyp(NullCheck.isNotNull(rs.getString("SCHEM_TYPE")));
				xb.setIntrate(NullCheck.isNotNull(rs.getString("INTEREST_RATE")));
				xb.setIntperioddays(NullCheck.isNotNull(rs.getString("INTEREST_PERIOD_DAYS")));
				xb.setCurr(NullCheck.isNotNull(rs.getString("CURRENCY")));
				xb.setBalamt(NullCheck.isNotNull(rs.getString("BALANCE_AMT")));
				xb.setRptdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
				
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







public String detailBLS0700saves() {
		
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

		
	
public ArrayList<XBRLBLS0700Bean> xbrlBLS4RR(String reptype,String dt1,String dt2,String ReporefSeq,String instno,String curr) {
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLBLS0700Bean> arl = new ArrayList<XBRLBLS0700Bean>();
	
	
	
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
		
		sql.append("SELECT /* +FIRST_ROWS(100) */ ACCOUNT_NUMBER,ACCOUNT_NAME,SCHEM_TYPE,to_char(INTEREST_RATE, '9,999,999,999,990.99')INTEREST_RATE,INTEREST_PERIOD_DAYS,CURRENCY,to_char(BALANCE_AMT, '9,999,999,999,990.99')BALANCE_AMT,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE FROM TABLE(BLS0700_DTL_FUN('"+reptype+"','"+ReporefSeq+"','"+instno+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");
		
	log.info("DOC&&&&SELECT"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		
		XBRLBLS0700Bean xb=new XBRLBLS0700Bean();
		
		

		xb.setAccno(NullCheck.isNotNull(rs.getString("ACCOUNT_NUMBER")));
		xb.setAccname(NullCheck.isNotNull(rs.getString("ACCOUNT_NAME")));
		xb.setSchmtyp(NullCheck.isNotNull(rs.getString("SCHEM_TYPE")));
		xb.setIntrate(NullCheck.isNotNull(rs.getString("INTEREST_RATE")));
		xb.setIntperioddays(NullCheck.isNotNull(rs.getString("INTEREST_PERIOD_DAYS")));
		xb.setCurr(NullCheck.isNotNull(rs.getString("CURRENCY")));
		xb.setBalamt(NullCheck.isNotNull(rs.getString("BALANCE_AMT")));
		xb.setRptdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
		
		
		
		
		
		
		
		
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
	




