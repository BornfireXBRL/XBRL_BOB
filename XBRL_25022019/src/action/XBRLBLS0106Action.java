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
import bean.XBRLBLS0106Bean;
import dao.XBRLBLS0106Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;

import org.apache.log4j.Logger;

/***************************************************************************************************************
 * * * @companyName : Bonfire Innovation Private Limited Chennai * * @project :
 * Extensible Business Reporting Language (XBRL) * * @name :
 * XBRLBLS0106Action.java * * @path : action * * @author : D PraveenBabu *
 * * @version : 1.0 * * @functionality : It contains the action with multiple
 * methods to create BLS0106 Report. * * * @relatedScripts :
 * bean.XBRLBLS0106Bean.java,dao.XBRLBLS0106Dao.java * * @creationDate : *
 * * @lastModifiedDate : * * @modificationHistory : * *
 ***************************************************************************************************************/
public class XBRLBLS0106Action {
	
	static Logger log = Logger.getLogger(XBRLBLS0106Action.class);

	
	public String refno;

	public String summaryBLS0106;

	public String detBLS0106;
	public String det1BLS0106;
	public String resalert;
	
	public String getResalert() {
		return resalert;
	}

	public void setResalert(String resalert) {
		this.resalert = resalert;
	}

	public String getDet1BLS0106() {
		return det1BLS0106;
	}

	public void setDet1BLS0106(String det1bls0106) {
		det1BLS0106 = det1bls0106;
	}

	public String getSummaryBLS0106() {
		return summaryBLS0106;
	}

	public void setSummaryBLS0106(String summaryBLS0106) {
		this.summaryBLS0106 = summaryBLS0106;
	}

	public String getDetBLS0106() {
		return detBLS0106;
	}

	public void setDetBLS0106(String detBLS0106) {
		this.detBLS0106 = detBLS0106;
	}

	public String getRefno() {
		return refno;
	}

	public void setRefno(String refno) {
		this.refno = refno;
	}

	
	public String modXbBLSCreate106() throws SQLException {

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
		log.info("insert Action modXbCreateBLS0106");

	/*	log.info("NEW FLG:" + newFlg);*/

		// for Inserting new record

		// for new Reference id
		/*if (newFlg.equals('Y'))

		{
			sql.append(
					"INSERT INTO BLS0106_MOD_TABLE (REPORT_REF_NO,ACCT_NUMBER,ACCT_NAME,TRANSFERABLE_FLG,SCHM_TYPE,NATURE_OF_CUSTOMER,NRE_FLG,CURRENCY_CODE,BALANCE_AMT,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
							+ "VALUES ('" + ReporefSeq + "','" + request.getParameter("accno") + "','"
							+ request.getParameter("accname") + "','" + request.getParameter("transflg") + "','"
							+ request.getParameter("schmtyp") + "','" + request.getParameter("natuofcust") + "','"
							+ request.getParameter("nreflg") + "','" +  request.getParameter("crncy")+ "','"
							+ request.getParameter("balancamt") + "','" + df1.formatdate(request.getParameter("repdate"))
							+ "','" + session.getAttribute("userName")
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
			sql.append(
					"SELECT COUNT (*) as count FROM   (SELECT DISTINCT REPORT_DATE FROM  BLS0106_MOD_TABLE where  REPORT_DATE ='" + df1.formatdate(request.getParameter("dt2")) + "' "
							+ "AND ACCT_NUMBER ='"
							+ request.getParameter("accno") + "')");
			System.out.println("fsf"+count);
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
				sql2.append("update BLS0106_MOD_TABLE set ACCT_NAME ='"+ request.getParameter("accname") 
				+ "',CUST_ID ='" +request.getParameter("custId")

						+ "',TRANSFERABLE_FLG ='" +request.getParameter("transflg")
						+ "',SCHM_TYPE='"+request.getParameter("schmtyp")
						+ "',NATURE_OF_CUSTOMER='"+request.getParameter("natuofcust")
						+"',NRE_FLG ='" + request.getParameter("nreflg")
						+"',CURRENCY_CODE ='" + request.getParameter("currency")
						+"',BALANCE_AMT ='" + request.getParameter("balancamt")
						+"',REPORT_DATE ='" + df1.formatdate(request.getParameter("repdate"))+"' "
						+ " where ACCT_NUMBER ='" + request.getParameter("accno")
						+ "' and REPORT_DATE ='" + df1.formatdate(request.getParameter("dt2"))+"'");

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

				sql3.append("INSERT INTO BLS0106_MOD_TABLE(" + "REPORT_REF_NO," 
						/* + "CHQ_ALPHA," */
						 +"ACCT_NUMBER," + "ACCT_NAME," + "CUST_ID," +"TRANSFERABLE_FLG,"+"SCHM_TYPE," +"NATURE_OF_CUSTOMER," 
						 +"NRE_FLG,"+"CURRENCY_CODE,"+"BALANCE_AMT,"+ "REPORT_DATE,"+"DEL_FLG,"+"LCHG_USER_ID," + "LCHG_TIME)");

