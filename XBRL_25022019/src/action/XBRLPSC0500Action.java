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
import bean.XBRLPSC0500Bean;
import dao.XBRLPSC0500Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
/***************************************************************************************************************
 * * * @companyName : Bonfire Innovation Private Limited Chennai * * @project :
 * Extensible Business Reporting Language (XBRL) * * @name :
 * XBRLpsc0500Action.java * * @path : action * * @author : D PraveenBabu *
 * * @version : 1.0 * * @functionality : It contains the action with multiple
 * methods to create psc0500 Report. * * * @relatedScripts :
 * bean.XBRLpsc0500Bean.java,dao.XBRLpsc0500Dao.java * * @creationDate : *
 * * @lastModifiedDate : * * @modificationHistory : * *
 ***************************************************************************************************************/

public class XBRLPSC0500Action {
	
	static Logger log = Logger.getLogger(XBRLPSC0500Action.class);
	public String refno;

	public String summarypsc0500;
	public String sumpsc0500;

	public String getSumpsc0500() {
		return sumpsc0500;
	}

	public void setSumpsc0500(String sumpsc0500) {
		this.sumpsc0500 = sumpsc0500;
	}

	public String detpsc0500;

	public String getDetpsc0500() {
		return detpsc0500;
	}

	public void setDetpsc0500(String detpsc0500) {
		this.detpsc0500 = detpsc0500;
	}

	public String getSummarypsc0500() {
		return summarypsc0500;
	}

	public void setSummarypsc0500(String summarypsc0500) {
		this.summarypsc0500 = summarypsc0500;
	}

	public String getRefno() {
		return refno;
	}

	public void setRefno(String refno) {
		this.refno = refno;
	}
	
