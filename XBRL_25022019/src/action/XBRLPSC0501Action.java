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
import bean.XBRLPSC0501Bean;
import bean.XBRLPSC0501Bean;
import dao.XBRLPSC0501Dao;
import dao.XBRLPSC0501Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
/***************************************************************************************************************
 * * * @companyName : Bonfire Innovation Private Limited Chennai * * @project :
 * Extensible Business Reporting Language (XBRL) * * @name :
 * XBRLPSC0501Action.java * * @path : action * * @author : D PraveenBabu *
 * * @version : 1.0 * * @functionality : It contains the action with multiple
 * methods to create PSC0501 Report. * * * @relatedScripts :
 * bean.XBRLPSC0501Bean.java,dao.XBRLPSC0501Dao.java * * @creationDate : *
 * * @lastModifiedDate : * * @modificationHistory : * *
 ***************************************************************************************************************/

public class XBRLPSC0501Action {
	static Logger log = Logger.getLogger(XBRLPSC0501Action.class);
	public String refno;

	public String detpsc0501;

	public String getDetpsc0501() {
		return detpsc0501;
	}

	public void setDetpsc0501(String detpsc0501) {
		this.detpsc0501 = detpsc0501;
	}
	public String resalert;
	
	public static Logger getLog() {
		return log;
	}

	public static void setLog(Logger log) {
		XBRLPSC0501Action.log = log;
	}

	public String getResalert() {
		return resalert;
	}

	public void setResalert(String resalert) {
		this.resalert = resalert;
	}
	public String sumPSC0501;

	public String detPSC0501;

	public String getDetPSC0501() {
		return detPSC0501;
	}

	public void setDetPSC0501(String detPSC0501) {
		this.detPSC0501 = detPSC0501;
	}

	public String getSumPSC0501() {
		return sumPSC0501;
	}

	public void setSumPSC0501(String sumPSC0501) {
		this.sumPSC0501 = sumPSC0501;
	}

	public String getRefno() {
		return refno;
	}

	public void setRefno(String refno) {
		this.refno = refno;
	}

	public String modXbPSCCreate501() throws SQLException {

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
		log.info("insert Action modXbCreatePSC0501");


			int rowcount = 0;
			
			
			/*sql.append(
					"SELECT COUNT (*) as cnt FROM   (SELECT DISTINCT REPORT_DATE FROM  BLS0501_MOD_TABLE where REPORT_REF_NO='"
							+ ReporefSeq.trim() + "' and ACCT_NUMBER = '" + request.getParameter("accno")
							+ "'  and REPORT_DATE >='" + df1.formatdate(request.getParameter("dt2"))+"')");*/
			sql.append(
					"SELECT Count (*) as count FROM   (SELECT DISTINCT REPORT_DATE FROM  PSC0501_MOD_TABLE where REPORT_REF_NO='"
							+ ReporefSeq.trim() + "'and APPLICATION_NO = '"
							+ request.getParameter("applno") + "'and APPLICANT_NAME = '"+ request.getParameter("applname") + "'and REPORT_DATE ='" + df1.formatdate(request.getParameter("dt2"))+"')");

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
				
				
				
				sql2.append("UPDATE PSC0501_MOD_TABLE SET  APPLICANT_NAME='" + request.getParameter("applname")
				+ "', RECEIVED_DATE ='" + df1.formatdate(request.getParameter("recvddate"))
				+ "', REJECTION_REASON ='" + request.getParameter("rejres")
				+ "'" +" WHERE REPORT_REF_NO='" + ReporefSeq + "' AND REPORT_DATE='"
				+ df1.formatdate(request.getParameter("rejdate")) + "' " + "AND APPLICATION_NO='"
				+ request.getParameter("applno")
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
						"INSERT INTO PSC0501_MOD_TABLE(REPORT_REF_NO,APPLICATION_NO,APPLICANT_NAME,RECEIVED_DATE,REJECTION_REASON,REPORT_DATE,DEL_FLG,LCHG_USER_ID,LCHG_TIME)" + "VALUES ('" 
								+ ReporefSeq + "','" + request.getParameter("applno")
								+ "','" + request.getParameter("applname") + "','"
								+ df1.formatdate(request.getParameter("recvddate")) + "','" 
								+ request.getParameter("rejres") + "','"
								+df1.formatdate(request.getParameter("rejdate"))+ "','"+request.getParameter("modtyp")+"','"
								 + session.getAttribute("userName")
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

				// String stat = bop0300add(ReporefSeq);
				
			}

			log.info(status);

		//return "success";
	return status;
	}
	


	/* --------------- SUMMARY BUTTOn CLICK --------------------------- */

	public String sumPSC0501() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("in sumPSC0501detail");

		log.info("test----->" + request.getParameter("reportrefnos") + "dt333"
				+ df.formatdate(request.getParameter("dt1")) + df.formatdate(request.getParameter("dt2")));
		XBRLPSC0501Dao bsd = new XBRLPSC0501Dao();
		ArrayList<XBRLPSC0501Bean> arl = bsd.xbrlpsc0501sumEP(df.formatdate(request.getParameter("dt1")),
				df.formatdate(request.getParameter("dt2")), request.getParameter("reportrefnos"),request.getParameter("curr"),request.getParameter("reptype"));

		// summarystandard = arl.toArray(new String[arl.size()]);
		log.info("ARL------------>" + arl.size());
		Gson gson = new Gson();
		sumPSC0501 = gson.toJson(arl);

		return "success";

	}

	public String detailPSC0501() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		
		
		XBRLPSC0501Dao bsd = new XBRLPSC0501Dao();

		ArrayList<XBRLPSC0501Bean> arl = bsd.xbrlpsc0501ajaxdetails(request.getParameter("repname"),
				request.getParameter("ReporefSeq"), request.getParameter("instno"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		// summarystandard = arl.toArray(new String[arl.size()]);
		
		Gson gson = new Gson();
		detPSC0501 = gson.toJson(arl);

		return "success";

	}
	
	
	public String PSC0501verify() {
		log.info("ddddddddddd");
			XBRLPSC0501Dao bsd = new XBRLPSC0501Dao();
			ArrayList<XBRLPSC0501Bean> arr=new ArrayList<XBRLPSC0501Bean>();
			arr=bsd.PSC0501verify();
			Gson gson = new Gson();
			detpsc0501 = gson.toJson(arr);
			return "success";
		}public String PSC0501vermaster() {
			String status="";
			XBRLPSC0501Dao bsd = new XBRLPSC0501Dao();
			HttpServletRequest request = ServletActionContext.getRequest();
			status=bsd.PSC0501verifymaster();
			if(status.equals("success")) {
				resalert="Verification Successful";
			}else {
				resalert="Technical Issue.Try Again Later.";
			}
			
			return "success";
		}

	

}