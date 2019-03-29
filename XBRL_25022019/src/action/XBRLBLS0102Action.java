
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

import bean.XBRLBLS0102Bean;
import bean.XBRLBLS0102Bean;
import dao.XBRLBLS0102Dao;
import dao.XBRLBLS0102Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;

import org.apache.log4j.Logger;

public class XBRLBLS0102Action {
	
	static Logger log = Logger.getLogger(XBRLBLS0102Action.class);
	public String resalert;
	
	public String getResalert() {
		return resalert;
	}

	public void setResalert(String resalert) {
		this.resalert = resalert;
	}


	public String s1BLS0102;
	public String s2BLS0102;
	public String getS1BLS0102() {
		return s1BLS0102;
	}

	public void setS1BLS0102(String s1bls0102) {
		s1BLS0102 = s1bls0102;
	}

	public String getS2BLS0102() {
		return s2BLS0102;
	}

	public void setS2BLS0102(String s2bls0102) {
		s2BLS0102 = s2bls0102;
	}

	
	public String refno;
	
	
	
	
	public String getRefno() {
		return refno;
	}

	public void setRefno(String refno) {
		this.refno = refno;
	}

	public String det1BLS0102;
	public String getDet1BLS0102() {
		return det1BLS0102;
	}

	public void setDet1BLS0102(String det1bls0102) {
		det1BLS0102 = det1bls0102;
	}

	public String getDet2BLS0102() {
		return det2BLS0102;
	}

	public void setDet2BLS0102(String det2bls0102) {
		det2BLS0102 = det2bls0102;
	}


	public String det2BLS0102;
	
	public String detBLS0102;
	

	public String getDetBLS0102() {
		return detBLS0102;
	}

	public void setDetBLS0102(String detBLS0102) {
		this.detBLS0102 = detBLS0102;
	}

	public String section1BLS0102() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside BLS0102 action");
		
		XBRLBLS0102Dao bsd = new XBRLBLS0102Dao();

		ArrayList<XBRLBLS0102Bean> arl = bsd.xbrlBLS0102(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		s1BLS0102 = gson.toJson(arl);
log.info(s1BLS0102);
		return "success";

	}
	
	public String section2BLS0102() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside BLS0102 sec2 action");
		
		XBRLBLS0102Dao bsd = new XBRLBLS0102Dao();

		ArrayList<XBRLBLS0102Bean> arl = bsd.xbrlBLS0102s2(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		s2BLS0102 = gson.toJson(arl);

		return "success";

	}
	
	
	
	
	
	public String det1BLS0102() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		
		
		XBRLBLS0102Dao bsd = new XBRLBLS0102Dao();

		ArrayList<XBRLBLS0102Bean> arl = bsd.xbrlBLS0102ajaxdetails(request.getParameter("repname"),request.getParameter("ReporefSeq"),
				request.getParameter("instno"),df.formatdate(request.getParameter("dt2")), request.getParameter("curr"));
		
		// summarystandard = arl.toArray(new String[arl.size()]);
		
		Gson gson = new Gson();
		det1BLS0102 = gson.toJson(arl);

		return "success";

	}	
	
