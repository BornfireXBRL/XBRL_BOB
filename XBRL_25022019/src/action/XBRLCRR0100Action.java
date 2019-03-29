
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
import bean.XBRLCRR0100Bean;
import bean.XBRLCRR0100Bean;
import dao.XBRLCRR0100Dao;
import dao.XBRLCRR0100Dao;
import dao.XBRLCRR0100Dao;
import dao.XBRLCRR0100Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;

import org.apache.log4j.Logger;
public class XBRLCRR0100Action {
	
	static Logger log = Logger.getLogger(XBRLCRR0100Action.class);

	public String sec1CRR0100;
	public String sec1CRR0100s2;
	public String sec1CRR0100s3;
	public String sec1CRR0100s4;
	public String sec1CRR0100s5;
	public String sec1CRR0100s6;
	public String sec1CRR0100s7;
	public String sec1CRR0100s8;
	public String sec1CRR0100s9;
	public String sec1CRR0100s10;
	
	
	public String det1CRR0100;
	public String det2CRR0100;
	public String getDet2CRR0100() {
		return det2CRR0100;
	}

	public void setDet2CRR0100(String det2crr0100) {
		det2CRR0100 = det2crr0100;
	}

	public static Logger getLog() {
		return log;
	}

	public static void setLog(Logger log) {
		XBRLCRR0100Action.log = log;
	}

	public String getDet1CRR0100() {
		return det1CRR0100;
	}

	public void setDet1CRR0100(String det1crr0100) {
		det1CRR0100 = det1crr0100;
	}

	public String detCRR0100;
	public String det10CRR0100;
	

	public String refno;
	
	
	
	
	public String getRefno() {
		return refno;
	}

	public void setRefno(String refno) {
		this.refno = refno;
	}

	
	public String getDet10CRR0100() {
		return det10CRR0100;
	}

	public void setDet10CRR0100(String det10crr0100) {
		det10CRR0100 = det10crr0100;
	}

	public String getSec1CRR0100() {
		return sec1CRR0100;
	}

	public void setSec1CRR0100(String sec1crr0100) {
		sec1CRR0100 = sec1crr0100;
	}

	public String getSec1CRR0100s2() {
		return sec1CRR0100s2;
	}

	public void setSec1CRR0100s2(String sec1crr0100s2) {
		sec1CRR0100s2 = sec1crr0100s2;
	}

	public String getSec1CRR0100s3() {
		return sec1CRR0100s3;
	}

	public void setSec1CRR0100s3(String sec1crr0100s3) {
		sec1CRR0100s3 = sec1crr0100s3;
	}

	public String getSec1CRR0100s4() {
		return sec1CRR0100s4;
	}

	public void setSec1CRR0100s4(String sec1crr0100s4) {
		sec1CRR0100s4 = sec1crr0100s4;
	}

	public String getSec1CRR0100s5() {
		return sec1CRR0100s5;
	}

	public void setSec1CRR0100s5(String sec1crr0100s5) {
		sec1CRR0100s5 = sec1crr0100s5;
	}

	public String getSec1CRR0100s6() {
		return sec1CRR0100s6;
	}

	public void setSec1CRR0100s6(String sec1crr0100s6) {
		sec1CRR0100s6 = sec1crr0100s6;
	}

	public String getSec1CRR0100s7() {
		return sec1CRR0100s7;
	}

	public void setSec1CRR0100s7(String sec1crr0100s7) {
		sec1CRR0100s7 = sec1crr0100s7;
	}

	public String getSec1CRR0100s8() {
		return sec1CRR0100s8;
	}

	public void setSec1CRR0100s8(String sec1crr0100s8) {
		sec1CRR0100s8 = sec1crr0100s8;
	}

	public String getSec1CRR0100s9() {
		return sec1CRR0100s9;
	}

	public void setSec1CRR0100s9(String sec1crr0100s9) {
		sec1CRR0100s9 = sec1crr0100s9;
	}

	public String getSec1CRR0100s10() {
		return sec1CRR0100s10;
	}

