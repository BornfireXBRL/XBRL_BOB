
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

import bean.XBRLBLS0103Bean;
import bean.XBRLBLS0103Bean;
import dao.XBRLBLS0103Dao;
import dao.XBRLBLS0103Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;

import org.apache.log4j.Logger;

public class XBRLBLS0103Action {
	
	static Logger log = Logger.getLogger(XBRLBLS0103Action.class);

	public String s1BLS0103;
	public String s2BLS0103;
	public String getS1BLS0103() {
		return s1BLS0103;
	}

	public void setS1BLS0103(String s1BLS0103) {
		s1BLS0103 = s1BLS0103;
	}

	public String getS2BLS0103() {
		return s2BLS0103;
	}

	public void setS2BLS0103(String s2BLS0103) {
		s2BLS0103 = s2BLS0103;
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

	public String det1BLS0103;
	public String getDet1BLS0103() {
		return det1BLS0103;
	}

	public void setDet1BLS0103(String det1BLS0103) {
		det1BLS0103 = det1BLS0103;
	}

	public String getDet2BLS0103() {
		return det2BLS0103;
	}

	public void setDet2BLS0103(String det2BLS0103) {
		det2BLS0103 = det2BLS0103;
	}


	public String det2BLS0103;
	

	

	public String section1BLS0103() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside BLS0103 action");
		
		XBRLBLS0103Dao bsd = new XBRLBLS0103Dao();

		ArrayList<XBRLBLS0103Bean> arl = bsd.xbrlBLS0103(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		s1BLS0103 = gson.toJson(arl);
log.info(s1BLS0103);
		return "success";

	}
	
	public String section2BLS0103() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside BLS0103 sec2 action");
		
		XBRLBLS0103Dao bsd = new XBRLBLS0103Dao();

		ArrayList<XBRLBLS0103Bean> arl = bsd.xbrlBLS0103s2(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		s2BLS0103 = gson.toJson(arl);

		return "success";

	}
	
	
	
	
	
	public String det1BLS0103() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		
		
		XBRLBLS0103Dao bsd = new XBRLBLS0103Dao();

		ArrayList<XBRLBLS0103Bean> arl = bsd.xbrlBLS0103ajaxdetails(request.getParameter("repname"),request.getParameter("ReporefSeq"),
				request.getParameter("instno"),df.formatdate(request.getParameter("dt2")), request.getParameter("curr"));
		
		// summarystandard = arl.toArray(new String[arl.size()]);
		
		Gson gson = new Gson();
		det1BLS0103 = gson.toJson(arl);

		return "success";

	}	
	
/*	public String det2BLS0103() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		
		
		XBRLBLS0103Dao bsd = new XBRLBLS0103Dao();

		
		ArrayList<XBRLBLS0103Bean> arl = bsd.xbrlBLS0103ajaxdetails2(request.getParameter("repname"),request.getParameter("ReporefSeq"),
				request.getParameter("instno"),df.formatdate(request.getParameter("dt2")), request.getParameter("curr"));
		
		// summarystandard = arl.toArray(new String[arl.size()]);
		
		Gson gson = new Gson();
		det2BLS0103 = gson.toJson(arl);

		return "success";

	}	
	*/
	public String modXbBLSCreate103() throws SQLException {

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
		log.info("insert Action modXbCreateBLS0100");

		

		// for Inserting new record

		// for new Reference id
		
/*
		{
			sql.append(
					" INSERT INTO BLS0103_MOD_TABLE(REPORT_REF_NO,REPORT_DATE,CUST_ID,CUST_NAME,UNIQ_ID,ISIC_CODE, INVEST_TYPE,INVEST_INSTRMNT_TYPE,CLASS_OF_SHARES,QUAL_FOR_DEDUCTION,CNTRY_NAME,ACQUISITION_DATE,MATURITY_DATE,CRNCY_CODE,NOMINAL_VALUE,TRADING_BOOK_COST,BANKING_BOOK_COST,SHARE_PCNT,DATE_REG_APPR,INVST_VALUE_DISPOSED,LCHG_USER_ID,LCHG_TIME)" + "VALUES ('"
							+ ReporefSeq + "','" + df1.formatdate(request.getParameter("redat")) + "','"+ request.getParameter("cusid") 
							+ "','" + request.getParameter("cusnam") + "','" + request.getParameter("uniqid") + "','"
							+ request.getParameter("isiccod") + "','"+ request.getParameter("investyp") 
							+ "','" + request.getParameter("invesintrutyp") + "','" + request.getParameter("clsshr") 
							+ "','" + request.getParameter("quaedu") + "','" + request.getParameter("counam") 
							+ "','" +df.formatdate( request.getParameter("acqudat"))+ "','" + df.formatdate(request.getParameter("matudat")) 
							+ "','" + request.getParameter("currcod") + "','" + request.getParameter("nomival") 
							+ "','" + request.getParameter("tradcos") + "','" + request.getParameter("bankcos")
							+ "','" + NullCheck.isNotZero(request.getParameter("sharpc")) + "','" + df.formatdate(request.getParameter("pagregap")) + "','"+ request.getParameter("invesdip") + "','"
							+ session.getAttribute("userName")+"',SYSDATE)");
			
			

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
		log.info("njhjhjjk");
			int rowcount = 0;
			sql.append("SELECT COUNT(*) as count FROM BLS0103_MOD_TABLE WHERE REPORT_REF_NO='" + ReporefSeq
					+ "' AND REPORT_DATE='" + df1.formatdate(request.getParameter("dt2")) + "' "
					+ "AND CUST_ID ='"
					+ request.getParameter("cusid") + "'");
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
				sql2.append("update BLS0103_MOD_TABLE set CUST_NAME ='" + request.getParameter("cusnam")
				+ "',UNIQ_ID ='" + request.getParameter("uniqid") + "',ISIC_CODE ='"
				+ request.getParameter("isiccod") + "',INVEST_TYPE ='"
				+ request.getParameter("investyp") + "',INVEST_INSTRMNT_TYPE ='" + request.getParameter("invesintrutyp")
				+ "',CLASS_OF_SHARES ='" + request.getParameter("clsshr") + "',QUAL_FOR_DEDUCTION ='"
				+ request.getParameter("quaedu") + "',CNTRY_NAME ='"
				+ request.getParameter("counam") + "',ACQUISITION_DATE ='" + df1.formatdate(request.getParameter("acqudat"))
				+ "',MATURITY_DATE ='" + df1.formatdate(request.getParameter("matudat")) + "',CRNCY_CODE ='"
				+ request.getParameter("currcod") + "',NOMINAL_VALUE ='"
				+ request.getParameter("nomival") + "',TRADING_BOOK_COST ='" + request.getParameter("tradcos")
				+ "',BANKING_BOOK_COST ='" + request.getParameter("bankcos") + "',SHARE_PCNT ='"
				+ request.getParameter("sharpc") + "',DATE_REG_APPR ='"
				+ df1.formatdate(request.getParameter("pagregap"))+ "',INVST_VALUE_DISPOSED ='" + request.getParameter("invesdip")+"' DEL_FLG='M' "
				+ "WHERE REPORT_REF_NO='" + ReporefSeq + "' AND REPORT_DATE='"
				+ df1.formatdate(request.getParameter("redat")) + "' " + "AND CUST_ID='"
				+ request.getParameter("cusid")
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
						" INSERT INTO BLS0103_MOD_TABLE(REPORT_REF_NO,REPORT_DATE,CUST_ID,CUST_NAME,UNIQ_ID,ISIC_CODE, INVEST_TYPE,INVEST_INSTRMNT_TYPE,CLASS_OF_SHARES,QUAL_FOR_DEDUCTION,CNTRY_NAME,ACQUISITION_DATE,MATURITY_DATE,CRNCY_CODE,NOMINAL_VALUE,TRADING_BOOK_COST,BANKING_BOOK_COST,SHARE_PCNT,DATE_REG_APPR,INVST_VALUE_DISPOSED,DEL_FLG,LCHG_USER_ID,LCHG_TIME)" + "VALUES ('"
								+ ReporefSeq + "','" + df1.formatdate(request.getParameter("redat")) + "','"+ request.getParameter("cusid") 
								+ "','" + request.getParameter("cusnam") + "','" + request.getParameter("uniqid") + "','"
								+ request.getParameter("isiccod") + "','"+ request.getParameter("investyp") 
								+ "','" + request.getParameter("invesintrutyp") + "','" + request.getParameter("clsshr") 
								+ "','" + request.getParameter("quaedu") + "','" + request.getParameter("counam") 
								+ "','" +df.formatdate( request.getParameter("acqudat"))+ "','" + df.formatdate(request.getParameter("matudat")) 
								+ "','" + request.getParameter("currcod") + "','" + request.getParameter("nomival") 
								+ "','" + request.getParameter("tradcos") + "','" + request.getParameter("bankcos")
								+ "','" + NullCheck.isNotZero(request.getParameter("sharpc")) + "','" + df.formatdate(request.getParameter("pagregap")) + "','"+ request.getParameter("invesdip") + "','"
								+  request.getParameter("modtyp")+"','"+ session.getAttribute("userName")+"',SYSDATE)");
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

		

		//return "success";
return status;
	}
	
	
	public String detailBLS0103saves() {

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

	public String BLS0103verify() {
	log.info("ddddddddddd");
		XBRLBLS0103Dao bsd = new XBRLBLS0103Dao();
		ArrayList<XBRLBLS0103Bean> arr=new ArrayList<XBRLBLS0103Bean>();
		arr=bsd.BLS0103verify();
		Gson gson = new Gson();
		det1BLS0103 = gson.toJson(arr);
		return "success";
	}
	public String BLS0103vermaster() {
		String status="";
		XBRLBLS0103Dao bsd = new XBRLBLS0103Dao();
		HttpServletRequest request = ServletActionContext.getRequest();
		status=bsd.BLS0103verifymaster();
		
		if(status.equals("success")) {
			resalert="Verification Successful";
		}else {
			resalert="Technical Issue.Try Again Later.";
		}
		
		return "success";
	}
	
	
}
