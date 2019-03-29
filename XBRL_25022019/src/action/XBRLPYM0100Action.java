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
import bean.XBRLPYM0100Bean;
import dao.XBRLPYM0100Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
/***************************************************************************************************************
 * * * @companyName : Bonfire Innovation Private Limited Chennai * * @project :
 * Extensible Business Reporting Language (XBRL) * * @name :
 * XBRLPYM0100Action.java * * @path : action * * @author : D PraveenBabu *
 * * @version : 1.0 * * @functionality : It contains the action with multiple
 * methods to create PYM0100 Report. * * * @relatedScripts :
 * bean.XBRLPYM0100Bean.java,dao.XBRLPYM0100Dao.java * * @creationDate : *
 * * @lastModifiedDate : * * @modificationHistory : * *
 ***************************************************************************************************************/

public class XBRLPYM0100Action {
	static Logger log = Logger.getLogger(XBRLPYM0100Action.class);
	public String refno;

	public String summaryPYM0100;

	public String detPYM0100;

	public String getDetPYM0100() {
		return detPYM0100;
	}

	public void setDetPYM0100(String detPYM0100) {
		this.detPYM0100 = detPYM0100;
	}

	public String getSummaryPYM0100() {
		return summaryPYM0100;
	}

	public void setSummaryPYM0100(String summaryPYM0100) {
		this.summaryPYM0100 = summaryPYM0100;
	}

	public String getRefno() {
		return refno;
	}

	public void setRefno(String refno) {
		this.refno = refno;
	}

	public String modXbPYMCreate100() throws SQLException {

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
					"INSERT INTO PYM0100_MOD_TABLE(REPORT_REF_NO, MODES, CHQ_NUMBER, ACCT_NUMBER,ACCT_NAME,TRAN_DATE,VALUE_DATE,CHQ_AMOUNT,CRNCY,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
							+ "VALUES('" + ReporefSeq + "','" + request.getParameter("mode") + "','"
							+ request.getParameter("chqno") + "','" + request.getParameter("accno") + "'," + "'"
							+ request.getParameter("accname") + "'," + "'" + df.formatdate(request.getParameter("trdate")) + "','"
							+ df.formatdate(request.getParameter("trdate")) + "','" + request.getParameter("chqamt") + "'," + "'"
							+ request.getParameter("crncy") + "',LAST_DAY('" + df.formatdate(request.getParameter("dt2")) + "'),'"
							+ request.getParameter("lchusrid") + "',SYSDATE)");
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
			sql.append("SELECT COUNT(*) as count FROM PYM0100_MOD_TABLE WHERE REPORT_REF_NO='" + ReporefSeq + "' AND "
					+ "MODES='" + request.getParameter("mode") + "' AND CHQ_NUMBER='" + request.getParameter("chqno")
					+ "' AND ACCT_NUMBER='" + request.getParameter("accno") + "' AND TRAN_DATE='"
					+ df.formatdate(request.getParameter("trdate")) + "'");
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
				sql2.append("UPDATE PYM0100_MOD_TABLE SET REPORT_REF_NO='" + ReporefSeq + "'," + "MODES='"
						+ request.getParameter("mode") + "'," + "CHQ_NUMBER='" + request.getParameter("chqno") + "',"
						+ "ACCT_NUMBER='" + request.getParameter("accno") + "'," + "ACCT_NAME='"
						+ request.getParameter("accname") + "'," + "TRAN_DATE='" + df.formatdate(request.getParameter("trdate"))
						+ "', " + "VALUE_DATE='" + df.formatdate(request.getParameter("trdate")) + "'," + "CHQ_AMOUNT='"
						+ request.getParameter("chqamt") + "'," + "CRNCY='" + request.getParameter("crncy") + "',"
						+ "REPORT_DATE=LAST_DAY('" + df.formatdate(request.getParameter("dt2")) + "')," + "LCHG_USER_ID='"
						+ request.getParameter("rcrusrid") + "'," + "LCHG_TIME=SYSDATE WHERE REPORT_REF_NO='"
						+ ReporefSeq + "' AND MODES='" + request.getParameter("mode") + "' AND CHQ_NUMBER='"
						+ request.getParameter("chqno") + "' " + "AND ACCT_NUMBER='" + request.getParameter("accno")
						+ "' AND TRAN_DATE='" + df.formatdate(request.getParameter("trdate")) + "'");

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
						"INSERT INTO PYM0100_MOD_TABLE(REPORT_REF_NO, MODES, CHQ_NUMBER, ACCT_NUMBER,ACCT_NAME,TRAN_DATE,VALUE_DATE,CHQ_AMOUNT,CRNCY,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
								+ "VALUES('" + request.getParameter("reportrefno") + "','"
								+ request.getParameter("mode") + "','" + request.getParameter("chqno") + "','"
								+ request.getParameter("accno") + "'," + "'" + request.getParameter("accname") + "',"
								+ "'" + df.formatdate(request.getParameter("trdate")) + "','" + df.formatdate(request.getParameter("trdate")) + "','"
								+ request.getParameter("chqamt") + "'," + "'" + request.getParameter("crncy")
								+ "',LAST_DAY('" + df.formatdate(request.getParameter("dt2")) + "'),'"
								+ request.getParameter("lchusrid") + "',SYSDATE)");
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

			
			}

		}

		//return "success";
		return status;

	}


	/* --------------- SUMMARY BUTTOn CLICK --------------------------- */

	public String summaryPYM0100detail() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("in summaryPYM0100detail");

		log.info("test----->" + request.getParameter("reportrefnos") + "dt333"
				+ df.formatdate(request.getParameter("dt1")) + df.formatdate(request.getParameter("dt2")));
		XBRLPYM0100Dao bsd = new XBRLPYM0100Dao();
		ArrayList<XBRLPYM0100Bean> arl = bsd.xbrlpymsumEP(df.formatdate(request.getParameter("dt1")),
				df.formatdate(request.getParameter("dt2")), request.getParameter("reportrefnos"),request.getParameter("curr"));

		// summarystandard = arl.toArray(new String[arl.size()]);
		log.info("ARL------------>" + arl.size());
		Gson gson = new Gson();
		summaryPYM0100 = gson.toJson(arl);

		return "success";

	}

	public String detailPYM0100() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
	
		
		XBRLPYM0100Dao bsd = new XBRLPYM0100Dao();

		ArrayList<XBRLPYM0100Bean> arl = bsd.xbrlpymajaxdetails(request.getParameter("repname"),
				request.getParameter("ReporefSeq"), request.getParameter("instno"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		// summarystandard = arl.toArray(new String[arl.size()]);
		
		Gson gson = new Gson();
		detPYM0100 = gson.toJson(arl);

		return "success";

	}

	/*public String sumPYM0100saves() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();

		log.info("ajhflkashfklashfklahtest");
		XBRLPYM0100Dao bsd = new XBRLPYM0100Dao();

		ArrayList<XBRLPYM0100Bean> arl = bsd.detailPYM0100saves(request.getParameter("repname"),
				request.getParameter("reprefno"), request.getParameter("instno"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")));

		// arl.toArray(new String[arl.size()]);

		return "success";

	

}
*/
}