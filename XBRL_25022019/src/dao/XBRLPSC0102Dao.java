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
import org.apache.log4j.Logger;
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

import bean.XBRLPSC0102Bean;
import bean.XBRLPSC0102Bean;
import bean.XBRLPYM0100Bean;
import bean.XBRLReportMasterBean;
import utilities.ConnectionManager;
import utilities.NullCheck;

public class XBRLPSC0102Dao {
	
	static Logger log = Logger.getLogger(XBRLPSC0102Dao.class);
	
	
	
	
	public String Reporef;
	
	
	
	
	public int cnt1;
	public String cnt;

	public String resalert;
	
		
		
	public static Logger getLog() {
		return log;
	}

	public static void setLog(Logger log) {
		XBRLPSC0102Dao.log = log;
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

	public ArrayList<XBRLPSC0102Dao> ReporefSeq(String dt1, String dt2) {

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

		ArrayList<XBRLPSC0102Dao> arl = new ArrayList<XBRLPSC0102Dao>();
		sql.append("select REPORT_REF_NO from PSC0102_MOD_TABLE where REPORT_DATE='" + dt2 + "' ORDER BY REPORT_REF_NO");

		log.info("SELECTPROFILE" + sql.toString());

		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLPSC0102Dao xel = new XBRLPSC0102Dao();
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


		
	/*************SUM OF PSC0102****************/
	
	public ArrayList<XBRLPSC0102Bean> xbrlpsc0102sumEP(String dt1,String dt2,String ReporefSeq,String curr,String reptype) {
		
		log.info("PYM SUMMARY List Data AB " + dt1 + "dt22222" + dt2);
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLPSC0102Bean> arl = new ArrayList<XBRLPSC0102Bean>();
		
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
			
			
			sql.append("select /* +FIRST_ROWS(100) */ INSTANCE_NAME,INSTANCE_CODE,to_char(AMT_PERFORM, '9,999,999,999,990.99')AMT_PERFORM,to_char(AMT_IMPAIRED, '9,999,999,999,990.99')AMT_IMPAIRED,to_char(MON_OD_AMT, '9,999,999,999,990.99')MON_OD_AMT,to_char(MON_FL_AMT, '9,999,999,999,990.99')MON_FL_AMT,to_char(MON_OTH_AMT, '9,999,999,999,990.99')MON_OTH_AMT,to_char(MON_TOT, '9,999,999,999,990.99')MON_TOT,to_char(MON_NFB_AMT, '9,999,999,999,990.99')MON_NFB_AMT,to_char(MON_RESTRUCT_AMT, '9,999,999,999,990.99')MON_RESTRUCT_AMT,to_char(OUT_OD_AMT, '9,999,999,999,990.99')OUT_OD_AMT,to_char(OUT_FL_AMT, '9,999,999,999,990.99')OUT_FL_AMT,to_char(OUT_OTH_AMT, '9,999,999,999,990.99')OUT_OTH_AMT,to_char(OUT_TOT_AMT, '9,999,999,999,990.99')OUT_TOT_AMT,to_char(OUT_NFB_AMT, '9,999,999,999,990.99')OUT_NFB_AMT,to_char(TD_MIN, '9,999,999,999,990.99')TD_MIN,to_char(TD_MAX, '9,999,999,999,990.99')TD_MAX,to_char(OD_MIN, '9,999,999,999,990.99')OD_MIN,to_char(OD_MAX, '9,999,999,999,990.99')OD_MAX,to_char(FL_MIN, '9,999,999,999,990.99')FL_MIN,to_char(FL_MAX, '9,999,999,999,990.99')FL_MAX,to_char(OTH_MIN, '9,999,999,999,990.99')OTH_MIN,to_char(OTH_MAX, '9,999,999,999,990.99')OTH_MAX,to_char(WEIGHT_AVG_TL, '9,999,999,999,990.99')WEIGHT_AVG_TL,to_char(WEIGHT_AVG_OD, '9,999,999,999,990.99')WEIGHT_AVG_OD,to_char(WEIGHT_AVG_FL, '9,999,999,999,990.99')WEIGHT_AVG_FL,to_char(WEIGHT_AVG_OTH, '9,999,999,999,990.99')WEIGHT_AVG_OTH from table(PSC0102_S1_RPT_FUN('PSC0102','"+chk.notZero(ReporefSeq.trim())+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");

			
			log.info("PSC SUMMARY "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				XBRLPSC0102Bean xb=new XBRLPSC0102Bean();
				
				xb.setInsname(NullCheck.isNotNull(rs.getString("INSTANCE_NAME")));
				xb.setInscode(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
				xb.setAmtperform(NullCheck.isNotNull(rs.getString("AMT_PERFORM")));
				xb.setAmtimp(NullCheck.isNotNull(rs.getString("AMT_IMPAIRED")));
				xb.setMonodamt(NullCheck.isNotNull(rs.getString("MON_OD_AMT")));
				xb.setMonflamt(NullCheck.isNotNull(rs.getString("MON_FL_AMT")));
				xb.setMonothamt(NullCheck.isNotNull(rs.getString("MON_OTH_AMT")));
				xb.setMontotamt(NullCheck.isNotNull(rs.getString("MON_TOT")));
				xb.setMonnfbamt(NullCheck.isNotNull(rs.getString("MON_NFB_AMT")));
				xb.setMonresamt(NullCheck.isNotNull(rs.getString("MON_RESTRUCT_AMT")));
				xb.setOutodamt(NullCheck.isNotNull(rs.getString("OUT_OD_AMT")));
				xb.setOutflamt(NullCheck.isNotNull(rs.getString("OUT_FL_AMT")));
				xb.setOutothamt(NullCheck.isNotNull(rs.getString("OUT_OTH_AMT")));
				xb.setOuttotamt(NullCheck.isNotNull(rs.getString("OUT_TOT_AMT")));
				xb.setOutnfbamt(NullCheck.isNotNull(rs.getString("OUT_NFB_AMT")));
				xb.setTdmin(NullCheck.isNotNull(rs.getString("TD_MIN")));
				xb.setTdmax(NullCheck.isNotNull(rs.getString("TD_MAX")));
				xb.setOdmin(NullCheck.isNotNull(rs.getString("OD_MIN")));
				xb.setOdmax(NullCheck.isNotNull(rs.getString("OD_MAX")));
				xb.setFlmin(NullCheck.isNotNull(rs.getString("FL_MIN")));
				xb.setFlmax(NullCheck.isNotNull(rs.getString("FL_MAX")));
				xb.setOthmin(NullCheck.isNotNull(rs.getString("OTH_MIN")));
				xb.setOthmax(NullCheck.isNotNull(rs.getString("OTH_MAX")));
				xb.setWetavgtl(NullCheck.isNotNull(rs.getString("WEIGHT_AVG_TL")));
				xb.setWetavgod(NullCheck.isNotNull(rs.getString("WEIGHT_AVG_OD")));
				xb.setWetavgfl(NullCheck.isNotNull(rs.getString("WEIGHT_AVG_FL")));
				xb.setWetavgoth(NullCheck.isNotNull(rs.getString("WEIGHT_AVG_OTH")));
			
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
	
	
	
	
	
public ArrayList<XBRLPSC0102Bean> xbrlpsc0102sumEP1(String dt1,String dt2,String ReporefSeq,String curr,String reptype) {
		
		log.info("PYM SUMMARY List Data AB " + dt1 + "dt22222" + dt2);
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLPSC0102Bean> arl = new ArrayList<XBRLPSC0102Bean>();
		
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
			
			
			sql.append("select /* +FIRST_ROWS(100) */ INSTANCE_NAME,INSTANCE_CODE,to_char(AMT_PERFORM, '9,999,999,999,990.99')AMT_PERFORM,to_char(AMT_IMPAIRED, '9,999,999,999,990.99')AMT_IMPAIRED,to_char(MON_OD_AMT, '9,999,999,999,990.99')MON_OD_AMT,to_char(MON_FL_AMT, '9,999,999,999,990.99')MON_FL_AMT,to_char(MON_OTH_AMT, '9,999,999,999,990.99')MON_OTH_AMT,to_char(MON_TOT, '9,999,999,999,990.99')MON_TOT,to_char(MON_NFB_AMT, '9,999,999,999,990.99')MON_NFB_AMT,to_char(MON_RESTRUCT_AMT, '9,999,999,999,990.99')MON_RESTRUCT_AMT,to_char(OUT_OD_AMT, '9,999,999,999,990.99')OUT_OD_AMT,to_char(OUT_FL_AMT, '9,999,999,999,990.99')OUT_FL_AMT,to_char(OUT_OTH_AMT, '9,999,999,999,990.99')OUT_OTH_AMT,to_char(OUT_TOT_AMT, '9,999,999,999,990.99')OUT_TOT_AMT,to_char(OUT_NFB_AMT, '9,999,999,999,990.99')OUT_NFB_AMT,to_char(TD_MIN, '9,999,999,999,990.99')TD_MIN,to_char(TD_MAX, '9,999,999,999,990.99')TD_MAX,to_char(OD_MIN, '9,999,999,999,990.99')OD_MIN,to_char(OD_MAX, '9,999,999,999,990.99')OD_MAX,to_char(FL_MIN, '9,999,999,999,990.99')FL_MIN,to_char(FL_MAX, '9,999,999,999,990.99')FL_MAX,to_char(OTH_MIN, '9,999,999,999,990.99')OTH_MIN,to_char(OTH_MAX, '9,999,999,999,990.99')OTH_MAX,to_char(WEIGHT_AVG_TL, '9,999,999,999,990.99')WEIGHT_AVG_TL,to_char(WEIGHT_AVG_OD, '9,999,999,999,990.99')WEIGHT_AVG_OD,to_char(WEIGHT_AVG_FL, '9,999,999,999,990.99')WEIGHT_AVG_FL,to_char(WEIGHT_AVG_OTH, '9,999,999,999,990.99')WEIGHT_AVG_OTH from table(PSC0102_S2_RPT_FUN('PSC0102','"+chk.notZero(ReporefSeq.trim())+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");

				
				
				
			
			
			log.info("PYM SUMMARY "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				XBRLPSC0102Bean xb=new XBRLPSC0102Bean();
				
				xb.setInsname(NullCheck.isNotNull(rs.getString("INSTANCE_NAME")));
				xb.setInscode(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
				xb.setAmtperform(NullCheck.isNotNull(rs.getString("AMT_PERFORM")));
				xb.setAmtimp(NullCheck.isNotNull(rs.getString("AMT_IMPAIRED")));
				xb.setMonodamt(NullCheck.isNotNull(rs.getString("MON_OD_AMT")));
				xb.setMonflamt(NullCheck.isNotNull(rs.getString("MON_FL_AMT")));
				xb.setMonothamt(NullCheck.isNotNull(rs.getString("MON_OTH_AMT")));
				xb.setMontotamt(NullCheck.isNotNull(rs.getString("MON_TOT")));
				xb.setMonnfbamt(NullCheck.isNotNull(rs.getString("MON_NFB_AMT")));
				xb.setMonresamt(NullCheck.isNotNull(rs.getString("MON_RESTRUCT_AMT")));
				xb.setOutodamt(NullCheck.isNotNull(rs.getString("OUT_OD_AMT")));
				xb.setOutflamt(NullCheck.isNotNull(rs.getString("OUT_FL_AMT")));
				xb.setOutothamt(NullCheck.isNotNull(rs.getString("OUT_OTH_AMT")));
				xb.setOuttotamt(NullCheck.isNotNull(rs.getString("OUT_TOT_AMT")));
				xb.setOutnfbamt(NullCheck.isNotNull(rs.getString("OUT_NFB_AMT")));
				xb.setTdmin(NullCheck.isNotNull(rs.getString("TD_MIN")));
				xb.setTdmax(NullCheck.isNotNull(rs.getString("TD_MAX")));
				xb.setOdmin(NullCheck.isNotNull(rs.getString("OD_MIN")));
				xb.setOdmax(NullCheck.isNotNull(rs.getString("OD_MAX")));
				xb.setFlmin(NullCheck.isNotNull(rs.getString("FL_MIN")));
				xb.setFlmax(NullCheck.isNotNull(rs.getString("FL_MAX")));
				xb.setOthmin(NullCheck.isNotNull(rs.getString("OTH_MIN")));
				xb.setOthmax(NullCheck.isNotNull(rs.getString("OTH_MAX")));
				xb.setWetavgtl(NullCheck.isNotNull(rs.getString("WEIGHT_AVG_TL")));
				xb.setWetavgod(NullCheck.isNotNull(rs.getString("WEIGHT_AVG_OD")));
				xb.setWetavgfl(NullCheck.isNotNull(rs.getString("WEIGHT_AVG_FL")));
				xb.setWetavgoth(NullCheck.isNotNull(rs.getString("WEIGHT_AVG_OTH")));
			
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
	
	
	
	
	/*************************Details PSC0102**********************/
	
	
	
	
	
public ArrayList<XBRLPSC0102Bean> xbrlpsc0102ajaxdetails(String repname,String reprefno,String instno,String dt2,String dt1,String curr) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("repname    " + repname + "reprefno   " + reprefno + "instno   " + instno + "dt2     " + dt2 +  "dt1    " + dt1);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLPSC0102Bean> arl = new ArrayList<XBRLPSC0102Bean>();
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
			
			//select * from table(PSC0102_DTL_FUN('PSC0102','0','0','31-MAR-2014','01-MAR-2014','31-MAR-2014','MUR'));
			sql.append("select /* +FIRST_ROWS(100) */ ACCT_NUMBER,ACCT_NAME,CRNCY_CODE,to_char(SANCT_AMT, '9,999,999,999,990.99')SANCT_AMT,to_char(OUTSTANDING_AMT, '9,999,999,999,990.99')OUTSTANDING_AMT,IMPAIRED_FLG,to_char(ACCT_OPN_DATE,'DD-MM-YYYY')ACCT_OPN_DATE,to_char(NFB_FACILITY_AMT,'9,999,999,999,990.99')NFB_FACILITY_AMT,RESTRUCTURED_FLG,to_char(INT_RATE, '9,999,999,999,990.99')INT_RATE,SECURED_FLG,SCHM_CODE,SCHM_TYPE,ISIC_CODE,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE from table(PSC0102_DTL_FUN('PSC0102','"+chk.notZero(reprefno)+"','"+chk.notZero(reprefno)+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");

			
			log.info("PSC Vinoth Kumar  "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				//log.info("whileee");
				
				
				 
				XBRLPSC0102Bean xb=new XBRLPSC0102Bean();
				
				xb.setAcno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
				xb.setAcname(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
				xb.setCrncy(NullCheck.isNotNull(rs.getString("CRNCY_CODE")));
				xb.setSncamt(NullCheck.isNotNull(rs.getString("SANCT_AMT")));
				xb.setOtstndamt(NullCheck.isNotNull(rs.getString("OUTSTANDING_AMT")));
				xb.setNpaflg(NullCheck.isNotNull(rs.getString("IMPAIRED_FLG")));
				xb.setAcopendt(NullCheck.isNotNull(rs.getString("ACCT_OPN_DATE")));
				xb.setNfbfacamt(NullCheck.isNotNull(rs.getString("NFB_FACILITY_AMT")));
				xb.setResflg(NullCheck.isNotNull(rs.getString("RESTRUCTURED_FLG")));
				xb.setInsrt(NullCheck.isNotNull(rs.getString("INT_RATE")));
				xb.setSecflg(NullCheck.isNotNull(rs.getString("SECURED_FLG")));
				xb.setShmcd(NullCheck.isNotNull(rs.getString("SCHM_CODE")));
				xb.setShmty(NullCheck.isNotNull(rs.getString("SCHM_TYPE")));
				xb.setIsiccd(NullCheck.isNotNull(rs.getString("ISIC_CODE")));
				xb.setRepdt(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
				
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







public String detailPSC0102saves() {

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


public ArrayList<XBRLPSC0102Bean> xbrlbls4RR(String dt1,String dt2,String reprefno,String instno,String curr) {
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLPSC0102Bean> arl = new ArrayList<XBRLPSC0102Bean>();
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
		
	sql.append("select /* +FIRST_ROWS(100) */ ACCT_NUMBER,ACCT_NAME,CRNCY_CODE,to_char(SANCT_AMT, '9,999,999,999,990.99')SANCT_AMT,to_char(OUTSTANDING_AMT, '9,999,999,999,990.99')OUTSTANDING_AMT,IMPAIRED_FLG,to_char(ACCT_OPN_DATE,'DD-MM-YYYY')ACCT_OPN_DATE,to_char(NFB_FACILITY_AMT,'9,999,999,999,990.99')NFB_FACILITY_AMT,RESTRUCTURED_FLG,to_char(INT_RATE, '9,999,999,999,990.99')INT_RATE,SECURED_FLG,SCHM_CODE,SCHM_TYPE,ISIC_CODE,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE from table(PSC0102_DTL_FUN('PSC0102','"+chk.notZero(reprefno)+"','"+chk.notZero(reprefno)+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");
	log.info("DOC&&&&SELECT Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		
		XBRLPSC0102Bean xb=new XBRLPSC0102Bean();
		xb.setAcno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
		xb.setAcname(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
		xb.setCrncy(NullCheck.isNotNull(rs.getString("CRNCY_CODE")));
		xb.setSncamt(NullCheck.isNotNull(rs.getString("SANCT_AMT")));
		xb.setOtstndamt(NullCheck.isNotNull(rs.getString("OUTSTANDING_AMT")));
		xb.setNpaflg(NullCheck.isNotNull(rs.getString("IMPAIRED_FLG")));
		xb.setAcopendt(NullCheck.isNotNull(rs.getString("ACCT_OPN_DATE")));
		xb.setNfbfacamt(NullCheck.isNotNull(rs.getString("NFB_FACILITY_AMT")));
		xb.setResflg(NullCheck.isNotNull(rs.getString("RESTRUCTURED_FLG")));
		xb.setInsrt(NullCheck.isNotNull(rs.getString("INT_RATE")));
		xb.setSecflg(NullCheck.isNotNull(rs.getString("SECURED_FLG")));
		xb.setShmcd(NullCheck.isNotNull(rs.getString("SCHM_CODE")));
		xb.setShmty(NullCheck.isNotNull(rs.getString("SCHM_TYPE")));
		xb.setIsiccd(NullCheck.isNotNull(rs.getString("ISIC_CODE")));
		xb.setRepdt(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
	
		
		
		
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




public String detailPSC0102savecheck() {

	ConnectionManager connmgr=new ConnectionManager();
	Connection conn=connmgr.getConnection();
	ArrayList<String> arl = new ArrayList<String>();
			HttpServletRequest request = ServletActionContext.getRequest();
			DateFormat df = new DateFormat();
			StringBuffer sql = new StringBuffer();
			PreparedStatement ps = null;
			
			sql.append("SELECT COUNT(REPORT_DATE) as repdate FROM PSC0102_S1_RPT_TB where REPORT_ID = '"+request.getParameter("reptype")+"' AND  REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ");
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




public String PSC0102chckmodified() {

HttpServletRequest request = ServletActionContext.getRequest();
ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();
PreparedStatement ps = null;
HttpSession session = request.getSession();
StringBuffer sql = new StringBuffer();
DateFormat df=new DateFormat();		
sql.setLength(0);
if(request.getParameter("type").equals("chkuser")) {
	sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM PSC0102_MOD_TABLE ");
}else {
	sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM PSC0102_MOD_TABLE ");
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
public ArrayList<XBRLPSC0102Bean>PSC0102verify(){
	
	ArrayList<XBRLPSC0102Bean> arl = new ArrayList<XBRLPSC0102Bean>();
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	sql.	append("SELECT   /* +FIRST_ROWS(100) */ ACCT_NUMBER,ACCT_NAME,CRNCY_CODE,to_char(SANCT_AMT, '9,999,999,999,990.99')SANCT_AMT,to_char(OUTSTANDING_AMT, '9,999,999,999,990.99')OUTSTANDING_AMT,IMPAIRED_FLG,to_char(ACCT_OPN_DATE,'DD-MM-YYYY')ACCT_OPN_DATE,to_char(NFB_FACILITY_AMT,'9,999,999,999,990.99')NFB_FACILITY_AMT,RESTRUCTURED_FLG,to_char(INT_RATE, '9,999,999,999,990.99')INT_RATE,SECURED_FLG,SCHM_CODE,SCHM_TYPE,ISIC_CODE,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,DECODE(DEL_FLG,'A','Added','M','Modified','D','Deleted') as DEL_FLG,LCHG_USER_ID  FROM PSC0102_MOD_TABLE ");
	log.info("Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     
	

	while(rs.next()){
		
		
		
		XBRLPSC0102Bean xb=new XBRLPSC0102Bean();
		xb.setAcno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
		xb.setAcname(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
		xb.setCrncy(NullCheck.isNotNull(rs.getString("CRNCY_CODE")));
		xb.setSncamt(NullCheck.isNotNull(rs.getString("SANCT_AMT")));
		xb.setOtstndamt(NullCheck.isNotNull(rs.getString("OUTSTANDING_AMT")));
		xb.setNpaflg(NullCheck.isNotNull(rs.getString("IMPAIRED_FLG")));
		xb.setAcopendt(NullCheck.isNotNull(rs.getString("ACCT_OPN_DATE")));
		xb.setNfbfacamt(NullCheck.isNotNull(rs.getString("NFB_FACILITY_AMT")));
		xb.setResflg(NullCheck.isNotNull(rs.getString("RESTRUCTURED_FLG")));
		xb.setInsrt(NullCheck.isNotNull(rs.getString("INT_RATE")));
		xb.setSecflg(NullCheck.isNotNull(rs.getString("SECURED_FLG")));
		xb.setShmcd(NullCheck.isNotNull(rs.getString("SCHM_CODE")));
		xb.setShmty(NullCheck.isNotNull(rs.getString("SCHM_TYPE")));
		xb.setIsiccd(NullCheck.isNotNull(rs.getString("ISIC_CODE")));
		xb.setRepdt(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
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




public String modPSC0102cancel() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	sql.append("DELETE FROM PSC0102_MOD_TABLE WHERE   ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("acno"))+"' ");
	
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


public String PSC0102verifymaster() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	HttpSession session = request.getSession();
	StringBuffer sql = new StringBuffer();
	DateFormat df1=new DateFormat();		
	
	//------------------get data from mod table---------------------
	XBRLPSC0102Bean xb=new XBRLPSC0102Bean();
	
	sql.setLength(0);
	sql.append("SELECT   /* +FIRST_ROWS(100) */ ACCT_NUMBER,ACCT_NAME,CRNCY_CODE,to_char(SANCT_AMT, '9,999,999,999,990.99')SANCT_AMT,to_char(OUTSTANDING_AMT, '9,999,999,999,990.99')OUTSTANDING_AMT,IMPAIRED_FLG,to_char(ACCT_OPN_DATE,'DD-MM-YYYY')ACCT_OPN_DATE,to_char(NFB_FACILITY_AMT,'9,999,999,999,990.99')NFB_FACILITY_AMT,RESTRUCTURED_FLG,to_char(INT_RATE, '9,999,999,999,990.99')INT_RATE,SECURED_FLG,SCHM_CODE,SCHM_TYPE,ISIC_CODE,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,DEL_FLG,LCHG_USER_ID  FROM PSC0102_MOD_TABLE "
			+ "WHERE ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("acno"))+"' ");
	log.info("Gayu"+sql.toString());
	try {
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			
			xb.setAcno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
			xb.setAcname(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
			xb.setCrncy(NullCheck.isNotNull(rs.getString("CRNCY_CODE")));
			xb.setSncamt(NullCheck.isNotNull(rs.getString("SANCT_AMT")));
			xb.setOtstndamt(NullCheck.isNotNull(rs.getString("OUTSTANDING_AMT")));
			xb.setNpaflg(NullCheck.isNotNull(rs.getString("IMPAIRED_FLG")));
			xb.setAcopendt(NullCheck.isNotNull(rs.getString("ACCT_OPN_DATE")));
			xb.setNfbfacamt(NullCheck.isNotNull(rs.getString("NFB_FACILITY_AMT")));
			xb.setResflg(NullCheck.isNotNull(rs.getString("RESTRUCTURED_FLG")));
			xb.setInsrt(NullCheck.isNotNull(rs.getString("INT_RATE")));
			xb.setSecflg(NullCheck.isNotNull(rs.getString("SECURED_FLG")));
			xb.setShmcd(NullCheck.isNotNull(rs.getString("SCHM_CODE")));
			xb.setShmty(NullCheck.isNotNull(rs.getString("SCHM_TYPE")));
			xb.setIsiccd(NullCheck.isNotNull(rs.getString("ISIC_CODE")));
			xb.setRepdt(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
			

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
sql.append("INSERT INTO PSC0102_MAST_TABLE(ACCT_NUMBER,ACCT_NAME,CRNCY_CODE,SANCT_AMT,OUTSTANDING_AMT,IMPAIRED_FLG,ACCT_OPN_DATE,NFB_FACILITY_AMT,RESTRUCTURED_FLG,INT_RATE,SECURED_FLG,SCHM_CODE,SCHM_TYPE,ISIC_CODE,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
     	+"values('" + request.getParameter("acno")
			+ "','" + request.getParameter("acname") + "','" + request.getParameter("crncy") + "','"
			+ request.getParameter("sncamt") + "','" + request.getParameter("otstndamt") + "','"
			+ request.getParameter("npaflg") + "','"+ df1.formatdate(request.getParameter("acopendt")) + "','"
			+ request.getParameter("nfbfacamt") + "','"+ request.getParameter("resflg") + "','"
			+ request.getParameter("insrt") + "','"+ request.getParameter("secflg") + "','"
			+ request.getParameter("shmcd") + "','"+ request.getParameter("shmty") + "','"
			+ request.getParameter("isiccd") + "','"
			+df1.formatdate(request.getParameter("repdt"))+ "','" + session.getAttribute("userName")
			  + "',SYSDATE)");
try {
	log.info(sql.toString());
	ps=conn.prepareStatement(sql.toString());
	
    int rs=0;
    rs=ps.executeUpdate();
     
    status="success";
    
    sql.setLength(0);
    sql.append("DELETE FROM PSC0102_MOD_TABLE WHERE ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("acno"))+"'");
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
sql.append("UPDATE PSC0102_MAST_TABLE SET ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("acno "))+"',ACCT_NAME='"+NullCheck.isNotNull(request.getParameter("acname"))+"',CRNCY_CODE='"+NullCheck.isNotNull(request.getParameter("crncy"))+"',SANCT_AMT='"+NullCheck.isNotNull(request.getParameter("sncamt"))+"',OUTSTANDING_AMT='"+NullCheck.isNotNull(request.getParameter("otstndamt"))+"',IMPAIRED_FLG='"+NullCheck.isNotNull(request.getParameter("npaflg"))+"',ACCT_OPN_DATE='"+df1.formatdate(request.getParameter("acopendt"))+"',NFB_FACILITY_AMT='"+NullCheck.isNotNull(request.getParameter("nfbfacamt"))+"',RESTRUCTURED_FLG='"+NullCheck.isNotNull(request.getParameter("resflg"))+"',INT_RATE='"+NullCheck.isNotNull(request.getParameter("insrt"))+"',SECURED_FLG='"+NullCheck.isNotNull(request.getParameter("secflg"))+"',SCHM_CODE='"+NullCheck.isNotNull(request.getParameter("shmcd"))+"',SCHM_TYPE='"+NullCheck.isNotNull(request.getParameter("shmty"))+"',ISIC_CODE='"+NullCheck.isNotNull(request.getParameter("isiccd"))+"',REPORT_DATE='"+df1.formatdate(request.getParameter("repdt"))+"',DEL_FLG='"+xb.getModtyp()+"',LCHG_USER_ID='"+session.getAttribute("entryuser")+"',VERIFY_TIME=SYSDATE WHERE ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("acno "))+"'");

try {
	log.info(sql.toString());

	ps=conn.prepareStatement(sql.toString());
	
    int rs=0;
    rs=ps.executeUpdate();
     
    status="success";
    
    sql.setLength(0);
    sql.append("DELETE FROM PSC0102_MOD_TABLE WHERE ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("acno"))+"'");

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
	sql.append("DELETE FROM PSC0102_MAST_TABLE WHERE ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("acno"))+"'");

	try {
		log.info(sql.toString());
		ps=conn.prepareStatement(sql.toString());
		
	    int rs=0;
	    rs=ps.executeUpdate();
	     
	    status="success";
	    log.info(status);
	    sql.setLength(0);
	    sql.append("UPDATE PSC0102_MOD_TABLE SET LCHG_USER='"+session.getAttribute("userName")+"' WHERE REPORT_DATE='"+df1.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"' and ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("acno"))+"'");

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
		sql.append("DELETE FROM PSC0102_MOD_TABLE WHERE ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("acno"))+"'");
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
	