	public String modXbPSCCreate0500() throws SQLException {

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
		log.info("insert Action modXbCreatePSC0500");

		log.info("NEW FLG:" + newFlg);

		// for Inserting new record

		// for new Reference id
		if (newFlg.equals('Y')) {

			sql.append(
					"INSERT INTO PSC0500_MOD_TABLE(REPORT_REF_NO,ACCT_NUMBER,ACCT_NAME,SCHM_TYPE,SCHM_CODE,ACCT_OPN_DATE,INTEREST_RATE,BALANCE_AMT,ACCT_CRNCY_CODE,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
							+ "values('" + ReporefSeq + "','" + request.getParameter("accno")
							+ "','" + request.getParameter("accna") + "','"
							+ request.getParameter("schmtyp") + "','" 
							+ request.getParameter("schcod") + "','"
							+ df1.formatdate(request.getParameter("accopda")) + "','" 
							+ request.getParameter("intrra") + "','"
							+ request.getParameter("balda") + "','" 
							+ request.getParameter("acccurcod") + "','"
							+df1.formatdate(request.getParameter("repdate"))+ "','" + session.getAttribute("userName")
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
					"SELECT Count (*) as count FROM   (SELECT DISTINCT REPORT_DATE FROM  PSC0500_MOD_TABLE where REPORT_REF_NO='"
							+ ReporefSeq.trim() + "'and ACCT_NUMBER = '"
							+ request.getParameter("accno") + "'and ACCT_NAME = '"+ request.getParameter("accna") + "'and REPORT_DATE >='" + df1.formatdate(request.getParameter("repdate"))+"')");

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
				
				

				sql2.append("update  PSC0500_MOD_TABLE set REPORT_REF_NO ='" + ReporefSeq + "',ACCT_NUMBER ='"
						+ request.getParameter("accno") + "',ACCT_NAME ='" + request.getParameter("accna")
						+ "',SCHM_TYPE ='" + request.getParameter("schmtyp") + "',SCHM_CODE ='"
						+ request.getParameter("schcod") + "',ACCT_OPN_DATE ='"+ df1.formatdate(request.getParameter("accopda"))
						+ "',INTEREST_RATE ='" +request.getParameter("intrra")
						+ "',BALANCE_AMT ='"
						+ request.getParameter("balda") + "',ACCT_CRNCY_CODE ='" + request.getParameter("acccurcod")
						+ "',REPORT_DATE ='"
			
						+ df.formatdate(request.getParameter("repdate")) 
						+ "'"+ " where ACCT_NUMBER ='" + request.getParameter("accno") +"'and REPORT_REF_NO ='" + ReporefSeq + "'and REPORT_DATE ='" + df1.formatdate(request.getParameter("repdate"))+"'");
	
				
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
						"INSERT INTO PSC0500_MOD_TABLE(REPORT_REF_NO,ACCT_NUMBER,ACCT_NAME,SCHM_TYPE,SCHM_CODE,ACCT_OPN_DATE,INTEREST_RATE,BALANCE_AMT,ACCT_CRNCY_CODE,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
								+ "values('" + ReporefSeq + "','" + request.getParameter("accno")
								+ "','" + request.getParameter("accna") + "','"
								+ request.getParameter("schmtyp") + "','" 
								+ request.getParameter("schcod") + "','"
								+ df1.formatdate(request.getParameter("accopda")) + "','" 
								+ request.getParameter("intrra") + "','"
								+ request.getParameter("balda") + "','" 
								+ request.getParameter("acccurcod") + "','"
								+df1.formatdate(request.getParameter("repdate"))+ "','" + session.getAttribute("userName")
								+ "',SYSDATE)");
				
				
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

				// String stat = bop0500add(ReporefSeq);

				refno = ReporefSeq;
			}

		}

		return "success";

	}
	
	
	
	
	
	

	
	/* --------------- SUMMARY BUTTOn CLICK --------------------------- */

	public String summarypsc0500detail() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("in summarypsc0500detail");

		log.info("test----->" + request.getParameter("reportrefnos") + "dt333"
				+ df.formatdate(request.getParameter("dt1")) + df.formatdate(request.getParameter("dt2")));
		XBRLPSC0500Dao bsd = new XBRLPSC0500Dao();
		ArrayList<XBRLPSC0500Bean> arl = bsd.xbrlpsc0500sumEP(df.formatdate(request.getParameter("dt1")),
				df.formatdate(request.getParameter("dt2")), request.getParameter("reportrefnos"),request.getParameter("curr"),request.getParameter("reptype"));

		// summarystandard = arl.toArray(new String[arl.size()]);
		log.info("ARL------------>" + arl.size());
		Gson gson = new Gson();
		summarypsc0500 = gson.toJson(arl);

		return "success";

	}
	
	public String sumpsc0500detail() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("in summarypsc0500detail");

		log.info("test----->" + request.getParameter("reportrefnos") + "dt333"
				+ df.formatdate(request.getParameter("dt1")) + df.formatdate(request.getParameter("dt2")));
		XBRLPSC0500Dao bsd = new XBRLPSC0500Dao();
		ArrayList<XBRLPSC0500Bean> arl = bsd.xbrlpsc0500sumEP1(df.formatdate(request.getParameter("dt1")),
				df.formatdate(request.getParameter("dt2")), request.getParameter("reportrefnos"),request.getParameter("curr"),request.getParameter("reptype"));

		// summarystandard = arl.toArray(new String[arl.size()]);
		log.info("ARL------------>" + arl.size());
		Gson gson = new Gson();
		sumpsc0500 = gson.toJson(arl);

		return "success";

	}
	
	public String detailpsc0500() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		
		
		XBRLPSC0500Dao bsd = new XBRLPSC0500Dao();

		ArrayList<XBRLPSC0500Bean> arl = bsd.xbrlpsc0500ajaxdetails(request.getParameter("repname"),
				request.getParameter("ReporefSeq"), request.getParameter("instno"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		// summarystandard = arl.toArray(new String[arl.size()]);
		
		Gson gson = new Gson();
		detpsc0500 = gson.toJson(arl);

		return "success";

	}


}