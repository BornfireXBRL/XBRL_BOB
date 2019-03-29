package action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;

import basecode.DateFormat;
import bean.XBRLFIM0200Bean;
import bean.XBRLFIM0100Bean;
import bean.XBRLFIM0200Bean;
import dao.XBRLFIM0200Dao;
import dao.XBRLFIM0100Dao;
import dao.XBRLFIM0200Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;


/**
 * @companyName : 		 		Bonfire Innovation Private Limited Chennai
 * @project :    		 		Extensible Business Reporting Language (XBRL)
 * @name :       		 		XBRLFIM0200Action.java
 * @path :         		 		action
 * @author :       		 		D PraveenBabu
 * @version : 					1.0
 * @functionality :		 		It contains the action with multiple methods to create FIM0200 Report.
 * @relatedScripts : 	 		bean.XBRLFIM0200Bean.java,dao.XBRLFIM0200Dao.java 
 * @creationDate :				
 * @lastModifiedDate :			
 * @modificationHistory : 		

*/

public class XBRLFIM0200Action {
	static Logger log = Logger.getLogger(XBRLFIM0200Action.class);

	public String dashdata[];
	public String REPFIM0200;
	public String refno;
	
public String detFIM0200;
public String resalert;



public String getDetFIM0200() {
	return detFIM0200;
}







public void setDetFIM0200(String detFIM0200) {
	this.detFIM0200 = detFIM0200;
}







public String getResalert() {
	return resalert;
}







public void setResalert(String resalert) {
	this.resalert = resalert;
}







public String getRefno() {
		return refno;
	}







	public void setRefno(String refno) {
		this.refno = refno;
	}







public String[] getDashdata() {
		return dashdata;
	}







	public void setDashdata(String[] dashdata) {
		this.dashdata = dashdata;
	}







	public String getREPFIM0200() {
		return REPFIM0200;
	}







	public void setREPFIM0200(String rEPFIM0200) {
		REPFIM0200 = rEPFIM0200;
	}


	public String summaryFIM0200;
	public String sumFIM0200;

	public String detailFIM0200;










public String getSumFIM0200() {
		return sumFIM0200;
	}







	public void setSumFIM0200(String sumFIM0200) {
		this.sumFIM0200 = sumFIM0200;
	}







public String getDetailFIM0200() {
		return detailFIM0200;
	}







	public void setDetailFIM0200(String detailFIM0200) {
		this.detailFIM0200 = detailFIM0200;
	}







public String getSummaryFIM0200() {
		return summaryFIM0200;
	}







