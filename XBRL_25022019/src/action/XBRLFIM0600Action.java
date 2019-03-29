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
import bean.XBRLFIM0600Bean;
import dao.XBRLFIM0600Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;

public class XBRLFIM0600Action {
	
	static Logger log = Logger.getLogger(XBRLFIM0600Action.class);
	
	public String sec1FIM0600;
	public String sec2FIM0600;
	public String sec3FIM0600;
	public String detFIM0600;
	public String det2FIM0600;
	public String det3FIM0600;

public String refno;
	
	
	
	
	public String getRefno() {
		return refno;
	}

	public void setRefno(String refno) {
		this.refno = refno;
	}
	public String getDet3FIM0600() {
		return det3FIM0600;
	}

	public void setDet3FIM0600(String det3fim0600) {
		det3FIM0600 = det3fim0600;
	}

	public String getDet2FIM0600() {
		return det2FIM0600;
	}

	public void setDet2FIM0600(String det2fim0600) {
		det2FIM0600 = det2fim0600;
	}

	public String getDetFIM0600() {
		return detFIM0600;
	}

	public void setDetFIM0600(String detFIM0600) {
		this.detFIM0600 = detFIM0600;
	}

	public String getSec3FIM0600() {
		return sec3FIM0600;
	}

	public void setSec3FIM0600(String sec3fim0600) {
		sec3FIM0600 = sec3fim0600;
	}

	public String getSec2FIM0600() {
		return sec2FIM0600;
	}

	public void setSec2FIM0600(String sec2fim0600) {
		sec2FIM0600 = sec2fim0600;
	}

	public String getSec1FIM0600() {
		return sec1FIM0600;
	}

	public void setSec1FIM0600(String sec1fim0600) {
		sec1FIM0600 = sec1fim0600;
	}

	public String section1FIM0600() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside fim action");
		
		XBRLFIM0600Dao bsd = new XBRLFIM0600Dao();

		ArrayList<XBRLFIM0600Bean> arl = bsd.xbrlfim0600s1(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1FIM0600 = gson.toJson(arl);

		return "success";

	}
	
	public String section2FIM0600() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside fim action");
		
		XBRLFIM0600Dao bsd = new XBRLFIM0600Dao();

		ArrayList<XBRLFIM0600Bean> arl = bsd.xbrlfim0600s2(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec2FIM0600 = gson.toJson(arl);

		return "success";

	}
	
	public String section3FIM0600() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside fim action");
		
		XBRLFIM0600Dao bsd = new XBRLFIM0600Dao();

		ArrayList<XBRLFIM0600Bean> arl = bsd.xbrlfim0600s3(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec3FIM0600 = gson.toJson(arl);

		return "success";

	}
	
	public String detailsFIM0600() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside fim action");
		
		XBRLFIM0600Dao bsd = new XBRLFIM0600Dao();

		ArrayList<XBRLFIM0600Bean> arl = bsd.xbrlfim0600details(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		detFIM0600 = gson.toJson(arl);

		return "success";

	}
	public String details2FIM0600() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside fim action");
		
		XBRLFIM0600Dao bsd = new XBRLFIM0600Dao();

		ArrayList<XBRLFIM0600Bean> arl = bsd.xbrlfim0600details2(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		det2FIM0600 = gson.toJson(arl);

		return "success";

	}

	public String details3FIM0600() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside fim action");
		
		XBRLFIM0600Dao bsd = new XBRLFIM0600Dao();

