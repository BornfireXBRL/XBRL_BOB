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
import bean.XBRLFIM0900Bean;
import bean.XBRLPSC0501Bean;
import dao.XBRLFIM0900Dao;
import dao.XBRLPSC0501Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;

/**
 * @companyName : Bonfire Innovation Private Limited Chennai
 * @project : Extensible Business Reporting Language (XBRL)
 * @name : XBRLFIM0900Action.java
 * @path : action
 * @author : VINOTH KUMAR
 * @version : 1.0
 * @functionality : It contains the action with multiple methods to create
 *                FIM0900 Report.
 * @relatedScripts : bean.XBRLFIM0900Bean.java,dao.XBRLFIM0900Dao.java
 * @creationDate :
 * @lastModifiedDate :
 * @modificationHistory :
 * 
 */

public class XBRLFIM0900Action {

	static Logger log = Logger.getLogger(XBRLFIM0900Action.class);
	public String resalert;

	public static Logger getLog() {
		return log;
	}

	public static void setLog(Logger log) {
		XBRLFIM0900Action.log = log;
	}

	public String getResalert() {
		return resalert;
	}

	public void setResalert(String resalert) {
		this.resalert = resalert;
	}

	public String dashdata[];
	public String reporefeno;
	public String dtlFIM0900;
	public String refno;
	
	public String detFIM0900;


	public String getDetFIM0900() {
		return detFIM0900;
	}

	public void setDetFIM0900(String detFIM0900) {
		this.detFIM0900 = detFIM0900;
	}

	public String getRefno() {
		return refno;
	}

	public void setRefno(String refno) {
		this.refno = refno;
	}

	public String sumFIM0900;

	public String summaryFIM0900;

	public String getDtlFIM0900() {
		return dtlFIM0900;
	}

	public void setDtlFIM0900(String dtlFIM0900) {
		this.dtlFIM0900 = dtlFIM0900;
	}

	public String getSumFIM0900() {
		return sumFIM0900;
	}

	public void setSumFIM0900(String sumFIM0900) {
		this.sumFIM0900 = sumFIM0900;
	}

	public String getSummaryFIM0900() {
		return summaryFIM0900;
	}

	public void setSummaryFIM0900(String summaryFIM0900) {
		this.summaryFIM0900 = summaryFIM0900;
	}

	public String[] getDashdata() {
		return dashdata;
	}

	public void setDashdata(String[] dashdata) {
		this.dashdata = dashdata;
	}

	public String getReporefeno() {
		return reporefeno;
	}

	public void setReporefeno(String reporefeno) {
		this.reporefeno = reporefeno;
	}

	public String summary1FIM0900detail() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("in summary11FIM0900detail");

		log.info("test----->" + request.getParameter("reptype") + "dt333" + df.formatdate(request.getParameter("dt1"))
				+ df.formatdate(request.getParameter("dt2")));
		XBRLFIM0900Dao bsd = new XBRLFIM0900Dao();
		ArrayList<XBRLFIM0900Bean> arl = bsd.xbrl1fimsums1(request.getParameter("repname"),
				request.getParameter("ReporefSeq"), request.getParameter("instno"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),
				request.getParameter("curr"));

		// summarystandard = arl.toArray(new String[arl.size()]);
		log.info("ARL------------>" + arl.size());
		Gson gson = new Gson();
		sumFIM0900 = gson.toJson(arl);

