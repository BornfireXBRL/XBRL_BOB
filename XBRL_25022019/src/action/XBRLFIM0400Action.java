package action;



/****************************************************************************************************************
*																												*
* 	* @companyName 			:	Bonfire Innovation Private Limited Chennai										*
* 	* @project 				:	Extensible Business Reporting Language (XBRL)									*
* 	* @name 				:	XBRLSUP1400Action.java															*
* 	* @path 				:	action																			*
* 	* @author 				:	D PraveenBabu																	*
* 	* @version 				: 	1.0																				*
* 	* @functionality 		:	It contains the action with multiple methods to create SUP01400 Report.													*
* 	* @relatedScripts 		: 	bean.XBRLSUP1400Bean.java,dao.XBRLSUP1400Dao.java 								*
* 	* @creationDate 		:																					*
* 	* @lastModifiedDate 	:																					*
* 	* @modificationHistory 	: 																					*
*																												*
****************************************************************************************************************/

import java.sql.CallableStatement;
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

import com.google.gson.Gson;

import basecode.DateFormat;
import bean.XBRLBLS0106Bean;
import bean.XBRLFIM0400Bean;
import dao.XBRLBLS0106Dao;
import dao.XBRLFIM0400Dao;

import bean.XBRLReportMasterBean;
import utilities.ConnectionManager;
import utilities.NullCheck;

import org.apache.log4j.Logger;

public class XBRLFIM0400Action {
	
	static Logger log = Logger.getLogger(XBRLFIM0400Action.class);
	
	public String refno;
	


	 public String resalert;


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
	public String Reporef;
	
	

	
	public String getReporef() {
		return Reporef;
	}

	public void setReporef(String reporef) {
		Reporef = reporef;
	}

	public String detFIM0400;
	public String summaryFIM0400;
	
	
	
	
	
	public String getDetFIM0400() {
		return detFIM0400;
	}

	public void setDetFIM0400(String detFIM0400) {
		this.detFIM0400 = detFIM0400;
	}

	public String getSummaryFIM0400() {
		return summaryFIM0400;
	}

	public void setSummaryFIM0400(String summaryFIM0400) {
		this.summaryFIM0400 = summaryFIM0400;
	}

	

	public String summaryFIM0400detail() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("in summaryFIM0400detail");

		log.info("test----->" + request.getParameter("reportrefnos") + "dt333"
				 + df.formatdate(request.getParameter("dt2")));
		XBRLFIM0400Dao bsd = new XBRLFIM0400Dao();
		/*ArrayList<XBRLFIM0900Bean> arl = bsd.xbrlfim0900sumEP(df.formatdate(request.getParameter("dt1")),df.formatdate(request.getParameter("dt2")), request.getParameter("reportrefnos"),request.getParameter("curr"));*/
		ArrayList<XBRLFIM0400Bean> arl = bsd.xbrlFIM0400sumEP(df.formatdate(request.getParameter("dt2")), request.getParameter("reportrefnos"),request.getParameter("curr"));
		// summarystandard = arl.toArray(new String[arl.size()]);
		log.info("ARL------------>" + arl.size());
		Gson gson = new Gson();
		summaryFIM0400 = gson.toJson(arl);

