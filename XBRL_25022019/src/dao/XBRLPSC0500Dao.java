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
import bean.XBRLPSC0500Bean;
import bean.XBRLPSC0500Bean;
import bean.XBRLPSC0500Bean;
import bean.XBRLPYM0100Bean;
import bean.XBRLReportMasterBean;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRLPSC0500Dao {
	
	
	static Logger log = Logger.getLogger(XBRLPSC0500Dao.class);
	
public String resalert;
	
	public String cnt;
	
	public int cnt1;
	
	
	public int getCnt1() {
		return cnt1;
	}

	public void setCnt1(int cnt1) {
		this.cnt1 = cnt1;
	}

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


	public String Reporef;
	
	
	
	
	

		
		
	public String getReporef() {
		return Reporef;
	}

	public void setReporef(String reporef) {
		Reporef = reporef;
	}
	
	public ArrayList<XBRLPSC0500Dao> ReporefSeq(String dt1, String dt2) {

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

		ArrayList<XBRLPSC0500Dao> arl = new ArrayList<XBRLPSC0500Dao>();
		sql.append("select REPORT_REF_NO from PSC0500_MOD_TABLE where REPORT_DATE='" + dt2 + "' ORDER BY REPORT_REF_NO");

		log.info("SELECTPROFILE" + sql.toString());

		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLPSC0500Dao xel = new XBRLPSC0500Dao();
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

	

		
	/*************SUM OF PSC0500****************/
	
	public ArrayList<XBRLPSC0500Bean> xbrlpsc0500sumEP(String dt1,String dt2,String ReporefSeq,String curr,String reptype) {
		
		log.info("PYM SUMMARY List Data AB " + dt1 + "dt22222" + dt2);
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLPSC0500Bean> arl = new ArrayList<XBRLPSC0500Bean>();
		
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
			
			
			sql.append("select /* +FIRST_ROWS(100) */ INSTANCE_NAME,to_char(LOANS_APPROVED, '9,999,999,999,990.99')LOANS_APPROVED,to_char(OUTSTANDING_AMT, '9,999,999,999,990.99')OUTSTANDING_AMT from table(PSC0500_S1_RPT_FUN('PSC0500','"+chk.notZero(ReporefSeq.trim())+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");

			
			log.info("PSC SUMMARY "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				XBRLPSC0500Bean xb=new XBRLPSC0500Bean();
				
				xb.setStulon(NullCheck.isNotNull(rs.getString("INSTANCE_NAME")));
				xb.setStulonapp(NullCheck.isNotNull(rs.getString("LOANS_APPROVED")));
				xb.setAmout(NullCheck.isNotNull(rs.getString("OUTSTANDING_AMT")));
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
	
	
	
	
	
public ArrayList<XBRLPSC0500Bean> xbrlpsc0500sumEP1(String dt1,String dt2,String ReporefSeq,String curr,String reptype) {
		
		log.info("PYM SUMMARY List Data AB " + dt1 + "dt22222" + dt2);
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLPSC0500Bean> arl = new ArrayList<XBRLPSC0500Bean>();
		
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
			
			
			sql.append("select /* +FIRST_ROWS(100) */ INSTANCE_NAME,to_char(LOANS_APPROVED, '9,999,999,999,990.99')LOANS_APPROVED,to_char(OUTSTANDING_AMT, '9,999,999,999,990.99')OUTSTANDING_AMT,MIN_INT_RATE, MAX_INT_RATE from table(PSC0500_S2_RPT_FUN('PSC0500','"+chk.notZero(ReporefSeq.trim())+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");

				
				
				
			
			
			log.info("PYM SUMMARY "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				XBRLPSC0500Bean xb=new XBRLPSC0500Bean();
				
				xb.setStudlon(NullCheck.isNotNull(rs.getString("INSTANCE_NAME")));
				xb.setStudenaploan(NullCheck.isNotNull(rs.getString("LOANS_APPROVED")));
				xb.setAmtoutsta(NullCheck.isNotNull(rs.getString("OUTSTANDING_AMT")));
				xb.setMin(NullCheck.isNotNull(rs.getString("MIN_INT_RATE")));
				xb.setMax(NullCheck.isNotNull(rs.getString("MAX_INT_RATE")));
				
			
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
	
	
	
	
	/*************************Details PSC0500**********************/
	
	
	
	
	
public ArrayList<XBRLPSC0500Bean> xbrlpsc0500ajaxdetails(String repname,String reprefno,String instno,String dt2,String dt1,String curr) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("repname    " + repname + "reprefno   " + reprefno + "instno   " + instno + "dt2     " + dt2 +  "dt1    " + dt1);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLPSC0500Bean> arl = new ArrayList<XBRLPSC0500Bean>();
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
			
			//select * from table(PSC0500_DTL_FUN('PSC0500','0','0','31-MAR-2014','01-MAR-2014','31-MAR-2014','MUR'));
			sql.append("select /* +FIRST_ROWS(100) */ ACCT_NUMBER,ACCT_NAME,SCHM_TYPE,SCHM_CODE,to_char(ACCT_OPN_DATE,'DD-MM-YYYY')ACCT_OPN_DATE,INTEREST_RATE,to_char(BALANCE_AMT,'9,999,999,999,990.99')BALANCE_AMT,ACCT_CRNCY_CODE,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE from table(PSC0500_DTL_FUN('PSC0500','"+chk.notZero(reprefno)+"','"+chk.notZero(reprefno)+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");

			
			log.info("PSC Vinoth Kumar  "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				//log.info("whileee");
				
				
				 
				XBRLPSC0500Bean xb=new XBRLPSC0500Bean();
				
				xb.setAccno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
				xb.setAccna(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
				xb.setSchmtyp(NullCheck.isNotNull(rs.getString("SCHM_TYPE")));
				xb.setSchcod(NullCheck.isNotNull(rs.getString("SCHM_CODE")));
				xb.setAccopda(NullCheck.isNotNull(rs.getString("ACCT_OPN_DATE")));
				xb.setIntrra(NullCheck.isNotNull(rs.getString("INTEREST_RATE")));
				xb.setBalda(NullCheck.isNotNull(rs.getString("BALANCE_AMT")));
				xb.setAcccurcod(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
				xb.setRepdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
				
				
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







public String detailPSC0500saves() {

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

public String PSC0500chckmodified() {

	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	HttpSession session = request.getSession();
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	if(request.getParameter("type").equals("chkuser")) {
		sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM PSC0500_MOD_TABLE ");
	}else {
		//sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM DCG0100_MOD_TABLE WHERE REPORT_DATE='"+NullCheck.isNotNull(df.formatdate(request.getParameter("repdate")))+"'");
		sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM PSC0500_MOD_TABLE ");

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

public String detailPSC0500savecheck() {

	ConnectionManager connmgr=new ConnectionManager();
	Connection conn=connmgr.getConnection();
	ArrayList<String> arl = new ArrayList<String>();
			HttpServletRequest request = ServletActionContext.getRequest();
			DateFormat df = new DateFormat();
			StringBuffer sql = new StringBuffer();
			PreparedStatement ps = null;
			
			sql.append("SELECT COUNT(REPORT_DATE) as repdate FROM PSC0500_S1_RPT_TB where REPORT_ID = '"+request.getParameter("reptype")+"' AND  REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ");
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


public ArrayList<XBRLPSC0500Bean> xbrlbls4RR(String dt1,String dt2,String reprefno,String instno,String curr) {
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLPSC0500Bean> arl = new ArrayList<XBRLPSC0500Bean>();
	NullCheck chk=new NullCheck();
	
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();
	
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	//sql.append("SELECT * FROM TABLE(BLS0100_DTL_FUN('BLS0100','0','0','31-AUG-2018','01-AUG-2018','31-AUG-2018','MUR'))");
		
	sql.append("select /* +FIRST_ROWS(100) */  ACCT_NUMBER,ACCT_NAME,SCHM_TYPE,SCHM_CODE,to_char(ACCT_OPN_DATE,'DD-MM-YYYY')ACCT_OPN_DATE,INTEREST_RATE,to_char(BALANCE_AMT,'9,999,999,999,990.99')BALANCE_AMT,ACCT_CRNCY_CODE,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE from table(PSC0500_DTL_FUN('PSC0500','"+chk.notZero(reprefno)+"','"+chk.notZero(reprefno)+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");
	log.info("DOC&&&&SELECT Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		
		XBRLPSC0500Bean xb=new XBRLPSC0500Bean();

		xb.setAccno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
		xb.setAccna(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
		xb.setSchmtyp(NullCheck.isNotNull(rs.getString("SCHM_TYPE")));
		xb.setSchcod(NullCheck.isNotNull(rs.getString("SCHM_CODE")));
		xb.setAccopda(NullCheck.isNotNull(rs.getString("ACCT_OPN_DATE")));
		xb.setIntrra(NullCheck.isNotNull(rs.getString("INTEREST_RATE")));
		xb.setBalda(NullCheck.isNotNull(rs.getString("BALANCE_AMT")));
		xb.setAcccurcod(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
		xb.setRepdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
	
		
		
		
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






public ArrayList<XBRLPSC0500Bean> xbrlpsc500(String dt1,String dt2,String ReporefSeq,String instno,String curr) {
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLPSC0500Bean> arl = new ArrayList<XBRLPSC0500Bean>();
	NullCheck chk=new NullCheck();
	
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();
	
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	//sql.append("SELECT * FROM TABLE(PSC0500_DTL_FUN('PSC0500','0','0','31-AUG-2018','01-AUG-2018','31-AUG-2018','MUR'))");
		
	sql.append("select /* +FIRST_ROWS(100) */  ACCT_NUMBER,ACCT_NAME,SCHM_TYPE,SCHM_CODE,to_char(ACCT_OPN_DATE,'DD-MM-YYYY')ACCT_OPN_DATE,INTEREST_RATE,to_char(BALANCE_AMT,'9,999,999,999,990.99')BALANCE_AMT,ACCT_CRNCY_CODE,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE from table(PSC0500_DTL_FUN('PSC0500','"+chk.notZero(ReporefSeq)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");
	log.info("DOC&&&&SELECT Gayu"+sql.toString());
	
	try {
		
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		
		XBRLPSC0500Bean xb=new XBRLPSC0500Bean();
		xb.setAccno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
		xb.setAccna(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
		xb.setSchmtyp(NullCheck.isNotNull(rs.getString("SCHM_TYPE")));
		xb.setSchcod(NullCheck.isNotNull(rs.getString("SCHM_CODE")));
		xb.setAccopda(NullCheck.isNotNull(rs.getString("ACCT_OPN_DATE")));
		xb.setIntrra(NullCheck.isNotNull(rs.getString("INTEREST_RATE")));
		xb.setBalda(NullCheck.isNotNull(rs.getString("BALANCE_AMT")));
		xb.setAcccurcod(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
		xb.setRepdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
		
		
		
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
	




