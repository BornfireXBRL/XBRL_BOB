
package dao;

/****************************************************************************************************************
*																												*
* 	* @companyName 			:	Bonfire Innovation Private Limited Chennai										*
* 	* @project 				:	Extensible Business Reporting Language (XBRL)									*
* 	* @name 				:	XBRLPSC0300Dao.java															*
* 	* @path 				:	action																			*
* 	* @author 				:	D PraveenBabu																	*
* 	* @version 				: 	1.0																				*
* 	* @functionality 		:	It contains the action with multiple methods to create SUP01400 Report.													*
* 	* @relatedScripts 		: 	bean.XBRLSUP1400Bean.java,dao.XBRLSUP1400Dao.java 								*
* 	* @creationDate 		:																					*
* 	* @lastModifiedDate 	:	20-02-2019																				*
* 	* @modificationHistory 	: 	Verification Changes																				*
*																												*
****************************************************************************************************************/

import java.sql.CallableStatement;
import org.apache.log4j.Logger;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import basecode.DateFormat;
import bean.XBRLPSC0300Bean;
import bean.XBRLPSC0300Bean;
import bean.XBRLPSC0300Bean;
import bean.XBRLPYM0100Bean;
import bean.XBRLReportMasterBean;
import utilities.ConnectionManager;
import utilities.NullCheck;

public class XBRLPSC0300Dao {

	static Logger log = Logger.getLogger(XBRLPSC0300Dao.class);
	public String resalert;

	public String cnt;

	public int cnt1;

	public int getCnt1() {
		return cnt1;
	}

	public void setCnt1(int cnt1) {
		this.cnt1 = cnt1;
	}

	public String getResalert() {
		return resalert;
	}

	public void setResalert(String resalert) {
		this.resalert = resalert;
	}

	public String getCnt() {
		return cnt;
	}

	public void setCnt(String cnt) {
		this.cnt = cnt;
	}

	public String Reporef;

	public String getReporef() {
		return Reporef;
	}

	public void setReporef(String reporef) {
		Reporef = reporef;
	}

