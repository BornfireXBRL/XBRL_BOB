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
import bean.XBRLFIM0100Bean;
import bean.XBRLFIM0100Bean;
import dao.XBRLFIM0100Dao;
import dao.XBRLFIM0100Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;

import org.apache.log4j.Logger;

/**
 * @companyName   : Bonfire Innovation Private Limited Chennai
 * @project       : Extensible Business Reporting Language (XBRL)
 * @name          : XBRLFIM0100Action.java
 * @path          : action
 * @author        : S Gayathiri
 * @version       : 1.0
 * @functionality : It contains the action with multiple methods to create
 *                  FIM0100 Report.
 * @relatedScripts: bean.XBRLFIM0100Bean.java,dao.XBRLFIM0100Dao.java
 * @creationDate  : 
 * @lastModifiedDate : 19-02-2019
 * @modificationHistory : 
 * 
 */

public class XBRLFIM0100Action {

	static Logger log = Logger.getLogger(XBRLFIM0100Action.class);

	public String dashdata[];
	public String reporefeno;
	public String dtlFIM0100;
	public String refno;
	public String detFIM0100;
	public String resalert;

	public String getResalert() {
		return resalert;
	}

	public void setResalert(String resalert) {
		this.resalert = resalert;
	}

	public String getDetFIM0100() {
		return detFIM0100;
	}

	public void setDetFIM0100(String detFIM0100) {
		this.detFIM0100 = detFIM0100;
	}

	public String getRefno() {
		return refno;
	}

	public void setRefno(String refno) {
		this.refno = refno;
	}

	public String getDtlFIM0100() {
		return dtlFIM0100;
	}

	public void setDtlFIM0100(String dtlFIM0100) {
		this.dtlFIM0100 = dtlFIM0100;
	}

	public String sumFIM0100;

	public String getSumFIM0100() {
		return sumFIM0100;
	}

	public void setSumFIM0100(String sumFIM0100) {
		this.sumFIM0100 = sumFIM0100;
	}

	public String summaryFIM0100;

	public String getSummaryFIM0100() {
		return summaryFIM0100;
	}

	public void setSummaryFIM0100(String summaryFIM0100) {
		this.summaryFIM0100 = summaryFIM0100;
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

	public String summary1FIM0100detail() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("in summaryFIM0100detail");

		log.info("test----->" + request.getParameter("reportrefnos") + "dt333"
				+ df.formatdate(request.getParameter("dt1")) + df.formatdate(request.getParameter("dt2")));
		XBRLFIM0100Dao bsd = new XBRLFIM0100Dao();
		ArrayList<XBRLFIM0100Bean> arl = bsd.xbrl1fimsumEP(df.formatdate(request.getParameter("dt1")),
				df.formatdate(request.getParameter("dt2")), request.getParameter("reportrefnos"),
				request.getParameter("curr"));

		// summarystandard = arl.toArray(new String[arl.size()]);
		log.info("ARL------------>" + arl.size());
		Gson gson = new Gson();
		sumFIM0100 = gson.toJson(arl);

		return "success";

	}

	public String summaryFIM0100detail() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("in summaryFIM0100detail");

		log.info("test----->" + request.getParameter("reportrefnos") + "dt333"
				+ df.formatdate(request.getParameter("dt1")) + df.formatdate(request.getParameter("dt2")));
		XBRLFIM0100Dao bsd = new XBRLFIM0100Dao();
		ArrayList<XBRLFIM0100Bean> arl = bsd.xbrlfimsumEP(df.formatdate(request.getParameter("dt1")),
				df.formatdate(request.getParameter("dt2")), request.getParameter("reportrefnos"),
				request.getParameter("curr"));

		// summarystandard = arl.toArray(new String[arl.size()]);
		log.info("ARL------------>" + arl.size());
		Gson gson = new Gson();
		summaryFIM0100 = gson.toJson(arl);

