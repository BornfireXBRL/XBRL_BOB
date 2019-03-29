package dao;


import java.sql.CallableStatement;

/****************************************************************************************************************
*																												*
* 	* @companyName 			:	Bonfire Innovation Private Limited Chennai										*
* 	* @project 				:	Extensible Business Reporting Language (XBRL)									*
* 	* @name 				:	XBRLCRR0100Action.java															*
* 	* @path 				:	action																			*
* 	* @author 				:	D PraveenBabu																	*
* 	* @version 				: 	1.0																				*
* 	* @functionality 		:	It contains the action with multiple methods to create SUP01400 Report.													*
* 	* @relatedScripts 		: 	bean.XBRLSUP1400Bean.java,dao.XBRLCRR0100Dao.java 								*
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
import bean.XBRLBLS0104Bean;
import bean.XBRLCRR0100Bean;
import bean.XBRLCRR0100Bean;
import bean.XBRLCRR0100Bean;
import bean.XBRLCRR0100Bean;

import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRLCRR0100Dao {
	
	static Logger log = Logger.getLogger(XBRLCRR0100Dao.class);
	
	public String Reporef;

	public String getReporef() {
		return Reporef;
	}

	public void setReporef(String reporef) {
		Reporef = reporef;
	}
	public String cnt;
	public static Logger getLog() {
		return log;
	}

	public static void setLog(Logger log) {
		XBRLCRR0100Dao.log = log;
	}

	public String getCnt() {
		return cnt;
	}

	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
    public int cnt1;
	
	
	public int getCnt1() {
		return cnt1;
	}

	public void setCnt1(int cnt1) {
		this.cnt1 = cnt1;
	}

	public ArrayList<XBRLCRR0100Dao> ReporefSeq(String dt1, String dt2) {

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

		ArrayList<XBRLCRR0100Dao> arl = new ArrayList<XBRLCRR0100Dao>();
		
		sql.append("select REPORT_REF_NO from CRR0100_MOD_TABLE where REPORT_DATE='" + dt2 + "' ORDER BY REPORT_REF_NO");

		log.info("SELECTPROFILE" + sql.toString());

		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLCRR0100Dao xel = new XBRLCRR0100Dao();
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
	public String CRR0100chckmodified() {

		HttpServletRequest request = ServletActionContext.getRequest();
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		HttpSession session = request.getSession();
		StringBuffer sql = new StringBuffer();
		DateFormat df=new DateFormat();		
		sql.setLength(0);
		if(request.getParameter("type").equals("chkuser")) {
			sql.append(" select (select count(REPORT_DATE)  from CRR0100_MOD_TABLE)+(select count(REPORT_DATE)  from CRR0100_S10_MOD_TABLE)  AS CNT from dual");	
			log.info("bj"+sql.toString());
			}else {
			sql.append(" select (select count(REPORT_DATE)  from CRR0100_MOD_TABLE)+(select count(REPORT_DATE)  from CRR0100_S10_MOD_TABLE)  AS CNT from dual");	
			log.info("bh"+sql.toString());
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
	
	
	
	public String detailCRR0100savecheck() {

		ConnectionManager connmgr=new ConnectionManager();
		Connection conn=connmgr.getConnection();
		ArrayList<String> arl = new ArrayList<String>();
				HttpServletRequest request = ServletActionContext.getRequest();
				DateFormat df = new DateFormat();
				StringBuffer sql = new StringBuffer();
				PreparedStatement ps = null;
				
				sql.append("SELECT COUNT(REPORT_DATE) as repdate FROM CRR0100_RPT_TB where REPORT_ID = '"+request.getParameter("reptype")+"' AND  REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ");
				 log.info(sql.toString());
					
					try {
						ps = conn.prepareStatement(sql.toString());
						ResultSet rs = ps.executeQuery();
					

						while (rs.next()) {
							
							cnt1=rs.getInt("repdate");
						
						}
						log.info("fdsafdsaf"+cnt1);

						
					
					
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
	
	
	public String detailCRR0100saves() {

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
public ArrayList<XBRLCRR0100Bean> xbrlCRR0100(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
		
		
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLCRR0100Bean> arl = new ArrayList<XBRLCRR0100Bean>();
		
		String status = "";
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		
		PreparedStatement ps = null;
		
		StringBuffer sql = new StringBuffer();
		
		
		DateFormat df=new DateFormat();		
		dt1 =df.formatdate(dt1);
		dt2 =df.formatdate(dt2);
		
		log.info("currency"+curr);
		
		 DecimalFormat dfs = new DecimalFormat("##,##.00");  
		 NullCheck chk=new NullCheck();
	
		try {
		
/*			sql.append("SELECT SL_NO,REPORT_DAY,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,to_char(DEP_MUR, '9,999,999,999,990.99')DEP_MUR,to_char(DEP_EUR, '9,999,999,999,990.99')DEP_EUR,to_char(DEP_GBP, '9,999,999,999,990.99')DEP_GBP,to_char(DEP_USD, '9,999,999,999,990.99')DEP_USD,to_char(DEP_OTHERS, '9,999,999,999,990.99')DEP_OTHERS   FROM TABLE(CRR0100_RPT_FUN('"+reptype+"','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))WHERE SECTION_ID='1'");
*/
				
				sql.append("SELECT REPORT_ID,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,FROM_DATE,TO_DATE,VERSION_NO,CURRENCY,SECTION_ID,SECTION_REF_ID,SL_NO,REPORT_DAY,to_char(REPORT_DATE_VAL,'DD-MM-YYYY')REPORT_DATE_VAL,to_char(DEP_MUR, '9,999,999,999,990.99')DEP_MUR,to_char(DEP_EUR, '9,999,999,999,990.99')DEP_EUR,to_char(DEP_GBP, '9,999,999,999,990.99')DEP_GBP,to_char(DEP_USD, '9,999,999,999,990.99')DEP_USD,to_char(DEP_OTHERS, '9,999,999,999,990.99')DEP_OTHERS  FROM TABLE(CRR0100_RPT_FUN('"+reptype+"','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
				
				
			log.info("CRR0100 1"+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				XBRLCRR0100Bean xb=new XBRLCRR0100Bean();
				
			
				xb.setRepid(NullCheck.isNotNull(rs.getString("REPORT_ID")));
				xb.setRepdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
				xb.setFrmdate(NullCheck.isNotNull(rs.getString("FROM_DATE")));
				xb.setTodate(NullCheck.isNotNull(rs.getString("TO_DATE")));
				xb.setVersnno(NullCheck.isNotNull(rs.getString("VERSION_NO")));
				xb.setCurr(NullCheck.isNotNull(rs.getString("CURRENCY")));
				xb.setSecid(NullCheck.isNotNull(rs.getString("SECTION_ID")));
				xb.setSecrefid(NullCheck.isNotNull(rs.getString("SECTION_REF_ID")));
				xb.setSlno(NullCheck.isNotNull(rs.getString("SL_NO")));
				xb.setRepday(NullCheck.isNotNull(rs.getString("REPORT_DAY")));
				xb.setRepdateval(NullCheck.isNotNull(rs.getString("REPORT_DATE_VAL")));
				xb.setMur(NullCheck.isNotNull(rs.getString("DEP_MUR")));
				xb.setEur(NullCheck.isNotNull(rs.getString("DEP_EUR")));
				xb.setGbp(NullCheck.isNotNull(rs.getString("DEP_GBP")));
				xb.setUsd(NullCheck.isNotNull(rs.getString("DEP_USD")));
				xb.setOthers(NullCheck.isNotNull(rs.getString("DEP_OTHERS")));

/*
				xb.setSrlno(NullCheck.isNotNull(rs.getString("SL_NO")));
				xb.setRptday(NullCheck.isNotNull(rs.getString("REPORT_DAY")));
				xb.setRptdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
				xb.setDepamtmur(NullCheck.isNotNull(rs.getString("DEP_MUR")));
				xb.setDepdeneur(NullCheck.isNotNull(rs.getString("DEP_EUR")));
				xb.setDepdengbp(NullCheck.isNotNull(rs.getString("DEP_GBP")));
				xb.setDepdenusd(NullCheck.isNotNull(rs.getString("DEP_USD")));
				xb.setUsdequothcrncy(NullCheck.isNotNull(rs.getString("DEP_OTHERS")));
*/
				
					
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

public ArrayList<XBRLCRR0100Bean> xbrlCRR0100s10(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLCRR0100Bean> arl = new ArrayList<XBRLCRR0100Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	 
	try {
	
			
			sql.append("SELECT SL_NO,REPORT_DAY,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,to_char(TREASURY_BILL_BANK, '9,999,999,999,990.99')TREASURY_BILL_BANK,to_char(TREASURY_BILL_TRADE, '9,999,999,999,990.99')TREASURY_BILL_TRADE  FROM TABLE(CRR0100_S10_RPT_FUN('"+reptype+"','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
	
		log.info("CRR0100 10"+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLCRR0100Bean xb=new XBRLCRR0100Bean();
			
			xb.setSec10srlno(NullCheck.isNotNull(rs.getString("SL_NO")));
			xb.setSec10rptday(NullCheck.isNotNull(rs.getString("REPORT_DAY")));
			xb.setSec10rptdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
			xb.setSec10tresubilbank(NullCheck.isNotNull(rs.getString("TREASURY_BILL_BANK")));
			xb.setSec10tresubiltrade(NullCheck.isNotNull(rs.getString("TREASURY_BILL_TRADE")));
			
			
			

		
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






public ArrayList<XBRLCRR0100Bean> xbrlCRR0100ajaxdetails(String repname,String reprefno,String instno,String dt2,String curr) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("repname    " + repname + "reprefno   "  + reprefno + "instno"+ instno +"dt2   " + dt2 +"currency" +curr);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLCRR0100Bean> arl = new ArrayList<XBRLCRR0100Bean>();
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
			
			sql.append("SELECT /* +FIRST_ROWS(100) */ ACCT_NUMBER,ACCT_NAME,CUST_ID,to_char(ACCT_BALANCE_AMT_AC, '9,999,999,999,990.99')ACCT_BALANCE_AMT_AC,ACCT_CRNCY_CODE,NATURE_OF_CUST,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE  FROM TABLE(CRR0100_DTL_FUN('CRR0100','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
			log.info("CRR  Kumar  "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				//log.info("whileee");
								
				 
				XBRLCRR0100Bean xb=new XBRLCRR0100Bean();
				
				
				xb.setAccno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
				xb.setAccnam(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
				xb.setCusid(NullCheck.isNotNull(rs.getString("CUST_ID")));
				xb.setAccbalamtac(NullCheck.isNotNull(rs.getString("ACCT_BALANCE_AMT_AC")));
				xb.setAccrcode(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
				xb.setNatofcus(NullCheck.isNotNull(rs.getString("NATURE_OF_CUST")));
				xb.setReportdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
			

						
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

public ArrayList<XBRLCRR0100Bean> xbrlCRR0100ajaxdetails10(String repname,String reprefno,String instno,String dt2,String curr) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("repname    " + repname + "reprefno   "  + reprefno + "instno"+ instno +"dt2   " + dt2 +"currency" +curr);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLCRR0100Bean> arl = new ArrayList<XBRLCRR0100Bean>();
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
			
			sql.append("SELECT /* +FIRST_ROWS(100) */ TREASURY_BILLS_BANK,TREASURY_BILLS_TRADE,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE FROM TABLE(CRR0100_S10_DTL_FUN('CRR0100','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
			log.info("CRR  Kumar  "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				//log.info("whileee");
								
				 
				XBRLCRR0100Bean xb=new XBRLCRR0100Bean();
				
				
				xb.setTrbilsbank(NullCheck.isNotNull(rs.getString("TREASURY_BILLS_BANK")));
				xb.setTrsbillstrade(NullCheck.isNotNull(rs.getString("TREASURY_BILLS_TRADE")));
				xb.setRdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
				
			

						
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






public ArrayList<XBRLCRR0100Bean> xbrlcrr4RR(String dt1,String dt2,String reprefno,String instno,String curr) {

HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

ArrayList<XBRLCRR0100Bean> arl = new ArrayList<XBRLCRR0100Bean>();
NullCheck chk=new NullCheck();


String status = "";

ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();

PreparedStatement ps = null;

StringBuffer sql = new StringBuffer();


DateFormat df=new DateFormat();

dt1 =df.formatdate(dt1);
dt2 =df.formatdate(dt2);

//sql.append("SELECT * FROM TABLE(CRR0100_DTL_FUN('CRR0100','0','0','31-AUG-2018','01-AUG-2018','31-AUG-2018','MUR'))";
for(int i=1;i<10;i++) {
	sql.setLength(0);
sql.append("SELECT  ACCT_NUMBER,ACCT_NAME,CUST_ID,to_char(ACCT_BALANCE_AMT_AC, '9,999,999,999,990.99')ACCT_BALANCE_AMT_AC,ACCT_CRNCY_CODE,NATURE_OF_CUST,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE FROM TABLE(CRR0100_DTL_FUN('CRR0100','0','SEC"+i+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");	
log.info("DOC&&&&SELECT Gayu"+sql.toString());
try {
ps=conn.prepareStatement(sql.toString());

    ResultSet rs=ps.executeQuery();
     

while(rs.next()){

XBRLCRR0100Bean xb=new XBRLCRR0100Bean();

xb.setAccno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
xb.setAccnam(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
xb.setCusid(NullCheck.isNotNull(rs.getString("CUST_ID")));
xb.setAccbalamtac(NullCheck.isNotNull(rs.getString("ACCT_BALANCE_AMT_AC")));
xb.setAccrcode(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
xb.setNatofcus(NullCheck.isNotNull(rs.getString("NATURE_OF_CUST")));
xb.setReportdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
xb.setSecid("SEC"+i);



arl.add(xb);
}
}catch(SQLException e){
e.printStackTrace();
}
}



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
return arl;
}

public ArrayList<XBRLCRR0100Bean> xbrlcrr4RR10(String dt1,String dt2,String reprefno,String instno,String curr) {

HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

ArrayList<XBRLCRR0100Bean> arl = new ArrayList<XBRLCRR0100Bean>();
NullCheck chk=new NullCheck();


String status = "";

ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();

PreparedStatement ps = null;

StringBuffer sql = new StringBuffer();


DateFormat df=new DateFormat();

dt1 =df.formatdate(dt1);
dt2 =df.formatdate(dt2);

//sql.append("SELECT * FROM TABLE(CRR0100_DTL_FUN('CRR0100','0','0','31-AUG-2018','01-AUG-2018','31-AUG-2018','MUR'))";

sql.append("SELECT  TREASURY_BILLS_BANK,TREASURY_BILLS_TRADE,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE FROM  TABLE(CRR0100_S10_DTL_FUN('CRR0100','0','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");	
log.info("DOC&&&&SELECT Gayu"+sql.toString());
try {
ps=conn.prepareStatement(sql.toString());

    ResultSet rs=ps.executeQuery();
     

while(rs.next()){

XBRLCRR0100Bean xb=new XBRLCRR0100Bean();

xb.setTrbilsbank(NullCheck.isNotNull(rs.getString("TREASURY_BILLS_BANK")));
xb.setTrsbillstrade(NullCheck.isNotNull(rs.getString("TREASURY_BILLS_TRADE")));
xb.setRdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));




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


public String resalert;

public String getResalert() {
	return resalert;
}

public void setResalert(String resalert) {
	this.resalert = resalert;
}
public String modCRR0100cancel() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	log.info("sf+"+request.getParameter("tabid"));
	int tab=Integer.parseInt(request.getParameter("tabid"));
if(tab==1) {
	sql.append("DELETE FROM CRR0100_MOD_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("reportdate")))+"' AND ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("accno"))+"'");
	
}
else {
	sql.append("DELETE FROM CRR0100_S10_MOD_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("rdate")))+"' AND TREASURY_BILLS_TRADE='"+NullCheck.isNotNull(request.getParameter("trsbillstrade"))+"'");
}
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
public ArrayList<XBRLCRR0100Bean>CRR0100verify(){
	
	ArrayList<XBRLCRR0100Bean> arl = new ArrayList<XBRLCRR0100Bean>();
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	log.info("gfchj");
	sql.append("SELECT ACCT_NUMBER,ACCT_NAME,CUST_ID,to_char(ACCT_BALANCE_AMT_AC, '9,999,999,999,990.99')ACCT_BALANCE_AMT_AC,ACCT_CRNCY_CODE,NATURE_OF_CUST,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,DECODE(DEL_FLG,'A','Added','M','Modified','D','Deleted') as DEL_FLG ,LCHG_USER_ID FROM CRR0100_MOD_TABLE");
	log.info("Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		XBRLCRR0100Bean xb=new XBRLCRR0100Bean();


		xb.setAccno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
		xb.setAccnam(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
		xb.setCusid(NullCheck.isNotNull(rs.getString("CUST_ID")));
		xb.setAccbalamtac(NullCheck.isNotNull(rs.getString("ACCT_BALANCE_AMT_AC")));
		xb.setAccrcode(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
		xb.setNatofcus(NullCheck.isNotNull(rs.getString("NATURE_OF_CUST")));
		xb.setReportdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
		
		    xb.setModtyp(NullCheck.isNotNull(rs.getString("DEL_FLG")));
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
public ArrayList<XBRLCRR0100Bean>CRR0100verify1(){
	
	ArrayList<XBRLCRR0100Bean> arl = new ArrayList<XBRLCRR0100Bean>();
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	log.info("gfchj");
	sql.append("SELECT TREASURY_BILLS_BANK,TREASURY_BILLS_TRADE,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,DECODE(DEL_FLG,'A','Added','M','Modified','D','Deleted') as DEL_FLG ,LCHG_USER_ID FROM CRR0100_S10_MOD_TABLE");
	log.info("Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		XBRLCRR0100Bean xb=new XBRLCRR0100Bean();



		xb.setTrbilsbank(NullCheck.isNotNull(rs.getString("TREASURY_BILLS_BANK")));
		xb.setTrsbillstrade(NullCheck.isNotNull(rs.getString("TREASURY_BILLS_TRADE")));
		xb.setRdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
		
		
		    xb.setModtyp(NullCheck.isNotNull(rs.getString("DEL_FLG")));
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


public String CRR0100verifymaster() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	HttpSession session = request.getSession();
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();	
	
	//------------------get data from mod table---------------------
	XBRLCRR0100Bean xb=new XBRLCRR0100Bean();
	
	sql.setLength(0);
	
	sql.append("SELECT ACCT_NUMBER,ACCT_NAME,CUST_ID,to_char(ACCT_BALANCE_AMT_AC, '9,999,999,999,990.99')ACCT_BALANCE_AMT_AC,ACCT_CRNCY_CODE,NATURE_OF_CUST,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,DEL_FLG,LCHG_USER_ID FROM CRR0100_MOD_TABLE "
			+ "WHERE ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("accno"))+"' AND REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("reportdate")))+"'  ");
	log.info("Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		

		
		xb.setAccno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
		xb.setAccnam(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
		xb.setCusid(NullCheck.isNotNull(rs.getString("CUST_ID")));
		xb.setAccbalamtac(NullCheck.isNotNull(rs.getString("ACCT_BALANCE_AMT_AC")));
		xb.setAccrcode(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
		xb.setNatofcus(NullCheck.isNotNull(rs.getString("NATURE_OF_CUST")));
		xb.setReportdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
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
				" INSERT INTO CRR0100_MAST_TABLE(ACCT_NUMBER,ACCT_NAME,CUST_ID,ACCT_BALANCE_AMT_AC,ACCT_CRNCY_CODE,NATURE_OF_CUST,REPORT_DATE,DEL_FLG,LCHG_USER_ID,LCHG_TIME,VERIFY_USER_ID,VERIFY_TIME)" + "VALUES ('"
						
										+ request.getParameter("accno") + "','" + request.getParameter("accnam") + "','"
										+ request.getParameter("cusid") + "','" + request.getParameter("accbalamtac") + "','"
										+ request.getParameter("accrcode") + "','" + request.getParameter("natofcus") + "','"
										+ df.formatdate(request.getParameter("reportdate")) + "','"+xb.getModtyp()+"','"
						+ session.getAttribute("userName")+"',SYSDATE,'"+ session.getAttribute("userName")+"',SYSDATE)");
				
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("DELETE FROM CRR0100_MOD_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("reportdate")))+"' and ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("accno"))+"'");
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


	}else if (xb.getModtyp().equals("M") ) {
		
	//For Modified Records
		
		sql.setLength(0);
		sql.append("UPDATE CRR0100_MAST_TABLE SET ACCT_NUMBER='" + request.getParameter("accno")
		+ "', ACCT_NAME ='" + request.getParameter("accnam")
		+ "', CUST_ID='" + request.getParameter("cusid")
		+ "', ACCT_BALANCE_AMT_AC ='" + request.getParameter("accbalamtac")
		+ "', ACCT_CRNCY_CODE ='" + request.getParameter("accrcode")
		+ "', NATURE_OF_CUST ='" + request.getParameter("natofcus")
		+ "', REPORT_DATE ='" + df.formatdate(request.getParameter("reportdate"))
		+ "',VERIFY_USER_ID='"+session.getAttribute("userName")+"',VERIFY_TIME=SYSDATE "
		+ "WHERE REPORT_DATE='"
		+ df.formatdate(request.getParameter("reportdate")) + "' " + "AND ACCT_NUMBER='"
		+ request.getParameter("accno")
		+ "'");
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("DELETE FROM CRR0100_MOD_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("reportdate")))+"' and ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("accno"))+"'");
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


		
	}else if (xb.getModtyp().equals("D") ) {
		
	//For Deleted Records
		
		sql.setLength(0);
		sql.append("DELETE FROM CRR0100_MAST_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("reportdate")))+"' and ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("accno"))+"'");
		
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("UPDATE CRR0100_MOD_TABLE SET LCHG_USER_ID='"+session.getAttribute("userName")+"' WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("reportdate")))+"' and ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("accno"))+"'");
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
		    sql.append("DELETE FROM CRR0100_MOD_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("reportdate")))+"' and ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("accno"))+"'");
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


	}
	
	
	
	
	
	
	return status;
}



public String CRR0100verifymaster1() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	HttpSession session = request.getSession();
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();	
	
	//------------------get data from mod table---------------------
	XBRLCRR0100Bean xb=new XBRLCRR0100Bean();
	
	sql.setLength(0);
	
	sql.append("SELECT TREASURY_BILLS_BANK,TREASURY_BILLS_TRADE,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,DEL_FLG,LCHG_USER_ID FROM CRR0100_S10_MOD_TABLE "
			+ "WHERE TREASURY_BILLS_BANK='"+NullCheck.isNotNull(request.getParameter("trbilsbank"))+"' AND REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("rdate")))+"'  ");
	log.info("Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		

		
		xb.setTrbilsbank(NullCheck.isNotNull(rs.getString("TREASURY_BILLS_BANK")));
		xb.setTrsbillstrade(NullCheck.isNotNull(rs.getString("TREASURY_BILLS_TRADE")));
		xb.setRdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
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
				" INSERT INTO CRR0100_S10_MAST_TABLE(TREASURY_BILLS_BANK,TREASURY_BILLS_TRADE,REPORT_DATE,DEL_FLG,LCHG_USER_ID,LCHG_TIME,VERIFY_USER_ID,VERIFY_TIME)" + "VALUES ('"
						
										+ request.getParameter("trbilsbank") + "','" + request.getParameter("trsbillstrade") + "','"
										+ df.formatdate(request.getParameter("rdate")) + "','"+xb.getModtyp()+"','"
						+ session.getAttribute("userName")+"',SYSDATE,'"+ session.getAttribute("userName")+"',SYSDATE)");
			
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("DELETE FROM CRR0100_S10_MOD_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("rdate")))+"' and TREASURY_BILLS_BANK='"+NullCheck.isNotNull(request.getParameter("trbilsbank"))+"'");
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


	}else if (xb.getModtyp().equals("M") ) {
		
	//For Modified Records
		
		sql.setLength(0);
		sql.append("UPDATE CRR0100_S10_MAST_TABLE SET TREASURY_BILLS_BANK='" + request.getParameter("trbilsbank")
		+ "', TREASURY_BILLS_TRADE ='" + request.getParameter("trsbillstrade")
		
		+ "', REPORT_DATE ='" + df.formatdate(request.getParameter("rdate"))
		+ "',VERIFY_USER_ID='"+session.getAttribute("userName")+"',VERIFY_TIME=SYSDATE "
		+ "WHERE REPORT_DATE='"
		+ df.formatdate(request.getParameter("rdate")) + "' " + "AND TREASURY_BILLS_BANK='"
		+ request.getParameter("trbilsbank")
		+ "'");
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("DELETE FROM CRR0100_S10_MOD_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("rdate")))+"' and TREASURY_BILLS_BANK='"+NullCheck.isNotNull(request.getParameter("trbilsbank"))+"'");
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


		
	}else if (xb.getModtyp().equals("D") ) {
		
	//For Deleted Records
		
		sql.setLength(0);
		sql.append("DELETE FROM CRR0100_S10_MAST_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("rdate")))+"' and TREASURY_BILLS_BANK='"+NullCheck.isNotNull(request.getParameter("trbilsbank"))+"'");
		
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("UPDATE CRR0100_S10_MOD_TABLE SET LCHG_USER_ID='"+session.getAttribute("userName")+"' WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("rdate")))+"' and TREASURY_BILLS_BANK='"+NullCheck.isNotNull(request.getParameter("trbilsbank"))+"'");
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
		    sql.append("DELETE FROM CRR0100_S10_MOD_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("rdate")))+"' and TREASURY_BILLS_BANK='"+NullCheck.isNotNull(request.getParameter("trbilsbank"))+"'");
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


	}
	
	
	
	
	
	
	return status;
}

}