	public ArrayList<XBRLPSC0300Dao> ReporefSeq(String dt1, String dt2) {

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		String status = "";

		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();
		DateFormat df = new DateFormat();
		dt1 = df.formatdate(dt1);
		dt2 = df.formatdate(dt2);

		ArrayList<XBRLPSC0300Dao> arl = new ArrayList<XBRLPSC0300Dao>();
		sql.append(
				"select REPORT_REF_NO from PSC0300_MOD_TABLE where REPORT_DATE='" + dt2 + "' ORDER BY REPORT_REF_NO");

		log.info("SELECTPROFILE" + sql.toString());

		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLPSC0300Dao xel = new XBRLPSC0300Dao();
				xel.setReporef(NullCheck.isNotNull(rs.getString("REPORT_REF_NO")));

				arl.add(xel);
			}
		} catch (SQLException e) {

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
		return arl;
	}

	public ArrayList<XBRLPYM0100Bean> xbrlpym400(String dt1, String dt2, String curr) {

		log.info("FIM0100 List Data AB " + dt1 + "dt22222" + dt2);

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		ArrayList<XBRLPYM0100Bean> arl = new ArrayList<XBRLPYM0100Bean>();

		String status = "";

		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();

		PreparedStatement ps = null;

		StringBuffer sql = new StringBuffer();

		DateFormat df = new DateFormat();
		dt1 = df.formatdate(dt1);
		dt2 = df.formatdate(dt2);

		try {

			// sql.append("SELECT
			// DYNAMIC_DOMAIN,to_char(REP_DATE,'DD-MM-YYYY')REP_DATE,INSTITUTE_ID,TRAN_ID,INSTITUTE_NAME,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,SECTOR,SPOT_RATE,FWD_RATE,to_char(DUE_DATE,'DD-MM-YYYY')DUE_DATE,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME
			// FROM FIM0400_MAST_TABLE Where REP_DATE >='"+dt1+"' and REP_DATE <= '"+dt2+"'
			// ORDER BY cast(TRAN_ID as int) ASC ");

			// sql.append("SELECT
			// MODES,CHQ_ALPHA,CHQ_NUMBER,ACCT_NUMBER,ACCT_NAME,to_char(TRAN_DATE,'DD-MM-YYYY')TRAN_DATE,to_char(VALUE_DATE,'DD-MM-YYYY')VALUE_DATE,CHQ_AMOUNT,CRNCY,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME
			// FROM PYM0100_MAST_TABLE Where TRAN_DATE >='"+dt1+"' and TRAN_DATE <=
			// '"+dt2+"' ORDER BY TRAN_DATE ASC ");

			sql.append(
					"SELECT /* +FIRST_ROWS(100) */ MODES,CHQ_NUMBER,ACCT_NUMBER,ACCT_NAME,to_char(TRAN_DATE,'DD-MM-YYYY')TRAN_DATE,CHQ_AMOUNT,CRNCY,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME FROM TABLE(PYM0100_DTL_FUN('PYM0100','0','0','"
							+ dt2 + "','" + dt1 + "','" + dt2 + "','" + curr + "'))");

			log.info("Normal Vinoth PYM" + sql.toString());

			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				// log.info("whileee");
				XBRLPYM0100Bean xb = new XBRLPYM0100Bean();

				xb.setModes(NullCheck.isNotNull(rs.getString("MODES")));
				/* xb.setChequeAlpha(NullCheck.isNotNull(rs.getString("CHQ_ALPHA"))); */
				xb.setChequeNumber(NullCheck.isNotNull(rs.getString("CHQ_NUMBER")));
				xb.setAccountNumber(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
				xb.setAccountName(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
				xb.setTransactionDate(NullCheck.isNotNull(rs.getString("TRAN_DATE")));
				/* xb.setValueDate(NullCheck.isNotNull(rs.getString("VALUE_DATE"))); */
				xb.setChequeAmount(NullCheck.isNotNull(rs.getString("CHQ_AMOUNT")));
				xb.setCurrency(NullCheck.isNotNull(rs.getString("CRNCY")));

				xb.setDelflg(NullCheck.isNotNull(rs.getString("DEL_FLG")));
				xb.setRcrusrid(NullCheck.isNotNull(rs.getString("RCRE_USER_ID")));
				xb.setRcrtime(NullCheck.isNotNull(rs.getString("RCRE_TIME")));
				xb.setLchgusrid(NullCheck.isNotNull(rs.getString("LCHG_USER_ID")));
				xb.setLchgtime(NullCheck.isNotNull(rs.getString("LCHG_TIME")));

				arl.add(xb);
			}

			log.info("ARLLL" + arl.size());

		} catch (SQLException e) {

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
		return arl;
	}

	public ArrayList<XBRLPYM0100Bean> xbrlpym4RR(String dt1, String dt2, String ReporefSeq, String instno,
			String curr) {

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		ArrayList<XBRLPYM0100Bean> arl = new ArrayList<XBRLPYM0100Bean>();

		String status = "";

		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();

		PreparedStatement ps = null;

		StringBuffer sql = new StringBuffer();

		DateFormat df = new DateFormat();

		dt1 = df.formatdate(dt1);
		dt2 = df.formatdate(dt2);

		try {

			/*
			 * sql.
			 * append("SELECT MODES,CHQ_ALPHA,CHQ_NUMBER,ACCT_NUMBER,ACCT_NAME,to_char(TRAN_DATE,'DD-MM-YYYY')TRAN_DATE,to_char(VALUE_DATE,'DD-MM-YYYY')VALUE_DATE,CHQ_AMOUNT,CRNCY,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME    FROM   PYM0100_MAST_TABLE where TRAN_DATE >='"
			 * +dt1+"' and TRAN_DATE <= '"
			 * +dt2+"'  and CHQ_NUMBER not in (Select CHQ_NUMBER from PYM0100_MOD_TABLE where REPORT_REF_NO='"
			 * +ReporefSeq+"')	UNION all	SELECT MODES,CHQ_ALPHA,CHQ_NUMBER,ACCT_NUMBER,ACCT_NAME,to_char(TRAN_DATE,'DD-MM-YYYY')TRAN_DATE,to_char(VALUE_DATE,'DD-MM-YYYY')VALUE_DATE,CHQ_AMOUNT,CRNCY,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME    FROM   PYM0100_MOD_TABLE Where   REPORT_REF_NO ='"
			 * +ReporefSeq+"' ") ;
			 */

			sql.append(
					"SELECT /* +FIRST_ROWS(100) */ MODES,CHQ_NUMBER,ACCT_NUMBER,ACCT_NAME,to_char(TRAN_DATE,'DD-MM-YYYY')TRAN_DATE,CHQ_AMOUNT,CRNCY,DEL_FLG,RCRE_USER_ID,RCRE_TIME,LCHG_USER_ID,LCHG_TIME FROM TABLE(PYM0100_DTL_FUN('PYM0100','"
							+ ReporefSeq + "','" + instno + "','" + dt2 + "','" + dt1 + "','" + dt2 + "','" + curr
							+ "'))");

			log.info("DOC&&&&SELECT" + sql.toString());
			try {
				ps = conn.prepareStatement(sql.toString());

				ResultSet rs = ps.executeQuery();

				while (rs.next()) {

					XBRLPYM0100Bean xb = new XBRLPYM0100Bean();

					xb.setModes(NullCheck.isNotNull(rs.getString("MODES")));
					/*
					 * log.info("rs.getString======"+rs.getString("CHQ_ALPHA"));
					 * 
					 * 
					 * 
					 * xb.setChequeAlpha(NullCheck.isNotNull(rs.getString("CHQ_ALPHA")));
					 * 
					 * log.info("XBBB"+xb.getChequeAlpha()); if(xb.getChequeAlpha().equals("null")){
					 * xb.setChequeAlpha("");
					 * 
					 * }
					 */

					xb.setChequeNumber(NullCheck.isNotNull(rs.getString("CHQ_NUMBER")));
					xb.setAccountNumber(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
					xb.setAccountName(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
					xb.setTransactionDate(NullCheck.isNotNull(rs.getString("TRAN_DATE")));
					/* xb.setValueDate(NullCheck.isNotNull(rs.getString("VALUE_DATE"))); */
					xb.setChequeAmount(NullCheck.isNotNull(rs.getString("CHQ_AMOUNT")));
					xb.setCurrency(NullCheck.isNotNull(rs.getString("CRNCY")));
					xb.setDelflg(NullCheck.isNotNull(rs.getString("DEL_FLG")));
					xb.setRcrusrid(NullCheck.isNotNull(rs.getString("RCRE_USER_ID")));
					xb.setRcrtime(NullCheck.isNotNull(rs.getString("RCRE_TIME")));
					xb.setLchgusrid(NullCheck.isNotNull(rs.getString("LCHG_USER_ID")));
					xb.setLchgtime(NullCheck.isNotNull(rs.getString("LCHG_TIME")));

					arl.add(xb);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

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
		return arl;
	}

	public ArrayList<XBRLPYM0100Bean> xbrlpymSum() {

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		ArrayList<XBRLPYM0100Bean> arl = new ArrayList<XBRLPYM0100Bean>();

		String status = "";

		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();

		PreparedStatement ps = null;

		StringBuffer sql = new StringBuffer();

		/*
		 * DateFormat df=new DateFormat(); dt1 =df.formatdate(dt1); dt2
		 * =df.formatdate(dt2);
		 */

		try {

			// sql.append("SELECT
			// DYNAMIC_DOMAIN,to_char(REP_DATE,'DD-MM-YYYY')REP_DATE,INSTITUTE_ID,TRAN_ID,INSTITUTE_NAME,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,SECTOR,SPOT_RATE,FWD_RATE,to_char(DUE_DATE,'DD-MM-YYYY')DUE_DATE,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME
			// FROM FIM0400_MAST_TABLE Where REP_DATE >='"+dt1+"' and REP_DATE <= '"+dt2+"'
			// ORDER BY cast(TRAN_ID as int) ASC ");

			// sql.append("SELECT
			// MODES,CHQ_ALPHA,CHQ_NUMBER,ACCT_NUMBER,ACCT_NAME,to_char(TRAN_DATE,'DD-MM-YYYY')TRAN_DATE,to_char(VALUE_DATE,'DD-MM-YYYY')VALUE_DATE,CHQ_AMOUNT,CRNCY,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME
			// FROM PYM0100_MAST_TABLE Where TRAN_DATE >='"+dt1+"' and TRAN_DATE <=
			// '"+dt2+"' ORDER BY TRAN_DATE ASC ");

			sql.append("SELECT COUNT(MODES) as cnt	FROM PYM0100_MAST_TABLE	WHERE MODES='A'");

			log.info("CRRRRRRRRRRRRRR" + sql.toString());

			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				log.info("whileee");
				XBRLPYM0100Bean xb = new XBRLPYM0100Bean();

				status = NullCheck.isNotZero(rs.getString("cnt"));

				arl.add(xb);
			}

			log.info("ARLLL" + arl.size());

		} catch (SQLException e) {

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
		return arl;
	}

	/*********** PDF and EXCEL HEADER FROM XBRL REPORT MASTER ***************//*
																				 * public XBRLReportMasterBean
																				 * xbrlsummarypdf(String ReporefSeq){
																				 * 
																				 * XBRLReportMasterBean xb=new
																				 * XBRLReportMasterBean();
																				 * HttpServletRequest
																				 * request=ServletActionContext.
																				 * getRequest(); ConnectionManager
																				 * conmgr=new ConnectionManager();
																				 * Connection
																				 * conn=conmgr.getConnection();
																				 * PreparedStatement ps=null;
																				 * StringBuffer sql=new StringBuffer();
																				 * 
																				 * sql.
																				 * append("SELECT * FROM XBRL_REPORT_MASTER_TB WHERE REPORT_ID='"
																				 * +ReporefSeq+"'"); try {
																				 * log.info(sql.toString());
																				 * ps=conn.prepareStatement(sql.toString
																				 * ());
																				 * 
																				 * ResultSet rs=ps.executeQuery();
																				 * while(rs.next()) {
																				 * xb.setRprtid(rs.getString("REPORT_ID"
																				 * )); xb.setRptname(rs.getString(
																				 * "REPORT_NAME"));
																				 * xb.setRptfreq(rs.getString(
																				 * "REPORT_FREQUENCY"));
																				 * xb.setTaxver(rs.getString(
																				 * "XBRL_TAXONOMY_VERSION"));
																				 * xb.setInstcode(rs.getString(
																				 * "INSTITUTION_CODE"));
																				 * xb.setInstname(rs.getString(
																				 * "INSTITUTION_NAME"));
																				 * xb.setInstcat(rs.getString(
																				 * "INSTITUTION_CATEGORY"));
																				 * xb.setToolname(rs.getString(
																				 * "TOOL_NAME"));
																				 * xb.setToolver(rs.getString(
																				 * "TOOL_VERSION"));
																				 * 
																				 * } }catch (SQLException e) {
																				 * 
																				 * e.printStackTrace(); } finally {
																				 * 
																				 * if (ps != null) { try { ps.close(); }
																				 * catch (SQLException e) {
																				 * 
																				 * } } if (conn != null) { try {
																				 * conn.close(); } catch (SQLException
																				 * e) {
																				 * 
																				 * } } }
																				 * 
																				 * return xb;
																				 * 
																				 * }
																				 */

	/************* SUM OF PSC0300 ****************/

	public ArrayList<XBRLPSC0300Bean> xbrlpsc0300sumEP(String dt1, String dt2, String ReporefSeq, String curr,
			String reptype) {

		log.info("PYM SUMMARY List Data AB " + dt1 + "dt22222" + dt2);

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		ArrayList<XBRLPSC0300Bean> arl = new ArrayList<XBRLPSC0300Bean>();

		String status = "";

		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();

		PreparedStatement ps = null;

		StringBuffer sql = new StringBuffer();

		DateFormat df = new DateFormat();
		dt1 = df.formatdate(dt1);
		dt2 = df.formatdate(dt2);

		DecimalFormat dfs = new DecimalFormat("##,##.00");
		NullCheck chk = new NullCheck();

		try {

			log.info("Gnana" + ReporefSeq.trim());

			// sql.append("select /* +FIRST_ROWS(100) */
			// INSTANCE_NAME,INSTANCE_CODE,to_char(AMT_PERFORM,
			// '9,999,999,999,990.99')AMT_PERFORM,to_char(AMT_IMPAIRED,
			// '9,999,999,999,990.99')AMT_IMPAIRED,to_char(MON_OD_AMT,
			// '9,999,999,999,990.99')MON_OD_AMT,to_char(MON_FL_AMT,
			// '9,999,999,999,990.99')MON_FL_AMT,to_char(MON_OTH_AMT,
			// '9,999,999,999,990.99')MON_OTH_AMT,to_char(MON_TOT,
			// '9,999,999,999,990.99')MON_TOT,to_char(MON_NFB_AMT,
			// '9,999,999,999,990.99')MON_NFB_AMT,to_char(MON_RESTRUCT_AMT,
			// '9,999,999,999,990.99')MON_RESTRUCT_AMT,to_char(OUT_OD_AMT,
			// '9,999,999,999,990.99')OUT_OD_AMT,to_char(OUT_FL_AMT,
			// '9,999,999,999,990.99')OUT_FL_AMT,to_char(OUT_OTH_AMT,
			// '9,999,999,999,990.99')OUT_OTH_AMT,to_char(OUT_TOT_AMT,
			// '9,999,999,999,990.99')OUT_TOT_AMT,to_char(OUT_NFB_AMT,
			// '9,999,999,999,990.99')OUT_NFB_AMT,to_char(TD_MIN,
			// '9,999,999,999,990.99')TD_MIN,to_char(TD_MAX,
			// '9,999,999,999,990.99')TD_MAX,to_char(OD_MIN,
			// '9,999,999,999,990.99')OD_MIN,to_char(OD_MAX,
			// '9,999,999,999,990.99')OD_MAX,to_char(FL_MIN,
			// '9,999,999,999,990.99')FL_MIN,to_char(FL_MAX,
			// '9,999,999,999,990.99')FL_MAX,to_char(OTH_MIN,
			// '9,999,999,999,990.99')OTH_MIN,to_char(OTH_MAX,
			// '9,999,999,999,990.99')OTH_MAX,to_char(WEIGHT_AVG_TL,
			// '9,999,999,999,990.99')WEIGHT_AVG_TL,to_char(WEIGHT_AVG_OD,
			// '9,999,999,999,990.99')WEIGHT_AVG_OD,to_char(WEIGHT_AVG_FL,
			// '9,999,999,999,990.99')WEIGHT_AVG_FL,to_char(WEIGHT_AVG_OTH,
			// '9,999,999,999,990.99')WEIGHT_AVG_OTH from
			// table(PSC0300_S1_RPT_FUN('PSC0300','"+chk.notZero(ReporefSeq.trim())+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");
			// select * from
			// table(PSC0300_S1_RPT_FUN('PSC0200','0','31-MAR-2014','01-MAR-2014','31-MAR-2014','MUR'));
			sql.append(
					"select /* +FIRST_ROWS(100) */ SL_NO,CUST_NAME,SCHEM_TYPE,UNIQUE_IDENTIFIER,RESIDENT_STATUS,ISIC_CODE,CUST_TYPE,COUNTRY,to_char(LOAN_VALUE_RATIO, '9,999,999,999,990.99')LOAN_VALUE_RATIO,to_char(FB_AMT_APPROVED, '9,999,999,999,990.99')FB_AMT_APPROVED,to_char(FB_AMT_OUTSTANDING, '9,999,999,999,990.99')FB_AMT_OUTSTANDING,to_char(NFB_AMT_APPROVED, '9,999,999,999,990.99')NFB_AMT_APPROVED,to_char(FB_AMT_APPROVED, '9,999,999,999,990.99')FB_AMT_APPROVED,to_char(NFB_AMT_OUTSTANDING, '9,999,999,999,990.99')NFB_AMT_OUTSTANDING,to_char(TOTAL_OUTSTANDING, '9,999,999,999,990.99')TOTAL_OUTSTANDING,to_char(AMT_IN_ARREARS, '9,999,999,999,990.99')AMT_IN_ARREARS,NO_OF_DAYS_ARREARS,to_char(AMT_IMPAIRED, '9,999,999,999,990.99')AMT_IMPAIRED,to_char(AMT_SPECIFIC_PROVISION, '9,999,999,999,990.99')AMT_SPECIFIC_PROVISION,to_char(AMT_RESTRUCTURED, '9,999,999,999,990.99')AMT_RESTRUCTURED,REASON from table(PSC0300_S1_RPT_FUN('PSC0200','"
							+ chk.notZero(ReporefSeq.trim()) + "','" + dt2 + "','" + dt1 + "','" + dt2 + "','" + curr
							+ "'))");

			log.info("PSC SUMMARY " + sql.toString());

			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				XBRLPSC0300Bean xb = new XBRLPSC0300Bean();

				xb.setSlno(NullCheck.isNotNull(rs.getString("SL_NO")));
				xb.setCusname(NullCheck.isNotNull(rs.getString("CUST_NAME")));
				xb.setSchmtp(NullCheck.isNotNull(rs.getString("SCHEM_TYPE")));
				xb.setUqidfr(NullCheck.isNotNull(rs.getString("UNIQUE_IDENTIFIER")));
				xb.setRests(NullCheck.isNotNull(rs.getString("RESIDENT_STATUS")));
				xb.setIsiccode(NullCheck.isNotNull(rs.getString("ISIC_CODE")));
				xb.setCustyp(NullCheck.isNotNull(rs.getString("CUST_TYPE")));
				xb.setCntry(NullCheck.isNotNull(rs.getString("COUNTRY")));
				xb.setLnvalrto(NullCheck.isNotNull(rs.getString("LOAN_VALUE_RATIO")));
				xb.setFbaprvd(NullCheck.isNotNull(rs.getString("FB_AMT_APPROVED")));
				xb.setFboutsndg(NullCheck.isNotNull(rs.getString("FB_AMT_OUTSTANDING")));
				xb.setNfbaprvd(NullCheck.isNotNull(rs.getString("NFB_AMT_APPROVED")));
				xb.setNfboutsndg(NullCheck.isNotNull(rs.getString("NFB_AMT_OUTSTANDING")));
				xb.setTotoutsndg(NullCheck.isNotNull(rs.getString("TOTAL_OUTSTANDING")));
				/// xb.setOtnfbamt(NullCheck.isNotNull(rs.getString("OUT_NFB_AMT")));
				xb.setAmtarr(NullCheck.isNotNull(rs.getString("AMT_IN_ARREARS")));
				xb.setNodarr(NullCheck.isNotNull(rs.getString("NO_OF_DAYS_ARREARS")));
				xb.setAmtimp(NullCheck.isNotNull(rs.getString("AMT_IMPAIRED")));
				xb.setAmtspcprvsn(NullCheck.isNotNull(rs.getString("AMT_SPECIFIC_PROVISION")));
				xb.setAmtres(NullCheck.isNotNull(rs.getString("AMT_RESTRUCTURED")));
				xb.setReason(NullCheck.isNotNull(rs.getString("REASON")));
				/*
				 * xb.setOthmin(NullCheck.isNotNull(rs.getString("OTH_MIN")));
				 * xb.setOthmax(NullCheck.isNotNull(rs.getString("OTH_MAX")));
				 * xb.setWetavgtl(NullCheck.isNotNull(rs.getString("WEIGHT_AVG_TL")));
				 * xb.setWetavgod(NullCheck.isNotNull(rs.getString("WEIGHT_AVG_OD")));
				 * xb.setWetavgfl(NullCheck.isNotNull(rs.getString("WEIGHT_AVG_FL")));
				 * xb.setWetavgoth(NullCheck.isNotNull(rs.getString("WEIGHT_AVG_OTH")));
				 */

				arl.add(xb);

			}

			log.info("ARLLL" + arl.size());

		} catch (SQLException e) {

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
		return arl;
	}

	public ArrayList<XBRLPSC0300Bean> xbrlpsc0300sumEP1(String dt1, String dt2, String ReporefSeq, String curr,
			String reptype) {

		log.info("PYM SUMMARY List Data AB " + dt1 + "dt22222" + dt2);

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		ArrayList<XBRLPSC0300Bean> arl = new ArrayList<XBRLPSC0300Bean>();

		String status = "";

		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();

		PreparedStatement ps = null;

		StringBuffer sql = new StringBuffer();

		DateFormat df = new DateFormat();
		dt1 = df.formatdate(dt1);
		dt2 = df.formatdate(dt2);

		DecimalFormat dfs = new DecimalFormat("##,##.00");
		NullCheck chk = new NullCheck();

		try {

			log.info("Gnana" + ReporefSeq.trim());

			// sql.append("select /* +FIRST_ROWS(100) */
			// INSTANCE_NAME,INSTANCE_CODE,to_char(AMT_PERFORM,
			// '9,999,999,999,990.99')AMT_PERFORM,to_char(AMT_IMPAIRED,
			// '9,999,999,999,990.99')AMT_IMPAIRED,to_char(MON_OD_AMT,
			// '9,999,999,999,990.99')MON_OD_AMT,to_char(MON_FL_AMT,
			// '9,999,999,999,990.99')MON_FL_AMT,to_char(MON_OTH_AMT,
			// '9,999,999,999,990.99')MON_OTH_AMT,to_char(MON_TOT,
			// '9,999,999,999,990.99')MON_TOT,to_char(MON_NFB_AMT,
			// '9,999,999,999,990.99')MON_NFB_AMT,to_char(MON_RESTRUCT_AMT,
			// '9,999,999,999,990.99')MON_RESTRUCT_AMT,to_char(OUT_OD_AMT,
			// '9,999,999,999,990.99')OUT_OD_AMT,to_char(OUT_FL_AMT,
			// '9,999,999,999,990.99')OUT_FL_AMT,to_char(OUT_OTH_AMT,
			// '9,999,999,999,990.99')OUT_OTH_AMT,to_char(OUT_TOT_AMT,
			// '9,999,999,999,990.99')OUT_TOT_AMT,to_char(OUT_NFB_AMT,
			// '9,999,999,999,990.99')OUT_NFB_AMT,to_char(TD_MIN,
			// '9,999,999,999,990.99')TD_MIN,to_char(TD_MAX,
			// '9,999,999,999,990.99')TD_MAX,to_char(OD_MIN,
			// '9,999,999,999,990.99')OD_MIN,to_char(OD_MAX,
			// '9,999,999,999,990.99')OD_MAX,to_char(FL_MIN,
			// '9,999,999,999,990.99')FL_MIN,to_char(FL_MAX,
			// '9,999,999,999,990.99')FL_MAX,to_char(OTH_MIN,
			// '9,999,999,999,990.99')OTH_MIN,to_char(OTH_MAX,
			// '9,999,999,999,990.99')OTH_MAX,to_char(WEIGHT_AVG_TL,
			// '9,999,999,999,990.99')WEIGHT_AVG_TL,to_char(WEIGHT_AVG_OD,
			// '9,999,999,999,990.99')WEIGHT_AVG_OD,to_char(WEIGHT_AVG_FL,
			// '9,999,999,999,990.99')WEIGHT_AVG_FL,to_char(WEIGHT_AVG_OTH,
			// '9,999,999,999,990.99')WEIGHT_AVG_OTH from
			// table(PSC0300_S2_RPT_FUN('PSC0300','"+chk.notZero(ReporefSeq.trim())+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");
			// select * from
			// table(PSC0300_S2_RPT_FUN('PSC0200','0','31-MAR-2014','01-MAR-2014','31-MAR-2014','MUR'));
			sql.append(
					"select /* +FIRST_ROWS(100) */ INSTANCE_NAME,INSTANCE_CODE,RESIDENT_PROMOTER,RESIDENT_BUYER,NON_RESIDENT_PROMOTER,NON_RESIDENT_BUYER from table(PSC0300_S2_RPT_FUN('PSC0200','"
							+ chk.notZero(ReporefSeq.trim()) + "','" + dt2 + "','" + dt1 + "','" + dt2 + "','" + curr
							+ "'))");

			log.info("PYM SUMMARY " + sql.toString());

			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				XBRLPSC0300Bean xb = new XBRLPSC0300Bean();

				xb.setInstname(NullCheck.isNotNull(rs.getString("INSTANCE_NAME")));
				xb.setInscode(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
				xb.setResprmtr(NullCheck.isNotNull(rs.getString("RESIDENT_PROMOTER")));
				xb.setResbyr(NullCheck.isNotNull(rs.getString("RESIDENT_BUYER")));
				xb.setNrsprmtr(NullCheck.isNotNull(rs.getString("NON_RESIDENT_PROMOTER")));
				xb.setNrsbyr(NullCheck.isNotNull(rs.getString("NON_RESIDENT_BUYER")));

				arl.add(xb);

			}

			log.info("ARLLL" + arl.size());

		} catch (SQLException e) {

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
		return arl;
	}

	/************************* Details PSC0300 **********************/

	public ArrayList<XBRLPSC0300Bean> xbrlpsc0300ajaxdetails(String repname, String reprefno, String instno, String dt2,
			String dt1, String curr) {

		log.info("+++++++++++++++==================================++++++++++++++++++++++++");

		log.info("repname    " + repname + "reprefno   " + reprefno + "instno   " + instno + "dt2     " + dt2
				+ "dt1    " + dt1);

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		ArrayList<XBRLPSC0300Bean> arl = new ArrayList<XBRLPSC0300Bean>();
		NullCheck chk = new NullCheck();
		String status = "";

		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();

		PreparedStatement ps = null;

		StringBuffer sql = new StringBuffer();

		DateFormat df = new DateFormat();
		dt1 = df.formatdate(dt1);
		dt2 = df.formatdate(dt2);

		DecimalFormat dfs = new DecimalFormat("##,##.00");

		try {

			log.info("AJAX DETAILS GNANA" + reprefno);

			// select * from
			// table(PSC0300_DTL_FUN('PSC0300','0','0','31-MAR-2014','01-MAR-2014','31-MAR-2014','MUR'));
			sql.append(
					"select /* +FIRST_ROWS(100) */ ACCT_NUMBER,CUST_ID,CUST_NAME,SCHM_TYPE,SCHM_CODE,UNIQUE_IDENTIFIER,NRE_FLG,ISIC_CODE,COUNTRY_CODE,to_char(SANCT_AMT, '9,999,999,999,990.99')SANCT_AMT,to_char(OUTSTANDING_AMT, '9,999,999,999,990.99')OUTSTANDING_AMT,ACCT_CRNCY_CODE,RESTRUCTURED_FLG,to_char(RESTRUCTURED_DATE,'DD-MM-YYYY')RESTRUCTURED_DATE,NFB_LIMIT,to_char(NFB_OUTSTANDING,'9,999,999,999,990.99')NFB_OUTSTANDING,NPA_FLG,SECURED_FLG,to_char(SECURED_AMT, '9,999,999,999,990.99')SECURED_AMT,ARREAR_DAYS,to_char(ARREAR_AMT, '9,999,999,999,990.99')ARREAR_AMT,LOAN_RATIO,to_char(SPECIFIC_PROVISION, '9,999,999,999,990.99')SPECIFIC_PROVISION,NPA_REASON,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE from table(PSC0300_DTL_FUN('PSC0300','"
							+ chk.notZero(reprefno) + "','" + chk.notZero(reprefno) + "','" + dt2 + "','" + dt1 + "','"
							+ dt2 + "','" + curr + "'))");

			log.info("PSC Vinoth Kumar  " + sql.toString());

			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				// log.info("whileee");

				XBRLPSC0300Bean xb = new XBRLPSC0300Bean();
				xb.setAccno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
				xb.setCustid(NullCheck.isNotNull(rs.getString("CUST_ID")));
				xb.setCustname(NullCheck.isNotNull(rs.getString("CUST_NAME")));
				xb.setSystp(NullCheck.isNotNull(rs.getString("SCHM_TYPE")));
				xb.setSyscode(NullCheck.isNotNull(rs.getString("SCHM_CODE")));
				xb.setUqid(NullCheck.isNotNull(rs.getString("UNIQUE_IDENTIFIER")));
				xb.setNrefg(NullCheck.isNotNull(rs.getString("NRE_FLG")));
				xb.setIscode(NullCheck.isNotNull(rs.getString("ISIC_CODE")));

				xb.setCntrycode(NullCheck.isNotNull(rs.getString("COUNTRY_CODE")));
				xb.setSnamt(NullCheck.isNotNull(rs.getString("SANCT_AMT")));
				xb.setOutstdamt(NullCheck.isNotNull(rs.getString("OUTSTANDING_AMT")));
				xb.setAcccurcode(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
				xb.setResfg(NullCheck.isNotNull(rs.getString("RESTRUCTURED_FLG")));
				xb.setResdate(NullCheck.isNotNull(rs.getString("RESTRUCTURED_DATE")));
				xb.setNfblimit(NullCheck.isNotNull(rs.getString("NFB_LIMIT")));
				xb.setNfboutstd(NullCheck.isNotNull(rs.getString("NFB_OUTSTANDING")));
				xb.setNpaflg(NullCheck.isNotNull(rs.getString("NPA_FLG")));
				xb.setSecflg(NullCheck.isNotNull(rs.getString("SECURED_FLG")));
				xb.setSecamt(NullCheck.isNotNull(rs.getString("SECURED_AMT")));

				xb.setArrday(NullCheck.isNotNull(rs.getString("ARREAR_DAYS")));
				xb.setArramt(NullCheck.isNotNull(rs.getString("ARREAR_AMT")));
				xb.setLoanratio(NullCheck.isNotNull(rs.getString("LOAN_RATIO")));

				xb.setSpcprvsn(NullCheck.isNotNull(rs.getString("SPECIFIC_PROVISION")));

				xb.setNpareason(NullCheck.isNotNull(rs.getString("NPA_REASON")));
				xb.setRepdt(NullCheck.isNotNull(rs.getString("REPORT_DATE")));

				arl.add(xb);

			}

			log.info("ARLLL" + arl.size());

		} catch (SQLException e) {

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
		return arl;
	}

	public ArrayList<XBRLPSC0300Bean> xbrlpsc300(String dt1, String dt2, String ReporefSeq, String instno,
			String curr) {

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		ArrayList<XBRLPSC0300Bean> arl = new ArrayList<XBRLPSC0300Bean>();
		NullCheck chk = new NullCheck();

		String status = "";

		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();

		PreparedStatement ps = null;

		StringBuffer sql = new StringBuffer();

		DateFormat df = new DateFormat();

		dt1 = df.formatdate(dt1);
		dt2 = df.formatdate(dt2);

		// sql.append("SELECT * FROM
		// TABLE(PSC0300_DTL_FUN('PSC0300','0','0','31-AUG-2018','01-AUG-2018','31-AUG-2018','MUR'))");

		sql.append(
				"select /* +FIRST_ROWS(100) */ ACCT_NUMBER,CUST_ID,CUST_NAME,SCHM_TYPE,SCHM_CODE,UNIQUE_IDENTIFIER,NRE_FLG,ISIC_CODE,COUNTRY_CODE,to_char(SANCT_AMT, '9,999,999,999,990.99')SANCT_AMT,to_char(OUTSTANDING_AMT, '9,999,999,999,990.99')OUTSTANDING_AMT,ACCT_CRNCY_CODE,RESTRUCTURED_FLG,to_char(RESTRUCTURED_DATE,'DD-MM-YYYY')RESTRUCTURED_DATE,NFB_LIMIT,to_char(NFB_OUTSTANDING,'9,999,999,999,990.99')NFB_OUTSTANDING,NPA_FLG,SECURED_FLG,to_char(SECURED_AMT, '9,999,999,999,990.99')SECURED_AMT,ARREAR_DAYS,to_char(ARREAR_AMT, '9,999,999,999,990.99')ARREAR_AMT,LOAN_RATIO,to_char(SPECIFIC_PROVISION, '9,999,999,999,990.99')SPECIFIC_PROVISION,NPA_REASON,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE from table(PSC0300_DTL_FUN('PSC0300','"
						+ chk.notZero(ReporefSeq) + "','" + chk.notZero(instno) + "','" + dt2 + "','" + dt1 + "','"
						+ dt2 + "','" + curr + "'))");
		log.info("DOC&&&&SELECT Gayu" + sql.toString());

		try {

			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLPSC0300Bean xb = new XBRLPSC0300Bean();
				xb.setAccno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
				xb.setCustid(NullCheck.isNotNull(rs.getString("CUST_ID")));
				xb.setCustname(NullCheck.isNotNull(rs.getString("CUST_NAME")));
				xb.setSystp(NullCheck.isNotNull(rs.getString("SCHM_TYPE")));
				xb.setSyscode(NullCheck.isNotNull(rs.getString("SCHM_CODE")));
				xb.setUqid(NullCheck.isNotNull(rs.getString("UNIQUE_IDENTIFIER")));
				xb.setNrefg(NullCheck.isNotNull(rs.getString("NRE_FLG")));
				xb.setIscode(NullCheck.isNotNull(rs.getString("ISIC_CODE")));

				xb.setCntrycode(NullCheck.isNotNull(rs.getString("COUNTRY_CODE")));
				xb.setSnamt(NullCheck.isNotNull(rs.getString("SANCT_AMT")));
				xb.setOutstdamt(NullCheck.isNotNull(rs.getString("OUTSTANDING_AMT")));
				xb.setAcccurcode(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
				xb.setResfg(NullCheck.isNotNull(rs.getString("RESTRUCTURED_FLG")));
				xb.setResdate(NullCheck.isNotNull(rs.getString("RESTRUCTURED_DATE")));
				xb.setNfblimit(NullCheck.isNotNull(rs.getString("NFB_LIMIT")));
				xb.setNfboutstd(NullCheck.isNotNull(rs.getString("NFB_OUTSTANDING")));
				xb.setNpaflg(NullCheck.isNotNull(rs.getString("NPA_FLG")));
				xb.setSecflg(NullCheck.isNotNull(rs.getString("SECURED_FLG")));
				xb.setSecamt(NullCheck.isNotNull(rs.getString("SECURED_AMT")));

				xb.setArrday(NullCheck.isNotNull(rs.getString("ARREAR_DAYS")));
				xb.setArramt(NullCheck.isNotNull(rs.getString("ARREAR_AMT")));
				xb.setLoanratio(NullCheck.isNotNull(rs.getString("LOAN_RATIO")));

				xb.setSpcprvsn(NullCheck.isNotNull(rs.getString("SPECIFIC_PROVISION")));

				xb.setNpareason(NullCheck.isNotNull(rs.getString("NPA_REASON")));
				xb.setRepdt(NullCheck.isNotNull(rs.getString("REPORT_DATE")));

				arl.add(xb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		finally {

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
		return arl;
	}

	public String detailPSC0300savecheck() {

		ConnectionManager connmgr = new ConnectionManager();
		Connection conn = connmgr.getConnection();
		ArrayList<String> arl = new ArrayList<String>();
		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		StringBuffer sql = new StringBuffer();
		PreparedStatement ps = null;

		sql.append("SELECT COUNT(REPORT_DATE) as repdate FROM PSC0300_S1_RPT_TB where REPORT_ID = '"
				+ request.getParameter("reptype") + "' AND  REPORT_DATE = '"
				+ df.formatdate(request.getParameter("dt2")) + "' ");
		log.info(sql.toString());

		try {
			ps = conn.prepareStatement(sql.toString());
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				cnt1 = rs.getInt("repdate");

			}
			log.info("fdsafdsaf" + cnt1);

		} catch (SQLException e) {

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

		return "success";

	}

	public String detailPSC0300saves() {

		ConnectionManager connmgr = new ConnectionManager();
		Connection conn = connmgr.getConnection();
		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("{call FINAL_REPORT_UPDATE_SP('" + request.getParameter("reptype") + "','"
				+ NullCheck.isNotZero(request.getParameter("refno")) + "','"
				+ df.formatdate(request.getParameter("dt2")) + "','" + df.formatdate(request.getParameter("dt1"))
				+ "','" + df.formatdate(request.getParameter("dt2")) + "','" + request.getParameter("curr") + "')}");

		try {

			CallableStatement pstmt = conn.prepareCall("{call FINAL_REPORT_UPDATE_SP(?,?,?,?,?,?)}");
			pstmt.setString(1, request.getParameter("reptype"));
			pstmt.setString(2, NullCheck.isNotZero(request.getParameter("refno")));
			pstmt.setString(3, df.formatdate(request.getParameter("dt2")));
			pstmt.setString(4, df.formatdate(request.getParameter("dt1")));
			pstmt.setString(5, df.formatdate(request.getParameter("dt2")));
			pstmt.setString(6, request.getParameter("curr"));

			pstmt.executeUpdate();

			pstmt.close();
			conn.close();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {

				}
			}
		}
		return "success";
	}

	public String PSC0300chckmodified() {

		HttpServletRequest request = ServletActionContext.getRequest();
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		HttpSession session = request.getSession();
		StringBuffer sql = new StringBuffer();
		DateFormat df = new DateFormat();
		sql.setLength(0);
		if (request.getParameter("type").equals("chkuser")) {
			sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM PSC0300_MOD_TABLE ");
		} else {
			// sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM PSC0300_MOD_TABLE WHERE
			// REPORT_DATE='"+NullCheck.isNotNull(df.formatdate(request.getParameter("repdate")))+"'");
			sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM PSC0300_MOD_TABLE ");

		}

		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				cnt = NullCheck.isNotZero(rs.getString("CNT"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "success";
	}

	public String modPSC0300cancel() {
		String status = "";
		HttpServletRequest request = ServletActionContext.getRequest();
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();
		DateFormat df = new DateFormat();
		sql.setLength(0);
		sql.append("DELETE FROM PSC0300_MOD_TABLE WHERE REPORT_DATE='"
				+ df.formatdate(NullCheck.isNotNull(request.getParameter("repdt"))) + "' and ACCT_NUMBER='"
				+ NullCheck.isNotNull(request.getParameter("accno")) + "' and CUST_ID='"
				+ NullCheck.isNotNull(request.getParameter("custid")) + "'");

		try {
			log.info(sql.toString());
			ps = conn.prepareStatement(sql.toString());

			int rs = 0;
			rs = ps.executeUpdate();

			status = "success";
		} catch (SQLException e) {
			e.printStackTrace();
			status = "error";
		}

		if (status.equals("success")) {
			resalert = "Cancellation Successful";
		} else {
			resalert = "Technical Issue.Try Again Later.";
		}

		return "success";
	}

	public ArrayList<XBRLPSC0300Bean> PSC0300verify() {

		ArrayList<XBRLPSC0300Bean> arl = new ArrayList<XBRLPSC0300Bean>();

		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();
		DateFormat df = new DateFormat();
		sql.setLength(0);
		sql.append(
				"SELECT /* +FIRST_ROWS(100) */ACCT_NUMBER,CUST_ID,CUST_NAME,SCHM_TYPE,SCHM_CODE,UNIQUE_IDENTIFIER,NRE_FLG,ISIC_CODE,COUNTRY_CODE,SANCT_AMT,OUTSTANDING_AMT,ACCT_CRNCY_CODE,RESTRUCTURED_FLG,to_char(RESTRUCTURED_DATE,'DD-MM-YYYY')RESTRUCTURED_DATE,NFB_LIMIT,NFB_OUTSTANDING,NPA_FLG,SECURED_FLG,SECURED_AMT,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,ARREAR_DAYS,ARREAR_AMT,LOAN_RATIO,NPA_REASON,SPECIFIC_PROVISION,DECODE(DEL_FLG,'A','Added','M','Modified','D','Deleted') as DEL_FLG ,LCHG_USER_ID FROM PSC0300_MOD_TABLE");
		log.info("Gayu" + sql.toString());
		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				XBRLPSC0300Bean xb = new XBRLPSC0300Bean();

				xb.setAccno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
				xb.setCustid(NullCheck.isNotNull(rs.getString("CUST_ID")));
				xb.setCustname(NullCheck.isNotNull(rs.getString("CUST_NAME")));
				xb.setSystp(NullCheck.isNotNull(rs.getString("SCHM_TYPE")));
				xb.setSyscode(NullCheck.isNotNull(rs.getString("SCHM_CODE")));
				xb.setUqid(NullCheck.isNotNull(rs.getString("UNIQUE_IDENTIFIER")));
				xb.setNrefg(NullCheck.isNotNull(rs.getString("NRE_FLG")));
				xb.setIscode(NullCheck.isNotNull(rs.getString("ISIC_CODE")));

				xb.setCntrycode(NullCheck.isNotNull(rs.getString("COUNTRY_CODE")));
				xb.setSnamt(NullCheck.isNotNull(rs.getString("SANCT_AMT")));
				xb.setOutstdamt(NullCheck.isNotNull(rs.getString("OUTSTANDING_AMT")));
				xb.setAcccurcode(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
				xb.setResfg(NullCheck.isNotNull(rs.getString("RESTRUCTURED_FLG")));
				xb.setResdate(NullCheck.isNotNull(rs.getString("RESTRUCTURED_DATE")));
				xb.setNfblimit(NullCheck.isNotNull(rs.getString("NFB_LIMIT")));
				xb.setNfboutstd(NullCheck.isNotNull(rs.getString("NFB_OUTSTANDING")));
				xb.setNpaflg(NullCheck.isNotNull(rs.getString("NPA_FLG")));
				xb.setSecflg(NullCheck.isNotNull(rs.getString("SECURED_FLG")));
				xb.setSecamt(NullCheck.isNotNull(rs.getString("SECURED_AMT")));

				xb.setArrday(NullCheck.isNotNull(rs.getString("ARREAR_DAYS")));
				xb.setArramt(NullCheck.isNotNull(rs.getString("ARREAR_AMT")));
				xb.setLoanratio(NullCheck.isNotNull(rs.getString("LOAN_RATIO")));

				xb.setSpcprvsn(NullCheck.isNotNull(rs.getString("SPECIFIC_PROVISION")));

				xb.setNpareason(NullCheck.isNotNull(rs.getString("NPA_REASON")));
				xb.setRepdt(NullCheck.isNotNull(rs.getString("REPORT_DATE")));

				xb.setModtyp(NullCheck.isNotNull(rs.getString("DEL_FLG")));
				xb.setEntryuser(NullCheck.isNotNull(rs.getString("LCHG_USER_ID")));

				arl.add(xb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		finally {

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
		return arl;
	}

	public String PSC0300verifymaster() {
		String status = "";
		HttpServletRequest request = ServletActionContext.getRequest();
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		HttpSession session = request.getSession();
		StringBuffer sql = new StringBuffer();
		DateFormat df = new DateFormat();

		// ------------------get data from mod table---------------------
		XBRLPSC0300Bean xb = new XBRLPSC0300Bean();

		sql.setLength(0);
		sql.append(
				"SELECT /* +FIRST_ROWS(100) */ACCT_NUMBER,CUST_ID,CUST_NAME,SCHM_TYPE,SCHM_CODE,UNIQUE_IDENTIFIER,NRE_FLG,ISIC_CODE,COUNTRY_CODE,SANCT_AMT,OUTSTANDING_AMT,ACCT_CRNCY_CODE,RESTRUCTURED_FLG,to_char(RESTRUCTURED_DATE,'DD-MM-YYYY')RESTRUCTURED_DATE,NFB_LIMIT,NFB_OUTSTANDING,NPA_FLG,SECURED_FLG,SECURED_AMT,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,ARREAR_DAYS,ARREAR_AMT,LOAN_RATIO,NPA_REASON,SPECIFIC_PROVISION,DEL_FLG,LCHG_USER_ID FROM PSC0300_MOD_TABLE "
						+ "WHERE REPORT_DATE='" + df.formatdate(NullCheck.isNotNull(request.getParameter("repdt")))
						+ "' and ACCT_NUMBER='" + NullCheck.isNotNull(request.getParameter("accno")) + "' and CUST_ID='"
						+ NullCheck.isNotNull(request.getParameter("custid")) + "' ");
		log.info("Gayu" + sql.toString());
		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				xb.setAccno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
				xb.setCustid(NullCheck.isNotNull(rs.getString("CUST_ID")));
				xb.setCustname(NullCheck.isNotNull(rs.getString("CUST_NAME")));
				xb.setSystp(NullCheck.isNotNull(rs.getString("SCHM_TYPE")));
				xb.setSyscode(NullCheck.isNotNull(rs.getString("SCHM_CODE")));
				xb.setUqid(NullCheck.isNotNull(rs.getString("UNIQUE_IDENTIFIER")));
				xb.setNrefg(NullCheck.isNotNull(rs.getString("NRE_FLG")));
				xb.setIscode(NullCheck.isNotNull(rs.getString("ISIC_CODE")));

				xb.setCntrycode(NullCheck.isNotNull(rs.getString("COUNTRY_CODE")));
				xb.setSnamt(NullCheck.isNotNull(rs.getString("SANCT_AMT")));
				xb.setOutstdamt(NullCheck.isNotNull(rs.getString("OUTSTANDING_AMT")));
				xb.setAcccurcode(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
				xb.setResfg(NullCheck.isNotNull(rs.getString("RESTRUCTURED_FLG")));
				xb.setResdate(NullCheck.isNotNull(rs.getString("RESTRUCTURED_DATE")));
				xb.setNfblimit(NullCheck.isNotNull(rs.getString("NFB_LIMIT")));
				xb.setNfboutstd(NullCheck.isNotNull(rs.getString("NFB_OUTSTANDING")));
				xb.setNpaflg(NullCheck.isNotNull(rs.getString("NPA_FLG")));
				xb.setSecflg(NullCheck.isNotNull(rs.getString("SECURED_FLG")));
				xb.setSecamt(NullCheck.isNotNull(rs.getString("SECURED_AMT")));

				xb.setArrday(NullCheck.isNotNull(rs.getString("ARREAR_DAYS")));
				xb.setArramt(NullCheck.isNotNull(rs.getString("ARREAR_AMT")));
				xb.setLoanratio(NullCheck.isNotNull(rs.getString("LOAN_RATIO")));

				xb.setSpcprvsn(NullCheck.isNotNull(rs.getString("SPECIFIC_PROVISION")));

				xb.setNpareason(NullCheck.isNotNull(rs.getString("NPA_REASON")));
				xb.setRepdt(NullCheck.isNotNull(rs.getString("REPORT_DATE")));

				xb.setModtyp(NullCheck.isNotNull(rs.getString("DEL_FLG")));
				xb.setEntryuser(NullCheck.isNotNull(rs.getString("LCHG_USER_ID")));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		finally {

			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {

				}
			}
			/*
			 * if (conn != null) { try { conn.close(); } catch (SQLException e) {
			 * 
			 * } }
			 */
		}

		// ---------------get data from mod table------------------------

		if (xb.getModtyp().equals("A")) {

			// For Added Records

			sql.setLength(0);

			sql.append(
					"INSERT INTO PSC0300_MAST_TABLE(ACCT_NUMBER,CUST_ID,CUST_NAME,SCHM_TYPE,SCHM_CODE,UNIQUE_IDENTIFIER,NRE_FLG,"
							+ "ISIC_CODE,COUNTRY_CODE,SANCT_AMT,OUTSTANDING_AMT,ACCT_CRNCY_CODE,RESTRUCTURED_FLG,RESTRUCTURED_DATE,"
							+ "NFB_LIMIT,NFB_OUTSTANDING,NPA_FLG,SECURED_FLG,SECURED_AMT,ARREAR_DAYS,ARREAR_AMT,LOAN_RATIO,SPECIFIC_PROVISION,"
							+ "NPA_REASON,REPORT_DATE,DEL_FLG,LCHG_USER_ID,LCHG_TIME,VERIFY_USER_ID,VERIFY_TIME)"
							+ "values('" + request.getParameter("accno") + "','" + request.getParameter("custid")
							+ "','" + request.getParameter("custname") + "','" + request.getParameter("systp") + "','"
							+ request.getParameter("syscode") + "','" + request.getParameter("uqid") + "','"
							+ request.getParameter("nrefg") + "','" + request.getParameter("iscode") + "','"

							+ request.getParameter("cntrycode") + "','" + request.getParameter("snamt") + "','"
							+ request.getParameter("outstdamt") + "','" + request.getParameter("acccurcode") + "','"
							+ request.getParameter("resfg") + "','" + df.formatdate(request.getParameter("resdate"))
							+ "','" + request.getParameter("nfblimit") + "','" + request.getParameter("nfboutstd")
							+ "','" + request.getParameter("npaflg") + "','" + request.getParameter("secflg") + "','"
							+ request.getParameter("secamt") + "','" + request.getParameter("arrday") + "','"
							+ request.getParameter("arramt") + "','"

							+ request.getParameter("loanratio") + "','" + request.getParameter("spcprvsn") + "','"
							+ request.getParameter("npareason") + "','" + df.formatdate(request.getParameter("repdt"))
							+ "','" + xb.getModtyp() + "','" + session.getAttribute("userName") + "',SYSDATE,'"
							+ session.getAttribute("userName") + "',SYSDATE)");
			try {
				log.info(sql.toString());
				ps = conn.prepareStatement(sql.toString());

				int rs = 0;
				rs = ps.executeUpdate();

				status = "success";

				sql.setLength(0);
				sql.append("DELETE FROM PSC0300_MOD_TABLE WHERE REPORT_DATE='"
						+ df.formatdate(NullCheck.isNotNull(request.getParameter("repdt"))) + "' and ACCT_NUMBER='"
						+ NullCheck.isNotNull(request.getParameter("accno")) + "' and CUST_ID='"
						+ NullCheck.isNotNull(request.getParameter("custid")) + "'");
				try {
					log.info(sql.toString());
					ps = conn.prepareStatement(sql.toString());

					int rs1 = 0;
					rs1 = ps.executeUpdate();

					status = "success";
				} catch (SQLException e) {
					e.printStackTrace();
					status = "error";
				}

			} catch (SQLException e) {
				e.printStackTrace();
				status = "error";
			}

		} else if (xb.getModtyp().equals("M")) {

			// For Modified Records

			sql.setLength(0);

			sql.append("update  PSC0300_MAST_TABLE set ACCT_NUMBER ='" + request.getParameter("accno") + "',CUST_ID ='"
					+ request.getParameter("custid") + "',CUST_NAME ='" + request.getParameter("custname")
					+ "',SCHM_TYPE ='" + request.getParameter("systp") + "',SCHM_CODE ='"
					+ request.getParameter("syscode") + "',UNIQUE_IDENTIFIER ='" + request.getParameter("uqid")
					+ "',NRE_FLG ='" + request.getParameter("nrefg") + "',ISIC_CODE ='" + request.getParameter("iscode")
					+ "',COUNTRY_CODE ='" + request.getParameter("cntrycode") + "',SANCT_AMT ='"
					+ request.getParameter("snamt") + "',OUTSTANDING_AMT ='" + request.getParameter("outstdamt")
					+ "',ACCT_CRNCY_CODE ='" + request.getParameter("acccurcode") + "',RESTRUCTURED_FLG ='"
					+ request.getParameter("resfg") + "',RESTRUCTURED_DATE ='"
					+ df.formatdate(request.getParameter("resdate")) + "',NFB_LIMIT ='"
					+ request.getParameter("nfblimit") + "',NFB_OUTSTANDING ='" + request.getParameter("nfboutstd")
					+ "',NPA_FLG ='" + request.getParameter("npaflg") + "',SECURED_FLG ='"
					+ request.getParameter("secflg") + "',SECURED_AMT ='" + request.getParameter("secamt")
					+ "',ARREAR_DAYS ='" + request.getParameter("arrday") + "',ARREAR_AMT ='"
					+ request.getParameter("arramt") + "',LOAN_RATIO ='" + request.getParameter("loanratio")
					+ "',SPECIFIC_PROVISION ='" + request.getParameter("spcprvsn") + "',NPA_REASON ='"
					+ request.getParameter("npareason") + "',REPORT_DATE ='"
					+ df.formatdate(request.getParameter("repdt")) + "' ,VERIFY_USER_ID='"
					+ session.getAttribute("userName") + "',VERIFY_TIME=SYSDATE  " + " where ACCT_NUMBER ='"
					+ request.getParameter("accno") + "' and  CUST_ID = '" + request.getParameter("custid")
					+ "'and REPORT_DATE ='" + df.formatdate(request.getParameter("repdt")) + "'");
			try {
				log.info(sql.toString());
				ps = conn.prepareStatement(sql.toString());

				int rs = 0;
				rs = ps.executeUpdate();

				status = "success";

				sql.setLength(0);
				sql.append("DELETE FROM PSC0300_MOD_TABLE WHERE REPORT_DATE='"
						+ df.formatdate(NullCheck.isNotNull(request.getParameter("repdt"))) + "' and ACCT_NUMBER='"
						+ NullCheck.isNotNull(request.getParameter("accno")) + "' and CUST_ID='"
						+ NullCheck.isNotNull(request.getParameter("custid")) + "'");
				try {
					log.info(sql.toString());
					ps = conn.prepareStatement(sql.toString());

					int rs1 = 0;
					rs1 = ps.executeUpdate();

					status = "success";
				} catch (SQLException e) {
					e.printStackTrace();
					status = "error";
				}

			} catch (SQLException e) {
				e.printStackTrace();
				status = "error";
			}

		} else if (xb.getModtyp().equals("D")) {

			// For Deleted Records

			sql.setLength(0);
			sql.append("DELETE FROM PSC0300_MAST_TABLE WHERE REPORT_DATE='"
					+ df.formatdate(NullCheck.isNotNull(request.getParameter("repdt"))) + "' and ACCT_NUMBER='"
					+ NullCheck.isNotNull(request.getParameter("accno")) + "' and CUST_ID='"
					+ NullCheck.isNotNull(request.getParameter("custid")) + "'");

			try {
				log.info(sql.toString());
				ps = conn.prepareStatement(sql.toString());

				int rs = 0;
				rs = ps.executeUpdate();

				status = "success";

				sql.setLength(0);
				sql.append("UPDATE PSC0300_MOD_TABLE SET LCHG_USER='" + session.getAttribute("userName")
						+ "' WHERE REPORT_DATE='" + df.formatdate(NullCheck.isNotNull(request.getParameter("repdt")))
						+ "' and ACCT_NUMBER='" + NullCheck.isNotNull(request.getParameter("accno")) + "' and CUST_ID='"
						+ NullCheck.isNotNull(request.getParameter("custid")) + "'");
				try {
					log.info(sql.toString());
					ps = conn.prepareStatement(sql.toString());

					int rs1 = 0;
					rs1 = ps.executeUpdate();

					status = "success";
				} catch (SQLException e) {
					e.printStackTrace();
					status = "error";
				}

				sql.setLength(0);
				sql.append("DELETE FROM PSC0300_MOD_TABLE WHERE REPORT_DATE='"
						+ df.formatdate(NullCheck.isNotNull(request.getParameter("repdt"))) + "' and ACCT_NUMBER='"
						+ NullCheck.isNotNull(request.getParameter("accno")) + "' and CUST_ID='"
						+ NullCheck.isNotNull(request.getParameter("custid")) + "'");
				try {
					log.info(sql.toString());
					ps = conn.prepareStatement(sql.toString());

					int rs1 = 0;
					rs1 = ps.executeUpdate();

					status = "success";
				} catch (SQLException e) {
					e.printStackTrace();
					status = "error";
				}

			} catch (SQLException e) {
				e.printStackTrace();
				status = "error";
			}
		}

		return status;
	}

}
