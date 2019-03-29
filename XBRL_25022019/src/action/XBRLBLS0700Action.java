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
import bean.XBRLBLS0700Bean;
import dao.XBRLBLS0700Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;

import org.apache.log4j.Logger;
/***************************************************************************************************************
 * * * @companyName : Bonfire Innovation Private Limited Chennai * * @project :
 * Extensible Business Reporting Language (XBRL) * * @name :
 * XBRLBLS0700Action.java * * @path : action * * @author : D PraveenBabu *
 * * @version : 1.0 * * @functionality : It contains the action with multiple
 * methods to create BLS0700 Report. * * * @relatedScripts :
 * bean.XBRLBLS0700Bean.java,dao.XBRLBLS0700Dao.java * * @creationDate : *
 * * @lastModifiedDate : * * @modificationHistory : * *
 ***************************************************************************************************************/

public class XBRLBLS0700Action {
	
	static Logger log = Logger.getLogger(XBRLBLS0700Action.class);
	public String refno;

	public String summaryBLS0700;

	public String detBLS0700;

	public String getDetBLS0700() {
		return detBLS0700;
	}

	public void setDetBLS0700(String detBLS0700) {
		this.detBLS0700 = detBLS0700;
	}

	public String getSummaryBLS0700() {
		return summaryBLS0700;
	}

	public void setSummaryBLS0700(String summaryBLS0700) {
		this.summaryBLS0700 = summaryBLS0700;
	}

	public String getRefno() {
		return refno;
	}

	public void setRefno(String refno) {
		this.refno = refno;
	}

	public String modXbBLSCreate700() throws SQLException {

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
		log.info("insert Action modXbCreateBLS0700");

		log.info("NEW FLG:" + newFlg);

		// for Inserting new record

		// for new Reference id
		if (newFlg.equals('Y'))

		{
			sql.append(
					" INSERT INTO BLS0700_MOD_TABLE(REPORT_REF_NO,ACCT_NO,ACCT_NAME,SCHM_TYPE,INT_RATE,DEP_PERIOD_DAYS,ACCT_CRNCY_CODE,ACCT_BALANCE_AMT_AC,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)" + "VALUES ('"
							+ ReporefSeq + "','" + request.getParameter("actno")+ "','"
							+ request.getParameter("accname") + "','" + request.getParameter("schmtyp") + "','"
							+ request.getParameter("intrate") + "','" + request.getParameter("intperdays") + "','"
							+ request.getParameter("curr") + "','" + request.getParameter("balamt") + "','"
							+ df1.formatdate(request.getParameter("repdat")) + "','"
							+ session.getAttribute("userName")+"',SYSDATE)");
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
			sql.append("SELECT COUNT(*) as count FROM BLS0700_MOD_TABLE WHERE REPORT_REF_NO='" + ReporefSeq
					+ "' AND REPORT_DATE='" + df1.formatdate(request.getParameter("repdat")) + "' "
					+ "AND ACCT_NO ='"
					+ request.getParameter("actno") + "'");
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
				sql2.append("UPDATE BLS0700_MOD_TABLE SET ACCT_NAME='" + request.getParameter("accname")
				+ "', SCHM_TYPE ='" + request.getParameter("schmtyp")
				+ "', INT_RATE='" + request.getParameter("intrate")
				+ "', DEP_PERIOD_DAYS ='" + request.getParameter("intperdays")
			
				+ "', ACCT_CRNCY_CODE  ='" + request.getParameter("curr")
				+ "', ACCT_BALANCE_AMT_AC='" + request.getParameter("balamt")+ "' "
				+ "WHERE REPORT_REF_NO='" + ReporefSeq + "' AND REPORT_DATE='"
				+ df1.formatdate(request.getParameter("repdat")) + "' " + "AND ACCT_NO='"
				+ request.getParameter("actno")
				+ "'");

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
						" INSERT INTO BLS0700_MOD_TABLE(REPORT_REF_NO,ACCT_NO,ACCT_NAME,SCHM_TYPE,INT_RATE,DEP_PERIOD_DAYS,ACCT_CRNCY_CODE,ACCT_BALANCE_AMT_AC,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)" + "VALUES ('"
								+ ReporefSeq + "','" + request.getParameter("actno")+ "','"
								+ request.getParameter("accname") + "','" + request.getParameter("schmtyp") + "','"
								+ request.getParameter("intrate") + "','" + request.getParameter("intperdays") + "','"
								+ request.getParameter("curr") + "','" + request.getParameter("balamt") + "','"
								+ df1.formatdate(request.getParameter("repdat")) + "','"
								+ session.getAttribute("userName")+"',SYSDATE)");
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

return "success";
//return status;
	}


	/* --------------- SUMMARY BUTTOn CLICK --------------------------- */

	public String summaryBLS0700detail() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("in summaryBLS0700detail");

		log.info("test----->" + request.getParameter("reportrefnos") + "dt333"
				+ df.formatdate(request.getParameter("dt1")) + df.formatdate(request.getParameter("dt2")));
		XBRLBLS0700Dao bsd = new XBRLBLS0700Dao();
		ArrayList<XBRLBLS0700Bean> arl = bsd.xbrlpymsumEP(request.getParameter("reptype"), request.getParameter("reportrefnos"),df.formatdate(request.getParameter("dt1")),
				df.formatdate(request.getParameter("dt2")),
				request.getParameter("curr"));

		// summarystandard = arl.toArray(new String[arl.size()]);
		log.info("ARL------------>" + arl.size());
		Gson gson = new Gson();
		summaryBLS0700 = gson.toJson(arl);

		return "success";

	}

	public String detailBLS0700() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();

		XBRLBLS0700Dao bsd = new XBRLBLS0700Dao();

		ArrayList<XBRLBLS0700Bean> arl = bsd.xbrlBLSajaxdetails(request.getParameter("repname"),
				request.getParameter("ReporefSeq"), request.getParameter("instno"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),
				request.getParameter("curr"));

		// summarystandard = arl.toArray(new String[arl.size()]);

		Gson gson = new Gson();
		detBLS0700 = gson.toJson(arl);

		return "success";

	}

	/*
	 * public String sumBLS0700saves() {
	 * 
	 * HttpServletRequest request = ServletActionContext.getRequest();
	 * DateFormat df = new DateFormat();
	 * 
	 * log.info("ajhflkashfklashfklahtest"); XBRLBLS0700Dao bsd = new
	 * XBRLBLS0700Dao();
	 * 
	 * ArrayList<XBRLBLS0700Bean> arl =
	 * bsd.detailBLS0700saves(request.getParameter("repname"),
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
}