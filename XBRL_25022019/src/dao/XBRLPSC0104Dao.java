
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

import com.google.gson.Gson;

import basecode.DateFormat;
import bean.XBRLPSC0104Bean;
import bean.XBRLPSC0104Bean;

import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRLPSC0104Dao {
	
	static Logger log = Logger.getLogger(XBRLPSC0104Dao.class);
	
	public String Reporef;

	public String getReporef() {
		return Reporef;
	}

	public void setReporef(String reporef) {
		Reporef = reporef;
	}
	
	
	public ArrayList<XBRLPSC0104Dao> ReporefSeq(String dt1, String dt2) {

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

		ArrayList<XBRLPSC0104Dao> arl = new ArrayList<XBRLPSC0104Dao>();
		sql.append("select REPORT_REF_NO from ( select REPORT_REF_NO from PSC0104_S1_MOD_TABLE where REPORT_DATE BETWEEN '"+dt1+"' AND '"+dt2+"') union all ( select REPORT_REF_NO from PSC0104_S2_MOD_TABLE where REPORT_DATE BETWEEN '"+dt1+"' AND '"+dt2+"' ) union all ( select REPORT_REF_NO from PSC0104_S3_MOD_TABLE where REPORT_DATE BETWEEN '"+dt1+"' AND '"+dt2+"' )");

		log.info("SELECTPROFILE" + sql.toString());

		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLPSC0104Dao xel = new XBRLPSC0104Dao();
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

	

	


	
public ArrayList<XBRLPSC0104Bean> xbrlpsc0104(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
		
		
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLPSC0104Bean> arl = new ArrayList<XBRLPSC0104Bean>();
		
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
				
				sql.append("SELECT INSTANCE_NAME,INSTANCE_CODE,FOREIGN_BILLS,INV_CORP_SHARE,INV_DEPT,INV_CORP_BOND,INV_OTH_DEPT,OUTSTANDING_OD,to_char(OUTSTANDING_AMT, '9,999,999,999,990.99')OUTSTANDING_AMT,BILLS_RECEIVABLE,to_char(FB_FACILITY_AMT, '9,999,999,999,990.99')FB_FACILITY_AMT,to_char(NFB_FACILITY_AMT, '9,999,999,999,990.99')NFB_FACILITY_AMT  FROM TABLE(PSC0104_S1_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
				
				
			log.info("Psc0104 1"+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				XBRLPSC0104Bean xb=new XBRLPSC0104Bean();
				
			
				xb.setIsicinstname(NullCheck.isNotNull(rs.getString("INSTANCE_NAME")));
				xb.setIsicinstcode(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
				xb.setIsicforebilpuranddisc(NullCheck.isNotNull(rs.getString("FOREIGN_BILLS")));
				xb.setIsicinveincorshare(NullCheck.isNotNull(rs.getString("INV_CORP_SHARE")));
				xb.setIsicinvesindebentu(NullCheck.isNotNull(rs.getString("INV_DEPT")));
				xb.setIsicinvescorpbond	(NullCheck.isNotNull(rs.getString("INV_CORP_BOND")));
				xb.setIsicinvsothedebsecur(NullCheck.isNotNull(rs.getString("INV_OTH_DEPT")));
				xb.setIsicoverdraftoutsidmur(NullCheck.isNotNull(rs.getString("OUTSTANDING_OD")));
				xb.setIsictotoutstloanandoutmur(NullCheck.isNotNull(rs.getString("OUTSTANDING_AMT")));
				xb.setIsicbillsreceiv(NullCheck.isNotNull(rs.getString("BILLS_RECEIVABLE")));
				xb.setIsictotfunbasfaci(NullCheck.isNotNull(rs.getString("FB_FACILITY_AMT")));
				xb.setIsicnonfunbasfaci(NullCheck.isNotNull(rs.getString("NFB_FACILITY_AMT")));

				
					
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
	
public ArrayList<XBRLPSC0104Bean> xbrlpsc0104s2(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {

	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLPSC0104Bean> arl = new ArrayList<XBRLPSC0104Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	
	try {
	
			
			sql.append("SELECT INSTANCE_NAME,INSTANCE_CODE,FOREIGN_BILLS,INV_CORP_SHARE,INV_DEPT,INV_CORP_BOND,INV_OTH_DEPT,OUTSTANDING_OD,to_char(OUTSTANDING_AMT, '9,999,999,999,990.99')OUTSTANDING_AMT,BILLS_RECEIVABLE,to_char(FB_FACILITY_AMT, '9,999,999,999,990.99')FB_FACILITY_AMT,to_char(NFB_FACILITY_AMT, '9,999,999,999,990.99')NFB_FACILITY_AMT  FROM TABLE(PSC0104_S2_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
	
		log.info("Psc0104 2"+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLPSC0104Bean xb=new XBRLPSC0104Bean();
			
			xb.setMemoitmanual1instname(NullCheck.isNotNull(rs.getString("INSTANCE_NAME")));
			xb.setMemoitmanual1instcode(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
			xb.setMemoitmanual1forebilpuranddisc(NullCheck.isNotNull(rs.getString("FOREIGN_BILLS")));
			xb.setMemoitmanual1inveincorshare(NullCheck.isNotNull(rs.getString("INV_CORP_SHARE")));
			xb.setMemoitmanual1invesindebentu(NullCheck.isNotNull(rs.getString("INV_DEPT")));
			xb.setMemoitmanual1invescorpbond(NullCheck.isNotNull(rs.getString("INV_CORP_BOND")));
			xb.setMemoitmanual1invsothedebsecur(NullCheck.isNotNull(rs.getString("INV_OTH_DEPT")));
			xb.setMemoitmanual1overdraftoutsidmur(NullCheck.isNotNull(rs.getString("OUTSTANDING_OD")));
			xb.setMemoitmanual1totoutstloanandoutmur(NullCheck.isNotNull(rs.getString("OUTSTANDING_AMT")));
			xb.setMemoitmanual1billsreceiv(NullCheck.isNotNull(rs.getString("BILLS_RECEIVABLE")));
			xb.setMemoitmanual1totfunbasfaci(NullCheck.isNotNull(rs.getString("FB_FACILITY_AMT")));
			xb.setMemoitmanual1nonfunbasfaci(NullCheck.isNotNull(rs.getString("NFB_FACILITY_AMT")));

				
					
		
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

public ArrayList<XBRLPSC0104Bean> xbrlpsc0104s3(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLPSC0104Bean> arl = new ArrayList<XBRLPSC0104Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	 
	try {
	
			
			sql.append("SELECT INSTANCE_NAME,INSTANCE_CODE,FOREIGN_BILLS,INV_CORP_SHARE,INV_DEPT,INV_CORP_BOND,INV_OTH_DEPT,OUTSTANDING_OD,to_char(OUTSTANDING_AMT, '9,999,999,999,990.99')OUTSTANDING_AMT,BILLS_RECEIVABLE,to_char(FB_FACILITY_AMT, '9,999,999,999,990.99')FB_FACILITY_AMT,to_char(NFB_FACILITY_AMT, '9,999,999,999,990.99')NFB_FACILITY_AMT  FROM TABLE(PSC0104_S3_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
	
		log.info("Psc0104 3"+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLPSC0104Bean xb=new XBRLPSC0104Bean();
			
			xb.setMemoitmanual2instname(NullCheck.isNotNull(rs.getString("INSTANCE_NAME")));
			xb.setMemoitmanual2instcode(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
			xb.setMemoitmanual2forebilpuranddisc(NullCheck.isNotNull(rs.getString("FOREIGN_BILLS")));
			xb.setMemoitmanual2inveincorshare(NullCheck.isNotNull(rs.getString("INV_CORP_SHARE")));
			xb.setMemoitmanual2invesindebentu(NullCheck.isNotNull(rs.getString("INV_DEPT")));
			xb.setMemoitmanual2invescorpbond(NullCheck.isNotNull(rs.getString("INV_CORP_BOND")));
			xb.setMemoitmanual2invsothedebsecur(NullCheck.isNotNull(rs.getString("INV_OTH_DEPT")));
			xb.setMemoitmanual2overdraftoutsidmur(NullCheck.isNotNull(rs.getString("OUTSTANDING_OD")));
			xb.setMemoitmanual2totoutstloanandoutmur(NullCheck.isNotNull(rs.getString("OUTSTANDING_AMT")));
			xb.setMemoitmanual2billsreceiv(NullCheck.isNotNull(rs.getString("BILLS_RECEIVABLE")));
			xb.setMemoitmanual2totfunbasfaci(NullCheck.isNotNull(rs.getString("FB_FACILITY_AMT")));
			xb.setMemoitmanual2nonfunbasfaci(NullCheck.isNotNull(rs.getString("NFB_FACILITY_AMT")));

		
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

public ArrayList<XBRLPSC0104Bean> xbrlpsc0104ajaxdetails1(String repname,String reprefno,String instno,String dt2,String curr) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("repname    " + repname + "reprefno   "  + reprefno + "instno"+ instno +"dt2   " + dt2 +"currency" +curr);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLPSC0104Bean> arl = new ArrayList<XBRLPSC0104Bean>();
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
		
			
		//	log.info("AJAX DETAILS KUMAR" + reprefno );
			
			
			//sql.append("SELECT   /* +FIRST_ROWS(100) */ ACCT_NUMBER,CUST_ID,CUST_NAME,NRE_FLG,COUNTRY_CODE,UNIQUE_IDENTIFIER,ISIC_CODE,GROUP_CODE,to_char(OUTSTANDING_AMT, '9,999,999,999,990.99')OUTSTANDING_AMT,to_char(OUTSTANDING_AMT, '9,999,999,999,990.99')OUTSTANDING_NFB_AMT,PURPOSE,INSTITUTIIONAL_SECTOR,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE FROM TABLE(PSC0200_DTL_FUN('PSC0200','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
			sql.append("SELECT /* +FIRST_ROWS(100) */  CATEGORY,FBILL_PUR_DISC,INVST_CORP_SHARES,INVST_DEBNT,INVST_COPR_BONDS,INVST_OTH_DEBTS,OS_LOANS_OUT_MUR,OS_ODS_OUT_MUR,BILLS_RECEIVABLE,NFB_FACILITY_AMT,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE FROM TABLE(PSC0104_S1_DTL_FUN('PSC0104','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
			log.info("BLS  Kumar  "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				//log.info("whileee");
								
				 
				XBRLPSC0104Bean xb=new XBRLPSC0104Bean();
				
				
				xb.setCat1(NullCheck.isNotNull(rs.getString("CATEGORY")));
				xb.setFpd1(NullCheck.isNotNull(rs.getString("FBILL_PUR_DISC")));
				xb.setIncosh1(NullCheck.isNotNull(rs.getString("INVST_CORP_SHARES")));
				xb.setIndeb1(NullCheck.isNotNull(rs.getString("INVST_DEBNT")));
				xb.setInvcorbo1(NullCheck.isNotNull(rs.getString("INVST_COPR_BONDS")));
				xb.setInvotdeb1(NullCheck.isNotNull(rs.getString("INVST_OTH_DEBTS")));	
				xb.setOsloan1(NullCheck.isNotNull(rs.getString("OS_LOANS_OUT_MUR")));
				xb.setOsods1(NullCheck.isNotNull(rs.getString("OS_ODS_OUT_MUR")));
				xb.setBillre1(NullCheck.isNotNull(rs.getString("BILLS_RECEIVABLE")));
				xb.setNebfac1(NullCheck.isNotNull(rs.getString("NFB_FACILITY_AMT")));
				xb.setRedate1(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
						
				/*xb.setDelflg(NullCheck.isNotNull(rs.getString("DEL_FLG")));
				xb.setRcrusrid(NullCheck.isNotNull(rs.getString("RCRE_USER_ID")));
				xb.setRcrtime(NullCheck.isNotNull(rs.getString("RCRE_TIME")));
				xb.setLchgusrid(NullCheck.isNotNull(rs.getString("LCHG_USER_ID")));
				xb.setLchgtime(NullCheck.isNotNull(rs.getString("LCHG_TIME")));*/
				
		
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

public ArrayList<XBRLPSC0104Bean> xbrlpsc0104ajaxdetails2(String repname,String reprefno,String instno,String dt2,String curr) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("repname    " + repname + "reprefno   "  + reprefno + "instno"+ instno +"dt2   " + dt2 +"currency" +curr);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLPSC0104Bean> arl = new ArrayList<XBRLPSC0104Bean>();
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
		
			
		//	log.info("AJAX DETAILS KUMAR" + reprefno );
			
			
			//sql.append("SELECT   /* +FIRST_ROWS(100) */ ACCT_NUMBER,CUST_ID,CUST_NAME,NRE_FLG,COUNTRY_CODE,UNIQUE_IDENTIFIER,ISIC_CODE,GROUP_CODE,to_char(OUTSTANDING_AMT, '9,999,999,999,990.99')OUTSTANDING_AMT,to_char(OUTSTANDING_AMT, '9,999,999,999,990.99')OUTSTANDING_NFB_AMT,PURPOSE,INSTITUTIIONAL_SECTOR,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE FROM TABLE(PSC0200_DTL_FUN('PSC0200','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
			sql.append("SELECT /* +FIRST_ROWS(100) */  CATEGORY,FBILL_PUR_DISC,INVST_CORP_SHARES,INVST_DEBNT,INVST_COPR_BONDS,INVST_OTH_DEBTS,OS_LOANS_OUT_MUR,OS_ODS_OUT_MUR,BILLS_RECEIVABLE,NFB_FACILITY_AMT,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE FROM TABLE(PSC0104_S2_DTL_FUN('PSC0104','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
			log.info("BLS  Kumar  "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				//log.info("whileee");
								
				 
				XBRLPSC0104Bean xb=new XBRLPSC0104Bean();
				
				
				xb.setCat2(NullCheck.isNotNull(rs.getString("CATEGORY")));
				xb.setFpd2(NullCheck.isNotNull(rs.getString("FBILL_PUR_DISC")));
				xb.setIncosh2(NullCheck.isNotNull(rs.getString("INVST_CORP_SHARES")));
				xb.setIndeb2(NullCheck.isNotNull(rs.getString("INVST_DEBNT")));
				xb.setInvcorbo2(NullCheck.isNotNull(rs.getString("INVST_COPR_BONDS")));
				xb.setInvotdeb2(NullCheck.isNotNull(rs.getString("INVST_OTH_DEBTS")));	
				xb.setOsloan2(NullCheck.isNotNull(rs.getString("OS_LOANS_OUT_MUR")));
				xb.setOsods2(NullCheck.isNotNull(rs.getString("OS_ODS_OUT_MUR")));
				xb.setBillre2(NullCheck.isNotNull(rs.getString("BILLS_RECEIVABLE")));
				xb.setNebfac2(NullCheck.isNotNull(rs.getString("NFB_FACILITY_AMT")));
				xb.setRedate2(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
						
				/*xb.setDelflg(NullCheck.isNotNull(rs.getString("DEL_FLG")));
				xb.setRcrusrid(NullCheck.isNotNull(rs.getString("RCRE_USER_ID")));
				xb.setRcrtime(NullCheck.isNotNull(rs.getString("RCRE_TIME")));
				xb.setLchgusrid(NullCheck.isNotNull(rs.getString("LCHG_USER_ID")));
				xb.setLchgtime(NullCheck.isNotNull(rs.getString("LCHG_TIME")));*/
				
		
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

public ArrayList<XBRLPSC0104Bean> xbrlpsc0104ajaxdetails3(String repname,String reprefno,String instno,String dt2,String curr) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("repname    " + repname + "reprefno   "  + reprefno + "instno"+ instno +"dt2   " + dt2 +"currency" +curr);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLPSC0104Bean> arl = new ArrayList<XBRLPSC0104Bean>();
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
		
			
		//	log.info("AJAX DETAILS KUMAR" + reprefno );
			
			
			//sql.append("SELECT   /* +FIRST_ROWS(100) */ ACCT_NUMBER,CUST_ID,CUST_NAME,NRE_FLG,COUNTRY_CODE,UNIQUE_IDENTIFIER,ISIC_CODE,GROUP_CODE,to_char(OUTSTANDING_AMT, '9,999,999,999,990.99')OUTSTANDING_AMT,to_char(OUTSTANDING_AMT, '9,999,999,999,990.99')OUTSTANDING_NFB_AMT,PURPOSE,INSTITUTIIONAL_SECTOR,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE FROM TABLE(PSC0200_DTL_FUN('PSC0200','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
			sql.append("SELECT /* +FIRST_ROWS(100) */  CATEGORY,FBILL_PUR_DISC,INVST_CORP_SHARES,INVST_DEBNT,INVST_COPR_BONDS,INVST_OTH_DEBTS,OS_LOANS_OUT_MUR,OS_ODS_OUT_MUR,BILLS_RECEIVABLE,NFB_FACILITY_AMT,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE FROM TABLE(PSC0104_S3_DTL_FUN('PSC0104','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
			log.info("BLS  Kumar  "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				//log.info("whileee");
								
				 
				XBRLPSC0104Bean xb=new XBRLPSC0104Bean();
				
				
				xb.setCat3(NullCheck.isNotNull(rs.getString("CATEGORY")));
				xb.setFpd3(NullCheck.isNotNull(rs.getString("FBILL_PUR_DISC")));
				xb.setIncosh3(NullCheck.isNotNull(rs.getString("INVST_CORP_SHARES")));
				xb.setIndeb3(NullCheck.isNotNull(rs.getString("INVST_DEBNT")));
				xb.setInvcorbo3(NullCheck.isNotNull(rs.getString("INVST_COPR_BONDS")));
				xb.setInvotdeb3(NullCheck.isNotNull(rs.getString("INVST_OTH_DEBTS")));	
				xb.setOsloan3(NullCheck.isNotNull(rs.getString("OS_LOANS_OUT_MUR")));
				xb.setOsods3(NullCheck.isNotNull(rs.getString("OS_ODS_OUT_MUR")));
				xb.setBillre3(NullCheck.isNotNull(rs.getString("BILLS_RECEIVABLE")));
				xb.setNebfac3(NullCheck.isNotNull(rs.getString("NFB_FACILITY_AMT")));
				xb.setRedate3(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
						
				/*xb.setDelflg(NullCheck.isNotNull(rs.getString("DEL_FLG")));
				xb.setRcrusrid(NullCheck.isNotNull(rs.getString("RCRE_USER_ID")));
				xb.setRcrtime(NullCheck.isNotNull(rs.getString("RCRE_TIME")));
				xb.setLchgusrid(NullCheck.isNotNull(rs.getString("LCHG_USER_ID")));
				xb.setLchgtime(NullCheck.isNotNull(rs.getString("LCHG_TIME")));*/
				
		
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
public ArrayList<XBRLPSC0104Bean> xbrlpsc4RR1(String dt1,String dt2,String reprefno,String instno,String curr) {

HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

ArrayList<XBRLPSC0104Bean> arl = new ArrayList<XBRLPSC0104Bean>();
NullCheck chk=new NullCheck();


String status = "";

ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();

PreparedStatement ps = null;

StringBuffer sql = new StringBuffer();


DateFormat df=new DateFormat();

dt1 =df.formatdate(dt1);
dt2 =df.formatdate(dt2);

//sql.append("SELECT * FROM TABLE(PSC0104_DTL_FUN('PSC0104','0','0','31-AUG-2018','01-AUG-2018','31-AUG-2018','MUR'))";

sql.append("SELECT /* +FIRST_ROWS(100) */  CATEGORY,FBILL_PUR_DISC,INVST_CORP_SHARES,INVST_DEBNT,INVST_COPR_BONDS,INVST_OTH_DEBTS,OS_LOANS_OUT_MUR,OS_ODS_OUT_MUR,BILLS_RECEIVABLE,NFB_FACILITY_AMT,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE FROM TABLE(PSC0104_S1_DTL_FUN('PSC0104','0','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");	
log.info("DOC&&&&SELECT Gayu"+sql.toString());
try {
ps=conn.prepareStatement(sql.toString());

    ResultSet rs=ps.executeQuery();
     

while(rs.next()){

XBRLPSC0104Bean xb=new XBRLPSC0104Bean();

xb.setCat1(NullCheck.isNotNull(rs.getString("CATEGORY")));
xb.setFpd1(NullCheck.isNotNull(rs.getString("FBILL_PUR_DISC")));
xb.setIncosh1(NullCheck.isNotNull(rs.getString("INVST_CORP_SHARES")));
xb.setIndeb1(NullCheck.isNotNull(rs.getString("INVST_DEBNT")));
xb.setInvcorbo1(NullCheck.isNotNull(rs.getString("INVST_COPR_BONDS")));
xb.setInvotdeb1(NullCheck.isNotNull(rs.getString("INVST_OTH_DEBTS")));	
xb.setOsloan1(NullCheck.isNotNull(rs.getString("OS_LOANS_OUT_MUR")));
xb.setOsods1(NullCheck.isNotNull(rs.getString("OS_ODS_OUT_MUR")));
xb.setBillre1(NullCheck.isNotNull(rs.getString("BILLS_RECEIVABLE")));
xb.setNebfac1(NullCheck.isNotNull(rs.getString("NFB_FACILITY_AMT")));
xb.setRedate1(NullCheck.isNotNull(rs.getString("REPORT_DATE")));


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
public ArrayList<XBRLPSC0104Bean> xbrlpsc4RR2(String dt1,String dt2,String reprefno,String instno,String curr) {

HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

ArrayList<XBRLPSC0104Bean> arl = new ArrayList<XBRLPSC0104Bean>();
NullCheck chk=new NullCheck();


String status = "";

ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();

PreparedStatement ps = null;

StringBuffer sql = new StringBuffer();


DateFormat df=new DateFormat();

dt1 =df.formatdate(dt1);
dt2 =df.formatdate(dt2);

//sql.append("SELECT * FROM TABLE(PSC0104_DTL_FUN('PSC0104','0','0','31-AUG-2018','01-AUG-2018','31-AUG-2018','MUR'))";

sql.append("SELECT /* +FIRST_ROWS(100) */  CATEGORY,FBILL_PUR_DISC,INVST_CORP_SHARES,INVST_DEBNT,INVST_COPR_BONDS,INVST_OTH_DEBTS,OS_LOANS_OUT_MUR,OS_ODS_OUT_MUR,BILLS_RECEIVABLE,NFB_FACILITY_AMT,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE FROM TABLE(PSC0104_S2_DTL_FUN('PSC0104','0','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");	
log.info("DOC&&&&SELECT Gayu"+sql.toString());
try {
ps=conn.prepareStatement(sql.toString());

    ResultSet rs=ps.executeQuery();
     

while(rs.next()){

XBRLPSC0104Bean xb=new XBRLPSC0104Bean();

xb.setCat2(NullCheck.isNotNull(rs.getString("CATEGORY")));
xb.setFpd2(NullCheck.isNotNull(rs.getString("FBILL_PUR_DISC")));
xb.setIncosh2(NullCheck.isNotNull(rs.getString("INVST_CORP_SHARES")));
xb.setIndeb2(NullCheck.isNotNull(rs.getString("INVST_DEBNT")));
xb.setInvcorbo2(NullCheck.isNotNull(rs.getString("INVST_COPR_BONDS")));
xb.setInvotdeb2(NullCheck.isNotNull(rs.getString("INVST_OTH_DEBTS")));	
xb.setOsloan2(NullCheck.isNotNull(rs.getString("OS_LOANS_OUT_MUR")));
xb.setOsods2(NullCheck.isNotNull(rs.getString("OS_ODS_OUT_MUR")));
xb.setBillre2(NullCheck.isNotNull(rs.getString("BILLS_RECEIVABLE")));
xb.setNebfac2(NullCheck.isNotNull(rs.getString("NFB_FACILITY_AMT")));
xb.setRedate2(NullCheck.isNotNull(rs.getString("REPORT_DATE")));



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


public ArrayList<XBRLPSC0104Bean> xbrlpsc4RR3(String dt1,String dt2,String reprefno,String instno,String curr) {

HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

ArrayList<XBRLPSC0104Bean> arl = new ArrayList<XBRLPSC0104Bean>();
NullCheck chk=new NullCheck();


String status = "";

ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();

PreparedStatement ps = null;

StringBuffer sql = new StringBuffer();


DateFormat df=new DateFormat();

dt1 =df.formatdate(dt1);
dt2 =df.formatdate(dt2);

//sql.append("SELECT * FROM TABLE(PSC0104_DTL_FUN('PSC0104','0','0','31-AUG-2018','01-AUG-2018','31-AUG-2018','MUR'))";

sql.append("SELECT /* +FIRST_ROWS(100) */  CATEGORY,FBILL_PUR_DISC,INVST_CORP_SHARES,INVST_DEBNT,INVST_COPR_BONDS,INVST_OTH_DEBTS,OS_LOANS_OUT_MUR,OS_ODS_OUT_MUR,BILLS_RECEIVABLE,NFB_FACILITY_AMT,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE FROM TABLE(PSC0104_S3_DTL_FUN('PSC0104','0','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");	
log.info("DOC&&&&SELECT Gayu"+sql.toString());
try {
ps=conn.prepareStatement(sql.toString());

    ResultSet rs=ps.executeQuery();
     

while(rs.next()){

XBRLPSC0104Bean xb=new XBRLPSC0104Bean();


xb.setCat3(NullCheck.isNotNull(rs.getString("CATEGORY")));
xb.setFpd3(NullCheck.isNotNull(rs.getString("FBILL_PUR_DISC")));
xb.setIncosh3(NullCheck.isNotNull(rs.getString("INVST_CORP_SHARES")));
xb.setIndeb3(NullCheck.isNotNull(rs.getString("INVST_DEBNT")));
xb.setInvcorbo3(NullCheck.isNotNull(rs.getString("INVST_COPR_BONDS")));
xb.setInvotdeb3(NullCheck.isNotNull(rs.getString("INVST_OTH_DEBTS")));	
xb.setOsloan3(NullCheck.isNotNull(rs.getString("OS_LOANS_OUT_MUR")));
xb.setOsods3(NullCheck.isNotNull(rs.getString("OS_ODS_OUT_MUR")));
xb.setBillre3(NullCheck.isNotNull(rs.getString("BILLS_RECEIVABLE")));
xb.setNebfac3(NullCheck.isNotNull(rs.getString("NFB_FACILITY_AMT")));
xb.setRedate3(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
		



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
