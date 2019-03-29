
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

import bean.XBRLBLS0110Bean;
import bean.XBRLBLS0120Bean;
import dao.XBRLBLS0110Dao;
import dao.XBRLBLS0120Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;

import org.apache.log4j.Logger;


public class XBRLBLS0110Action {
	
	static Logger log = Logger.getLogger(XBRLBLS0110Action.class);

	public String s1BLS0110;
	public String s2BLS0110;
	public String getS1BLS0110() {
		return s1BLS0110;
	}

	public void setS1BLS0110(String s1bls0110) {
		s1BLS0110 = s1bls0110;
	}

	public String getS2BLS0110() {
		return s2BLS0110;
	}

	public void setS2BLS0110(String s2bls0110) {
		s2BLS0110 = s2bls0110;
	}

	
	public String refno;
	
	
	 public String resalert;
	 
	
	public String getResalert() {
		return resalert;
	}

	public void setResalert(String resalert) {
		this.resalert = resalert;
	}

	public String getRefno() {
		return refno;
	}

	public void setRefno(String refno) {
		this.refno = refno;
	}

	public String det1BLS0110;
	public String getDet1BLS0110() {
		return det1BLS0110;
	}

	public void setDet1BLS0110(String det1bls0110) {
		det1BLS0110 = det1bls0110;
	}

	public String getDet2BLS0110() {
		return det2BLS0110;
	}

	public void setDet2BLS0110(String det2bls0110) {
		det2BLS0110 = det2bls0110;
	}


	public String det2BLS0110;
	
	public String detBLS0110;

	

	public String getDetBLS0110() {
		return detBLS0110;
	}

	public void setDetBLS0110(String detBLS0110) {
		this.detBLS0110 = detBLS0110;
	}

	public String section1BLS0110() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside BLS0110 action");
		
		XBRLBLS0110Dao bsd = new XBRLBLS0110Dao();

