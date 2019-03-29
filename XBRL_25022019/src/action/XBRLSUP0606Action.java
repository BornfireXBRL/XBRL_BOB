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
import bean.XBRLSUP0606Bean;
import bean.XBRLSUP0606Bean;
import dao.XBRLSUP0606Dao;
import dao.XBRLSUP0606Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;

/**
 * @companyName : Bonfire Innovation Private Limited Chennai
 * @project : Extensible Business Reporting Language (XBRL)
 * @name : XBRLSUP0606Action.java
 * @path : action
 * @author : D PraveenBabu
 * @version : 1.0
 * @functionality : It contains the action with multiple methods to create
 *                SUP0606 Report.
 * @relatedScripts : bean.XBRLSUP0606Bean.java,dao.XBRLSUP0606Dao.java
 * @creationDate :
 * @lastModifiedDate :
 * @modificationHistory :
 * 
 */

public class XBRLSUP0606Action {

	static Logger log = Logger.getLogger(XBRLSUP0606Action.class);

	public String dashdata[];
	public String reporefeno;
	public String dtlSUP0606;
	public String refno;
	public String detSUP0606  ;
	public String resalert;
	
		public String getResalert() {
			return resalert;
		}

		public void setResalert(String resalert) {
			this.resalert = resalert;
		}
		public String getDetSUP0606() {
			return detSUP0606;
		}

		public void setDetSUP0606(String detSUP0606) {
			this.detSUP0606 = detSUP0606;
		}
	public String getRefno() {
		return refno;
	}

	public void setRefno(String refno) {
		this.refno = refno;
	}

	public String getDtlSUP0606() {
		return dtlSUP0606;
	}

	public void setDtlSUP0606(String dtlSUP0606) {
		this.dtlSUP0606 = dtlSUP0606;
	}

	public String sumSUP0606;

	public String getSumSUP0606() {
		return sumSUP0606;
	}

	public void setSumSUP0606(String sumSUP0606) {
		this.sumSUP0606 = sumSUP0606;
	}

	public String summarySUP0606;

	public String getSummarySUP0606() {
		return summarySUP0606;
	}

	public void setSummarySUP0606(String summarySUP0606) {
		this.summarySUP0606 = summarySUP0606;
	}

	public String summary3SUP0606;

	public String getSummary3SUP0606() {
		return summary3SUP0606;
	}

	public void setSummary3SUP0606(String summary3sup0606) {
		summary3SUP0606 = summary3sup0606;
	}

	public String[] getDashdata() {
		return dashdata;
	}

	public void setDashdata(String[] dashdata) {
		this.dashdata = dashdata;
	}

	public String getReporefeno() {
		return reporefeno;
	}

	public void setReporefeno(String reporefeno) {
		this.reporefeno = reporefeno;
	}

	public String summary1SUP0606detail() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("in summary11SUP0606detail");

		log.info("test----->" + request.getParameter("reptype") + "dt333" + df.formatdate(request.getParameter("dt1"))
				+ df.formatdate(request.getParameter("dt2")));
		XBRLSUP0606Dao bsd = new XBRLSUP0606Dao();
		ArrayList<XBRLSUP0606Bean> arl = bsd.xbrl1fimsums1(request.getParameter("reptype"),
				request.getParameter("ReporefSeq"), request.getParameter("instno"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),
				request.getParameter("curr"));

		// summarystandard = arl.toArray(new String[arl.size()]);
		log.info("ARL------------>" + arl.size());
		Gson gson = new Gson();
		sumSUP0606 = gson.toJson(arl);
		log.info("summarysec1SUP0606" + sumSUP0606);

