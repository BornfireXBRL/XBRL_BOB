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
import org.apache.log4j.Logger;

import basecode.DateFormat;
import bean.XBRLBLS0100Bean;
import bean.XBRLBLS0130Bean;
import bean.XBRLBLS0140Bean;
import dao.XBRLBLS0100Dao;
import dao.XBRLBLS0130Dao;
import dao.XBRLBLS0140Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;

public class XBRLBLS0140Action {

	static Logger log = Logger.getLogger(XBRLBLS0140Action.class);

	public String s1BLS0140;
	
	public String det1BLS0140;
	public String refno;
	
	public String getRefno() {
		return refno;
	}



	public void setRefno(String refno) {
		this.refno = refno;
	}



	public String getDet1BLS0140() {
		return det1BLS0140;
	}



	public void setDet1BLS0140(String det1bls0140) {
		det1BLS0140 = det1bls0140;
	}


	public String det2BLS0140;
	
	public String getDet2BLS0140() {
		return det2BLS0140;
	}



	public void setDet2BLS0140(String det2bls0140) {
		det2BLS0140 = det2bls0140;
	}



	public String getS1BLS0140() {
		return s1BLS0140;
	}



	public void setS1BLS0140(String s1bls0140) {
		s1BLS0140 = s1bls0140;
	}

public String s2BLS0140;
	
	
	
	public String getS2BLS0140() {
		return s2BLS0140;
	}



	public void setS2BLS0140(String s2bls0140) {
		s2BLS0140 = s2bls0140;
	}


	public String section1BLS0140() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside BLS0140 action");
		
		XBRLBLS0140Dao bsd = new XBRLBLS0140Dao();

		ArrayList<XBRLBLS0140Bean> arl = bsd.xbrlBLS0140(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		s1BLS0140 = gson.toJson(arl);

		return "success";

	}
	
	
	public String section2BLS0140() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside BLS0140 action");
		
		XBRLBLS0140Dao bsd = new XBRLBLS0140Dao();

		ArrayList<XBRLBLS0140Bean> arl = bsd.xbrl2BLS0140(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		s2BLS0140 = gson.toJson(arl);

		return "success";

	}
	
	
	public String detBLS0140() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		
		
		XBRLBLS0140Dao bsd = new XBRLBLS0140Dao();

		ArrayList<XBRLBLS0140Bean> arl = bsd.xbrlBLS0140ajaxdetails(request.getParameter("repname"),request.getParameter("ReporefSeq"),
				request.getParameter("instno"),df.formatdate(request.getParameter("dt2")), request.getParameter("curr"));
		
		// summarystandard = arl.toArray(new String[arl.size()]);
		
		Gson gson = new Gson();
		det1BLS0140 = gson.toJson(arl);