		return "success";

	}
	public String detailFIM0400() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		
		
		XBRLFIM0400Dao bsd = new XBRLFIM0400Dao();

		/*ArrayList<XBRLFIM0900Bean> arl = bsd.xbrlfim0900ajaxdetails(request.getParameter("repname"),request.getParameter("ReporefSeq"),
				request.getParameter("instno"),df.formatdate(request.getParameter("dt1")),df.formatdate(request.getParameter("dt2")), request.getParameter("curr"));*/

		ArrayList<XBRLFIM0400Bean> arl = bsd.xbrlFIM0400ajaxdetails(request.getParameter("repname"),request.getParameter("ReporefSeq"),
				request.getParameter("instno"),df.formatdate(request.getParameter("dt2")), request.getParameter("curr"));
		
		// summarystandard = arl.toArray(new String[arl.size()]);
		
		Gson gson = new Gson();
		detFIM0400 = gson.toJson(arl);

		return "success";

	}
	public String modXbFIMCreate400() throws SQLException {
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
	log.info("insert Action modXbCreateFIM0400");

	/*log.info("NEW FLG:" + newFlg);

	// for Inserting new record

	// for new Reference id
	if (newFlg.equals('Y'))

	{
	
		sql.append("INSERT INTO FIM0400_MOD_TABLE(REPORT_REF_NO,INSTITUTE_ID,INSTITUTE_NAME,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,SECTOR,SPOT_RATE,FWD_RATE,INT_RATE_BASE_CURR,INT_RATE_QUOTED_CURR,DUE_DATE,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
		                 +"values('" + ReporefSeq + "','" + request.getParameter("cntrptyuid ")
				          + "','" + request.getParameter("cntrptyname") + "','" + request.getParameter("curncyiso") + "','"
				           + request.getParameter("trantype") + "','" + request.getParameter("amt") + "','"
					      	+ request.getParameter("setr") + "','"+ request.getParameter("spotrate") + "','"
							+ request.getParameter("frdrt") + "','"+ request.getParameter("insbs") + "','"+ request.getParameter("insqu") + "','"+ df1.formatdate(request.getParameter("duedt")) + "','"
				          +df1.formatdate(request.getParameter("rptdate"))+ "','" + session.getAttribute("userName")
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
		sql.append("SELECT COUNT(*) as count FROM FIM0400_MOD_TABLE WHERE "
				+ " REPORT_DATE='" + df1.formatdate(request.getParameter("dt2")) + "' " + "AND INSTITUTE_ID='"
				 + request.getParameter("cntrptyuid") + "' ");
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
			sql2.append("UPDATE FIM0400_MOD_TABLE SET INSTITUTE_NAME='" + request.getParameter("cntrptyname")
			+ "', INSTITUTE_ID ='" + request.getParameter("cntrptyuid")
			+ "', TRAN_CRNCY ='" + request.getParameter("curncyiso")
			+ "', TRAN_TYPE ='" + request.getParameter("trantype")
			+ "', TRAN_AMT='" + request.getParameter("amt") 
			+ "', SECTOR='" + request.getParameter("setr")
			+ "', SPOT_RATE ='" + request.getParameter("spotrate")
			+ "', FWD_RATE  ='" + request.getParameter("frdrt")
		    + "', INT_RATE_BASE_CURR='" + request.getParameter("insbs") 
		    + "', INT_RATE_QUOTED_CURR='" + request.getParameter("insqu") 
			+ "', DUE_DATE ='" + df1.formatdate(request.getParameter("duedt"))
			+ "' WHERE  REPORT_DATE='"
			+ df1.formatdate(request.getParameter("dt2")) + "' " + "AND INSTITUTE_NAME='"
			+ request.getParameter("cntrptyname")
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

			sql3.append("INSERT INTO FIM0400_MOD_TABLE(REPORT_REF_NO,INSTITUTE_ID,INSTITUTE_NAME,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,SECTOR,SPOT_RATE,FWD_RATE,INT_RATE_BASE_CURR,INT_RATE_QUOTED_CURR,DUE_DATE,REPORT_DATE,LCHG_USER_ID,LCHG_TIME, DEL_FLG)"
	                 +"values('0','" + request.getParameter("cntrptyuid")
			          + "','" + request.getParameter("cntrptyname") + "','" + request.getParameter("curncyiso") + "','"
			           + request.getParameter("trantype") + "','" + request.getParameter("amt") + "','"
				      	+ request.getParameter("setr") + "','"+ request.getParameter("spotrate") + "','"
						+ request.getParameter("frdrt") + "','"+ request.getParameter("insbs") + "','"+ request.getParameter("insqu") + "','"+ df1.formatdate(request.getParameter("duedt")) + "','"
			          +df1.formatdate(request.getParameter("dt2"))+ "','" + session.getAttribute("userName")
			          + "',SYSDATE , '" + request.getParameter("modtyp")+"')");
	
			log.info(sql3);

			try {
				ps = conn.prepareStatement(sql3.toString());
				rs = ps.executeUpdate();
				System.out.println(rs);
				if (rs > 0) {
					System.out.println("inside succes");
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
			
		}

		log.info(status);

	//return "success";
return status;
}
	public String detailfim0400saves() {

		ConnectionManager connmgr=new ConnectionManager();
		Connection conn=connmgr.getConnection();
				HttpServletRequest request = ServletActionContext.getRequest();
				DateFormat df = new DateFormat();
				log.info("{call FINAL_REPORT_UPDATE_SP('"+request.getParameter("reptype")+"','"+NullCheck.isNotZero(request.getParameter("refno"))+"','"+df.formatdate(request.getParameter("dt2"))+"','"+df.formatdate(request.getParameter("dt1"))+"','"+df.formatdate(request.getParameter("dt2"))+"','"+request.getParameter("curr")+"')}");
				
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
	
	public String FIM0400verify() {
		log.info("ddddddddddd");
			XBRLFIM0400Dao bsd = new XBRLFIM0400Dao();
			ArrayList<XBRLFIM0400Bean> arr=new ArrayList<XBRLFIM0400Bean>();
			arr=bsd.FIM0400verify();
			Gson gson = new Gson();
			detFIM0400 = gson.toJson(arr);
			return "success";
		}
		public String FIM0400vermaster() {
			String status="";
			XBRLFIM0400Dao bsd = new XBRLFIM0400Dao();
			HttpServletRequest request = ServletActionContext.getRequest();
			status=bsd.FIM0400verifymaster();
			
			if(status.equals("success")) {
				resalert="Verification Successful";
			}else {
				resalert="Technical Issue.Try Again Later.";
			}
			
			return "success";
		}
}
