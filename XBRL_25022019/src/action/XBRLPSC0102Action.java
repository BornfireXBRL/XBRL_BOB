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
import bean.XBRLFIM0400Bean;
import bean.XBRLPSC0102Bean;
import dao.XBRLFIM0400Dao;
import dao.XBRLPSC0102Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
/***************************************************************************************************************
 * * * @companyName : Bonfire Innovation Private Limited Chennai * * @project :
 * Extensible Business Reporting Language (XBRL) * * @name :
 * XBRLpsc0102Action.java * * @path : action * * @author : D PraveenBabu *
 * * @version : 1.0 * * @functionality : It contains the action with multiple
 * methods to create psc0102 Report. * * * @relatedScripts :
 * bean.XBRLpsc0102Bean.java,dao.XBRLpsc0102Dao.java * * @creationDate : *
 * * @lastModifiedDate : * * @modificationHistory : * *
 ***************************************************************************************************************/

public class XBRLPSC0102Action {
	static Logger log = Logger.getLogger(XBRLPSC0102Action.class);
	public String refno;
	
	public String resalert;

	public String getResalert() {
		return resalert;
	}

	public void setResalert(String resalert) {
		this.resalert = resalert;
	}

	public String summarypsc0102;
	public String sumpsc0102;

	public String getSumpsc0102() {
		return sumpsc0102;
	}

	public void setSumpsc0102(String sumpsc0102) {
		this.sumpsc0102 = sumpsc0102;
	}

	public String detpsc0102;

	public String getDetpsc0102() {
		return detpsc0102;
	}

	public void setDetpsc0102(String detpsc0102) {
		this.detpsc0102 = detpsc0102;
	}

	public String getSummarypsc0102() {
		return summarypsc0102;
	}

	public void setSummarypsc0102(String summarypsc0102) {
		this.summarypsc0102 = summarypsc0102;
	}

	public String getRefno() {
		return refno;
	}

	public void setRefno(String refno) {
		this.refno = refno;
	}

	

	public String summarypsc0102detail() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("in summarypsc0102detail");

		log.info("test----->" + request.getParameter("reportrefnos") + "dt333"
				+ df.formatdate(request.getParameter("dt1")) + df.formatdate(request.getParameter("dt2")));
		XBRLPSC0102Dao bsd = new XBRLPSC0102Dao();
		ArrayList<XBRLPSC0102Bean> arl = bsd.xbrlpsc0102sumEP(df.formatdate(request.getParameter("dt1")),
				df.formatdate(request.getParameter("dt2")), request.getParameter("reportrefnos"),request.getParameter("curr"),request.getParameter("reptype"));

		// summarystandard = arl.toArray(new String[arl.size()]);
		log.info("ARL------------>" + arl.size());
		Gson gson = new Gson();
		summarypsc0102 = gson.toJson(arl);

