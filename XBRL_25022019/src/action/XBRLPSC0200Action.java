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
import bean.XBRLPSC0200Bean;
import bean.XBRLFIM0900Bean;
import bean.XBRLPSC0200Bean;
import dao.XBRLPSC0200Dao;
import dao.XBRLPSC0200Dao;
import dao.XBRLFIM0900Dao;
import dao.XBRLPSC0200Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;

import org.apache.log4j.Logger;
public class XBRLPSC0200Action {

	
	
	static Logger log = Logger.getLogger(XBRLPSC0200Action.class);
	
	
	public String sec1PSC0200;
	public String sec1PSC0200s2;
	public String sec1PSC0200s3;
	
	
	public String detPSC0200;
	public String refno;
	
	
	public String getRefno() {
		return refno;
	}

	public void setRefno(String refno) {
		this.refno = refno;
	}

	public String getDetPSC0200() {
		return detPSC0200;
	}

	public void setDetPSC0200(String detPSC0200) {
		this.detPSC0200 = detPSC0200;
	}

	public String getSec1PSC0200s3() {
		return sec1PSC0200s3;
	}

	public void setSec1PSC0200s3(String sec1psc0200s3) {
		sec1PSC0200s3 = sec1psc0200s3;
	}

	public String getSec1PSC0200s2() {
		return sec1PSC0200s2;
	}

	public void setSec1PSC0200s2(String sec1psc0200s2) {
		sec1PSC0200s2 = sec1psc0200s2;
	}

	public String getSec1PSC0200() {
		return sec1PSC0200;
	}

	public void setSec1PSC0200(String sec1psc0200) {
		sec1PSC0200 = sec1psc0200;
	}

	public String section1PSC0200() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside psc0200 action");
		
		XBRLPSC0200Dao bsd = new XBRLPSC0200Dao();

		ArrayList<XBRLPSC0200Bean> arl = bsd.xbrlpsc0200(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1PSC0200 = gson.toJson(arl);

		return "success";

	}
	
	public String section2PSC0200() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside psc02002 action");
		
		XBRLPSC0200Dao bsd = new XBRLPSC0200Dao();

		ArrayList<XBRLPSC0200Bean> arl = bsd.xbrlpsc0200s2(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1PSC0200s2 = gson.toJson(arl);

		return "success";

	}
	
	public String section3PSC0200() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside psc02003 action");
		
		XBRLPSC0200Dao bsd = new XBRLPSC0200Dao();

		ArrayList<XBRLPSC0200Bean> arl = bsd.xbrlpsc0200s3(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1PSC0200s3 = gson.toJson(arl);

		return "success";

	}
	
	
	public String detailPSC0200() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		
		
		XBRLPSC0200Dao bsd = new XBRLPSC0200Dao();

		/*ArrayList<XBRLFIM0900Bean> arl = bsd.xbrlfim0900ajaxdetails(request.getParameter("repname"),request.getParameter("ReporefSeq"),
				request.getParameter("instno"),df.formatdate(request.getParameter("dt1")),df.formatdate(request.getParameter("dt2")), request.getParameter("curr"));*/

		ArrayList<XBRLPSC0200Bean> arl = bsd.xbrlpsc0200ajaxdetails(request.getParameter("repname"),request.getParameter("ReporefSeq"),
				request.getParameter("instno"),df.formatdate(request.getParameter("dt2")), request.getParameter("curr"));
		
		// summarystandard = arl.toArray(new String[arl.size()]);
		
		Gson gson = new Gson();
		detPSC0200 = gson.toJson(arl);

