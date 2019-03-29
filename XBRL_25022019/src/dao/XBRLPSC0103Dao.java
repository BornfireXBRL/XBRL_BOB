package dao;
/****************************************************************************************************************
*																												*
* 	* @companyName 			:	Bonfire Innovation Private Limited Chennai										*
* 	* @project 				:	Extensible Business Reporting Language (XBRL)									*
* 	* @name 				:	XBRLPSC0103Dao.java															*
* 	* @path 				:	action																			*
* 	* @author 				:	S Gayathiri																	*
* 	* @version 				: 	1.0																				*
* 	* @functionality 		:	It contains the action with multiple methods to create SUP01400 Report.													*
* 	* @relatedScripts 		: 	bean.XBRLPSC0103Bean.java,dao.XBRLPSC0103Dao.java 								*
* 	* @creationDate 		:																					*
* 	* @lastModifiedDate 	:	19-02-2018																				*
* 	* @modificationHistory 	: 	Verification Changes																				*
*																												*
****************************************************************************************************************/
import java.sql.CallableStatement;
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
import bean.XBRLPSC0103Bean;

import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;

public class XBRLPSC0103Dao {

	static Logger log = Logger.getLogger(XBRLPSC0103Dao.class);

	public String resalert;

	public String cnt;

	public int cnt1;

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

