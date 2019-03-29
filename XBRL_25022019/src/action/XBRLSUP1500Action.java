package action;

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

import com.google.gson.Gson;

import basecode.DateFormat;

import bean.XBRLSUP1500Bean;

import dao.XBRLSUP1500Dao;

import bean.XBRLReportMasterBean;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;

public class XBRLSUP1500Action {

	static Logger log = Logger.getLogger(XBRLSUP1500Action.class);

	public String refno;

	public String getRefno() {
		return refno;
	}

	public void setRefno(String refno) {
		this.refno = refno;
	}

	public String Reporef;

	public String getReporef() {
		return Reporef;
	}

	public void setReporef(String reporef) {
		Reporef = reporef;
	}

	public String detSUP1500;
	public String summarySUP1500;

	public String getDetSUP1500() {
		return detSUP1500;
	}

	public void setDetSUP1500(String detSUP1500) {
		this.detSUP1500 = detSUP1500;
	}

	public String getSummarySUP1500() {
		return summarySUP1500;
	}

	public void setSummarySUP1500(String summarySUP1500) {
		this.summarySUP1500 = summarySUP1500;
	}

	public ArrayList<XBRLSUP1500Bean> xbrlSUP1500(String dt1, String dt2, String curr) {

		log.info("BLS0106 List Data AB " + dt1 + "dt22222" + dt2);

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		ArrayList<XBRLSUP1500Bean> arl = new ArrayList<XBRLSUP1500Bean>();

		String status = "";

		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();

		PreparedStatement ps = null;

		StringBuffer sql = new StringBuffer();

		DateFormat df = new DateFormat();
		dt1 = df.formatdate(dt1);
		dt2 = df.formatdate(dt2);

		try {

			// sql.append("SELECT
			// DYNAMIC_DOMAIN,to_char(REP_DATE,'DD-MM-YYYY')REP_DATE,INSTITUTE_ID,TRAN_ID,INSTITUTE_NAME,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,SECTOR,SPOT_RATE,FWD_RATE,to_char(DUE_DATE,'DD-MM-YYYY')DUE_DATE,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME
			// FROM FIM0400_MAST_TABLE Where REP_DATE >='"+dt1+"' and REP_DATE
			// <= '"+dt2+"' ORDER BY cast(TRAN_ID as int) ASC ");

			// sql.append("SELECT
			// MODES,CHQ_ALPHA,CHQ_NUMBER,ACCT_NUMBER,ACCT_NAME,to_char(TRAN_DATE,'DD-MM-YYYY')TRAN_DATE,to_char(VALUE_DATE,'DD-MM-YYYY')VALUE_DATE,CHQ_AMOUNT,CRNCY,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME
			// FROM PYM0100_MAST_TABLE Where TRAN_DATE >='"+dt1+"' and TRAN_DATE
			// <= '"+dt2+"' ORDER BY TRAN_DATE ASC ");

			sql.append(
					"SELECT /* +FIRST_ROWS(100) */ ACCT_NUMBER,ACCT_NAME,TRANSFERABLE_FLG,SCHM_TYPE,NATURE_OF_CUSTOMER,NRE_FLG,CURRENCY_CODE,BALANCE_AMT,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME FROM TABLE(BLS0106_DTL_FUN('BLS0106','0','0','"
							+ dt2 + "','" + dt2 + "','" + dt2 + "','" + curr + "'))");

			log.info("Normal Kumar BLS" + sql.toString());

			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				// log.info("whileee");
				XBRLSUP1500Bean xb = new XBRLSUP1500Bean();

				/*
				 * xb.setAccountNumber(NullCheck.isNotNull(rs.getString(
				 * "ACCT_NUMBER")));
				 * xb.setAccountName(NullCheck.isNotNull(rs.getString(
				 * "ACCT_NAME")));
				 * xb.setTransferflg(NullCheck.isNotNull(rs.getString(
				 * "TRANSFERABLE_FLG")));
				 * xb.setSchemetype(NullCheck.isNotNull(rs.getString("SCHM_TYPE"
				 * ))); xb.setNatureofcustomer(NullCheck.isNotNull(rs.getString(
				 * "NATURE_OF_CUSTOMER")));
				 * xb.setNreflg(NullCheck.isNotNull(rs.getString("NRE_FLG")));
				 * xb.setCurrency(NullCheck.isNotNull(rs.getString(
				 * "CURRENCY_CODE")));
				 * xb.setBalanceamt(NullCheck.isNotNull(rs.getString(
				 * "BALANCE_AMT")));
				 * xb.setReportdate(NullCheck.isNotNull(rs.getString(
				 * "REPORT_DATE")));
				 */

				/*
				 * xb.setDelflg(NullCheck.isNotNull(rs.getString("DEL_FLG")));
				 * xb.setRcrusrid(NullCheck.isNotNull(rs.getString(
				 * "RCRE_USER_ID")));
				 * xb.setRcrtime(NullCheck.isNotNull(rs.getString("RCRE_TIME")))
				 * ; xb.setLchgusrid(NullCheck.isNotNull(rs.getString(
				 * "LCHG_USER_ID")));
				 * xb.setLchgtime(NullCheck.isNotNull(rs.getString("LCHG_TIME"))
				 * );
				 */

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

	public ArrayList<XBRLSUP1500Bean> xbrlpym4RR(String dt1, String dt2, String ReporefSeq, String instno,
			String curr) {

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		ArrayList<XBRLSUP1500Bean> arl = new ArrayList<XBRLSUP1500Bean>();

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
					"SELECT MODES,CHQ_ALPHA,CHQ_NUMBER,ACCT_NUMBER,ACCT_NAME,to_char(TRAN_DATE,'DD-MM-YYYY')TRAN_DATE,to_char(VALUE_DATE,'DD-MM-YYYY')VALUE_DATE,CHQ_AMOUNT,CRNCY,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME    FROM   PYM0100_MAST_TABLE where TRAN_DATE >='"
							+ dt1 + "' and TRAN_DATE <= '" + dt2
							+ "'  and CHQ_NUMBER not in (Select CHQ_NUMBER from PYM0100_MOD_TABLE where REPORT_REF_NO='"
							+ ReporefSeq
							+ "')	UNION all	SELECT MODES,CHQ_ALPHA,CHQ_NUMBER,ACCT_NUMBER,ACCT_NAME,to_char(TRAN_DATE,'DD-MM-YYYY')TRAN_DATE,to_char(VALUE_DATE,'DD-MM-YYYY')VALUE_DATE,CHQ_AMOUNT,CRNCY,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME    FROM   PYM0100_MOD_TABLE Where   REPORT_REF_NO ='"
							+ ReporefSeq + "' ");

			sql.append(
					"SELECT /* +FIRST_ROWS(100) */ MODES,CHQ_NUMBER,ACCT_NUMBER,ACCT_NAME,to_char(TRAN_DATE,'DD-MM-YYYY')TRAN_DATE,CHQ_AMOUNT,CRNCY,DEL_FLG,RCRE_USER_ID,RCRE_TIME,LCHG_USER_ID,LCHG_TIME FROM TABLE(PYM0100_DTL_FUN('PYM0100','"
							+ ReporefSeq + "','" + instno + "','" + dt2 + "','" + dt1 + "','" + dt2 + "','" + curr
							+ "'))");

			log.info("DOC&&&&SELECT" + sql.toString());
			try {
				ps = conn.prepareStatement(sql.toString());

				ResultSet rs = ps.executeQuery();

				while (rs.next()) {

					XBRLSUP1500Bean xb = new XBRLSUP1500Bean();

					/*
					 * xb.setAccountNumber(NullCheck.isNotNull(rs.getString(
					 * "ACCT_NUMBER")));
					 * xb.setAccountName(NullCheck.isNotNull(rs.getString(
					 * "ACCT_NAME")));
					 * xb.setCurrency(NullCheck.isNotNull(rs.getString("CRNCY"))
					 * );
					 * xb.setDelflg(NullCheck.isNotNull(rs.getString("DEL_FLG"))
					 * ); xb.setRcrusrid(NullCheck.isNotNull(rs.getString(
					 * "RCRE_USER_ID")));
					 * xb.setRcrtime(NullCheck.isNotNull(rs.getString(
					 * "RCRE_TIME")));
					 * xb.setLchgusrid(NullCheck.isNotNull(rs.getString(
					 * "LCHG_USER_ID")));
					 * xb.setLchgtime(NullCheck.isNotNull(rs.getString(
					 * "LCHG_TIME")));
					 */

					arl.add(xb);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

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

	public ArrayList<XBRLSUP1500Bean> ReporefSeq(String dt2) {

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		String status = "";

		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();
		DateFormat df = new DateFormat();
		// dt1 =df.formatdate(dt1);
		dt2 = df.formatdate(dt2);

		log.info("inside the report seq");

		ArrayList<XBRLSUP1500Bean> arl = new ArrayList<XBRLSUP1500Bean>();

		sql.append("select REPORT_REF_NO from FIM0900_MOD_TABLE where REPORT_DATE = '" + dt2
				+ "' GROUP BY REPORT_REF_NO ORDER BY REPORT_REF_NO");

		log.info("SELECTPROFILE" + sql.toString());

		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLSUP1500Bean xel = new XBRLSUP1500Bean();

				/*
				 * xel.setReporef(NullCheck.isNotNull(rs.getString(
				 * "REPORT_REF_NO")));
				 */

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

	/*********** PDF and EXCEL HEADER FROM XBRL REPORT MASTER ***************/
	public XBRLReportMasterBean xbrlsummarypdf(String ReporefSeq) {

		XBRLReportMasterBean xb = new XBRLReportMasterBean();
		HttpServletRequest request = ServletActionContext.getRequest();
		ConnectionManager conmgr = new ConnectionManager();
		Connection conn = conmgr.getConnection();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();

		sql.append("SELECT * FROM XBRL_REPORT_MASTER_TB WHERE REPORT_ID='" + ReporefSeq + "'");
		try {
			log.info(sql.toString());
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
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

		return xb;

	}

	public String summarySUP1500detail() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("in summarysup1500detail");

		log.info("test----->" + request.getParameter("repname") + "dt333" + df.formatdate(request.getParameter("dt2")));
		XBRLSUP1500Dao bsd = new XBRLSUP1500Dao();
		/*
		 * ArrayList<XBRLFIM0900Bean> arl =
		 * bsd.xbrlfim0900sumEP(df.formatdate(request.getParameter("dt1")),df.
		 * formatdate(request.getParameter("dt2")),
		 * request.getParameter("reportrefnos"),request.getParameter("curr"));
		 */
		ArrayList<XBRLSUP1500Bean> arl = bsd.xbrlsup1500sumEP(request.getParameter("repname"),
				request.getParameter("ReporefSeq"), df.formatdate(request.getParameter("dt2")),
				request.getParameter("curr"));
		// summarystandard = arl.toArray(new String[arl.size()]);
		log.info("ARL------------>" + arl.size());
		Gson gson = new Gson();
		summarySUP1500 = gson.toJson(arl);

		return "success";

	}

	public String detailSUP1500() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();

		XBRLSUP1500Dao bsd = new XBRLSUP1500Dao();

		/*
		 * ArrayList<XBRLFIM0900Bean> arl =
		 * bsd.xbrlfim0900ajaxdetails(request.getParameter("repname"),request.
		 * getParameter("ReporefSeq"),
		 * request.getParameter("instno"),df.formatdate(request.getParameter(
		 * "dt1")),df.formatdate(request.getParameter("dt2")),
		 * request.getParameter("curr"));
		 */

		ArrayList<XBRLSUP1500Bean> arl = bsd.xbrlsup1500ajaxdetails(request.getParameter("repname"),
				request.getParameter("ReporefSeq"), request.getParameter("instno"),
				df.formatdate(request.getParameter("dt2")), request.getParameter("curr"));

		// summarystandard = arl.toArray(new String[arl.size()]);

		Gson gson = new Gson();
		detSUP1500 = gson.toJson(arl);

		return "success";

	}

	public String modXbSUPCreate1500() throws SQLException {

		log.info("XBRL XBRL XBRL");

		String status = "";
		String status1 = "";

		String ReporefSeq = "";
		HttpServletRequest request = ServletActionContext.getRequest();
		// log.info("rptdayAG_row--->"+request.getParameter("rptdayAG"));
		DateFormat df = new DateFormat();

		NullCheck nc = new NullCheck();

		HttpSession session = request.getSession();

		log.info("chqalpha--->" + request.getParameter("chqalpha"));

		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		log.info("insert");
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;

		StringBuffer sql2 = new StringBuffer();
		PreparedStatement ps3 = null;
		PreparedStatement ps4 = null;

		StringBuffer sql3 = new StringBuffer();
		StringBuffer sql4 = new StringBuffer();
		Character newFlg;

		DateFormat df1 = new DateFormat();

		// String passexpdate=df.formatdate(xb.getAccopendate());
		log.info("===" + request.getParameter("reportrefno"));

		if (request.getParameter("reportrefno").startsWith("R")) {

			log.info("else notttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt ");
			ReporefSeq = request.getParameter("reportrefno");
			newFlg = 'N';

		} else {

			log.info("nullllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll");

			utilities.SequenceNumber seqNo = new utilities.SequenceNumber();
			String reporefseqno = seqNo.reporefno();

			// log.info(" seqno := " + seqno);

			ReporefSeq = "RR01000" + reporefseqno;
			newFlg = 'Y';

		}
		log.info("===ReporefSeq===" + ReporefSeq);
		// log.info("<< EIDSeq >> " + EIDSeq);
		session.setAttribute("ReprefSeq", ReporefSeq);

		int rs = 0;

		int count = 0;

		StringBuffer sql = new StringBuffer();

		// HttpSession session = request.getSession();
		log.info("insert Action modXbCreateSUP1500");

		log.info("NEW FLG:" + newFlg);

		// for Inserting new record

		// for new Reference id
		if (newFlg.equals('Y'))

		{
			sql.append(
					"INSERT INTO SUP1500_MOD_TABLE (REPORT_REF_NO,REPORT_DATE,INSTANCE_CODE,RESIDENT,NON_RESIDENT,LCHG_USER_ID,LCHG_TIME)"
							+ "VALUES ('" + ReporefSeq + "','" + df1.formatdate(request.getParameter("dt2")) + "','"
							+ request.getParameter("instanccode") + "','" + request.getParameter("resident") + "','"
							+ request.getParameter("nonresident") + "','" + session.getAttribute("userName")
							+ "',SYSDATE)");
			log.info(sql);

			try {
				ps = conn.prepareStatement(sql.toString());
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

		}

		// for old Reference id
		else {

			int rowcount = 0;
			sql.append("SELECT COUNT(*) as count FROM SUP1500_MOD_TABLE WHERE REPORT_REF_NO='" + ReporefSeq
					+ "' AND REPORT_DATE='" + df1.formatdate(request.getParameter("dt2")) + "' " + "AND INSTANCE_CODE='"
					+ request.getParameter("instanccode") + "' ");

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
				sql2.append("UPDATE SUP1500_MOD_TABLE SET RESIDENT='" + request.getParameter("resident")

						+ "', NON_RESIDENT='" + request.getParameter("nonresident") + "' " + "WHERE REPORT_REF_NO='"
						+ ReporefSeq + "' AND REPORT_DATE='" + df1.formatdate(request.getParameter("dt2")) + "' "
						+ "AND INSTANCE_CODE='" + request.getParameter("instanccode") + "'");

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
						"INSERT INTO SUP1500_MOD_TABLE (REPORT_REF_NO,REPORT_DATE,INSTANCE_CODE,RESIDENT,NON_RESIDENT,LCHG_USER_ID,LCHG_TIME)"
								+ "VALUES ('" + ReporefSeq + "','" + df1.formatdate(request.getParameter("dt2")) + "','"
								+ request.getParameter("instanccode") + "','" + request.getParameter("resident") + "','"
								+ request.getParameter("nonresident") + "','" + session.getAttribute("userName")
								+ "',SYSDATE)");
				log.info(sql3);

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

		}
		log.info("executed");
		// return "success";
		return status;
	}
}