		return "success";

	}	
	
	
	
	

	public String modXbPSCCreate200() throws SQLException {

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
		log.info("insert Action modXbCreatePSC0200");

		/*log.info("NEW FLG:" + newFlg);

		// for Inserting new record

		// for new Reference id
		if (newFlg.equals('Y'))

		{
			sql.append(
					"INSERT INTO PSC0200_MOD_TABLE(REPORT_REF_NO,ACCT_NO,ACCT_NAME,ACCT_OPN_DATE,SCHM_TYPE,DEP_PERIOD_DAYS,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
							+ "values('" + ReporefSeq + "','" + request.getParameter("accountnumber")
							+ "','" + request.getParameter("accountname") + "','" + df.formatdate(request.getParameter("accntopndate")) + "','"
							+ request.getParameter("schemetype") + "','" 
									+ request.getParameter("interestperioddays") + "','"
							+df1.formatdate(request.getParameter("reportdate"))+ "','" + session.getAttribute("userName")
							+ "',SYSDATE)");
			
			
			
			
			
			
			sql.append("INSERT INTO PSC0200_MOD_TABLE(REPORT_REF_NO,ACCT_NUMBER,CUST_ID,CUST_NAME,NRE_FLG,COUNTRY_CODE,UNIQUE_IDENTIFIER,ISIC_CODE,GROUP_CODE,OS_FUND_BASED_AMT,OS_NFB_AMT,PURPOSE_OF_CREDIT,NATURE_OF_CUST,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)");

			sql.append("values('" + ReporefSeq + "','" + NullCheck.isNotNull(request.getParameter("accno"))
					+ "','" + NullCheck.isNotNull(request.getParameter("custid")) + "','" + NullCheck.isNotNull(request.getParameter("custname")) + "','"
					+ NullCheck.isNotNull(request.getParameter("nreflg")) + "','"
							+ NullCheck.isNotNull(request.getParameter("countrcode")) + "','"
									+ NullCheck.isNotNull(request.getParameter("uniqidenti")) + "','"
											+ NullCheck.isNotNull(request.getParameter("detisiccode")) + "','"
													+ NullCheck.isNotNull(request.getParameter("groupcode")) + "','"
															+ NullCheck.isNotNull(request.getParameter("outstandamt")) + "','"
																	+ NullCheck.isNotNull(request.getParameter("outstandnfbamt")) + "','"
																			+ NullCheck.isNotNull(request.getParameter("purpose")) + "','"
																					+ NullCheck.isNotNull(request.getParameter("natofcre")) + "','"
					+ NullCheck.isNotNull(df1.formatdate(request.getParameter("reportdate")))+ "','" + session.getAttribute("userName")
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
			
			
			sql.append(
					"SELECT Count (*) as count FROM   (SELECT DISTINCT REPORT_DATE FROM  PSC0200_MOD_TABLE where  ACCT_NUMBER = '"
							+ request.getParameter("accno")+"'and CUST_ID = '"
							 + request.getParameter("custid")
							+ "' and CUST_NAME = '"
							 + request.getParameter("custname")							
							 + "' and REPORT_DATE >='" + df1.formatdate(request.getParameter("dt1"))
							+ "' and REPORT_DATE <= '" + df1.formatdate(request.getParameter("dt2")) + "')");
			

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
				
		
				
				sql2.append("update PSC0200_MOD_TABLE set REPORT_REF_NO ='" + ReporefSeq + "',ACCT_NUMBER ='"
						+ request.getParameter("accno") + "',CUST_ID ='" + request.getParameter("custid")
						+ "',CUST_NAME ='" + request.getParameter("custname") + "',NRE_FLG ='"
						+ request.getParameter("nreflg") + "',COUNTRY_CODE ='"
						+ request.getParameter("countrcode") + "',UNIQUE_IDENTIFIER ='"
						+ request.getParameter("uniqidenti") + "', ISIC_CODE ='"
								+ request.getParameter("detisiccode") + "', GROUP_CODE ='"
										+ request.getParameter("groupcode") + "', OS_FUND_BASED_AMT='"
												+ request.getParameter("outstandamt") + "', OS_NFB_AMT='"
														+ request.getParameter("outstandnfbamt") + "', PURPOSE_OF_CREDIT='"
																+ request.getParameter("purpose") + "', NATURE_OF_CUST='"
																
												+ request.getParameter("natofcre") + "', REPORT_DATE ='"
														+ df1.formatdate(request.getParameter("reportdate")) + "',DEL_FLG='M' "
												+ " where ACCT_NUMBER ='" + request.getParameter("accno") +"'and  REPORT_DATE ='" + df1.formatdate(request.getParameter("dt2"))+"'");
				
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

				
			
				
				sql3.append("INSERT INTO PSC0200_MOD_TABLE(REPORT_REF_NO,ACCT_NUMBER,CUST_ID,CUST_NAME,NRE_FLG,COUNTRY_CODE,UNIQUE_IDENTIFIER,ISIC_CODE,GROUP_CODE,OS_FUND_BASED_AMT,OS_NFB_AMT,PURPOSE_OF_CREDIT,NATURE_OF_CUST,REPORT_DATE,DEL_FLG,LCHG_USER_ID,LCHG_TIME)" 
						
						+ "values('" + ReporefSeq + "','" + request.getParameter("accno")
						+ "','" + request.getParameter("custid") + "','" + request.getParameter("custname") + "','"
						+ request.getParameter("nreflg") + "','" 
								+ request.getParameter("countrcode") + "','" 
								+ request.getParameter("uniqidenti") + "','"
										+ request.getParameter("detisiccode") + "','" 
										+ request.getParameter("groupcode") + "','" 
										+ request.getParameter("outstandamt") + "','"
												+ request.getParameter("outstandnfbamt") + "','" 
												+ request.getParameter("purpose") + "','" 
												+ request.getParameter("natofcre") + "','"
								+df1.formatdate(request.getParameter("reportdate"))+ "','"+request.getParameter("modtyp")+"','" + session.getAttribute("userName")
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

	}
	
	public String ver;
	public static Logger getLog() {
			return log;
		}

		public static void setLog(Logger log) {
			XBRLPSC0200Action.log = log;
		}

		public String getVer() {
			return ver;
		}

		public void setVer(String ver) {
			this.ver = ver;
		}

	
	public String PSC0200verify() {
		log.info("ddddddddddd");
			XBRLPSC0200Dao bsd = new XBRLPSC0200Dao();
			ArrayList<XBRLPSC0200Bean> arr=new ArrayList<XBRLPSC0200Bean>();
			arr=bsd.PSC0200verify();
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
	
	
	public String PSC0200vermaster() {
		String status="";
		XBRLPSC0200Dao bsd = new XBRLPSC0200Dao();
		HttpServletRequest request = ServletActionContext.getRequest();
		status=bsd.PSC0200verifymaster();
		
		if(status.equals("success")) {
			resalert="Verification Successful";
		}else {
			resalert="Technical Issue.Try Again Later.";
		}
		
		return "success";
	}
	
}
