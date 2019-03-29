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
import bean.XBRLSUP0600Bean;
import dao.XBRLSUP0600Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRLSUP0600Action {
	
	static Logger log = Logger.getLogger(XBRLSUP0600Action.class);
	
	public String sec1SUP0600;
	public String sec2SUP0600;
	public String sec3SUP0600;
	public String sec4SUP0600;
	public String detSUP0600;
	
	public String getDetSUP0600() {
		return detSUP0600;
	}

	public void setDetSUP0600(String detSUP0600) {
		this.detSUP0600 = detSUP0600;
	}

	public String getSec4SUP0600() {
		return sec4SUP0600;
	}

	public void setSec4SUP0600(String sec4sup0600) {
		sec4SUP0600 = sec4sup0600;
	}

	public String getSec3SUP0600() {
		return sec3SUP0600;
	}

	public void setSec3SUP0600(String sec3sup0600) {
		sec3SUP0600 = sec3sup0600;
	}

	public String getSec2SUP0600() {
		return sec2SUP0600;
	}

	public void setSec2SUP0600(String sec2sup0600) {
		sec2SUP0600 = sec2sup0600;
	}

	public String getSec1SUP0600() {
		return sec1SUP0600;
	}

	public void setSec1SUP0600(String sec1sup0600) {
		sec1SUP0600 = sec1sup0600;
	}

	

	public String refno;
	public String getRefno() {
		return refno;
	}

	public void setRefno(String refno) {
		this.refno = refno;
	}

	
	
	public String modXbSUPCreate600() throws SQLException {

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
		session.setAttribute("ReprefSeq", ReporefSeq);

		int rs = 0;

		int count = 0;

		StringBuffer sql = new StringBuffer();

		// HttpSession session = request.getSession();
		log.info("insert Action modXbCreateSUP0600");

		log.info("NEW FLG:" + newFlg);

		// for Inserting new record

		// for new Reference id
		if (newFlg.equals('Y'))

		{
			
			sql.append(
					"INSERT INTO SUP0010_MOD_TABLE(REPORT_REF_NO,ACCT_NUMBER,ACCT_NAME,CUST_ID,SCHM_CODE,SCHM_TYPE,ACCT_OPN_DATE,INT_RATE,ACCT_BALANCE_AMT_AC,ACCT_CRNCY_CODE,ISIC_CODE,NATURE_OF_CUST,NRE_FLG,COUNTRY,BOM_GROUP_IDENTIFIER,CUST_UNIQUE_IDENTIFIER,LOAN_AMOUNT,SPEC_PROV,BAD_DR_WR_OFF,DPD_CNTR,IMPAIRED_FLG,SEC_AMOUNT,PURPOSE_OF_LOAN,SME_FLG,NON_FUND_BASED_FACILITIES,RESHDL_DATE,RESTRUCTURED_FLG,NO_OF_RESTRUCTURE,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
							+ "values('" + ReporefSeq + "','" + request.getParameter("acctNum")
							+ "','" + request.getParameter("acctName") + "','"
							+ request.getParameter("custId") + "','" 
							+ request.getParameter("schmCode") + "','"
							+ request.getParameter("schmType") + "','" 
							+ df1.formatdate(request.getParameter("acctopenDate")) + "','"
							+ request.getParameter("intRate") + "','" 
							+request.getParameter("acctBalanceamtac") + "','"
							+ request.getParameter("acctCrncyCode") + "','"
							+ request.getParameter("isicCode") + "','" 
							+ request.getParameter("natureofCust") + "','"
							+ request.getParameter("nreFlg") + "','" 
							+ request.getParameter("country") + "','"
							+request.getParameter("bomGroupIdentifier") + "','" 
							+ request.getParameter("custUniqueIdentifier") + "','" 
							+ request.getParameter("loanAmt") + "','" 
							+ request.getParameter("specProv") + "','" 
							+ request.getParameter("badDrwroff") + "','" 
							+ request.getParameter("dprCntr") + "','" 
							+ request.getParameter("impairedFlg") + "','"  
							+ request.getParameter("secAmt") + "','" 
									+ request.getParameter("purposeofLoan") + "','" 
											+ request.getParameter("smeFlg") + "','" 
													+ request.getParameter("nonFundBasedFacilities") + "','" 
															+ df1.formatdate(request.getParameter("schdate")) + "','" 
																	+ request.getParameter("resflg") + "','" 
																			+ request.getParameter("noofres") + "','" 
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

			log.info("executeUIUFDJJFGFUDFUDGJd");
			refno = ReporefSeq;

		}

		// for old Reference id
		else {

			int rowcount = 0;
			
			
			/*sql.append(
					"SELECT COUNT (*) as cnt FROM   (SELECT DISTINCT REPORT_DATE FROM  BLS0106_MOD_TABLE where REPORT_REF_NO='"
							+ ReporefSeq.trim() + "' and ACCT_NUMBER = '" + request.getParameter("accno")
							+ "'  and REPORT_DATE >='" + df1.formatdate(request.getParameter("dt2"))+"')");*/
			sql.append(
					"SELECT Count (*) as count FROM   (SELECT DISTINCT REPORT_DATE FROM  SUP0010_MOD_TABLE where REPORT_REF_NO='"
							+ ReporefSeq.trim() + "'and ACCT_NUMBER = '"
							+ request.getParameter("acctNum") + "'and ACCT_NAME = '"+ request.getParameter("acctName") + "'and REPORT_DATE ='" + df1.formatdate(request.getParameter("reportDate"))+"')");

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
				
			
				sql2.append("update  SUP0010_MOD_TABLE set REPORT_REF_NO ='" + ReporefSeq + "',ACCT_NUMBER ='"
						+ NullCheck.isNotNull(request.getParameter("acctNum")) + "',ACCT_NAME ='" +NullCheck.isNotNull( request.getParameter("acctName"))
						+ "',CUST_ID ='" + NullCheck.isNotNull(request.getParameter("custId")) + "',SCHM_CODE ='"
						+ NullCheck.isNotNull(request.getParameter("schmCode")) + "',SCHM_TYPE ='"+ NullCheck.isNotNull(request.getParameter("schmType"))
						+ "',ACCT_OPN_DATE ='" +df1.formatdate(request.getParameter("acctopenDate"))
						+ "',INT_RATE ='"
						+ NullCheck.isNotNull(request.getParameter("intRate") )+ "',ACCT_BALANCE_AMT_AC ='" +NullCheck.isNotNull( request.getParameter("acctBalanceamtac"))
						+ "',ACCT_CRNCY_CODE ='" +NullCheck.isNotNull( request.getParameter("acctCrncyCode")) + "',ISIC_CODE ='"
						+ NullCheck.isNotNull(request.getParameter("isicCode")) + "',NATURE_OF_CUST ='"+NullCheck.isNotNull( request.getParameter("natureofCust"))
						+ "',NRE_FLG ='" +NullCheck.isNotNull(request.getParameter("nreFlg"))
						+ "',COUNTRY ='"
						+ NullCheck.isNotNull(request.getParameter("country") )+ "',BOM_GROUP_IDENTIFIER ='" +NullCheck.isNotNull(request.getParameter("bomGroupIdentifier"))
						+ "',CUST_UNIQUE_IDENTIFIER ='" + NullCheck.isNotNull(request.getParameter("custUniqueIdentifier")) + "',LOAN_AMOUNT ='" + NullCheck.isNotNull(request.getParameter("loanAmt") )+ "',SPEC_PROV ='"
												 + NullCheck.isNotNull(request.getParameter("specProv")) + "',BAD_DR_WR_OFF ='" +NullCheck.isNotNull( request.getParameter("badDrwroff")) + "',DPD_CNTR ='" + NullCheck.isNotNull(request.getParameter("dprCntr")) + "',IMPAIRED_FLG ='"+ NullCheck.isNotNull(request.getParameter("impairedFlg"))
												 	+ "',SEC_AMOUNT ='"+ NullCheck.isNotNull(request.getParameter("secAmt"))
												 	+ "',PURPOSE_OF_LOAN ='"+NullCheck.isNotNull( request.getParameter("purposeofLoan"))
												 	+ "',SME_FLG ='"+NullCheck.isNotNull( request.getParameter("smeFlg"))
												 	+ "',NON_FUND_BASED_FACILITIES ='"+ NullCheck.isNotNull(request.getParameter("nonFundBasedFacilities"))
												 	+ "',RESHDL_DATE ='"+ df1.formatdate(request.getParameter("schdate"))
												 	+ "',RESTRUCTURED_FLG ='"+ NullCheck.isNotNull(request.getParameter("resflg"))
												 	+ "',NO_OF_RESTRUCTURE ='"+ NullCheck.isNotNull(request.getParameter("noofres"))
										+ "',REPORT_DATE ='"
			
						+ df1.formatdate(request.getParameter("reportDate")) 
						+ "'"+ " where ACCT_NUMBER ='" + NullCheck.isNotNull(request.getParameter("acctNum")) +"'and ACCT_NAME ='" + NullCheck.isNotNull(request.getParameter("acctName")) +"' and  CUST_ID ='" + NullCheck.isNotNull(request.getParameter("custId")) +"'and  REPORT_REF_NO ='" + ReporefSeq + "'and REPORT_DATE ='" + df1.formatdate(request.getParameter("reportDate"))+"'");
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
						"INSERT INTO SUP0010_MOD_TABLE(REPORT_REF_NO,ACCT_NUMBER,ACCT_NAME,CUST_ID,SCHM_CODE,SCHM_TYPE,ACCT_OPN_DATE,INT_RATE,ACCT_BALANCE_AMT_AC,ACCT_CRNCY_CODE,ISIC_CODE,NATURE_OF_CUST,NRE_FLG,COUNTRY,BOM_GROUP_IDENTIFIER,CUST_UNIQUE_IDENTIFIER,LOAN_AMOUNT,SPEC_PROV,BAD_DR_WR_OFF,DPD_CNTR,IMPAIRED_FLG,SEC_AMOUNT,PURPOSE_OF_LOAN,SME_FLG,NON_FUND_BASED_FACILITIES,RESHDL_DATE,RESTRUCTURED_FLG,NO_OF_RESTRUCTURE,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
								+ "values('" + ReporefSeq + "','" + request.getParameter("acctNum")
								+ "','" + request.getParameter("acctName") + "','"
								+ request.getParameter("custId") + "','" 
								+ request.getParameter("schmCode") + "','"
								+ request.getParameter("schmType") + "','" 
								+ df1.formatdate(request.getParameter("acctopenDate")) + "','"
								+ request.getParameter("intRate") + "','" 
								+request.getParameter("acctBalanceamtac") + "','"
								+ request.getParameter("acctCrncyCode") + "','"
								+ request.getParameter("isicCode") + "','" 
								+ request.getParameter("natureofCust") + "','"
								+ request.getParameter("nreFlg") + "','" 
								+ request.getParameter("country") + "','"
								+request.getParameter("bomGroupIdentifier") + "','" 
								+ request.getParameter("custUniqueIdentifier") + "','" 
								+ request.getParameter("loanAmt") + "','" 
								+ request.getParameter("specProv") + "','" 
								+ request.getParameter("badDrwroff") + "','" 
								+ request.getParameter("dprCntr") + "','" 
								+ request.getParameter("impairedFlg") + "','"  
								+ request.getParameter("secAmt") + "','" 
										+ request.getParameter("purposeofLoan") + "','" 
												+ request.getParameter("smeFlg") + "','" 
														+ request.getParameter("nonFundBasedFacilities") + "','" 
																+ df1.formatdate(request.getParameter("schdate")) + "','" 
																		+ request.getParameter("resflg") + "','" 
																				+ request.getParameter("noofres") + "','" 
								+df1.formatdate(request.getParameter("reportDate"))+ "','" + session.getAttribute("userName")
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

				log.info("execuDFFFFFFFFFFFFFFFFFFFted");
				refno = ReporefSeq;

				// String stat = bop0300add(ReporefSeq);

				refno = ReporefSeq;
			}

		}

		return "success";

	}
	
	
	public String section1SUP0600() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside sup0600 action");
		
		XBRLSUP0600Dao bsd = new XBRLSUP0600Dao();

		ArrayList<XBRLSUP0600Bean> arl = bsd.xbrlsup0600s1(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1SUP0600 = gson.toJson(arl);

		return "success";

	}

	public String section2SUP0600() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside sup0600 action");
		
		XBRLSUP0600Dao bsd = new XBRLSUP0600Dao();

		ArrayList<XBRLSUP0600Bean> arl = bsd.xbrlsup0600s2(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec2SUP0600 = gson.toJson(arl);

		return "success";

	}
	
	public String section3SUP0600() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside sup0600 action");
		
		XBRLSUP0600Dao bsd = new XBRLSUP0600Dao();

		ArrayList<XBRLSUP0600Bean> arl = bsd.xbrlsup0600s3(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec3SUP0600 = gson.toJson(arl);

		return "success";

	}
	
	public String section4SUP0600() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside sup0600 action");
		
		XBRLSUP0600Dao bsd = new XBRLSUP0600Dao();

		ArrayList<XBRLSUP0600Bean> arl = bsd.xbrlsup0600s4(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec4SUP0600 = gson.toJson(arl);

		return "success";

	}
	
	public String detailsSUP0600() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside sup0600det action");
		
		XBRLSUP0600Dao bsd = new XBRLSUP0600Dao();

		ArrayList<XBRLSUP0600Bean> arl = bsd.xbrlsup0600details(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		detSUP0600 = gson.toJson(arl);

		return "success";

	}

}
