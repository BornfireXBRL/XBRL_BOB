package action;

import java.sql.Connection;

import org.apache.log4j.Logger;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;

import basecode.DateFormat;
import bean.XBRLPSC0030Bean;
import dao.XBRLPSC0030Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;

/***************************************************************************************************************
 * * * @companyName : Bonfire Innovation Private Limited Chennai * * @project :
 * Extensible Business Reporting Language (XBRL) * * @name :
 * XBRLPSC0030Action.java * * @path : action * * @author : D PraveenBabu *
 * * @version : 1.0 * * @functionality : It contains the action with multiple
 * methods to create PSC0030 Report. * * * @relatedScripts :
 * bean.XBRLPSC0030Bean.java,dao.XBRLPSC0030Dao.java * * @creationDate : *
 * * @lastModifiedDate : * * @modificationHistory : * *
 ***************************************************************************************************************/

public class XBRLPSC0030Action {
	
	static Logger log = Logger.getLogger(XBRLPSC0030Action.class);
	public String refno;

	public String summaryPSC0030;

	public String detPSC0030;

	public String getDetPSC0030() {
		return detPSC0030;
	}

	public void setDetPSC0030(String detPSC0030) {
		this.detPSC0030 = detPSC0030;
	}

	public String getSummaryPSC0030() {
		return summaryPSC0030;
	}

	public void setSummaryPSC0030(String summaryPSC0030) {
		this.summaryPSC0030 = summaryPSC0030;
	}

	public String getRefno() {
		return refno;
	}

	public void setRefno(String refno) {
		this.refno = refno;
	}

