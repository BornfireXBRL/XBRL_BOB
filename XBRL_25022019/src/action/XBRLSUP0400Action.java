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
import bean.XBRLSUP0400Bean;
import bean.XBRLSUP0400Bean;
import dao.XBRLSUP0400Dao;
import dao.XBRLSUP0400Dao;
import dao.XBRLSUP0400Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRLSUP0400Action {
	
	static Logger log = Logger.getLogger(XBRLSUP0400Action.class);

	public String sec1SUP0400;
	public String sec2SUP0400;
	public String sec3SUP0400;
	public String detailsSUP0400;
	public String getDetailsSUP0400() {
		return detailsSUP0400;
	}
	public void setDetailsSUP0400(String detailsSUP0400) {
		this.detailsSUP0400 = detailsSUP0400;
	}
	public String getSec3SUP0400() {
		return sec3SUP0400;
	}
	public void setSec3SUP0400(String sec3sup0400) {
		sec3SUP0400 = sec3sup0400;
	}
	public String getSec2SUP0400() {
		return sec2SUP0400;
	}
	public void setSec2SUP0400(String sec2sup0400) {
		sec2SUP0400 = sec2sup0400;
	}
	public String getSec1SUP0400() {
		return sec1SUP0400;
	}
	public void setSec1SUP0400(String sec1sup0400) {
		sec1SUP0400 = sec1sup0400;
	}
	
	
	
	public String refno;
	public String getRefno() {
		return refno;
	}

	public void setRefno(String refno) {
		this.refno = refno;
	}

	
	public String modXbSUPCreate400() throws SQLException {

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
		log.info("insert Action modXbCreateSUP0400");

		/*log.info("NEW FLG:" + newFlg);

		// for Inserting new record

		// for new Reference id
		if (newFlg.equals('Y'))

		{
			
			sql.append(
					"INSERT INTO SUP0400_MOD_TABLE(REPORT_REF_NO,GROUP_NAME,GROUP_ID,PARTY_NAME,UNIQUE_ID,TYPE_OF_PARTY,RELATIONSHIP,PURPOSE,APPROVAL_DATE,ORIGINAL_CURRENCY,SANCT_AMT_ACCT_CRNCY_FB,SANCT_AMT_ACCT_CRNCY_NFB,OUT_AMT_ACCT_CRNCY_FB,OUT_AMT_ACCT_CRNCY_NFB,NUMERATOR,NO_OF_ARREAR_DAYS,INT_RATE,REMAINING_MATURY_DAYS,COLLATERAL_TYPE,COLLATERAL_DESC,LAST_VALUATION_DATE,VALUE,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
							+ "values('" + ReporefSeq + "','" + request.getParameter("groupName")
							+ "','" + request.getParameter("groupId") + "','"
							+ request.getParameter("partyName") + "','" 
							+ request.getParameter("uniqueId") + "','"
							+ request.getParameter("typeofParty") + "','" 
							+ request.getParameter("relationship") + "','"
							+ request.getParameter("purpose") + "','" 
							+df1.formatdate( request.getParameter("approvalDate")) + "','"
							+ request.getParameter("originalCurrency") + "','"
							+ request.getParameter("sancamtcurfb") + "','" 
							+ request.getParameter("sancamtcurnfb") + "','"
							+ request.getParameter("outamtcurfb") + "','" 
							+ request.getParameter("outamtcurnfb") + "','"
							+request.getParameter("numerator") + "','" 
							+ request.getParameter("noofarrears") + "','" 
							+ request.getParameter("intRate") + "','" 
							+ request.getParameter("remainingMaturityDays") + "','" 
							+ request.getParameter("collateralType") + "','" 
							+ request.getParameter("collateralDesc") + "','" 
							+ df1.formatdate(request.getParameter("lastValuationDate")) + "','"  
							+ request.getParameter("value") + "','" 
							+df1.formatdate(request.getParameter("reportDate"))+ "','" + session.getAttribute("userName")
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
			
			
			/*sql.append(
					"SELECT COUNT (*) as cnt FROM   (SELECT DISTINCT REPORT_DATE FROM  BLS0106_MOD_TABLE where REPORT_REF_NO='"
							+ ReporefSeq.trim() + "' and ACCT_NUMBER = '" + request.getParameter("accno")
							+ "'  and REPORT_DATE >='" + df1.formatdate(request.getParameter("dt2"))+"')");*/
			sql.append(
					"SELECT Count (*) as count FROM   (SELECT DISTINCT REPORT_DATE FROM  SUP0400_MOD_TABLE where  GROUP_NAME = '"
							+ request.getParameter("groupName") + "'and PARTY_NAME = '"+ request.getParameter("partyName") + "'and UNIQUE_ID = '"+ request.getParameter("uniqueId") + "'and REPORT_DATE >='" + df1.formatdate(request.getParameter("dt2"))+"')");

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
				
			
				sql2.append("update  SUP0400_MOD_TABLE set REPORT_REF_NO ='" + ReporefSeq + "',GROUP_NAME ='"
						+ request.getParameter("groupName") + "',GROUP_ID ='" + request.getParameter("groupId")
						+ "',PARTY_NAME ='" + request.getParameter("partyName") + "',UNIQUE_ID ='"
						+ request.getParameter("uniqueId") + "',TYPE_OF_PARTY ='"+ request.getParameter("typeofParty")
						+ "',RELATIONSHIP ='" +request.getParameter("relationship")
						+ "',PURPOSE ='"
						+ request.getParameter("purpose") + "',APPROVAL_DATE ='" + df.formatdate(request.getParameter("approvalDate"))
						+ "',ORIGINAL_CURRENCY ='" + request.getParameter("originalCurrency") + "',SANCT_AMT_ACCT_CRNCY_FB ='"
						+ request.getParameter("sancamtcurfb") + "',SANCT_AMT_ACCT_CRNCY_NFB ='"+ request.getParameter("sancamtcurnfb")
						+ "',OUT_AMT_ACCT_CRNCY_FB ='" +request.getParameter("outamtcurfb")
						+ "',OUT_AMT_ACCT_CRNCY_NFB ='"
						+ request.getParameter("outamtcurnfb") + "',NUMERATOR ='" +request.getParameter("numerator")
						+ "',NO_OF_ARREAR_DAYS ='" + request.getParameter("noofarrears") + "',INT_RATE ='" + request.getParameter("intRate") + "',REMAINING_MATURY_DAYS ='"
												 + request.getParameter("remainingMaturityDays") + "',COLLATERAL_TYPE ='" + request.getParameter("collateralType") + "',COLLATERAL_DESC ='" + request.getParameter("collateralDesc") + "',LAST_VALUATION_DATE ='"+ df.formatdate(request.getParameter("lastValuationDate"))
												 	+ "',VALUE ='"+ request.getParameter("value")
										+ "',REPORT_DATE ='"
			
						+ df.formatdate(request.getParameter("reportDate")) + "',DEL_FLG='M' "
						+ " where GROUP_NAME ='" + request.getParameter("groupName") +"'and GROUP_ID ='" + request.getParameter("groupId") +"' and  PARTY_NAME ='" + request.getParameter("partyName") +"'and UNIQUE_ID ='" + request.getParameter("uniqueId") +"' and REPORT_REF_NO ='" + ReporefSeq + "'and REPORT_DATE ='" + df1.formatdate(request.getParameter("reportDate"))+"'");
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
						"INSERT INTO SUP0400_MOD_TABLE(REPORT_REF_NO,GROUP_NAME,GROUP_ID,PARTY_NAME,UNIQUE_ID,TYPE_OF_PARTY,RELATIONSHIP,PURPOSE,APPROVAL_DATE,ORIGINAL_CURRENCY,SANCT_AMT_ACCT_CRNCY_FB,SANCT_AMT_ACCT_CRNCY_NFB,OUT_AMT_ACCT_CRNCY_FB,OUT_AMT_ACCT_CRNCY_NFB,NUMERATOR,NO_OF_ARREAR_DAYS,INT_RATE,REMAINING_MATURY_DAYS,COLLATERAL_TYPE,COLLATERAL_DESC,LAST_VALUATION_DATE,VALUE,REPORT_DATE,DEL_FLG,LCHG_USER_ID,LCHG_TIME)"
								+ "values('" + ReporefSeq + "','" + request.getParameter("groupName")
								+ "','" + request.getParameter("groupId") + "','"
								+ request.getParameter("partyName") + "','" 
								+ request.getParameter("uniqueId") + "','"
								+ request.getParameter("typeofParty") + "','" 
								+ request.getParameter("relationship") + "','"
								+ request.getParameter("purpose") + "','" 
								+df1.formatdate( request.getParameter("approvalDate")) + "','"
								+ request.getParameter("originalCurrency") + "','"
								+ request.getParameter("sancamtcurfb") + "','" 
								+ request.getParameter("sancamtcurnfb") + "','"
								+ request.getParameter("outamtcurfb") + "','" 
								+ request.getParameter("outamtcurnfb") + "','"
								+request.getParameter("numerator") + "','" 
								+ request.getParameter("noofarrears") + "','" 
								+ request.getParameter("intRate") + "','" 
								+ request.getParameter("remainingMaturityDays") + "','" 
								+ request.getParameter("collateralType") + "','" 
								+ request.getParameter("collateralDesc") + "','" 
								+ df1.formatdate(request.getParameter("lastValuationDate")) + "','"  
								+ request.getParameter("value") + "','" 
								+df1.formatdate(request.getParameter("reportDate"))+ "','"+request.getParameter("modtyp")+"','" + session.getAttribute("userName")
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

		//}

		return "success";

	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public String section1SUP0400() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside sup action");
		
		XBRLSUP0400Dao bsd = new XBRLSUP0400Dao();

		ArrayList<XBRLSUP0400Bean> arl = bsd.xbrlsup0400(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1SUP0400 = gson.toJson(arl);

		return "success";

	}
	
	public String section2SUP0400() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside sup action");
		
		XBRLSUP0400Dao bsd = new XBRLSUP0400Dao();

		ArrayList<XBRLSUP0400Bean> arl = bsd.xbrlsup0400section2(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec2SUP0400 = gson.toJson(arl);

		return "success";

	}
	
	public String section3SUP0400() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside sup action");
		
		XBRLSUP0400Dao bsd = new XBRLSUP0400Dao();

		ArrayList<XBRLSUP0400Bean> arl = bsd.xbrlsup0400section3(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec3SUP0400 = gson.toJson(arl);

		return "success";

	}
	
	public String detailsSUP0400() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside sup action");
		
		XBRLSUP0400Dao bsd = new XBRLSUP0400Dao();

		ArrayList<XBRLSUP0400Bean> arl = bsd.xbrlsup0400details(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		detailsSUP0400 = gson.toJson(arl);

		return "success";

	}
	
	public String ver;
	public static Logger getLog() {
			return log;
		}

		public static void setLog(Logger log) {
			XBRLSUP0400Action.log = log;
		}

		public String getVer() {
			return ver;
		}

		public void setVer(String ver) {
			this.ver = ver;
		}

	
	public String SUP0400verify() {
		log.info("ddddddddddd");
			XBRLSUP0400Dao bsd = new XBRLSUP0400Dao();
			ArrayList<XBRLSUP0400Bean> arr=new ArrayList<XBRLSUP0400Bean>();
			arr=bsd.SUP0400verify();
			Gson gson = new Gson();
			ver = gson.toJson(arr);
			return "success";
		}
	
	
	public String resalert;

	public String getResalert() {
		return resalert;
	}

	public void setResalert(String resalert) {
		this.resalert = resalert;
	}
	
	
	public String SUP0400vermaster() {
		String status="";
		XBRLSUP0400Dao bsd = new XBRLSUP0400Dao();
		HttpServletRequest request = ServletActionContext.getRequest();
		status=bsd.SUP0400verifymaster();
		
		if(status.equals("success")) {
			resalert="Verification Successful";
		}else {
			resalert="Technical Issue.Try Again Later.";
		}
		
		return "success";
	}
}