	public void setSummaryFIM0200(String summaryFIM0200) {
		this.summaryFIM0200 = summaryFIM0200;
	}








public String summary1FIM0200detail() {

	HttpServletRequest request = ServletActionContext.getRequest();
	DateFormat df = new DateFormat();
	log.info("in summaryFIM0200detail");

	log.info("test----->" + request.getParameter("reportrefnos") + "dt333"
			+ df.formatdate(request.getParameter("dt1")) + df.formatdate(request.getParameter("dt2")));
	XBRLFIM0200Dao bsd = new XBRLFIM0200Dao();
	ArrayList<XBRLFIM0200Bean> arl = bsd.xbrl1fimsumEP(df.formatdate(request.getParameter("dt1")),
			df.formatdate(request.getParameter("dt2")), request.getParameter("reportrefnos"),request.getParameter("curr"));

	// summarystandard = arl.toArray(new String[arl.size()]);
	log.info("ARL------------>" + arl.size());
	Gson gson = new Gson();
	summaryFIM0200 = gson.toJson(arl);

	return "success";

}

public String summaryFIM0200detail() {

	HttpServletRequest request = ServletActionContext.getRequest();
	DateFormat df = new DateFormat();
	log.info("in summaryFIM0200detail");

	log.info("test----->" + request.getParameter("reportrefnos") + "dt333"
			+ df.formatdate(request.getParameter("dt1")) + df.formatdate(request.getParameter("dt2")));
	XBRLFIM0200Dao bsd = new XBRLFIM0200Dao();
	ArrayList<XBRLFIM0200Bean> arl = bsd.xbrlfimsumEP(df.formatdate(request.getParameter("dt1")),
			df.formatdate(request.getParameter("dt2")), request.getParameter("reportrefnos"),request.getParameter("curr"));

	// summarystandard = arl.toArray(new String[arl.size()]);
	log.info("ARL------------>" + arl.size());
	Gson gson = new Gson();
	sumFIM0200 = gson.toJson(arl);

	return "success";

}


public String detailFIM0200() {

	HttpServletRequest request = ServletActionContext.getRequest();
	DateFormat df = new DateFormat();
	
	
	XBRLFIM0200Dao bsd = new XBRLFIM0200Dao();

	ArrayList<XBRLFIM0200Bean> arl = bsd.xbrlfimajaxdetails(request.getParameter("repname"),
			request.getParameter("ReporefSeq"), request.getParameter("instno"),
			df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

	// summarystandard = arl.toArray(new String[arl.size()]);
	
	Gson gson = new Gson();
	detailFIM0200 = gson.toJson(arl);

	return "success";

}
public String modXbBLSCreate200() throws SQLException {

	log.info("XBRL XBRL XBRL");

	String status = "";
	String status1 = "";

	HttpServletRequest request = ServletActionContext.getRequest();
	String ReporefSeq = "0";
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
	log.info("insert Action modXbCreateBLS0100");

	/*log.info("NEW FLG:" + newFlg);

	// for Inserting new record

	// for new Reference id
	if (newFlg.equals('Y'))

	{
	
		sql.append("INSERT INTO FIM0200_MOD_TABLE(REPORT_REF_NO,INSTITUTE_NAME,INSTITUTE_CODE,PUR_CRNCY,PUR_AMT,SALE_CRNCY,SALE_AMT,RATE,VALUE_DATE,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
		                 +"values('" + ReporefSeq + "','" + request.getParameter("instinamed")
		                 + "','" + request.getParameter("insticoded") + "','" + request.getParameter("purcrncyd") + "','"
							+ request.getParameter("puramtd") + "','"+ request.getParameter("salecrncyd") + "','"
									+ request.getParameter("saleamtd") + "','"+ request.getParameter("rated") + "','"
					+df.formatdate(request.getParameter("valuedated"))+ "','"
				          +df1.formatdate(request.getParameter("dt2"))+ "','" + session.getAttribute("userName")
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

	}*/

	// for old Reference id
	/*else {*/
	log.info("njhjhjjk");
		int rowcount = 0;
		sql.append("SELECT COUNT(*) as count FROM FIM0200_MOD_TABLE WHERE REPORT_DATE='" + df1.formatdate(request.getParameter("dt2")) + "' "
				+" AND  INSTITUTE_NAME='"
				 + request.getParameter("instinamed") + "' ");
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
			sql2.append("UPDATE FIM0200_MOD_TABLE SET INSTITUTE_CODE='" + request.getParameter("insticoded")
			+ "', PUR_CRNCY='" + request.getParameter("purcrncyd")
			+ "', PUR_AMT ='" + request.getParameter("puramtd")
			+ "', SALE_CRNCY ='" + request.getParameter("salecrncyd")
			+ "', SALE_AMT ='" + request.getParameter("saleamtd")
			+ "', RATE  ='" + request.getParameter("rated")
			+ "', VALUE_DATE='" + df1.formatdate(request.getParameter("valuedated")) + "' ,DEL_FLG='M' "
			+ "WHERE  REPORT_DATE='"
			+ df1.formatdate(request.getParameter("dt2")) + "' " + "AND INSTITUTE_NAME='"
			+ request.getParameter("instinamed")
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

			sql3.append("INSERT INTO FIM0200_MOD_TABLE(REPORT_REF_NO,INSTITUTE_NAME,INSTITUTE_CODE,PUR_CRNCY,PUR_AMT,SALE_CRNCY,SALE_AMT,RATE,VALUE_DATE,DEL_FLG,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
	                 +"values('" + ReporefSeq + "','" + request.getParameter("instinamed")
	                 + "','" + request.getParameter("insticoded") + "','" + request.getParameter("purcrncyd") + "','"
						+ request.getParameter("puramtd") + "','"+ request.getParameter("salecrncyd") + "','"
								+ request.getParameter("saleamtd") + "','"+ request.getParameter("rated") + "','"
				+df.formatdate(request.getParameter("valuedated"))+ "','"+ request.getParameter("modtyp") + "','"
			          +df1.formatdate(request.getParameter("dt2"))+ "','" + session.getAttribute("userName")
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

	

	//return "success";
return status;
}
public String fim0200verify() {
	log.info("ddddddddddd");
		XBRLFIM0200Dao bsd = new XBRLFIM0200Dao();
		ArrayList<XBRLFIM0200Bean> arr=new ArrayList<XBRLFIM0200Bean>();
		arr=bsd.FIM0200verify();
		Gson gson = new Gson();
		detFIM0200 = gson.toJson(arr);
		return "success";
	}
	public String FIM0200vermaster() {
		String status="";
		XBRLFIM0200Dao bsd = new XBRLFIM0200Dao();
		HttpServletRequest request = ServletActionContext.getRequest();
		status=bsd.FIM0200verifymaster();
		
		if(status.equals("success")) {
			resalert="Verification Successful";
		}else {
			resalert="Technical Issue.Try Again Later.";
		}
		
		return "success";
	}
	
}
