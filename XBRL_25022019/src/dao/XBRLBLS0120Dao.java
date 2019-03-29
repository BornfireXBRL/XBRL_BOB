package dao;

import java.sql.CallableStatement;
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
import bean.XBRLBLS0120Bean;
import bean.XBRLDCG0100Bean;
import utilities.ConnectionManager;
import utilities.NullCheck;

public class XBRLBLS0120Dao {

	static Logger log = Logger.getLogger(XBRLBLS0120Dao.class);


	
	public int getCnt1() {
		return cnt1;
	}

	
	public void setCnt1(int cnt1) {
		this.cnt1 = cnt1;
	}

	public int cnt1;
	
	
	
	
	
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
	
	
	
	public String getCnt() {
		return cnt;
	}

	public void setCnt(String cnt) {
		this.cnt = cnt;
	}

	public ArrayList<XBRLBLS0120Dao> ReporefSeq(String dt1, String dt2) {

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

		ArrayList<XBRLBLS0120Dao> arl = new ArrayList<XBRLBLS0120Dao>();
		sql.append("select REPORT_REF_NO from BLS0110_MOD_TABLE where REPORT_DATE='" + dt2 + "' ORDER BY REPORT_REF_NO");

		log.info("SELECTPROFILE" + sql.toString());

		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLBLS0120Dao xel = new XBRLBLS0120Dao();
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
	
	
	public String detailBLS0120savecheck() {

		ConnectionManager connmgr=new ConnectionManager();
		Connection conn=connmgr.getConnection();
		ArrayList<String> arl = new ArrayList<String>();
				HttpServletRequest request = ServletActionContext.getRequest();
				DateFormat df = new DateFormat();
				StringBuffer sql = new StringBuffer();
				PreparedStatement ps = null;
				
				sql.append("SELECT COUNT(REPORT_DATE) as repdate FROM BLS0120_RPT_TB where REPORT_ID = '"+request.getParameter("reptype")+"' AND  REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ");
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


	
public ArrayList<XBRLBLS0120Bean> xbrlBLS0120(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
		
	log.info( "instno"+ instno +"dt2   " + dt2 +"currency" +curr);

		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLBLS0120Bean> arl = new ArrayList<XBRLBLS0120Bean>();
		NullCheck chk=new NullCheck();
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
		
	
		try {
			
			
			
			sql.append("select SL_NO,NAME_OF_INSTRUMENT,ACCT_CURRENCY,to_char(AMT_FC, '9,999,999,999,990.99')AMT_FC,to_char(AMT_LC, '9,999,999,999,990.99')AMT_LC,to_char(ISSUE_DATE,'DD-MM-YYYY')ISSUE_DATE,to_char(MATURITY_DATE,'DD-MM-YYYY')MATURITY_DATE  from table(BLS0120_RPT_FUN('BLS0120','0','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
				
		//sql.append("SELECT * FROM TABLE(BLS0120_RPT_FUN('BLS0120','0','31-AUG-2018','01-AUG-2018','31-AUG-2018','MUR'))");
				
				
			log.info("BLS0120 1"+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				XBRLBLS0120Bean xb=new XBRLBLS0120Bean();
				
		
				xb.setSrno(NullCheck.isNotNull(rs.getString("SL_NO")));
				xb.setNameofins(NullCheck.isNotNull(rs.getString("NAME_OF_INSTRUMENT")));
				xb.setCurrency(NullCheck.isNotNull(rs.getString("ACCT_CURRENCY")));
				xb.setFcuramt(NullCheck.isNotNull(rs.getString("AMT_FC")));
				xb.setUnsecsub(NullCheck.isNotNull(rs.getString("AMT_LC")));
				xb.setIsudat(NullCheck.isNotNull(rs.getString("ISSUE_DATE")));
				xb.setMatudat(NullCheck.isNotNull(rs.getString("MATURITY_DATE")));
				


					
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
	
	
	
public ArrayList<XBRLBLS0120Bean> xbrlBLS0120ajaxdetails(String repname,String reprefno,String instno,String dt2,String curr) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("repname    " + repname + "reprefno   "  + reprefno + "instno"+ instno +"dt2   " + dt2 +"currency" +curr);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLBLS0120Bean> arl = new ArrayList<XBRLBLS0120Bean>();
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
			
	//sql.append("SELECT * FROM TABLE(BLS0120_DTL_FUN('BLS0120','0','0','31-AUG-2018','01-AUG-2018','31-AUG-2018','MUR'))");
			
		sql.append("SELECT SL_NO,NAME_OF_INSTRUMENT,ACCT_CURRENCY,to_char(AMT_FC, '9,999,999,999,990.99')AMT_FC,to_char(ISSU_DATE,'DD-MM-YYYY')ISSU_DATE,to_char(MATURITY_DATE,'DD-MM-YYYY')MATURITY_DATE FROM TABLE(BLS0120_DTL_FUN('BLS0120','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
			log.info("BLS  Kumar  "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				//log.info("whileee");
								
				 
				XBRLBLS0120Bean xb=new XBRLBLS0120Bean();
				
				xb.setSenum(NullCheck.isNotNull(rs.getString("SL_NO")));
				xb.setNaminst(NullCheck.isNotNull(rs.getString("NAME_OF_INSTRUMENT")));
				xb.setAccur(NullCheck.isNotNull(rs.getString("ACCT_CURRENCY")));
				xb.setAmtfc(NullCheck.isNotNull(rs.getString("AMT_FC")));
/*				xb.setAmtlc(NullCheck.isNotNull(rs.getString("AMT_LC")));
*/				xb.setIsudat(NullCheck.isNotNull(rs.getString("ISSU_DATE")));
				xb.setMatudat(NullCheck.isNotNull(rs.getString("MATURITY_DATE")));
				

			
			
				
		
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
public ArrayList<XBRLBLS0120Bean> xbrlbls4RR(String dt1,String dt2,String reprefno,String instno,String curr) {
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLBLS0120Bean> arl = new ArrayList<XBRLBLS0120Bean>();
	NullCheck chk=new NullCheck();
	
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();
	
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	//sql.append("SELECT * FROM TABLE(BLS0120_DTL_FUN('BLS0120','0','0','31-AUG-2018','01-AUG-2018','31-AUG-2018','MUR'))");
		
	sql.append("SELECT SL_NO,NAME_OF_INSTRUMENT,ACCT_CURRENCY,to_char(AMT_FC, '9,999,999,999,990.99')AMT_FC,to_char(ISSU_DATE,'DD-MM-YYYY')ISSU_DATE,to_char(MATURITY_DATE,'DD-MM-YYYY')MATURITY_DATE FROM TABLE(BLS0120_DTL_FUN('BLS0120','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
	log.info("DOC&&&&SELECT"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		
		XBRLBLS0120Bean xb=new XBRLBLS0120Bean();
		
		xb.setSenum(NullCheck.isNotNull(rs.getString("SL_NO")));
		xb.setNaminst(NullCheck.isNotNull(rs.getString("NAME_OF_INSTRUMENT")));
		xb.setAccur(NullCheck.isNotNull(rs.getString("ACCT_CURRENCY")));
		xb.setAmtfc(NullCheck.isNotNull(rs.getString("AMT_FC")));
/*				xb.setAmtlc(NullCheck.isNotNull(rs.getString("AMT_LC")));
*/				xb.setIsudat(NullCheck.isNotNull(rs.getString("ISSU_DATE")));
		xb.setMatudat(NullCheck.isNotNull(rs.getString("MATURITY_DATE")));
		
		
		
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
public ArrayList<XBRLBLS0120Bean> xbrlblssumEP(String dt1, String dt2, String ReporefSeq, String curr) {

	log.info("PYM SUMMARY List Data AB " + dt1 + "dt22222" + dt2);

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();

	ArrayList<XBRLBLS0120Bean> arl = new ArrayList<XBRLBLS0120Bean>();

	String status = "";

	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();

	PreparedStatement ps = null;

	StringBuffer sql = new StringBuffer();

	DateFormat df = new DateFormat();
	dt1 = df.formatdate(dt1);
	dt2 = df.formatdate(dt2);

	DecimalFormat dfs = new DecimalFormat("##,##.00");
	NullCheck chk = new NullCheck();

	try {

		log.info("Gnana" + ReporefSeq.trim());
		// sql.append("SELECT
		// DYNAMIC_DOMAIN,to_char(REP_DATE,'DD-MM-YYYY')REP_DATE,INSTITUTE_ID,TRAN_ID,INSTITUTE_NAME,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,SECTOR,SPOT_RATE,FWD_RATE,to_char(DUE_DATE,'DD-MM-YYYY')DUE_DATE,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME
		// FROM FIM0400_MAST_TABLE Where REP_DATE >='"+dt1+"' and REP_DATE
		// <= '"+dt2+"' ORDER BY cast(TRAN_ID as int) ASC ");

		// sql.append("SELECT
		// REPORT_REF_NO,MODES,CHQ_NUMBER,ACCT_NUMBER,ACCT_NAME,to_char(TRAN_DATE,'DD-MM-YYYY')TRAN_DATE,CHQ_AMOUNT,CRNCY,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME
		// FROM
		// TABLE(BLS0120_RPT_FUN('BLS0120','"+ReporefSeq.trim()+"','31-MAR-2014','31-MAR-2014','31-MAR-2014'))");


		sql.append("select SL_NO,NAME_OF_INSTRUMENT,ACCT_CURRENCY,to_char(AMT_FC, '9,999,999,999,990.99')AMT_FC,to_char(AMT_LC, '9,999,999,999,990.99')AMT_LC,to_char(ISSUE_DATE,'DD-MM-YYYY')ISSUE_DATE,to_char(MATURITY_DATE,'DD-MM-YYYY')MATURITY_DATE  from table(BLS0120_RPT_FUN('BLS0120','0','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");

		/* xbrl_report_master_tb */

		log.info("PYM SUMMARY " + sql.toString());

		ps = conn.prepareStatement(sql.toString());

		ResultSet rs = ps.executeQuery();

		while (rs.next()) {

			XBRLBLS0120Bean xb = new XBRLBLS0120Bean();

			xb.setSrno(NullCheck.isNotNull(rs.getString("SL_NO")));
			xb.setNameofins(NullCheck.isNotNull(rs.getString("NAME_OF_INSTRUMENT")));
			xb.setCurrency(NullCheck.isNotNull(rs.getString("ACCT_CURRENCY")));
			xb.setFcuramt(NullCheck.isNotNull(rs.getString("AMT_FC")));
			xb.setUnsecsub(NullCheck.isNotNull(rs.getString("AMT_LC")));
			xb.setIsudat(NullCheck.isNotNull(rs.getString("ISSUE_DATE")));
			xb.setMatudat(NullCheck.isNotNull(rs.getString("MATURITY_DATE")));
			

			arl.add(xb);

		}

		log.info("ARLLL" + arl.size());

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
public ArrayList<XBRLBLS0120Bean> xbrlblssumEP1(String dt1, String dt2, String ReporefSeq, String curr) {

	log.info("PYM SUMMARY List Data AB " + dt1 + "dt22222" + dt2);

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();

	ArrayList<XBRLBLS0120Bean> arl = new ArrayList<XBRLBLS0120Bean>();

	String status = "";

	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();

	PreparedStatement ps = null;

	StringBuffer sql = new StringBuffer();

	DateFormat df = new DateFormat();
	dt1 = df.formatdate(dt1);
	dt2 = df.formatdate(dt2);

	DecimalFormat dfs = new DecimalFormat("##,##.00");
	NullCheck chk = new NullCheck();

	try {

		log.info("Gnana" + ReporefSeq.trim());
		// sql.append("SELECT
		// DYNAMIC_DOMAIN,to_char(REP_DATE,'DD-MM-YYYY')REP_DATE,INSTITUTE_ID,TRAN_ID,INSTITUTE_NAME,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,SECTOR,SPOT_RATE,FWD_RATE,to_char(DUE_DATE,'DD-MM-YYYY')DUE_DATE,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME
		// FROM FIM0400_MAST_TABLE Where REP_DATE >='"+dt1+"' and REP_DATE
		// <= '"+dt2+"' ORDER BY cast(TRAN_ID as int) ASC ");

		// sql.append("SELECT
		// REPORT_REF_NO,MODES,CHQ_NUMBER,ACCT_NUMBER,ACCT_NAME,to_char(TRAN_DATE,'DD-MM-YYYY')TRAN_DATE,CHQ_AMOUNT,CRNCY,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME
		// FROM
		// TABLE(BLS0120_RPT_FUN('BLS0120','"+ReporefSeq.trim()+"','31-MAR-2014','31-MAR-2014','31-MAR-2014'))");


		sql.append("select SL_NO,NAME_OF_INSTRUMENT,ACCT_CURRENCY,to_char(AMT_FC, '9,999,999,999,990.99')AMT_FC,to_char(AMT_LC, '9,999,999,999,990.99')AMT_LC,to_char(ISSUE_DATE,'DD-MM-YYYY')ISSUE_DATE,to_char(MATURITY_DATE,'DD-MM-YYYY')MATURITY_DATE  from table(BLS0120_RPT_FUN('BLS0120','0','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");

		/* xbrl_report_master_tb */

		log.info("PYM SUMMARY " + sql.toString());

		ps = conn.prepareStatement(sql.toString());

		ResultSet rs = ps.executeQuery();

		while (rs.next()) {

			XBRLBLS0120Bean xb = new XBRLBLS0120Bean();

			xb.setSrno(NullCheck.isNotNull(rs.getString("SL_NO")));
			xb.setNameofins(NullCheck.isNotNull(rs.getString("NAME_OF_INSTRUMENT")));
			xb.setCurrency(NullCheck.isNotNull(rs.getString("ACCT_CURRENCY")));
			xb.setFcuramt(NullCheck.isNotNull(rs.getString("AMT_FC")));
			xb.setUnsecsub(NullCheck.isNotNull(rs.getString("AMT_LC")));
			xb.setIsudat(NullCheck.isNotNull(rs.getString("ISSUE_DATE")));
			xb.setMatudat(NullCheck.isNotNull(rs.getString("MATURITY_DATE")));
			

			arl.add(xb);

		}

		log.info("ARLLL" + arl.size());

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


public String detailBLS0120saves() {

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




public String BLS0120chckmodified() {

HttpServletRequest request = ServletActionContext.getRequest();
ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();
PreparedStatement ps = null;
HttpSession session = request.getSession();
StringBuffer sql = new StringBuffer();
DateFormat df=new DateFormat();		
sql.setLength(0);
if(request.getParameter("type").equals("chkuser")) {
	sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM BLS0110_MOD_TABLE WHERE ASSET_TYPE='UNSEC_DEBT' ");
}else {
	sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM BLS0110_MOD_TABLE WHERE ASSET_TYPE='UNSEC_DEBT'  ");
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


public String modBLS0120cancel() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	sql.append("DELETE FROM BLS0110_MOD_TABLE WHERE  INSTRMNT_NAME='"+NullCheck.isNotNull(request.getParameter("naminst"))+"'");
	
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




public ArrayList<XBRLBLS0120Bean> BLS0120verify(){
	
	ArrayList<XBRLBLS0120Bean> arl = new ArrayList<XBRLBLS0120Bean>();
	HttpServletRequest request = ServletActionContext.getRequest();

	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	sql.append("SELECT /* +FIRST_ROWS(100) */ INSTRMNT_NAME,TO_CHAR(report_date,'DD-MM-YYYY')  report_date, CRNCY_CODE,AMT_IN_AC,to_char(ISSU_DATE,'DD-MM-YYYY')ISSU_DATE,to_char(MATURITY_DATE,'DD-MM-YYYY')MATURITY_DATE,DECODE(DEL_FLG,'A','Added','M','Modified','D','Deleted') as DEL_FLG,LCHG_USER_ID FROM BLS0110_MOD_TABLE where   ASSET_TYPE='UNSEC_DEBT'");
	log.info("Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		
		XBRLBLS0120Bean xb=new XBRLBLS0120Bean();
		
		xb.setNaminst(NullCheck.isNotNull(rs.getString("INSTRMNT_NAME")));
		 xb.setRepdate(NullCheck.isNotNull(rs.getString("report_date")));

		xb.setAccur(NullCheck.isNotNull(rs.getString("CRNCY_CODE")));
		xb.setAmtfc(NullCheck.isNotNull(rs.getString("AMT_IN_AC")));
	    xb.setIsudat(NullCheck.isNotNull(rs.getString("ISSU_DATE")));
		xb.setMatudat(NullCheck.isNotNull(rs.getString("MATURITY_DATE")));
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


	public String BLS0120verifymaster() {
		String status="";
		HttpServletRequest request = ServletActionContext.getRequest();
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		HttpSession session = request.getSession();
		StringBuffer sql = new StringBuffer();
		DateFormat df1=new DateFormat();		
		
		//------------------get data from mod table---------------------
		XBRLBLS0120Bean xb=new XBRLBLS0120Bean();
		
		sql.setLength(0);
		sql.append("SELECT /* +FIRST_ROWS(100) */ASSET_TYPE,TO_CHAR(report_date,'DD-MM-YYYY')  report_date,INSTRMNT_NAME,CRNCY_CODE,AMT_IN_AC,to_char(ISSU_DATE,'DD-MM-YYYY')ISSU_DATE,to_char(MATURITY_DATE,'DD-MM-YYYY')MATURITY_DATE,DEL_FLG,LCHG_USER_ID FROM BLS0110_MOD_TABLE"
				+ " WHERE INSTRMNT_NAME='"+NullCheck.isNotNull(request.getParameter("naminst"))+"' AND ASSET_TYPE='"+NullCheck.isNotNull(request.getParameter("astyp"))+"' ");
		log.info("Gayu"+sql.toString());
		try {
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				
				xb.setAstyp(NullCheck.isNotNull(rs.getString("ASSET_TYPE")));
				 xb.setRepdate (NullCheck.isNotNull(rs.getString("report_date")));

				xb.setNaminst(NullCheck.isNotNull(rs.getString("INSTRMNT_NAME")));
				xb.setAccur(NullCheck.isNotNull(rs.getString("CRNCY_CODE")));
				xb.setAmtfc(NullCheck.isNotNull(rs.getString("AMT_IN_AC")));
			    xb.setIsudat(NullCheck.isNotNull(rs.getString("ISSU_DATE")));
				xb.setMatudat(NullCheck.isNotNull(rs.getString("MATURITY_DATE")));
				xb.setModtyp(NullCheck.isNotNull(rs.getString("DEL_FLG")));

			    xb.setEntryuser(NullCheck.isNotNull(rs.getString("LCHG_USER_ID")));
			    
				System.out.println("after XB");

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
			"INSERT INTO BLS0110_MAST_TABLE (ASSET_TYPE,REPORT_DATE,INSTRMNT_NAME,CRNCY_CODE,AMT_IN_AC,ISSU_DATE,MATURITY_DATE,DEL_FLG,LCHG_USER_ID,LCHG_TIME,VERIFY_USER_ID,VERIFY_TIME)"
					+ "VALUES ('" +request.getParameter("astyp") + "','" + df1.formatdate(request.getParameter("repdate")) + "','"
					+ request.getParameter("naminst") + "','"+ request.getParameter("accur")
					+ "','" + request.getParameter("amtfc") + "','" + df1.formatdate(request.getParameter("isudat")) + "','"+ df1.formatdate(request.getParameter("matudat"))+ "','"+xb.getModtyp()+"','"  
					+ session.getAttribute("userName")+"',SYSDATE,'"+ session.getAttribute("userName")+"',SYSDATE)");
	
	log.info(sql.toString());
	try {
		log.info(sql.toString());
		ps=conn.prepareStatement(sql.toString());
		
	    int rs=0;
	    rs=ps.executeUpdate();
	     
	    status="success";
	    
	    sql.setLength(0);
	    sql.append("DELETE FROM BLS0110_MOD_TABLE WHERE INSTRMNT_NAME='"+NullCheck.isNotNull(request.getParameter("naminst"))+"' AND  ASSET_TYPE='"+ request.getParameter("astyp") + "'");
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
	sql.append("UPDATE BLS0110_MAST_TABLE SET INSTRMNT_NAME='"+NullCheck.isNotNull(request.getParameter("naminst"))+"',CRNCY_CODE='"+NullCheck.isNotNull(request.getParameter("accur"))+"',AMT_IN_AC='"+NullCheck.isNotNull(request.getParameter("amtfc"))+"',ISSU_DATE='"+df1.formatdate(NullCheck.isNotNull(request.getParameter("isudat")))+"',MATURITY_DATE='"+df1.formatdate(NullCheck.isNotNull(request.getParameter("matudat")))+"',VERIY_USER_ID='"+session.getAttribute("userName")+"',VERIFY_TIME=SYSDATE WHERE INSTRMNT_NAME='"+NullCheck.isNotNull(request.getParameter("naminst"))+"' AND ASSET_TYPE='"+NullCheck.isNotNull(xb.getAstyp())+"'");
	
	try {
		log.info(sql.toString());
		ps=conn.prepareStatement(sql.toString());
		
	    int rs=0;
	    rs=ps.executeUpdate();
	     
	    status="success";
	    
	    sql.setLength(0);
	    sql.append("DELETE FROM BLS0110_MOD_TABLE WHERE INSTRMNT_NAME='"+NullCheck.isNotNull(request.getParameter("naminst"))+"' AND ASSET_TYPE='"+NullCheck.isNotNull(xb.getAstyp())+"'");
	    System.out.println(sql.toString());
	    try {
	    	System.out.println(sql.toString());
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
		sql.append("DELETE FROM BLS0110_MAST_TABLE WHERE INSTRMNT_NAME='"+NullCheck.isNotNull(request.getParameter("naminst"))+"' AND ASSET_TYPE='"+NullCheck.isNotNull(xb.getAstyp())+"'");
		
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("UPDATE BLS0110_MAST_TABLE SET INSTRMNT_NAME='"+NullCheck.isNotNull(request.getParameter("naminst"))+"',CRNCY_CODE='"+NullCheck.isNotNull(request.getParameter("accur"))+"',AMT_IN_AC='"+NullCheck.isNotNull(request.getParameter("amtfc"))+"',ISSU_DATE='"+df1.formatdate(NullCheck.isNotNull(request.getParameter("isudat")))+"',MATURITY_DATE='"+df1.formatdate(NullCheck.isNotNull(request.getParameter("matudat")))+"',VERIY_USER_ID='"+session.getAttribute("userName")+"',VERIFY_TIME=SYSDATE WHERE INSTRMNT_NAME='"+NullCheck.isNotNull(request.getParameter("naminst"))+"' AND ASSET_TYPE='"+NullCheck.isNotNull(xb.getAstyp())+"'");
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
		    sql.append("DELETE FROM BLS0110_MOD_TABLE WHERE INSTRMNT_NAME='"+NullCheck.isNotNull(request.getParameter("naminst"))+"' AND ASSET_TYPE='"+NullCheck.isNotNull(xb.getAstyp())+"'");
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
