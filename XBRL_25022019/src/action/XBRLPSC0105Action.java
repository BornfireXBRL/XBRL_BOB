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
import bean.XBRLPSC0105Bean;
import dao.XBRLPSC0105Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;

import org.apache.log4j.Logger;
public class XBRLPSC0105Action {
	
	static Logger log = Logger.getLogger(XBRLPSC0105Action.class);

	public String sec1PSC0105;
	public String sec1PSC0105s2;
	public String sec1PSC0105s3;
	public String sec1PSC0105s4;
	public String sec1PSC0105s5;
	public String getSec1PSC0105s4() {
		return sec1PSC0105s4;
	}

	public void setSec1PSC0105s4(String sec1psc0105s4) {
		sec1PSC0105s4 = sec1psc0105s4;
	}

	public String getSec1PSC0105s5() {
		return sec1PSC0105s5;
	}

	public void setSec1PSC0105s5(String sec1psc0105s5) {
		sec1PSC0105s5 = sec1psc0105s5;
	}

	public String getSec1PSC0105s3() {
		return sec1PSC0105s3;
	}

	public void setSec1PSC0105s3(String sec1psc0105s3) {
		sec1PSC0105s3 = sec1psc0105s3;
	}

	public String sec1PSC0105d1;

	public String sec1PSC0105d2;
	public String getSec1PSC0105d2() {
		return sec1PSC0105d2;
	}

	public void setSec1PSC0105d2(String sec1psc0105d2) {
		sec1PSC0105d2 = sec1psc0105d2;
	}

	public String getDetsec2PSC0105() {
		return detsec2PSC0105;
	}

	public void setDetsec2PSC0105(String detsec2psc0105) {
		detsec2PSC0105 = detsec2psc0105;
	}

	public String detsec2PSC0105;
	

	public void setSec1PSC0105(String sec1PSC0105) {
		sec1PSC0105 = sec1PSC0105;
	}

	public void setSec1PSC0105s2(String sec1PSC0105s2) {
		sec1PSC0105s2 = sec1PSC0105s2;
	}

	


	public String getSec1PSC0105d1() {
		return sec1PSC0105d1;
	}

	public void setSec1PSC0105d1(String sec1PSC0105d1) {
		sec1PSC0105d1 = sec1PSC0105d1;
	}



	public String getSec1PSC0105s2() {
		return sec1PSC0105s2;
	}

	

	public String getSec1PSC0105() {
		return sec1PSC0105;
	}

public String refno;
	
	
	
	
	public String getRefno() {
		return refno;
	}

	public void setRefno(String refno) {
		this.refno = refno;
	}


	public String section1PSC0105() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside PSC0105 action");
		
		XBRLPSC0105Dao bsd = new XBRLPSC0105Dao();

		ArrayList<XBRLPSC0105Bean> arl = bsd.xbrlPSC0105(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1PSC0105 = gson.toJson(arl);

		return "success";

	}
	
	public String section2PSC0105() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside PSC0105 action");
		
		XBRLPSC0105Dao bsd = new XBRLPSC0105Dao();

		ArrayList<XBRLPSC0105Bean> arl = bsd.xbrlPSC0105s2(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1PSC0105s2 = gson.toJson(arl);

		return "success";

	}
	
	public String section3PSC0105() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside PSC0105 action");
		
		XBRLPSC0105Dao bsd = new XBRLPSC0105Dao();

		ArrayList<XBRLPSC0105Bean> arl = bsd.xbrlPSC0105s3(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1PSC0105s3 = gson.toJson(arl);

		return "success";

	}
	
	
	
	public String section4PSC0105() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside PSC0105 action");
		
		XBRLPSC0105Dao bsd = new XBRLPSC0105Dao();

		ArrayList<XBRLPSC0105Bean> arl = bsd.xbrlPSC0105s4(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1PSC0105s4 = gson.toJson(arl);

		return "success";

	}

	public String section5PSC0105() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside PSC0105 action");
		
		XBRLPSC0105Dao bsd = new XBRLPSC0105Dao();

		ArrayList<XBRLPSC0105Bean> arl = bsd.xbrlPSC0105s5(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1PSC0105s5 = gson.toJson(arl);

		return "success";

	}


	public String detsec1PSC0105() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside PSC0105 action");
		
		XBRLPSC0105Dao bsd = new XBRLPSC0105Dao();

		ArrayList<XBRLPSC0105Bean> arl = bsd.xbrlPSC0105d1(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1PSC0105d1= gson.toJson(arl);

		return "success";

	}
	
	
	public String detsec2PSC0105() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside PSC0105 action");
		
		XBRLPSC0105Dao bsd = new XBRLPSC0105Dao();