		ArrayList<XBRLBLS0110Bean> arl = bsd.xbrlBLS0110(request.getParameter("reptype"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		s1BLS0110 = gson.toJson(arl);
log.info(s1BLS0110);
		return "success";

	}
	
	public String section2BLS0110() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside BLS0110 sec2 action");
		
		XBRLBLS0110Dao bsd = new XBRLBLS0110Dao();

		ArrayList<XBRLBLS0110Bean> arl = bsd.xbrlBLS0110s2(request.getParameter("reptype"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		s2BLS0110 = gson.toJson(arl);

		return "success";

	}
	
	
	
	
	
	public String det1BLS0110() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		
		
		XBRLBLS0110Dao bsd = new XBRLBLS0110Dao();

		ArrayList<XBRLBLS0110Bean> arl = bsd.xbrlBLS0110ajaxdetails1(request.getParameter("repname"),request.getParameter("ReporefSeq"),
				request.getParameter("instno"),df.formatdate(request.getParameter("dt2")), request.getParameter("curr"));
		
		// summarystandard = arl.toArray(new String[arl.size()]);
		
		Gson gson = new Gson();
		det1BLS0110 = gson.toJson(arl);

		return "success";

	}	
	
	public String det2BLS0110() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		
		
		XBRLBLS0110Dao bsd = new XBRLBLS0110Dao();

		
		ArrayList<XBRLBLS0110Bean> arl = bsd.xbrlBLS0110ajaxdetails2(request.getParameter("repname"),request.getParameter("ReporefSeq"),
				request.getParameter("instno"),df.formatdate(request.getParameter("dt2")), request.getParameter("curr"));
		
		// summarystandard = arl.toArray(new String[arl.size()]);
		
		Gson gson = new Gson();
		det2BLS0110 = gson.toJson(arl);

		return "success";

	}	
	
	
	public String modXbBLSCreate1101() throws SQLException {

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
		log.info("===" + request.getParameter("reportrefno"));

/*		if (request.getParameter("reportrefno").startsWith("R")) {

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

		/*log.info("NEW FLG:" + newFlg);

		// for Inserting new record

		// for new Reference id
		if (newFlg.equals('Y'))

		{
			sql.append(
					"INSERT INTO BLS0100_MOD_TABLE (REPORT_REF_NO,REPORT_DATE,ACCT_NO,ACCT_NAME,CUST_ID,GLSH_CODE,SCH_CODE,SCH_TYPE,ACCT_CRNCY_CODE,EAB_DATE,EAB_BAL,LCHG_USER_ID,LCHG_TIME)"
							+ "VALUES ('" + ReporefSeq + "','" + df1.formatdate(request.getParameter("baldat")) + "','" + request.getParameter("acnum") + "','"
							+ request.getParameter("acnam") + "','" + request.getParameter("cusid") + "','"
							+ request.getParameter("glsubcode") + "','" + request.getParameter("schcode") + "','"
							+ request.getParameter("schtype") + "','" + request.getParameter("actcur") + "','"
						    + df1.formatdate(request.getParameter("baldat"))
							+ "','" + request.getParameter("balamt") + "','" + session.getAttribute("userName")
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
		else {*/

			int rowcount = 0;
			sql.append("SELECT COUNT(*) as count FROM BLS0100_MOD_TABLE WHERE REPORT_REF_NO='" + ReporefSeq
					+ "' AND REPORT_DATE='" + df1.formatdate(request.getParameter("baldat")) + "' " + "AND ACCT_NO='"
					+ request.getParameter("acnum") + "' ");
				
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
				sql2.append("UPDATE BLS0100_MOD_TABLE SET ACCT_NAME='" + request.getParameter("acnam")
				+ "', CUST_ID ='" + request.getParameter("cusid")
				+ "', GLSH_CODE='" + request.getParameter("glsubcode")
				+ "', SCH_CODE ='" + request.getParameter("schcode")
				+ "', SCH_TYPE ='" + request.getParameter("schtype")
				+ "', ACCT_CRNCY_CODE ='" + request.getParameter("actcur")
				+ "', EAB_DATE  ='" + df1.formatdate(request.getParameter("baldat"))
				+ "', EAB_BAL='" + request.getParameter("balamt") + "' ,DEL_FLG='M'"
				+ "WHERE REPORT_REF_NO='" + ReporefSeq + "' AND REPORT_DATE='"
				+ df1.formatdate(request.getParameter("baldat")) + "' " + "AND ACCT_NO='"
				+ request.getParameter("acnum")
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
						"INSERT INTO BLS0100_MOD_TABLE (REPORT_REF_NO,REPORT_DATE,ACCT_NO,ACCT_NAME,CUST_ID,GLSH_CODE,SCH_CODE,SCH_TYPE,ACCT_CRNCY_CODE,EAB_DATE,EAB_BAL,DEL_FLG,LCHG_USER_ID,LCHG_TIME)"
								+ "VALUES ('" + ReporefSeq + "','" + df1.formatdate(request.getParameter("baldat")) + "','" + request.getParameter("acnum") + "','"
								+ request.getParameter("acnam") + "','" + request.getParameter("cusid") + "','"
								+ request.getParameter("glsubcode") + "','" + request.getParameter("schcode") + "','"
								+ request.getParameter("schtype") + "','" + request.getParameter("actcur") + "','"
							    + df1.formatdate(request.getParameter("baldat"))
								+ "','" + request.getParameter("balamt") + "','"+request.getParameter("modtyp")+"','" + session.getAttribute("userName")
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

			/*}*/
			log.info("executeeee Gayu");

			//return "success";
	return status;
		}
	
	
	public String modXbBLSCreate1102() throws SQLException {

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

		}
		log.info("===ReporefSeq===" + ReporefSeq);
		// log.info("<< EIDSeq >> " + EIDSeq);
*/		session.setAttribute("ReprefSeq", ReporefSeq);

		int rs = 0;

		int count = 0;

		StringBuffer sql = new StringBuffer();

		// HttpSession session = request.getSession();
		log.info("insert Action modXbCreateBLS0110");

	/*	log.info("NEW FLG:" + newFlg);

		// for Inserting new record

		// for new Reference id
		if (newFlg.equals('Y'))

		{
			sql.append(
					"INSERT INTO BLS0110_MOD_TABLE (REPORT_REF_NO,ASSET_TYPE,REPORT_DATE,INSTRMNT_NAME,CRNCY_CODE,AMT_IN_AC,LCHG_USER_ID,LCHG_TIME)"
							+ "VALUES ('" + ReporefSeq + "','" +request.getParameter("astyp") + "','" + df1.formatdate(request.getParameter("dt2")) + "','"
							+ request.getParameter("naminst1") + "','"+ request.getParameter("accur1")
							+ "','" + request.getParameter("amtfc1") + "','" + session.getAttribute("userName")
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
		else {*/

			int rowcount = 0;
		
			sql.append("SELECT COUNT(*) as count FROM BLS0110_MOD_TABLE WHERE REPORT_DATE='" + df1.formatdate(request.getParameter("dt2"))
				 + "' AND  INSTRMNT_NAME='"
					+ request.getParameter("naminst1") + "' AND  ASSET_TYPE='"+ request.getParameter("astyp") + "'    ");
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
				sql2.append("UPDATE BLS0110_MOD_TABLE SET CRNCY_CODE='" + request.getParameter("accur1")
				+ "', AMT_IN_AC ='" + request.getParameter("amtfc1") + "', DEL_FLG='M' "
				
				+ "WHERE REPORT_DATE='"
				+ df1.formatdate(request.getParameter("dt2")) + "' " + "AND INSTRMNT_NAME='"
				+ request.getParameter("naminst1")
				+ "' AND ASSET_TYPE='"+ request.getParameter("astyp") + "'");

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
						"INSERT INTO BLS0110_MOD_TABLE (REPORT_REF_NO,ASSET_TYPE,REPORT_DATE,INSTRMNT_NAME,CRNCY_CODE,AMT_IN_AC,DEL_FLG,LCHG_USER_ID,LCHG_TIME)"
								+ "VALUES ('" + ReporefSeq + "','" +request.getParameter("astyp") + "','" + df1.formatdate(request.getParameter("dt2")) + "','"
								+ request.getParameter("naminst1") + "','"+ request.getParameter("accur1")
								+ "','" + request.getParameter("amtfc1") + "','" + request.getParameter("modtyp1") + "','" + session.getAttribute("userName")
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

			/*}*/
			log.info("executeeee Gayu");

			//return "success";
	return status;
		}
	


