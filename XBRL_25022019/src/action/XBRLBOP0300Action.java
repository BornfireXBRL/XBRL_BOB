package action;

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
import basecode.PasswordEncryption;
import bean.XBRLBOP0300Bean;
import dao.XBRLBOP0300Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;

/***************************************************************************************************************
 * * * @companyName : Bonfire Innovation Private Limited Chennai * * @project :
 * Extensible Business Reporting Language (XBRL) * * @name :
 * XBRLBOP0300Action.java * * @path : action * * @author : D PraveenBabu *
 * * @version : 1.0 * * @functionality : It contains the action with multiple
 * methods to create BOP0300 Report. * * * @relatedScripts :
 * bean.XBRLBOP0300Bean.java,dao.XBRLBOP0300Dao.java * * @creationDate : *
 * * @lastModifiedDate : * * @modificationHistory : * *
 ***************************************************************************************************************/

import org.apache.log4j.Logger;

public class XBRLBOP0300Action {

	static Logger log = Logger.getLogger(XBRLBOP0300Action.class);
	public String refno;

	public String summaryBOP0300;

	public String detBOP0300;

	public String getDetBOP0300() {
		return detBOP0300;
	}

	public void setDetBOP0300(String detBOP0300) {
		this.detBOP0300 = detBOP0300;
	}

	public String getSummaryBOP0300() {
		return summaryBOP0300;
	}

	public void setSummaryBOP0300(String summaryBOP0300) {
		this.summaryBOP0300 = summaryBOP0300;
	}

	public String getRefno() {
		return refno;
	}

	public void setRefno(String refno) {
		this.refno = refno;
	}

	@SuppressWarnings({ "resource", "null" })
	public String modBOPCreate300() throws SQLException {

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
		log.info("insert Action modXbCreateBOP0300");
		String editflg = request.getParameter("editflg");
		log.info("Edit or insert flg:" + editflg);
		log.info("NEW FLG:" + newFlg);

		// for Inserting new record

		// for new Reference id
		if (newFlg.equals('Y'))

		{
			sql.append(
					"INSERT INTO BOP0300_MOD_TABLE (REPORT_REF_NO, REPORT_DATE, ASSET_LIAB_NR_FLG, ACCT_CRNCY_CODE, NRE_FLG, BALANCE_AC, WEIGHTED_AVG_INT_RATE,"
							+ "INTEREST_INCOME_EXP_QTR,LCHG_USER_ID,LCHG_TIME,AS_ON_DATE)" + "VALUES ('" + ReporefSeq
							+ "','" + df1.formatdate(request.getParameter("rptdate")) + "','"
							+ request.getParameter("astliab") + "','" + request.getParameter("crncy") + "','"
							+ request.getParameter("nreflg") + "','" + request.getParameter("balamt") + "','"
							+ request.getParameter("wgtavgamt") + "','" + request.getParameter("intinc") + "','"
							+ request.getParameter("lchusrid") + "',SYSDATE,QUARTER_END('"
							+ df1.formatdate(request.getParameter("rptdate")) + "'))");
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
			sql.append("SELECT COUNT(*) as count FROM BOP0300_MOD_TABLE WHERE REPORT_REF_NO='" + ReporefSeq
					+ "' AND REPORT_DATE='" + df1.formatdate(request.getParameter("rptdate")) + "' "
					+ "AND ASSET_LIAB_NR_FLG='" + request.getParameter("astliab") + "' AND ACCT_CRNCY_CODE='"
					+ request.getParameter("crncy") + "'");
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
				sql2.append("UPDATE BOP0300_MOD_TABLE SET BALANCE_AC='" + request.getParameter("balamt")
						+ "', WEIGHTED_AVG_INT_RATE='" + request.getParameter("wgtavgamt")
						+ "', INTEREST_INCOME_EXP_QTR='" + request.getParameter("intinc")
						+ "', AS_ON_DATE=QUARTER_END('" + df1.formatdate(request.getParameter("rptdate")) + "') "
						+ "WHERE REPORT_REF_NO='" + ReporefSeq + "' AND REPORT_DATE='"
						+ df1.formatdate(request.getParameter("rptdate")) + "' " + "AND ASSET_LIAB_NR_FLG='"
						+ request.getParameter("astliab") + "' AND ACCT_CRNCY_CODE='" + request.getParameter("crncy")
						+ "'");

				log.info(sql2);

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
						"INSERT INTO BOP0300_MOD_TABLE (REPORT_REF_NO, REPORT_DATE, ASSET_LIAB_NR_FLG, ACCT_CRNCY_CODE, NRE_FLG, BALANCE_AC, WEIGHTED_AVG_INT_RATE,"
								+ "INTEREST_INCOME_EXP_QTR,LCHG_USER_ID,LCHG_TIME,AS_ON_DATE)" + "VALUES ('"
								+ ReporefSeq + "','" + df1.formatdate(request.getParameter("rptdate")) + "','"
								+ request.getParameter("astliab") + "','" + request.getParameter("crncy") + "','"
								+ request.getParameter("nreflg") + "','" + request.getParameter("balamt") + "','"
								+ request.getParameter("wgtavgamt") + "','" + request.getParameter("intinc") + "','"
								+ request.getParameter("lchusrid") + "',SYSDATE,QUARTER_END('"
								+ df1.formatdate(request.getParameter("rptdate")) + "'))");
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

		// return "success";
		return status;
	}

