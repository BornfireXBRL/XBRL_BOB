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
import bean.XBRLSUP1200Bean;
import bean.XBRLPSC0030Bean;
import dao.XBRLSUP1200Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;
import dao.XBRLPSC0030Dao;
import org.apache.log4j.Logger;
public class XBRLSUP1200Action {
	static Logger log = Logger.getLogger(XBRLSUP1200Action.class);
	public String sec1SUP1200;
	public String sec1SUP1200s2;
	public String sec1SUP1200s3;
	public String sec1SUP1200s4;
	public String sec1SUP1200d1;
	public String sec1SUP1200d2;
	
public String refno;
	
	
	
	
	public String getRefno() {
		return refno;
	}

	public void setRefno(String refno) {
		this.refno = refno;
	}

	public void setSec1SUP1200(String sec1sup1200) {
		sec1SUP1200 = sec1sup1200;
	}

	public void setSec1SUP1200s2(String sec1sup1200s2) {
		sec1SUP1200s2 = sec1sup1200s2;
	}

	public void setSec1SUP1200s3(String sec1sup1200s3) {
		sec1SUP1200s3 = sec1sup1200s3;
	}

	public void setSec1SUP1200s4(String sec1sup1200s4) {
		sec1SUP1200s4 = sec1sup1200s4;
	}

	

	public String getSec1SUP1200d1() {
		return sec1SUP1200d1;
	}

	public void setSec1SUP1200d1(String sec1sup1200d1) {
		sec1SUP1200d1 = sec1sup1200d1;
	}

	public String getSec1SUP1200d2() {
		return sec1SUP1200d2;
	}

	public void setSec1SUP1200d2(String sec1sup1200d2) {
		sec1SUP1200d2 = sec1sup1200d2;
	}

	public String getSec1SUP1200s4() {
		return sec1SUP1200s4;
	}

	

	public String getSec1SUP1200s3() {
		return sec1SUP1200s3;
	}

	

	public String getSec1SUP1200s2() {
		return sec1SUP1200s2;
	}

	

	public String getSec1SUP1200() {
		return sec1SUP1200;
	}

	

	public String section1SUP1200() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside sup1200 action");
		
		XBRLSUP1200Dao bsd = new XBRLSUP1200Dao();

		ArrayList<XBRLSUP1200Bean> arl = bsd.xbrlSUP1200(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1SUP1200 = gson.toJson(arl);

		return "success";

	}
	
	public String section2SUP1200() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside sup1200 action");
		
		XBRLSUP1200Dao bsd = new XBRLSUP1200Dao();

		ArrayList<XBRLSUP1200Bean> arl = bsd.xbrlSUP1200s2(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1SUP1200s2 = gson.toJson(arl);

		return "success";

	}
	
	public String section3SUP1200() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside sup1200 action");
		
		XBRLSUP1200Dao bsd = new XBRLSUP1200Dao();

		ArrayList<XBRLSUP1200Bean> arl = bsd.xbrlSUP1200s3(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1SUP1200s3 = gson.toJson(arl);

		return "success";

	}
	
	public String section4SUP1200() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside sup1200action");
		
		XBRLSUP1200Dao bsd = new XBRLSUP1200Dao();

		ArrayList<XBRLSUP1200Bean> arl = bsd.xbrlSUP1200s4(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1SUP1200s4 = gson.toJson(arl);

		return "success";

	}
	

	public String detsec1SUP1200() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside sup1200 action");
		
		XBRLSUP1200Dao bsd = new XBRLSUP1200Dao();

		ArrayList<XBRLSUP1200Bean> arl = bsd.xbrlSUP1200d1(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1SUP1200d1= gson.toJson(arl);

		return "success";

	}
	

	public String detsec2SUP1200() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside sup1200 action");
		
		XBRLSUP1200Dao bsd = new XBRLSUP1200Dao();

		ArrayList<XBRLSUP1200Bean> arl = bsd.xbrlSUP1200d2(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1SUP1200d2 = gson.toJson(arl);

		return "success";

	}
	