	public void setSec1CRR0100s10(String sec1crr0100s10) {
		sec1CRR0100s10 = sec1crr0100s10;
	}

	public String getDetCRR0100() {
		return detCRR0100;
	}

	public void setDetCRR0100(String detCRR0100) {
		this.detCRR0100 = detCRR0100;
	}

	public String section1CRR0100() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside CRR0100 action");
		
		XBRLCRR0100Dao bsd = new XBRLCRR0100Dao();

		ArrayList<XBRLCRR0100Bean> arl = bsd.xbrlCRR0100(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1CRR0100 = gson.toJson(arl);

		return "success";

	}
	
	
	public String section10CRR0100() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside CRR010010 action");
		
		XBRLCRR0100Dao bsd = new XBRLCRR0100Dao();

		ArrayList<XBRLCRR0100Bean> arl = bsd.xbrlCRR0100s10(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1CRR0100s10 = gson.toJson(arl);

		return "success";

	}

	
	public String detailCRR0100() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		
		
		XBRLCRR0100Dao bsd = new XBRLCRR0100Dao();

		/*ArrayList<XBRLFIM0900Bean> arl = bsd.xbrlfim0900ajaxdetails(request.getParameter("repname"),request.getParameter("ReporefSeq"),
				request.getParameter("instno"),df.formatdate(request.getParameter("dt1")),df.formatdate(request.getParameter("dt2")), request.getParameter("curr"));*/

		ArrayList<XBRLCRR0100Bean> arl = bsd.xbrlCRR0100ajaxdetails(request.getParameter("repname"),request.getParameter("ReporefSeq"),
				request.getParameter("instno"),df.formatdate(request.getParameter("dt2")), request.getParameter("curr"));
		
		// summarystandard = arl.toArray(new String[arl.size()]);
		
		Gson gson = new Gson();
		detCRR0100 = gson.toJson(arl);

