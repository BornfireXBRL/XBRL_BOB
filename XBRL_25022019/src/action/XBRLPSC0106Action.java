package action;

import java.sql.CallableStatement;
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
import bean.XBRLPSC0106Bean;
import bean.XBRLPSC0030Bean;
import bean.XBRLPSC0102Bean;
import dao.XBRLPSC0106Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;
import dao.XBRLPSC0030Dao;
import dao.XBRLPSC0102Dao;

import org.apache.log4j.Logger;
public class XBRLPSC0106Action {
	
	static Logger log = Logger.getLogger(XBRLPSC0106Action.class);

	
	public String resalert;

	
	public static Logger getLog() {
		return log;
	}

	public static void setLog(Logger log) {
		XBRLPSC0106Action.log = log;
	}

	public String getResalert() {
		return resalert;
	}

	public void setResalert(String resalert) {
		this.resalert = resalert;
	}

	
	public String detpsc0106;

	
	public String getDetpsc0106() {
		return detpsc0106;
	}

	public void setDetpsc0106(String detpsc0106) {
		this.detpsc0106 = detpsc0106;
	}


	public String sec1PSC00106;
	public String detailsPSC0106;

	public String getDetailsPSC0106() {
		return detailsPSC0106;
	}

	public void setDetailsPSC0106(String detailsPSC0106) {
		this.detailsPSC0106 = detailsPSC0106;
	}

	public String getSec1PSC00106() {
		return sec1PSC00106;
	}

	public void setSec1PSC00106(String sec1psc00106) {
		sec1PSC00106 = sec1psc00106;
	}

	public String refno;

	public String getRefno() {
		return refno;
	}

	public void setRefno(String refno) {
		this.refno = refno;
	}

	public String sectionPSC0106() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside psc20 action");

		XBRLPSC0106Dao bsd = new XBRLPSC0106Dao();

