
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

import bean.XBRLPSC0104Bean;

import dao.XBRLPSC0104Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;

public class XBRLPSC0104Action {

	static Logger log = Logger.getLogger(XBRLPSC0104Action.class);
	public String sec1PSC0104;
	public String sec1PSC0104s2;
	public String sec1PSC0104s3;
	
	
	public String det1PSC0104;
	public String det2PSC0104;
	public String det3PSC0104;
	
	public String getSec1PSC0104() {
		return sec1PSC0104;
	}

	public void setSec1PSC0104(String sec1psc0104) {
		sec1PSC0104 = sec1psc0104;
	}

	public String getSec1PSC0104s2() {
		return sec1PSC0104s2;
	}

	public void setSec1PSC0104s2(String sec1psc0104s2) {
		sec1PSC0104s2 = sec1psc0104s2;
	}

	public String getSec1PSC0104s3() {
		return sec1PSC0104s3;
	}

	public void setSec1PSC0104s3(String sec1psc0104s3) {
		sec1PSC0104s3 = sec1psc0104s3;
	}

	public String getDet1PSC0104() {
		return det1PSC0104;
	}

	public void setDet1PSC0104(String detPSC0104) {
		this.det1PSC0104 = detPSC0104;
	}
	public String getDet2PSC0104() {
		return det2PSC0104;
	}

	public void setDet2PSC0104(String detPSC0104) {
		this.det2PSC0104 = detPSC0104;
	}
	public String getDet3PSC0104() {
		return det3PSC0104;
	}

	public void setDet3PSC0104(String detPSC0104) {
		this.det3PSC0104 = detPSC0104;
	}

	public String refno;
	
	
	
	
	public String getRefno() {
		return refno;
	}

	public void setRefno(String refno) {
		this.refno = refno;
	}

	
	
	public String section1PSC0104() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside psc0200 action");
		
		XBRLPSC0104Dao bsd = new XBRLPSC0104Dao();

		ArrayList<XBRLPSC0104Bean> arl = bsd.xbrlpsc0104(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1PSC0104 = gson.toJson(arl);

		return "success";

	}
	
	public String section2PSC0104() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside psc02002 action");
		
		XBRLPSC0104Dao bsd = new XBRLPSC0104Dao();

		ArrayList<XBRLPSC0104Bean> arl = bsd.xbrlpsc0104s2(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1PSC0104s2 = gson.toJson(arl);

		return "success";

	}
	
	public String section3PSC0104() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside psc02003 action");
		
		XBRLPSC0104Dao bsd = new XBRLPSC0104Dao();

		ArrayList<XBRLPSC0104Bean> arl = bsd.xbrlpsc0104s3(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1PSC0104s3 = gson.toJson(arl);

		return "success";

	}
	
	
	public String detail1PSC0104() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		
		
		XBRLPSC0104Dao bsd = new XBRLPSC0104Dao();

		/*ArrayList<XBRLFIM0900Bean> arl = bsd.xbrlfim0900ajaxdetails(request.getParameter("repname"),request.getParameter("ReporefSeq"),
				request.getParameter("instno"),df.formatdate(request.getParameter("dt1")),df.formatdate(request.getParameter("dt2")), request.getParameter("curr"));*/

		ArrayList<XBRLPSC0104Bean> arl = bsd.xbrlpsc0104ajaxdetails1(request.getParameter("repname"),request.getParameter("ReporefSeq"),
				request.getParameter("instno"),df.formatdate(request.getParameter("dt2")), request.getParameter("curr"));
		
		// summarystandard = arl.toArray(new String[arl.size()]);
		
		Gson gson = new Gson();
		det1PSC0104 = gson.toJson(arl);