		return "success";

	}	
	
	public String detail10CRR0100() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		
		
		XBRLCRR0100Dao bsd = new XBRLCRR0100Dao();

		/*ArrayList<XBRLFIM0900Bean> arl = bsd.xbrlfim0900ajaxdetails(request.getParameter("repname"),request.getParameter("ReporefSeq"),
				request.getParameter("instno"),df.formatdate(request.getParameter("dt1")),df.formatdate(request.getParameter("dt2")), request.getParameter("curr"));*/

		ArrayList<XBRLCRR0100Bean> arl = bsd.xbrlCRR0100ajaxdetails10(request.getParameter("repname"),request.getParameter("ReporefSeq"),
				request.getParameter("instno"),df.formatdate(request.getParameter("dt2")), request.getParameter("curr"));
		
		// summarystandard = arl.toArray(new String[arl.size()]);
		
		Gson gson = new Gson();
		det10CRR0100 = gson.toJson(arl);

		return "success";

	}	
	

	public String modXbCRRCreate100() throws SQLException {

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
		log.info("insert Action modXbCreateCRR0100");
/*
		log.info("NEW FLG:" + newFlg);

		// for Inserting new record

		// for new Reference id
		if (newFlg.equals('Y'))

		{
			
			log.info("1");
			
			
			
			sql.append("INSERT INTO CRR0100_MOD_TABLE(REPORT_REF_NO,ACCT_NUMBER,ACCT_NAME,CUST_ID,ACCT_BALANCE_AMT_AC,ACCT_CRNCY_CODE,NATURE_OF_CUST,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
							+ "values('" + ReporefSeq + "','" + request.getParameter("accno")
							+ "','" + request.getParameter("accnam") + "','" + request.getParameter("cusid") + "','"
							+ request.getParameter("accbalamtac") + "','" 
									+ request.getParameter("accrcode") + "','" 
									+ request.getParameter("natofcus") + "','"
									+df1.formatdate(request.getParameter("reportdate"))+ "','" + session.getAttribute("userName")
							+ "',SYSDATE)");
			log.info(sql);
			log.info("gfdg");
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
			
			
			/*sql.append(
					"SELECT COUNT (*) as cnt FROM   (SELECT DISTINCT REPORT_DATE FROM  BLS0106_MOD_TABLE where REPORT_REF_NO='"
							+ ReporefSeq.trim() + "' and ACCT_NUMBER = '" + request.getParameter("accno")
							+ "'  and REPORT_DATE >='" + df1.formatdate(request.getParameter("dt2"))+"')");*/
			
			
			log.info("11");
			sql.append("SELECT Count (*) as count FROM   (SELECT DISTINCT REPORT_DATE FROM  CRR0100_MOD_TABLE where  ACCT_NUMBER = '"
							+ request.getParameter("accno") + "'and REPORT_DATE ='" + df1.formatdate(request.getParameter("reportdate"))+"')");

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
				sql2.append("update  CRR0100_MOD_TABLE set REPORT_REF_NO ='" + ReporefSeq + "',ACCT_NAME ='" 
						+ request.getParameter("accnam")+ "',CUST_ID ='" + request.getParameter("cusid") + "',ACCT_BALANCE_AMT_AC ='"
											+ request.getParameter("accbalamtac") + "',ACCT_CRNCY_CODE ='"
						+ request.getParameter("accrcode") + "',NATURE_OF_CUST ='"
											+ request.getParameter("natofcus") 
						+ "',DEL_FLG='M' "
					+ " where ACCT_NUMBER ='" + request.getParameter("accno") +"'and REPORT_DATE ='" + df1.formatdate(request.getParameter("reportdate"))+"'");
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

				log.info("143534");
				
		sql3.append("INSERT INTO CRR0100_MOD_TABLE(REPORT_REF_NO,ACCT_NUMBER,ACCT_NAME,CUST_ID,ACCT_BALANCE_AMT_AC,ACCT_CRNCY_CODE,NATURE_OF_CUST,REPORT_DATE,DEL_FLG,LCHG_USER_ID,LCHG_TIME)"
						+ "values('" + ReporefSeq + "','" + request.getParameter("accno")
						+ "','" + request.getParameter("accnam") + "','" + request.getParameter("cusid") + "','"
						+ request.getParameter("accbalamtac") + "','" 
								+ request.getParameter("accrcode") + "','" 
								+ request.getParameter("natofcus") + "','"
								+df1.formatdate(request.getParameter("reportdate"))+ "','"+request.getParameter("modtyp")+"','" + session.getAttribute("userName")
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

		//}

		return "success";

	}
	
	
	

	public String mod10XbCRRCreate100() throws SQLException {

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
		log.info("insert Action modXbCreateCRR0100");

		/*log.info("NEW FLG:" + newFlg);

		// for Inserting new record

		// for new Reference id
		if (newFlg.equals('Y'))

		{
			
			log.info("1");
			
			
			
			sql.append("INSERT INTO CRR0100_S10_MOD_TABLE(REPORT_REF_NO,TREASURY_BILLS_BANK,TREASURY_BILLS_TRADE,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
							+ "values('" + ReporefSeq + "','" + request.getParameter("trbilsbank")
							+ "','" + request.getParameter("trsbillstrade") + "','" + df1.formatdate(request.getParameter("rdate")) + "','" + session.getAttribute("userName")
							+ "',SYSDATE)");
			log.info(sql);
			log.info("gfdg");
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
			
			
			/*sql.append(
					"SELECT COUNT (*) as cnt FROM   (SELECT DISTINCT REPORT_DATE FROM  BLS0106_MOD_TABLE where REPORT_REF_NO='"
							+ ReporefSeq.trim() + "' and ACCT_NUMBER = '" + request.getParameter("accno")
							+ "'  and REPORT_DATE >='" + df1.formatdate(request.getParameter("dt2"))+"')");*/
			
			
			log.info("11");
			sql.append("SELECT Count (*) as count FROM   (SELECT DISTINCT REPORT_DATE FROM  CRR0100_S10_MOD_TABLE where   TREASURY_BILLS_BANK= '"+ request.getParameter("trbilsbank")+ "'and REPORT_DATE ='" + df1.formatdate(request.getParameter("rdate"))+"')");

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
				sql2.append("update CRR0100_S10_MOD_TABLE set REPORT_REF_NO ='" + ReporefSeq + "',TREASURY_BILLS_BANK ='"				
							+ request.getParameter("trsbillstrade") + "',TREASURY_BILLS_TRADE ='" + request.getParameter("trbilsbank")							
								+ "' ,DEL_FLG='M' "			
							+ "where REPORT_DATE ='" + df1.formatdate(request.getParameter("rdate"))+"'");
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

				log.info("143534");
				
/*
				sql3.append("INSERT INTO CRR0100_MOD_TABLE(REPORT_REF_NO,ACCT_NUMBER,ACCT_NAME,CUST_ID,ACCT_BALANCE_AMT_AC,ACCT_CRNCY_CODE,NATURE_OF_CUST,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)");


				sql3.append("values('" + ReporefSeq + "','" + request.getParameter("accno")
						+ "','" + request.getParameter("accnam") + "','" + df.formatdate(request.getParameter("cusid")) + "','"
						+ request.getParameter("accbalamtac") + "','" 
								+ request.getParameter("accrcode") + "','"
										+ request.getParameter("natofcus") + "','"
						+df1.formatdate(request.getParameter("reportdate"))+ "','"+session.getAttribute("userName")+"',SYSDATE)");*/
				sql3.append("INSERT INTO CRR0100_S10_MOD_TABLE(REPORT_REF_NO,TREASURY_BILLS_BANK,TREASURY_BILLS_TRADE,REPORT_DATE,DEL_FLG,LCHG_USER_ID,LCHG_TIME)"
						+ "values('" + ReporefSeq + "','" + request.getParameter("trbilsbank")
						+ "','" + request.getParameter("trsbillstrade") + "','" + df1.formatdate(request.getParameter("rdate")) + "','"+request.getParameter("modtyp")+"','" + session.getAttribute("userName")
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

		//}

		return "success";

	}
	
	
	
	
	public String detailBLS0104saves() {

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

	public String CRR0100verify() {
		log.info("ddddddddddd");
			XBRLCRR0100Dao bsd = new XBRLCRR0100Dao();
			ArrayList<XBRLCRR0100Bean> arr=new ArrayList<XBRLCRR0100Bean>();
			arr=bsd.CRR0100verify();
			Gson gson = new Gson();
			det1CRR0100 = gson.toJson(arr);
			return "success";
		}
	
	
	public String CRR0100verify1() {
		log.info("ddddddddddd");
			XBRLCRR0100Dao bsd = new XBRLCRR0100Dao();
			ArrayList<XBRLCRR0100Bean> arr=new ArrayList<XBRLCRR0100Bean>();
			arr=bsd.CRR0100verify1();
			Gson gson = new Gson();
			det2CRR0100 = gson.toJson(arr);
			return "success";
		}
	
	
public String resalert;
	
	
	
	
	
	public String getResalert() {
		return resalert;
	}

	public void setResalert(String resalert) {
		this.resalert = resalert;
	}
	public String CRR0100vermaster() {
		String status="";
		XBRLCRR0100Dao bsd = new XBRLCRR0100Dao();
		HttpServletRequest request = ServletActionContext.getRequest();
		status=bsd.CRR0100verifymaster();
		
		if(status.equals("success")) {
			resalert="Verification Successful";
		}else {
			resalert="Technical Issue.Try Again Later.";
		}
		
		return "success";
	}
	
	public String CRR0100vermaster1() {
		String status="";
		XBRLCRR0100Dao bsd = new XBRLCRR0100Dao();
		HttpServletRequest request = ServletActionContext.getRequest();
		status=bsd.CRR0100verifymaster1();
		
		if(status.equals("success")) {
			resalert="Verification Successful";
		}else {
			resalert="Technical Issue.Try Again Later.";
		}
		
		return "success";
	}
}
