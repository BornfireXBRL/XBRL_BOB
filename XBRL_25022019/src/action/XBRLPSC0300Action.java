package action;

import org.apache.log4j.Logger;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;

import basecode.DateFormat;
import bean.XBRLPSC0300Bean;

import dao.XBRLPSC0300Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;

/****************************************************************************************************************
*																												*
* 	* @companyName 			:	Bonfire Innovation Private Limited Chennai										*
* 	* @project 				:	Extensible Business Reporting Language (XBRL)									*
* 	* @name 				:	XBRLPSC0300Action.java															*
* 	* @path 				:	action																			*
* 	* @author 				:	Gayathiri S																	*
* 	* @version 				: 	1.0																				*
* 	* @functionality 		:	It contains the action with multiple methods to create SUP01400 Report.													*
* 	* @relatedScripts 		: 	bean.XBRLPSC0300Bean.java,dao.XBRLPSC0300Dao.java 								*
* 	* @creationDate 		:																					*
* 	* @lastModifiedDate 	:	20-02-2019																				*
* 	* @modificationHistory 	: 	Verification Changes																				*
*																												*
****************************************************************************************************************/

public class XBRLPSC0300Action {

	static Logger log = Logger.getLogger(XBRLPSC0300Action.class);
	public String refno;
	public String resalert;
	public String detPSC0300;

	public String getResalert() {
		return resalert;
	}

	public void setResalert(String resalert) {
		this.resalert = resalert;
	}

	public String getDetPSC0300() {
		return detPSC0300;
	}

	public void setDetPSC0300(String detPSC0300) {
		this.detPSC0300 = detPSC0300;
	}

	public String summarypsc0300;
	public String sumpsc0300;

	public String getSumpsc0300() {
		return sumpsc0300;
	}

	public void setSumpsc0300(String sumpsc0300) {
		this.sumpsc0300 = sumpsc0300;
	}

	public String detpsc0300;

	public String getDetpsc0300() {
		return detpsc0300;
	}

	public void setDetpsc0300(String detpsc0300) {
		this.detpsc0300 = detpsc0300;
	}

	public String getSummarypsc0300() {
		return summarypsc0300;
	}

	public void setSummarypsc0300(String summarypsc0300) {
		this.summarypsc0300 = summarypsc0300;
	}

	public String getRefno() {
		return refno;
	}

	public void setRefno(String refno) {
		this.refno = refno;
	}