		ArrayList<XBRLPSC0106Bean> arl = bsd.xbrlpsc0106(request.getParameter("repname"),
				request.getParameter("instno"), request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),
				request.getParameter("curr"));

		Gson gson = new Gson();
		sec1PSC00106 = gson.toJson(arl);

		return "success";

	}

	public String PSC0106details() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside psc20 details");

		XBRLPSC0106Dao bsd = new XBRLPSC0106Dao();

		ArrayList<XBRLPSC0106Bean> arl = bsd.xbrlpsc0106details(request.getParameter("repname"),
				request.getParameter("instno"), request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),
				request.getParameter("curr"));

		Gson gson = new Gson();
		detailsPSC0106 = gson.toJson(arl);

		return "success";

	}

	public String modXbPSCCreate106() throws SQLException {

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

		/*if (request.getParameter("reportrefno").startsWith("R")) {

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
		session.setAttribute("ReprefSeq", ReporefSeq);

		int rs = 0;

		int count = 0;

		StringBuffer sql = new StringBuffer();

		// HttpSession session = request.getSession();
		log.info("insert Action modXbCreateBLS0100");

		/*log.info("NEW FLG:" + newFlg);

		// for Inserting new record

		// for new Reference id
		if (newFlg.equals('Y'))

		{

			log.info(df1.formatdate(request.getParameter("rendat")));
			sql.append(
					"INSERT INTO PSC0105_S1_MOD_TABLE(REPORT_REF_NO,ACCT_NUMBER,ACCT_NAME,SCHM_CODE,SCHM_TYPE,ISIC_CODE,SME_FLG,OUTSTANDING_AMT,IMPAIRED_FLAG,ACCT_OPN_DATE,RENEWAL_DATE,SECURITY_FLG,RESTRUCTURED_FLG,SANCTION_AMT,ACCT_CRNCY_CODE,RESTRUCTURED_DATE,REPORT_DATE,LCHG_USER_ID,LCHG_TIME )"
							+ "values('" + ReporefSeq + "','" + NullCheck.isNotNull(request.getParameter("accno"))
							+ "','" + NullCheck.isNotNull(request.getParameter("acnam")) + "','"
							+ NullCheck.isNotNull(request.getParameter("scode")) + "','"
							+ NullCheck.isNotNull(request.getParameter("stype")) + "','"
							+ NullCheck.isNotNull(request.getParameter("iscode")) + "','"
							+ NullCheck.isNotNull(request.getParameter("sflag")) + "','"
							+ NullCheck.isNotNull(request.getParameter("outamt")) + "','"
							+ NullCheck.isNotNull(request.getParameter("impflg")) + "','"
							+ df1.formatdate(request.getParameter("accopndat")) + "','"
							+ df1.formatdate(request.getParameter("rendat")) + "','"
							+ NullCheck.isNotNull(request.getParameter("secflg")) + "','"
							+ NullCheck.isNotNull(request.getParameter("reflg")) + "','"

							+ NullCheck.isNotNull(request.getParameter("sanamt")) + "','"
							+ NullCheck.isNotNull(request.getParameter("acccrcode")) + "','"
							+ df1.formatdate(request.getParameter("resdat")) + "','"
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

			log.info("executed");
			refno = ReporefSeq;

		}

		// for old Reference id
		else {
*/
			int rowcount = 0;
			sql.append("SELECT COUNT(*) as count FROM PSC0105_S1_MOD_TABLE WHERE  REPORT_DATE='" + df1.formatdate(request.getParameter("repdat")) + "' "
					+ "AND ACCT_NUMBER='" + request.getParameter("accno") + "' ");
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

				sql2.append("update PSC0105_S1_MOD_TABLE set ACCT_NAME ='" + request.getParameter("acnam")
						+ "',SCHM_CODE ='" + request.getParameter("scode") + "',SCHM_TYPE ='"
						+ request.getParameter("stype") + "',ISIC_CODE ='" + request.getParameter("iscode")
						+ "',SME_FLG ='" + request.getParameter("sflag") + "',OUTSTANDING_AMT ='"
						+ request.getParameter("outamt") + "',IMPAIRED_FLAG ='" + request.getParameter("impflg")
						+ "',ACCT_OPN_DATE ='" + df1.formatdate(request.getParameter("accopndat")) + "',RENEWAL_DATE ='"
						+ df1.formatdate(request.getParameter("rendat")) + "',SECURITY_FLG ='"
						+ request.getParameter("secflg") + "',RESTRUCTURED_FLG ='" + request.getParameter("reflg")
						+ "',SANCTION_AMT ='" + request.getParameter("sanamt") + "',ACCT_CRNCY_CODE ='"
						+ request.getParameter("acccrcode") + "',RESTRUCTURED_DATE ='"
						+ df1.formatdate(request.getParameter("resdat"))+"',DEL_FLG='M' "
						+ "WHERE REPORT_DATE='" + df1.formatdate(request.getParameter("repdat")) 
						+ "'AND ACCT_NUMBER='" + request.getParameter("accno") + "'");
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
						"INSERT INTO PSC0105_S1_MOD_TABLE(REPORT_REF_NO,ACCT_NUMBER,ACCT_NAME,SCHM_CODE,SCHM_TYPE,ISIC_CODE,SME_FLG,OUTSTANDING_AMT,IMPAIRED_FLAG,ACCT_OPN_DATE,RENEWAL_DATE,SECURITY_FLG,RESTRUCTURED_FLG,SANCTION_AMT,ACCT_CRNCY_CODE,RESTRUCTURED_DATE,REPORT_DATE,DEL_FLG,LCHG_USER_ID,LCHG_TIME )"
								+ "values('" + ReporefSeq + "','" + NullCheck.isNotNull(request.getParameter("accno"))+ "','"
								+ NullCheck.isNotNull(request.getParameter("acnam")) + "','"
								+ NullCheck.isNotNull(request.getParameter("scode")) + "','"
								+ NullCheck.isNotNull(request.getParameter("stype")) + "','"
								+ NullCheck.isNotNull(request.getParameter("iscode")) + "','"
								+ NullCheck.isNotNull(request.getParameter("sflag")) + "','"
								+ NullCheck.isNotNull(request.getParameter("outamt")) + "','"
								+ NullCheck.isNotNull(request.getParameter("impflg")) + "','"
								+ df1.formatdate(request.getParameter("accopndat")) + "','"
								+ df1.formatdate(request.getParameter("rendat")) + "','"
								+ NullCheck.isNotNull(request.getParameter("secflg")) + "','"
								+ NullCheck.isNotNull(request.getParameter("reflg")) + "','"

								+ NullCheck.isNotNull(request.getParameter("sanamt")) + "','"
								+ NullCheck.isNotNull(request.getParameter("acccrcode")) + "','"
								+ df1.formatdate(request.getParameter("resdat")) + "','"
								+ df1.formatdate(request.getParameter("repdat")) + "','"
								+request.getParameter("modtyp")+ "','" + session.getAttribute("userName")
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
				
			}

			log.info(status);

		//return "success";
	return status;
	}


public String detailpsc0106saves() {

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

	
	public String PSC0106verify() {
		log.info("ddddddddddd");
			XBRLPSC0106Dao bsd = new XBRLPSC0106Dao();
			ArrayList<XBRLPSC0106Bean> arr=new ArrayList<XBRLPSC0106Bean>();
			arr=bsd.PSC0106verify();
			Gson gson = new Gson();
			detpsc0106 = gson.toJson(arr);
			return "success";
		}public String PSC0106vermaster() {
			String status="";
			XBRLPSC0106Dao bsd = new XBRLPSC0106Dao();
			HttpServletRequest request = ServletActionContext.getRequest();
			status=bsd.PSC0106verifymaster();
			System.out.println("gj");
			if(status.equals("success")) {
				resalert="Verification Successful";
			}else {
				resalert="Technical Issue.Try Again Later.";
			}
			
			return "success";
		}

	
	
	
	
	
}