		return "success";

	}	
	
	
	public String det2BLS0140() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		
		
		XBRLBLS0140Dao bsd = new XBRLBLS0140Dao();

		ArrayList<XBRLBLS0140Bean> arl = bsd.xbrlBLS01401ajaxdetails(request.getParameter("repname"),request.getParameter("ReporefSeq"),
				request.getParameter("instno"),df.formatdate(request.getParameter("dt2")), request.getParameter("curr"));
		
		// summarystandard = arl.toArray(new String[arl.size()]);
		
		Gson gson = new Gson();
		det2BLS0140 = gson.toJson(arl);

		return "success";

	}	
	
	public String modXbBLSCreate140() throws SQLException {

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
		StringBuffer sql = new StringBuffer();
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
	
      session.setAttribute("ReprefSeq", ReporefSeq);

		int rs = 0;

		int count = 0;

		

		// HttpSession session = request.getSession();
		log.info("insert Action modXbCreateBLS0100");

		/*   log.info("NEW FLG:" + newFlg);

		// for Inserting new record

		// for new Reference id
		if (newFlg.equals('Y'))

		{
			sql.append("INSERT INTO BLS0140_MOD_TABLE(REPORT_REF_NO,ACCT_NO,ACID,DEPOSIT_TYPE,DEP_AMT,ACCT_CRNCY_CODE,CUST_NRE_FLG,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)");
			

			sql.append("values('" + ReporefSeq + "','" + request.getParameter("acnum")
					+ "','" + request.getParameter("acid") + "','" + request.getParameter("deptyp") + "','"
					+ request.getParameter("depamt") + "','"
					+request.getParameter("actcurcod")+ "','"
			        +request.getParameter("cusnreflg")+ "','"	
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
*/
			int rowcount = 0;
			sql.append("SELECT COUNT(*) as count FROM BLS0140_MOD_TABLE WHERE  REPORT_DATE='" + df1.formatdate(request.getParameter("repdat")) + "' " + "AND ACCT_NO='"
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
				sql2.append("UPDATE BLS0140_MOD_TABLE SET REPORT_DATE='" + df1.formatdate(request.getParameter("repdat")) + "',ACID ='" + request.getParameter("acid")
				+ "', DEPOSIT_TYPE ='" + request.getParameter("deptyp")
				+ "', DEP_AMT='" + request.getParameter("depamt")
				+ "', ACCT_CRNCY_CODE ='" + request.getParameter("actcurcod")
				+ "', CUST_NRE_FLG ='" + request.getParameter("cusnreflg")+ "',DEL_FLG='M' " 
				+ "WHERE REPORT_DATE='"
				+ df1.formatdate(request.getParameter("repdat")) + "' " + "AND ACCT_NO='"
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

				sql3.append("INSERT INTO BLS0140_MOD_TABLE(REPORT_REF_NO,ACCT_NO,ACID,DEPOSIT_TYPE,DEP_AMT,ACCT_CRNCY_CODE,CUST_NRE_FLG,REPORT_DATE,DEL_FLG,LCHG_USER_ID,LCHG_TIME)");
				

				sql3.append("values('" + ReporefSeq + "','" + request.getParameter("acnum")
						+ "','" + request.getParameter("acid") + "','" + request.getParameter("deptyp") + "','"
						+ request.getParameter("depamt") + "','"
						+request.getParameter("actcurcod")+ "','"
				        +request.getParameter("cusnreflg")+ "','"	
				        +df1.formatdate(request.getParameter("repdat"))+ "','"+request.getParameter("modtyp")+"','"
				         + session.getAttribute("userName") 
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
		log.info("executeeee");
		//return "success";
return status;
	}
	
	
	public String modXbBLSCreate1402() throws SQLException {

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

	/*	if (request.getParameter("reportrefno").startsWith("R")) {

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
		log.info("insert Action modXbCreateBLS0110");

		/*log.info("NEW FLG:" + newFlg);

		// for Inserting new record

		// for new Reference id
		if (newFlg.equals('Y'))

		{
			sql.append(
					"INSERT INTO BLS0110_MOD_TABLE (REPORT_REF_NO,ASSET_TYPE,REPORT_DATE,INSTRMNT_NAME,CRNCY_CODE,AMT_IN_AC,LCHG_USER_ID,LCHG_TIME)"
							+ "VALUES ('" + ReporefSeq + "','" +request.getParameter("astyp") + "','" + df1.formatdate(request.getParameter("dt2")) + "','"
							+ request.getParameter("naminst") + "','"+ request.getParameter("accur")
							+ "','" + request.getParameter("fcamt") + "','" + session.getAttribute("userName")
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
			sql.append("SELECT COUNT(*) as count FROM BLS0110_MOD_TABLE WHERE  REPORT_DATE='" + df1.formatdate(request.getParameter("dt2")) + "' " + "AND INSTRMNT_NAME='"
					+ request.getParameter("naminst") + "'   AND ASSET_TYPE='MISC_LIAB' ");
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
				sql2.append("UPDATE BLS0110_MOD_TABLE SET CRNCY_CODE='" + request.getParameter("accur")
				+ "', AMT_IN_AC ='" + request.getParameter("fcamt") + "',DEL_FLG='M' "
						+ "WHERE REPORT_DATE='"
				+ df1.formatdate(request.getParameter("dt2")) + "' " + "AND INSTRMNT_NAME='"
				+ request.getParameter("naminst")
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
				
				log.info("===ReporefSeq===" + ReporefSeq);

				sql3.append(
						"INSERT INTO BLS0110_MOD_TABLE (REPORT_REF_NO,ASSET_TYPE,REPORT_DATE,INSTRMNT_NAME,CRNCY_CODE,AMT_IN_AC,DEL_FLG,LCHG_USER_ID,LCHG_TIME)"
								+ "VALUES ('" + ReporefSeq + "','" +request.getParameter("astyp") + "','" + df1.formatdate(request.getParameter("dt2")) + "','"
								+ request.getParameter("naminst") + "','"+ request.getParameter("accur")
								+ "','" + request.getParameter("fcamt") + "','"+request.getParameter("modtyp")+"','"							
								+ session.getAttribute("userName")+"',SYSDATE)");
				log.info("executed"+sql3.toString());

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
		log.info("executeeee Gayu");

		//return "success";
return status;
	}
	
	public String detailBLS0140saves() {

		ConnectionManager connmgr=new ConnectionManager();
		Connection conn=connmgr.getConnection();
				HttpServletRequest request = ServletActionContext.getRequest();
				DateFormat df = new DateFormat();
				log.info("{call GENERATE_XBRL_SP('"+request.getParameter("reptype")+"','"+NullCheck.isNotZero(request.getParameter("refno"))+"','"+df.formatdate(request.getParameter("dt2"))+"','"+df.formatdate(request.getParameter("dt1"))+"','"+df.formatdate(request.getParameter("dt2"))+"','"+request.getParameter("curr")+"')}");
				
				try {
				

					CallableStatement pstmt = conn.prepareCall("{call GENERATE_XBRL_SP(?,?,?,?,?,?)}");
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

	public String BLS0140verify() {
		log.info("ddddddddddd");
			XBRLBLS0140Dao bsd = new XBRLBLS0140Dao();
			ArrayList<XBRLBLS0140Bean> arr=new ArrayList<XBRLBLS0140Bean>();
			arr=bsd.BLS0140verify();
			Gson gson = new Gson();
			det1BLS0140 = gson.toJson(arr);
			return "success";
		}
	public String BLS0140verify1() {
		log.info("ddddddddddd");
			XBRLBLS0140Dao bsd = new XBRLBLS0140Dao();
			ArrayList<XBRLBLS0140Bean> arr=new ArrayList<XBRLBLS0140Bean>();
			arr=bsd.BLS0140verify1();
			Gson gson = new Gson();
			det2BLS0140 = gson.toJson(arr);
			return "success";
		}
	
public String resalert;
	
	
	
	
	
	public String getResalert() {
		return resalert;
	}

	public void setResalert(String resalert) {
		this.resalert = resalert;
	}
	public String BLS0140vermaster() {
		String status="";
		XBRLBLS0140Dao bsd = new XBRLBLS0140Dao();
		HttpServletRequest request = ServletActionContext.getRequest();
		status=bsd.BLS0140verifymaster();
		
		if(status.equals("success")) {
			resalert="Verification Successful";
		}else {
			resalert="Technical Issue.Try Again Later.";
		}
		
		return "success";
	}
	
	public String BLS0140vermaster1() {
		String status="";
		XBRLBLS0140Dao bsd = new XBRLBLS0140Dao();
		HttpServletRequest request = ServletActionContext.getRequest();
		status=bsd.BLS0140verifymaster1();
		
		if(status.equals("success")) {
			resalert="Verification Successful";
		}else {
			resalert="Technical Issue.Try Again Later.";
		}
		
		return "success";
	}
}
