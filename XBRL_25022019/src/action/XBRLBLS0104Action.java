
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

import bean.XBRLBLS0104Bean;
import bean.XBRLBLS0104Bean;
import dao.XBRLBLS0104Dao;
import dao.XBRLBLS0104Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;

public class XBRLBLS0104Action {
	
	static Logger log = Logger.getLogger(XBRLBLS0104Action.class);

	public String s1BLS0104;
	public String s2BLS0104;
	public String s3BLS0104;
	public String s4BLS0104;
	public String s5BLS0104;
	public String s6BLS0104;
	public String s7BLS0104;
	public String s8BLS0104;
	public String getS3BLS0104() {
		return s3BLS0104;
	}

	public void setS3BLS0104(String s3bls0104) {
		s3BLS0104 = s3bls0104;
	}

	public String getS4BLS0104() {
		return s4BLS0104;
	}

	public void setS4BLS0104(String s4bls0104) {
		s4BLS0104 = s4bls0104;
	}

	public String getS5BLS0104() {
		return s5BLS0104;
	}

	public void setS5BLS0104(String s5bls0104) {
		s5BLS0104 = s5bls0104;
	}

	public String getS6BLS0104() {
		return s6BLS0104;
	}

	public void setS6BLS0104(String s6bls0104) {
		s6BLS0104 = s6bls0104;
	}

	public String getS7BLS0104() {
		return s7BLS0104;
	}

	public void setS7BLS0104(String s7bls0104) {
		s7BLS0104 = s7bls0104;
	}

	public String getS8BLS0104() {
		return s8BLS0104;
	}

	public void setS8BLS0104(String s8bls0104) {
		s8BLS0104 = s8bls0104;
	}

	public String getS1BLS0104() {
		return s1BLS0104;
	}

	public void setS1BLS0104(String s1bls0104) {
		s1BLS0104 = s1bls0104;
	}

	public String getS2BLS0104() {
		return s2BLS0104;
	}

	public void setS2BLS0104(String s2bls0104) {
		s2BLS0104 = s2bls0104;
	}

	
	public String refno;
	
	public String resalert;
	public String detBLS0104;
	
	
	public String getResalert() {
		return resalert;
	}

	public void setResalert(String resalert) {
		this.resalert = resalert;
	}

	public String getDetBLS0104() {
		return detBLS0104;
	}

	public void setDetBLS0104(String detBLS0104) {
		this.detBLS0104 = detBLS0104;
	}

	public String getRefno() {
		return refno;
	}

	public void setRefno(String refno) {
		this.refno = refno;
	}

	public String det1BLS0104;
	public String getDet1BLS0104() {
		return det1BLS0104;
	}

	public void setDet1BLS0104(String det1bls0104) {
		det1BLS0104 = det1bls0104;
	}

	public String getDet2BLS0104() {
		return det2BLS0104;
	}

	public void setDet2BLS0104(String det2bls0104) {
		det2BLS0104 = det2bls0104;
	}


	public String det2BLS0104;
	

	

	public String section1BLS0104() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside BLS0104 action");
		
		XBRLBLS0104Dao bsd = new XBRLBLS0104Dao();

