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
import bean.XBRLFIM0500Bean;
import bean.XBRLFIM0500Bean;
import dao.XBRLFIM0500Dao;
import dao.XBRLFIM0500Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;

/**
 * @companyName : 		 		Bonfire Innovation Private Limited Chennai
 * @project :    		 		Extensible Business Reporting Language (XBRL)
 * @name :       		 		XBRLFIM0500Action.java
 * @path :         		 		action
 * @author :       		 		D PraveenBabu
 * @version : 					1.0
 * @functionality :		 		It contains the action with multiple methods to create FIM0500 Report.
 * @relatedScripts : 	 		bean.XBRLFIM0500Bean.java,dao.XBRLFIM0500Dao.java 
 * @creationDate :				
 * @lastModifiedDate :			
 * @modificationHistory : 		

*/


public class XBRLFIM0500Action {
	
	static Logger log = Logger.getLogger(XBRLFIM0500Action.class);
	
	public String dashdata[];
	public String refno;
	public String dtlFIM0500;

public String getDtlFIM0500() {
		return dtlFIM0500;
	}

	public void setDtlFIM0500(String dtlFIM0500) {
		this.dtlFIM0500 = dtlFIM0500;
	}
public String summaryFIM0500;

public String sumFIM0500;



	public String getSumFIM0500() {
	return sumFIM0500;
}

public void setSumFIM0500(String sumFIM0500) {
	this.sumFIM0500 = sumFIM0500;
}

	public String getSummaryFIM0500() {
	return summaryFIM0500;
}

public void setSummaryFIM0500(String summaryFIM0500) {
	this.summaryFIM0500 = summaryFIM0500;
}

	public String[] getDashdata() {
		return dashdata;
	}

	public void setDashdata(String[] dashdata) {
		this.dashdata = dashdata;
	}

public String getRefno() {
		return refno;
	}

	public void setRefno(String refno) {
		this.refno = refno;
	}