		ArrayList<XBRLPSC0105Bean> arl = bsd.xbrlPSC0105d2(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1PSC0105d2= gson.toJson(arl);

		return "success";

	}
	

	public String modXbPSCCreate105S1() throws SQLException {

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
			log.info("NEW FLG:" + request.getParameter("accno"));
			log.info("NEW FLG:" + request.getParameter("acnam"));
			log.info("NEW FLG:" + request.getParameter("scode"));
			log.info("NEW FLG:" + request.getParameter("stype"));
			log.info("NEW FLG:" + request.getParameter("iscode"));
			log.info("NEW FLG:" + request.getParameter("sflag"));
			log.info("NEW FLG:" + request.getParameter("outamt"));
			log.info("NEW FLG:" + request.getParameter("impflg"));
			
			log.info("NEW FLG:" + request.getParameter("accopndat"));
			log.info("NEW FLG:" + request.getParameter("rendat"));
			log.info("NEW FLG:" + request.getParameter("secflg"));
			log.info("NEW FLG:" + request.getParameter("reflg"));
			
			log.info("NEW FLG:" + request.getParameter("resdat"));
			log.info("NEW FLG:" + request.getParameter("sanamt"));
			log.info("NEW FLG:" + request.getParameter("acccrcode"));
			log.info("NEW FLG:" + request.getParameter("repdat"));
			sql.append(
					"INSERT INTO PSC0105_S1_MOD_TABLE(REPORT_REF_NO,ACCT_NUMBER,ACCT_NAME,SCHM_CODE,SCHM_TYPE,ISIC_CODE,SME_FLG,OUTSTANDING_AMT,IMPAIRED_FLAG,ACCT_OPN_DATE,RENEWAL_DATE,SECURITY_FLG,RESTRUCTURED_FLG,RESTRUCTURED_DATE,SANCTION_AMT,ACCT_CRNCY_CODE,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
							+ "values('" + ReporefSeq + "','" + request.getParameter("accno")
							+ "','" + request.getParameter("acnam") + "','"
							+ request.getParameter("scode") + "','" 
									+ request.getParameter("stype") + "','"
											+ request.getParameter("iscode") + "','" 
											+ request.getParameter("sflag") + "','"
													+ request.getParameter("outamt") + "','" 
													+ request.getParameter("impflg") + "','"
															+ df1.formatdate(request.getParameter("accopndat")) + "','" 
															+ df1.formatdate(request.getParameter("rendat")) + "','"
																	+ request.getParameter("secflg") + "','" 
																	+ request.getParameter("reflg") + "','"
																			+ df1.formatdate(request.getParameter("resdat")) + "','" 
																			+ request.getParameter("sanamt") + "','"
																					+ request.getParameter("acccrcode") + "','" 
																					
							+df1.formatdate(request.getParameter("repdat"))+ "','" + session.getAttribute("userName")
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
			
			
			/*sql.append(
					"SELECT COUNT (*) as cnt FROM   (SELECT DISTINCT REPORT_DATE FROM  BLS0106_MOD_TABLE where REPORT_REF_NO='"
							+ ReporefSeq.trim() + "' and ACCT_NUMBER = '" + request.getParameter("accno")
							+ "'  and REPORT_DATE >='" + df1.formatdate(request.getParameter("dt2"))+"')");*/
			sql.append(
					"SELECT Count (*) as count FROM   (SELECT DISTINCT REPORT_DATE FROM  PSC0105_S1_MOD_TABLE where REPORT_REF_NO='"
							+ ReporefSeq.trim() + "'and ACCT_NUMBER = '"
							+ request.getParameter("accno") + "'and ACCT_NAME = '"+ request.getParameter("acnam") + "'and REPORT_DATE >='" + df1.formatdate(request.getParameter("dt2"))+"')");

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
				
			
				sql2.append("update  PSC0105_S1_MOD_TABLE set REPORT_REF_NO ='" + ReporefSeq + "',ACCT_NUMBER ='"
						+ request.getParameter("accno") + "',ACCT_NAME ='" + request.getParameter("acnam")
						+ "',SCHM_CODE ='" + request.getParameter("scode") + "',SCHM_TYPE ='"
						+ request.getParameter("stype") + "',ISIC_CODE ='"+ request.getParameter("iscode")
						+ "',SME_FLG ='" +request.getParameter("sflag")
						+ "',OUTSTANDING_AMT ='"
						+ request.getParameter("outamt") + "',IMPAIRED_FLAG ='" + request.getParameter("impflg")
						+ "',ACCT_OPN_DATE ='" + df.formatdate(request.getParameter("accopndat")) + "',RENEWAL_DATE ='"
						+ df.formatdate(request.getParameter("rendat")) + "',SECURITY_FLG ='"+ request.getParameter("secflg")
						+ "',RESTRUCTURED_FLG ='" +request.getParameter("reflg")
						+ "',RESTRUCTURED_DATE ='"
						+ df.formatdate(request.getParameter("resdat")) + "',SANCTION_AMT ='" + request.getParameter("sanamt")
						+ "',ACCT_CRNCY_CODE ='" + request.getParameter("acccrcode") + "',REPORT_DATE ='"
						+ df.formatdate(request.getParameter("repdat")) 
						+ "'"+ " where ACCT_NUMBER ='" + request.getParameter("accno") +"'and REPORT_REF_NO ='" + ReporefSeq + "'and REPORT_DATE ='" + df1.formatdate(request.getParameter("repdat"))+"'");
				/*sql2.append("update PSC0105_S1_MOD_TABLE set REPORT_REF_NO ='" + ReporefSeq + "',ACCT_NUMBER ='"
						+ request.getParameter("accno") + "',ACCT_NAME ='" + request.getParameter("acnam")
						+ "',SCHM_CODE ='" + request.getParameter("scode") + "',SCHM_TYPE ='"
						+ request.getParameter("stype") + "',ISIC_CODE ='"+ request.getParameter("iscode")
						+ "',SME_FLG ='" + request.getParameter("sflag") + "',OUTSTANDING_AMT ='"
						+ request.getParameter("outamt") + "',IMPAIRED_FLAG ='"+ request.getParameter("impflg")
						+ "',ACCT_OPN_DATE ='" + df.formatdate(request.getParameter("accopndat")) + "',RENEWAL_DATE ='"
						+ df.formatdate(request.getParameter("rendat")) + "',SECURITY_FLG ='"+ request.getParameter("secflg")
						+ "',RESTRUCTURED_FLG ='" + request.getParameter("reflg") + "',RESTRUCTURED_DATE ='"
			+ df.formatdate(request.getParameter("resdat"))+ "',SANCTION_AMT ='"+ request.getParameter("sanamt")
						+ "',ACCT_CRNCY_CODE ='" + df.formatdate(request.getParameter("acccrcode"))
						+ "',REPORT_DATE ='" +df.formatdate(request.getParameter("repdat"))
						+ "'"+ " where ACCT_NUMBER ='" + request.getParameter("accno") +"'and REPORT_REF_NO ='" + ReporefSeq + "'and REPORT_DATE ='" + df1.formatdate(request.getParameter("repdat"))+"'");*/
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
						"INSERT INTO PSC0105_S1_MOD_TABLE(REPORT_REF_NO,ACCT_NUMBER,ACCT_NAME,SCHM_CODE,SCHM_TYPE,ISIC_CODE,SME_FLG,OUTSTANDING_AMT,IMPAIRED_FLAG,ACCT_OPN_DATE,RENEWAL_DATE,SECURITY_FLG,RESTRUCTURED_FLG,RESTRUCTURED_DATE,SANCTION_AMT,ACCT_CRNCY_CODE,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
								+ "values('" + ReporefSeq + "','" + request.getParameter("accno")
								+ "','" + request.getParameter("acnam") + "','"
								+ request.getParameter("scode") + "','" 
										+ request.getParameter("stype") + "','"
												+ request.getParameter("iscode") + "','" 
												+ request.getParameter("sflag") + "','"
														+ request.getParameter("outamt") + "','" 
														+ request.getParameter("impflg") + "','"
																+ df1.formatdate(request.getParameter("accopndat")) + "','" 
																+ df1.formatdate(request.getParameter("rendat")) + "','"
																		+ request.getParameter("secflg") + "','" 
																		+ request.getParameter("reflg") + "','"
																				+ df1.formatdate(request.getParameter("resdat")) + "','" 
																				+ request.getParameter("sanamt") + "','"
																						+ request.getParameter("acccrcode") + "','" 
																						
								+df1.formatdate(request.getParameter("repdat"))+ "','" + session.getAttribute("userName")
								+ "',SYSDATE)");

				/*sql3.append("INSERT INTO PSC0105_S1_MOD_TABLE(REPORT_REF_NO,ACCT_NO,ACCT_NAME,ACCT_OPN_DATE,SCHM_TYPE,DEP_PERIOD_DAYS,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)");


				sql3.append("values('" + ReporefSeq + "','" + request.getParameter("accountnumber")
						+ "','" + request.getParameter("accountname") + "','" + df.formatdate(request.getParameter("accntopndate")) + "','"
						+ request.getParameter("schemetype") + "','" 
								+ request.getParameter("interestperioddays") + "','"
						+df1.formatdate(request.getParameter("reportdate"))+ "','"+session.getAttribute("userName")+"',SYSDATE)");
*/
				
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

	}
	
	
	
	
	
	
	