	public ArrayList<XBRLPSC0103Dao> ReporefSeq(String dt1, String dt2) {

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

		ArrayList<XBRLPSC0103Dao> arl = new ArrayList<XBRLPSC0103Dao>();
		sql.append(
				"select REPORT_REF_NO from PSC0103_MOD_TABLE where REPORT_DATE='" + dt2 + "' ORDER BY REPORT_REF_NO");

		log.info("SELECTPROFILE" + sql.toString());

		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLPSC0103Dao xel = new XBRLPSC0103Dao();
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

	public ArrayList<XBRLPSC0103Bean> xbrlPSC0103(String reptype, String instno, String ReporefSeq, String dt2,
			String dt1, String curr) {

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		ArrayList<XBRLPSC0103Bean> arl = new ArrayList<XBRLPSC0103Bean>();

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

			sql.append(
					"SELECT  INSTANCE_NAME,INSTANCE_CODE,to_char(PRIM_SECU_AMT, '9,999,999,999,990.99')PRIM_SECU_AMT,to_char(PRIM_SECU_RATE, '9,999,999,999,990.99')PRIM_SECU_RATE,to_char(OTH_RESIDENT_AMT, '9,999,999,999,990.99')OTH_RESIDENT_AMT,to_char(OTH_RESIDENT_RATE, '9,999,999,999,990.99')OTH_RESIDENT_RATE,to_char(OTH_ASSET_AMT, '9,999,999,999,990.99')OTH_ASSET_AMT,to_char(OTH_ASSET_RATE, '9,999,999,999,990.99')OTH_ASSET_RATE,to_char(UNSECURED_AMT, '9,999,999,999,990.99')UNSECURED_AMT,to_char(UNSECURED_RATE, '9,999,999,999,990.99')UNSECURED_RATE,to_char(TOT_AMT, '9,999,999,999,990.99')TOT_AMT,to_char(TOT_RATE, '9,999,999,999,990.99')TOT_RATE FROM TABLE(PSC0103_S1_RPT_FUN('"
							+ reptype + "','" + ReporefSeq + "','" + dt2 + "','" + dt2 + "','" + dt2 + "','MUR'))");

			log.info("PSC0103 " + sql.toString());

			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				XBRLPSC0103Bean xb = new XBRLPSC0103Bean();

				xb.setIntname(NullCheck.isNotNull(rs.getString("INSTANCE_NAME")));
				xb.setIntcode(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
				xb.setSecprimamt(NullCheck.isNotNull(rs.getString("PRIM_SECU_AMT")));
				xb.setSecprimrate(NullCheck.isNotNull(rs.getString("PRIM_SECU_RATE")));
				xb.setSecresamt(NullCheck.isNotNull(rs.getString("OTH_RESIDENT_AMT")));
				xb.setSecresrate(NullCheck.isNotNull(rs.getString("OTH_RESIDENT_RATE")));
				xb.setSecastamt(NullCheck.isNotNull(rs.getString("OTH_ASSET_AMT")));
				xb.setSecastrate(NullCheck.isNotNull(rs.getString("OTH_ASSET_RATE")));
				xb.setUnsecdamt(NullCheck.isNotNull(rs.getString("UNSECURED_AMT")));
				xb.setUnsecdrate(NullCheck.isNotNull(rs.getString("UNSECURED_RATE")));
				xb.setTotamt(NullCheck.isNotNull(rs.getString("TOT_AMT")));
				xb.setTotrate(NullCheck.isNotNull(rs.getString("TOT_RATE")));

				arl.add(xb);

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

	public ArrayList<XBRLPSC0103Bean> xbrlPSC0103s2(String reptype, String instno, String ReporefSeq, String dt2,
			String dt1, String curr) {

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		ArrayList<XBRLPSC0103Bean> arl = new ArrayList<XBRLPSC0103Bean>();

		String status = "";

		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();

		PreparedStatement ps = null;

		StringBuffer sql = new StringBuffer();

		DateFormat df = new DateFormat();
		dt1 = df.formatdate(dt1);
		dt2 = df.formatdate(dt2);

		try {

			sql.append(
					"SELECT  INSTANCE_NAME,INSTANCE_CODE,to_char(PRIM_SECU_AMT, '9,999,999,999,990.99')PRIM_SECU_AMT,to_char(PRIM_SECU_RATE, '9,999,999,999,990.99')PRIM_SECU_RATE,to_char(OTH_RESIDENT_AMT, '9,999,999,999,990.99')OTH_RESIDENT_AMT,to_char(OTH_RESIDENT_RATE, '9,999,999,999,990.99')OTH_RESIDENT_RATE,to_char(OTH_ASSET_AMT, '9,999,999,999,990.99')OTH_ASSET_AMT,to_char(OTH_ASSET_RATE, '9,999,999,999,990.99')OTH_ASSET_RATE,to_char(UNSECURED_AMT, '9,999,999,999,990.99')UNSECURED_AMT,to_char(UNSECURED_RATE, '9,999,999,999,990.99')UNSECURED_RATE,to_char(TOT_AMT, '9,999,999,999,990.99')TOT_AMT,to_char(TOT_RATE, '9,999,999,999,990.99')TOT_RATE FROM TABLE(PSC0103_S2_RPT_FUN('"
							+ reptype + "','" + ReporefSeq + "','" + dt2 + "','" + dt2 + "','" + dt2 + "','MUR'))");

			log.info("PSC0103 " + sql.toString());

			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				XBRLPSC0103Bean xb = new XBRLPSC0103Bean();
				xb.setIntname(NullCheck.isNotNull(rs.getString("INSTANCE_NAME")));
				xb.setIntcode(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
				xb.setSecprimamt(NullCheck.isNotNull(rs.getString("PRIM_SECU_AMT")));
				xb.setSecprimrate(NullCheck.isNotNull(rs.getString("PRIM_SECU_RATE")));
				xb.setSecresamt(NullCheck.isNotNull(rs.getString("OTH_RESIDENT_AMT")));
				xb.setSecresrate(NullCheck.isNotNull(rs.getString("OTH_RESIDENT_RATE")));
				xb.setSecastamt(NullCheck.isNotNull(rs.getString("OTH_ASSET_AMT")));
				xb.setSecastrate(NullCheck.isNotNull(rs.getString("OTH_ASSET_RATE")));
				xb.setUnsecdamt(NullCheck.isNotNull(rs.getString("UNSECURED_AMT")));
				xb.setUnsecdrate(NullCheck.isNotNull(rs.getString("UNSECURED_RATE")));
				xb.setTotamt(NullCheck.isNotNull(rs.getString("TOT_AMT")));
				xb.setTotrate(NullCheck.isNotNull(rs.getString("TOT_RATE")));

				arl.add(xb);

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

	public ArrayList<XBRLPSC0103Bean> xbrlPSC0103d1(String reptype, String instno, String ReporefSeq, String dt2,
			String dt1, String curr) {

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		ArrayList<XBRLPSC0103Bean> arl = new ArrayList<XBRLPSC0103Bean>();

		String status = "";

		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();

		PreparedStatement ps = null;

		StringBuffer sql = new StringBuffer();

		DateFormat df = new DateFormat();
		dt1 = df.formatdate(dt1);
		dt2 = df.formatdate(dt2);

		NullCheck chk = new NullCheck();

		try {
			/*
			 * 'BLS0106','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','
			 * "+dt2+"','"+dt2+"','"+curr+"'))"
			 */
			sql.append(
					"select /* +FIRST_ROWS(100) */ACCT_NUMBER,ACCT_NAME,SECURED_FLG,to_char(SANCTION_AMT, '9,999,999,999,990.99')SANCTION_AMT,to_char(OUTSTANDING_AMT, '9,999,999,999,990.99')OUTSTANDING_AMT,INT_TYPE,to_char(INTEREST_RATE, '9,999,999,999,990.99')INTEREST_RATE,PRIM_SECURITY_FLG,OTH_RESIDENT_FLG,OTH_ASSET_FLG,IS_ACCT_DELINQUENT,IS_ACCT_FORECLOSED,to_char(ACCT_FORECLOSED_DATE,'DD-MM-YYYY')ACCT_FORECLOSED_DATE,to_char(ACCT_OPN_DATE,'DD-MM-YYYY')ACCT_OPN_DATE,to_char(INTEREST_AMOUNT, '9,999,999,999,990.99')INTEREST_AMOUNT,to_char(MON_INT_AMOUNT, '9,999,999,999,990.99')MON_INT_AMOUNT,SCHM_CODE,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE  from table(PSC0103_DTL_FUN('PSC0103','"
							+ chk.notZero(ReporefSeq) + "','" + chk.notZero(instno) + "','" + dt2 + "','" + dt2 + "','"
							+ dt2 + "','" + curr + "'))");

			log.info("PSC0103d1  " + sql.toString());

			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				XBRLPSC0103Bean xb = new XBRLPSC0103Bean();

				xb.setAcctno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
				xb.setAcctname(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
				xb.setSecflag(NullCheck.isNotNull(rs.getString("SECURED_FLG")));
				xb.setSancamt(NullCheck.isNotNull(rs.getString("SANCTION_AMT")));
				xb.setOutamt(NullCheck.isNotNull(rs.getString("OUTSTANDING_AMT")));
				xb.setInttyp(NullCheck.isNotNull(rs.getString("INT_TYPE")));
				xb.setIntrate(NullCheck.isNotNull(rs.getString("INTEREST_RATE")));
				xb.setPrimsecflg(NullCheck.isNotNull(rs.getString("PRIM_SECURITY_FLG")));
				xb.setOtherresflg(NullCheck.isNotNull(rs.getString("OTH_RESIDENT_FLG")));
				xb.setOthrassflg(NullCheck.isNotNull(rs.getString("OTH_ASSET_FLG")));
				xb.setIsacdel(NullCheck.isNotNull(rs.getString("IS_ACCT_DELINQUENT")));
				xb.setIsacfor(NullCheck.isNotNull(rs.getString("IS_ACCT_FORECLOSED")));
				xb.setAcfordat(NullCheck.isNotNull(rs.getString("ACCT_FORECLOSED_DATE")));
				xb.setAcopndat(NullCheck.isNotNull(rs.getString("ACCT_OPN_DATE")));
				xb.setIntamt(NullCheck.isNotNull(rs.getString("INTEREST_AMOUNT")));
				xb.setMoninamt(NullCheck.isNotNull(rs.getString("MON_INT_AMOUNT")));
				xb.setScode(NullCheck.isNotNull(rs.getString("SCHM_CODE")));
				xb.setRepdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
				arl.add(xb);

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

	public ArrayList<XBRLPSC0103Bean> xbrlpsc4RR(String dt1, String dt2, String ReporefSeq, String instno,
			String curr) {

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		ArrayList<XBRLPSC0103Bean> arl = new ArrayList<XBRLPSC0103Bean>();
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
		// TABLE(PSC0103_DTL_FUN('PSC0103','0','0','31-AUG-2018','01-AUG-2018','31-AUG-2018','MUR'))");

		sql.append(
				"SELECT /* +FIRST_ROWS(110) */ ACCT_NUMBER,ACCT_NAME,SECURED_FLG,to_char(SANCTION_AMT, '9,999,999,999,990.99')SANCTION_AMT,to_char(OUTSTANDING_AMT, '9,999,999,999,990.99')OUTSTANDING_AMT,INT_TYPE,to_char(INTEREST_RATE, '9,999,999,999,990.99')INTEREST_RATE,PRIM_SECURITY_FLG,OTH_RESIDENT_FLG,OTH_ASSET_FLG,IS_ACCT_DELINQUENT,IS_ACCT_FORECLOSED,to_char(ACCT_FORECLOSED_DATE,'DD-MM-YYYY')ACCT_FORECLOSED_DATE,to_char(ACCT_OPN_DATE,'DD-MM-YYYY')ACCT_OPN_DATE,to_char(INTEREST_AMOUNT, '9,999,999,999,990.99')INTEREST_AMOUNT,to_char(MON_INT_AMOUNT, '9,999,999,999,990.99')MON_INT_AMOUNT,SCHM_CODE,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE FROM TABLE(PSC0103_DTL_FUN('PSC0103','"
						+ ReporefSeq + "','" + instno + "','" + dt2 + "','" + dt2 + "','" + dt2 + "','" + curr + "'))");
		log.info("DOC&&&&SELECT" + sql.toString());
		log.info("DOC&&&&SELECT Gayu" + sql.toString());

		try {

			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLPSC0103Bean xb = new XBRLPSC0103Bean();
				xb.setAcctno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
				xb.setAcctname(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
				xb.setSecflag(NullCheck.isNotNull(rs.getString("SECURED_FLG")));
				xb.setSancamt(NullCheck.isNotNull(rs.getString("SANCTION_AMT")));
				xb.setOutamt(NullCheck.isNotNull(rs.getString("OUTSTANDING_AMT")));
				xb.setInttyp(NullCheck.isNotNull(rs.getString("INT_TYPE")));
				xb.setIntrate(NullCheck.isNotNull(rs.getString("INTEREST_RATE")));
				xb.setPrimsecflg(NullCheck.isNotNull(rs.getString("PRIM_SECURITY_FLG")));
				xb.setOtherresflg(NullCheck.isNotNull(rs.getString("OTH_RESIDENT_FLG")));
				xb.setOthrassflg(NullCheck.isNotNull(rs.getString("OTH_ASSET_FLG")));
				xb.setIsacdel(NullCheck.isNotNull(rs.getString("IS_ACCT_DELINQUENT")));
				xb.setIsacfor(NullCheck.isNotNull(rs.getString("IS_ACCT_FORECLOSED")));
				xb.setAcfordat(NullCheck.isNotNull(rs.getString("ACCT_FORECLOSED_DATE")));
				xb.setAcopndat(NullCheck.isNotNull(rs.getString("ACCT_OPN_DATE")));
				xb.setIntamt(NullCheck.isNotNull(rs.getString("INTEREST_AMOUNT")));
				xb.setMoninamt(NullCheck.isNotNull(rs.getString("MON_INT_AMOUNT")));
				xb.setScode(NullCheck.isNotNull(rs.getString("SCHM_CODE")));
				xb.setRepdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));

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
	public String detailPSC0103saves() {

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
	public String detailPSC0103savecheck() {

		ConnectionManager connmgr=new ConnectionManager();
		Connection conn=connmgr.getConnection();
		ArrayList<String> arl = new ArrayList<String>();
				HttpServletRequest request = ServletActionContext.getRequest();
				DateFormat df = new DateFormat();
				StringBuffer sql = new StringBuffer();
				PreparedStatement ps = null;
				
				sql.append("SELECT COUNT(REPORT_DATE) as repdate FROM PSC0103_S1_RPT_TB where REPORT_ID = '"+request.getParameter("reptype")+"' AND  REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ");
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
	public String PSC0103chckmodified() {

		HttpServletRequest request = ServletActionContext.getRequest();
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		HttpSession session = request.getSession();
		StringBuffer sql = new StringBuffer();
		DateFormat df = new DateFormat();
		sql.setLength(0);
		if (request.getParameter("type").equals("chkuser")) {
			sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM PSC0103_MOD_TABLE ");
		} else {
			// sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM PSC0103_MOD_TABLE WHERE
			// REPORT_DATE='"+NullCheck.isNotNull(df.formatdate(request.getParameter("repdate")))+"'");
			sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM PSC0103_MOD_TABLE ");

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

	public String modPSC0103cancel() {
		String status = "";
		HttpServletRequest request = ServletActionContext.getRequest();
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();
		DateFormat df = new DateFormat();
		sql.setLength(0);
		sql.append("DELETE FROM PSC0103_MOD_TABLE WHERE REPORT_DATE='"
				+ df.formatdate(NullCheck.isNotNull(request.getParameter("repdate"))) + "' and ACCT_NUMBER='"
				+ NullCheck.isNotNull(request.getParameter("acctno")) + "'");

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

	public ArrayList<XBRLPSC0103Bean> PSC0103verify() {

		ArrayList<XBRLPSC0103Bean> arl = new ArrayList<XBRLPSC0103Bean>();

		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();
		DateFormat df = new DateFormat();
		sql.setLength(0);
		sql.append(
				"SELECT /* +FIRST_ROWS(100) */to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,ACCT_NUMBER,ACCT_NAME,SECURED_FLG,SANCTION_AMT,OUTSTANDING_AMT,INT_TYPE,INTEREST_RATE,PRIM_SECURITY_FLG,OTH_RESIDENT_FLG,OTH_ASSET_FLG,IS_ACCT_DELINQUENT,IS_ACCT_FORECLOSED,to_char(ACCT_FORECLOSED_DATE,'DD-MM-YYYY')ACCT_FORECLOSED_DATE,to_char(ACCT_OPN_DATE,'DD-MM-YYYY')ACCT_OPN_DATE,INTEREST_AMOUNT,MON_INT_AMOUNT,SCHM_CODE,DECODE(DEL_FLG,'A','Added','M','Modified','D','Deleted') as DEL_FLG ,LCHG_USER_ID FROM PSC0103_MOD_TABLE");
		log.info("Gayu" + sql.toString());
		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				XBRLPSC0103Bean xb = new XBRLPSC0103Bean();

				xb.setAcctno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
				xb.setAcctname(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
				xb.setSecflag(NullCheck.isNotNull(rs.getString("SECURED_FLG")));
				xb.setSancamt(NullCheck.isNotNull(rs.getString("SANCTION_AMT")));
				xb.setOutamt(NullCheck.isNotNull(rs.getString("OUTSTANDING_AMT")));
				xb.setInttyp(NullCheck.isNotNull(rs.getString("INT_TYPE")));
				xb.setIntrate(NullCheck.isNotNull(rs.getString("INTEREST_RATE")));
				xb.setPrimsecflg(NullCheck.isNotNull(rs.getString("PRIM_SECURITY_FLG")));
				xb.setOtherresflg(NullCheck.isNotNull(rs.getString("OTH_RESIDENT_FLG")));
				xb.setOthrassflg(NullCheck.isNotNull(rs.getString("OTH_ASSET_FLG")));
				xb.setIsacdel(NullCheck.isNotNull(rs.getString("IS_ACCT_DELINQUENT")));
				xb.setIsacfor(NullCheck.isNotNull(rs.getString("IS_ACCT_FORECLOSED")));
				xb.setAcfordat(NullCheck.isNotNull(rs.getString("ACCT_FORECLOSED_DATE")));
				xb.setAcopndat(NullCheck.isNotNull(rs.getString("ACCT_OPN_DATE")));
				xb.setIntamt(NullCheck.isNotNull(rs.getString("INTEREST_AMOUNT")));
				xb.setMoninamt(NullCheck.isNotNull(rs.getString("MON_INT_AMOUNT")));
				xb.setScode(NullCheck.isNotNull(rs.getString("SCHM_CODE")));
				xb.setRepdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));

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

	public String PSC0103verifymaster() {
		String status = "";
		HttpServletRequest request = ServletActionContext.getRequest();
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		HttpSession session = request.getSession();
		StringBuffer sql = new StringBuffer();
		DateFormat df = new DateFormat();

		// ------------------get data from mod table---------------------
		XBRLPSC0103Bean xb = new XBRLPSC0103Bean();

		sql.setLength(0);
		sql.append(
				"SELECT /* +FIRST_ROWS(100) */to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,ACCT_NUMBER,ACCT_NAME,SECURED_FLG,SANCTION_AMT,OUTSTANDING_AMT,INT_TYPE,INTEREST_RATE,PRIM_SECURITY_FLG,OTH_RESIDENT_FLG,OTH_ASSET_FLG,IS_ACCT_DELINQUENT,IS_ACCT_FORECLOSED,to_char(ACCT_FORECLOSED_DATE,'DD-MM-YYYY')ACCT_FORECLOSED_DATE,to_char(ACCT_OPN_DATE,'DD-MM-YYYY')ACCT_OPN_DATE,INTEREST_AMOUNT,MON_INT_AMOUNT,SCHM_CODE,DEL_FLG,LCHG_USER_ID FROM PSC0103_MOD_TABLE "
						+ "WHERE ACCT_NUMBER='" + NullCheck.isNotNull(request.getParameter("acctno"))
						+ "' AND REPORT_DATE='" + df.formatdate(NullCheck.isNotNull(request.getParameter("repdate")))
						+ "' ");
		log.info("Gayu" + sql.toString());
		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				xb.setAcctno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
				xb.setAcctname(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
				xb.setSecflag(NullCheck.isNotNull(rs.getString("SECURED_FLG")));
				xb.setSancamt(NullCheck.isNotNull(rs.getString("SANCTION_AMT")));
				xb.setOutamt(NullCheck.isNotNull(rs.getString("OUTSTANDING_AMT")));
				xb.setInttyp(NullCheck.isNotNull(rs.getString("INT_TYPE")));
				xb.setIntrate(NullCheck.isNotNull(rs.getString("INTEREST_RATE")));
				xb.setPrimsecflg(NullCheck.isNotNull(rs.getString("PRIM_SECURITY_FLG")));
				xb.setOtherresflg(NullCheck.isNotNull(rs.getString("OTH_RESIDENT_FLG")));
				xb.setOthrassflg(NullCheck.isNotNull(rs.getString("OTH_ASSET_FLG")));
				xb.setIsacdel(NullCheck.isNotNull(rs.getString("IS_ACCT_DELINQUENT")));
				xb.setIsacfor(NullCheck.isNotNull(rs.getString("IS_ACCT_FORECLOSED")));
				xb.setAcfordat(NullCheck.isNotNull(rs.getString("ACCT_FORECLOSED_DATE")));
				xb.setAcopndat(NullCheck.isNotNull(rs.getString("ACCT_OPN_DATE")));
				xb.setIntamt(NullCheck.isNotNull(rs.getString("INTEREST_AMOUNT")));
				xb.setMoninamt(NullCheck.isNotNull(rs.getString("MON_INT_AMOUNT")));
				xb.setScode(NullCheck.isNotNull(rs.getString("SCHM_CODE")));
				xb.setRepdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));

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
					"INSERT INTO PSC0103_MAST_TABLE(REPORT_DATE,ACCT_NUMBER,ACCT_NAME,SECURED_FLG,SANCTION_AMT,OUTSTANDING_AMT,"
							+ "INT_TYPE,INTEREST_RATE,PRIM_SECURITY_FLG,OTH_RESIDENT_FLG,OTH_ASSET_FLG,IS_ACCT_DELINQUENT,IS_ACCT_FORECLOSED,ACCT_FORECLOSED_DATE,"
							+ "ACCT_OPN_DATE,INTEREST_AMOUNT,MON_INT_AMOUNT,SCHM_CODE,DEL_FLG,LCHG_USER_ID,LCHG_TIME,VERIFY_USER_ID,VERIFY_TIME)"
							+ "values('" + df.formatdate(request.getParameter("repdate")) + "','"
							+ request.getParameter("acctno") + "','" + request.getParameter("acctname") + "','"
							+ request.getParameter("secflag") + "','" + request.getParameter("sancamt") + "','"
							+ request.getParameter("outamt") + "','" + request.getParameter("inttyp") + "','"
							+ request.getParameter("intrate") + "','" + request.getParameter("primsecflg") + "','"
							+ request.getParameter("otherresflg") + "','" + request.getParameter("othrassflg") + "','"
							+ request.getParameter("isacdel") + "','" + request.getParameter("isacfor") + "','"
							+ df.formatdate(request.getParameter("acfordat")) + "','"
							+ df.formatdate(request.getParameter("acopndat")) + "','" + request.getParameter("intamt")
							+ "','" + request.getParameter("moninamt") + "','" + request.getParameter("scode") + "','"
							+ request.getParameter("modtyp") + "','" + session.getAttribute("userName") + "',SYSDATE,'"
							+ session.getAttribute("userName") + "',SYSDATE)");

			try {
				log.info(sql.toString());
				ps = conn.prepareStatement(sql.toString());

				int rs = 0;
				rs = ps.executeUpdate();

				status = "success";

				sql.setLength(0);
				sql.append("DELETE FROM PSC0103_MOD_TABLE WHERE REPORT_DATE='"
						+ df.formatdate(NullCheck.isNotNull(request.getParameter("repdate"))) + "' and ACCT_NUMBER='"
						+ NullCheck.isNotNull(request.getParameter("acctno")) + "'");
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
		

			sql.append("update PSC0103_MOD_TABLE set ACCT_NAME ='" + request.getParameter("acctname")
					+ "',SECURED_FLG ='" + request.getParameter("secflag") + "',SANCTION_AMT ='"
					+ request.getParameter("sancamt") + "',OUTSTANDING_AMT ='" + request.getParameter("outamt")
					+ "',INT_TYPE ='" + request.getParameter("inttyp") + "',INTEREST_RATE ='"
					+ request.getParameter("intrate") + "',PRIM_SECURITY_FLG ='" + request.getParameter("primsecflg")
					+ "',OTH_RESIDENT_FLG ='" + request.getParameter("otherresflg") + "',OTH_ASSET_FLG ='"
					+ request.getParameter("othrassflg") + "',IS_ACCT_DELINQUENT ='" + request.getParameter("isacdel")
					+ "',IS_ACCT_FORECLOSED ='" + request.getParameter("isacfor") + "',ACCT_FORECLOSED_DATE ='"
					+ df.formatdate(request.getParameter("acfordat")) + "',ACCT_OPN_DATE ='"
					+ df.formatdate(request.getParameter("acopndat")) + "',INTEREST_AMOUNT ='"
					+ request.getParameter("intamt") + "',MON_INT_AMOUNT ='" + request.getParameter("moninamt")
					+ "',SCHM_CODE ='" + request.getParameter("scode") + "',VERIFY_USER_ID='"
					+ session.getAttribute("userName") + "',VERIFY_TIME=SYSDATE " + " WHERE REPORT_DATE='"
					+ df.formatdate(request.getParameter("repdate")) + "' " + "AND ACCT_NUMBER='"
					+ request.getParameter("acctno") + "'");

			try {
				log.info(sql.toString());
				ps = conn.prepareStatement(sql.toString());

				int rs = 0;
				rs = ps.executeUpdate();

				status = "success";

				sql.setLength(0);
				sql.append("DELETE FROM PSC0103_MOD_TABLE WHERE REPORT_DATE='"
						+ df.formatdate(NullCheck.isNotNull(request.getParameter("repdate"))) + "' and ACCT_NUMBER='"
						+ NullCheck.isNotNull(request.getParameter("acctno")) + "'");
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
			sql.append("DELETE FROM PSC0103_MAST_TABLE WHERE REPORT_DATE='"
					+ df.formatdate(NullCheck.isNotNull(request.getParameter("repdate"))) + "' and ACCT_NUMBER='"
					+ NullCheck.isNotNull(request.getParameter("acctno")) + "'");

			try {
				log.info(sql.toString());
				ps = conn.prepareStatement(sql.toString());

				int rs = 0;
				rs = ps.executeUpdate();

				status = "success";

				sql.setLength(0);
				sql.append("UPDATE PSC0103_MOD_TABLE SET LCHG_USER_ID='" + session.getAttribute("userName")
						+ "' WHERE REPORT_DATE='" + df.formatdate(NullCheck.isNotNull(request.getParameter("repdate")))
						+ "' and ACCT_NUMBER='" + NullCheck.isNotNull(request.getParameter("acctno")) + "'");
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
				sql.append("DELETE FROM PSC0103_MOD_TABLE WHERE REPORT_DATE='"
						+ df.formatdate(NullCheck.isNotNull(request.getParameter("repdate"))) + "' and ACCT_NUMBER='"
						+ NullCheck.isNotNull(request.getParameter("acctno")) + "'");
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
