
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

import bean.XBRLSUP1400Bean;

import dao.XBRLSUP1400Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;

import org.apache.log4j.Logger;
public class XBRLSUP1400Action {

	static Logger log = Logger.getLogger(XBRLSUP1400Action.class);
	public String s1SUP1400;
	

	
	public String getS1SUP1400() {
		return s1SUP1400;
	}

	public void setS1SUP1400(String s1sup1400) {
		s1SUP1400 = s1sup1400;
	}

	public String refno;
	
	public String getRefno() {
		return refno;
	}

	public void setRefno(String refno) {
		this.refno = refno;
	}

	
	
	
	public String det1SUP1400;

	public String getDet1SUP1400() {
		return det1SUP1400;
	}

	public void setDet1SUP1400(String det1sup1400) {
		det1SUP1400 = det1sup1400;
	}

	public String section1SUP1400() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside SUP1400 action");
		
		XBRLSUP1400Dao bsd = new XBRLSUP1400Dao();

		ArrayList<XBRLSUP1400Bean> arl = bsd.xbrlSUP1400(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		s1SUP1400 = gson.toJson(arl);
log.info(s1SUP1400);
		return "success";

	}
	
	
	
	public String detSUP1400() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		
		
		XBRLSUP1400Dao bsd = new XBRLSUP1400Dao();

		ArrayList<XBRLSUP1400Bean> arl = bsd.xbrlSUP1400ajaxdetails(request.getParameter("repname"),request.getParameter("ReporefSeq"),
				request.getParameter("instno"),df.formatdate(request.getParameter("dt2")), request.getParameter("curr"));
		
		// summarystandard = arl.toArray(new String[arl.size()]);
		
		Gson gson = new Gson();
		det1SUP1400 = gson.toJson(arl);

		return "success";

	}	
	
	
	
	public String modXbSUPCreate1400() throws SQLException {

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
		log.info("insert Action modXbCreateSUP1400");

		log.info("NEW FLG:" + newFlg);

		// for Inserting new record

		// for new Reference id
		if (newFlg.equals('Y'))

		{
			sql.append(
					"INSERT INTO SUP1400_MOD_TABLE (REPORT_REF_NO,COMPLAINT_RCVD_DATE,NAME,ADDRESS,COMPLAINT_NATURE,COMPLAINT_NATURE_DET,RESOLVE_DATE,NATURE_OF_RESOLUTION,UNRESOLVED_DET,LCHG_USER_ID,LCHG_TIME)"
							+ "VALUES ('" + ReporefSeq + "','"
							+ df1.formatdate(request.getParameter("rcptdate1"))+ "','" + request.getParameter("namecmplnt1") + "','"
							+ request.getParameter("adrscmplnt1") + "','" + request.getParameter("comnature1") + "','"
							+ request.getParameter("comnaturedel1") + "','" + df1.formatdate(request.getParameter("dtcmplntrsld1")) + "','"
							+ request.getParameter("reslnature1") + "','" + request.getParameter("durescmplnt1") + "','" + session.getAttribute("userName")
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
		/*	sql.append("SELECT COUNT(*) as count FROM SUP1400_MOD_TABLE WHERE REPORT_REF_NO='" + ReporefSeq
					+ "' AND COMPLAINT_RCVD_DATE='" + df1.formatdate(request.getParameter("rcptdate1")) + "' AND RESOLVE_DATE='"
			+ df1.formatdate(request.getParameter("dtcmplntrsld1")) + "'");*/
			
			
			sql.append("SELECT COUNT(*) as count FROM SUP1400_MOD_TABLE WHERE REPORT_REF_NO='" + ReporefSeq
					+ "' AND COMPLAINT_RCVD_DATE='" + df1.formatdate(request.getParameter("rcptdate1")) + "'  " + " AND NAME='"
					+ request.getParameter("namecmplnt1") + "' ");
			
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
				/*sql2.append("UPDATE SUP1400_MOD_TABLE SET COMPLAINT_RCVD_DATE='" + df1.formatdate(request.getParameter("rcptdate1")) + "'  "
						+ "WHERE REPORT_REF_NO='" + ReporefSeq + "' AND RESOLVE_DATE='"
						+ df1.formatdate(request.getParameter("dtcmplntrsld1")) + "' ");*/

				sql2.append("UPDATE SUP1400_MOD_TABLE SET  ADDRESS='"+ request.getParameter("adrscmplnt1") +"', COMPLAINT_NATURE='"+ request.getParameter("comnature1") +"' , COMPLAINT_NATURE_DET='"+ request.getParameter("comnaturedel1") +"' , NATURE_OF_RESOLUTION='"+ request.getParameter("reslnature1") +"' , UNRESOLVED_DET='"+ request.getParameter("durescmplnt1") +"' "
						+ "WHERE REPORT_REF_NO='" + ReporefSeq + "' AND COMPLAINT_RCVD_DATE='"
						+ df1.formatdate(request.getParameter("rcptdate1")) + "' "+ "AND NAME='"
						+ request.getParameter("namecmplnt1") + "' ");
				
				
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
						/*"INSERT INTO SUP1400_MOD_TABLE (REPORT_REF_NO,SL_NO,COMPLAINT_RCVD_DATE,NAME,ADDRESS,COMPLAINT_NATURE,COMPLAINT_NATURE_DET,RESOLVE_DATE,NATURE_OF_RESOLUTION,UNRESOLVED_DET,LCHG_USER_ID,LCHG_TIME)"
								+ "VALUES ('" + ReporefSeq + "','" + request.getParameter("srlno1") + "','"
								+ df1.formatdate(request.getParameter("rcptdate1"))+ "','" + request.getParameter("namecmplnt1") + "','"
								+ request.getParameter("adrscmplnt1") + "','" + request.getParameter("comnature1") + "','"
								+ request.getParameter("comnaturedel1") + "','" + df1.formatdate(request.getParameter("dtcmplntrsld1")) + "','"
								+ request.getParameter("reslnature1") + "','" + request.getParameter("durescmplnt1") + "','" + session.getAttribute("userName")
								+ "',SYSDATE)"); */
						"INSERT INTO SUP1400_MOD_TABLE (REPORT_REF_NO,COMPLAINT_RCVD_DATE,NAME,ADDRESS,COMPLAINT_NATURE,COMPLAINT_NATURE_DET,RESOLVE_DATE,NATURE_OF_RESOLUTION,UNRESOLVED_DET,LCHG_USER_ID,LCHG_TIME)"
						+ "VALUES ('" + ReporefSeq + "','"
						+ df1.formatdate(request.getParameter("rcptdate1"))+ "','" + request.getParameter("namecmplnt1") + "','"
						+ request.getParameter("adrscmplnt1") + "','" + request.getParameter("comnature1") + "','"
						+ request.getParameter("comnaturedel1") + "','" + df1.formatdate(request.getParameter("dtcmplntrsld1")) + "','"
						+ request.getParameter("reslnature1") + "','" + request.getParameter("durescmplnt1") + "','" + session.getAttribute("userName")
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