	public String modXbPSCCreate300() throws SQLException {

		log.info("XBRL XBRL XBRL");

		String status = "";
		String status1 = "";

		String ReporefSeq = "0";
		HttpServletRequest request = ServletActionContext.getRequest();
		// log.info("rptdayAG_row--->"+request.getParameter("rptdayAG"));
		DateFormat df = new DateFormat();

		NullCheck nc = new NullCheck();

		HttpSession session = request.getSession();

		log.info("chqalpha--->" + request.getParameter("chqalpha"));

		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();

		PreparedStatement ps = null;
		PreparedStatement ps2 = null;

		StringBuffer sql2 = new StringBuffer();
		PreparedStatement ps3 = null;
		PreparedStatement ps4 = null;

		StringBuffer sql3 = new StringBuffer();
		StringBuffer sql4 = new StringBuffer();
		Character newFlg;

		DateFormat df1 = new DateFormat();

		/*
		 * if (request.getParameter("reportrefno").startsWith("R")) {
		 * 
		 * log.
		 * info("else notttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt ");
		 * ReporefSeq = request.getParameter("reportrefno"); newFlg = 'N';
		 * 
		 * } else {
		 * 
		 * log.info(
		 * "nullllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll")
		 * ;
		 * 
		 * utilities.SequenceNumber seqNo = new utilities.SequenceNumber(); String
		 * reporefseqno = seqNo.reporefno();
		 * 
		 * // log.info(" seqno := " + seqno);
		 * 
		 * ReporefSeq = "RR01000" + reporefseqno; newFlg = 'Y';
		 * 
		 * } log.info("===ReporefSeq===" + ReporefSeq); // log.info("<< EIDSeq >> " +
		 * EIDSeq);
		 */ session.setAttribute("ReprefSeq", ReporefSeq);

		int rs = 0;

		int count = 0;

		StringBuffer sql = new StringBuffer();

		// HttpSession session = request.getSession();
		log.info("insert Action modXbCreatePSC0300");

		// for Inserting new record

		// for new Reference id
		/*
		 * if (newFlg.equals('Y'))
		 * 
		 * {
		 * 
		 * sql.append(
		 * "INSERT INTO PSC0300_MOD_TABLE(REPORT_REF_NO,ACCT_NUMBER,CUST_ID,CUST_NAME,SCHM_TYPE,SCHM_CODE,UNIQUE_IDENTIFIER,NRE_FLG,ISIC_CODE,COUNTRY_CODE,SANCT_AMT,OUTSTANDING_AMT,ACCT_CRNCY_CODE,RESTRUCTURED_FLG,RESTRUCTURED_DATE,NFB_LIMIT,NFB_OUTSTANDING,NPA_FLG,SECURED_FLG,SECURED_AMT,ARREAR_DAYS,ARREAR_AMT,LOAN_RATIO,SPECIFIC_PROVISION,NPA_REASON,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
		 * + "values('" + ReporefSeq + "','" + request.getParameter("accno") + "','" +
		 * request.getParameter("custid") + "','" + request.getParameter("custname") +
		 * "','" + request.getParameter("systp") + "','" +
		 * request.getParameter("syscode") + "','" + request.getParameter("uqid") +
		 * "','" + request.getParameter("nrefg") + "','" +
		 * request.getParameter("iscode") + "','" + request.getParameter("cntrycode") +
		 * "','" + request.getParameter("snamt") + "','" +
		 * request.getParameter("outstdamt") + "','" +
		 * request.getParameter("acccurcode") + "','" + request.getParameter("resfg") +
		 * "','" + df1.formatdate(request.getParameter("resdate")) + "','" +
		 * request.getParameter("nfblimit") + "','" + request.getParameter("nfboutstd")
		 * + "','" + request.getParameter("npaflg") + "','" +
		 * request.getParameter("secflg") + "','" + request.getParameter("secamt") +
		 * "','" + request.getParameter("arrday") + "','" +
		 * request.getParameter("arramt") + "','" + request.getParameter("loanratio") +
		 * "','" + request.getParameter("spcprvsn") + "','" +
		 * request.getParameter("npareason") + "','"
		 * +df1.formatdate(request.getParameter("repdt"))+ "','" +
		 * session.getAttribute("userName") + "',SYSDATE)"); log.info(sql);
		 * 
		 * try { ps = conn.prepareStatement(sql.toString()); rs = ps.executeUpdate(); if
		 * (rs > 0) {
		 * 
		 * status = "success"; } } catch (SQLException e) { status = "error";
		 * e.printStackTrace(); } finally {
		 * 
		 * if (ps != null) { try { ps.close(); } catch (SQLException e) {
		 * 
		 * } } if (conn != null) { try { conn.close(); } catch (SQLException e) {
		 * 
		 * } } }
		 * 
		 * log.info("executed"); refno = ReporefSeq;
		 * 
		 * }
		 * 
		 * // for old Reference id else {
		 */

		int rowcount = 0;

		sql.append(
				"SELECT Count (*) as count FROM   (SELECT DISTINCT REPORT_DATE FROM  PSC0300_MOD_TABLE where  ACCT_NUMBER = '"
						+ request.getParameter("accno") + "'and CUST_ID = '" + request.getParameter("custid")
						+ "'and REPORT_DATE ='" + df1.formatdate(request.getParameter("dt2")) + "')");

		try {
			log.info(sql.toString());
			ps = conn.prepareStatement(sql.toString());
			ResultSet rs1 = ps.executeQuery();
			while (rs1.next()) {
				rowcount = rs1.getInt("count");
			}

			log.info(rowcount + ";RowCount");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {

				}
			}

		}