	/* --------------- SUMMARY BUTTOn CLICK --------------------------- */

	public String summaryBOP0300detail() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("in summaryBOP0300detail");
		log.info(request.getParameter("dt1") + "gfhfgh");
		log.info("test----->" + request.getParameter("reportrefnos") + "dt333"
				+ df.formatdate(request.getParameter("dt1")) + df.formatdate(request.getParameter("dt2")));
		XBRLBOP0300Dao bsd = new XBRLBOP0300Dao();
		ArrayList<XBRLBOP0300Bean> arl = bsd.xbrlpymsumEP(df.formatdate(request.getParameter("dt1")),
				df.formatdate(request.getParameter("dt2")), request.getParameter("reportrefnos"),
				request.getParameter("curr"));

		// summarystandard = arl.toArray(new String[arl.size()]);
		log.info("ARL------------>" + arl.size());
		Gson gson = new Gson();
		summaryBOP0300 = gson.toJson(arl);

		return "success";

	}

	public String detailBOP0300() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();

		XBRLBOP0300Dao bsd = new XBRLBOP0300Dao();

		ArrayList<XBRLBOP0300Bean> arl = bsd.xbrlbopajaxdetails(request.getParameter("repname"),
				request.getParameter("ReporefSeq"), request.getParameter("instno"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),
				request.getParameter("curr"));

		// summarystandard = arl.toArray(new String[arl.size()]);

		Gson gson = new Gson();
		detBOP0300 = gson.toJson(arl);

		return "success";

	}

	/*
	 * public String sumBOP0300saves() {
	 * 
	 * HttpServletRequest request = ServletActionContext.getRequest();
	 * DateFormat df = new DateFormat();
	 * 
	 * log.info("ajhflkashfklashfklahtest"); XBRLBOP0300Dao bsd = new
	 * XBRLBOP0300Dao();
	 * 
	 * ArrayList<XBRLBOP0300Bean> arl =
	 * bsd.detailBOP0300saves(request.getParameter("repname"),
	 * request.getParameter("reprefno"), request.getParameter("instno"),
	 * df.formatdate(request.getParameter("dt2")),
	 * df.formatdate(request.getParameter("dt1")));
	 * 
	 * // arl.toArray(new String[arl.size()]);
	 * 
	 * return "success";
	 * 
	 * 
	 * 
	 * }
	 */

	public String bop0300add(String ReporefSeq) {
		String status = "";
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		int rs = 0;
		StringBuffer sql = new StringBuffer();
		DateFormat df1 = new DateFormat();
		HttpServletRequest request = ServletActionContext.getRequest();
		sql.setLength(0);
		sql.append(
				"INSERT INTO BOP0300_MOD_TABLE (REPORT_REF_NO, REPORT_DATE, ASSET_LIAB_NR_FLG, ACCT_CRNCY_CODE, NRE_FLG, BALANCE_AC, WEIGHTED_AVG_INT_RATE,INTEREST_INCOME_EXP_QTR,LCHG_USER_ID,LCHG_TIME)");
		sql.append("VALUES ('" + ReporefSeq + "','" + df1.formatdate(request.getParameter("rptdate")) + "','"
				+ request.getParameter("astliab") + "','" + request.getParameter("crncy") + "','"
				+ request.getParameter("nreflg") + "','" + request.getParameter("balamt") + "','"
				+ request.getParameter("wgtavgamt") + "','" + request.getParameter("intinc") + "','"
				+ request.getParameter("lchusrid") + "',SYSDATE)");
		log.info("user query" + sql.toString());
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
		return status;
	}
}