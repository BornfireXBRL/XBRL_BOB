package action;
/****************************************************************************************************************
*																												*
* 	* @companyName 			:	Bonfire Innovation Private Limited Chennai										*
* 	* @project 				:	Extensible Business Reporting Language (XBRL)									*
* 	* @name 				:	XBRLPSC0103Action.java															*
* 	* @path 				:	action																			*
* 	* @author 				:	S Gayathiri																	*
* 	* @version 				: 	1.0																				*
* 	* @functionality 		:	It contains the action with multiple methods to create SUP01400 Report.													*
* 	* @relatedScripts 		: 	bean.XBRLSUP1400Bean.java,dao.XBRLSUP1400Dao.java 								*
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
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;
import basecode.DateFormat;
import bean.XBRLPSC0103Bean;
import bean.XBRLPSC0103Bean;
import dao.XBRLPSC0103Dao;
import dao.XBRLPSC0103Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;

import org.apache.log4j.Logger;

public class XBRLPSC0103Action {
	static Logger log = Logger.getLogger(XBRLPSC0103Action.class);
	public String sec1PSC0103;
	public String sec1PSC0103s2;
	public String resalert;
	public String detPSC0103;

	public String getResalert() {
		return resalert;
	}

	public void setResalert(String resalert) {
		this.resalert = resalert;
	}

	public String getDetPSC0103() {
		return detPSC0103;
	}

	public void setDetPSC0103(String detPSC0103) {
		this.detPSC0103 = detPSC0103;
	}

	public String sec1PSC0103d1;

	public void setSec1PSC0103(String sec1PSC0103) {
		sec1PSC0103 = sec1PSC0103;
	}

	public void setSec1PSC0103s2(String sec1PSC0103s2) {
		sec1PSC0103s2 = sec1PSC0103s2;
	}

	public String getSec1PSC0103d1() {
		return sec1PSC0103d1;
	}

	public void setSec1PSC0103d1(String sec1PSC0103d1) {
		sec1PSC0103d1 = sec1PSC0103d1;
	}

	public String getSec1PSC0103s2() {
		return sec1PSC0103s2;
	}

	public String getSec1PSC0103() {
		return sec1PSC0103;
	}

	public String refno;

	public String getRefno() {
		return refno;
	}

	public void setRefno(String refno) {
		this.refno = refno;
	}

	public String section1PSC0103() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside PSC0103 action");

		XBRLPSC0103Dao bsd = new XBRLPSC0103Dao();

		ArrayList<XBRLPSC0103Bean> arl = bsd.xbrlPSC0103(request.getParameter("repname"),
				request.getParameter("instno"), request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),
				request.getParameter("curr"));

		Gson gson = new Gson();
		sec1PSC0103 = gson.toJson(arl);

		return "success";

	}

	public String section2PSC0103() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside PSC0103 action");

		XBRLPSC0103Dao bsd = new XBRLPSC0103Dao();

		ArrayList<XBRLPSC0103Bean> arl = bsd.xbrlPSC0103s2(request.getParameter("repname"),
				request.getParameter("instno"), request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),
				request.getParameter("curr"));

		Gson gson = new Gson();
		sec1PSC0103s2 = gson.toJson(arl);

		return "success";

	}

	public String detsec1PSC0103() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside PSC0103 action");

		XBRLPSC0103Dao bsd = new XBRLPSC0103Dao();

		ArrayList<XBRLPSC0103Bean> arl = bsd.xbrlPSC0103d1(request.getParameter("repname"),
				request.getParameter("instno"), request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),
				request.getParameter("curr"));

		Gson gson = new Gson();
		sec1PSC0103d1 = gson.toJson(arl);

		return "success";

	}

	public String modXbPSCCreate103() throws SQLException {

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
		/*log.info("===" + request.getParameter("reportrefno"));

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
*/		session.setAttribute("ReprefSeq", ReporefSeq);

		int rs = 0;

		int count = 0;

		StringBuffer sql = new StringBuffer();

		// HttpSession session = request.getSession();
		log.info("insert Action modXbCreateBLS0100");

		
		// for Inserting new record

		// for new Reference id
		/*if (newFlg.equals('Y'))

		{
			sql.append(
					"INSERT INTO PSC0103_MOD_TABLE(REPORT_REF_NO,ACCT_NUMBER,ACCT_NAME,SECURED_FLG,SANCTION_AMT,OUTSTANDING_AMT,INT_TYPE,INTEREST_RATE,PRIM_SECURITY_FLG,OTH_RESIDENT_FLG,OTH_ASSET_FLG,IS_ACCT_DELINQUENT,IS_ACCT_FORECLOSED,ACCT_FORECLOSED_DATE,ACCT_OPN_DATE,INTEREST_AMOUNT,MON_INT_AMOUNT,SCHM_CODE,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
							+ "values('" + ReporefSeq + "','" + request.getParameter("acctno") + "','"
							+ request.getParameter("acctname") + "','" + request.getParameter("secflag") + "','"
							+ request.getParameter("sancamt") + "','" + request.getParameter("outamt") + "','"
							+ request.getParameter("inttyp") + "','" + request.getParameter("intrate") + "','"
							+ request.getParameter("primsecflg") + "','" + request.getParameter("otherresflg") + "','"
							+ request.getParameter("othrassflg") + "','" + request.getParameter("isacdel") + "','"
							+ request.getParameter("isacfor") + "','" + df1.formatdate(request.getParameter("acfordat"))
							+ "','" + df1.formatdate(request.getParameter("acopndat")) + "','"
							+ request.getParameter("intamt") + "','" + request.getParameter("moninamt") + "','"
							+ request.getParameter("scode") + "','" + df1.formatdate(request.getParameter("repdate"))
							+ "','" + session.getAttribute("userName") + "',SYSDATE)");
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
			sql.append("SELECT COUNT(*) as count FROM PSC0103_MOD_TABLE WHERE REPORT_DATE='" + df1.formatdate(request.getParameter("repdate")) + "' "
					+ "AND ACCT_NUMBER='" + request.getParameter("acctno") + "' ");
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

				sql2.append("update PSC0103_MOD_TABLE set ACCT_NAME ='" + request.getParameter("acctname")
						+ "',SECURED_FLG ='" + request.getParameter("secflag") + "',SANCTION_AMT ='"
						+ request.getParameter("sancamt") + "',OUTSTANDING_AMT ='" + request.getParameter("outamt")
						+ "',INT_TYPE ='" + request.getParameter("inttyp") + "',INTEREST_RATE ='"
						+ request.getParameter("intrate") + "',PRIM_SECURITY_FLG ='"
						+ request.getParameter("primsecflg") + "',OTH_RESIDENT_FLG ='"
						+ request.getParameter("otherresflg") + "',OTH_ASSET_FLG ='"
						+ request.getParameter("othrassflg") + "',IS_ACCT_DELINQUENT ='"
						+ request.getParameter("isacdel") + "',IS_ACCT_FORECLOSED ='" + request.getParameter("isacfor")
						+ "',ACCT_FORECLOSED_DATE ='" + df1.formatdate(request.getParameter("acfordat"))
						+ "',ACCT_OPN_DATE ='" + df1.formatdate(request.getParameter("acopndat"))
						+ "',INTEREST_AMOUNT ='" + request.getParameter("intamt") + "',MON_INT_AMOUNT ='"
						+ request.getParameter("moninamt") + "',SCHM_CODE ='" + request.getParameter("scode") + "',DEL_FLG='M'"
						+ "WHERE REPORT_DATE='"
						+ df1.formatdate(request.getParameter("repdate")) + "' " + "AND ACCT_NUMBER='"
						+ request.getParameter("acctno") + "'");

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
						"INSERT INTO PSC0103_MOD_TABLE(REPORT_REF_NO,ACCT_NUMBER,ACCT_NAME,SECURED_FLG,SANCTION_AMT,OUTSTANDING_AMT,"
						+ "INT_TYPE,INTEREST_RATE,PRIM_SECURITY_FLG,OTH_RESIDENT_FLG,OTH_ASSET_FLG,IS_ACCT_DELINQUENT,IS_ACCT_FORECLOSED,ACCT_FORECLOSED_DATE,"
						+ "ACCT_OPN_DATE,INTEREST_AMOUNT,MON_INT_AMOUNT,SCHM_CODE,REPORT_DATE,DEL_FLG,LCHG_USER_ID,LCHG_TIME)"
								+ "values('" + ReporefSeq + "','" + request.getParameter("acctno") + "','"
								+ request.getParameter("acctname") + "','" + request.getParameter("secflag") + "','"
								+ request.getParameter("sancamt") + "','" + request.getParameter("outamt") + "','"
								+ request.getParameter("inttyp") + "','" + request.getParameter("intrate") + "','"
								+ request.getParameter("primsecflg") + "','" + request.getParameter("otherresflg")
								+ "','" + request.getParameter("othrassflg") + "','" + request.getParameter("isacdel")
								+ "','" + request.getParameter("isacfor") + "','"
								+ df1.formatdate(request.getParameter("acfordat")) + "','"
								+ df1.formatdate(request.getParameter("acopndat")) + "','"
								+ request.getParameter("intamt") + "','" + request.getParameter("moninamt") + "','"
								+ request.getParameter("scode") + "','"
								+ df1.formatdate(request.getParameter("repdate")) + "','"
								+ request.getParameter("modtyp") + "','"
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

		/*}*/
		log.info("executeee Gayu");
		// return "success";
		return status;
	}

	public String detailPSC0103saves() {

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
	public String psc0103verify() {
		log.info("ddddddddddd");
			XBRLPSC0103Dao bsd = new XBRLPSC0103Dao();
			ArrayList<XBRLPSC0103Bean> arr=new ArrayList<XBRLPSC0103Bean>();
			arr=bsd.PSC0103verify();
			Gson gson = new Gson();
			detPSC0103 = gson.toJson(arr);
			return "success";
		}
		public String PSC0103vermaster() {
			String status="";
			XBRLPSC0103Dao bsd = new XBRLPSC0103Dao();
			HttpServletRequest request = ServletActionContext.getRequest();
			status=bsd.PSC0103verifymaster();
			
			if(status.equals("success")) {
				resalert="Verification Successful";
			}else {
				resalert="Technical Issue.Try Again Later.";
			}
			
			return "success";
		}
		
		
		
		

}