		if (rowcount > 0) {

			log.info("INSDIE UPDATE");

			sql2.append("update  PSC0300_MOD_TABLE set REPORT_REF_NO ='" + ReporefSeq + "',ACCT_NUMBER ='"
					+ request.getParameter("accno") + "',CUST_ID ='" + request.getParameter("custid") + "',CUST_NAME ='"
					+ request.getParameter("custname") + "',SCHM_TYPE ='" + request.getParameter("systp")
					+ "',SCHM_CODE ='" + request.getParameter("syscode") + "',UNIQUE_IDENTIFIER ='"
					+ request.getParameter("uqid") + "',NRE_FLG ='" + request.getParameter("nrefg") + "',ISIC_CODE ='"
					+ request.getParameter("iscode") + "',COUNTRY_CODE ='" + request.getParameter("cntrycode")
					+ "',SANCT_AMT ='" + request.getParameter("snamt") + "',OUTSTANDING_AMT ='"
					+ request.getParameter("outstdamt") + "',ACCT_CRNCY_CODE ='" + request.getParameter("acccurcode")
					+ "',RESTRUCTURED_FLG ='" + request.getParameter("resfg") + "',RESTRUCTURED_DATE ='"
					+ df1.formatdate(request.getParameter("resdate")) + "',NFB_LIMIT ='"
					+ request.getParameter("nfblimit") + "',NFB_OUTSTANDING ='" + request.getParameter("nfboutstd")
					+ "',NPA_FLG ='" + request.getParameter("npaflg") + "',SECURED_FLG ='"
					+ request.getParameter("secflg") + "',SECURED_AMT ='" + request.getParameter("secamt")
					+ "',ARREAR_DAYS ='" + request.getParameter("arrday") + "',ARREAR_AMT ='"
					+ request.getParameter("arramt") + "',LOAN_RATIO ='" + request.getParameter("loanratio")
					+ "',SPECIFIC_PROVISION ='" + request.getParameter("spcprvsn") + "',NPA_REASON ='"
					+ request.getParameter("npareason") + "',REPORT_DATE ='"
					+ df.formatdate(request.getParameter("repdt")) + "' DEL_FLG='M' " + " where ACCT_NUMBER ='"
					+ request.getParameter("accno") + "' and  CUST_ID = '" + request.getParameter("custid")
					+ "'and REPORT_DATE ='" + df1.formatdate(request.getParameter("repdt")) + "'");
			log.info(sql2 + "Gayu");

			try {
				ps = conn.prepareStatement(sql2.toString());
				rs = ps.executeUpdate();
				if (rs > 0) {

					status = "success";
				}
			} catch (SQLException e) {
				status = "error";
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
			refno = ReporefSeq;
		} else {

			sql3.append(
					"INSERT INTO PSC0300_MOD_TABLE(REPORT_REF_NO,ACCT_NUMBER,CUST_ID,CUST_NAME,SCHM_TYPE,SCHM_CODE,UNIQUE_IDENTIFIER,NRE_FLG,"
							+ "ISIC_CODE,COUNTRY_CODE,SANCT_AMT,OUTSTANDING_AMT,ACCT_CRNCY_CODE,RESTRUCTURED_FLG,RESTRUCTURED_DATE,NFB_LIMIT,NFB_OUTSTANDING,"
							+ "NPA_FLG,SECURED_FLG,SECURED_AMT,ARREAR_DAYS,ARREAR_AMT,LOAN_RATIO,SPECIFIC_PROVISION,NPA_REASON,REPORT_DATE,DEL_FLG,LCHG_USER_ID,LCHG_TIME)"
							+ "values('" + ReporefSeq + "','" + request.getParameter("accno") + "','"
							+ request.getParameter("custid") + "','" + request.getParameter("custname") + "','"
							+ request.getParameter("systp") + "','" + request.getParameter("syscode") + "','"
							+ request.getParameter("uqid") + "','" + request.getParameter("nrefg") + "','"
							+ request.getParameter("iscode") + "','"

							+ request.getParameter("cntrycode") + "','" + request.getParameter("snamt") + "','"
							+ request.getParameter("outstdamt") + "','" + request.getParameter("acccurcode") + "','"
							+ request.getParameter("resfg") + "','" + df1.formatdate(request.getParameter("resdate"))
							+ "','" + request.getParameter("nfblimit") + "','" + request.getParameter("nfboutstd")
							+ "','" + request.getParameter("npaflg") + "','" + request.getParameter("secflg") + "','"
							+ request.getParameter("secamt") + "','" + request.getParameter("arrday") + "','"
							+ request.getParameter("arramt") + "','"

							+ request.getParameter("loanratio") + "','" + request.getParameter("spcprvsn") + "','"
							+ request.getParameter("npareason") + "','" + df1.formatdate(request.getParameter("repdt"))
							+ "','" + request.getParameter("modtyp") + "','" + session.getAttribute("userName")
							+ "',SYSDATE)");

			try {
				ps = conn.prepareStatement(sql3.toString());
				rs = ps.executeUpdate();
				if (rs > 0) {

					status = "success";
				}
			} catch (SQLException e) {
				status = "error";
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

			log.info("executed");
			refno = ReporefSeq;

			// String stat = bop0300add(ReporefSeq);

			refno = ReporefSeq;
		}

		/* } */

		return "success";

	}

	public String psc0300verify() {
		log.info("ddddddddddd");
		XBRLPSC0300Dao bsd = new XBRLPSC0300Dao();
		ArrayList<XBRLPSC0300Bean> arr = new ArrayList<XBRLPSC0300Bean>();
		arr = bsd.PSC0300verify();
		Gson gson = new Gson();
		detPSC0300 = gson.toJson(arr);
		return "success";
	}

	public String PSC0300vermaster() {
		String status = "";
		XBRLPSC0300Dao bsd = new XBRLPSC0300Dao();
		HttpServletRequest request = ServletActionContext.getRequest();
		status = bsd.PSC0300verifymaster();

		if (status.equals("success")) {
			resalert = "Verification Successful";
		} else {
			resalert = "Technical Issue.Try Again Later.";
		}

		return "success";
	}

	/* --------------- SUMMARY BUTTOn CLICK --------------------------- */

	public String summarypsc0300detail() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("in summarypsc0300detail");

		log.info("test----->" + request.getParameter("reportrefnos") + "dt333"
				+ df.formatdate(request.getParameter("dt1")) + df.formatdate(request.getParameter("dt2")));
		XBRLPSC0300Dao bsd = new XBRLPSC0300Dao();
		ArrayList<XBRLPSC0300Bean> arl = bsd.xbrlpsc0300sumEP(df.formatdate(request.getParameter("dt1")),
				df.formatdate(request.getParameter("dt2")), request.getParameter("reportrefnos"),
				request.getParameter("curr"), request.getParameter("reptype"));

		// summarystandard = arl.toArray(new String[arl.size()]);
		log.info("ARL------------>" + arl.size());
		Gson gson = new Gson();
		summarypsc0300 = gson.toJson(arl);

		return "success";

	}