		return "success";

	}
	
	public String sumpsc0102detail() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("in summarypsc0102detail");

		log.info("test----->" + request.getParameter("reportrefnos") + "dt333"
				+ df.formatdate(request.getParameter("dt1")) + df.formatdate(request.getParameter("dt2")));
		XBRLPSC0102Dao bsd = new XBRLPSC0102Dao();
		ArrayList<XBRLPSC0102Bean> arl = bsd.xbrlpsc0102sumEP1(df.formatdate(request.getParameter("dt1")),
				df.formatdate(request.getParameter("dt2")), request.getParameter("reportrefnos"),request.getParameter("curr"),request.getParameter("reptype"));

		// summarystandard = arl.toArray(new String[arl.size()]);
		log.info("ARL------------>" + arl.size());
		Gson gson = new Gson();
		sumpsc0102 = gson.toJson(arl);

		return "success";

	}
	public String modXbPSCCreate0102() throws SQLException {
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
/*
		log.info("NEW FLG:" + newFlg);

		// for Inserting new record

		// for new Reference id
		if (newFlg.equals('Y'))

		{
		
			sql.append("INSERT INTO PSC0102_MOD_TABLE(REPORT_REF_NO,ACCT_NUMBER,ACCT_NAME,CRNCY_CODE,SANCT_AMT,OUTSTANDING_AMT,IMPAIRED_FLG,ACCT_OPN_DATE,NFB_FACILITY_AMT,RESTRUCTURED_FLG,INT_RATE,SECURED_FLG,SCHM_CODE,SCHM_TYPE,ISIC_CODE,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
             	+"values('" + ReporefSeq + "','" + request.getParameter("acno")
					+ "','" + request.getParameter("acname") + "','" + request.getParameter("crncy") + "','"
					+ request.getParameter("sncamt") + "','" + request.getParameter("otstndamt") + "','"
					+ request.getParameter("npaflg") + "','"+ df.formatdate(request.getParameter("acopendt")) + "','"
					+ request.getParameter("nfbfacamt") + "','"+ request.getParameter("resflg") + "','"
					+ request.getParameter("insrt") + "','"+ request.getParameter("secflg") + "','"
					+ request.getParameter("shmcd") + "','"+ request.getParameter("shmty") + "','"
					+ request.getParameter("isiccd") + "','"
					+df.formatdate(request.getParameter("repdt"))+ "','" + session.getAttribute("userName")
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
			sql.append("SELECT COUNT(*) as count FROM PSC0102_MOD_TABLE WHERE REPORT_DATE='" + df1.formatdate(request.getParameter("repdt")) + "' " + "AND ACCT_NUMBER='"
					 + request.getParameter("acno") + "' ");
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
			
				sql2.append("update PSC0102_MOD_TABLE set ACCT_NAME ='"+request.getParameter("acname")
						
						+ "',CRNCY_CODE ='" + request.getParameter("crncy") + "',SANCT_AMT ='"
						+ request.getParameter("sncamt") + "',OUTSTANDING_AMT ='"+ request.getParameter("otstndamt")
						+ "',IMPAIRED_FLG ='" + request.getParameter("npaflg") + "',ACCT_OPN_DATE ='"
						+ df.formatdate(request.getParameter("acopendt")) + "',NFB_FACILITY_AMT ='"+ request.getParameter("nfbfacamt")
						+ "',RESTRUCTURED_FLG ='"+ request.getParameter("resflg") + "',INT_RATE ='"+ request.getParameter("insrt")
						+ "',SECURED_FLG ='" + request.getParameter("secflg") + "',SCHM_CODE ='"
						+ request.getParameter("shmcd") + "',SCHM_TYPE ='"+ request.getParameter("shmty")
						+ "',ISIC_CODE ='" + request.getParameter("isiccd") + "'  DEL_FLG='M'"
						+ " WHERE REPORT_DATE='"
						+ df1.formatdate(request.getParameter("repdt")) + "' " + "AND ACCT_NUMBER='"
						+ request.getParameter("acno")
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

				sql3.append("INSERT INTO PSC0102_MOD_TABLE(REPORT_REF_NO,ACCT_NUMBER,ACCT_NAME,CRNCY_CODE,SANCT_AMT,OUTSTANDING_AMT,IMPAIRED_FLG,ACCT_OPN_DATE,NFB_FACILITY_AMT,RESTRUCTURED_FLG,INT_RATE,SECURED_FLG,SCHM_CODE,SCHM_TYPE,ISIC_CODE,REPORT_DATE,DEL_FLG,LCHG_USER_ID,LCHG_TIME)"
	             	+"values('" + ReporefSeq + "','" + request.getParameter("acno")
						+ "','" + request.getParameter("acname") + "','" + request.getParameter("crncy") + "','"
						+ request.getParameter("sncamt") + "','" + request.getParameter("otstndamt") + "','"
						+ request.getParameter("npaflg") + "','"+ df.formatdate(request.getParameter("acopendt")) + "','"
						+ request.getParameter("nfbfacamt") + "','"+ request.getParameter("resflg") + "','"
						+ request.getParameter("insrt") + "','"+ request.getParameter("secflg") + "','"
						+ request.getParameter("shmcd") + "','"+ request.getParameter("shmty") + "','"
						+ request.getParameter("isiccd") + "','"+df.formatdate(request.getParameter("repdt"))+"','"
						+request.getParameter("modtyp")+ "','" + session.getAttribute("userName")
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

	public String detailpsc0102() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		
		
		XBRLPSC0102Dao bsd = new XBRLPSC0102Dao();

		ArrayList<XBRLPSC0102Bean> arl = bsd.xbrlpsc0102ajaxdetails(request.getParameter("repname"),
				request.getParameter("ReporefSeq"), request.getParameter("instno"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		// summarystandard = arl.toArray(new String[arl.size()]);
		
		Gson gson = new Gson();
		detpsc0102 = gson.toJson(arl);

		return "success";

	}
	
	public String PSC0102verify() {
		log.info("ddddddddddd");
			XBRLPSC0102Dao bsd = new XBRLPSC0102Dao();
			ArrayList<XBRLPSC0102Bean> arr=new ArrayList<XBRLPSC0102Bean>();
			arr=bsd.PSC0102verify();
			Gson gson = new Gson();
			detpsc0102 = gson.toJson(arr);
			return "success";
		}
	public String PSC0102vermaster() {
		String status="";
		XBRLPSC0102Dao bsd = new XBRLPSC0102Dao();
		HttpServletRequest request = ServletActionContext.getRequest();
		status=bsd.PSC0102verifymaster();
		System.out.println("gj");
		if(status.equals("success")) {
			resalert="Verification Successful";
		}else {
			resalert="Technical Issue.Try Again Later.";
		}
		
		return "success";
	}


}