		ArrayList<XBRLBLS0104Bean> arl = bsd.xbrlBLS0104(request.getParameter("reptype"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		s1BLS0104 = gson.toJson(arl);
log.info(s1BLS0104);
		return "success";

	}
	
	public String section2BLS0104() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside BLS0104 sec2 action");
		
		XBRLBLS0104Dao bsd = new XBRLBLS0104Dao();

		ArrayList<XBRLBLS0104Bean> arl = bsd.xbrlBLS0104s2(request.getParameter("reptype"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		s2BLS0104 = gson.toJson(arl);

		return "success";

	}
	
	public String section3BLS0104() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside BLS0104 sec3 action");
		
		XBRLBLS0104Dao bsd = new XBRLBLS0104Dao();

		ArrayList<XBRLBLS0104Bean> arl = bsd.xbrlBLS0104s3(request.getParameter("reptype"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		s3BLS0104 = gson.toJson(arl);

		return "success";

	}public String section4BLS0104() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside BLS0104 sec4 action");
		
		XBRLBLS0104Dao bsd = new XBRLBLS0104Dao();

		ArrayList<XBRLBLS0104Bean> arl = bsd.xbrlBLS0104s4(request.getParameter("reptype"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		s4BLS0104 = gson.toJson(arl);

		return "success";

	}public String section5BLS0104() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside BLS0104 sec5 action");
		
		XBRLBLS0104Dao bsd = new XBRLBLS0104Dao();

		ArrayList<XBRLBLS0104Bean> arl = bsd.xbrlBLS0104s5(request.getParameter("reptype"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		s5BLS0104 = gson.toJson(arl);

		return "success";

	}public String section6BLS0104() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside BLS0104 sec6 action");
		
		XBRLBLS0104Dao bsd = new XBRLBLS0104Dao();

		ArrayList<XBRLBLS0104Bean> arl = bsd.xbrlBLS0104s6(request.getParameter("reptype"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		s6BLS0104 = gson.toJson(arl);

		return "success";

	}public String section7BLS0104() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside BLS0104 sec7 action");
		
		XBRLBLS0104Dao bsd = new XBRLBLS0104Dao();

		ArrayList<XBRLBLS0104Bean> arl = bsd.xbrlBLS0104s7(request.getParameter("reptype"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		s7BLS0104 = gson.toJson(arl);

		return "success";

	}public String section8BLS0104() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside BLS0104 sec8 action");
		
		XBRLBLS0104Dao bsd = new XBRLBLS0104Dao();

		ArrayList<XBRLBLS0104Bean> arl = bsd.xbrlBLS0104s8(request.getParameter("reptype"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		s8BLS0104 = gson.toJson(arl);

		return "success";

	}
	
	
	
	public String det1BLS0104() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		
		
		XBRLBLS0104Dao bsd = new XBRLBLS0104Dao();

		ArrayList<XBRLBLS0104Bean> arl = bsd.xbrlBLS0104ajaxdetails(request.getParameter("repname"),request.getParameter("ReporefSeq"),
				request.getParameter("instno"),df.formatdate(request.getParameter("dt2")), request.getParameter("curr"));
		
		// summarystandard = arl.toArray(new String[arl.size()]);
		
		Gson gson = new Gson();
		det1BLS0104 = gson.toJson(arl);

		return "success";

	}	
	
	
	
	
	
	
	
	public String modXbBLSCreate104() throws SQLException {

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

		}
		log.info("===ReporefSeq===" + ReporefSeq);
		// log.info("<< EIDSeq >> " + EIDSeq);
*/		session.setAttribute("ReprefSeq", ReporefSeq);

		int rs = 0;

		int count = 0;

		StringBuffer sql = new StringBuffer();

		// HttpSession session = request.getSession();
		/*log.info("insert Action modXbCreateBLS0100");

		log.info("NEW FLG:" + newFlg);

		// for Inserting new record

		// for new Reference id
		if (newFlg.equals('Y'))

		{
			
			
			sql.append(
					"INSERT INTO BLS0104_MOD_TABLE(REPORT_REF_NO,ACCT_NUMBER,CUST_ID,CUST_NAME,CUST_NRE_FLG,ACCT_CRNCY_CODE,BAL_LAST_MON_AC,BAL_CUR_MON_AC,ACCRU_INT,ACCT_TYPE,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
							+ "values('" + ReporefSeq + "','" + request.getParameter("actnum")
							+ "','" + request.getParameter("cusid") + "','" +request.getParameter("cusnam") + "','"
							+ request.getParameter("cusnrflg") + "','" 
									+ request.getParameter("accurcode") + "','"		+ request.getParameter("balastmon") + "','"
											+ request.getParameter("balcurmon") + "','"	+ request.getParameter("accrint") + "','"+ request.getParameter("accrtyp") + "','"
							+df1.formatdate(request.getParameter("reportdate"))+ "','" + session.getAttribute("userName")
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
			
			
			sql.append(
					"SELECT Count (*) as count FROM   (SELECT DISTINCT REPORT_DATE FROM  BLS0104_MOD_TABLE where  ACCT_NUMBER = '"
							+ request.getParameter("actnum")+"' and REPORT_DATE ='" + df1.formatdate(request.getParameter("dt2"))+"')");
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
				sql2.append("update BLS0104_MOD_TABLE set REPORT_REF_NO ='" + ReporefSeq + "',ACCT_NUMBER ='"
						+ request.getParameter("actnum") + "',CUST_ID ='" + request.getParameter("cusid")
						+ "',CUST_NAME ='" + request.getParameter("cusnam") + "',CUST_NRE_FLG ='"
						+ request.getParameter("cusnrflg") + "',ACCT_CRNCY_CODE ='"
						+ request.getParameter("accurcode") + "',BAL_LAST_MON_AC ='"
						+ request.getParameter("balastmon") + "', BAL_CUR_MON_AC ='"
								+ request.getParameter("balcurmon") + "', ACCRU_INT ='"
										+ request.getParameter("accrint") + "', ACCT_TYPE='"
												+ request.getParameter("accrtyp") + "', REPORT_DATE ='"
														+ df.formatdate(request.getParameter("reportdate"))
														 + "'DEL_FLG='M' "+ " where ACCT_NUMBER ='" + request.getParameter("actnum") +"'and REPORT_DATE ='" + df1.formatdate(request.getParameter("dt2"))+"'");
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

				
				
				
				
				/*sql3.append("insert into BLS0104_mod_TABLE (REPORT_REF_NO," 
						+"ACCT_NUMBER,CUST_ID,CUST_NAME,CUST_NRE_FLG,ACCT_CRNCY_CODE,BAL_LAST_MON_AC,BAL_CUR_MON_AC,ACCRU_INT,ACCT_TYPE,CHANGE_TYPE,SECTION_ID,CUST_RANK,REPORT_DATE) "
						+ "select '0' as REPORT_REF_NO , ACCT_NUMBER,CUST_ID,CUST_NAME,CUST_NRE_FLG,ACCT_CRNCY_CODE,'"+request.getParameter("balastmon")+"' ,'"+request.getParameter("balcurmon")+"','"+request.getParameter("accrint")+"',ACCT_TYPE,CHANGE_TYPE,SECTION_ID,CUST_RANK,"
						+"REPORT_DATE from BLS0104_mast_TABLE where acct_number='"+request.getParameter("actnum")+"' and acct_type='"+request.getParameter("accrtyp")+"' and report_date='"+df1.formatdate(request.getParameter("reportdate"))+"' and bal_last_mon_ac='"+request.getParameter("balastmon")+"'"
						+"and  bal_cur_mon_ac='"+request.getParameter("balcurmon")+"' ");
				*/

				sql3.append("INSERT INTO BLS0104_MOD_TABLE(REPORT_REF_NO,ACCT_NUMBER,CUST_ID,CUST_NAME,CUST_NRE_FLG,ACCT_CRNCY_CODE,BAL_LAST_MON_AC,BAL_CUR_MON_AC,ACCRU_INT,ACCT_TYPE,CHANGE_TYPE,SECTION_ID,CUST_RANK,REPORT_DATE,DEL_FLG,LCHG_USER_ID,LCHG_TIME)");


				sql3.append("values('" + ReporefSeq + "','" + NullCheck.isNotNull(request.getParameter("actnum"))
				+ "','" + NullCheck.isNotNull(request.getParameter("cusid")) + "','" + NullCheck.isNotNull(request.getParameter("cusnam")) + "','"
				+ NullCheck.isNotNull(request.getParameter("cusnrflg")) + "','"
						+ NullCheck.isNotNull(request.getParameter("accurcode")) + "','"
								+ NullCheck.isNotNull(request.getParameter("balastmon")) + "','"
										+ NullCheck.isNotNull(request.getParameter("balcurmon")) + "','"
												+ NullCheck.isNotNull(request.getParameter("accrint")) + "','"
												+ NullCheck.isNotNull(request.getParameter("accrtyp")) + "','"
												+ NullCheck.isNotNull(request.getParameter("changetyp")) + "','"
												+ NullCheck.isNotNull(request.getParameter("secid")) + "','"
												+ NullCheck.isNotNull(request.getParameter("cusrank")) + "','"
				+ NullCheck.isNotNull(df1.formatdate(request.getParameter("reportdate")))+ "','"+request.getParameter("modtyp")+"','"+session.getAttribute("userName")+"',SYSDATE)");
				log.info(sql3.toString());
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
	
	
	public String bls0104verify() {
	log.info("ddddddddddd");
		XBRLBLS0104Dao bsd = new XBRLBLS0104Dao();
		ArrayList<XBRLBLS0104Bean> arr=new ArrayList<XBRLBLS0104Bean>();
		arr=bsd.BLS0104verify();
		Gson gson = new Gson();
		detBLS0104 = gson.toJson(arr);
		return "success";
	}
	public String BLS0104vermaster() {
		String status="";
		XBRLBLS0104Dao bsd = new XBRLBLS0104Dao();
		HttpServletRequest request = ServletActionContext.getRequest();
		status=bsd.BLS0104verifymaster();
		
		if(status.equals("success")) {
			resalert="Verification Successful";
		}else {
			resalert="Technical Issue.Try Again Later.";
		}
		
		return "success";
	}
	
	
	
}