	/*	modXbFIMCreate500*/
	public String modXbFIMCreate500() throws SQLException {

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
		log.info("insert Action modXbCreateBLS0100");

		log.info("NEW FLG:" + newFlg);

		// for Inserting new record

		// for new Reference id
		if (newFlg.equals('Y'))

		{
		
			sql.append("INSERT INTO FIM0500_S2_MOD_TABLE(REPORT_REF_NO,TRAN_TYPE,FCY_CRNCY,TRAN_AMT,INSTITUTE_ID,INSTITUTE_NAME,SECTOR,SPOT_RATE,FWD_RATE,FWD_DATE,REPORT_DATE,REPORTING_TIME,LCHG_USER_ID,LCHG_TIME)"
			                 +"values('" + ReporefSeq + "','" + request.getParameter("trantype")
					          + "','" + request.getParameter("fcy") + "','" + request.getParameter("amt") + "','"
					           + request.getParameter("cntrptyuqid") + "','" + request.getParameter("cntrptynme") + "','"
						      	+ request.getParameter("sector") + "','"+ request.getParameter("sptrt") + "','"
								+ request.getParameter("fwdrt") + "','"+ df1.formatdate(request.getParameter("fwddt")) + "','"
							    + df1.formatdate(request.getParameter("dt2")) + "','"
					          +request.getParameter("rtime")+ "','" + session.getAttribute("userName")
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

			int rowcount = 0;
			sql.append("SELECT COUNT(*) as count FROM FIM0500_S2_MOD_TABLE WHERE REPORT_REF_NO='" + ReporefSeq
					+ "' AND REPORT_DATE='" + df1.formatdate(request.getParameter("dt2")) + "' " + "AND REPORTING_TIME='"
					 + request.getParameter("rtime") + "' " + "AND SECTOR='"
					 + request.getParameter("sector")
					 + "' ");
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
				sql2.append("UPDATE FIM0500_S2_MOD_TABLE SET TRAN_TYPE='" + request.getParameter("trantype")
				+ "', FCY_CRNCY ='" + request.getParameter("fcy")
				+ "', TRAN_AMT='" + request.getParameter("amt")
				+ "', INSTITUTE_ID ='" + request.getParameter("cntrptyuqid")
				+ "', INSTITUTE_NAME ='" + request.getParameter("cntrptynme")
				+ "', SPOT_RATE ='" +request.getParameter("sptrt")
				+ "', FWD_RATE  ='" + request.getParameter("fwdrt")
				+ "', FWD_DATE='" + df1.formatdate(request.getParameter("fwddt")) + "' "
				+ "WHERE REPORT_REF_NO='" + ReporefSeq + "' AND REPORT_DATE='"
				+ df1.formatdate(request.getParameter("dt2")) + "' " + "AND REPORTING_TIME='"
				+ request.getParameter("rtime")+ "' " + "AND SECTOR='"
				+ request.getParameter("sector")
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

				sql3.append("INSERT INTO FIM0500_S2_MOD_TABLE(REPORT_REF_NO,TRAN_TYPE,FCY_CRNCY,TRAN_AMT,INSTITUTE_ID,INSTITUTE_NAME,SECTOR,SPOT_RATE,FWD_RATE,FWD_DATE,REPORT_DATE,REPORTING_TIME,LCHG_USER_ID,LCHG_TIME)"
		                 +"values('" + ReporefSeq + "','" + request.getParameter("trantype")
				          + "','" + request.getParameter("fcy") + "','" + request.getParameter("amt") + "','"
				           + request.getParameter("cntrptyuqid") + "','" + request.getParameter("cntrptynme") + "','"
					      	+ request.getParameter("sector") + "','"+ request.getParameter("sptrt") + "','"
							+ request.getParameter("fwdrt") + "','"+ df1.formatdate(request.getParameter("fwddt")) + "','"
						    + df1.formatdate(request.getParameter("dt2")) + "','"
				          +request.getParameter("rtime")+ "','" + session.getAttribute("userName")
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

		}

		//return "success";
	return status;
	}
public String sumFIM0500detail() {

	HttpServletRequest request = ServletActionContext.getRequest();
	DateFormat df = new DateFormat();
	log.info("in summaryFIM0500detail  sec1");

	log.info("test----->" + request.getParameter("reportrefnos") + "dt333"
			+ df.formatdate(request.getParameter("dt1")) + df.formatdate(request.getParameter("dt2")));
	XBRLFIM0500Dao bsd = new XBRLFIM0500Dao();
	ArrayList<XBRLFIM0500Bean> arl = bsd.xbrlfimsEP(df.formatdate(request.getParameter("dt1")),
			df.formatdate(request.getParameter("dt2")), request.getParameter("reportrefnos"),request.getParameter("curr"),request.getParameter("rtime"));

	// summarystandard = arl.toArray(new String[arl.size()]);
	log.info("ARL------------>" + arl.size());
	Gson gson = new Gson();
	sumFIM0500 = gson.toJson(arl);

	return "success";

}
public String summaryFIM0500detail() {

	HttpServletRequest request = ServletActionContext.getRequest();
	DateFormat df = new DateFormat();
	log.info("in summaryFIM0500detail");

	log.info("test----->" + request.getParameter("reportrefnos") + "dt333"
			+ df.formatdate(request.getParameter("dt1")) + df.formatdate(request.getParameter("dt2")));
	XBRLFIM0500Dao bsd = new XBRLFIM0500Dao();
	ArrayList<XBRLFIM0500Bean> arl = bsd.xbrlfimsumEP(df.formatdate(request.getParameter("dt1")),
			df.formatdate(request.getParameter("dt2")), request.getParameter("reportrefnos"),request.getParameter("curr"),request.getParameter("rtime"));

	// summarystandard = arl.toArray(new String[arl.size()]);
	log.info("ARL------------>" + arl.size());
	Gson gson = new Gson();
	summaryFIM0500 = gson.toJson(arl);

	return "success";

}
public String detailFIM0500() {

	HttpServletRequest request = ServletActionContext.getRequest();
	DateFormat df = new DateFormat();
	
	
	XBRLFIM0500Dao bsd = new XBRLFIM0500Dao();

	ArrayList<XBRLFIM0500Bean> arl = bsd.xbrlfimajaxdetails(request.getParameter("repname"),
			request.getParameter("ReporefSeq"), request.getParameter("instno"),
			df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"),request.getParameter("rtime"));

	// summarystandard = arl.toArray(new String[arl.size()]);
	
	Gson gson = new Gson();
	dtlFIM0500 = gson.toJson(arl);

	return "success";

}

}