		ArrayList<XBRLFIM0600Bean> arl = bsd.xbrlfim0600details3(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		det3FIM0600 = gson.toJson(arl);

		return "success";

	}
	public String modXbfimCreate6001() throws SQLException {
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
		
			sql.append("INSERT INTO FIM0600_S1_MOD_TABLE(REPORT_REF_NO,REPORT_DATE,CRNCY_CODE,MID_EXCH_RATE,NOTES_COINS,LIQUID_BALANCE,BALANCE_SALES,BALANCE_ABROAD_BNK,OTH_BALANCE_SALES,OTH_ASSET,SPOT_PURCHASE,FORWARD_PURCHASE,OFF_OTH_ASSET,SHORT_TERM_LIAB,DEP_FC,OTH_LIAB,SPOT_SALES,FORWARD_SALES,OFF_OTH_LIAB,LCHG_USER_ID,LCHG_TIME )"
	         	+"values('" + ReporefSeq + "','" + df1.formatdate(NullCheck.isNotNull(request.getParameter("reportDate")))+ "','"
				 + NullCheck.isNotNull(request.getParameter("crncyCode")) + "','" + NullCheck.isNotNull(request.getParameter("crncynotesBal")) + "','"
					+ NullCheck.isNotNull(request.getParameter("nostroacctBal")) + "','"
					+ NullCheck.isNotNull(request.getParameter("frwdSalesBal"))
					+ "','" + NullCheck.isNotNull(request.getParameter("fcrncyAbroadBal"))
					+ "','" + NullCheck.isNotNull(request.getParameter("fcrncyobsastBal"))
					+ "','" + NullCheck.isNotNull(request.getParameter("obsastBal"))
					+ "','" + NullCheck.isNotNull(request.getParameter("undlrspotpurBal"))
					+ "','" + NullCheck.isNotNull(request.getParameter("frwdPurBal"))
					+ "','" + NullCheck.isNotNull(request.getParameter("oobsastBal"))
					+ "','" + NullCheck.isNotNull(request.getParameter("shrtTermLiabBal"))
					+ "','" + NullCheck.isNotNull(request.getParameter("fcrncyDepositBal"))
					+ "','" + df1.formatdate(NullCheck.isNotNull(request.getParameter("obsliabBal")))
					+ "','" + NullCheck.isNotNull(request.getParameter("ubdlrspotsalesBal"))
					+ "','" + NullCheck.isNotNull(request.getParameter("frwdSales"))
					+ "','" + NullCheck.isNotNull(request.getParameter("oobsliabBal")) + "','" + session.getAttribute("userName") 
			        + "',SYSDATE");

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
			sql.append("SELECT COUNT(*) as count FROM FIM0600_S1_MOD_TABLE WHERE REPORT_REF_NO='" + ReporefSeq
					+ "' AND REPORT_DATE='" + df1.formatdate(request.getParameter("reportDate")) + "' " + "AND CRNCY_CODE='"
					 + request.getParameter("crncyCode") + "' ");
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
				
				sql2.append("update FIM0600_S1_MOD_TABLE set MID_EXCH_RATE ='" + request.getParameter("rate") + "',NOTES_COINS ='"
						+ request.getParameter("crncynotesBal") + "',LIQUID_BALANCE ='"
						+ request.getParameter("nostroacctBal") + "',BALANCE_SALES ='"
						+ request.getParameter("frwdSalesBal") + "',BALANCE_ABROAD_BNK ='"
						+ request.getParameter("fcrncyAbroadBal") + "',OTH_BALANCE_SALES ='"
						+ request.getParameter("fcrncyobsastBal") + "',OTH_ASSET ='"
						+ request.getParameter("obsastBal") + "',SPOT_PURCHASE ='"
						+ request.getParameter("undlrspotpurBal") + "',FORWARD_PURCHASE ='"
						+ request.getParameter("frwdPurBal") + "',OFF_OTH_ASSET ='"
						+ request.getParameter("oobsastBal") + "',SHORT_TERM_LIAB ='"
						+ request.getParameter("shrtTermLiabBal") + "',DEP_FC ='"
						+ request.getParameter("fcrncyDepositBal") + "',OTH_LIAB ='"
                        + request.getParameter("obsliabBal") + "',SPOT_SALES ='"
					    + request.getParameter("ubdlrspotsalesBal") + "',FORWARD_SALES ='"
				    	+request.getParameter("frwdSales") + "',OFF_OTH_LIAB ='" + request.getParameter("oobsliabBal") +  "' "
				    	+ "WHERE REPORT_REF_NO='" + ReporefSeq + "' AND REPORT_DATE='"
						+ df1.formatdate(request.getParameter("reportDate")) + "' " + "AND CRNCY_CODE='"
						+ request.getParameter("crncyCode")
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

				sql3.append("INSERT INTO FIM0600_S1_MOD_TABLE(REPORT_REF_NO,REPORT_DATE,CRNCY_CODE,MID_EXCH_RATE,NOTES_COINS,LIQUID_BALANCE,BALANCE_SALES,BALANCE_ABROAD_BNK,OTH_BALANCE_SALES,OTH_ASSET,SPOT_PURCHASE,FORWARD_PURCHASE,OFF_OTH_ASSET,SHORT_TERM_LIAB,DEP_FC,OTH_LIAB,SPOT_SALES,FORWARD_SALES,OFF_OTH_LIAB,LCHG_USER_ID,LCHG_TIME )"
			         	+"values('" + ReporefSeq + "','" + df1.formatdate(NullCheck.isNotNull(request.getParameter("reportDate")))+ "','"
						 + NullCheck.isNotNull(request.getParameter("crncyCode")) + "','" + NullCheck.isNotNull(request.getParameter("crncynotesBal")) + "','"
							+ NullCheck.isNotNull(request.getParameter("nostroacctBal")) + "','"
							+ NullCheck.isNotNull(request.getParameter("frwdSalesBal"))
							+ "','" + NullCheck.isNotNull(request.getParameter("fcrncyAbroadBal"))
							+ "','" + NullCheck.isNotNull(request.getParameter("fcrncyobsastBal"))
							+ "','" + NullCheck.isNotNull(request.getParameter("obsastBal"))
							+ "','" + NullCheck.isNotNull(request.getParameter("undlrspotpurBal"))
							+ "','" + NullCheck.isNotNull(request.getParameter("frwdPurBal"))
							+ "','" + NullCheck.isNotNull(request.getParameter("oobsastBal"))
							+ "','" + NullCheck.isNotNull(request.getParameter("shrtTermLiabBal"))
							+ "','" + NullCheck.isNotNull(request.getParameter("fcrncyDepositBal"))
							+ "','" + df1.formatdate(NullCheck.isNotNull(request.getParameter("obsliabBal")))
							+ "','" + NullCheck.isNotNull(request.getParameter("ubdlrspotsalesBal"))
							+ "','" + NullCheck.isNotNull(request.getParameter("frwdSales"))
							+ "','" + NullCheck.isNotNull(request.getParameter("oobsliabBal")) + "','" + session.getAttribute("userName") 
					        + "',SYSDATE");
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

		//return "success";
	return status;
	}

		
	public String modXbfimCreate600() throws SQLException {

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
		
		
			sql.append("INSERT INTO FIM0600_S3_MOD_TABLE(REPORT_REF_NO,INSTITUTE_TYPE,NATURE_OF_TRANS,PURPOSE,ORG_CRNCY,AMT_OS_IN_OC,EXCG_RATE,REPORT_DATE,LCHG_USER_ID,LCHG_TIME )"
			+"values('" + ReporefSeq + "','" + NullCheck.isNotNull(request.getParameter("instype"))
					 + "','" + NullCheck.isNotNull(request.getParameter("trnnat"))
							 + "','" + NullCheck.isNotNull(request.getParameter("prps"))
							 + "','" + NullCheck.isNotNull(request.getParameter("orgcrncy")) 
							 + "','" + NullCheck.isNotNull(request.getParameter("amt"))
							 + "','" + NullCheck.isNotNull(request.getParameter("exchgrt")) +"','" 
					+ df1.formatdate(request.getParameter("repdt"))+ "','" + session.getAttribute("userName")
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
			sql.append("SELECT COUNT(*) as count FROM FIM0100_MOD_TABLE WHERE REPORT_REF_NO='" + ReporefSeq
					+ "' AND REPORT_DATE='" + df1.formatdate(request.getParameter("rptdate")) + "' " + "AND INSTITUTE_TYPE='"
					 + request.getParameter("instype") + "' ");
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
				
				sql2.append("update FIM0600_S3_MOD_TABLE set NATURE_OF_TRANS ='" + request.getParameter("trnnat") + "',PURPOSE ='"
						+ request.getParameter("prps") + "',ORG_CRNCY ='"
						+ request.getParameter("orgcrncy") + "',AMT_OS_IN_OC ='"
					    + request.getParameter("amt") + "',EXCG_RATE ='"
						+ request.getParameter("exchgrt") + "' "
						+ "WHERE REPORT_REF_NO='" + ReporefSeq + "' AND REPORT_DATE='"
						+ df1.formatdate(request.getParameter("repdt")) + "' " + "AND INSTITUTE_TYPE='"
						+ request.getParameter("instype")
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

				sql3.append("INSERT INTO FIM0600_S3_MOD_TABLE(REPORT_REF_NO,INSTITUTE_TYPE,NATURE_OF_TRANS,PURPOSE,ORG_CRNCY,AMT_OS_IN_OC,EXCG_RATE,REPORT_DATE,LCHG_USER_ID,LCHG_TIME )"
						+"values('" + ReporefSeq + "','" + NullCheck.isNotNull(request.getParameter("instype"))
								 + "','" + NullCheck.isNotNull(request.getParameter("trnnat"))
										 + "','" + NullCheck.isNotNull(request.getParameter("prps"))
										 + "','" + NullCheck.isNotNull(request.getParameter("orgcrncy")) 
										 + "','" + NullCheck.isNotNull(request.getParameter("amt"))
										 + "','" + NullCheck.isNotNull(request.getParameter("exchgrt")) +"','" 
								+ df1.formatdate(request.getParameter("repdt"))+ "','" + session.getAttribute("userName")
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

		//return "success";
	return status;
	}
		
	
	
	public String detailFIM0600saves() {

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
