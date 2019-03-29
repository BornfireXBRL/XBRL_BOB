package action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;

import basecode.DateFormat;
import bean.XBRLDCG0100Bean;
import dao.XBRLDCG0100Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;

/***************************************************************************************************************
 * * * @companyName : Bonfire Innovation Private Limited Chennai * * @project :
 * Extensible Business Reporting Language (XBRL) * * @name :
 * XBRLDCG0100Action.java * * @path : action * * @author : D PraveenBabu *
 * * @version : 1.0 * * @functionality : It contains the action with multiple
 * methods to create DCG0100 Report. * * * @relatedScripts :
 * bean.XBRLDCG0100Bean.java,dao.XBRLDCG0100Dao.java * * @creationDate : *
 * * @lastModifiedDate : * * @modificationHistory : * *
 ***************************************************************************************************************/

public class XBRLDCG0100Action {
	
	static Logger log = Logger.getLogger(XBRLDCG0100Action.class);

	public String refno;

	public String resalert;
	
	
	
	
	
	public String getResalert() {
		return resalert;
	}

	public void setResalert(String resalert) {
		this.resalert = resalert;
	}
	public String summaryDCG0100;

	public String detDCG0100;

	public String getDetDCG0100() {
		return detDCG0100;
	}

	public void setDetDCG0100(String detDCG0100) {
		this.detDCG0100 = detDCG0100;
	}

	public String getSummaryDCG0100() {
		return summaryDCG0100;
	}

	public void setSummaryDCG0100(String summaryDCG0100) {
		this.summaryDCG0100 = summaryDCG0100;
	}

	public String getRefno() {
		return refno;
	}

	public void setRefno(String refno) {
		this.refno = refno;
	}

	public String modXbDCGCreate100() throws SQLException {

		log.info("XBRL XBRL XBRL");

		String status = "";
		String status1 = "";

		
		HttpServletRequest request = ServletActionContext.getRequest();
		String ReporefSeq = request.getParameter("reportrefno");
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

			ReporefSeq =  reporefseqno;
			newFlg = 'Y';

		}*/
		log.info("===ReporefSeq===" + ReporefSeq);
		// log.info("<< EIDSeq >> " + EIDSeq);
		session.setAttribute("ReprefSeq", ReporefSeq);

		int rs = 0;

		int count = 0;

		StringBuffer sql = new StringBuffer();

		// HttpSession session = request.getSession();
		log.info("insert Action modXbCreateDCG0100");

		

		// for Inserting new record

		// for new Reference id
		/*if (newFlg.equals('Y'))

		{
			sql.append(
					" INSERT INTO DCG0100_MOD_TABLE(REPORT_REF_NO,REPORT_DATE,CODE,NO_OF_COINS,LCHG_USER_ID,LCHG_TIME)" + "VALUES ('"
							+ ReporefSeq + "','" + df1.formatdate(request.getParameter("Reportdate")) + "','"
							+ request.getParameter("Typeofcoin") + "','" + request.getParameter("Noofcoins") + "','"
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
		log.info("njhjhjjk");

			int rowcount = 0;
			sql.append("SELECT COUNT(*) as count FROM DCG0100_MOD_TABLE WHERE REPORT_DATE='" + df1.formatdate(request.getParameter("Reportdate")) + "' "
					+ "AND CODE ='"
					+ request.getParameter("Typeofcoin") + "'");
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
				sql2.append("UPDATE DCG0100_MOD_TABLE SET NO_OF_COINS='" + request.getParameter("Noofcoins")+"',DEL_FLG='M' "
				+ "WHERE  REPORT_DATE='"
				+ df1.formatdate(request.getParameter("Reportdate")) + "' " + "AND CODE='"
				+ request.getParameter("Typeofcoin")
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
						" INSERT INTO DCG0100_MOD_TABLE(REPORT_REF_NO,REPORT_DATE,CODE,NO_OF_COINS,DEL_FLG,LCHG_USER_ID,LCHG_TIME)" + "VALUES ('"
								+ ReporefSeq + "','" + df1.formatdate(request.getParameter("Reportdate")) + "','"
								+ request.getParameter("Typeofcoin") + "','" + request.getParameter("Noofcoins") + "','"+request.getParameter("modtyp")+"','"
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

		

return "success";
//return status;
	}

	/* --------------- SUMMARY BUTTOn CLICK --------------------------- */

	public String summaryDCG0100detail() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("in summaryDCG0100detail");

		log.info("test----->" + request.getParameter("reportrefnos") + "dt333"
				+ df.formatdate(request.getParameter("dt1")) + df.formatdate(request.getParameter("dt2")));
		XBRLDCG0100Dao bsd = new XBRLDCG0100Dao();
		ArrayList<XBRLDCG0100Bean> arl = bsd.xbrlDCGsumEP(df.formatdate(request.getParameter("dt1")),
				df.formatdate(request.getParameter("dt2")), request.getParameter("reportrefnos"),request.getParameter("curr"));

		// summarystandard = arl.toArray(new String[arl.size()]);
		log.info("ARL------------>" + arl.size());
		Gson gson = new Gson();
		summaryDCG0100 = gson.toJson(arl);

		return "success";

	}

	public String detailDCG0100() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		
		
		XBRLDCG0100Dao bsd = new XBRLDCG0100Dao();

		ArrayList<XBRLDCG0100Bean> arl = bsd.xbrlDCGajaxdetails(request.getParameter("repname"),
				request.getParameter("ReporefSeq"), request.getParameter("instno"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		// summarystandard = arl.toArray(new String[arl.size()]);
		
		Gson gson = new Gson();
		detDCG0100 = gson.toJson(arl);

		return "success";

	}

	
	
	public String dcg0100verify() {
	log.info("ddddddddddd");
		XBRLDCG0100Dao bsd = new XBRLDCG0100Dao();
		ArrayList<XBRLDCG0100Bean> arr=new ArrayList<XBRLDCG0100Bean>();
		arr=bsd.DCG0100verify();
		Gson gson = new Gson();
		detDCG0100 = gson.toJson(arr);
		return "success";
	}
	public String DCG0100vermaster() {
		String status="";
		XBRLDCG0100Dao bsd = new XBRLDCG0100Dao();
		HttpServletRequest request = ServletActionContext.getRequest();
		status=bsd.DCG0100verifymaster();
		
		if(status.equals("success")) {
			resalert="Verification Successful";
		}else {
			resalert="Technical Issue.Try Again Later.";
		}
		
		return "success";
	}
	
	
	
	
}