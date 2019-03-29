package dao;

import java.sql.CallableStatement;

/****************************************************************************************************************
*																												*
* 	* @companyName 			:	Bonfire Innovation Private Limited Chennai										*
* 	* @project 				:	Extensible Business Reporting Language (XBRL)									*
* 	* @name 				:	XBRLFIM0100Dao.java															*
* 	* @path 				:	action																			*
* 	* @author 				:	S Gayathiri																	*
* 	* @version 				: 	1.0																				*
* 	* @functionality 		:	It contains the action with multiple methods to create SUP01400 Report.													*
* 	* @relatedScripts 		: 	bean.XBRLFIM0100Bean.java,dao.XBRLFIM0100Dao.java 								*
* 	* @creationDate 		:																					*
* 	* @lastModifiedDate 	:	18-02-2018																				*
* 	* @modificationHistory 	: 	Verification Changes																				*
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

import basecode.DateFormat;
import bean.XBRLFIM0100Bean;
import bean.XBRLBOPBean;
import bean.XBRLFIM0100Bean;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;

public class XBRLFIM0100Dao {

	static Logger log = Logger.getLogger(XBRLFIM0100Dao.class);

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

	public ArrayList<XBRLFIM0100Dao> ReporefSeq(String dt1, String dt2) {

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

		ArrayList<XBRLFIM0100Dao> arl = new ArrayList<XBRLFIM0100Dao>();
		sql.append(
				"select REPORT_REF_NO from FIM0100_MOD_TABLE where REPORT_DATE='" + dt2 + "' ORDER BY REPORT_REF_NO");

		log.info("SELECTPROFILE" + sql.toString());

		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLFIM0100Dao xel = new XBRLFIM0100Dao();
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

	public ArrayList<XBRLFIM0100Bean> xbrlfimRR(String reptype, String dt1, String dt2, String reprefno, String instno,
			String curr) {

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		ArrayList<XBRLFIM0100Bean> arl = new ArrayList<XBRLFIM0100Bean>();
		NullCheck chk = new NullCheck();

		String status = "";

		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();

		PreparedStatement ps = null;

		StringBuffer sql = new StringBuffer();

		DateFormat df = new DateFormat();

		dt1 = df.formatdate(dt1);
		dt2 = df.formatdate(dt2);

		// sql.append("SELECT * FROM
		// TABLE(FIM0100_DTL_FUN('FIM0100','0','0','31-AUG-2018','01-AUG-2018','31-AUG-2018','MUR'))");

		sql.append(
				"SELECT /* +FIRST_ROWS(100) */ TRAN_CRNCY,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,INSTITUTE_NAME,TRAN_NATURE,INSTITUTE_CODE,TRAN_TYPE,to_char(TRAN_AMT, '9,999,999,999,990.99')TRAN_AMT,to_char(INT_START_DATE,'DD-MM-YYYY')INT_START_DATE,to_char(INT_END_DATE,'DD-MM-YYYY')INT_END_DATE,to_char(INT_RATE, '9,999,999,999,990.99')INT_RATE FROM TABLE(FIM0100_DTL_FUN('FIM0100','"
						+ chk.notZero(reprefno) + "','" + chk.notZero(instno) + "','" + dt2 + "','" + dt1 + "','" + dt2
						+ "','" + curr + "'))");
		log.info("DOC&&&&SELECT Gayu" + sql.toString());
		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				XBRLFIM0100Bean xb = new XBRLFIM0100Bean();

				xb.setRptdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
				xb.setInstitname(NullCheck.isNotNull(rs.getString("INSTITUTE_NAME")));
				xb.setInstitcode(NullCheck.isNotNull(rs.getString("INSTITUTE_CODE")));
				xb.setTrannature(NullCheck.isNotNull(rs.getString("TRAN_NATURE")));
				xb.setTrancrcny(NullCheck.isNotNull(rs.getString("TRAN_CRNCY")));
				xb.setTrantype(NullCheck.isNotNull(rs.getString("TRAN_TYPE")));
				xb.setTranamt(NullCheck.isNotNull(rs.getString("TRAN_AMT")));
				xb.setIntstadate(NullCheck.isNotNull(rs.getString("INT_START_DATE")));
				xb.setIntenddate(NullCheck.isNotNull(rs.getString("INT_END_DATE")));
				xb.setIntrate(NullCheck.isNotNull(rs.getString("INT_RATE")));

				arl.add(xb);
			}
		} catch (SQLException e) {
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

	public ArrayList<XBRLFIM0100Bean> xbrl1fimsumEP(String dt1, String dt2, String ReporefSeq, String curr) {

		log.info("FIM SUMMARY List Data AB " + dt1 + "dt22222" + dt2);

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		ArrayList<XBRLFIM0100Bean> arl = new ArrayList<XBRLFIM0100Bean>();

		String status = "";

		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();

		PreparedStatement ps = null;

		StringBuffer sql = new StringBuffer();

		DateFormat df = new DateFormat();
		dt1 = df.formatdate(dt1);
		dt2 = df.formatdate(dt2);

		DecimalFormat dfs = new DecimalFormat("##,##.00");

		try {

			log.info("Gnana" + ReporefSeq.trim());
			// sql.append("SELECT
			// DYNAMIC_DOMAIN,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,INSTITUTE_ID,TRAN_ID,INSTITUTE_NAME,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,SECTOR,SPOT_RATE,FWD_RATE,to_char(DUE_DATE,'DD-MM-YYYY')DUE_DATE,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME
			// FROM FIM0400_MAST_TABLE Where REPORT_DATE >='"+dt1+"' and REPORT_DATE <=
			// '"+dt2+"' ORDER BY cast(TRAN_ID as int) ASC ");
			NullCheck chk = new NullCheck();

			// sql.append("SELECT /* +FIRST_ROWS(100) */DYNAMIC_DOMAIN
			// ,TRAN_CRNCY,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,INSTITUTION_SL_NO,TRANSACTION_SL_NO,INSTITUTION_NAME,TRAN_NATURE,INSTITUTE_CODE,
			// to_char(SM_TRAN_AMT, '9,999,999,999,990.99')SM_TRAN_AMT,to_char(SM_INT_RATE,
			// '9,999,999,999,990.99')SM_INT_RATE, to_char(MSN_TRAN_AMT,
			// '9,999,999,999,990.99')MSN_TRAN_AMT,to_char(MSN_START_DATE,'DD-MM-YYYY')MSN_START_DATE,to_char(MSN_END_DATE,'DD-MM-YYYY')MSN_END_DATE,
			// to_char(MSN_INT_RATE, '9,999,999,999,990.99')MSN_INT_RATE,
			// to_char(TM_TRAN_AMT,
			// '9,999,999,999,990.99')TM_TRAN_AMT,to_char(TM_START_DATE,'DD-MM-YYYY')TM_START_DATE,to_char(TM_END_DATE,'DD-MM-YYYY')TM_END_DATE,to_char(TM_INT_RATE,
			// '9,999,999,999,990.99')TM_INT_RATE FROM
			// TABLE(FIM0100_RPT_FUN('FIM0100',0,'"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			// sql.append("SELECT
			// REPORT_ID,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,to_char(FROM_DATE,'DD-MM-YYYY')FROM_DATE,to_char(TO_DATE,'DD-MM-YYYY')TO_DATE,VERSION_NO,CURRENCY,INSTITUTE_SL_NO,TRAN_SL_NO,INSTITUTE_NAME,INSTITUTE_CODE,PUR_CRNCY,to_char(PUR_AMT,
			// '9,999,999,999,990.99')PUR_AMT,SALE_CRNCY,to_char(SALE_AMT,
			// '9,999,999,999,990.99')SALE_AMT,to_char(RATE,
			// '9,999,999,999,990.99')RATE,to_char(VALUE_DATE,'DD-MM-YYYY')VALUE_DATE FROM
			// TABLE(FIM0100_RPT_FUN('FIM0100','"+chk.isNotZero(ReporefSeq.trim())+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			sql.append(
					"SELECT INSTITUTION_SL_NO,INSTITUTE_NAME,INSTITUTE_CODE  FROM TABLE(FIM0100_S1_RPT_FUN('FIM0100','"
							+ chk.isNotZero(ReporefSeq.trim()) + "','" + dt2 + "','" + dt2 + "','" + dt2 + "','" + curr
							+ "'))");

			/* xbrl_report_master_tb */

			log.info("FIM SUMMARY " + sql.toString());

			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLFIM0100Bean xb = new XBRLFIM0100Bean();

				// xb.setRepdate(NullCheck.isNotNull(rs.getString("SRL_NO")));
				// xb.setRepid(NullCheck.isNotNull(rs.getString("REPORT_ID")));
				// xb.setRepdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
				// xb.setFmdt(NullCheck.isNotNull(rs.getString("FROM_DATE")));
				// xb.setTodt(NullCheck.isNotNull(rs.getString("TO_DATE")));
				// xb.setVersnno(NullCheck.isNotNull(rs.getString("VERSION_NO")));
				// xb.setCurr(NullCheck.isNotNull(rs.getString("CURRENCY")));
				xb.setInstslno(NullCheck.isNotNull(rs.getString("INSTITUTION_SL_NO")));
				// xb.setTranid(NullCheck.isNotNull(rs.getString("TRAN_SL_NO")));
				xb.setInstnam(NullCheck.isNotNull(rs.getString("INSTITUTE_NAME")));
				xb.setInstcd(NullCheck.isNotNull(rs.getString("INSTITUTE_CODE")));

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

	public ArrayList<XBRLFIM0100Bean> xbrlfimsumEP(String dt1, String dt2, String ReporefSeq, String curr) {

		log.info("PYM SUMMARY List Data AB " + dt1 + "dt22222" + dt2);

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		ArrayList<XBRLFIM0100Bean> arl = new ArrayList<XBRLFIM0100Bean>();

		String status = "";

		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();

		PreparedStatement ps = null;

		StringBuffer sql = new StringBuffer();

		DateFormat df = new DateFormat();
		dt1 = df.formatdate(dt1);
		dt2 = df.formatdate(dt2);

		DecimalFormat dfs = new DecimalFormat("##,##.00");

		try {

			log.info("Gnana" + ReporefSeq.trim());

			log.info("Report ref");

			// sql.append("SELECT INSTITUTION_SL_NO,INSTITUTION_NAME,INSTITUTE_CODE FROM
			// TABLE(FIM0100_RPT_FUN('FIM0100',0,'"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			sql.append(
					"SELECT /* +FIRST_ROWS(100) */DYNAMIC_DOMAIN, TRAN_CRNCY,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,INSTITUTION_SL_NO,TRANSACTION_SL_NO,INSTITUTION_NAME,TRAN_NATURE,INSTITUTE_CODE, to_char(CM_TRAN_AMT, '9,999,999,999,990.99')CM_TRAN_AMT,to_char(CM_INT_RATE, '9,999,999,999,990.99')CM_INT_RATE, to_char(MSN_TRAN_AMT, '9,999,999,999,990.99')MSN_TRAN_AMT,to_char(MSN_START_DATE,'DD-MM-YYYY')MSN_START_DATE,to_char(MSN_END_DATE,'DD-MM-YYYY')MSN_END_DATE, to_char(MSN_INT_RATE, '9,999,999,999,990.99')MSN_INT_RATE, to_char(TM_TRAN_AMT, '9,999,999,999,990.99')TM_TRAN_AMT,to_char(TM_START_DATE,'DD-MM-YYYY')TM_START_DATE,to_char(TM_END_DATE,'DD-MM-YYYY')TM_END_DATE,to_char(TM_INT_RATE, '9,999,999,999,990.99')TM_INT_RATE FROM TABLE(FIM0100_S2_RPT_FUN('FIM0100',0,'"
							+ dt2 + "','" + dt2 + "','" + dt2 + "','" + curr + "'))");
			// sql.append("SELECT * FROM
			// TABLE(FIM0100_RPT_FUN('FIM0100','0','31-MAR-2014','31-MAR-2014','31-MAR-2014','MUR'))");

			// sql.append("SELECT /* +FIRST_ROWS(100) */
			// INT_RATE,TRAN_NATURE,INSTITUTION_NAME,INSTITUTE_CODE,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,to_char(START_DATE,'DD-MM-YYYY')START_DATE,to_char(END_DATE,'DD-MM-YYYY')END_DATE
			// FROM
			// TABLE(FIM0100_DTL_FUN('FIM0100','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");

			/* xbrl_report_master_tb */

			log.info("FIM SUMMARY " + sql.toString());

			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLFIM0100Bean xb = new XBRLFIM0100Bean();

				xb.setDyndomain(NullCheck.isNotNull(rs.getString("DYNAMIC_DOMAIN")));
				xb.setTrancrcny(NullCheck.isNotNull(rs.getString("TRAN_CRNCY")));
				xb.setRptdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
				xb.setInstitid(NullCheck.isNotNull(rs.getString("INSTITUTION_SL_NO")));
				xb.setTranid(NullCheck.isNotNull(rs.getString("TRANSACTION_SL_NO")));
				xb.setInstitname(NullCheck.isNotNull(rs.getString("INSTITUTION_NAME")));

				xb.setTrannature(NullCheck.isNotNull(rs.getString("TRAN_NATURE")));
				xb.setInstitcode(NullCheck.isNotNull(rs.getString("INSTITUTE_CODE")));
				// xb.setTrantype(NullCheck.isNotNull(rs.getString("TRAN_TYPE")));
				// xb.setTranamt(NullCheck.isNotNull(rs.getString("TRAN_AMT")));
				xb.setSmtrnamt(NullCheck.isNotNull(rs.getString("CM_TRAN_AMT")));
				xb.setSmintrt(NullCheck.isNotNull(rs.getString("CM_INT_RATE")));
				xb.setMsntrnamt(NullCheck.isNotNull(rs.getString("MSN_TRAN_AMT")));
				xb.setMsnstdt(NullCheck.isNotNull(rs.getString("MSN_START_DATE")));
				xb.setMsnenddt(NullCheck.isNotNull(rs.getString("MSN_END_DATE")));

				xb.setMsnintrt(NullCheck.isNotNull(rs.getString("MSN_INT_RATE")));
				xb.setTranamt(NullCheck.isNotNull(rs.getString("TM_TRAN_AMT")));
				xb.setTmstdt(NullCheck.isNotNull(rs.getString("TM_START_DATE")));
				xb.setTmenddt(NullCheck.isNotNull(rs.getString("TM_END_DATE")));
				xb.setTmintrt(NullCheck.isNotNull(rs.getString("TM_INT_RATE")));

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

	public ArrayList<XBRLFIM0100Bean> xbrlfimajaxdetails(String repname, String ReporefSeq, String instno, String dt2,
			String dt1, String curr) {

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		ArrayList<XBRLFIM0100Bean> arl = new ArrayList<XBRLFIM0100Bean>();
		NullCheck chk = new NullCheck();
		String status = "";

		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();

		PreparedStatement ps = null;

		StringBuffer sql = new StringBuffer();

		DateFormat df = new DateFormat();
		dt1 = df.formatdate(dt1);
		dt2 = df.formatdate(dt2);

		DecimalFormat dfs = new DecimalFormat("##,##.00");

		try {

			// sql.append("SELECT /* +FIRST_ROWS(100) */
			// MODES,CHQ_NUMBER,ACCT_NUMBER,ACCT_NAME,to_char(TRAN_DATE,'DD-MM-YYYY')TRAN_DATE,to_char(CHQ_AMOUNT,
			// '9,999,999,999,990.99')CHQ_AMOUNT,CRNCY,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME
			// FROM
			// TABLE(PYM0100_DTL_FUN('PYM0100','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");
			// select * from
			// table(FIM0100_DTL_FUN('FIM0100','0','0','31-MAR-2014','31-MAR-2014','31-MAR-2014','MUR'));
			// sql.append("SELECT /* +FIRST_ROWS(100) */ Dynamic Domain,Institution Serial
			// Number,Transaction Serial Number,Name of Institution,Institution
			// Code,Currency,Transaction Type,to_char(Call money,'DD-MM-YYYY')Call
			// money,to_char(Money at Short Notice,'DD-MM-YYYY')Money at Short
			// Notice,to_char(Team Money,'DD-MM-YYYY')Team
			// Money,CRNCY,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME
			// FROM
			// TABLE(FIM0100_DTL_FUN('FIM0100','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");

			sql.append(
					"SELECT /* +FIRST_ROWS(100) */ TRAN_CRNCY,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,"
					+ "INSTITUTE_NAME,TRAN_NATURE,INSTITUTE_CODE,TRAN_TYPE,to_char(TRAN_AMT, '9,999,999,999,990.99')TRAN_AMT,"
					+ "to_char(INT_START_DATE,'DD-MM-YYYY')INT_START_DATE,to_char(INT_END_DATE,'DD-MM-YYYY')INT_END_DATE,"
					+ "to_char(INT_RATE, '9,999,999,999,990.99')INT_RATE FROM TABLE(FIM0100_DTL_FUN('FIM0100','"
							+ chk.notZero(ReporefSeq) + "','" + chk.notZero(instno) + "','" + dt2 + "','" + dt1 + "','"
							+ dt2 + "','" + curr + "'))");

			// sql.append("select * from
			// table(FIM0100_DTL_FUN('FIM0100','0','0','31-MAR-2014','31-MAR-2014','31-MAR-2014','MUR'))");

			log.info("FIM0100 Vinoth Kumar  " + sql.toString());

			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				XBRLFIM0100Bean xb = new XBRLFIM0100Bean();

				xb.setRptdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
				xb.setInstitname(NullCheck.isNotNull(rs.getString("INSTITUTE_NAME")));
				xb.setInstitcode(NullCheck.isNotNull(rs.getString("INSTITUTE_CODE")));
				xb.setTrannature(NullCheck.isNotNull(rs.getString("TRAN_NATURE")));
				xb.setTrancrcny(NullCheck.isNotNull(rs.getString("TRAN_CRNCY")));
				xb.setTrantype(NullCheck.isNotNull(rs.getString("TRAN_TYPE")));
				xb.setTranamt(NullCheck.isNotNull(rs.getString("TRAN_AMT")));
				xb.setIntstadate(NullCheck.isNotNull(rs.getString("INT_START_DATE")));
				xb.setIntenddate(NullCheck.isNotNull(rs.getString("INT_END_DATE")));
				xb.setIntrate(NullCheck.isNotNull(rs.getString("INT_RATE")));

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

	public String detailFIM0100saves() {

		ConnectionManager connmgr = new ConnectionManager();
		Connection conn = connmgr.getConnection();
		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("{call FINAL_REPORT_UPDATE_SP('" + request.getParameter("reptype") + "','"
				+ NullCheck.isNotZero(request.getParameter("refno")) + "','"
				+ df.formatdate(request.getParameter("dt2")) + "','" + df.formatdate(request.getParameter("dt1"))
				+ "','" + df.formatdate(request.getParameter("dt2")) + "','" + request.getParameter("curr") + "')}");

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
	public String detailFIM0100savecheck() {

		ConnectionManager connmgr=new ConnectionManager();
		Connection conn=connmgr.getConnection();
		ArrayList<String> arl = new ArrayList<String>();
				HttpServletRequest request = ServletActionContext.getRequest();
				DateFormat df = new DateFormat();
				StringBuffer sql = new StringBuffer();
				PreparedStatement ps = null;
				
				sql.append("SELECT COUNT(REPORT_DATE) as repdate FROM FIM0100_S1_RPT_TB where REPORT_ID = '"+request.getParameter("reptype")+"' AND  REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ");
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

	public String FIM0100chckmodified() {

		HttpServletRequest request = ServletActionContext.getRequest();
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		HttpSession session = request.getSession();
		StringBuffer sql = new StringBuffer();
		DateFormat df = new DateFormat();
		sql.setLength(0);
		if (request.getParameter("type").equals("chkuser")) {
			sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM FIM0100_MOD_TABLE ");
		} else {
			// sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM FIM0100_MOD_TABLE WHERE
			// REPORT_DATE='"+NullCheck.isNotNull(df.formatdate(request.getParameter("repdate")))+"'");
			sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM FIM0100_MOD_TABLE ");

		}

		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				cnt = NullCheck.isNotZero(rs.getString("CNT"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "success";
	}

	public String modFIM0100cancel() {
		String status = "";
		HttpServletRequest request = ServletActionContext.getRequest();
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();
		DateFormat df = new DateFormat();
		sql.setLength(0);
		sql.append("DELETE FROM FIM0100_MOD_TABLE WHERE REPORT_DATE='"
				+ df.formatdate(NullCheck.isNotNull(request.getParameter("rptdate"))) + "' and INSTITUTE_CODE='"
				+ NullCheck.isNotNull(request.getParameter("institcode")) + "'");

		try {
			log.info(sql.toString());
			ps = conn.prepareStatement(sql.toString());

			int rs = 0;
			rs = ps.executeUpdate();

			status = "success";
		} catch (SQLException e) {
			e.printStackTrace();
			status = "error";
		}

		if (status.equals("success")) {
			resalert = "Cancellation Successful";
		} else {
			resalert = "Technical Issue.Try Again Later.";
		}

		return "success";
	}

	public ArrayList<XBRLFIM0100Bean> FIM0100verify() {

		ArrayList<XBRLFIM0100Bean> arl = new ArrayList<XBRLFIM0100Bean>();

		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();
		DateFormat df = new DateFormat();
		sql.setLength(0);
		sql.append(
				"SELECT /* +FIRST_ROWS(100) */to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,INSTITUTE_NAME,"
				+ "INSTITUTE_CODE,TRAN_NATURE,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,to_char(INT_START_DATE,'DD-MM-YYYY')INT_START_DATE,to_char(INT_END_DATE,'DD-MM-YYYY')INT_END_DATE,"
				+ "INT_RATE,DECODE(DEL_FLG,'A','Added','M','Modified','D','Deleted') as DEL_FLG ,LCHG_USER_ID FROM FIM0100_MOD_TABLE");
		log.info("Gayu" + sql.toString());
		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				XBRLFIM0100Bean xb = new XBRLFIM0100Bean();

				xb.setRptdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
				xb.setInstitname(NullCheck.isNotNull(rs.getString("INSTITUTE_NAME")));
				xb.setInstitcode(NullCheck.isNotNull(rs.getString("INSTITUTE_CODE")));
				xb.setTrannature(NullCheck.isNotNull(rs.getString("TRAN_NATURE")));
				xb.setTrancrcny(NullCheck.isNotNull(rs.getString("TRAN_CRNCY")));
				xb.setTrantype(NullCheck.isNotNull(rs.getString("TRAN_TYPE")));
				xb.setTranamt(NullCheck.isNotNull(rs.getString("TRAN_AMT")));
				xb.setIntstadate(NullCheck.isNotNull(rs.getString("INT_START_DATE")));
				xb.setIntenddate(NullCheck.isNotNull(rs.getString("INT_END_DATE")));
				xb.setIntrate(NullCheck.isNotNull(rs.getString("INT_RATE")));

				xb.setModtyp(NullCheck.isNotNull(rs.getString("DEL_FLG")));
				xb.setEntryuser(NullCheck.isNotNull(rs.getString("LCHG_USER_ID")));

				arl.add(xb);
			}
		} catch (SQLException e) {
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

	public String FIM0100verifymaster() {
		String status = "";
		HttpServletRequest request = ServletActionContext.getRequest();
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		HttpSession session = request.getSession();
		StringBuffer sql = new StringBuffer();
		DateFormat df = new DateFormat();

		// ------------------get data from mod table---------------------
		XBRLFIM0100Bean xb = new XBRLFIM0100Bean();

		sql.setLength(0);
		sql.append(
				"SELECT /* +FIRST_ROWS(100) */to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,INSTITUTE_NAME,INSTITUTE_CODE,TRAN_NATURE,"
				+ "TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,to_char(INT_START_DATE,'DD-MM-YYYY')INT_START_DATE,to_char(INT_END_DATE,'DD-MM-YYYY')INT_END_DATE,INT_RATE,DEL_FLG,LCHG_USER_ID FROM FIM0100_MOD_TABLE "
						+ "WHERE INSTITUTE_CODE='" + NullCheck.isNotNull(request.getParameter("institcode"))
						+ "' AND REPORT_DATE='" + df.formatdate(NullCheck.isNotNull(request.getParameter("rptdate")))
						+ "' ");
		log.info("Gayu" + sql.toString());
		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				xb.setRptdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
				xb.setInstitname(NullCheck.isNotNull(rs.getString("INSTITUTE_NAME")));
				xb.setInstitcode(NullCheck.isNotNull(rs.getString("INSTITUTE_CODE")));
				xb.setTrannature(NullCheck.isNotNull(rs.getString("TRAN_NATURE")));
				xb.setTrancrcny(NullCheck.isNotNull(rs.getString("TRAN_CRNCY")));
				xb.setTrantype(NullCheck.isNotNull(rs.getString("TRAN_TYPE")));
				xb.setTranamt(NullCheck.isNotNull(rs.getString("TRAN_AMT")));
				xb.setIntstadate(NullCheck.isNotNull(rs.getString("INT_START_DATE")));
				xb.setIntenddate(NullCheck.isNotNull(rs.getString("INT_END_DATE")));
				xb.setIntrate(NullCheck.isNotNull(rs.getString("INT_RATE")));

				xb.setModtyp(NullCheck.isNotNull(rs.getString("DEL_FLG")));
				xb.setEntryuser(NullCheck.isNotNull(rs.getString("LCHG_USER_ID")));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		finally {

			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {

				}
			}
			/*
			 * if (conn != null) { try { conn.close(); } catch (SQLException e) {
			 * 
			 * } }
			 */
		}

		// ---------------get data from mod table------------------------

		if (xb.getModtyp().equals("A")) {

			// For Added Records

			sql.setLength(0);
			sql.append(
					" INSERT INTO FIM0100_MAST_TABLE(REPORT_DATE,INSTITUTE_NAME,INSTITUTE_CODE,TRAN_NATURE,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,"
					+ "INT_START_DATE,INT_END_DATE,INT_RATE,DEL_FLG,LCHG_USER_ID,LCHG_TIME,VERIFY_USER_ID,VERIFY_TIME)"
							+ "VALUES ('" + df.formatdate(request.getParameter("rptdate")) + "','"
							+ request.getParameter("institname") + "','" + request.getParameter("institcode") + "','"
							+ request.getParameter("trannature") + "','" + request.getParameter("trancrcny") + "','"
							+ request.getParameter("trantype") + "','" + request.getParameter("tranamt") + "','"

							+ df.formatdate(request.getParameter("intstadate")) + "','"
							+ df.formatdate(request.getParameter("intenddate")) + "','"
							+ request.getParameter("intrate") + "','" + xb.getModtyp() + "','"
							+ session.getAttribute("userName") + "',SYSDATE,'" + session.getAttribute("userName")
							+ "',SYSDATE)");

			try {
				log.info(sql.toString());
				ps = conn.prepareStatement(sql.toString());

				int rs = 0;
				rs = ps.executeUpdate();

				status = "success";

				sql.setLength(0);
				sql.append("DELETE FROM FIM0100_MOD_TABLE WHERE REPORT_DATE='"
						+ df.formatdate(NullCheck.isNotNull(request.getParameter("rptdate"))) + "' and INSTITUTE_CODE='"
						+ NullCheck.isNotNull(request.getParameter("institcode")) + "'");
				try {
					log.info(sql.toString());
					ps = conn.prepareStatement(sql.toString());

					int rs1 = 0;
					rs1 = ps.executeUpdate();

					status = "success";
				} catch (SQLException e) {
					e.printStackTrace();
					status = "error";
				}

			} catch (SQLException e) {
				e.printStackTrace();
				status = "error";
			}

		} else if (xb.getModtyp().equals("M")) {

			// For Modified Records

			sql.setLength(0);
			sql.append("UPDATE FIM0100_MAST_TABLE SET INSTITUTE_CODE='" + request.getParameter("institcode")
					+ "', TRAN_NATURE ='" + request.getParameter("trannature") + "', TRAN_CRNCY='"
					+ request.getParameter("trancrcny") + "', TRAN_TYPE ='" + request.getParameter("trantype")
					+ "', INT_START_DATE ='" + df.formatdate(request.getParameter("intstadate")) + "', INT_END_DATE ='"
					+ df.formatdate(request.getParameter("intenddate")) + "', TRAN_AMT  ='"
					+ request.getParameter("tranamt") + "', INT_RATE='" + request.getParameter("intrate")
					+ "', VERIFY_USER_ID='" + session.getAttribute("userName") + "',VERIFY_TIME=SYSDATE "
					+ "WHERE  REPORT_DATE='" + df.formatdate(request.getParameter("rptdate")) + "' "
					+ "AND INSTITUTE_CODE='" + request.getParameter("institcode") + "'");
			try {
				log.info(sql.toString());
				ps = conn.prepareStatement(sql.toString());

				int rs = 0;
				rs = ps.executeUpdate();

				status = "success";

				sql.setLength(0);
				sql.append("DELETE FROM FIM0100_MOD_TABLE WHERE REPORT_DATE='"
						+ df.formatdate(NullCheck.isNotNull(request.getParameter("rptdate"))) + "' and INSTITUTE_CODE='"
						+ NullCheck.isNotNull(request.getParameter("institcode")) + "'");
				try {
					log.info(sql.toString());
					ps = conn.prepareStatement(sql.toString());

					int rs1 = 0;
					rs1 = ps.executeUpdate();

					status = "success";
				} catch (SQLException e) {
					e.printStackTrace();
					status = "error";
				}

			} catch (SQLException e) {
				e.printStackTrace();
				status = "error";
			}

		} else if (xb.getModtyp().equals("D")) {

			// For Deleted Records

			sql.setLength(0);
			sql.append("DELETE FROM FIM0100_MAST_TABLE WHERE REPORT_DATE='"
					+ df.formatdate(NullCheck.isNotNull(request.getParameter("rptdate"))) + "' and INSTITUTE_CODE='"
					+ NullCheck.isNotNull(request.getParameter("institcode")) + "'");

			try {
				log.info(sql.toString());
				ps = conn.prepareStatement(sql.toString());

				int rs = 0;
				rs = ps.executeUpdate();

				status = "success";

				sql.setLength(0);
				sql.append("UPDATE FIM0100_MOD_TABLE SET LCHG_USER_ID='" + session.getAttribute("userName")
						+ "' WHERE REPORT_DATE='" + df.formatdate(NullCheck.isNotNull(request.getParameter("rptdate")))
						+ "' and INSTITUTE_CODE='" + NullCheck.isNotNull(request.getParameter("institcode")) + "'");
				try {
					log.info(sql.toString());
					ps = conn.prepareStatement(sql.toString());

					int rs1 = 0;
					rs1 = ps.executeUpdate();

					status = "success";
				} catch (SQLException e) {
					e.printStackTrace();
					status = "error";
				}

				sql.setLength(0);
				sql.append("DELETE FROM FIM0100_MOD_TABLE WHERE REPORT_DATE='"
						+ df.formatdate(NullCheck.isNotNull(request.getParameter("rptdate"))) + "' and INSTITUTE_CODE='"
						+ NullCheck.isNotNull(request.getParameter("institcode")) + "'");
				try {
					log.info(sql.toString());
					ps = conn.prepareStatement(sql.toString());

					int rs1 = 0;
					rs1 = ps.executeUpdate();

					status = "success";
				} catch (SQLException e) {
					e.printStackTrace();
					status = "error";
				}

			} catch (SQLException e) {
				e.printStackTrace();
				status = "error";
			}
		}

		return status;
	}

}