		return "success";

	}	
	
	public String detail2PSC0104() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		
		
		XBRLPSC0104Dao bsd = new XBRLPSC0104Dao();

		/*ArrayList<XBRLFIM0900Bean> arl = bsd.xbrlfim0900ajaxdetails(request.getParameter("repname"),request.getParameter("ReporefSeq"),
				request.getParameter("instno"),df.formatdate(request.getParameter("dt1")),df.formatdate(request.getParameter("dt2")), request.getParameter("curr"));*/

		ArrayList<XBRLPSC0104Bean> arl = bsd.xbrlpsc0104ajaxdetails2(request.getParameter("repname"),request.getParameter("ReporefSeq"),
				request.getParameter("instno"),df.formatdate(request.getParameter("dt2")), request.getParameter("curr"));
		
		// summarystandard = arl.toArray(new String[arl.size()]);
		
		Gson gson = new Gson();
		det2PSC0104 = gson.toJson(arl);

		return "success";

	}	
	
	
	public String detail3PSC0104() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		
		
		XBRLPSC0104Dao bsd = new XBRLPSC0104Dao();

		/*ArrayList<XBRLFIM0900Bean> arl = bsd.xbrlfim0900ajaxdetails(request.getParameter("repname"),request.getParameter("ReporefSeq"),
				request.getParameter("instno"),df.formatdate(request.getParameter("dt1")),df.formatdate(request.getParameter("dt2")), request.getParameter("curr"));*/

		ArrayList<XBRLPSC0104Bean> arl = bsd.xbrlpsc0104ajaxdetails3(request.getParameter("repname"),request.getParameter("ReporefSeq"),
				request.getParameter("instno"),df.formatdate(request.getParameter("dt2")), request.getParameter("curr"));
		
		// summarystandard = arl.toArray(new String[arl.size()]);
		
		Gson gson = new Gson();
		det3PSC0104 = gson.toJson(arl);

		return "success";

	}	
	
	public String modXbPSC1Create104() throws SQLException {

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
		log.info("insert Action modXbCreateBLS0100");

		log.info("NEW FLG:" + newFlg);

		// for Inserting new record

		// for new Reference id
		if (newFlg.equals('Y'))

		{

			
			sql.append("INSERT INTO PSC0104_S1_MOD_TABLE(REPORT_REF_NO,ISIC_CODE,FBILL_PUR_DISC,INVST_CORP_SHARES,INVST_DEBNT,INVST_COPR_BONDS,INVST_OTH_DEBTS,OS_LOANS_OUT_MUR,OS_ODS_OUT_MUR,BILLS_RECEIVABLE,NFB_FACILITY_AMT,REPORT_DATE,LCHG_USER_ID,LCHG_TIME )"
                      + "values('" + ReporefSeq + "','" + NullCheck.isNotNull(request.getParameter("cat1")) + "','" + NullCheck.isNotNull(request.getParameter("fpd1")) + "','" + NullCheck.isNotNull(request.getParameter("incosh1")) + "','"
					+ NullCheck.isNotNull(request.getParameter("indeb1")) + "','"
							+ NullCheck.isNotNull(request.getParameter("invcorbo1")) + "','"
									+ NullCheck.isNotNull(request.getParameter("invotdeb1")) + "','"
											+ NullCheck.isNotNull(request.getParameter("osloan1")) + "','"
													+ NullCheck.isNotNull(request.getParameter("osods1")) + "','"
															+ NullCheck.isNotNull(request.getParameter("billre1")) + "','"
																	+ NullCheck.isNotNull(request.getParameter("nebfac1")) + "','"
					+ NullCheck.isNotNull(df1.formatdate(request.getParameter("redate1")))+ "','" + session.getAttribute("userName")
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
			sql.append("SELECT COUNT(*) as count FROM PSC0104_S1_MOD_TABLE WHERE REPORT_REF_NO='" + ReporefSeq
					+ "' AND REPORT_DATE='" + df1.formatdate(request.getParameter("redate1")) + "' " + "AND ISIC_CODE='"
					 + request.getParameter("cat1") + "' ");
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
			
                  sql2.append("update PSC0104_S1_MOD_TABLE set FBILL_PUR_DISC ='" + request.getParameter("fpd1")
				              + "',INVST_CORP_SHARES ='" + request.getParameter("incosh1") + "',INVST_DEBNT ='"
				              + request.getParameter("indeb1") + "',INVST_COPR_BONDS ='"
				              + request.getParameter("invcorbo1") + "',INVST_OTH_DEBTS ='"
				              + request.getParameter("invotdeb1") + "',OS_LOANS_OUT_MUR ='"
				              + request.getParameter("osloan1") + "',OS_ODS_OUT_MUR ='"
				              + request.getParameter("osods1") + "',BILLS_RECEIVABLE ='"
			                  + request.getParameter("billre1") + "',NFB_FACILITY_AMT ='"
	                          + request.getParameter("nebfac1") + "'"
                              + "WHERE REPORT_REF_NO='" + ReporefSeq + "' AND REPORT_DATE='"
                                 + df1.formatdate(request.getParameter("redate1")) + "' " + "AND ISIC_CODE='"
                                   + request.getParameter("cat1")
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

				sql3.append("INSERT INTO PSC0104_S1_MOD_TABLE(REPORT_REF_NO,ISIC_CODE,FBILL_PUR_DISC,INVST_CORP_SHARES,INVST_DEBNT,INVST_COPR_BONDS,INVST_OTH_DEBTS,OS_LOANS_OUT_MUR,OS_ODS_OUT_MUR,BILLS_RECEIVABLE,NFB_FACILITY_AMT,REPORT_DATE,LCHG_USER_ID,LCHG_TIME )"
	                      + "values('" + ReporefSeq + "','" + NullCheck.isNotNull(request.getParameter("cat1")) + "','" + NullCheck.isNotNull(request.getParameter("fpd1")) + "','" + NullCheck.isNotNull(request.getParameter("incosh1")) + "','"
						+ NullCheck.isNotNull(request.getParameter("indeb1")) + "','"
								+ NullCheck.isNotNull(request.getParameter("invcorbo1")) + "','"
										+ NullCheck.isNotNull(request.getParameter("invotdeb1")) + "','"
												+ NullCheck.isNotNull(request.getParameter("osloan1")) + "','"
														+ NullCheck.isNotNull(request.getParameter("osods1")) + "','"
																+ NullCheck.isNotNull(request.getParameter("billre1")) + "','"
																		+ NullCheck.isNotNull(request.getParameter("nebfac1")) + "','"
						+ NullCheck.isNotNull(df1.formatdate(request.getParameter("redate1")))+ "','" + session.getAttribute("userName")
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
		log.info("executeee Gayu");
		//return "success";
	return status;
	}
	
	public String modXbPSC2Create104() throws SQLException {


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
		log.info("insert Action modXbCreateBLS0100");

		log.info("NEW FLG:" + newFlg);

		// for Inserting new record

		// for new Reference id
		if (newFlg.equals('Y'))

		{

			
			sql.append("INSERT INTO PSC0104_S2_MOD_TABLE(REPORT_REF_NO,LOAN_TYPE,FBILL_PUR_DISC,INVST_CORP_SHARES,INVST_DEBNT,INVST_COPR_BONDS,INVST_OTH_DEBTS,OS_LOANS_OUT_MUR,OS_ODS_OUT_MUR,BILLS_RECEIVABLE,NFB_FACILITY_AMT,REPORT_DATE,LCHG_USER_ID,LCHG_TIME  )"
			+"values('" + ReporefSeq + "','" + NullCheck.isNotNull(request.getParameter("cat2")) + "','" + NullCheck.isNotNull(request.getParameter("fpd2")) + "','" + NullCheck.isNotNull(request.getParameter("incosh2")) + "','"
					+ NullCheck.isNotNull(request.getParameter("indeb2")) + "','"
					+ NullCheck.isNotNull(request.getParameter("invcorbo2")) + "','"
					+ NullCheck.isNotNull(request.getParameter("invotdeb2")) + "','"
					+ NullCheck.isNotNull(request.getParameter("osloan2")) + "','"
					+ NullCheck.isNotNull(request.getParameter("osods2")) + "','"
					+ NullCheck.isNotNull(request.getParameter("billre2")) + "','"
					+ NullCheck.isNotNull(request.getParameter("nebfac2")) + "','"
					+ NullCheck.isNotNull(df1.formatdate(request.getParameter("redate2")))+ "','" + session.getAttribute("userName")
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
			sql.append("SELECT COUNT(*) as count FROM PSC0104_S2_MOD_TABLE WHERE REPORT_REF_NO='" + ReporefSeq
					+ "' AND REPORT_DATE='" + df1.formatdate(request.getParameter("redate2")) + "' " + "AND LOAN_TYPE='"
					 + request.getParameter("cat2") + "' ");
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
			
                  sql2.append("update PSC0104_S2_MOD_TABLE set FBILL_PUR_DISC ='" + request.getParameter("fpd2")
				              + "',INVST_CORP_SHARES ='" + request.getParameter("incosh2") + "',INVST_DEBNT ='"
				              + request.getParameter("indeb2") + "',INVST_COPR_BONDS ='"
				              + request.getParameter("invcorbo2") + "',INVST_OTH_DEBTS ='"
				              + request.getParameter("invotdeb2") + "',OS_LOANS_OUT_MUR ='"
				              + request.getParameter("osloan2") + "',OS_ODS_OUT_MUR ='"
				              + request.getParameter("osods2") + "',BILLS_RECEIVABLE ='"
			                  + request.getParameter("billre2") + "',NFB_FACILITY_AMT ='"
	                          + request.getParameter("nebfac2") + "' "
                              + "WHERE REPORT_REF_NO='" + ReporefSeq + "' AND REPORT_DATE='"
                                 + df1.formatdate(request.getParameter("redate2")) + "' " + "AND LOAN_TYPE='"
                                   + request.getParameter("cat2")
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

				sql3.append("INSERT INTO PSC0104_S2_MOD_TABLE(REPORT_REF_NO,LOAN_TYPE,FBILL_PUR_DISC,INVST_CORP_SHARES,INVST_DEBNT,INVST_COPR_BONDS,INVST_OTH_DEBTS,OS_LOANS_OUT_MUR,OS_ODS_OUT_MUR,BILLS_RECEIVABLE,NFB_FACILITY_AMT,REPORT_DATE,LCHG_USER_ID,LCHG_TIME  )"
						+"values('" + ReporefSeq + "','" + NullCheck.isNotNull(request.getParameter("cat2")) + "','" + NullCheck.isNotNull(request.getParameter("fpd2")) + "','" + NullCheck.isNotNull(request.getParameter("incosh2")) + "','"
								+ NullCheck.isNotNull(request.getParameter("indeb2")) + "','"
								+ NullCheck.isNotNull(request.getParameter("invcorbo2")) + "','"
								+ NullCheck.isNotNull(request.getParameter("invotdeb2")) + "','"
								+ NullCheck.isNotNull(request.getParameter("osloan2")) + "','"
								+ NullCheck.isNotNull(request.getParameter("osods2")) + "','"
								+ NullCheck.isNotNull(request.getParameter("billre2")) + "','"
								+ NullCheck.isNotNull(request.getParameter("nebfac2")) + "','"
								+ NullCheck.isNotNull(df1.formatdate(request.getParameter("redate2")))+ "','" + session.getAttribute("userName")
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
		log.info("executeee Gayu");
		//return "success";
	return status;
	}
	
	
	public String modXbPSC3Create104() throws SQLException {

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
		log.info("insert Action modXbCreateBLS0100");

		log.info("NEW FLG:" + newFlg);

		// for Inserting new record

		// for new Reference id
		if (newFlg.equals('Y'))

		{

			
			sql.append("INSERT INTO PSC0104_S3_MOD_TABLE(REPORT_REF_NO,NATURE_OF_CUST,FBILL_PUR_DISC,INVST_CORP_SHARES,INVST_DEBNT,INVST_COPR_BONDS,INVST_OTH_DEBTS,OS_LOANS_OUT_MUR,OS_ODS_OUT_MUR,BILLS_RECEIVABLE,NFB_FACILITY_AMT,REPORT_DATE,LCHG_USER_ID,LCHG_TIME  )"
			+"values('" + ReporefSeq + "','" + NullCheck.isNotNull(request.getParameter("cat3")) + "','" + NullCheck.isNotNull(request.getParameter("fpd3")) + "','" + NullCheck.isNotNull(request.getParameter("incosh3")) + "','"
					+ NullCheck.isNotNull(request.getParameter("indeb3")) + "','"
					+ NullCheck.isNotNull(request.getParameter("invcorbo3")) + "','"
					+ NullCheck.isNotNull(request.getParameter("invotdeb3")) + "','"
					+ NullCheck.isNotNull(request.getParameter("osloan3")) + "','"
					+ NullCheck.isNotNull(request.getParameter("osods3")) + "','"
					+ NullCheck.isNotNull(request.getParameter("billre3")) + "','"
				    + NullCheck.isNotNull(request.getParameter("nebfac3")) + "','"
					+ NullCheck.isNotNull(df1.formatdate(request.getParameter("redate3")))+ "','" + session.getAttribute("userName")
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
			sql.append("SELECT COUNT(*) as count FROM PSC0104_S3_MOD_TABLE WHERE REPORT_REF_NO='" + ReporefSeq
					+ "' AND REPORT_DATE='" + df1.formatdate(request.getParameter("redate3")) + "' " + "AND NATURE_OF_CUST='"
					 + request.getParameter("cat3") + "' ");
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

			if(rowcount > 0){

				log.info("INSDIE UPDATE");
			
                  sql2.append("update PSC0104_S3_MOD_TABLE set FBILL_PUR_DISC ='" + request.getParameter("fpd3")
				              + "',INVST_CORP_SHARES ='" + request.getParameter("incosh3") + "',INVST_DEBNT ='"
				              + request.getParameter("indeb3") + "',INVST_COPR_BONDS ='"
				              + request.getParameter("invcorbo3") + "',INVST_OTH_DEBTS ='"
				              + request.getParameter("invotdeb3") + "',OS_LOANS_OUT_MUR ='"
				              + request.getParameter("osloan3") + "',OS_ODS_OUT_MUR ='"
				              + request.getParameter("osods3") + "',BILLS_RECEIVABLE ='"
			                  + request.getParameter("billre3") + "',NFB_FACILITY_AMT ='"
	                          + request.getParameter("nebfac3") + "'"
                              + "WHERE REPORT_REF_NO='" + ReporefSeq + "' AND REPORT_DATE='"
                                 + df1.formatdate(request.getParameter("redate3")) + "' " + "AND NATURE_OF_CUST='"
                                   + request.getParameter("cat3")
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

          sql3.append("INSERT INTO PSC0104_S3_MOD_TABLE(REPORT_REF_NO,NATURE_OF_CUST,FBILL_PUR_DISC,INVST_CORP_SHARES,INVST_DEBNT,INVST_COPR_BONDS,INVST_OTH_DEBTS,OS_LOANS_OUT_MUR,OS_ODS_OUT_MUR,BILLS_RECEIVABLE,NFB_FACILITY_AMT,REPORT_DATE,LCHG_USER_ID,LCHG_TIME  )"
		      +"values('" + ReporefSeq + "','" + NullCheck.isNotNull(request.getParameter("cat3")) + "','" + NullCheck.isNotNull(request.getParameter("fpd3")) + "','" + NullCheck.isNotNull(request.getParameter("incosh3")) + "','"
				+ NullCheck.isNotNull(request.getParameter("indeb3")) + "','"
				+ NullCheck.isNotNull(request.getParameter("invcorbo3")) + "','"
				+ NullCheck.isNotNull(request.getParameter("invotdeb3")) + "','"
				+ NullCheck.isNotNull(request.getParameter("osloan3")) + "','"
				+ NullCheck.isNotNull(request.getParameter("osods3")) + "','"
				+ NullCheck.isNotNull(request.getParameter("billre3")) + "','"
			    + NullCheck.isNotNull(request.getParameter("nebfac3")) + "','"
				+ NullCheck.isNotNull(df1.formatdate(request.getParameter("redate3")))+ "','" + session.getAttribute("userName")
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
		//return "success";
	return status;
	}
}
