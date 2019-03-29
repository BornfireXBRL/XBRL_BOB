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
import bean.XBRLFIM1000Bean;
import bean.XBRLFIM1000Bean;
import dao.XBRLFIM1000Dao;
import dao.XBRLFIM1000Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;

/**
 * @companyName : 		 		Bonfire Innovation Private Limited Chennai
 * @project :    		 		Extensible Business Reporting Language (XBRL)
 * @name :       		 		XBRLFIM1000Action.java
 * @path :         		 		action
 * @author :       		 		D PraveenBabu
 * @version : 					1.0
 * @functionality :		 		It contains the action with multiple methods to create FIM1000 Report.
 * @relatedScripts : 	 		bean.XBRLFIM1000Bean.java,dao.XBRLFIM1000Dao.java 
 * @creationDate :				
 * @lastModifiedDate :			
 * @modificationHistory : 		

*/


public class XBRLFIM1000Action {
	
	static Logger log = Logger.getLogger(XBRLFIM1000Action.class);
	
	public String dashdata[];
	public String reporefeno;
	public String dtlFIM1000;

public String getDtlFIM1000() {
		return dtlFIM1000;
	}

	public void setDtlFIM1000(String dtlFIM1000) {
		this.dtlFIM1000 = dtlFIM1000;
	}
	
	public String sum1FIM1000;
public String getSum1FIM1000() {
		return sum1FIM1000;
	}

