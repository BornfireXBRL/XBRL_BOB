
package action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;

import basecode.DateFormat;

import bean.XBRLBLS0100Bean;
import bean.XBRLBLS0100Bean;
import dao.XBRLBLS0100Dao;
import dao.XBRLBLS0100Dao;
import dao.XBRLBLS0100Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;


public class XBRLBLS0100Action {
	static Logger log = Logger.getLogger(XBRLBLS0100Action.class);

	public String sec1BLS0100;
	public String sec1BLS0100s2;
	public String sec1BLS0100s3;
	public String sec1BLS0100s4;
	public String refno;
	
	
	
	
	public String getRefno() {
		return refno;
	}

	public void setRefno(String refno) {
		this.refno = refno;
	}

	public String detBLS0100;
	public String det2BLS0100;
	public String det3BLS0100;
	public String det4BLS0100;
	

	public String getDet2BLS0100() {
		return det2BLS0100;
	}

	public void setDet2BLS0100(String det2bls0100) {
		det2BLS0100 = det2bls0100;
	}

	public String getDet3BLS0100() {
		return det3BLS0100;
	}

	public void setDet3BLS0100(String det3bls0100) {
		det3BLS0100 = det3bls0100;
	}

	public String getDet4BLS0100() {
		return det4BLS0100;
	}

	public void setDet4BLS0100(String det4bls0100) {
		det4BLS0100 = det4bls0100;
	}

	public String getSec1BLS0100() {
		return sec1BLS0100;
	}

	public void setSec1BLS0100(String sec1bls0100) {
		sec1BLS0100 = sec1bls0100;
	}

	public String getSec1BLS0100s2() {
		return sec1BLS0100s2;
	}

	public void setSec1BLS0100s2(String sec1bls0100s2) {
		sec1BLS0100s2 = sec1bls0100s2;
	}

	public String getSec1BLS0100s3() {
		return sec1BLS0100s3;
	}

	public void setSec1BLS0100s3(String sec1bls0100s3) {
		sec1BLS0100s3 = sec1bls0100s3;
	}

	public String getSec1BLS0100s4() {
		return sec1BLS0100s4;
	}

	public void setSec1BLS0100s4(String sec1bls0100s4) {
		sec1BLS0100s4 = sec1bls0100s4;
	}

	public String getDetBLS0100() {
		return detBLS0100;
	}

	public void setDetBLS0100(String detBLS0100) {
		this.detBLS0100 = detBLS0100;
	}

	public String section1BLS0100() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside BLS0100 action");
		
		XBRLBLS0100Dao bsd = new XBRLBLS0100Dao();

		ArrayList<XBRLBLS0100Bean> arl = bsd.xbrlBLS0100(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1BLS0100 = gson.toJson(arl);

		return "success";

	}
	
	public String section2BLS0100() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside BLS01002 action");
		
		XBRLBLS0100Dao bsd = new XBRLBLS0100Dao();

		ArrayList<XBRLBLS0100Bean> arl = bsd.xbrlBLS0100s2(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1BLS0100s2 = gson.toJson(arl);

		return "success";

	}
	
	public String section3BLS0100() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside BLS01003 action");
		
		XBRLBLS0100Dao bsd = new XBRLBLS0100Dao();

		ArrayList<XBRLBLS0100Bean> arl = bsd.xbrlBLS0100s3(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1BLS0100s3 = gson.toJson(arl);

		return "success";

	}
	
	
	
	public String section4BLS0100() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside BLS01004 action");
		
		XBRLBLS0100Dao bsd = new XBRLBLS0100Dao();

		ArrayList<XBRLBLS0100Bean> arl = bsd.xbrlBLS0100s4(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1BLS0100s4 = gson.toJson(arl);

		return "success";

	}
	
	
	
	
	public String detailBLS0100() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		
		
		XBRLBLS0100Dao bsd = new XBRLBLS0100Dao();