		return "success";

	}

	public String summarySUP0606detail() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("in summarySUP0606detail");

		log.info("test----->" + request.getParameter("ReporefSeq") + "dt333"
				+ df.formatdate(request.getParameter("dt1")) + df.formatdate(request.getParameter("dt2"))
				+ request.getParameter("reptype") + request.getParameter("ReporefSeq"));
		XBRLSUP0606Dao bsd = new XBRLSUP0606Dao();
		ArrayList<XBRLSUP0606Bean> arl = bsd.xbrlSUP0606sum2(request.getParameter("reptype"),
				request.getParameter("ReporefSeq"), request.getParameter("instno"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),
				request.getParameter("curr"));

		// summarystandard = arl.toArray(new String[arl.size()]);
		log.info("ARL------------>" + arl.size());
		Gson gson = new Gson();
		summarySUP0606 = gson.toJson(arl);

		log.info("summarysec2SUP0606" + summarySUP0606);
		return "success";

	}

	public String summary3SUP0606detail() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("in summarySUP0606detail");

		log.info("test----->" + request.getParameter("ReporefSeq") + "dt333"
				+ df.formatdate(request.getParameter("dt1")) + df.formatdate(request.getParameter("dt2"))
				+ request.getParameter("reptype") + request.getParameter("ReporefSeq"));
		XBRLSUP0606Dao bsd = new XBRLSUP0606Dao();
		ArrayList<XBRLSUP0606Bean> arl = bsd.xbrlSUP0606sum3(request.getParameter("reptype"),
				request.getParameter("ReporefSeq"), request.getParameter("instno"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),
				request.getParameter("curr"));

		// summarystandard = arl.toArray(new String[arl.size()]);
		log.info("ARL------------>" + arl.size());
		Gson gson = new Gson();
		summary3SUP0606 = gson.toJson(arl);

		log.info("summarysec3SUP0606" + summary3SUP0606);
		return "success";

	}

	public String detailSUP0606() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();

		XBRLSUP0606Dao bsd = new XBRLSUP0606Dao();

		ArrayList<XBRLSUP0606Bean> arl = bsd.xbrlSUP0606details(request.getParameter("reptype"),
				request.getParameter("ReporefSeq"), request.getParameter("instno"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),
				request.getParameter("curr"));
		// summarystandard = arl.toArray(new String[arl.size()]);

		Gson gson = new Gson();
		dtlSUP0606 = gson.toJson(arl);

		return "success";

	}

	public String modXbSUPCreate606() throws SQLException {

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

		/*// String passexpdate=df.formatdate(xb.getAccopendate());
		log.info("===" + request.getParameter("ReportSeq"));

		if (request.getParameter("ReportSeq").startsWith("R")) {

			log.info("else notttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt ");
			ReporefSeq = request.getParameter("ReportSeq");
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
*/		session.setAttribute("ReprefSeq", ReporefSeq);

		int rs = 0;

		int count = 0;

		StringBuffer sql = new StringBuffer();

		// HttpSession session = request.getSession();
		log.info("insert Action modXbCreateSUP0600");

		

		// for Inserting new record

		// for new Reference id
		/*if (newFlg.equals('Y'))

		{

			sql.append(
					"INSERT INTO SUP0010_MOD_TABLE(REPORT_REF_NO,ACCT_NUMBER,ACCT_NAME,CUST_ID,SCHM_CODE,SCHM_TYPE,ACCT_OPN_DATE,INT_RATE,ACCT_BALANCE_AMT_AC,ACCT_CRNCY_CODE,ISIC_CODE,NATURE_OF_CUST,NRE_FLG,COUNTRY,BOM_GROUP_IDENTIFIER,CUST_UNIQUE_IDENTIFIER,LOAN_AMOUNT,SPEC_PROV,BAD_DR_WR_OFF,DPD_CNTR,IMPAIRED_FLG,SEC_AMOUNT,PURPOSE_OF_LOAN,SME_FLG,NON_FUND_BASED_FACILITIES,RESHDL_DATE,RESTRUCTURED_FLG,NO_OF_RESTRUCTURE,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
							+ "values('" + ReporefSeq + "','" + request.getParameter("acctNum") + "','"
							+ request.getParameter("acctName") + "','" + request.getParameter("custId") + "','"
							+ request.getParameter("schmCode") + "','" + request.getParameter("schmType") + "','"
							+ df1.formatdate(request.getParameter("acctopenDate")) + "','"
							+ request.getParameter("intRate") + "','" + request.getParameter("acctBalanceamtac") + "','"
							+ request.getParameter("acctCrncyCode") + "','" + request.getParameter("isicCode") + "','"
							+ request.getParameter("natureofCust") + "','" + request.getParameter("nreFlg") + "','"
							+ request.getParameter("country") + "','" + request.getParameter("bomGroupIdentifier")
							+ "','" + request.getParameter("custUniqueIdentifier") + "','"
							+ request.getParameter("loanAmt") + "','" + request.getParameter("specProv") + "','"
							+ request.getParameter("badDrwroff") + "','" + request.getParameter("dprCntr") + "','"
							+ request.getParameter("impairedFlg") + "','" + request.getParameter("secAmt") + "','"
							+ request.getParameter("purposeofLoan") + "','" + request.getParameter("smeFlg") + "','"
							+ request.getParameter("nonFundBasedFacilities") + "','"
							+ df1.formatdate(request.getParameter("schdate")) + "','" + request.getParameter("resflg")
							+ "','" + request.getParameter("noofres") + "','"
							+ df1.formatdate(request.getParameter("reportDate")) + "','"
							+ session.getAttribute("userName") + "',SYSDATE)");
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

			log.info("executeUIUFDJJFGFUDFUDGJd");
			refno = ReporefSeq;

		}

		// for old Reference id
		else {*/

			int rowcount = 0;

			/*
			 * sql.append(
			 * "SELECT COUNT (*) as cnt FROM   (SELECT DISTINCT REPORT_DATE FROM  BLS0106_MOD_TABLE where REPORT_REF_NO='"
			 * + ReporefSeq.trim() + "' and ACCT_NUMBER = '" +
			 * request.getParameter("accno") + "'  and REPORT_DATE >='" +
			 * df1.formatdate(request.getParameter("dt2"))+"')");
			 */
			sql.append(
					"SELECT Count (*) as count FROM   (SELECT DISTINCT REPORT_DATE FROM  SUP0010_MOD_TABLE where ACCT_NUMBER = '" + request.getParameter("acctNum")
							+ "'and ACCT_NAME = '" + request.getParameter("acctName") + "'and REPORT_DATE ='"
							+ df1.formatdate(request.getParameter("reportDate")) + "')");

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

				sql2.append("update  SUP0010_MOD_TABLE set ACCT_NUMBER ='"
						+ NullCheck.isNotNull(request.getParameter("acctNum")) + "',ACCT_NAME ='"
						+ NullCheck.isNotNull(request.getParameter("acctName")) + "',CUST_ID ='"
						+ NullCheck.isNotNull(request.getParameter("custId")) + "',SCHM_CODE ='"
						+ NullCheck.isNotNull(request.getParameter("schmCode")) + "',SCHM_TYPE ='"
						+ NullCheck.isNotNull(request.getParameter("schmType")) + "',ACCT_OPN_DATE ='"
						+ df1.formatdate(request.getParameter("acctopenDate")) + "',INT_RATE ='"
						+ NullCheck.isNotNull(request.getParameter("intRate")) + "',ACCT_BALANCE_AMT_AC ='"
						+ NullCheck.isNotNull(request.getParameter("acctBalanceamtac")) + "',ACCT_CRNCY_CODE ='"
						+ NullCheck.isNotNull(request.getParameter("acctCrncyCode")) + "',ISIC_CODE ='"
						+ NullCheck.isNotNull(request.getParameter("isicCode")) + "',NATURE_OF_CUST ='"
						+ NullCheck.isNotNull(request.getParameter("natureofCust")) + "',NRE_FLG ='"
						+ NullCheck.isNotNull(request.getParameter("nreFlg")) + "',COUNTRY ='"
						+ NullCheck.isNotNull(request.getParameter("country")) + "',BOM_GROUP_IDENTIFIER ='"
						+ NullCheck.isNotNull(request.getParameter("bomGroupIdentifier"))
						+ "',CUST_UNIQUE_IDENTIFIER ='"
						+ NullCheck.isNotNull(request.getParameter("custUniqueIdentifier")) + "',LOAN_AMOUNT ='"
						+ NullCheck.isNotNull(request.getParameter("loanAmt")) + "',SPEC_PROV ='"
						+ NullCheck.isNotNull(request.getParameter("specProv")) + "',BAD_DR_WR_OFF ='"
						+ NullCheck.isNotNull(request.getParameter("badDrwroff")) + "',DPD_CNTR ='"
						+ NullCheck.isNotNull(request.getParameter("dprCntr")) + "',IMPAIRED_FLG ='"
						+ NullCheck.isNotNull(request.getParameter("impairedFlg")) + "',SEC_AMOUNT ='"
						+ NullCheck.isNotNull(request.getParameter("secAmt")) + "',PURPOSE_OF_LOAN ='"
						+ NullCheck.isNotNull(request.getParameter("purposeofLoan")) + "',SME_FLG ='"
						+ NullCheck.isNotNull(request.getParameter("smeFlg")) + "',NON_FUND_BASED_FACILITIES ='"
						+ NullCheck.isNotNull(request.getParameter("nonFundBasedFacilities")) + "',RESHDL_DATE ='"
						+ df1.formatdate(request.getParameter("schdate")) + "',RESTRUCTURED_FLG ='"
						+ NullCheck.isNotNull(request.getParameter("resflg")) + "',NO_OF_RESTRUCTURE ='"
						+ NullCheck.isNotNull(request.getParameter("noofres")) + "',REPORT_DATE ='"

						+ df1.formatdate(request.getParameter("reportDate")) + "' ,DEL_FLG='M'" + " where ACCT_NUMBER ='"
						+ NullCheck.isNotNull(request.getParameter("acctNum")) + "'and ACCT_NAME ='"
						+ NullCheck.isNotNull(request.getParameter("acctName")) + "' and  CUST_ID ='"
						+ NullCheck.isNotNull(request.getParameter("custId")) + "' and REPORT_DATE ='" + df1.formatdate(request.getParameter("reportDate")) + "'");
				log.info(sql2.toString() + "Gayu");

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
						"INSERT INTO SUP0010_MOD_TABLE(REPORT_REF_NO,ACCT_NUMBER,ACCT_NAME,CUST_ID,SCHM_CODE,SCHM_TYPE,ACCT_OPN_DATE,"
						+ "INT_RATE,ACCT_BALANCE_AMT_AC,ACCT_CRNCY_CODE,ISIC_CODE,NATURE_OF_CUST,NRE_FLG,COUNTRY,BOM_GROUP_IDENTIFIER,"
						+ "CUST_UNIQUE_IDENTIFIER,LOAN_AMOUNT,SPEC_PROV,BAD_DR_WR_OFF,DPD_CNTR,IMPAIRED_FLG,SEC_AMOUNT,PURPOSE_OF_LOAN,SME_FLG,"
						+ "NON_FUND_BASED_FACILITIES,RESHDL_DATE,RESTRUCTURED_FLG,NO_OF_RESTRUCTURE,REPORT_DATE,DEL_FLG,LCHG_USER_ID,LCHG_TIME)"
								+ "values('" + ReporefSeq + "','" + request.getParameter("acctNum") + "','"
								+ request.getParameter("acctName") + "','" + request.getParameter("custId") + "','"
								+ request.getParameter("schmCode") + "','" + request.getParameter("schmType") + "','"
								+ df1.formatdate(request.getParameter("acctopenDate")) + "','"
								+ request.getParameter("intRate") + "','" + request.getParameter("acctBalanceamtac")
								+ "','" + request.getParameter("acctCrncyCode") + "','"
								+ request.getParameter("isicCode") + "','" + request.getParameter("natureofCust")
								+ "','" + request.getParameter("nreFlg") + "','" + request.getParameter("country")
								+ "','" + request.getParameter("bomGroupIdentifier") + "','"
								+ request.getParameter("custUniqueIdentifier") + "','" + request.getParameter("loanAmt")
								+ "','" + request.getParameter("specProv") + "','" + request.getParameter("badDrwroff")
								+ "','" + request.getParameter("dprCntr") + "','" + request.getParameter("impairedFlg")
								+ "','" + request.getParameter("secAmt") + "','" + request.getParameter("purposeofLoan")
								+ "','" + request.getParameter("smeFlg") + "','"
								+ request.getParameter("nonFundBasedFacilities") + "','"
								+ df1.formatdate(request.getParameter("schdate")) + "','"
								+ request.getParameter("resflg") + "','" + request.getParameter("noofres") + "','"
								+ df1.formatdate(request.getParameter("reportDate")) + "','"
								+ request.getParameter("modtyp") + "','"
								+ session.getAttribute("userName") + "',SYSDATE)");
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

		// return "success";
		return status;
	}
	
	public String sup0606verify() {
		log.info("ddddddddddd");
			XBRLSUP0606Dao bsd = new XBRLSUP0606Dao();
			ArrayList<XBRLSUP0606Bean> arr=new ArrayList<XBRLSUP0606Bean>();
			arr=bsd.SUP0606verify();
			Gson gson = new Gson();
			detSUP0606 = gson.toJson(arr);
			return "success";
		}
		public String SUP0606vermaster() {
			String status="";
			XBRLSUP0606Dao bsd = new XBRLSUP0606Dao();
			HttpServletRequest request = ServletActionContext.getRequest();
			status=bsd.SUP0606verifymaster();
			
			if(status.equals("success")) {
				resalert="Verification Successful";
			}else {
				resalert="Technical Issue.Try Again Later.";
			}
			
			return "success";
		}
}
