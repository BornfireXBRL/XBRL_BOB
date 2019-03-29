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
import bean.XBRLPSC0106Bean;
import bean.XBRLPSC0501Bean;
import bean.XBRLPSC0501Bean;
import bean.XBRLPYM0100Bean;
import bean.XBRLReportMasterBean;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRLPSC0501Dao {
	

	static Logger log = Logger.getLogger(XBRLPSC0501Dao.class);
	
	
	public String Reporef;
	
	
	
	

	public int cnt1;
	public String cnt;

	public String resalert;
	
		

		
		
	public static Logger getLog() {
		return log;
	}

	public static void setLog(Logger log) {
		XBRLPSC0501Dao.log = log;
	}

	public int getCnt1() {
		return cnt1;
	}

	public void setCnt1(int cnt1) {
		this.cnt1 = cnt1;
	}

	public String getCnt() {
		return cnt;
	}

	public void setCnt(String cnt) {
		this.cnt = cnt;
	}

	public String getResalert() {
		return resalert;
	}

	public void setResalert(String resalert) {
		this.resalert = resalert;
	}

	public String getReporef() {
		return Reporef;
	}

	public void setReporef(String reporef) {
		Reporef = reporef;
	}

	
	
	public ArrayList<XBRLPSC0501Dao> ReporefSeq(String dt1,String dt2){
		
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
		
		ArrayList<XBRLPSC0501Dao> arl = new ArrayList<XBRLPSC0501Dao>();
		sql.append("select REPORT_REF_NO from PSC0501_MOD_TABLE where REPORT_DATE BETWEEN '"+dt1+"' AND '"+dt2+"' GROUP BY REPORT_REF_NO ORDER BY REPORT_REF_NO");
		
		log.info("SELECTPROFILE"+sql.toString());
		
		try {
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
		
				XBRLPSC0501Dao xel=new XBRLPSC0501Dao();
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
	
	public ArrayList<XBRLPSC0501Bean> xbrlpsc0501sumEP(String dt1,String dt2,String ReporefSeq,String curr,String reptype) {
		
		log.info("PYM SUMMARY List Data AB " + dt1 + "dt22222" + dt2);
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLPSC0501Bean> arl = new ArrayList<XBRLPSC0501Bean>();
		
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
		
				sql.append("SELECT to_char(APP_SUBMITED_DATE,'DD-MM-YYYY')APP_SUBMITED_DATE,NAME,REJECTION_REASON FROM TABLE(PSC0501_RPT_FUN('"+reptype.toUpperCase()+"','"+chk.isNotZero(ReporefSeq.trim())+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
				
			
			log.info("PYM SUMMARY "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				XBRLPSC0501Bean xb=new XBRLPSC0501Bean();
				
					xb.setApsubdate(NullCheck.isNotNull(rs.getString("APP_SUBMITED_DATE")));
					xb.setName(NullCheck.isNotNull(rs.getString("NAME")));
					xb.setRepdreason(NullCheck.isNotNull(rs.getString("REJECTION_REASON")));
			
			
			
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
	
	
	
	
	
public ArrayList<XBRLPSC0501Bean> xbrlpsc0501ajaxdetails(String repname,String reprefno,String instno,String dt2,String dt1,String curr) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("repname    " + repname + "reprefno   " + reprefno + "instno   " + instno + "dt2     " + dt2 +  "dt1    " + dt1);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLPSC0501Bean> arl = new ArrayList<XBRLPSC0501Bean>();
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
			
			sql.append("select /* +FIRST_ROWS(100) */ APPLICATION_NO,APPLICANT_NAME,to_char(RECEIVED_DATE,'DD-MM-YYYY')RECEIVED_DATE,REJECTION_REASON,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE from table(PSC0501_DTL_FUN('PSC0501','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");
			
			
			log.info("PYM Vinoth Kumar  "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				//log.info("whileee");
				
				
				 
				XBRLPSC0501Bean xb=new XBRLPSC0501Bean();
				
				xb.setApplno(NullCheck.isNotNull(rs.getString("APPLICATION_NO")));
				xb.setApplname(NullCheck.isNotNull(rs.getString("APPLICANT_NAME")));
				xb.setRecvddate(NullCheck.isNotNull(rs.getString("RECEIVED_DATE")));
				xb.setRejres(NullCheck.isNotNull(rs.getString("REJECTION_REASON")));
				xb.setRejdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
				
				
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







public String detailPSC0501saves() {

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

public ArrayList<XBRLPSC0501Bean> xbrlpsc501(String dt1,String dt2,String ReporefSeq,String instno,String curr) {
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLPSC0501Bean> arl = new ArrayList<XBRLPSC0501Bean>();
	NullCheck chk=new NullCheck();
	
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();
	
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	//sql.append("SELECT * FROM TABLE(PSC0501_DTL_FUN('PSC0501','0','0','31-AUG-2018','01-AUG-2018','31-AUG-2018','MUR'))");
		
	sql.append("select /* +FIRST_ROWS(100) */ APPLICATION_NO,APPLICANT_NAME,to_char(RECEIVED_DATE,'DD-MM-YYYY')RECEIVED_DATE,REJECTION_REASON,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE from table(PSC0501_DTL_FUN('PSC0501','"+chk.notZero(ReporefSeq)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");
	log.info("DOC&&&&SELECT Gayu"+sql.toString());
	
	try {
		
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		
		 
		XBRLPSC0501Bean xb=new XBRLPSC0501Bean();
		
		xb.setApplno(NullCheck.isNotNull(rs.getString("APPLICATION_NO")));
		xb.setApplname(NullCheck.isNotNull(rs.getString("APPLICANT_NAME")));
		xb.setRecvddate(NullCheck.isNotNull(rs.getString("RECEIVED_DATE")));
		xb.setRejres(NullCheck.isNotNull(rs.getString("REJECTION_REASON")));
		xb.setRejdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
		
		
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




public ArrayList<XBRLPSC0501Bean>PSC0501verify(){
	
	ArrayList<XBRLPSC0501Bean> arl = new ArrayList<XBRLPSC0501Bean>();
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	sql.	append("SELECT   /* +FIRST_ROWS(100) */  APPLICATION_NO,APPLICANT_NAME,to_char(RECEIVED_DATE,'DD-MM-YYYY')RECEIVED_DATE,REJECTION_REASON,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,DECODE(DEL_FLG,'A','Added','M','Modified','D','Deleted') as DEL_FLG,LCHG_USER_ID  FROM PSC0501_MOD_TABLE ");
	log.info("Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     
	

	while(rs.next()){
		
		
		
		XBRLPSC0501Bean xb=new XBRLPSC0501Bean();
		xb.setApplno(NullCheck.isNotNull(rs.getString("APPLICATION_NO")));
		xb.setApplname(NullCheck.isNotNull(rs.getString("APPLICANT_NAME")));
		xb.setRecvddate(NullCheck.isNotNull(rs.getString("RECEIVED_DATE")));
		xb.setRejres(NullCheck.isNotNull(rs.getString("REJECTION_REASON")));
		xb.setRejdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
		
		

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


public String detailPSC0501savecheck() {

	ConnectionManager connmgr=new ConnectionManager();
	Connection conn=connmgr.getConnection();
	ArrayList<String> arl = new ArrayList<String>();
			HttpServletRequest request = ServletActionContext.getRequest();
			DateFormat df = new DateFormat();
			StringBuffer sql = new StringBuffer();
			PreparedStatement ps = null;
			
			sql.append("SELECT COUNT(REPORT_DATE) as repdate FROM PSC0501_RPT_TB where REPORT_ID = '"+request.getParameter("reptype")+"' AND  REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ");
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




public String PSC0501chckmodified() {

	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	HttpSession session = request.getSession();
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	if(request.getParameter("type").equals("chkuser")) {
		sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM PSC0501_MOD_TABLE ");
	}else {
		//sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM PSC0106_MOD_TABLE WHERE REPORT_DATE='"+NullCheck.isNotNull(df.formatdate(request.getParameter("repdate")))+"'");
		sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM PSC0501_MOD_TABLE ");

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
	
	log.info("count in Mod table: "+cnt);
	return "success";
}
public String modPSC0501cancel() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	sql.append("DELETE FROM PSC0501_MOD_TABLE WHERE   APPLICATION_NO='"+NullCheck.isNotNull(request.getParameter("applno"))+"' ");
	
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


public String PSC0501verifymaster() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	HttpSession session = request.getSession();
	StringBuffer sql = new StringBuffer();
	DateFormat df1=new DateFormat();		
	
	//------------------get data from mod table---------------------
	XBRLPSC0501Bean xb=new XBRLPSC0501Bean();
	
	sql.setLength(0);
	sql.append("SELECT   /* +FIRST_ROWS(100) */ APPLICATION_NO,APPLICANT_NAME,to_char(RECEIVED_DATE,'DD-MM-YYYY')RECEIVED_DATE,REJECTION_REASON,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,DEL_FLG,LCHG_USER_ID  FROM PSC0501_MOD_TABLE "
			+ "WHERE APPLICATION_NO='"+NullCheck.isNotNull(request.getParameter("applno"))+"' ");
	log.info("Gayu"+sql.toString());
	try {
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			
			xb.setApplno(NullCheck.isNotNull(rs.getString("APPLICATION_NO")));
			xb.setApplname(NullCheck.isNotNull(rs.getString("APPLICANT_NAME")));
			xb.setRecvddate(NullCheck.isNotNull(rs.getString("RECEIVED_DATE")));
			xb.setRejres(NullCheck.isNotNull(rs.getString("REJECTION_REASON")));
			xb.setRejdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
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
		"INSERT INTO PSC0501_MAST_TABLE(APPLICATION_NO,APPLICANT_NAME,RECEIVED_DATE,REJECTION_REASON,REPORT_DATE,DEL_FLG,LCHG_USER_ID,LCHG_TIME,VERIFY_USER_ID,VERIFY_TIME)" + "VALUES ('" 
				 + request.getParameter("applno")
				+ "','" + request.getParameter("applname") + "','"
				+ df1.formatdate(request.getParameter("recvddate")) + "','" 
				+ request.getParameter("rejres") + "','"
				+df1.formatdate(request.getParameter("rejdate"))+ "','"+xb.getModtyp()+"','"
				+ session.getAttribute("userName")+"',SYSDATE,'"+ session.getAttribute("userName")+"',SYSDATE)");
try {
	log.info(sql.toString());

	ps=conn.prepareStatement(sql.toString());
	
    int rs=0;
    rs=ps.executeUpdate();
     
    status="success";
    
    sql.setLength(0);
    sql.append("DELETE FROM PSC0501_MOD_TABLE WHERE APPLICATION_NO='"+NullCheck.isNotNull(request.getParameter("applno"))+"'");
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
sql.append("UPDATE PSC0501_MAST_TABLE SET APPLICATION_NO='"+NullCheck.isNotNull(request.getParameter("applno "))+"',APPLICANT_NAME='"+NullCheck.isNotNull(request.getParameter("applname"))+"',RECEIVED_DATE='"+df1.formatdate(request.getParameter("recvddate"))+"',REJECTION_REASON='"+NullCheck.isNotNull(request.getParameter("rejres"))+"',REPORT_DATE='"+df1.formatdate(request.getParameter("rejdate"))+"',DEL_FLG='"+xb.getModtyp()+"',LCHG_USER_ID='"+session.getAttribute("entryuser")+"',VERIFY_TIME=SYSDATE WHERE APPLICATION_NO='"+NullCheck.isNotNull(request.getParameter("applno "))+"'");


try {
	log.info(sql.toString());
 

	ps=conn.prepareStatement(sql.toString());
	
    int rs=0;
    rs=ps.executeUpdate();
     
    status="success";
    
    sql.setLength(0);
    sql.append("DELETE FROM PSC0501_MOD_TABLE WHERE APPLICATION_NO='"+NullCheck.isNotNull(request.getParameter("applno"))+"'");

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
	sql.append("DELETE FROM PSC0501_MAST_TABLE WHERE APPLICATION_NO='"+NullCheck.isNotNull(request.getParameter("applno"))+"'");

	try {
		log.info(sql.toString());
		ps=conn.prepareStatement(sql.toString());
		
	    int rs=0;
	    rs=ps.executeUpdate();
	     
	    status="success";
	    log.info(status);
	    sql.setLength(0);
	    sql.append("UPDATE PSC0501_MOD_TABLE SET LCHG_USER='"+session.getAttribute("userName")+"' WHERE REPORT_DATE='"+df1.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"' and APPLICATION_NO='"+NullCheck.isNotNull(request.getParameter("applno"))+"'");

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
		sql.append("DELETE FROM PSC501_MOD_TABLE WHERE APPLICATION_NO='"+NullCheck.isNotNull(request.getParameter("applno"))+"'");
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
	