	public String sumpsc0300detail() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("in summarypsc0300detail");

		log.info("test----->" + request.getParameter("reportrefnos") + "dt333"
				+ df.formatdate(request.getParameter("dt1")) + df.formatdate(request.getParameter("dt2")));
		XBRLPSC0300Dao bsd = new XBRLPSC0300Dao();
		ArrayList<XBRLPSC0300Bean> arl = bsd.xbrlpsc0300sumEP1(df.formatdate(request.getParameter("dt1")),
				df.formatdate(request.getParameter("dt2")), request.getParameter("reportrefnos"),
				request.getParameter("curr"), request.getParameter("reptype"));

		// summarystandard = arl.toArray(new String[arl.size()]);
		log.info("ARL------------>" + arl.size());
		Gson gson = new Gson();
		sumpsc0300 = gson.toJson(arl);

		return "success";

	}

	public String detailpsc0300() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();

		XBRLPSC0300Dao bsd = new XBRLPSC0300Dao();

		ArrayList<XBRLPSC0300Bean> arl = bsd.xbrlpsc0300ajaxdetails(request.getParameter("repname"),
				request.getParameter("ReporefSeq"), request.getParameter("instno"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),
				request.getParameter("curr"));

		// summarystandard = arl.toArray(new String[arl.size()]);

		Gson gson = new Gson();
		detpsc0300 = gson.toJson(arl);

		return "success";

	}

}