/*	public String det2BLS0102() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		
		
		XBRLBLS0102Dao bsd = new XBRLBLS0102Dao();

		
		ArrayList<XBRLBLS0102Bean> arl = bsd.xbrlBLS0102ajaxdetails2(request.getParameter("repname"),request.getParameter("ReporefSeq"),
				request.getParameter("instno"),df.formatdate(request.getParameter("dt2")), request.getParameter("curr"));
		
		// summarystandard = arl.toArray(new String[arl.size()]);
		
		Gson gson = new Gson();
		det2BLS0102 = gson.toJson(arl);

		return "success";

	}	
	*/
	
	public String modXbBLSCreate102() throws SQLException {

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
		log.info("insert Action modXbCreateBLS0102");

		/*log.info("NEW FLG:" + newFlg);

		// for Inserting new record

		// for new Reference id
		if (newFlg.equals('Y'))

		{
			sql.append(
					" INSERT INTO BLS0102_MOD_TABLE(REPORT_REF_NO,REPORT_DATE,CUST_ID,CUST_NAME,CUST_GRP,CUST_SUB_GRP,ISIC_CODE,UNIQ_ID,EXPOSURE_TYPE,BALANCE_AMT_AC,CRNCY_CODE,LCHG_USER_ID,LCHG_TIME)" + "VALUES ('"
							+ ReporefSeq + "','" + df1.formatdate(request.getParameter("repdat")) + "','"
							+ request.getParameter("cusid") + "','" + request.getParameter("cusnam") + "','"
							+ request.getParameter("cusgrp") + "','" + request.getParameter("cussugrp") + "','"
							+ request.getParameter("isiccod") + "','" + request.getParameter("unicod") + "','"
							+ request.getParameter("exsutyp") + "','" + request.getParameter("balamtac") + "','"
							+ request.getParameter("curcod") + "','"
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

			int rowcount = 0;
			sql.append("SELECT COUNT(*) as count FROM BLS0102_MOD_TABLE WHERE REPORT_REF_NO='" + ReporefSeq
					+ "' AND REPORT_DATE='" + df1.formatdate(request.getParameter("repdat")) + "' "
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
				sql2.append("UPDATE BLS0102_MOD_TABLE SET CUST_NAME='" + request.getParameter("cusnam")
				+ "', CUST_GRP ='" + request.getParameter("cusgrp")
				+ "', CUST_SUB_GRP='" + request.getParameter("cussugrp")
				+ "', ISIC_CODE ='" + request.getParameter("isiccod")
				+ "', UNIQ_ID ='" + request.getParameter("unicod")
				+ "', EXPOSURE_TYPE ='" + request.getParameter("exsutyp")
				+ "', BALANCE_AMT_AC  ='" + request.getParameter("balamtac")
				+ "', CRNCY_CODE='" + request.getParameter("curcod")+ "',DEL_FLG='M' "
				+ "WHERE REPORT_REF_NO='" + ReporefSeq + "' AND REPORT_DATE='"
				+ df1.formatdate(request.getParameter("repdat")) + "' " + "AND CUST_ID='"
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
						" INSERT INTO BLS0102_MOD_TABLE(REPORT_REF_NO,REPORT_DATE,CUST_ID,CUST_NAME,CUST_GRP,CUST_SUB_GRP,ISIC_CODE,UNIQ_ID,EXPOSURE_TYPE,BALANCE_AMT_AC,CRNCY_CODE,DEL_FLG,LCHG_USER_ID,LCHG_TIME)" + "VALUES ('"
								+ ReporefSeq + "','" + df1.formatdate(request.getParameter("repdat")) + "','"
								+ request.getParameter("cusid") + "','" + request.getParameter("cusnam") + "','"
								+ request.getParameter("cusgrp") + "','" + request.getParameter("cussugrp") + "','"
								+ request.getParameter("isiccod") + "','" + request.getParameter("unicod") + "','"
								+ request.getParameter("exsutyp") + "','" + request.getParameter("balamtac") + "','"
								+ request.getParameter("curcod") + "','"+request.getParameter("modtyp")+"','"
								+ session.getAttribute("userName")+"',SYSDATE)");
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

	/*	}*/

return "success";
//return status;
	}

	public String bls0102verify() {
		log.info("ddddddddddd");
			XBRLBLS0102Dao bsd = new XBRLBLS0102Dao();
			ArrayList<XBRLBLS0102Bean> arr=new ArrayList<XBRLBLS0102Bean>();
			arr=bsd.BLS0102verify();
			Gson gson = new Gson();
			detBLS0102 = gson.toJson(arr);
			return "success";
		}
		public String BLS0102vermaster() {
			String status="";
			XBRLBLS0102Dao bsd = new XBRLBLS0102Dao();
			HttpServletRequest request = ServletActionContext.getRequest();
			status=bsd.BLS0102verifymaster();
			
			if(status.equals("success")) {
				resalert="Verification Successful";
			}else {
				resalert="Technical Issue.Try Again Later.";
			}
			
			return "success";
		}
		
	
}