	public String BLS0110verify1() {
	log.info("ddddddddddd");
		XBRLBLS0110Dao bsd = new XBRLBLS0110Dao();
		ArrayList<XBRLBLS0110Bean> arr=new ArrayList<XBRLBLS0110Bean>();
		arr=bsd.BLS0110verify1();
		Gson gson = new Gson();
		det1BLS0110 = gson.toJson(arr);
		return "success";
	}
	public String BLS0110vermaster1() {
		String status="";
		XBRLBLS0110Dao bsd = new XBRLBLS0110Dao();
		HttpServletRequest request = ServletActionContext.getRequest();
		status=bsd.BLS0110verifymaster1();
		
		if(status.equals("success")) {
			resalert="Verification Successful";
		}else {
			resalert="Technical Issue.Try Again Later.";
		}
		
		return "success";
	}
	

	public String BLS0110verify2() {
	log.info("ddddddddddd");
		XBRLBLS0110Dao bsd = new XBRLBLS0110Dao();
		ArrayList<XBRLBLS0110Bean> arr=new ArrayList<XBRLBLS0110Bean>();
		arr=bsd.BLS0110verify2();
		Gson gson = new Gson();
		detBLS0110 = gson.toJson(arr);
		return "success";
	}
	public String BLS0110vermaster2() {
		String status="";
		XBRLBLS0110Dao bsd = new XBRLBLS0110Dao();
		HttpServletRequest request = ServletActionContext.getRequest();
		status=bsd.BLS0110verifymaster2();
		
		if(status.equals("success")) {
			resalert="Verification Successful";
		}else {
			resalert="Technical Issue.Try Again Later.";
		}
		
		return "success";
	}
	
}