	public String modXbPYMCreate100() throws SQLException {

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

		DateFormat df1 = new DateFormat();

		// String passexpdate=df.formatdate(xb.getAccopendate());
		log.info("===" + request.getParameter("reportrefno"));

		if (request.getParameter("reportrefno").startsWith("R")) {

			log.info("else notttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt ");
			ReporefSeq = request.getParameter("reportrefno");

		} else {

			log.info("nullllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll");

			utilities.SequenceNumber seqNo = new utilities.SequenceNumber();
			String reporefseqno = seqNo.reporefno();

			// log.info(" seqno := " + seqno);

			ReporefSeq = "RR01000" + reporefseqno;

		}
		log.info("===ReporefSeq===" + ReporefSeq);
		// log.info("<< EIDSeq >> " + EIDSeq);
		session.setAttribute("ReprefSeq", ReporefSeq);

		// int rs=0;

		int count = 0;

		StringBuffer sql = new StringBuffer();
		// HttpSession session = request.getSession();
		log.info("insert Action modXbCreatePSC0030");

		try {

			// sql.append("SELECT Count (*) as cnt FROM (SELECT DISTINCT RPT_DATE,REC_CODE
			// FROM CRR0100_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq+"' and RPT_DATE
			// >='"+request.getParameter("dt1")+"' and RPT_DATE <=
			// '"+request.getParameter("dt2")+"' and
			// REC_CODE='"+request.getParameter("reccod")+"') ");

			if (ReporefSeq.equals("null")) {

				log.info("IFF");
				// sql.append("SELECT Count (*) as cnt FROM (SELECT DISTINCT REP_DATE,TRAN_ID
				// FROM FIM0400_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq+"' and RPT_DATE
				// >='"+request.getParameter("dt1")+"' and RPT_DATE <=
				// '"+request.getParameter("dt2")+"' and
				// REC_CODE='"+request.getParameter("reccod")+"') ");

				sql.append(
						"SELECT Count (*) as cnt FROM   (SELECT DISTINCT TRAN_DATE FROM  PSC0030_MOD_TABLE where REPORT_REF_NO='"
								+ ReporefSeq.trim() + "' and ACCT_NUMBER = '" + request.getParameter("accname")
								+ "' and DEL_FLG = 'N' and TRAN_DATE >='" + df1.formatdate(request.getParameter("dt1"))
								+ "' and TRAN_DATE <= '" + df1.formatdate(request.getParameter("dt2")) + "')");

				log.info("select count       .... NEW===  " + sql.toString());
				ps = conn.prepareStatement(sql.toString());

				log.info("count test  ");

				ResultSet rs = ps.executeQuery();
				// log.info(rs);
				if (rs.next()) {
					count = rs.getInt("cnt");
					log.info("count" + count);

					if (count > 0) {
						log.info("UPDATE");

						sql4.append("update PSC0030_MOD_TABLE set REPORT_REF_NO ='" + ReporefSeq + "',MODES ='"
								+ request.getParameter("mode") + "',CHQ_NUMBER ='" + request.getParameter("chqno")
								+ "',ACCT_NUMBER ='" + request.getParameter("accno") + "',ACCT_NAME ='"
								+ request.getParameter("accname") + "',TRAN_DATE ='"
								+ df1.formatdate(request.getParameter("trdate")) + "',CHQ_AMOUNT ='"
								+ request.getParameter("chqamt") + "',CRNCY ='" + request.getParameter("crncy")
								+ "',DEL_FLG ='" + request.getParameter("del") + "',RCRE_USER_ID ='"
								+ request.getParameter("rcrusrid") + "',RCRE_TIME ='"
								+ df1.formatdate(request.getParameter("rcrtme")) + "',LCHG_USER_ID ='"
								+ request.getParameter("lchusrid")
								+ "',LCHG_TIME =current_timestamp where ACCT_NUMBER ='" + request.getParameter("accno")
								+ "' and REPORT_REF_NO ='" + ReporefSeq + "'");

						log.info("mohaaa gani");
						log.info("Update======>" + sql4.toString());

						ps4 = conn.prepareStatement(sql4.toString());
						int rs4 = ps4.executeUpdate();
						if (rs4 > 0) {
							log.info("<<==Update Success==>>");
							/*
							 * request.setAttribute("type", "update");
							 * request.setAttribute("alert","Report Ref No : " +" "+EIDSeq+" "+
							 * "Updated Successfully");
							 */
							status1 = "updated";
							status = "success";

						}

					} else {
						log.info("INSERT");

						sql3.append("INSERT INTO PSC0030_MOD_TABLE(" + "REPORT_REF_NO," + "MODES,"
						/* + "CHQ_ALPHA," */
								+ "CHQ_NUMBER," + "ACCT_NUMBER," + "ACCT_NAME," + "TRAN_DATE,"
								/* + "VALUE_DATE," */
								+ "CHQ_AMOUNT," + "CRNCY,"

								+ "DEL_FLG," + "RCRE_USER_ID," + "RCRE_TIME," + "LCHG_USER_ID," + "LCHG_TIME)");

						sql3.append("values('" + ReporefSeq + "','" + request.getParameter("mode")

						/* +"','"+request.getParameter("chalpha") */
								+ "','" + request.getParameter("chqno") + "','" + request.getParameter("accno") + "','"
								+ request.getParameter("accname") + "','"
								+ df1.formatdate(request.getParameter("trdate"))
								/* +"','"+df1.formatdate(request.getParameter("valdate")) */
								+ "','" + request.getParameter("chqamt") + "','" + request.getParameter("crncy")

								+ "','" + request.getParameter("del") + "','" + request.getParameter("rcrusrid") + "','"
								+ df1.formatdate(request.getParameter("rcrtme")) + "','"
								+ request.getParameter("lchusrid") + "',current_timestamp) ");

						// log.info("loginUPDAT"+sql3.toString()+username);
						// +"','"+EIDSeq+"',
						// '"+df1.formatdate(request.getParameter("rptstart"))+"','"+df1.formatdate(request.getParameter("rptend"))+"','"+request.getParameter("rptcrncy")+"','"+request.getParameter("bnkcode")+"','"+request.getParameter("modcode")+"','"+request.getParameter("modtype")
						log.info("Insert" + sql3.toString());

						ps3 = conn.prepareStatement(sql3.toString());
						int rs3 = ps3.executeUpdate();

						if (rs3 > 0) {

							request.setAttribute("ReporefSeq", ReporefSeq);

							status1 = "inserted";

							status = "success";

						}

					}

				}

			} else {

				log.info("ELSEEEE");

				sql.append(
						"SELECT Count (*) as cnt FROM   (SELECT DISTINCT TRAN_DATE FROM  PSC0030_MOD_TABLE where REPORT_REF_NO='"
								+ ReporefSeq.trim() + "' and DEL_FLG = 'N' and ACCT_NUMBER = '"
								+ request.getParameter("accno") + "') ");

				log.info("select count       .... NEW===  " + sql.toString());
				ps = conn.prepareStatement(sql.toString());

				log.info("count test  ");

				ResultSet rs = ps.executeQuery();
				// log.info(rs);
				if (rs.next()) {
					count = rs.getInt("cnt");
					log.info("count" + count);

					if (count > 0) {
						log.info("UPDATE");

						/*
						 * sql4.append("update PSC0030_MOD_TABLE set REPORT_REF_NO ='"
						 * +ReporefSeq+"',MODES ='"+request.getParameter("mode")+"',CHQ_ALPHA ='"
						 * +request.getParameter("chalpha")+"',CHQ_NUMBER ='"+request.getParameter(
						 * "chqno")+"',ACCT_NUMBER ='"+request.getParameter("accno")+"',ACCT_NAME ='"
						 * +request.getParameter("accname")+"',TRAN_DATE ='"+df1.formatdate(request.
						 * getParameter("trdate"))+"',VALUE_DATE ='"+df1.formatdate(request.getParameter
						 * ("valdate"))+"',CHQ_AMOUNT ='"+request.getParameter("chqamt")+"',CRNCY ='"
						 * +request.getParameter("crncy")+"',DEL_FLG ='"+request.getParameter("del")
						 * +"',RCRE_USER_ID ='"+request.getParameter("rcrusrid")+"',RCRE_TIME ='"+df1.
						 * formatdate(request.getParameter("rcrtme"))+"',LCHG_USER_ID ='"+request.
						 * getParameter("lchusrid")
						 * +"',LCHG_TIME =current_timestamp where ACCT_NUMBER ='"+request.getParameter(
						 * "accno")+"' and REPORT_REF_NO ='"+ReporefSeq+"'");
						 */

						sql4.append("update PSC0030_MOD_TABLE set REPORT_REF_NO ='" + ReporefSeq + "',MODES ='"
								+ request.getParameter("mode") + "',CHQ_NUMBER ='" + request.getParameter("chqno")
								+ "',ACCT_NUMBER ='" + request.getParameter("accno") + "',ACCT_NAME ='"
								+ request.getParameter("accname") + "',TRAN_DATE ='"
								+ df1.formatdate(request.getParameter("trdate")) + "',CHQ_AMOUNT ='"
								+ request.getParameter("chqamt") + "',CRNCY ='" + request.getParameter("crncy")
								+ "',DEL_FLG ='" + request.getParameter("del") + "',RCRE_USER_ID ='"
								+ request.getParameter("rcrusrid") + "',RCRE_TIME ='"
								+ df1.formatdate(request.getParameter("rcrtme")) + "',LCHG_USER_ID ='"
								+ request.getParameter("lchusrid")
								+ "',LCHG_TIME =current_timestamp where ACCT_NUMBER ='" + request.getParameter("accno")
								+ "' and REPORT_REF_NO ='" + ReporefSeq + "'");

						log.info("ghf");
						log.info("Update======>" + sql4.toString());

						ps4 = conn.prepareStatement(sql4.toString());
						int rs4 = ps4.executeUpdate();
						if (rs4 > 0) {
							log.info("<<==Update Success==>>");
							/*
							 * request.setAttribute("type", "update");
							 * request.setAttribute("alert","Report Ref No : " +" "+EIDSeq+" "+
							 * "Updated Successfully");
							 */
							status1 = "updated";
							status = "success";

						}

					} else {
						log.info("INSERT");

						sql3.append("INSERT INTO PSC0030_MOD_TABLE(" + "REPORT_REF_NO," + "MODES,"
						/* + "CHQ_ALPHA," */
								+ "CHQ_NUMBER," + "ACCT_NUMBER," + "ACCT_NAME," + "TRAN_DATE,"
								/* + "VALUE_DATE," */
								+ "CHQ_AMOUNT," + "CRNCY," + "DEL_FLG," + "RCRE_USER_ID," + "RCRE_TIME,"
								+ "LCHG_USER_ID," + "LCHG_TIME)");

						sql3.append("values('" + ReporefSeq + "','" + request.getParameter("mode")

						/* +"','"+request.getParameter("chalpha") */
								+ "','" + request.getParameter("chqno") + "','" + request.getParameter("accno") + "','"
								+ request.getParameter("accname") + "','"
								+ df1.formatdate(request.getParameter("trdate"))
								/* +"','"+df1.formatdate(request.getParameter("valdate")) */
								+ "','" + request.getParameter("chqamt") + "','" + request.getParameter("crncy") + "','"
								+ request.getParameter("del") + "','" + request.getParameter("rcrusrid") + "','"
								+ df1.formatdate(request.getParameter("rcrtme")) + "','"
								+ request.getParameter("lchusrid") + "',current_timestamp) ");

						// log.info("loginUPDAT"+sql3.toString()+username);
						// +"','"+EIDSeq+"',
						// '"+df1.formatdate(request.getParameter("rptstart"))+"','"+df1.formatdate(request.getParameter("rptend"))+"','"+request.getParameter("rptcrncy")+"','"+request.getParameter("bnkcode")+"','"+request.getParameter("modcode")+"','"+request.getParameter("modtype")
						log.info("Insert" + sql3.toString());

						ps3 = conn.prepareStatement(sql3.toString());
						int rs3 = ps3.executeUpdate();

						if (rs3 > 0) {

							request.setAttribute("ReporefSeq", ReporefSeq);

							status1 = "inserted";

							status = "success";

						}

					}

				}

			}

			// sql.append("SELECT count(distinct RPT_DATE)as cnt,count(distinct REC_CODE) as
			// cnt1 from CRR0100_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq+"' and
			// RPT_DAY='"+request.getParameter("rptday")+"',REC_CODE='"+request.getParameter("reccod")+"'
			// ");

			// sql.append("INSERT INTO
			// BAM_ASSET_FLOWS(DAILY_AVG_AMT,WEIGHT_AVG_INT_RATE,INT_INC_EXP) VALUES
			// ('"+daa_val[i]+"','"+wair_val[i]+"','"+iiie_val[i]+"')");

		}

		catch (SQLException e) {
			status = "error";
			e.printStackTrace();
		}

		/* RepID Display Header */
		log.info("ReporefSeqsdzfgdfrgdfgdfgdfgfdgdfg" + ReporefSeq);

		refno = ReporefSeq;

		log.info("****************ReporefSeq" + refno + "ReporefSeq");

		log.info("----ReportRefno---" + refno);

		if (status.equals("success") && status1.equals("inserted")) {

			// log.info("==insert Statusss==");
			// String next=lmd.insertRecord(arl,af);
			// request.setAttribute("alert", "Report Ref No : " +" "+EIDSeq+" "+ "Inserted
			// Successfully.");
			request.setAttribute("type", "inserted");
			request.setAttribute("dt1", request.getParameter("dt1"));
			request.setAttribute("dt2", request.getParameter("dt2"));
			request.setAttribute("ReporefSeq", ReporefSeq);
			request.setAttribute("alert", "Report Ref No : " + " " + ReporefSeq + " " + "Created Successfully.");
			log.info("INSIDE IFFF");
			// XBRLCRR0100Dao dmd =new XBRLCRR0100Dao();
			// ArrayList<XBRLCRR0100Bean> list=dmd.xbrlcrrRR(ReporefSeq);

			return "success";
		} else if (status.equals("success") && status1.equals("updated")) {
			// log.info("==update Statusss==");
			// String next=lmd.insertRecord(arl,af);

			request.setAttribute("type", "updated");
			request.setAttribute("dt1", request.getParameter("dt1"));
			request.setAttribute("dt2", request.getParameter("dt2"));
			request.setAttribute("ReporefSeq", ReporefSeq);

			request.setAttribute("alert", "Report Ref No : " + " " + ReporefSeq + " " + "Updated Successfully.");
			// request.setAttribute("type", "AsstFlow");
			return "success";
		} else {

			request.setAttribute("alert", "FIM0400 Table  not updated successfully.");
			return "error";
		}

	}

