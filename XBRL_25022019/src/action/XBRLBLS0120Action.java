package action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.log4j.Logger;

import com.google.gson.Gson;

import basecode.DateFormat;

import bean.XBRLBLS0120Bean;

import dao.XBRLBLS0120Dao;

import utilities.ConnectionManager;
import utilities.NullCheck;

public class XBRLBLS0120Action {
	static Logger log = Logger.getLogger(XBRLBLS0120Action.class);

	public String sec1BLS0120;
	public String detBLS0120;
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
	public String getDetBLS0120() {
		return detBLS0120;
	}


	public void setDetBLS0120(String detBLS0120) {
		this.detBLS0120 = detBLS0120;
	}


	public String getSec1BLS0120() {
		return sec1BLS0120;
	}


	public void setSec1BLS0120(String sec1bls0120) {
		sec1BLS0120 = sec1bls0120;
	}


	public String section1BLS0120() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside BLS0120 action");
		
		XBRLBLS0120Dao bsd = new XBRLBLS0120Dao();

		ArrayList<XBRLBLS0120Bean> arl = bsd.xbrlBLS0120(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1BLS0120 = gson.toJson(arl);

		return "success";

	}

	public String detailBLS0120() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		
		
		XBRLBLS0120Dao bsd = new XBRLBLS0120Dao();

		/*ArrayList<XBRLFIM0900Bean> arl = bsd.xbrlfim0900ajaxdetails(request.getParameter("repname"),request.getParameter("ReporefSeq"),
				request.getParameter("instno"),df.formatdate(request.getParameter("dt1")),df.formatdate(request.getParameter("dt2")), request.getParameter("curr"));*/

		ArrayList<XBRLBLS0120Bean> arl = bsd.xbrlBLS0120ajaxdetails(request.getParameter("repname"),request.getParameter("ReporefSeq"),
				request.getParameter("instno"),df.formatdate(request.getParameter("dt2")), request.getParameter("curr"));
		
		// summarystandard = arl.toArray(new String[arl.size()]);
		
		Gson gson = new Gson();
		detBLS0120 = gson.toJson(arl);

		return "success";

	}
	
	
	

	public String modXbBLSCreate120() throws SQLException {
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
/*
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
		*/
		session.setAttribute("ReprefSeq", ReporefSeq);
		int rs = 0;

		int count = 0;

		StringBuffer sql = new StringBuffer();

		// HttpSession session = request.getSession();
		log.info("insert Action modXbCreateBLS0120");

		/*log.info("NEW FLG:" + newFlg);

		// for Inserting new record

		// for new Reference id
		if (newFlg.equals('Y'))

		{
			sql.append(
					"INSERT INTO BLS0110_MOD_TABLE (REPORT_REF_NO,ASSET_TYPE,REPORT_DATE,INSTRMNT_NAME,CRNCY_CODE,AMT_IN_AC,ISSU_DATE,MATURITY_DATE,LCHG_USER_ID,LCHG_TIME)"
							+ "VALUES ('" + ReporefSeq + "','" +request.getParameter("astyp") + "','" + df1.formatdate(request.getParameter("dt2")) + "','"
							+ request.getParameter("naminst") + "','"+ request.getParameter("accur")
							+ "','" + request.getParameter("amtfc") + "','" + df1.formatdate(request.getParameter("isudat")) + "','"+ df1.formatdate(request.getParameter("matudat"))+ "','"  
							+ session.getAttribute("userName")
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
			sql.append("SELECT COUNT(*) as count FROM BLS0110_MOD_TABLE WHERE REPORT_DATE='" + df1.formatdate(request.getParameter("dt2"))
					+ "' AND  INSTRMNT_NAME='"
					+ request.getParameter("naminst") + "' AND  ASSET_TYPE='"+ request.getParameter("astyp") + "'  ");
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
				sql2.append("UPDATE BLS0110_MOD_TABLE SET ASSET_TYPE='" + request.getParameter("astyp")
				+ "', AMT_IN_AC ='" + request.getParameter("amtfc")+ "', CRNCY_CODE ='" + request.getParameter("accur")
						+ "', ISSU_DATE ='" + df1.formatdate(request.getParameter("isudat"))
						+ "', MATURITY_DATE ='" + df1.formatdate(request.getParameter("matudat")) + "' "
				+ "WHERE REPORT_DATE='"
				+ df1.formatdate(request.getParameter("dt2")) + "' " + "AND INSTRMNT_NAME='"
				+ request.getParameter("naminst")
				+ "' AND  ASSET_TYPE='"+ request.getParameter("astyp") + "'");

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
						"INSERT INTO BLS0110_MOD_TABLE (REPORT_REF_NO,ASSET_TYPE,REPORT_DATE,INSTRMNT_NAME,CRNCY_CODE,AMT_IN_AC,ISSU_DATE,MATURITY_DATE,DEL_FLG,LCHG_USER_ID,LCHG_TIME)"
								+ "VALUES ('" + ReporefSeq + "','" +request.getParameter("astyp") + "','" + df1.formatdate(request.getParameter("dt2")) + "','"
								+ request.getParameter("naminst") + "','"+ request.getParameter("accur")
								+ "','" + request.getParameter("amtfc") + "','" + df1.formatdate(request.getParameter("isudat")) + "','"+ df1.formatdate(request.getParameter("matudat"))+ "','"  
								+ request.getParameter("modtyp") + "','"+ session.getAttribute("userName")
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

		/*}*/
		log.info("executeeee Gayu");

		//return "success";
return status;
	}
	
	

	public String BLS0120verify() {
	log.info("ddddddddddd");
		XBRLBLS0120Dao bsd = new XBRLBLS0120Dao();
		ArrayList<XBRLBLS0120Bean> arr=new ArrayList<XBRLBLS0120Bean>();
		arr=bsd.BLS0120verify();
		Gson gson = new Gson();
		detBLS0120 = gson.toJson(arr);
		return "success";
	}
	public String BLS0120vermaster() {
		String status="";
		XBRLBLS0120Dao bsd = new XBRLBLS0120Dao();
		HttpServletRequest request = ServletActionContext.getRequest();
		status=bsd.BLS0120verifymaster();
		
		if(status.equals("success")) {
			resalert="Verification Successful";
		}else {
			resalert="Technical Issue.Try Again Later.";
		}
		
		return "success";
	}
	
	
	
}
