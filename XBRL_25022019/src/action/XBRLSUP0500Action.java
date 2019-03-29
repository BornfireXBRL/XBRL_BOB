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
import bean.XBRLSUP0500Bean;
import dao.XBRLSUP0500Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;

public class XBRLSUP0500Action {
	
	static Logger log = Logger.getLogger(XBRLSUP0500Action.class);

	public String sec1SUP0500;
	public String sec1SUP0500s2;
	public String sec1SUP0500s3;
	public String sec1SUP0500s4;
	public String sec1SUP0500d1;
	

	public String refno;
	
	
	
	

	public String getRefno() {
		return refno;
	}

	public void setRefno(String refno) {
		this.refno = refno;
	}

	public String getSec1SUP0500() {
		return sec1SUP0500;
	}

	public void setSec1SUP0500(String sec1sup0500) {
		sec1SUP0500 = sec1sup0500;
	}

	public String getSec1SUP0500s2() {
		return sec1SUP0500s2;
	}

	public void setSec1SUP0500s2(String sec1sup0500s2) {
		sec1SUP0500s2 = sec1sup0500s2;
	}

	public String getSec1SUP0500s3() {
		return sec1SUP0500s3;
	}

	public void setSec1SUP0500s3(String sec1sup0500s3) {
		sec1SUP0500s3 = sec1sup0500s3;
	}

	public String getSec1SUP0500s4() {
		return sec1SUP0500s4;
	}

	public void setSec1SUP0500s4(String sec1sup0500s4) {
		sec1SUP0500s4 = sec1sup0500s4;
	}

	public String getSec1SUP0500d1() {
		return sec1SUP0500d1;
	}

	public void setSec1SUP0500d1(String sec1sup0500d1) {
		sec1SUP0500d1 = sec1sup0500d1;
	}

	public String section1SUP0500() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside sup0500 action");
		
		XBRLSUP0500Dao bsd = new XBRLSUP0500Dao();

		ArrayList<XBRLSUP0500Bean> arl = bsd.xbrlSUP0500(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1SUP0500 = gson.toJson(arl);

		return "success";

	}
	
	public String section2SUP0500() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside sup0500 action");
		
		XBRLSUP0500Dao bsd = new XBRLSUP0500Dao();

		ArrayList<XBRLSUP0500Bean> arl = bsd.xbrlSUP0500s2(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1SUP0500s2 = gson.toJson(arl);

		return "success";

	}
	
	public String section3SUP0500() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside sup0500 action");
		
		XBRLSUP0500Dao bsd = new XBRLSUP0500Dao();

		ArrayList<XBRLSUP0500Bean> arl = bsd.xbrlSUP0500s3(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1SUP0500s3 = gson.toJson(arl);

		return "success";

	}
	
	public String section4SUP0500() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside sup0500action");
		
		XBRLSUP0500Dao bsd = new XBRLSUP0500Dao();

		ArrayList<XBRLSUP0500Bean> arl = bsd.xbrlSUP0500s4(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1SUP0500s4 = gson.toJson(arl);

		return "success";

	}
	
	
	
	
	

	public String detsec1SUP0500() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside sup0500 action");
		
		XBRLSUP0500Dao bsd = new XBRLSUP0500Dao();

		ArrayList<XBRLSUP0500Bean> arl = bsd.xbrlSUP0500d1(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1SUP0500d1= gson.toJson(arl);

		return "success";

	}
	

	
	
	
	
	
	public String modXbSUPCreate500() throws SQLException {

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
		log.info("insert Action modXbCreateSUP0500");

		log.info("NEW FLG:" + newFlg);

		// for Inserting new record

		// for new Reference id
		if (newFlg.equals('Y'))

		{
			sql.append(
					"INSERT INTO SUP0500_MOD_TABLE (REPORT_REF_NO,INSTANCE_NAME,INSTANCE_CODE,RESIDENT,NON_RESIDENT,TOTAL,LCHG_USER_ID,LCHG_TIME)"
							+ "VALUES ('" + ReporefSeq + "','" + request.getParameter("instname") + "','"
							+ request.getParameter("instcode") + "','" + request.getParameter("res") + "','"
							
							+ request.getParameter("nonresi") + "','" + request.getParameter("total") + "','" + session.getAttribute("userName")
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
			sql.append("SELECT COUNT(*) as count FROM SUP0500_MOD_TABLE WHERE REPORT_REF_NO='" + ReporefSeq
					+ "'AND INSTANCE_CODE='"
					+ request.getParameter("instcode") + "' ");
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

				log.info("INSIDE UPDATE");
				sql2.append("UPDATE SUP0500_MOD_TABLE SET INSTANCE_NAME='" + request.getParameter("instname") + "',RESIDENT='"+ request.getParameter("res") +"',NON_RESIDENT='"+  request.getParameter("nonresi") +"',TOTAL='"+ request.getParameter("total") +"'  "
						+ "WHERE REPORT_REF_NO='" + ReporefSeq + "' AND INSTANCE_CODE='"
						+ request.getParameter("instcode") + "' ");

				log.info(sql2 + "NOWSATH");

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
						/*"INSERT INTO BOP0100_MOD_TABLE (REPORT_REF_NO,CUST_ID,CUST_NAME,CUST_GRP,NATURE_OF_CUST,ISIC_CODE,UNIQ_ID,EXPOSURE_TYPE,CRNCY_CODE,REPORT_DATE,BALANCE_AMT_AC,LCHG_USER_ID,LCHG_TIME)"
								+ "VALUES ('" + ReporefSeq + "','" + request.getParameter("cusid") + "','"
								+ request.getParameter("cusnam") + "','" + request.getParameter("cusgrp") + "','"
								+ request.getParameter("natucus") + "','" + request.getParameter("isiccod") + "','"
								+ request.getParameter("uniid") + "','" + request.getParameter("expotyp") + "','"
								+ request.getParameter("currcod") + "','"
								+ df1.formatdate(request.getParameter("repodat")) + "','"
								+ request.getParameter("balamt") + "','" + session.getAttribute("userName")
								+ "',SYSDATE)");
								
								*/
						
						"INSERT INTO SUP0500_MOD_TABLE (REPORT_REF_NO,INSTANCE_NAME,INSTANCE_CODE,RESIDENT,NON_RESIDENT,TOTAL,LCHG_USER_ID,LCHG_TIME)"
						+ "VALUES ('" + ReporefSeq + "','" + request.getParameter("instname") + "','"
						+ request.getParameter("instcode") + "','" + request.getParameter("res") + "','"
						
						+ request.getParameter("nonresi") + "','" + request.getParameter("total") + "','" + session.getAttribute("userName")
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