	/* --------------- SUMMARY BUTTOn CLICK --------------------------- */

	public String summaryPSC0030detail() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("in summaryPSC0030detail");

		log.info("test----->" + request.getParameter("reportrefnos") + "dt333"
				+ df.formatdate(request.getParameter("dt1")) + df.formatdate(request.getParameter("dt2")));
		XBRLPSC0030Dao bsd = new XBRLPSC0030Dao();
		ArrayList<XBRLPSC0030Bean> arl = bsd.xbrlpsc0030sumEP(df.formatdate(request.getParameter("dt1")),
				df.formatdate(request.getParameter("dt2")), request.getParameter("reportrefnos"),request.getParameter("curr"),request.getParameter("reptype"));

		// summarystandard = arl.toArray(new String[arl.size()]);
		log.info("ARL------------>" + arl.size());
		Gson gson = new Gson();
		summaryPSC0030 = gson.toJson(arl);

		return "success";

	}

	public String detailPSC0030() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		
		
		XBRLPSC0030Dao bsd = new XBRLPSC0030Dao();

		ArrayList<XBRLPSC0030Bean> arl = bsd.xbrlpsc0030ajaxdetails(request.getParameter("repname"),
				request.getParameter("ReporefSeq"), request.getParameter("instno"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		// summarystandard = arl.toArray(new String[arl.size()]);
		
		Gson gson = new Gson();
		detPSC0030 = gson.toJson(arl);

		return "success";

	}

	/*public String sumPSC0030saves() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();

		log.info("ajhflkashfklashfklahtest");
		XBRLPSC0030Dao bsd = new XBRLPSC0030Dao();

		ArrayList<XBRLPSC0030Bean> arl = bsd.detailPSC0030saves(request.getParameter("repname"),
				request.getParameter("reprefno"), request.getParameter("instno"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")));

		// arl.toArray(new String[arl.size()]);

		return "success";

	

}
*/
}