	public void setSum1FIM1000(String sum1fim1000) {
		sum1FIM1000 = sum1fim1000;
	}

public String summaryFIM1000;
	public String getSummaryFIM1000() {
	return summaryFIM1000;
}

public void setSummaryFIM1000(String summaryFIM1000) {
	this.summaryFIM1000 = summaryFIM1000;
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
	

	public String refno;
	public String getRefno() {
		return refno;
	}

	public void setRefno(String refno) {
		this.refno = refno;
	}

	public String modXbFIMCreate1000() throws SQLException {

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
					"INSERT INTO FIM1000_MOD_TABLE(REPORT_REF_NO,INSTITUTE_NAME,INSTITUTE_CODE,TRAN_NATURE,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,INT_START_DATE,INT_END_DATE,INT_RATE,REMARKS,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
							+ "values('" + ReporefSeq + "','" + request.getParameter("insnam") + "','"
							+ request.getParameter("inscode") + "','" 
							+ request.getParameter("trannat") + "','"
							+ request.getParameter("trancur") + "','" 
							+ request.getParameter("trantyp") + "','"
							+ request.getParameter("tranamt") + "','" 
							+df1.formatdate(request.getParameter("instdate")) + "','"
							+ df1.formatdate(request.getParameter("inendate")) + "','"
							+ request.getParameter("inrate") + "','" 
							+ request.getParameter("rem") + "','"
							+ df1.formatdate(request.getParameter("reportsd")) + "','" + session.getAttribute("userName")
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
					"SELECT Count (*) as count FROM   (SELECT DISTINCT REPORT_DATE FROM  FIM1000_MOD_TABLE where REPORT_REF_NO='"
							+ ReporefSeq.trim() + "'and INSTITUTE_NAME = '"
							+ request.getParameter("insnam") + "'and INSTITUTE_CODE = '"+ request.getParameter("inscode") + "'and REPORT_DATE ='" + df1.formatdate(request.getParameter("reportsd"))+"')");

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
				
			
				sql2.append("update  FIM1000_MOD_TABLE set REPORT_REF_NO ='" + ReporefSeq + "',INSTITUTE_NAME ='"
						+ NullCheck.isNotNull(request.getParameter("insnam")) + "',INSTITUTE_CODE ='" +NullCheck.isNotNull( request.getParameter("inscode"))
						+ "',TRAN_NATURE ='" + NullCheck.isNotNull(request.getParameter("trannat")) + "',TRAN_CRNCY ='"
						+ NullCheck.isNotNull(request.getParameter("trancur")) + "',TRAN_TYPE ='"+ NullCheck.isNotNull(request.getParameter("trantyp"))
						+ "',TRAN_AMT ='" +request.getParameter("tranamt")
						+ "',INT_START_DATE ='"
						+ NullCheck.isNotNull(df1.formatdate(request.getParameter("instdate")) )+ "',INT_END_DATE ='" +NullCheck.isNotNull(df1.formatdate( request.getParameter("inendate")))
						+ "',INT_RATE ='" +NullCheck.isNotNull( request.getParameter("inrate")) + "',REMARKS ='"
						+ NullCheck.isNotNull(request.getParameter("rem")) + "',REPORT_DATE ='"+NullCheck.isNotNull( df1.formatdate(request.getParameter("reportsd")))
						+ "' where INSTITUTE_NAME ='" + NullCheck.isNotNull(request.getParameter("insnam")) +"'and INSTITUTE_CODE ='" + NullCheck.isNotNull(request.getParameter("inscode")) +"' and  REPORT_REF_NO ='" + ReporefSeq + "'and REPORT_DATE ='" + df1.formatdate(request.getParameter("reportsd"))+"'");
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
						"INSERT INTO FIM1000_MOD_TABLE(REPORT_REF_NO,INSTITUTE_NAME,INSTITUTE_CODE,TRAN_NATURE,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,INT_START_DATE,INT_END_DATE,INT_RATE,REMARKS,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
								+ "values('" + ReporefSeq + "','" + request.getParameter("insnam") + "','"
								+ request.getParameter("inscode") + "','" 
								+ request.getParameter("trannat") + "','"
								+ request.getParameter("trancur") + "','" 
								+ request.getParameter("trantyp") + "','"
								+ request.getParameter("tranamt") + "','" 
								+df1.formatdate(request.getParameter("instdate")) + "','"
								+ df1.formatdate(request.getParameter("inendate")) + "','"
								+ request.getParameter("inrate") + "','" 
								+ request.getParameter("rem") + "','"
								+ df1.formatdate(request.getParameter("reportsd")) + "','" + session.getAttribute("userName")
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
	
	
	public String sum1FIM1000detail() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("in summaryFIM1000detail");

		log.info("test----->" + request.getParameter("reportrefnos") + "dt333"
				+ df.formatdate(request.getParameter("dt1")) + df.formatdate(request.getParameter("dt2")));
		XBRLFIM1000Dao bsd = new XBRLFIM1000Dao();
		ArrayList<XBRLFIM1000Bean> arl = bsd.xbrlfimsumEP1(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		// summarystandard = arl.toArray(new String[arl.size()]);
		log.info("ARL------------>" + arl.size());
		Gson gson = new Gson();
		sum1FIM1000 = gson.toJson(arl);

		return "success";

	}
public String summaryFIM1000detail() {

	HttpServletRequest request = ServletActionContext.getRequest();
	DateFormat df = new DateFormat();
	log.info("in summaryFIM1000detail");

	log.info("test----->" + request.getParameter("reportrefnos") + "dt333"
			+ df.formatdate(request.getParameter("dt1")) + df.formatdate(request.getParameter("dt2")));
	XBRLFIM1000Dao bsd = new XBRLFIM1000Dao();
	ArrayList<XBRLFIM1000Bean> arl = bsd.xbrlfimsumEP2(request.getParameter("repname"),request.getParameter("instno"),
			request.getParameter("ReporefSeq"),
			df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));
	// summarystandard = arl.toArray(new String[arl.size()]);
	log.info("ARL------------>" + arl.size());
	Gson gson = new Gson();
	summaryFIM1000 = gson.toJson(arl);

	return "success";

}
public String detailFIM1000() {

	HttpServletRequest request = ServletActionContext.getRequest();
	DateFormat df = new DateFormat();
	
	
	XBRLFIM1000Dao bsd = new XBRLFIM1000Dao();

	ArrayList<XBRLFIM1000Bean> arl = bsd.xbrlfimajaxdetails(request.getParameter("repname"),
			request.getParameter("ReporefSeq"), request.getParameter("instno"),
			df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

	// summarystandard = arl.toArray(new String[arl.size()]);
	
	Gson gson = new Gson();
	dtlFIM1000 = gson.toJson(arl);

	return "success";

}

}
