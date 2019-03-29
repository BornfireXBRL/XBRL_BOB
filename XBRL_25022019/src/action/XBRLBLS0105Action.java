
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

import bean.XBRLBLS0105Bean;
import bean.XBRLDCG0100Bean;
import dao.XBRLBLS0105Dao;
import dao.XBRLDCG0100Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;

import org.apache.log4j.Logger;

public class XBRLBLS0105Action {
	
	static Logger log = Logger.getLogger(XBRLBLS0105Action.class);
	public String ver;
public static Logger getLog() {
		return log;
	}

	public static void setLog(Logger log) {
		XBRLBLS0105Action.log = log;
	}

	public String getVer() {
		return ver;
	}

	public void setVer(String ver) {
		this.ver = ver;
	}
public String resalert;
	
	
	
	
	
	public String getResalert() {
		return resalert;
	}

	public void setResalert(String resalert) {
		this.resalert = resalert;
	}
	public String s1BLS0105;
	

	
	public String getS1BLS0105() {
		return s1BLS0105;
	}

	public void setS1BLS0105(String s1bls0105) {
		s1BLS0105 = s1bls0105;
	}

	public String refno;
	
	public String getRefno() {
		return refno;
	}

	public void setRefno(String refno) {
		this.refno = refno;
	}

	
	
	
	public String det1BLS0105;

	public String getDet1BLS0105() {
		return det1BLS0105;
	}

	public void setDet1BLS0105(String det1bls0105) {
		det1BLS0105 = det1bls0105;
	}

	public String section1BLS0105() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside BLS0105 action");
		
		XBRLBLS0105Dao bsd = new XBRLBLS0105Dao();

		ArrayList<XBRLBLS0105Bean> arl = bsd.xbrlBLS0105(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		s1BLS0105 = gson.toJson(arl);

		return "success";

	}
	
	
	
	public String detBLS0105() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		
		
		XBRLBLS0105Dao bsd = new XBRLBLS0105Dao();

		ArrayList<XBRLBLS0105Bean> arl = bsd.xbrlBLS0105ajaxdetails(request.getParameter("repname"),request.getParameter("ReporefSeq"),
				request.getParameter("instno"),df.formatdate(request.getParameter("dt2")), request.getParameter("curr"));
		
		// summarystandard = arl.toArray(new String[arl.size()]);
		
		Gson gson = new Gson();
		det1BLS0105 = gson.toJson(arl);

		return "success";

	}	
	
	
	
	public String modXbBLSCreate105() throws SQLException {

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
		log.info("insert Action modXbCreateBLS0100");

		/*log.info("NEW FLG:" + newFlg);

		// for Inserting new record

		// for new Reference id
		if (newFlg.equals('Y'))

		{
			sql.append(
					"INSERT INTO BLS0105_MOD_TABLE (REPORT_REF_NO,CUST_ID,CUST_NAME,CUST_GRP,NATURE_OF_CUST,ISIC_CODE,UNIQ_ID,EXPOSURE_TYPE,CRNCY_CODE,REPORT_DATE,BALANCE_AMT_AC,LCHG_USER_ID,LCHG_TIME)"
							+ "VALUES ('" + ReporefSeq + "','" + request.getParameter("cusid") + "','"
							+ request.getParameter("cusnam") + "','" + request.getParameter("cusgrp") + "','"
							+ request.getParameter("natucus") + "','" + request.getParameter("isiccod") + "','"
							+ request.getParameter("uniid") + "','" + request.getParameter("expotyp") + "','"
							+ request.getParameter("currcod") + "','" + df1.formatdate(request.getParameter("repodat"))
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
		else {
*/
			int rowcount = 0;
			sql.append("SELECT COUNT(*) as count FROM BLS0105_MOD_TABLE WHERE REPORT_REF_NO='" + ReporefSeq
					+ "' AND REPORT_DATE='" + df1.formatdate(request.getParameter("repodat")) + "' " + "AND CUST_ID='"
					+ request.getParameter("cusid") + "'  AND UNIQ_ID='" + request.getParameter("uniid")
					+ "' AND ISIC_CODE='" + request.getParameter("isiccod") + "' ");
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
				sql2.append("UPDATE BLS0105_MOD_TABLE SET BALANCE_AMT_AC='" + request.getParameter("balamt") + "',DEL_FLG='M'  "
						+ "WHERE REPORT_DATE='"
						+ df1.formatdate(request.getParameter("repodat")) + "' " + "AND CUST_ID='"
						+ request.getParameter("cusid") + "' AND UNIQ_ID='" + request.getParameter("uniid")
						+ "'AND ISIC_CODE='" + request.getParameter("isiccod") + "'");

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
						"INSERT INTO BLS0105_MOD_TABLE (REPORT_REF_NO,CUST_ID,CUST_NAME,CUST_GRP,NATURE_OF_CUST,ISIC_CODE,UNIQ_ID,EXPOSURE_TYPE,CRNCY_CODE,REPORT_DATE,BALANCE_AMT_AC,DEL_FLG,LCHG_USER_ID,LCHG_TIME)"
								+ "VALUES ('" + ReporefSeq + "','" + request.getParameter("cusid") + "','"
								+ request.getParameter("cusnam") + "','" + request.getParameter("cusgrp") + "','"
								+ request.getParameter("natucus") + "','" + request.getParameter("isiccod") + "','"
								+ request.getParameter("uniid") + "','" + request.getParameter("expotyp") + "','"
								+ request.getParameter("currcod") + "','"
								+ df1.formatdate(request.getParameter("repodat")) + "','"
								+ request.getParameter("balamt") + "','"+request.getParameter("modtyp")+"','" + session.getAttribute("userName")
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
		return "success";
//return status;
	
	}
	
	public String bls0105verify() {
		log.info("ddddddddddd");
			XBRLBLS0105Dao bsd = new XBRLBLS0105Dao();
			ArrayList<XBRLBLS0105Bean> arr=new ArrayList<XBRLBLS0105Bean>();
			arr=bsd.BLS0105verify();
			Gson gson = new Gson();
			ver = gson.toJson(arr);
			return "success";
		}
	public String BLS0105vermaster() {
		String status="";
		XBRLBLS0105Dao bsd = new XBRLBLS0105Dao();
		HttpServletRequest request = ServletActionContext.getRequest();
		status=bsd.BLS0105verifymaster();
		
		if(status.equals("success")) {
			resalert="Verification Successful";
		}else {
			resalert="Technical Issue.Try Again Later.";
		}
		
		return "success";
	}
}
