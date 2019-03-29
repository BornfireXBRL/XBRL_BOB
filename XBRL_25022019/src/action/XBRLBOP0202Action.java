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
import bean.XBRLBOP0202Bean;
import bean.XBRLBOP0202Bean;
import dao.XBRLBOP0202Dao;
import dao.XBRLBOP0202Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;


import org.apache.log4j.Logger;
/**
 * @companyName : 		 		Bonfire Innovation Private Limited Chennai
 * @project :    		 		Extensible Business Reporting Language (XBRL)
 * @name :       		 		XBRLBOP0202Action.java
 * @path :         		 		action
 * @author :       		 		D PraveenBabu
 * @version : 					1.0
 * @functionality :		 		It contains the action with multiple methods to create BOP0202 Report.
 * @relatedScripts : 	 		bean.XBRLBOP0202Bean.java,dao.XBRLBOP0202Dao.java 
 * @creationDate :				
 * @lastModifiedDate :			
 * @modificationHistory : 		

*/


public class XBRLBOP0202Action {
	
	static Logger log = Logger.getLogger(XBRLBOP0202Action.class);
	
	public String dashdata[];
	public String reporefeno;
	public String dtlBOP0202;
	public String editBOP0202;
public String getEditBOP0202() {
		return editBOP0202;
	}

	public void setEditBOP0202(String editBOP0202) {
		this.editBOP0202 = editBOP0202;
	}

public String getDtlBOP0202() {
		return dtlBOP0202;
	}

	public void setDtlBOP0202(String dtlBOP0202) {
		this.dtlBOP0202 = dtlBOP0202;
	}
	
	public String sum1BOP0202;
public String getSum1BOP0202() {
		return sum1BOP0202;
	}