				sql3.append("values('" + ReporefSeq + "','"  + request.getParameter("accno") + "','"
						+ request.getParameter("accname") + "','"+ request.getParameter("custId") + "','"+ request.getParameter("transflg")
						 +"','"+request.getParameter("schmtyp")
						+ "','" + request.getParameter("natuofcust") + "','" + request.getParameter("nreflg")
						
						+ "','" + request.getParameter("currency") + "','" + request.getParameter("balancamt")
						+ "','"+ df1.formatdate( request.getParameter("repdate"))
						+ "','" 
						+  request.getParameter("modtyp")+"','"+ session.getAttribute("userName")+ "',SYSDATE) ");
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

		

		return "success";

	}
	public String detailBLS0106saves() {

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

	public String BLS0106verify() {
	log.info("ddddddddddd");
		XBRLBLS0106Dao bsd = new XBRLBLS0106Dao();
		ArrayList<XBRLBLS0106Bean> arr=new ArrayList<XBRLBLS0106Bean>();
		arr=bsd.BLS0106verify();
		Gson gson = new Gson();
		det1BLS0106 = gson.toJson(arr);
		return "success";
	}
	public String BLS0106vermaster() {
		String status="";
		XBRLBLS0106Dao bsd = new XBRLBLS0106Dao();
		HttpServletRequest request = ServletActionContext.getRequest();
		status=bsd.BLS0106verifymaster();
		System.out.println("gj");
		if(status.equals("success")) {
			resalert="Verification Successful";
		}else {
			resalert="Technical Issue.Try Again Later.";
		}
		
		return "success";
	}
	

	

	/* --------------- SUMMARY BUTTOn CLICK --------------------------- */

	public String summaryBLS0106detail() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("in summaryBLS0106detail");

		log.info("test----->" + request.getParameter("reportrefnos") + "dt333"
				 + df.formatdate(request.getParameter("dt2")));
		XBRLBLS0106Dao bsd = new XBRLBLS0106Dao();
		ArrayList<XBRLBLS0106Bean> arl = bsd.xbrlblssumEP(request.getParameter("reptype"),df.formatdate(request.getParameter("dt2")), request.getParameter("reportrefnos"),request.getParameter("curr"));

		// summarystandard = arl.toArray(new String[arl.size()]);
		log.info("ARL------------>" + arl.size());
		Gson gson = new Gson();
		summaryBLS0106 = gson.toJson(arl);

		return "success";

	}

	public String detailBLS0106() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		
		
		XBRLBLS0106Dao bsd = new XBRLBLS0106Dao();

		ArrayList<XBRLBLS0106Bean> arl = bsd.xbrlblsajaxdetails(request.getParameter("repname"),request.getParameter("ReporefSeq"),
				request.getParameter("instno"),df.formatdate(request.getParameter("dt2")), request.getParameter("curr"));

		// summarystandard = arl.toArray(new String[arl.size()]);
		
		Gson gson = new Gson();
		detBLS0106 = gson.toJson(arl);
		return "success";

	}

	
	
	
	
}