	public String modXbPSCCreate105S2() throws SQLException {

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
			
			sql.append(
					"INSERT INTO PSC0105_S2_MOD_TABLE(REPORT_REF_NO,APPLICATION_NO,ENTITY_NAME,ENTITY_TYPE,FACILITY_TYPE,FACILITY_AMT,REJ_REASON,APP_RECEIVED_DT,APP_REJ_DT,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
							+ "values('" + ReporefSeq + "','" + request.getParameter("appno")
							+ "','" + request.getParameter("entnam") + "','"
							+ request.getParameter("entflg") + "','" 
									+ request.getParameter("factyp") + "','"
											+ request.getParameter("facamt") + "','" 
											+ request.getParameter("rejreason") + "','"
													+ df.formatdate(request.getParameter("aprecdate")) + "','" 
													+ df.formatdate(request.getParameter("aprejdat")) + "','" 
																					
							+df1.formatdate(request.getParameter("repdat"))+ "','" + session.getAttribute("userName")
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
			
			
			/*sql.append(
					"SELECT COUNT (*) as cnt FROM   (SELECT DISTINCT REPORT_DATE FROM  BLS0106_MOD_TABLE where REPORT_REF_NO='"
							+ ReporefSeq.trim() + "' and ACCT_NUMBER = '" + request.getParameter("accno")
							+ "'  and REPORT_DATE >='" + df1.formatdate(request.getParameter("dt2"))+"')");*/
			sql.append(
					"SELECT Count (*) as count FROM   (SELECT DISTINCT REPORT_DATE FROM  PSC0105_S2_MOD_TABLE where REPORT_REF_NO='"
							+ ReporefSeq.trim() + "'and APPLICATION_NO = '"
							+ request.getParameter("appno") + "'and ENTITY_NAME = '"+ request.getParameter("entnam") + "'and REPORT_DATE >='" + df1.formatdate(request.getParameter("dt2"))+"')");

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
				
			
				sql2.append("update  PSC0105_S2_MOD_TABLE set REPORT_REF_NO ='" + ReporefSeq + "',APPLICATION_NO ='"
						+ request.getParameter("appno") + "',ENTITY_NAME ='" + request.getParameter("entnam")
						+ "',ENTITY_TYPE ='" + request.getParameter("entflg") + "',FACILITY_TYPE ='"
						+ request.getParameter("factyp") + "',FACILITY_AMT ='"+ request.getParameter("facamt")
						+ "',REJ_REASON ='" +request.getParameter("rejreason")
						+ "',APP_RECEIVED_DT ='"
						+ df.formatdate(request.getParameter("aprecdate")) + "',APP_REJ_DT ='" + df.formatdate(request.getParameter("aprejdat"))
						+ "',REPORT_DATE ='"+ df.formatdate(request.getParameter("repdat")) 
						+ "'"+ " where APPLICATION_NO ='" + request.getParameter("appno") +"'and REPORT_REF_NO ='" + ReporefSeq + "'and REPORT_DATE ='" + df1.formatdate(request.getParameter("repdat"))+"'");

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
						"INSERT INTO PSC0105_S2_MOD_TABLE(REPORT_REF_NO,APPLICATION_NO,ENTITY_NAME,ENTITY_TYPE,FACILITY_TYPE,FACILITY_AMT,REJ_REASON,APP_RECEIVED_DT,APP_REJ_DT,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
								+ "values('" + ReporefSeq + "','" + request.getParameter("appno")
								+ "','" + request.getParameter("entnam") + "','"
								+ request.getParameter("entflg") + "','" 
										+ request.getParameter("factyp") + "','"
												+ request.getParameter("facamt") + "','" 
												+ request.getParameter("rejreason") + "','"
														+ df.formatdate(request.getParameter("aprecdate")) + "','" 
														+ df.formatdate(request.getParameter("aprejdat")) + "','" 
																						
								+df1.formatdate(request.getParameter("repdat"))+ "','" + session.getAttribute("userName")
								+ "',SYSDATE)");

				/*sql3.append("INSERT INTO PSC0105_S1_MOD_TABLE(REPORT_REF_NO,ACCT_NO,ACCT_NAME,ACCT_OPN_DATE,SCHM_TYPE,DEP_PERIOD_DAYS,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)");


				sql3.append("values('" + ReporefSeq + "','" + request.getParameter("accountnumber")
						+ "','" + request.getParameter("accountname") + "','" + df.formatdate(request.getParameter("accntopndate")) + "','"
						+ request.getParameter("schemetype") + "','" 
								+ request.getParameter("interestperioddays") + "','"
						+df1.formatdate(request.getParameter("reportdate"))+ "','"+session.getAttribute("userName")+"',SYSDATE)");
*/
				
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

	}
	
	public String detailPSC0105saves() {

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
	
	
	
	
}