	public void setSum1BOP0202(String sum1fim1000) {
		sum1BOP0202 = sum1fim1000;
	}

public String summaryBOP0202;
	public String getSummaryBOP0202() {
	return summaryBOP0202;
}

public void setSummaryBOP0202(String summaryBOP0202) {
	this.summaryBOP0202 = summaryBOP0202;
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

	public String modXbBOPCreate202() throws SQLException {

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
		log.info("insert Action modXbCreateBOP0202");

		log.info("NEW FLG:" + newFlg);

		// for Inserting new record

		// for new Reference id
		if (newFlg.equals('Y'))

		{
			
			sql.append(
					"INSERT INTO BOP0202_MOD_TABLE(REPORT_REF_NO,NAME_OF_INSTITUTE,UNIQUE_ID,COUNTRY,TYPE_OF_TRANSACTION,PCNT_SHARE_OPN,PCNT_SHARE_CLS,OPN_POSITION,ADDITIONS,REDUCTIONS,OTH_CHG_IN_VOL,REVALUATION,CLOSING_POSITION,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
							+ "values('" + ReporefSeq + "','" + request.getParameter("instname") + "','"
							+ request.getParameter("unid") + "','" 
							+ request.getParameter("cntry") + "','"
							+ request.getParameter("trantyp") + "','" 
							+ request.getParameter("peropnpos") + "','"
							+ request.getParameter("perclspos") + "','" 
							+request.getParameter("opnposs") + "','"
							+request.getParameter("addtns") + "','"
							+ request.getParameter("redctns") + "','" 
							+ request.getParameter("othrchnges") + "','"
									+ request.getParameter("revchnge") + "','"
											+ request.getParameter("clspos") + "','"
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
					"SELECT Count (*) as count FROM   (SELECT DISTINCT REPORT_DATE FROM  BOP0202_MOD_TABLE where REPORT_REF_NO='"
							+ ReporefSeq.trim() + "'and NAME_OF_INSTITUTE = '"
							+ request.getParameter("instname") + "'and UNIQUE_ID= '"+ request.getParameter("unid") + "'and REPORT_DATE ='" + df1.formatdate(request.getParameter("reportsd"))+"')");

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
				
				
				

				sql2.append("update  BOP0202_MOD_TABLE set REPORT_REF_NO ='" + ReporefSeq + "',NAME_OF_INSTITUTE ='"
						+ NullCheck.isNotNull(request.getParameter("instname")) + "',UNIQUE_ID ='" +NullCheck.isNotNull( request.getParameter("unid"))
						+ "',COUNTRY ='" + request.getParameter("cntry") + "',TYPE_OF_TRANSACTION ='"
						+ NullCheck.isNotNull(request.getParameter("trantyp")) + "',PCNT_SHARE_OPN ='"+ NullCheck.isNotNull(request.getParameter("peropnpos"))
						+ "',PCNT_SHARE_CLS ='" +request.getParameter("perclspos")
						+ "',OPN_POSITION ='"
						+ NullCheck.isNotNull(request.getParameter("opnposs") )+ "',ADDITIONS ='" +NullCheck.isNotNull(request.getParameter("addtns"))
						+ "',REDUCTIONS ='" +NullCheck.isNotNull( request.getParameter("redctns")) + "',OTH_CHG_IN_VOL ='"
						+ NullCheck.isNotNull(request.getParameter("othrchnges")) + "',REVALUATION ='"+NullCheck.isNotNull( request.getParameter("revchnge"))
						+ "',CLOSING_POSITION ='" +NullCheck.isNotNull(request.getParameter("clspos"))
						+ "',REPORT_DATE ='"
			
						+ df1.formatdate(request.getParameter("reportsd")) 
						+ "' where NAME_OF_INSTITUTE ='" + NullCheck.isNotNull(request.getParameter("instname")) +"' and UNIQUE_ID ='" + NullCheck.isNotNull(request.getParameter("unid")) +"' and   REPORT_REF_NO ='" + ReporefSeq + "'and REPORT_DATE ='" + df1.formatdate(request.getParameter("reportsd"))+"'");
				log.info(sql2);
			
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
						"INSERT INTO BOP0202_MOD_TABLE(REPORT_REF_NO,NAME_OF_INSTITUTE,UNIQUE_ID,COUNTRY,TYPE_OF_TRANSACTION,PCNT_SHARE_OPN,PCNT_SHARE_CLS,OPN_POSITION,ADDITIONS,REDUCTIONS,OTH_CHG_IN_VOL,REVALUATION,CLOSING_POSITION,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
								+ "values('" + ReporefSeq + "','" + request.getParameter("instname") + "','"
								+ request.getParameter("unid") + "','" 
								+ request.getParameter("cntry") + "','"
								+ request.getParameter("trantyp") + "','" 
								+ request.getParameter("peropnpos") + "','"
								+ request.getParameter("perclspos") + "','" 
								+request.getParameter("opnposs") + "','"
								+request.getParameter("addtns") + "','"
								+ request.getParameter("redctns") + "','" 
								+ request.getParameter("othrchnges") + "','"
										+ request.getParameter("revchnge") + "','"
												+ request.getParameter("clspos") + "','"
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
	
	
	public String sum1BOP0202() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("in summaryBOP0202detail");

		log.info("test----->" + request.getParameter("reportrefnos") + "dt333"
				+ df.formatdate(request.getParameter("dt1")) + df.formatdate(request.getParameter("dt2")));
		XBRLBOP0202Dao bsd = new XBRLBOP0202Dao();
		ArrayList<XBRLBOP0202Bean> arl = bsd.xbrlfimsumEP1(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		// summarystandard = arl.toArray(new String[arl.size()]);
		log.info("ARL------------>" + arl.size());
		Gson gson = new Gson();
		sum1BOP0202 = gson.toJson(arl);

		return "success";

	}

public String detailBOP0202() {

	HttpServletRequest request = ServletActionContext.getRequest();
	DateFormat df = new DateFormat();
	
	
	XBRLBOP0202Dao bsd = new XBRLBOP0202Dao();

	ArrayList<XBRLBOP0202Bean> arl = bsd.xbrlbop0202details(request.getParameter("repname"),
			request.getParameter("ReporefSeq"), request.getParameter("instno"),
			df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

	// summarystandard = arl.toArray(new String[arl.size()]);
	
	Gson gson = new Gson();
	dtlBOP0202 = gson.toJson(arl);

	return "success";

}


}
