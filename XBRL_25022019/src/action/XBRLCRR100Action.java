package action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import basecode.DateFormat;
import bean.XBRLBOPBean;
import bean.XBRLCRR0100Bean;
import dao.XBRLBOPDao;
import dao.XBRLCRR0100Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;

/**
 * @companyName : Bonfire Innovation Private Limited Chennai
 * @project : Extensible Business Reporting Language (XBRL)
 * @name : XBRLCRR100Action.java
 * @path : action
 * @author : D PraveenBabu
 * @version : 1.0
 * @functionality : It contains the action with multiple methods to create
 *                CRR0100 Report.
 * @relatedScripts : bean.XBRLBOPBean.java,dao.XBRLBOPDao.java *
 * @creationDate : 23rd Nov 2017
 * @lastModifiedDate : 10th Jan 2018
 * @modificationHistory : Added header
 * @DateUser: Change Description
 * @remarks : None
 * @DateUser: Change Description
 */

public class XBRLCRR100Action {

	static Logger log = Logger.getLogger(XBRLCRR100Action.class);
	public String refnoAB;

	public String getRefnoAB() {
		return refnoAB;
	}

	public void setRefnoAB(String refnoAB) {
		this.refnoAB = refnoAB;
	}

	public String modXbcrrCreate() throws SQLException {

		String status = "";
		String status1 = "";

		String ReporefSeq = "";
		HttpServletRequest request = ServletActionContext.getRequest();

		DateFormat df = new DateFormat();

		NullCheck nc = new NullCheck();

		HttpSession session = request.getSession();

		log.info("dt1--->" + request.getParameter("dt1"));
		log.info("dt2--->" + request.getParameter("dt2"));
		log.info("reportrefno====>>>" + request.getParameter("reportrefno"));
		log.info("rptday_row--->" + request.getParameter("rptday"));
		log.info("rptdate_row--->" + request.getParameter("rptdate"));
		log.info("depamtmur_row1--->" + request.getParameter("depamtmur"));
		log.info("depdeneur_row1--->" + request.getParameter("depdeneur"));
		log.info("depdengbp_row1--->" + request.getParameter("depdengbp"));
		log.info("depdenusd_row1--->" + request.getParameter("depdenusd"));
		log.info("usdequfor_row1--->" + request.getParameter("usdequfor"));
		log.info("reccod_row--->" + request.getParameter("reccod"));

		log.info("rcrusrid_row--->" + request.getParameter("rcrusrid"));
		log.info("rcrtme_row--->" + request.getParameter("rcrtme"));
		log.info("lchusrid_row--->" + request.getParameter("lchusrid"));
		log.info("lchtme_row--->" + request.getParameter("lchtme"));

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
		NullCheck nc1 = new NullCheck();

		// String passexpdate=df.formatdate(xb.getAccopendate());

		if (request.getParameter("reportrefno").equals("null")) {
			log.info("if not equal null");
			utilities.SequenceNumber seqNo = new utilities.SequenceNumber();
			String reporefseqno = seqNo.reporefno();

			// log.info(" seqno := " + seqno);

			ReporefSeq = "RR01000" + reporefseqno;
		} else {
			log.info("else ");
			ReporefSeq = request.getParameter("reportrefno");

		}

		log.info("===ReporefSeq===" + ReporefSeq);
		// log.info("<< EIDSeq >> " + EIDSeq);
		session.setAttribute("ReprefSeq", ReporefSeq);

		// int rs=0;

		int count = 0;

		StringBuffer sql = new StringBuffer();
		// HttpSession session = request.getSession();
		log.info("insert Action modXbcrrCreate");

		try {

			// sql.append("SELECT Count (*) as cnt FROM (SELECT DISTINCT
			// RPT_DATE,REC_CODE FROM CRR0100_MOD_TABLE where
			// REPORT_REF_NO='"+ReporefSeq+"' and RPT_DATE
			// >='"+request.getParameter("dt1")+"' and RPT_DATE <=
			// '"+request.getParameter("dt2")+"' and
			// REC_CODE='"+request.getParameter("reccod")+"') ");

			if (ReporefSeq.equals("null")) {

				log.info("IFF");
				sql.append(
						"SELECT Count (*) as cnt FROM   (SELECT DISTINCT RPT_DATE,REC_CODE FROM  CRR0100_MOD_TABLE where REPORT_REF_NO='"
								+ ReporefSeq + "' and RPT_DATE >='" + request.getParameter("dt1")
								+ "' and RPT_DATE <= '" + request.getParameter("dt2") + "'  and REC_CODE='"
								+ request.getParameter("reccod") + "') ");

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
						log.info("dt1--->" + request.getParameter("dt1"));
						log.info("dt2--->" + request.getParameter("dt2"));
						log.info("reportrefno====>>>" + ReporefSeq);
						log.info("rptday_row--->" + request.getParameter("rptday"));
						log.info("rptdate_row--->" + df1.formatdate(request.getParameter("rptdate")));
						log.info("depamtmur_row1--->" + request.getParameter("depamtmur"));
						log.info("depdeneur_row1--->" + request.getParameter("depdeneur"));
						log.info("depdengbp_row1--->" + request.getParameter("depdengbp"));
						log.info("depdenusd_row1--->" + request.getParameter("depdenusd"));
						log.info("usdequfor_row1--->" + request.getParameter("usdequfor"));
						log.info("reccod_row--->" + request.getParameter("reccod"));

						log.info("rcrusrid_row--->" + request.getParameter("rcrusrid"));
						log.info("rcrtme_row--->" + request.getParameter("rcrtme"));
						log.info("lchusrid_row--->" + request.getParameter("lchusrid"));
						log.info("lchtme_row--->" + request.getParameter("lchtme"));

						/*
						 * sql2.append("update CRR0100_MOD_TABLE set "
						 * 
						 * + "REPORT_REF_NO ='"+ReporefSeq+"'," +
						 * "RPT_DAY ='"+request.getParameter("rptday")+"'," +
						 * "RPT_DATE ='"+df1.formatdate(request.getParameter(
						 * "rptdate"))+"'," +
						 * "DEPOSIT_AMT_IN_MUR ='"+request.getParameter(
						 * "depamtmur")+"'," +
						 * "DEPOSIT_DENOM_IN_EUR ='"+request.getParameter(
						 * "depdeneur")+"'," +
						 * "DEPOSIT_DENOM_IN_GBP ='"+request.getParameter(
						 * "depdengbp")+"'," +
						 * "DEPOSIT_DENOM_IN_USD ='"+df1.formatdate(request.
						 * getParameter("depdenusd"))+"'," +
						 * "USD_EQUIV_OTH_FCY_DEPOSIT ='"+request.getParameter(
						 * "usdequfor")+"'," +
						 * "REC_CODE ='"+request.getParameter("reccod")+"'," +
						 * "RCRE_USER_ID ='"+request.getParameter("rcrusrid")+
						 * "'," +
						 * "RCRE_TIME ='"+df1.formatdate(request.getParameter(
						 * "rcrtme"))+"'," +
						 * "LCHG_USER_ID ='"+request.getParameter("lchusrid")+
						 * "'," +
						 * "LCHG_TIME ='"+df1.formatdate(request.getParameter(
						 * "lchtme"))+"'   where REC_CODE='"+
						 * request.getParameter("reccod") + "' " + "RPT_DATE='"+
						 * df1.formatdate(request.getParameter("rptdate")) +
						 * "' ");
						 */

						// sql2.append("update CRR0100_MOD_TABLE set
						// REPORT_REF_NO ='"+ReporefSeq+"',RPT_DAY
						// ='"+request.getParameter("rptday")+"',RPT_DATE
						// ='"+df1.formatdate(request.getParameter("rptdate"))+"',DEPOSIT_AMT_IN_MUR
						// ='"+request.getParameter("depamtmur")+"
						// ',DEPOSIT_DENOM_IN_EUR
						// ='"+request.getParameter("depdeneur")+"
						// ',DEPOSIT_DENOM_IN_GBP
						// ='"+request.getParameter("depdengbp")+"',DEPOSIT_DENOM_IN_USD
						// ='"+df1.formatdate(request.getParameter("depdenusd"))+"
						// ',USD_EQUIV_OTH_FCY_DEPOSIT
						// ='"+request.getParameter("usdequfor")+"',REC_CODE
						// ='"+request.getParameter("reccod")+"',RCRE_USER_ID
						// ='"+request.getParameter("rcrusrid")+"',RCRE_TIME
						// ='"+df1.formatdate(request.getParameter("rcrtme"))+"',LCHG_USER_ID
						// ='"+request.getParameter("lchusrid")+"',LCHG_TIME
						// ='"+df1.formatdate(request.getParameter("lchtme"))+"'
						// where REPORT_REF_NO = '"+ReporefSeq+"'");

						sql4.append("update CRR0100_MOD_TABLE set REPORT_REF_NO ='" + ReporefSeq + "',RPT_DAY ='"
								+ request.getParameter("rptday") + "',RPT_DATE ='"
								+ df1.formatdate(request.getParameter("rptdate")) + "',DEPOSIT_AMT_IN_MUR ='"
								+ request.getParameter("depamtmur") + " ',DEPOSIT_DENOM_IN_EUR ='"
								+ request.getParameter("depdeneur") + " ',DEPOSIT_DENOM_IN_GBP ='"
								+ request.getParameter("depdengbp") + "',DEPOSIT_DENOM_IN_USD ='"
								+ request.getParameter("depdenusd") + " ',USD_EQUIV_OTH_FCY_DEPOSIT ='"
								+ request.getParameter("usdequfor") + "',REC_CODE ='" + request.getParameter("reccod")
								+ "',RCRE_USER_ID ='" + request.getParameter("rcrusrid") + "',RCRE_TIME ='"
								+ df1.formatdate(request.getParameter("rcrtme")) + "',LCHG_USER_ID ='"
								+ request.getParameter("lchusrid") + "',LCHG_TIME ='"
								+ df1.formatdate(request.getParameter("lchtme")) + "' where REPORT_REF_NO ='"
								+ ReporefSeq + "'");

						log.info("ghf");
						log.info("Update======>" + sql4.toString());

						ps4 = conn.prepareStatement(sql4.toString());
						int rs4 = ps4.executeUpdate();
						if (rs4 > 0) {
							log.info("<<==Update Success==>>");
							/*
							 * request.setAttribute("type", "update");
							 * request.setAttribute("alert","Report Ref No : "
							 * +" "+EIDSeq+" "+ "Updated Successfully");
							 */
							status1 = "updated";
							status = "success";

						}

					} else {
						log.info("INSERT");

						sql3.append("INSERT INTO CRR0100_MOD_TABLE(" + "REPORT_REF_NO," + "RPT_DAY," + "RPT_DATE,"
								+ "DEPOSIT_AMT_IN_MUR," + "DEPOSIT_DENOM_IN_EUR," + "DEPOSIT_DENOM_IN_GBP,"
								+ "DEPOSIT_DENOM_IN_USD," + "USD_EQUIV_OTH_FCY_DEPOSIT," + "REC_CODE," + "RCRE_USER_ID,"
								+ "RCRE_TIME," + "LCHG_USER_ID," + "LCHG_TIME)");

						sql3.append("values('" + ReporefSeq + "','" + request.getParameter("rptday") + "','"
								+ df1.formatdate(request.getParameter("rptdate")) + "','"
								+ request.getParameter("depamtmur") + "','" + request.getParameter("depdeneur") + "','"
								+ request.getParameter("depdengbp") + "','" + request.getParameter("depdenusd") + "','"
								+ nc1.isNotZero(request.getParameter("usdequfor")) + "','"
								+ request.getParameter("reccod") + "','" + request.getParameter("rcrusrid") + "','"
								+ df1.formatdate(request.getParameter("rcrtme")) + "','"
								+ request.getParameter("lchusrid") + "','"
								+ df1.formatdate(request.getParameter("lchtme")) + "') ");

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
						"SELECT Count (*) as cnt FROM   (SELECT DISTINCT RPT_DATE,REC_CODE FROM  CRR0100_MOD_TABLE where REPORT_REF_NO='"
								+ ReporefSeq + "' and RPT_DATE ='" + request.getParameter("rptdate") + "') ");

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
						log.info("dt1--->" + request.getParameter("dt1"));
						log.info("dt2--->" + request.getParameter("dt2"));
						log.info("reportrefno====>>>" + ReporefSeq);
						log.info("rptday_row--->" + request.getParameter("rptday"));
						log.info("rptdate_row--->" + df1.formatdate(request.getParameter("rptdate")));
						log.info("depamtmur_row1--->" + request.getParameter("depamtmur"));
						log.info("depdeneur_row1--->" + request.getParameter("depdeneur"));
						log.info("depdengbp_row1--->" + request.getParameter("depdengbp"));
						log.info("depdenusd_row1--->" + request.getParameter("depdenusd"));
						log.info("usdequfor_row1--->" + request.getParameter("usdequfor"));
						log.info("reccod_row--->" + request.getParameter("reccod"));

						log.info("rcrusrid_row--->" + request.getParameter("rcrusrid"));
						log.info("rcrtme_row--->" + request.getParameter("rcrtme"));
						log.info("lchusrid_row--->" + request.getParameter("lchusrid"));
						log.info("lchtme_row--->" + request.getParameter("lchtme"));

						/*
						 * sql2.append("update CRR0100_MOD_TABLE set "
						 * 
						 * + "REPORT_REF_NO ='"+ReporefSeq+"'," +
						 * "RPT_DAY ='"+request.getParameter("rptday")+"'," +
						 * "RPT_DATE ='"+df1.formatdate(request.getParameter(
						 * "rptdate"))+"'," +
						 * "DEPOSIT_AMT_IN_MUR ='"+request.getParameter(
						 * "depamtmur")+"'," +
						 * "DEPOSIT_DENOM_IN_EUR ='"+request.getParameter(
						 * "depdeneur")+"'," +
						 * "DEPOSIT_DENOM_IN_GBP ='"+request.getParameter(
						 * "depdengbp")+"'," +
						 * "DEPOSIT_DENOM_IN_USD ='"+df1.formatdate(request.
						 * getParameter("depdenusd"))+"'," +
						 * "USD_EQUIV_OTH_FCY_DEPOSIT ='"+request.getParameter(
						 * "usdequfor")+"'," +
						 * "REC_CODE ='"+request.getParameter("reccod")+"'," +
						 * "RCRE_USER_ID ='"+request.getParameter("rcrusrid")+
						 * "'," +
						 * "RCRE_TIME ='"+df1.formatdate(request.getParameter(
						 * "rcrtme"))+"'," +
						 * "LCHG_USER_ID ='"+request.getParameter("lchusrid")+
						 * "'," +
						 * "LCHG_TIME ='"+df1.formatdate(request.getParameter(
						 * "lchtme"))+"'   where REC_CODE='"+
						 * request.getParameter("reccod") + "' " + "RPT_DATE='"+
						 * df1.formatdate(request.getParameter("rptdate")) +
						 * "' ");
						 */

						// sql2.append("update CRR0100_MOD_TABLE set
						// REPORT_REF_NO ='"+ReporefSeq+"',RPT_DAY
						// ='"+request.getParameter("rptday")+"',RPT_DATE
						// ='"+df1.formatdate(request.getParameter("rptdate"))+"',DEPOSIT_AMT_IN_MUR
						// ='"+request.getParameter("depamtmur")+"
						// ',DEPOSIT_DENOM_IN_EUR
						// ='"+request.getParameter("depdeneur")+"
						// ',DEPOSIT_DENOM_IN_GBP
						// ='"+request.getParameter("depdengbp")+"',DEPOSIT_DENOM_IN_USD
						// ='"+df1.formatdate(request.getParameter("depdenusd"))+"
						// ',USD_EQUIV_OTH_FCY_DEPOSIT
						// ='"+request.getParameter("usdequfor")+"',REC_CODE
						// ='"+request.getParameter("reccod")+"',RCRE_USER_ID
						// ='"+request.getParameter("rcrusrid")+"',RCRE_TIME
						// ='"+df1.formatdate(request.getParameter("rcrtme"))+"',LCHG_USER_ID
						// ='"+request.getParameter("lchusrid")+"',LCHG_TIME
						// ='"+df1.formatdate(request.getParameter("lchtme"))+"'
						// where REPORT_REF_NO = '"+ReporefSeq+"'");

						sql4.append("update CRR0100_MOD_TABLE set REPORT_REF_NO ='" + ReporefSeq + "',RPT_DAY ='"
								+ request.getParameter("rptday") + "',RPT_DATE ='"
								+ df1.formatdate(request.getParameter("rptdate")) + "',DEPOSIT_AMT_IN_MUR ='"
								+ request.getParameter("depamtmur") + " ',DEPOSIT_DENOM_IN_EUR ='"
								+ request.getParameter("depdeneur") + " ',DEPOSIT_DENOM_IN_GBP ='"
								+ request.getParameter("depdengbp") + "',DEPOSIT_DENOM_IN_USD ='"
								+ request.getParameter("depdenusd") + " ',USD_EQUIV_OTH_FCY_DEPOSIT ='"
								+ request.getParameter("usdequfor") + "',REC_CODE ='" + request.getParameter("reccod")
								+ "',RCRE_USER_ID ='" + request.getParameter("rcrusrid") + "',RCRE_TIME ='"
								+ df1.formatdate(request.getParameter("rcrtme")) + "',LCHG_USER_ID ='"
								+ request.getParameter("lchusrid") + "',LCHG_TIME ='"
								+ df1.formatdate(request.getParameter("lchtme")) + "' where REPORT_REF_NO ='"
								+ ReporefSeq + "' and RPT_DATE ='" + df1.formatdate(request.getParameter("rptdate"))
								+ "'");

						log.info("ghf");
						log.info("Update======>" + sql4.toString());

						ps4 = conn.prepareStatement(sql4.toString());
						int rs4 = ps4.executeUpdate();
						if (rs4 > 0) {
							log.info("<<==Update Success==>>");
							/*
							 * request.setAttribute("type", "update");
							 * request.setAttribute("alert","Report Ref No : "
							 * +" "+EIDSeq+" "+ "Updated Successfully");
							 */
							status1 = "updated";
							status = "success";

						}

					} else {
						log.info("INSERT");

						sql3.append("INSERT INTO CRR0100_MOD_TABLE(" + "REPORT_REF_NO," + "RPT_DAY," + "RPT_DATE,"
								+ "DEPOSIT_AMT_IN_MUR," + "DEPOSIT_DENOM_IN_EUR," + "DEPOSIT_DENOM_IN_GBP,"
								+ "DEPOSIT_DENOM_IN_USD," + "USD_EQUIV_OTH_FCY_DEPOSIT," + "REC_CODE," + "RCRE_USER_ID,"
								+ "RCRE_TIME," + "LCHG_USER_ID," + "LCHG_TIME)");

						sql3.append("values('" + ReporefSeq + "','" + request.getParameter("rptday") + "','"
								+ df1.formatdate(request.getParameter("rptdate")) + "','"
								+ request.getParameter("depamtmur") + "','" + request.getParameter("depdeneur") + "','"
								+ request.getParameter("depdengbp") + "','" + request.getParameter("depdenusd") + "','"
								+ request.getParameter("usdequfor") + "','" + request.getParameter("reccod") + "','"
								+ request.getParameter("rcrusrid") + "','"
								+ df1.formatdate(request.getParameter("rcrtme")) + "','"
								+ request.getParameter("lchusrid") + "','"
								+ df1.formatdate(request.getParameter("lchtme")) + "') ");

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

			// sql.append("SELECT count(distinct RPT_DATE)as cnt,count(distinct
			// REC_CODE) as cnt1 from CRR0100_MOD_TABLE where
			// REPORT_REF_NO='"+ReporefSeq+"' and
			// RPT_DAY='"+request.getParameter("rptday")+"',REC_CODE='"+request.getParameter("reccod")+"'
			// ");

			// sql.append("INSERT INTO
			// BAM_ASSET_FLOWS(DAILY_AVG_AMT,WEIGHT_AVG_INT_RATE,INT_INC_EXP)
			// VALUES ('"+daa_val[i]+"','"+wair_val[i]+"','"+iiie_val[i]+"')");

		}

		catch (SQLException e) {
			status = "error";
			e.printStackTrace();
		}

		refnoAB = ReporefSeq;

		if (status.equals("success") && status1.equals("inserted")) {

			// log.info("==insert Statusss==");
			// String next=lmd.insertRecord(arl,af);
			// request.setAttribute("alert", "Report Ref No : " +" "+EIDSeq+" "+
			// "Inserted Successfully.");
			request.setAttribute("type", "inserted");
			request.setAttribute("dt1", request.getParameter("dt1"));
			request.setAttribute("dt2", request.getParameter("dt2"));
			request.setAttribute("ReporefSeq", ReporefSeq);
			request.setAttribute("alert", "Report Ref No : " + " " + ReporefSeq + " " + "Created Successfully.");

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

			request.setAttribute("alert", "CRR Table  not updated successfully.");
			return "error";
		}

	}

