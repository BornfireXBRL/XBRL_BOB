
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

import bean.XBRLBLS0130Bean;
import bean.XBRLBLS0130Bean;
import dao.XBRLBLS0130Dao;
import dao.XBRLBLS0130Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;

import org.apache.log4j.Logger;

import org.apache.log4j.Logger;
public class XBRLBLS0130Action {
	
	static Logger log = Logger.getLogger(XBRLBLS0130Action.class);

	public String s1BLS0130;
	public String s2BLS0130;
	
	
	public String resalert;
	public String detBLS0130;

	public String getResalert() {
		return resalert;
	}

	public void setResalert(String resalert) {
		this.resalert = resalert;
	}

	public String getDetBLS0130() {
		return detBLS0130;
	}

	public void setDetBLS0130(String detBLS0130) {
		this.detBLS0130 = detBLS0130;
	}

	public String getS1BLS0130() {
		return s1BLS0130;
	}

	public void setS1BLS0130(String s1bls0130) {
		s1BLS0130 = s1bls0130;
	}

	public String getS2BLS0130() {
		return s2BLS0130;
	}


	public void setS2BLS0130(String s2bls0130) {
		s2BLS0130 = s2bls0130;
	}

	
	public String refno;
	
	
	
	
	public String getRefno() {
		return refno;
	}

	public void setRefno(String refno) {
		this.refno = refno;
	}

	public String det1BLS0130;
	public String getDet1BLS0130() {
		return det1BLS0130;
	}

	public void setDet1BLS0130(String det1bls0130) {
		det1BLS0130 = det1bls0130;
	}

	public String getDet2BLS0130() {
		return det2BLS0130;
	}

	public void setDet2BLS0130(String det2bls0130) {
		det2BLS0130 = det2bls0130;
	}


	public String det2BLS0130;
	

	

	public String section1BLS0130() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside BLS0130 action");
		
		XBRLBLS0130Dao bsd = new XBRLBLS0130Dao();

		ArrayList<XBRLBLS0130Bean> arl = bsd.xbrlBLS0130(request.getParameter("reptype"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		s1BLS0130 = gson.toJson(arl);
log.info(s1BLS0130);
		return "success";

	}
	
	
	
	
	
	public String det1BLS0130() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		
		
		XBRLBLS0130Dao bsd = new XBRLBLS0130Dao();

		ArrayList<XBRLBLS0130Bean> arl = bsd.xbrlBLS0130ajaxdetails(request.getParameter("repname"),request.getParameter("ReporefSeq"),
				request.getParameter("instno"),df.formatdate(request.getParameter("dt2")), request.getParameter("curr"));
		
		// summarystandard = arl.toArray(new String[arl.size()]);
		
		Gson gson = new Gson();
		det1BLS0130 = gson.toJson(arl);

		return "success";

	}	
	
	
	
	
	public String modXbBLSCreate130() throws SQLException {

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
	/*	log.info("===" + request.getParameter("reportrefno"));

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
		log.info("===ReporefSeq===" + ReporefSeq);*/
		// log.info("<< EIDSeq >> " + EIDSeq);
		session.setAttribute("ReprefSeq", ReporefSeq);

		int rs = 0;

		int count = 0;

		StringBuffer sql = new StringBuffer();

		// HttpSession session = request.getSession();
		log.info("insert Action modXbCreateBLS0110");
/*
		log.info("NEW FLG:" + newFlg);

		// for Inserting new record

		// for new Reference id
		if (newFlg.equals('Y'))

		{
			sql.append(
					"INSERT INTO BLS0110_MOD_TABLE (REPORT_REF_NO,ASSET_TYPE,REPORT_DATE,INSTRMNT_NAME,CRNCY_CODE,AMT_IN_AC,LCHG_USER_ID,LCHG_TIME)"
							+ "VALUES ('" + ReporefSeq + "','" +request.getParameter("astyp") + "','" + df1.formatdate(request.getParameter("dt2")) + "','"
							+ request.getParameter("naminst") + "','"+ request.getParameter("accur")
							+ "','" + request.getParameter("amtfc") + "','" + session.getAttribute("userName")
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
			sql.append("SELECT COUNT(*) as count FROM BLS0110_MOD_TABLE WHERE REPORT_DATE='" + df1.formatdate(request.getParameter("dt2"))
					+ "' AND INSTRMNT_NAME='"
					+ request.getParameter("naminst") + "'   ");
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
				+ "', AMT_IN_AC ='" + request.getParameter("amtfc") + "' ,DEL_FLG='M'  "
				+ " WHERE  REPORT_DATE='"
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

				sql3.append(
						"INSERT INTO BLS0110_MOD_TABLE (REPORT_REF_NO,ASSET_TYPE,REPORT_DATE,INSTRMNT_NAME,CRNCY_CODE,AMT_IN_AC,DEL_FLG,LCHG_USER_ID,LCHG_TIME)"
								+ "VALUES ('" + ReporefSeq + "','" +request.getParameter("astyp") + "','" + df1.formatdate(request.getParameter("dt2")) + "','"
								+ request.getParameter("naminst") + "','"+ request.getParameter("accur")
								+ "','" + request.getParameter("amtfc")+ "','" + request.getParameter("modtyp") + "','" + session.getAttribute("userName")
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

				
				
			}

		/*}*/
		log.info("executed");

		//return "success";
return status;
	}

			

	public String BLS0130verify() {
	log.info("ddddddddddd");
		XBRLBLS0130Dao bsd = new XBRLBLS0130Dao();
		ArrayList<XBRLBLS0130Bean> arr=new ArrayList<XBRLBLS0130Bean>();
		arr=bsd.BLS0130verify();
		Gson gson = new Gson();
		detBLS0130 = gson.toJson(arr);
		return "success";
	}
	public String BLS0130vermaster() {
		String status="";
		XBRLBLS0130Dao bsd = new XBRLBLS0130Dao();
		HttpServletRequest request = ServletActionContext.getRequest();
		status=bsd.BLS0130verifymaster();
		
		if(status.equals("success")) {
			resalert="Verification Successful";
		}else {
			resalert="Technical Issue.Try Again Later.";
		}
		
		return "success";
	}
	
	
	
}