		/*ArrayList<XBRLFIM0900Bean> arl = bsd.xbrlfim0900ajaxdetails(request.getParameter("repname"),request.getParameter("ReporefSeq"),
				request.getParameter("instno"),df.formatdate(request.getParameter("dt1")),df.formatdate(request.getParameter("dt2")), request.getParameter("curr"));*/

		ArrayList<XBRLBLS0100Bean> arl = bsd.xbrlBLS0100ajaxdetails(request.getParameter("repname"),request.getParameter("ReporefSeq"),
				request.getParameter("instno"),df.formatdate(request.getParameter("dt2")), request.getParameter("curr"));
		
		// summarystandard = arl.toArray(new String[arl.size()]);
		
		Gson gson = new Gson();
		detBLS0100 = gson.toJson(arl);

		return "success";

	}	
	
	public String detail2BLS0100() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		
		
		XBRLBLS0100Dao bsd = new XBRLBLS0100Dao();

		/*ArrayList<XBRLFIM0900Bean> arl = bsd.xbrlfim0900ajaxdetails(request.getParameter("repname"),request.getParameter("ReporefSeq"),
				request.getParameter("instno"),df.formatdate(request.getParameter("dt1")),df.formatdate(request.getParameter("dt2")), request.getParameter("curr"));*/

		ArrayList<XBRLBLS0100Bean> arl = bsd.xbrlBLS0100ajaxdetails2(request.getParameter("repname"),request.getParameter("ReporefSeq"),
				request.getParameter("instno"),df.formatdate(request.getParameter("dt2")), request.getParameter("curr"));
		
		// summarystandard = arl.toArray(new String[arl.size()]);
		
		Gson gson = new Gson();
		det2BLS0100 = gson.toJson(arl);

		return "success";

	}	
	public String detail3BLS0100() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		
		
		XBRLBLS0100Dao bsd = new XBRLBLS0100Dao();

		/*ArrayList<XBRLFIM0900Bean> arl = bsd.xbrlfim0900ajaxdetails(request.getParameter("repname"),request.getParameter("ReporefSeq"),
				request.getParameter("instno"),df.formatdate(request.getParameter("dt1")),df.formatdate(request.getParameter("dt2")), request.getParameter("curr"));*/

		ArrayList<XBRLBLS0100Bean> arl = bsd.xbrlBLS0100ajaxdetails3(request.getParameter("repname"),request.getParameter("ReporefSeq"),
				request.getParameter("instno"),df.formatdate(request.getParameter("dt2")), request.getParameter("curr"));
		
		// summarystandard = arl.toArray(new String[arl.size()]);
		
		Gson gson = new Gson();
		det3BLS0100 = gson.toJson(arl);

		return "success";

	}	
	public String detail4BLS0100() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		
		
		XBRLBLS0100Dao bsd = new XBRLBLS0100Dao();

		/*ArrayList<XBRLFIM0900Bean> arl = bsd.xbrlfim0900ajaxdetails(request.getParameter("repname"),request.getParameter("ReporefSeq"),
				request.getParameter("instno"),df.formatdate(request.getParameter("dt1")),df.formatdate(request.getParameter("dt2")), request.getParameter("curr"));*/

		ArrayList<XBRLBLS0100Bean> arl = bsd.xbrlBLS0100ajaxdetails4(request.getParameter("repname"),request.getParameter("ReporefSeq"),
				request.getParameter("instno"),df.formatdate(request.getParameter("dt2")), request.getParameter("curr"));
		
		// summarystandard = arl.toArray(new String[arl.size()]);
		
		Gson gson = new Gson();
		det4BLS0100 = gson.toJson(arl);

		return "success";

	}	
	

	public String modXbBLSCreate100() throws SQLException {

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
					" INSERT INTO BLS0100_MOD_TABLE(REPORT_REF_NO,REPORT_DATE,ACCT_NO,ACCT_NAME,CUST_ID,GLSH_CODE,SCH_CODE,SCH_TYPE,ACCT_CRNCY_CODE,EAB_DATE,EAB_BAL,LCHG_USER_ID,LCHG_TIME)" + "VALUES ('"
							+ ReporefSeq + "','" + df1.formatdate(request.getParameter("baldt")) + "','"
							+ request.getParameter("accno") + "','" + request.getParameter("acc") + "','"
							+ request.getParameter("custid") + "','" + request.getParameter("glsh") + "','"
							+ request.getParameter("schmc") + "','" + request.getParameter("schmt") + "','"
							+ request.getParameter("accrycd") + "','" + df1.formatdate(request.getParameter("baldt")) + "','"
							+ request.getParameter("bal") + "','"
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
			sql.append("SELECT COUNT(*) as count FROM BLS0100_MOD_TABLE WHERE  REPORT_DATE='" + df1.formatdate(request.getParameter("dt2")) + "' "
					+ "AND ACCT_NO ='"
					+ request.getParameter("accno") + "'");
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
				sql2.append("UPDATE BLS0100_MOD_TABLE SET ACCT_NAME='" + request.getParameter("acc")
				+ "', CUST_ID ='" + request.getParameter("custid")
				+ "', GLSH_CODE='" + request.getParameter("glsh")
				+ "', SCH_CODE ='" + request.getParameter("schmc")
				+ "', SCH_TYPE ='" + request.getParameter("schmt")
				+ "', ACCT_CRNCY_CODE ='" + request.getParameter("accrycd")
				+ "', EAB_BAL  ='" + request.getParameter("bal")
				+ "', EAB_DATE='" + df1.formatdate(request.getParameter("baldt")) + "',DEL_FLG='M' "
				+ "WHERE REPORT_REF_NO='" + ReporefSeq + "' AND REPORT_DATE='"
				+ df1.formatdate(request.getParameter("baldt")) + "' " + "AND ACCT_NO='"
				+ request.getParameter("accno")
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
						" INSERT INTO BLS0100_MOD_TABLE(REPORT_REF_NO,REPORT_DATE,ACCT_NO,ACCT_NAME,CUST_ID,GLSH_CODE,SCH_CODE,SCH_TYPE,ACCT_CRNCY_CODE,EAB_DATE,EAB_BAL,DEL_FLG,LCHG_USER_ID,LCHG_TIME)" + "VALUES ('"
								+ ReporefSeq + "','" + df1.formatdate(request.getParameter("baldt")) + "','"
								+ request.getParameter("accno") + "','" + request.getParameter("acc") + "','"
								+ request.getParameter("custid") + "','" + request.getParameter("glsh") + "','"
								+ request.getParameter("schmc") + "','" + request.getParameter("schmt") + "','"
								+ request.getParameter("accrycd") + "','" +df1.formatdate( request.getParameter("baldt")) + "','"
								+ request.getParameter("bal") + "','"+request.getParameter("modtyp")+"','"
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

		//}
			log.info("executed");
		//return "success";
return status;
	}
	
	
	public String BLS0100verify() {
		log.info("ddddddddddd");
			XBRLBLS0100Dao bsd = new XBRLBLS0100Dao();
			ArrayList<XBRLBLS0100Bean> arr=new ArrayList<XBRLBLS0100Bean>();
			arr=bsd.BLS0100verify();
			Gson gson = new Gson();
			detBLS0100 = gson.toJson(arr);
			return "success";
		}
	
	
public String resalert;
	
	
	
	
	
	public String getResalert() {
		return resalert;
	}

	public void setResalert(String resalert) {
		this.resalert = resalert;
	}
	public String BLS0100vermaster() {
		String status="";
		XBRLBLS0100Dao bsd = new XBRLBLS0100Dao();
		HttpServletRequest request = ServletActionContext.getRequest();
		status=bsd.BLS0100verifymaster();
		
		if(status.equals("success")) {
			resalert="Verification Successful";
		}else {
			resalert="Technical Issue.Try Again Later.";
		}
		
		return "success";
	}
}
