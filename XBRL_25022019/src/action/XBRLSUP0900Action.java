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
import bean.XBRLSUP0900Bean;
import dao.XBRLSUP0900Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;

/**
 * @companyName : 		 		Bonfire Innovation Private Limited Chennai
 * @project :    		 		Extensible Business Reporting Language (XBRL)
 * @name :       		 		XBRLSUP0900Action.java
 * @path :         		 		action
 * @author :       		 		VINOTH KUMAR
 * @version : 					1.0
 * @functionality :		 		It contains the action with multiple methods to create SUP0900 Report.
 * @relatedScripts : 	 		bean.XBRLSUP0900Bean.java,dao.XBRLSUP0900Dao.java 
 * @creationDate :				
 * @lastModifiedDate :			
 * @modificationHistory : 		

*/


public class XBRLSUP0900Action {
	
	static Logger log = Logger.getLogger(XBRLSUP0900Action.class);
	
	public String dashdata[];
	public String reporefeno;
	public String dtlSUP0900;
	public String refno;


public String sumSUP0900;
  
public String summarySUP0900;



	public String getDtlSUP0900() {
	return dtlSUP0900;
}

public void setDtlSUP0900(String dtlSUP0900) {
	this.dtlSUP0900 = dtlSUP0900;
}

public String getRefno() {
	return refno;
}

public void setRefno(String refno) {
	this.refno = refno;
}

public String getSumSUP0900() {
	return sumSUP0900;
}

public void setSumSUP0900(String sumSUP0900) {
	this.sumSUP0900 = sumSUP0900;
}

public String getSummarySUP0900() {
	return summarySUP0900;
}

public void setSummarySUP0900(String summarySUP0900) {
	this.summarySUP0900 = summarySUP0900;
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


public String summarySUP0900detail() {

	HttpServletRequest request = ServletActionContext.getRequest();
	DateFormat df = new DateFormat();
	log.info("in summary11SUP0900detail");

	log.info("test----->" + request.getParameter("reptype") + "dt333"
			+ df.formatdate(request.getParameter("dt1")) + df.formatdate(request.getParameter("dt2")));
	XBRLSUP0900Dao bsd = new XBRLSUP0900Dao();
	ArrayList<XBRLSUP0900Bean> arl = bsd.xbrl1supsums1(request.getParameter("repname"),request.getParameter("instno"),
			request.getParameter("ReporefSeq"),
			df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

	// summarystandard = arl.toArray(new String[arl.size()]);
	log.info("ARL------------>" + arl.size());
	Gson gson = new Gson();
	sumSUP0900 = gson.toJson(arl);

	return "success";

}

public String detailSUP0900() {

	HttpServletRequest request = ServletActionContext.getRequest();
	DateFormat df = new DateFormat();
	
	
	XBRLSUP0900Dao bsd = new XBRLSUP0900Dao();

	ArrayList<XBRLSUP0900Bean> arl = bsd.xbrlsup0900details(request.getParameter("reptype"),
			request.getParameter("ReporefSeq"), request.getParameter("instno"),
			df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));
	// summarystandard = arl.toArray(new String[arl.size()]);
	
	Gson gson = new Gson();
	dtlSUP0900 = gson.toJson(arl);

	return "success";
	

}


public String modXbSUPCreate900() throws SQLException {

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
	log.info("insert Action modXbSUPCreate900");

	log.info("NEW FLG:" + newFlg);

	// for Inserting new record

	// for new Reference id
	if (newFlg.equals('Y'))

	{
		
		sql.append(
				"INSERT INTO SUP0900_MOD_TABLE(REPORT_REF_NO,TYPE_OF_EVENT,INSTANCE_CODE,CF_LOSS,CF_INSURE,TRADE_LOSS,TRADE_INSURE,RETAIL_LOSS,RETAIL_INSURE,CB_LOSS,CB_INSURE,PS_LOSS,PS_INSURE,AG_LOSS,AG_INSURE,AM_LOSS,AM_INSURE,RB_LOSS,RB_INSURE,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
						+ "values('" + ReporefSeq + "','" + request.getParameter("tyeve")
						+ "','" + request.getParameter("inco") + "','"
						+ request.getParameter("cfl") + "','" 
						+ request.getParameter("cfi") + "','"
						+ request.getParameter("cfl1") + "','" 
						+ request.getParameter("cfi1") + "','"
						+ request.getParameter("cfl2") + "','" 
				    	+ request.getParameter("cfi2") + "','"
						+ request.getParameter("cfl3") + "','" 
						+ request.getParameter("cfi3") + "','"
						+ request.getParameter("cfl4") + "','" 
												+ request.getParameter("cfi4") + "','"
														+ request.getParameter("cfl5") + "','" 
														+ request.getParameter("cfi5") + "','"
																+ request.getParameter("cfl6") + "','" 
																+ request.getParameter("cfi6") + "','"
																		+ request.getParameter("cfl7") + "','" 
																		+ request.getParameter("cfi7") + "','"
						+df1.formatdate(request.getParameter("redat"))+ "','" + session.getAttribute("userName")
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
				"SELECT Count (*) as count FROM   (SELECT DISTINCT REPORT_DATE FROM  SUP0900_MOD_TABLE where REPORT_REF_NO='"
						+ ReporefSeq.trim() + "'and TYPE_OF_EVENT = '"
						+ request.getParameter("tyeve") + "'and INSTANCE_CODE = '"+ request.getParameter("inco") + "'and REPORT_DATE ='" + df1.formatdate(request.getParameter("redat"))+"')");

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
			
		
			sql2.append("update  SUP0900_MOD_TABLE set REPORT_REF_NO ='" + ReporefSeq + "',CF_LOSS ='"
					+ NullCheck.isNotNull(request.getParameter("cfl")) 
					+ "', CF_INSURE ='" +NullCheck.isNotNull( request.getParameter("cfi"))
					+ "', TRADE_LOSS='" + NullCheck.isNotNull( request.getParameter("cfl1"))
					+ "', TRADE_INSURE='" + NullCheck.isNotNull( request.getParameter("cfi1"))
					+ "', RETAIL_LOSS='" + NullCheck.isNotNull( request.getParameter("cfl2"))
					+ "', RETAIL_INSURE='" + NullCheck.isNotNull( request.getParameter("cfi2"))
					+ "', CB_LOSS='" + NullCheck.isNotNull( request.getParameter("cfl3"))
					+ "', CB_INSURE='" + NullCheck.isNotNull( request.getParameter("cfi3"))
					+ "', PS_LOSS='" + NullCheck.isNotNull( request.getParameter("cfl4"))
					+ "', PS_INSURE='" + NullCheck.isNotNull( request.getParameter("cfi4"))
					+ "', AG_LOSS='" + NullCheck.isNotNull( request.getParameter("cfl5"))
					+ "', AG_INSURE='" + NullCheck.isNotNull( request.getParameter("cfi5"))
					+ "', AM_LOSS='" + NullCheck.isNotNull( request.getParameter("cfl6"))
					+ "', AM_INSURE='" + NullCheck.isNotNull( request.getParameter("cfi6"))
					+ "', RB_LOSS='" + NullCheck.isNotNull( request.getParameter("cfl7"))
					+ "', RB_INSURE='" +  NullCheck.isNotNull(request.getParameter("cfi7"))
					+ "' where TYPE_OF_EVENT ='" + NullCheck.isNotNull(request.getParameter("tyeve")) +"'and REPORT_DATE ='" + df1.formatdate(request.getParameter("redat"))+"'");
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
					"INSERT INTO SUP0900_MOD_TABLE(REPORT_REF_NO,TYPE_OF_EVENT,INSTANCE_CODE,CF_LOSS,CF_INSURE,TRADE_LOSS,TRADE_INSURE,RETAIL_LOSS,RETAIL_INSURE,CB_LOSS,CB_INSURE,PS_LOSS,PS_INSURE,AG_LOSS,AG_INSURE,AM_LOSS,AM_INSURE,RB_LOSS,RB_INSURE,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
							+ "values('" + ReporefSeq + "','" + request.getParameter("tyeve")
							+ "','" + request.getParameter("inco") + "','"
							+ request.getParameter("cfl") + "','" 
							+ request.getParameter("cfi") + "','"
							+ request.getParameter("cfl1") + "','" 
							+ request.getParameter("cfi1") + "','"
							+ request.getParameter("cfl2") + "','" 
					    	+ request.getParameter("cfi2") + "','"
							+ request.getParameter("cfl3") + "','" 
							+ request.getParameter("cfi3") + "','"
							+ request.getParameter("cfl4") + "','" 
													+ request.getParameter("cfi4") + "','"
															+ request.getParameter("cfl5") + "','" 
															+ request.getParameter("cfi5") + "','"
																	+ request.getParameter("cfl6") + "','" 
																	+ request.getParameter("cfi6") + "','"
																			+ request.getParameter("cfl7") + "','" 
																			+ request.getParameter("cfi7") + "','"
							+df1.formatdate(request.getParameter("redat"))+ "','" + session.getAttribute("userName")
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

			log.info("execued");
			refno = ReporefSeq;

			// String stat = bop0300add(ReporefSeq);

			refno = ReporefSeq;
		}

	}

	//return "success";
return status;
}
}
