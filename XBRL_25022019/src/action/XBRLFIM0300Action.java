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
import bean.XBRLBLS0106Bean;
import bean.XBRLFIM0300Bean;
import bean.XBRLFIM0300Bean;
import dao.XBRLBLS0106Dao;
import dao.XBRLFIM0300Dao;
import dao.XBRLFIM0300Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
/**
 * @companyName : 		 		Bonfire Innovation Private Limited Chennai
 * @project :    		 		Extensible Business Reporting Language (XBRL)
 * @name :       		 		XBRLFIM0300Action.java
 * @path :         		 		action
 * @author :       		 		D PraveenBabu
 * @version : 					1.0
 * @functionality :		 		It contains the action with multiple methods to create FIM0300 Report.
 * @relatedScripts : 	 		bean.XBRLFIM0300Bean.java,dao.XBRLFIM0300Dao.java 
 * @creationDate :				
 * @lastModifiedDate :			
 * @modificationHistory : 		

*/


public class XBRLFIM0300Action {
	
	static Logger log = Logger.getLogger(XBRLFIM0300Action.class);
	
	public String REPFIM0300;
	
	public String detFIM0300;
	
	 public String summaryFIM0300;
		public String refno;

		public String getRefno() {
				return refno;
			}

			public void setRefno(String refno) {
				this.refno = refno;
			}

public String getSummaryFIM0300() {
		return summaryFIM0300;
	}


	public void setSummaryFIM0300(String summaryFIM0300) {
		this.summaryFIM0300 = summaryFIM0300;
	}




public String getDetFIM0300() {
		return detFIM0300;
	}


	public void setDetFIM0300(String detFIM0300) {
		this.detFIM0300 = detFIM0300;
	}


public String getREPFIM0300() {
		return REPFIM0300;
	}


	public void setREPFIM0300(String rEPFIM0300) {
		REPFIM0300 = rEPFIM0300;
	}



public String modXbFIM3Create() throws SQLException {

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
	log.info("insert Action modXbCreateBLS0100");

	/*log.info("NEW FLG:" + newFlg);

	// for Inserting new record

	// for new Reference id
	if (newFlg.equals('Y'))

	{
	
		sql.append("INSERT INTO FIM0300_MOD_TABLE(REPORT_REF_NO,COUNTRY_CODE,CURRENCY_CODE,UNITS,TTB_RATE,TCB_RATE,NTB_RATE,TTS_RATE,NTS_RATE,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
		                 +"values('" + ReporefSeq + "','" + request.getParameter("country")
				          + "','" + request.getParameter("currencycode") + "','" + request.getParameter("units") + "','"
				           + request.getParameter("ttbrate") + "','" + request.getParameter("tcbrate") + "','"
					      	+request.getParameter("ntbrate")+ "','"+ request.getParameter("ttsrate") + "','"
							+ request.getParameter("ntcrate") + "','"
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

	}

	// for old Reference id
	else {*/

		int rowcount = 0;
		sql.append("SELECT COUNT(*) as count FROM FIM0300_MOD_TABLE WHERE REPORT_REF_NO='" + ReporefSeq
				+ "' AND REPORT_DATE='" + df1.formatdate(request.getParameter("dt2")) + "' " + "AND COUNTRY_CODE='"
				 + request.getParameter("country") + "' ");
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
			sql2.append("UPDATE FIM0300_MOD_TABLE SET CURRENCY_CODE='" + request.getParameter("currencycode")
			+ "', UNITS ='" + request.getParameter("units")
			+ "', TTB_RATE='" + request.getParameter("ttbrate")
			+ "', TCB_RATE ='" + request.getParameter("tcbrate")
			+ "', NTB_RATE ='" + request.getParameter("ntbrate")
			+ "', TTS_RATE ='" +request.getParameter("ttsrate")
			+ "', NTS_RATE  ='" + request.getParameter("ntcrate") + "',DEL_FLG='M' "

			+ "WHERE  REPORT_DATE='"
			+ df1.formatdate(request.getParameter("dt2")) + "' " + "AND COUNTRY_CODE='"
			+ request.getParameter("country")
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

			sql3.append("INSERT INTO FIM0300_MOD_TABLE(REPORT_REF_NO,COUNTRY_CODE,CURRENCY_CODE,UNITS,TTB_RATE,TCB_RATE,NTB_RATE,TTS_RATE,NTS_RATE,REPORT_DATE,DEL_FLG,LCHG_USER_ID,LCHG_TIME)"
	                 +"values('" + ReporefSeq + "','" + request.getParameter("country")
			          + "','" + request.getParameter("currencycode") + "','" + request.getParameter("units") + "','"
			           + request.getParameter("ttbrate") + "','" + request.getParameter("tcbrate") + "','"
				      	+request.getParameter("ntbrate")+ "','"+ request.getParameter("ttsrate") + "','"
						+ request.getParameter("ntcrate") + "','"
			          +df1.formatdate(request.getParameter("dt2"))+ "','"+request.getParameter("modtyp")+"','" + session.getAttribute("userName")
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

	//}

		return "success";

}

/* --------------- SUMMARY BUTTOn CLICK --------------------------- */


public String detailFIM0300() {

	HttpServletRequest request = ServletActionContext.getRequest();
	DateFormat df = new DateFormat();
	
	
	XBRLFIM0300Dao fim = new XBRLFIM0300Dao();

	ArrayList<XBRLFIM0300Bean> arl =fim.xbrlFIM0300ajaxdetails(request.getParameter("repname"),request.getParameter("ReporefSeq"),
			request.getParameter("instno"),df.formatdate(request.getParameter("dt2")), request.getParameter("curr"));

	// summarystandard = arl.toArray(new String[arl.size()]);
	
	Gson gson = new Gson();
	detFIM0300 = gson.toJson(arl);

	return "success";

}

public String ver;
public static Logger getLog() {
		return log;
	}

	public static void setLog(Logger log) {
		XBRLFIM0300Action.log = log;
	}

	public String getVer() {
		return ver;
	}

	public void setVer(String ver) {
		this.ver = ver;
	}


public String FIM0300verify() {
	log.info("ddddddddddd");
		XBRLFIM0300Dao bsd = new XBRLFIM0300Dao();
		ArrayList<XBRLFIM0300Bean> arr=new ArrayList<XBRLFIM0300Bean>();
		arr=bsd.FIM0300verify();
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


public String FIM0300vermaster() {
	String status="";
	XBRLFIM0300Dao bsd = new XBRLFIM0300Dao();
	HttpServletRequest request = ServletActionContext.getRequest();
	status=bsd.FIM0300verifymaster();
	
	if(status.equals("success")) {
		resalert="Verification Successful";
	}else {
		resalert="Technical Issue.Try Again Later.";
	}
	
	return "success";
}

}