	public String modXbcrrCreateAC() throws SQLException {

		String status = "";
		String status1 = "";

		String ReporefSeq = "";
		HttpServletRequest request = ServletActionContext.getRequest();

		DateFormat df = new DateFormat();

		NullCheck nc = new NullCheck();

		HttpSession session = request.getSession();

		log.info("dt1--->" + request.getParameter("dt1"));
		log.info("dt2--->" + request.getParameter("dt2"));
		log.info("reportrefno====>>>" + request.getParameter("reportrefno"));
		log.info("rptdayAC_row--->" + request.getParameter("rptdayAC"));
		log.info("rptdateAC_row--->" + request.getParameter("rptdateAC"));
		log.info("depamtmurAC_row1--->" + request.getParameter("depamtmurAC"));
		log.info("depdeneurAC_row1--->" + request.getParameter("depdeneurAC"));

		log.info("reccodAC_row--->" + request.getParameter("reccodAC"));

		log.info("rcrusridAC_row--->" + request.getParameter("rcrusridAC"));
		log.info("rcrtmeAC_row--->" + request.getParameter("rcrtmeAC"));
		log.info("lchusridAC_row--->" + request.getParameter("lchusridAC"));
		log.info("lchtmeAC_row--->" + request.getParameter("lchtmeAC"));

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

		if (request.getParameter("reportrefno").equals("null")) {
			log.info("if not equal null");
			utilities.SequenceNumber seqNo = new utilities.SequenceNumber();
			String reporefseqno = seqNo.reporefno();

			// log.info(" seqno := " + seqno);

			ReporefSeq = "RR01000" + reporefseqno;
		} else {
			log.info("else ");
			ReporefSeq = request.getParameter("reportrefno");

		}
		log.info("===ReporefSeq===" + ReporefSeq);
		// log.info("<< EIDSeq >> " + EIDSeq);
		session.setAttribute("ReprefSeq", ReporefSeq);

		// int rs=0;

		int count = 0;

		StringBuffer sql = new StringBuffer();
		// HttpSession session = request.getSession();
		log.info("insert Action modXbcrrCreateAC");

		try {

			// sql.append("SELECT Count (*) as cnt FROM (SELECT DISTINCT
			// RPT_DATE,REC_CODE FROM CRR0100_MOD_TABLE where
			// REPORT_REF_NO='"+ReporefSeq+"' and RPT_DATE
			// >='"+request.getParameter("dt1")+"' and RPT_DATE <=
			// '"+request.getParameter("dt2")+"' and
			// REC_CODE='"+request.getParameter("reccod")+"') ");

			if (ReporefSeq.equals("null")) {

				log.info("IFF");
				sql.append(
						"SELECT Count (*) as cnt FROM   (SELECT DISTINCT RPT_DATE,REC_CODE FROM  CRR0100_MOD_TABLE where REPORT_REF_NO='"
								+ ReporefSeq + "' and RPT_DATE >='" + request.getParameter("dt1")
								+ "' and RPT_DATE <= '" + request.getParameter("dt2") + "'  and REC_CODE='"
								+ request.getParameter("reccod") + "') ");

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
						log.info("dt1--->" + request.getParameter("dt1"));
						log.info("dt2--->" + request.getParameter("dt2"));
						log.info("reportrefno====>>>" + ReporefSeq);
						log.info("rptdayAC_row--->" + request.getParameter("rptdayAC"));
						log.info("rptdateAC_row--->" + df1.formatdate(request.getParameter("rptdateAC")));
						log.info("depamtmurAC_row1--->" + request.getParameter("depamtmurAC"));
						log.info("depdeneurAC_row1--->" + request.getParameter("depdeneurAC"));

						log.info("reccodAC_row--->" + request.getParameter("reccodAC"));

						log.info("rcrusridAC_row--->" + request.getParameter("rcrusridAC"));
						log.info("rcrtmeAC_row--->" + request.getParameter("rcrtmeAC"));
						log.info("lchusridAC_row--->" + request.getParameter("lchusridAC"));
						log.info("lchtmeAC_row--->" + request.getParameter("lchtmeAC"));

						/*
						 * sql2.append("update CRR0100_MOD_TABLE set "
						 * 
						 * + "REPORT_REF_NO ='"+ReporefSeq+"'," +
						 * "RPT_DAY ='"+request.getParameter("rptday")+"'," +
						 * "RPT_DATE ='"+df1.formatdate(request.getParameter(
						 * "rptdate"))+"'," +
						 * "DEPOSIT_AMT_IN_MUR ='"+request.getParameter(
						 * "depamtmur")+"'," +
						 * "DEPOSIT_DENOM_IN_EUR ='"+request.getParameter(
						 * "depdeneur")+"'," +
						 * "DEPOSIT_DENOM_IN_GBP ='"+request.getParameter(
						 * "depdengbp")+"'," +
						 * "DEPOSIT_DENOM_IN_USD ='"+df1.formatdate(request.
						 * getParameter("depdenusd"))+"'," +
						 * "USD_EQUIV_OTH_FCY_DEPOSIT ='"+request.getParameter(
						 * "usdequfor")+"'," +
						 * "REC_CODE ='"+request.getParameter("reccod")+"'," +
						 * "RCRE_USER_ID ='"+request.getParameter("rcrusrid")+
						 * "'," +
						 * "RCRE_TIME ='"+df1.formatdate(request.getParameter(
						 * "rcrtme"))+"'," +
						 * "LCHG_USER_ID ='"+request.getParameter("lchusrid")+
						 * "'," +
						 * "LCHG_TIME ='"+df1.formatdate(request.getParameter(
						 * "lchtme"))+"'   where REC_CODE='"+
						 * request.getParameter("reccod") + "' " + "RPT_DATE='"+
						 * df1.formatdate(request.getParameter("rptdate")) +
						 * "' ");
						 */

						// sql2.append("update CRR0100_MOD_TABLE set
						// REPORT_REF_NO ='"+ReporefSeq+"',RPT_DAY
						// ='"+request.getParameter("rptday")+"',RPT_DATE
						// ='"+df1.formatdate(request.getParameter("rptdate"))+"',DEPOSIT_AMT_IN_MUR
						// ='"+request.getParameter("depamtmur")+"
						// ',DEPOSIT_DENOM_IN_EUR
						// ='"+request.getParameter("depdeneur")+"
						// ',DEPOSIT_DENOM_IN_GBP
						// ='"+request.getParameter("depdengbp")+"',DEPOSIT_DENOM_IN_USD
						// ='"+df1.formatdate(request.getParameter("depdenusd"))+"
						// ',USD_EQUIV_OTH_FCY_DEPOSIT
						// ='"+request.getParameter("usdequfor")+"',REC_CODE
						// ='"+request.getParameter("reccod")+"',RCRE_USER_ID
						// ='"+request.getParameter("rcrusrid")+"',RCRE_TIME
						// ='"+df1.formatdate(request.getParameter("rcrtme"))+"',LCHG_USER_ID
						// ='"+request.getParameter("lchusrid")+"',LCHG_TIME
						// ='"+df1.formatdate(request.getParameter("lchtme"))+"'
						// where REPORT_REF_NO = '"+ReporefSeq+"'");

						sql4.append("update CRR0100_MOD_TABLE set REPORT_REF_NO ='" + ReporefSeq + "',RPT_DAY ='"
								+ request.getParameter("rptdayAC") + "',RPT_DATE ='"
								+ df1.formatdate(request.getParameter("rptdateAC")) + "',DEPOSIT_AMT_IN_MUR ='"
								+ request.getParameter("depamtmurAC") + " ',DEPOSIT_DENOM_IN_EUR ='"
								+ request.getParameter("depdeneurAC") + " ',REC_CODE ='"
								+ request.getParameter("reccodAC") + "',RCRE_USER_ID ='"
								+ request.getParameter("rcrusridAC") + "',RCRE_TIME ='"
								+ df1.formatdate(request.getParameter("rcrtmeAC")) + "',LCHG_USER_ID ='"
								+ request.getParameter("lchusridAC") + "',LCHG_TIME ='"
								+ df1.formatdate(request.getParameter("lchtmeAC")) + "' where REPORT_REF_NO ='"
								+ ReporefSeq + "'");

						log.info("ghf");
						log.info("Update======>" + sql4.toString());

						ps4 = conn.prepareStatement(sql4.toString());
						int rs4 = ps4.executeUpdate();
						if (rs4 > 0) {
							log.info("<<==Update Success==>>");
							/*
							 * request.setAttribute("type", "update");
							 * request.setAttribute("alert","Report Ref No : "
							 * +" "+EIDSeq+" "+ "Updated Successfully");
							 */
							status1 = "updated";
							status = "success";

						}

					} else {
						log.info("INSERT");

						sql3.append("INSERT INTO CRR0100_MOD_TABLE(" + "REPORT_REF_NO," + "RPT_DAY," + "RPT_DATE,"
								+ "DEPOSIT_AMT_IN_MUR," + "DEPOSIT_DENOM_IN_EUR," + "REC_CODE," + "RCRE_USER_ID,"
								+ "RCRE_TIME," + "LCHG_USER_ID," + "LCHG_TIME)");

						sql3.append("values('" + ReporefSeq + "','" + request.getParameter("rptdayAC") + "','"
								+ df1.formatdate(request.getParameter("rptdateAC")) + "','"
								+ request.getParameter("depamtmurAC") + "','" + request.getParameter("depdeneurAC")
								+ "','" + request.getParameter("reccodAC") + "','" + request.getParameter("rcrusridAC")
								+ "','" + df1.formatdate(request.getParameter("rcrtmeAC")) + "','"
								+ request.getParameter("lchusridAC") + "','"
								+ df1.formatdate(request.getParameter("lchtmeAC")) + "') ");

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
						"SELECT Count (*) as cnt FROM   (SELECT DISTINCT RPT_DATE,REC_CODE FROM  CRR0100_MOD_TABLE where REPORT_REF_NO='"
								+ ReporefSeq + "' and RPT_DATE ='" + request.getParameter("rptdate") + "') ");

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
						log.info("dt1--->" + request.getParameter("dt1"));
						log.info("dt2--->" + request.getParameter("dt2"));
						log.info("reportrefno====>>>" + ReporefSeq);
						log.info("rptdayAC_row--->" + request.getParameter("rptdayAC"));
						log.info("rptdateAC_row--->" + df1.formatdate(request.getParameter("rptdateAC")));
						log.info("depamtmurAC_row1--->" + request.getParameter("depamtmurAC"));
						log.info("depdeneurAC_row1--->" + request.getParameter("depdeneurAC"));

						log.info("reccodAC_row--->" + request.getParameter("reccodAC"));

						log.info("rcrusridAC_row--->" + request.getParameter("rcrusridAC"));
						log.info("rcrtmeAC_row--->" + request.getParameter("rcrtmeAC"));
						log.info("lchusridAC_row--->" + request.getParameter("lchusridAC"));
						log.info("lchtmeAC_row--->" + request.getParameter("lchtmeAC"));

						/*
						 * sql2.append("update CRR0100_MOD_TABLE set "
						 * 
						 * + "REPORT_REF_NO ='"+ReporefSeq+"'," +
						 * "RPT_DAY ='"+request.getParameter("rptday")+"'," +
						 * "RPT_DATE ='"+df1.formatdate(request.getParameter(
						 * "rptdate"))+"'," +
						 * "DEPOSIT_AMT_IN_MUR ='"+request.getParameter(
						 * "depamtmur")+"'," +
						 * "DEPOSIT_DENOM_IN_EUR ='"+request.getParameter(
						 * "depdeneur")+"'," +
						 * "DEPOSIT_DENOM_IN_GBP ='"+request.getParameter(
						 * "depdengbp")+"'," +
						 * "DEPOSIT_DENOM_IN_USD ='"+df1.formatdate(request.
						 * getParameter("depdenusd"))+"'," +
						 * "USD_EQUIV_OTH_FCY_DEPOSIT ='"+request.getParameter(
						 * "usdequfor")+"'," +
						 * "REC_CODE ='"+request.getParameter("reccod")+"'," +
						 * "RCRE_USER_ID ='"+request.getParameter("rcrusrid")+
						 * "'," +
						 * "RCRE_TIME ='"+df1.formatdate(request.getParameter(
						 * "rcrtme"))+"'," +
						 * "LCHG_USER_ID ='"+request.getParameter("lchusrid")+
						 * "'," +
						 * "LCHG_TIME ='"+df1.formatdate(request.getParameter(
						 * "lchtme"))+"'   where REC_CODE='"+
						 * request.getParameter("reccod") + "' " + "RPT_DATE='"+
						 * df1.formatdate(request.getParameter("rptdate")) +
						 * "' ");
						 */

						// sql2.append("update CRR0100_MOD_TABLE set
						// REPORT_REF_NO ='"+ReporefSeq+"',RPT_DAY
						// ='"+request.getParameter("rptday")+"',RPT_DATE
						// ='"+df1.formatdate(request.getParameter("rptdate"))+"',DEPOSIT_AMT_IN_MUR
						// ='"+request.getParameter("depamtmur")+"
						// ',DEPOSIT_DENOM_IN_EUR
						// ='"+request.getParameter("depdeneur")+"
						// ',DEPOSIT_DENOM_IN_GBP
						// ='"+request.getParameter("depdengbp")+"',DEPOSIT_DENOM_IN_USD
						// ='"+df1.formatdate(request.getParameter("depdenusd"))+"
						// ',USD_EQUIV_OTH_FCY_DEPOSIT
						// ='"+request.getParameter("usdequfor")+"',REC_CODE
						// ='"+request.getParameter("reccod")+"',RCRE_USER_ID
						// ='"+request.getParameter("rcrusrid")+"',RCRE_TIME
						// ='"+df1.formatdate(request.getParameter("rcrtme"))+"',LCHG_USER_ID
						// ='"+request.getParameter("lchusrid")+"',LCHG_TIME
						// ='"+df1.formatdate(request.getParameter("lchtme"))+"'
						// where REPORT_REF_NO = '"+ReporefSeq+"'");

						sql4.append("update CRR0100_MOD_TABLE set REPORT_REF_NO ='" + ReporefSeq + "',RPT_DAY ='"
								+ request.getParameter("rptdayAC") + "',RPT_DATE ='"
								+ df1.formatdate(request.getParameter("rptdateAC")) + "',DEPOSIT_AMT_IN_MUR ='"
								+ request.getParameter("depamtmurAC") + " ',DEPOSIT_DENOM_IN_EUR ='"
								+ request.getParameter("depdeneurAC") + "',REC_CODE ='"
								+ request.getParameter("reccodAC") + "',RCRE_USER_ID ='"
								+ request.getParameter("rcrusridAC") + "',RCRE_TIME ='"
								+ df1.formatdate(request.getParameter("rcrtmeAC")) + "',LCHG_USER_ID ='"
								+ request.getParameter("lchusridAC") + "',LCHG_TIME ='"
								+ df1.formatdate(request.getParameter("lchtmeAC")) + "' where REPORT_REF_NO ='"
								+ ReporefSeq + "' and RPT_DATE ='" + df1.formatdate(request.getParameter("rptdateAC"))
								+ "'");

						log.info("ghf");
						log.info("Update======>" + sql4.toString());

						ps4 = conn.prepareStatement(sql4.toString());
						int rs4 = ps4.executeUpdate();
						if (rs4 > 0) {
							log.info("<<==Update Success==>>");
							/*
							 * request.setAttribute("type", "update");
							 * request.setAttribute("alert","Report Ref No : "
							 * +" "+EIDSeq+" "+ "Updated Successfully");
							 */
							status1 = "updated";
							status = "success";

						}

					} else {
						log.info("INSERT");

						sql3.append("INSERT INTO CRR0100_MOD_TABLE(" + "REPORT_REF_NO," + "RPT_DAY," + "RPT_DATE,"
								+ "DEPOSIT_AMT_IN_MUR," + "DEPOSIT_DENOM_IN_EUR,"

								+ "REC_CODE," + "RCRE_USER_ID," + "RCRE_TIME," + "LCHG_USER_ID," + "LCHG_TIME)");

						sql3.append("values('" + ReporefSeq + "','" + request.getParameter("rptdayAC") + "','"
								+ df1.formatdate(request.getParameter("rptdateAC")) + "','"
								+ request.getParameter("depamtmurAC") + "','" + request.getParameter("depdeneurAC")

								+ "','" + request.getParameter("reccodAC") + "','" + request.getParameter("rcrusridAC")
								+ "','" + df1.formatdate(request.getParameter("rcrtmeAC")) + "','"
								+ request.getParameter("lchusridAC") + "','"
								+ df1.formatdate(request.getParameter("lchtmeAC")) + "') ");

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

			// sql.append("SELECT count(distinct RPT_DATE)as cnt,count(distinct
			// REC_CODE) as cnt1 from CRR0100_MOD_TABLE where
			// REPORT_REF_NO='"+ReporefSeq+"' and
			// RPT_DAY='"+request.getParameter("rptday")+"',REC_CODE='"+request.getParameter("reccod")+"'
			// ");

			// sql.append("INSERT INTO
			// BAM_ASSET_FLOWS(DAILY_AVG_AMT,WEIGHT_AVG_INT_RATE,INT_INC_EXP)
			// VALUES ('"+daa_val[i]+"','"+wair_val[i]+"','"+iiie_val[i]+"')");

		}

		catch (SQLException e) {
			status = "error";
			e.printStackTrace();
		}

		if (status.equals("success") && status1.equals("inserted")) {

			// log.info("==insert Statusss==");
			// String next=lmd.insertRecord(arl,af);
			// request.setAttribute("alert", "Report Ref No : " +" "+EIDSeq+" "+
			// "Inserted Successfully.");
			request.setAttribute("type", "insertedAC");
			request.setAttribute("dt1AC", request.getParameter("dt1"));
			request.setAttribute("dt2AC", request.getParameter("dt2"));
			request.setAttribute("ReporefSeqAC", ReporefSeq);
			request.setAttribute("alert", "Report Ref No : " + " " + ReporefSeq + " " + "Created Successfully.");

			// XBRLCRR0100Dao dmd =new XBRLCRR0100Dao();
			// ArrayList<XBRLCRR0100Bean> list=dmd.xbrlcrrRR(ReporefSeq);

			return "success";
		} else if (status.equals("success") && status1.equals("updated")) {
			// log.info("==update Statusss==");
			// String next=lmd.insertRecord(arl,af);

			request.setAttribute("type", "updatedAC");
			request.setAttribute("dt1AC", request.getParameter("dt1"));
			request.setAttribute("dt2AC", request.getParameter("dt2"));
			request.setAttribute("ReporefSeqAC", ReporefSeq);

			request.setAttribute("alert", "Report Ref No : " + " " + ReporefSeq + " " + "Updated Successfully.");
			// request.setAttribute("type", "AsstFlow");
			return "success";
		} else {

			request.setAttribute("alert", "CRR Table  not updated successfully.");
			return "error";
		}

	}

}
