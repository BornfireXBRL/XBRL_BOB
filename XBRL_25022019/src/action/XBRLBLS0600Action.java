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
import bean.XBRLBLS0600Bean;
import bean.XBRLDCG0100Bean;
import dao.XBRLBLS0600Dao;
import dao.XBRLDCG0100Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;

import org.apache.log4j.Logger;

/***************************************************************************************************************
 * * * @companyName : Bonfire Innovation Private Limited Chennai * * @project :
 * Extensible Business Reporting Language (XBRL) * * @name :
 * XBRLPYM0100Action.java * * @path : action * * @author : D PraveenBabu *
 * * @version : 1.0 * * @functionality : It contains the action with multiple
 * methods to create PYM0100 Report. * * * @relatedScripts :
 * bean.XBRLPYM0100Bean.java,dao.XBRLPYM0100Dao.java * * @creationDate : *
 * * @lastModifiedDate : * * @modificationHistory : * *
 ***************************************************************************************************************/

public class XBRLBLS0600Action {
	
	static Logger log = Logger.getLogger(XBRLBLS0600Action.class);
	public String refno;

	public String summaryBLS0600;

	public String detBLS0600;
public String resalert;
	
	
	
	
	
	public String getResalert() {
		return resalert;
	}

	public void setResalert(String resalert) {
		this.resalert = resalert;
	}
	public String getDetBLS0600() {
		return detBLS0600;
	}

	public void setDetBLS0600(String detBLS0600) {
		this.detBLS0600 = detBLS0600;
	}

	public String getSummaryBLS0600() {
		return summaryBLS0600;
	}

	public void setSummaryBLS0600(String summaryBLS0600) {
		this.summaryBLS0600 = summaryBLS0600;
	}

	public String getRefno() {
		return refno;
	}

	public void setRefno(String refno) {
		this.refno = refno;
	}

	
	
	public String modXbBLSCreate600() throws SQLException {

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
		/*log.info("===" + request.getParameter("reportrefno"));

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
		log.info("insert Action modXbCreateBLS0100");

		/*log.info("NEW FLG:" + newFlg);

		// for Inserting new record

		// for new Reference id
		if (newFlg.equals('Y'))

		{
			sql.append(
					"INSERT INTO BLS0600_MOD_TABLE(REPORT_REF_NO,ACCT_NO,ACCT_NAME,ACCT_OPN_DATE,SCHM_TYPE,DEP_PERIOD_DAYS,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
							+ "values('" + ReporefSeq + "','" + request.getParameter("accountnumber")
							+ "','" + request.getParameter("accountname") + "','" + df.formatdate(request.getParameter("accntopndate")) + "','"
							+ request.getParameter("schemetype") + "','" 
									+ request.getParameter("interestperioddays") + "','"
							+df1.formatdate(request.getParameter("reportdate"))+ "','" + session.getAttribute("userName")
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
			
			
			/*sql.append(
					"SELECT COUNT (*) as cnt FROM   (SELECT DISTINCT REPORT_DATE FROM  BLS0106_MOD_TABLE where REPORT_REF_NO='"
							+ ReporefSeq.trim() + "' and ACCT_NUMBER = '" + request.getParameter("accno")
							+ "'  and REPORT_DATE >='" + df1.formatdate(request.getParameter("dt2"))+"')");*/
			sql.append(
					"SELECT Count (*) as count FROM   (SELECT DISTINCT REPORT_DATE FROM  BLS0600_MOD_TABLE where  ACCT_NO = '"
							+ request.getParameter("accountnumber") + "' and REPORT_DATE ='" + df1.formatdate(request.getParameter("reportdate"))+"')");

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
				sql2.append("update BLS0600_MOD_TABLE set ACCT_NO ='"
						+ request.getParameter("accountnumber") + "',ACCT_NAME ='" + request.getParameter("accountname")
						+ "',ACCT_OPN_DATE ='" + df.formatdate(request.getParameter("accntopndate")) + "',SCHM_TYPE ='"
						+ request.getParameter("schemetype") + "',DEP_PERIOD_DAYS ='"+ request.getParameter("interestperioddays")
						+ "',REPORT_DATE ='" +df.formatdate(request.getParameter("reportdate"))
						+ "' ,DEL_FLG='M' "+ " where ACCT_NO ='" + request.getParameter("accountnumber") +"' and REPORT_DATE ='" + df1.formatdate(request.getParameter("reportdate"))+"'");
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

				
				

				sql3.append("INSERT INTO BLS0600_MOD_TABLE(REPORT_REF_NO,ACCT_NO,ACCT_NAME,ACCT_OPN_DATE,SCHM_TYPE,DEP_PERIOD_DAYS,DEL_FLG,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)");


				sql3.append("values('" + ReporefSeq + "','" + request.getParameter("accountnumber")
						+ "','" + request.getParameter("accountname") + "','" + df.formatdate(request.getParameter("accntopndate")) + "','"
						+ request.getParameter("schemetype") + "','" 
								+ request.getParameter("interestperioddays") + "','"+ request.getParameter("modtyp") + "','"
						+df1.formatdate(request.getParameter("reportdate"))+ "','"+session.getAttribute("userName")+"',SYSDATE)");

				log.info(sql3.toString());
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

	}
	
	

	/* --------------- SUMMARY BUTTOn CLICK --------------------------- */

	public String summaryBLS0600detail() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("in summaryPYM0100detail");

		log.info("test----->" + request.getParameter("reportrefnos") + "dt333"
				+ df.formatdate(request.getParameter("dt1")) + df.formatdate(request.getParameter("dt2")));
		XBRLBLS0600Dao bsd = new XBRLBLS0600Dao();
		ArrayList<XBRLBLS0600Bean> arl = bsd.xbrlblssumEP(df.formatdate(request.getParameter("dt1")),
				df.formatdate(request.getParameter("dt2")), request.getParameter("reportrefnos"),request.getParameter("curr"));

		// summarystandard = arl.toArray(new String[arl.size()]);
		log.info("ARL------------>" + arl.size());
		Gson gson = new Gson();
		summaryBLS0600 = gson.toJson(arl);

		return "success";

	}

	public String detailBLS0600() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		
		
		XBRLBLS0600Dao bsd = new XBRLBLS0600Dao();

		ArrayList<XBRLBLS0600Bean> arl = bsd.xbrlblsajaxdetails(request.getParameter("reptype"),
				request.getParameter("ReporefSeq"), request.getParameter("instno"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		// summarystandard = arl.toArray(new String[arl.size()]);
		
		Gson gson = new Gson();
		detBLS0600 = gson.toJson(arl);

		return "success";

	}
	public String bls0600verify() {
		log.info("ddddddddddd");
			XBRLBLS0600Dao bsd = new XBRLBLS0600Dao();
			ArrayList<XBRLBLS0600Bean> arr=new ArrayList<XBRLBLS0600Bean>();
			arr=bsd.BLS0600verify();
			Gson gson = new Gson();
			detBLS0600 = gson.toJson(arr);
			return "success";
		}
		public String BLS0600vermaster() {
			String status="";
			XBRLBLS0600Dao bsd = new XBRLBLS0600Dao();
			HttpServletRequest request = ServletActionContext.getRequest();
			status=bsd.BLS0600verifymaster();
			
			if(status.equals("success")) {
				resalert="Verification Successful";
			}else {
				resalert="Technical Issue.Try Again Later.";
			}
			
			return "success";
		}
		
		
	
}