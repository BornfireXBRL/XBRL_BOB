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
import bean.XBRLBLS0106Bean;
import bean.XBRLBLS0106Bean;

import bean.XBRLReportMasterBean;
import utilities.ConnectionManager;
import utilities.NullCheck;

import org.apache.log4j.Logger;
public class XBRLBLS0106Dao {
	
	static Logger log = Logger.getLogger(XBRLBLS0106Dao.class);

	public int cnt1;
	
	
	public String cnt;
	
	public String resalert;
	
	public String getResalert() {
		return resalert;
	}

	public void setResalert(String resalert) {
		this.resalert = resalert;
	}

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


	public String Reporef;
	
		
	public String getReporef() {
		return Reporef;
	}

	public void setReporef(String reporef) {
		Reporef = reporef;
	}

	

	
	public ArrayList<XBRLBLS0106Dao> ReporefSeq(String dt1, String dt2) {

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

		ArrayList<XBRLBLS0106Dao> arl = new ArrayList<XBRLBLS0106Dao>();
		sql.append("select REPORT_REF_NO from BLS0106_MOD_TABLE where REPORT_DATE='" + dt2 + "' ORDER BY REPORT_REF_NO");

		log.info("SELECTPROFILE" + sql.toString());

		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLBLS0106Dao xel = new XBRLBLS0106Dao();
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
	
	

	
	
	/***********PDF and EXCEL HEADER FROM XBRL REPORT MASTER***************/
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
		
		
	/************* sum DB Link****************/
	
	public ArrayList<XBRLBLS0106Bean> xbrlblssumEP(String reptype,String dt2,String ReporefSeq,String curr) {
		
		log.info("PYM SUMMARY List Data AB "  + "dt22222" + dt2);
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLBLS0106Bean> arl = new ArrayList<XBRLBLS0106Bean>();
		
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
		
			
			log.info("Kumar" + ReporefSeq.trim());
			//sql.append("SELECT DYNAMIC_DOMAIN,to_char(REP_DATE,'DD-MM-YYYY')REP_DATE,INSTITUTE_ID,TRAN_ID,INSTITUTE_NAME,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,SECTOR,SPOT_RATE,FWD_RATE,to_char(DUE_DATE,'DD-MM-YYYY')DUE_DATE,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME    FROM   FIM0400_MAST_TABLE  Where  REP_DATE >='"+dt1+"' and REP_DATE <= '"+dt2+"' ORDER BY cast(TRAN_ID as int) ASC ");
			
				
				log.info("Report ref" );
				
				//sql.append("SELECT REPORT_REF_NO,MODES,CHQ_NUMBER,ACCT_NUMBER,ACCT_NAME,to_char(TRAN_DATE,'DD-MM-YYYY')TRAN_DATE,CHQ_AMOUNT,CRNCY,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME  FROM TABLE(PYM0100_RPT_FUN('PYM0100','"+ReporefSeq.trim()+"','31-MAR-2014','31-MAR-2014','31-MAR-2014'))");
							
				sql.append("SELECT  INSTANCE_NAME,INSTANCE_CODE,RESIDENTS,NON_RESIDENTS,TOTAL FROM TABLE(BLS0106_RPT_FUN('"+reptype+"','"+ReporefSeq.trim()+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
				
			
			log.info("BLS SUMMARY "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				
				
				 
				XBRLBLS0106Bean xb=new XBRLBLS0106Bean();
						
				xb.setInstancname(NullCheck.isNotNull(rs.getString("INSTANCE_NAME")));
				xb.setInstanccode(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));			
				xb.setResident(NullCheck.isNotNull(rs.getString("RESIDENTS")));
				xb.setNonresident(NullCheck.isNotNull(rs.getString("NON_RESIDENTS")));
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
	
	
	
	/*************************Details PYM0100***********************/
	
	
public ArrayList<XBRLBLS0106Bean> xbrlblsajaxdetails(String repname,String reprefno,String instno,String dt2,String curr) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("repname    " + repname + "reprefno   "  + reprefno + "instno"+ instno +"dt2   " + dt2 +"currency" +curr);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLBLS0106Bean> arl = new ArrayList<XBRLBLS0106Bean>();
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
			
			sql.append("SELECT   /* +FIRST_ROWS(100) */ ACCT_NUMBER,ACCT_NAME,CUST_ID,TRANSFERABLE_FLG,SCHM_TYPE,NATURE_OF_CUSTOMER,NRE_FLG,CURRENCY_CODE,to_char(BALANCE_AMT, '9,999,999,999,990.99')BALANCE_AMT,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE FROM TABLE(BLS0106_DTL_FUN('"+repname+"','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");			
			
			log.info("BLS  Gayu  "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				//log.info("whileee");
								
				 
				XBRLBLS0106Bean xb=new XBRLBLS0106Bean();
		
				xb.setAccno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
				xb.setAccname(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
				xb.setTransflg(NullCheck.isNotNull(rs.getString("TRANSFERABLE_FLG")));	
				xb.setSchmtyp(NullCheck.isNotNull(rs.getString("SCHM_TYPE")));
				xb.setNatuofcust(NullCheck.isNotNull(rs.getString("NATURE_OF_CUSTOMER")));
				xb.setNreflg(NullCheck.isNotNull(rs.getString("NRE_FLG")));
				xb.setCurrency(NullCheck.isNotNull(rs.getString("CURRENCY_CODE")));
				xb.setBalancamt(NullCheck.isNotNull(rs.getString("BALANCE_AMT")));
				xb.setRepdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
				xb.setCustId(NullCheck.isNotNull(rs.getString("CUST_ID")));
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
public ArrayList<XBRLBLS0106Bean> xbrlbls4RR(String dt1,String dt2,String reprefno,String instno,String curr) {
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLBLS0106Bean> arl = new ArrayList<XBRLBLS0106Bean>();
	NullCheck chk=new NullCheck();
	
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();
	log.info("dt1 :"+dt1);
	log.info("dt2 :"+dt2);
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	//sql.append("SELECT * FROM TABLE(BLS0106_DTL_FUN('BLS0106','0','0','31-AUG-2018','01-AUG-2018','31-AUG-2018','MUR'))");
		
	sql.append("SELECT   /* +FIRST_ROWS(100) */ ACCT_NUMBER,ACCT_NAME,CUST_ID,TRANSFERABLE_FLG,SCHM_TYPE,NATURE_OF_CUSTOMER,NRE_FLG,CURRENCY_CODE,to_char(BALANCE_AMT, '9,999,999,999,990.99')BALANCE_AMT,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE FROM TABLE(BLS0106_DTL_FUN('BLS0106','"+reprefno+"','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");			
	log.info("DOC&&&&SELECT"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		
		XBRLBLS0106Bean xb=new XBRLBLS0106Bean();
		
		xb.setAccno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
		xb.setAccname(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
		xb.setTransflg(NullCheck.isNotNull(rs.getString("TRANSFERABLE_FLG")));	
		xb.setSchmtyp(NullCheck.isNotNull(rs.getString("SCHM_TYPE")));
		
		xb.setNatuofcust(NullCheck.isNotNull(rs.getString("NATURE_OF_CUSTOMER")));
		xb.setNreflg(NullCheck.isNotNull(rs.getString("NRE_FLG")));
		xb.setCurrency(NullCheck.isNotNull(rs.getString("CURRENCY_CODE")));
		xb.setBalancamt(NullCheck.isNotNull(rs.getString("BALANCE_AMT")));
		xb.setRepdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
		xb.setCustId(NullCheck.isNotNull(rs.getString("CUST_ID")));
		
		 
		
		
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




public String detailBLS0106saves() {

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


public String detailBLS0106savecheck() {

	ConnectionManager connmgr=new ConnectionManager();
	Connection conn=connmgr.getConnection();
	ArrayList<String> arl = new ArrayList<String>();
			HttpServletRequest request = ServletActionContext.getRequest();
			DateFormat df = new DateFormat();
			StringBuffer sql = new StringBuffer();
			PreparedStatement ps = null;
			
			sql.append("SELECT COUNT(REPORT_DATE) as repdate FROM BLS0106_RPT_TB where REPORT_ID = '"+request.getParameter("reptype")+"' AND  REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ");
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



public String BLS0106chckmodified() {

HttpServletRequest request = ServletActionContext.getRequest();
ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();
PreparedStatement ps = null;
HttpSession session = request.getSession();
StringBuffer sql = new StringBuffer();
DateFormat df=new DateFormat();		
sql.setLength(0);
if(request.getParameter("type").equals("chkuser")) {
	sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM BLS0106_MOD_TABLE ");
}else {
	sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM BLS0106_MOD_TABLE ");
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

public String modBLS0106cancel() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	sql.append("DELETE FROM BLS0106_MOD_TABLE WHERE   ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("accno"))+"' ");
	
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


public ArrayList<XBRLBLS0106Bean> BLS0106verify(){
	
	ArrayList<XBRLBLS0106Bean> arl = new ArrayList<XBRLBLS0106Bean>();
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	sql.	append("SELECT   /* +FIRST_ROWS(100) */ ACCT_NUMBER,ACCT_NAME,CUST_ID,TRANSFERABLE_FLG,SCHM_TYPE,NATURE_OF_CUSTOMER,NRE_FLG,CURRENCY_CODE,to_char(BALANCE_AMT, '9,999,999,999,990.99')BALANCE_AMT,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,DECODE(DEL_FLG,'A','Added','M','Modified','D','Deleted') as DEL_FLG,LCHG_USER_ID  FROM BLS0106_MOD_TABLE ");
	log.info("Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		
		XBRLBLS0106Bean xb=new XBRLBLS0106Bean();
		
		xb.setAccno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
		xb.setAccname(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
		xb.setCustId(NullCheck.isNotNull(rs.getString("CUST_ID")));

		xb.setTransflg(NullCheck.isNotNull(rs.getString("TRANSFERABLE_FLG")));	
		xb.setSchmtyp(NullCheck.isNotNull(rs.getString("SCHM_TYPE")));
		
		xb.setNatuofcust(NullCheck.isNotNull(rs.getString("NATURE_OF_CUSTOMER")));
		xb.setNreflg(NullCheck.isNotNull(rs.getString("NRE_FLG")));
		xb.setCurrency(NullCheck.isNotNull(rs.getString("CURRENCY_CODE")));
		xb.setBalancamt(NullCheck.isNotNull(rs.getString("BALANCE_AMT")));
		xb.setRepdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
		
		

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
	} return arl;	
}


public String BLS0106verifymaster() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	HttpSession session = request.getSession();
	StringBuffer sql = new StringBuffer();
	DateFormat df1=new DateFormat();		
	
	//------------------get data from mod table---------------------
	XBRLBLS0106Bean xb=new XBRLBLS0106Bean();
	
	sql.setLength(0);
	sql.append("SELECT   /* +FIRST_ROWS(100) */ ACCT_NUMBER,ACCT_NAME,CUST_ID,TRANSFERABLE_FLG,SCHM_TYPE,NATURE_OF_CUSTOMER,NRE_FLG,CURRENCY_CODE,to_char(BALANCE_AMT, '9,999,999,999,990.99')BALANCE_AMT,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,DEL_FLG,LCHG_USER_ID  FROM BLS0106_MOD_TABLE "
			+ "WHERE ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("accno"))+"' ");
	log.info("Gayu"+sql.toString());
	try {
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			
			xb.setAccno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
			xb.setAccname(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
			xb.setCustId(NullCheck.isNotNull(rs.getString("CUST_ID")));

			xb.setTransflg(NullCheck.isNotNull(rs.getString("TRANSFERABLE_FLG")));	
			xb.setSchmtyp(NullCheck.isNotNull(rs.getString("SCHM_TYPE")));
			
			xb.setNatuofcust(NullCheck.isNotNull(rs.getString("NATURE_OF_CUSTOMER")));
			xb.setNreflg(NullCheck.isNotNull(rs.getString("NRE_FLG")));
			xb.setCurrency(NullCheck.isNotNull(rs.getString("CURRENCY_CODE")));
			xb.setBalancamt(NullCheck.isNotNull(rs.getString("BALANCE_AMT")));
			xb.setRepdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
			
			

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
	System.out.println("11111kjk11111111"+xb.getModtyp());
	System.out.println("11111kjk11111111"+request.getParameter("modtyp"));


sql.setLength(0);
sql.append("INSERT INTO BLS0106_MAST_TABLE(" 
		/* + "CHQ_ALPHA," */
		 +"ACCT_NUMBER," + "ACCT_NAME," +"CUST_ID," +"TRANSFERABLE_FLG,"+"SCHM_TYPE," +"NATURE_OF_CUSTOMER," 
		 +"NRE_FLG,"+"CURRENCY_CODE,"+"BALANCE_AMT,"+ "REPORT_DATE,"
		 + "DEL_FLG,"+"LCHG_USER_ID," + "LCHG_TIME)");

sql.append("values('"  + request.getParameter("accno") + "','"
		+ request.getParameter("accname") + "','"+ request.getParameter("custId") + "','"+ request.getParameter("transflg")
		 +"','"+request.getParameter("schmtyp")
		+ "','" + request.getParameter("natuofcust") + "','" + request.getParameter("nreflg")
		+ "','" + request.getParameter("currency") + "','" + request.getParameter("balancamt")
		+ "','"+ df1.formatdate( request.getParameter("repdate"))+ "','"+xb.getModtyp()
		+ "','" 
		+ session.getAttribute("userName")+ "',SYSDATE) ");
try {
	log.info(sql.toString());
	ps=conn.prepareStatement(sql.toString());
	
    int rs=0;
    rs=ps.executeUpdate();
     
    status="success";
    
    sql.setLength(0);
    sql.append("DELETE FROM BLS0106_MOD_TABLE WHERE ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("accno"))+"'");
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
sql.append("UPDATE BLS0106_MAST_TABLE SET ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("accno"))+"',ACCT_NAME='"+NullCheck.isNotNull(request.getParameter("accname"))+"',CUST_ID='"+NullCheck.isNotNull(request.getParameter("custId"))+"',TRANSFERABLE_FLG='"+NullCheck.isNotNull(request.getParameter("transflg"))+"',SCHM_TYPE='"+NullCheck.isNotNull(request.getParameter("schmtyp"))+"',NATURE_OF_CUSTOMER='"+NullCheck.isNotNull(request.getParameter("natuofcust"))+"',NRE_FLG='"+NullCheck.isNotNull(request.getParameter("nreflg"))+"',CURRENCY_CODE='"+NullCheck.isNotNull(request.getParameter("currency"))+"',BALANCE_AMT='"+NullCheck.isNotNull(request.getParameter("balancamt"))+"',REPORT_DATE='"+df1.formatdate(request.getParameter("repdate"))+"',DEL_FLG='"+xb.getModtyp()+"',LCHG_USER_ID='"+session.getAttribute("userName")+"',VERIFY_TIME=SYSDATE WHERE ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("accno"))+"'");

try {
	log.info(sql.toString());
	ps=conn.prepareStatement(sql.toString());
	
    int rs=0;
    rs=ps.executeUpdate();
     
    status="success";
    
    sql.setLength(0);
    sql.append("DELETE FROM BLS0106_MOD_TABLE WHERE ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("accno"))+"'");
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
	sql.append("DELETE FROM BLS0106_MAST_TABLE WHERE ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("accno"))+"'");
	
	try {
		log.info(sql.toString());
		ps=conn.prepareStatement(sql.toString());
		
	    int rs=0;
	    rs=ps.executeUpdate();
	     
	    status="success";
	    
	    sql.setLength(0);
	    sql.append("UPDATE BLS0106_MOD_TABLE SET LCHG_USER='"+session.getAttribute("userName")+"' WHERE REPORT_DATE='"+df1.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"' and ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("accno"))+"'");
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
		sql.append("DELETE FROM BLS0106_MOD_TABLE WHERE ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("accno"))+"'");
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