		return "success";

	}

	public String detailFIM0900() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();

		XBRLFIM0900Dao bsd = new XBRLFIM0900Dao();

		ArrayList<XBRLFIM0900Bean> arl = bsd.xbrlfim0900details(request.getParameter("reptype"),
				request.getParameter("ReporefSeq"), request.getParameter("instno"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),
				request.getParameter("curr"));
		// summarystandard = arl.toArray(new String[arl.size()]);

		Gson gson = new Gson();
		dtlFIM0900 = gson.toJson(arl);

		return "success";

	}

	public String modXbFIMCreate900() throws SQLException {

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
/*
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

		}*/
		log.info("===ReporefSeq===" + ReporefSeq);
		// log.info("<< EIDSeq >> " + EIDSeq);
		/*session.setAttribute("ReprefSeq", ReporefSeq);

		int rs = 0;

		int count = 0;

		StringBuffer sql = new StringBuffer();

		// HttpSession session = request.getSession();
		log.info("insert Action modXbFIMCreate900");

		log.info("NEW FLG:" + newFlg);

		// for Inserting new record

		// for new Reference id
		if (newFlg.equals('Y'))

		{

			sql.append(
					"INSERT INTO FIM0900_MOD_TABLE(REPORT_REF_NO,TRAN_DATE,TRAN_ID,TRAN_TYPE,TRAN_METHOD,TRAN_AMOUNT,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
							+ "values('" + ReporefSeq + "','" + df1.formatdate(request.getParameter("trana")) + "','"
							+ request.getParameter("traid") + "','" + request.getParameter("tantyp") + "','"
							+ request.getParameter("trame") + "','" + request.getParameter("traam") + "','"
							+ df1.formatdate(request.getParameter("repdat")) + "','" + session.getAttribute("userName")
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

			log.info("executeUIUFDJJFGFUDFUDGJd");
			refno = ReporefSeq;

		}

		// for old Reference id
		else {*/

			int rowcount = 0;

			/*
			 * sql.append(
			 * "SELECT COUNT (*) as cnt FROM   (SELECT DISTINCT REPORT_DATE FROM  BLS0106_MOD_TABLE where REPORT_REF_NO='"
			 * + ReporefSeq.trim() + "' and ACCT_NUMBER = '" +
			 * request.getParameter("accno") + "'  and REPORT_DATE >='" +
			 * df1.formatdate(request.getParameter("dt2"))+"')");
			 */
			sql3.append(
					"SELECT Count (*) as count FROM   (SELECT DISTINCT REPORT_DATE FROM  FIM0900_MOD_TABLE where REPORT_REF_NO='"
							+ ReporefSeq.trim() + "'and TRAN_ID = '" + request.getParameter("traid")
							+ "'and TRAN_METHOD = '" + request.getParameter("trame") + "'and REPORT_DATE ='"
							+ df1.formatdate(request.getParameter("repdat")) + "')");

			try {
				log.info(sql3.toString());
				ps = conn.prepareStatement(sql3.toString());
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

			int rs;
			if (rowcount > 0) {

				log.info("INSDIE UPDATE");

				sql2.append("update  FIM0900_MOD_TABLE set REPORT_REF_NO ='" + ReporefSeq + "',TRAN_AMOUNT ='"
						+ NullCheck.isNotNull(request.getParameter("traam")) + "' where TRAN_ID ='"
						+ NullCheck.isNotNull(request.getParameter("traid")) + "'and REPORT_DATE ='"
						+ df1.formatdate(request.getParameter("repdat")) + "'");
				log.info(sql2.toString() + "Gayu");

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
						"INSERT INTO FIM0900_MOD_TABLE(REPORT_REF_NO,TRAN_DATE,TRAN_ID,TRAN_TYPE,TRAN_METHOD,TRAN_AMOUNT,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
								+ "values('" + ReporefSeq + "','" + df1.formatdate(request.getParameter("trana"))
								+ "','" + request.getParameter("traid") + "','" + request.getParameter("tantyp") + "','"
								+ request.getParameter("trame") + "','" + request.getParameter("traam") + "','"
								+ df1.formatdate(request.getParameter("repdat")) + "','"
								+ session.getAttribute("userName") + "',SYSDATE)");
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

		

return "success";
//return status;
	}

	
	public String FIM0900verify() {
		log.info("ddddddddddd");
			XBRLFIM0900Dao bsd = new XBRLFIM0900Dao();
			ArrayList<XBRLFIM0900Bean> arr=new ArrayList<XBRLFIM0900Bean>();
			arr=bsd.FIM0900verify();
			Gson gson = new Gson();
			detFIM0900 = gson.toJson(arr);
			return "success";
		}public String FIM0900vermaster() {
			String status="";
			XBRLFIM0900Dao bsd = new XBRLFIM0900Dao();
			HttpServletRequest request = ServletActionContext.getRequest();
			status=bsd.FIM0900verifymaster();
			if(status.equals("success")) {
				resalert="Verification Successful";
			}else {
				resalert="Technical Issue.Try Again Later.";
			}
			
			return "success";
		}

	
}