	public String modXbSUPCreate12001() throws SQLException {

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
		log.info("insert Action modXbCreateSUP1200");

		log.info("NEW FLG:" + newFlg);

		// for Inserting new record

		// for new Reference id
		if (newFlg.equals('Y'))

		{
			sql.append(
					"INSERT INTO SUP1200_S1_MOD_TABLE (REPORT_REF_NO,REPORT_DATE,BENEFICIARY_OWNER_NAME,CITIZEN_SHIP,TYPE_OF_HOLDING,NO_OF_SHARES,PERCENTAGE_OF_SHARE,PER_OF_DIR_INDIR_SHARE,LCHG_USER_ID,LCHG_TIME)"
							+ "VALUES ('" + ReporefSeq + "','" + df1.formatdate(request.getParameter("d1repdate")) + "','" + request.getParameter("d1benownname") + "','"
							+ request.getParameter("d1citiz") + "','" + request.getParameter("d1typhold") + "','"
							+ request.getParameter("d1noofshares") + "','" + request.getParameter("d1perofshare") + "','"
						    + request.getParameter("d1perofdirind")
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
		else {

			int rowcount = 0;
			sql.append("SELECT COUNT(*) as count FROM SUP1200_S1_MOD_TABLE WHERE REPORT_REF_NO='" + ReporefSeq
					+ "' AND REPORT_DATE='" + df1.formatdate(request.getParameter("d1repdate")) + "' " + "AND BENEFICIARY_OWNER_NAME='"
					+ request.getParameter("d1benownname") + "' ");
				
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
				sql2.append("UPDATE SUP1200_S1_MOD_TABLE SET CITIZEN_SHIP='" + request.getParameter("d1citiz")
				+ "', TYPE_OF_HOLDING ='" + request.getParameter("d1typhold")
				+ "', NO_OF_SHARES ='" + request.getParameter("d1noofshares")
				+ "', PERCENTAGE_OF_SHARE  ='" + request.getParameter("d1perofshare")
				+ "', PER_OF_DIR_INDIR_SHARE='" + request.getParameter("d1perofdirind") + "' "
				+ "WHERE REPORT_REF_NO='" + ReporefSeq + "' AND REPORT_DATE='"
				+ df1.formatdate(request.getParameter("d1repdate")) + "' " + "AND BENEFICIARY_OWNER_NAME='"
				+ request.getParameter("d1benownname")
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
						"INSERT INTO SUP1200_S1_MOD_TABLE (REPORT_REF_NO,REPORT_DATE,BENEFICIARY_OWNER_NAME,CITIZEN_SHIP,TYPE_OF_HOLDING,NO_OF_SHARES,PERCENTAGE_OF_SHARE,PER_OF_DIR_INDIR_SHARE,LCHG_USER_ID,LCHG_TIME)"
								+ "VALUES ('" + ReporefSeq + "','" + df1.formatdate(request.getParameter("d1repdate")) + "','" + request.getParameter("d1benownname") + "','"
								+ request.getParameter("d1citiz") + "','" + request.getParameter("d1typhold") + "','"
								+ request.getParameter("d1noofshares") + "','" + request.getParameter("d1perofshare") + "','"
							    + request.getParameter("d1perofdirind")
								+ "','" + session.getAttribute("userName")
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
		log.info("executeeee");
		//return "success";
return status;
	}
	
	
	public String modXbSUPCreate1200() throws SQLException {

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
		log.info("insert Action modXbCreateSUP1200");

		log.info("NEW FLG:" + newFlg);

		// for Inserting new record

		// for new Reference id
		if (newFlg.equals('Y'))

		{
			sql.append(
					"INSERT INTO SUP1200_S4_MOD_TABLE (REPORT_REF_NO,REPORT_DATE,NAME_OF_DIRECTOR,UNIQUE_ID,STATUS,REPORTING_TYPE,DESIGNATION,NAME_OF_INSTITUTION,DATE_OF_APPOINTMENT,DATE_OF_RESIGNATION,CITIZENSHIP,LCHG_USER_ID,LCHG_TIME)"
							+ "VALUES ('" + ReporefSeq + "','" + df1.formatdate(request.getParameter("d2repdate")) + "','"
							+ request.getParameter("d2namofdir") + "','"+ request.getParameter("d2uniid")
							+ "','" + request.getParameter("d2status")
							+ "','" + request.getParameter("d2reptyp") + "','"+ request.getParameter("d2designatn")
							+ "','" + request.getParameter("d2nameinstitutn") + "','"+  df1.formatdate(request.getParameter("d2dateappoinmt"))
							+ "','" +  df1.formatdate(request.getParameter("d2dateresignatn")) + "','"+ request.getParameter("d2citizenship")
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
		else {

			int rowcount = 0;
			sql.append("SELECT COUNT(*) as count FROM SUP1200_S4_MOD_TABLE WHERE REPORT_REF_NO='" + ReporefSeq
					+ "' AND REPORT_DATE='" + df1.formatdate(request.getParameter("d2repdate")) + "' " + "AND NAME_OF_DIRECTOR='"
					+ request.getParameter("d2namofdir") + "'   ");
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
				sql2.append("UPDATE SUP1200_S4_MOD_TABLE SET UNIQUE_ID='" + request.getParameter("d2uniid")
				+ "', STATUS ='" + request.getParameter("d2status")
				+ "', REPORTING_TYPE ='" + request.getParameter("d2reptyp")
				+ "', DESIGNATION  ='" + request.getParameter("d2designatn")
				+ "', NAME_OF_INSTITUTION ='" + request.getParameter("d2nameinstitutn")
				+ "', DATE_OF_APPOINTMENT ='" +  df1.formatdate(request.getParameter("d2dateappoinmt"))
				+ "', DATE_OF_RESIGNATION  ='" +  df1.formatdate(request.getParameter("d2dateresignatn"))
				+ "', CITIZENSHIP ='" + request.getParameter("d2citizenship") + "' "
				
				+ "WHERE REPORT_REF_NO='" + ReporefSeq + "' AND REPORT_DATE='"
				+ df1.formatdate(request.getParameter("d2repdate")) + "' " + "AND NAME_OF_DIRECTOR='"
				+ request.getParameter("d2namofdir")
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
						"INSERT INTO SUP1200_S4_MOD_TABLE (REPORT_REF_NO,REPORT_DATE,NAME_OF_DIRECTOR,UNIQUE_ID,STATUS,REPORTING_TYPE,DESIGNATION,NAME_OF_INSTITUTION,DATE_OF_APPOINTMENT,DATE_OF_RESIGNATION,CITIZENSHIP,LCHG_USER_ID,LCHG_TIME)"
								+ "VALUES ('" + ReporefSeq + "','" + df1.formatdate(request.getParameter("d2repdate")) + "','"
								+ request.getParameter("d2namofdir") + "','"+ request.getParameter("d2uniid")
								+ "','" + request.getParameter("d2status")
								+ "','" + request.getParameter("d2reptyp") + "','"+ request.getParameter("d2designatn")
								+ "','" + request.getParameter("d2nameinstitutn") + "','"+ df1.formatdate( request.getParameter("d2dateappoinmt"))
								+ "','" + df1.formatdate( request.getParameter("d2dateresignatn")) + "','"+ request.getParameter("d2citizenship")
								+ "','" + session.getAttribute("userName")
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
		log.info("executed");

		//return "success";
return status;
	}
	
	
}