		return "success";

	}

	public String detailFIM0100() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();

		XBRLFIM0100Dao bsd = new XBRLFIM0100Dao();

		ArrayList<XBRLFIM0100Bean> arl = bsd.xbrlfimajaxdetails(request.getParameter("repname"),
				request.getParameter("ReporefSeq"), request.getParameter("instno"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),
				request.getParameter("curr"));

		// summarystandard = arl.toArray(new String[arl.size()]);

		Gson gson = new Gson();
		dtlFIM0100 = gson.toJson(arl);
		log.info("hhgghh");
		return "success";

	}

	public String modXbBLSCreate100() throws SQLException {

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
		/*
		 * log.info("===" + request.getParameter("reportrefno"));
		 * 
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
		 * } log.info("===ReporefSeq===" + ReporefSeq);
		 */
		// log.info("<< EIDSeq >> " + EIDSeq);
		session.setAttribute("ReprefSeq", ReporefSeq);

		int rs = 0;

		int count = 0;

		StringBuffer sql = new StringBuffer();

		// HttpSession session = request.getSession();
		log.info("insert Action modXbCreateBLS0100");

		/* log.info("NEW FLG:" + newFlg); */

		// for Inserting new record

		// for new Reference id
		/*
		 * if (newFlg.equals('Y'))
		 * 
		 * {
		 * 
		 * sql.
		 * append("INSERT INTO FIM0100_MOD_TABLE(REPORT_REF_NO,INSTITUTE_NAME,INSTITUTE_CODE,TRAN_NATURE,TRAN_CRNCY,TRAN_TYPE,INT_START_DATE,INT_END_DATE,TRAN_AMT,INT_RATE,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
		 * +"values('" + ReporefSeq + "','" + request.getParameter("institname") + "','"
		 * + request.getParameter("institcode") + "','" +
		 * request.getParameter("trannature") + "','" +
		 * request.getParameter("trancrcny") + "','" + request.getParameter("trantype")
		 * + "','" + df1.formatdate(request.getParameter("intstadate")) + "','"+
		 * df1.formatdate(request.getParameter("intenddate")) + "','" +
		 * request.getParameter("tranamt") + "','"+ request.getParameter("intrate") +
		 * "','" +df1.formatdate(request.getParameter("rptdate"))+ "','" +
		 * session.getAttribute("userName") + "',SYSDATE)");
		 * 
		 * log.info(sql);
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
		sql.append("SELECT COUNT(*) as count FROM FIM0100_MOD_TABLE WHERE  REPORT_DATE='"
				+ df1.formatdate(request.getParameter("rptdate")) + "' " + "AND INSTITUTE_NAME='"
				+ request.getParameter("institname") + "' ");
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
			sql2.append("UPDATE FIM0100_MOD_TABLE SET INSTITUTE_CODE='" + request.getParameter("institcode")
					+ "', TRAN_NATURE ='" + request.getParameter("trannature") + "', TRAN_CRNCY='"
					+ request.getParameter("trancrcny") + "', TRAN_TYPE ='" + request.getParameter("trantype")
					+ "', INT_START_DATE ='" + df1.formatdate(request.getParameter("intstadate")) + "', INT_END_DATE ='"
					+ df1.formatdate(request.getParameter("intenddate")) + "', TRAN_AMT  ='"
					+ request.getParameter("tranamt") + "', INT_RATE='" + request.getParameter("intrate")
					+ "', DEL_FLG='M' " + " WHERE  REPORT_DATE='" + df1.formatdate(request.getParameter("rptdate"))
					+ "' " + " AND INSTITUTE_NAME='" + request.getParameter("institname") + "'");

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
					"INSERT INTO FIM0100_MOD_TABLE(REPORT_REF_NO,INSTITUTE_NAME,INSTITUTE_CODE,TRAN_NATURE,"
					+ "TRAN_CRNCY,TRAN_TYPE,INT_START_DATE,INT_END_DATE,TRAN_AMT,INT_RATE,REPORT_DATE,DEL_FLG,"
					+ "LCHG_USER_ID,LCHG_TIME)"
							+ "values('" + ReporefSeq + "','" + request.getParameter("institname") + "','"
							+ request.getParameter("institcode") + "','" + request.getParameter("trannature") + "','"
							+ request.getParameter("trancrcny") + "','" + request.getParameter("trantype") + "','"
							+ df1.formatdate(request.getParameter("intstadate")) + "','"
							+ df1.formatdate(request.getParameter("intenddate")) + "','"
							+ request.getParameter("tranamt") + "','" + request.getParameter("intrate") + "','"
							+ df1.formatdate(request.getParameter("rptdate")) + "','" + request.getParameter("modtyp")
							+ "','" + session.getAttribute("userName") + "',SYSDATE)");
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

		// }

		// return "success";
		return status;
	}

	public String fim0100verify() {
		log.info("ddddddddddd");
		XBRLFIM0100Dao bsd = new XBRLFIM0100Dao();
		ArrayList<XBRLFIM0100Bean> arr = new ArrayList<XBRLFIM0100Bean>();
		arr = bsd.FIM0100verify();
		Gson gson = new Gson();
		detFIM0100 = gson.toJson(arr);
		return "success";
	}

	public String FIM0100vermaster() {
		String status = "";
		XBRLFIM0100Dao bsd = new XBRLFIM0100Dao();
		HttpServletRequest request = ServletActionContext.getRequest();
		status = bsd.FIM0100verifymaster();

		if (status.equals("success")) {
			resalert = "Verification Successful";
		} else {
			resalert = "Technical Issue.Try Again Later.";
		}

		return "success";
	}

}
