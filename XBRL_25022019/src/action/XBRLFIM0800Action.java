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
import bean.XBRLFIM0800Bean;
import bean.XBRLFIM0200Bean;
import bean.XBRLFIM0800Bean;
import dao.XBRLFIM0800Dao;
import dao.XBRLFIM0200Dao;
import dao.XBRLFIM0800Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;

/**
 * @companyName : 		 		Bonfire Innovation Private Limited Chennai
 * @project :    		 		Extensible Business Reporting Language (XBRL)
 * @name :       		 		XBRLFIM0800Action.java
 * @path :         		 		action
 * @author :       		 		D PraveenBabu
 * @version : 					1.0
 * @functionality :		 		It contains the action with multiple methods to create FIM0500 Report.
 * @relatedScripts : 	 		bean.XBRLFIM0800Bean.java,dao.XBRLFIM0800Dao.java 
 * @creationDate :				
 * @lastModifiedDate :			
 * @modificationHistory : 		

*/

public class XBRLFIM0800Action {
	static Logger log = Logger.getLogger(XBRLFIM0800Action.class);
	 public String refno;
	 public String detailFIM0800;
	 public String detFIM0800;
	 public String getDetFIM0800() {
		return detFIM0800;
	}

	public void setDetFIM0800(String detFIM0800) {
		this.detFIM0800 = detFIM0800;
	}
	public String resalert;
		
		
		
		
		
		public String getResalert() {
			return resalert;
		}

		public void setResalert(String resalert) {
			this.resalert = resalert;
		}
	public String summaryFIM0800;
	
	
	public String getSummaryFIM0800() {
		return summaryFIM0800;
	}





	public void setSummaryFIM0800(String summaryFIM0800) {
		this.summaryFIM0800 = summaryFIM0800;
	}





	public String getDetailFIM0800() {
		return detailFIM0800;
	}





	public void setDetailFIM0800(String detailFIM0800) {
		this.detailFIM0800 = detailFIM0800;
	}





	public String getRefno() {
		return refno;
	}





	public void setRefno(String refno) {
		this.refno = refno;
	}





	public String modXbFIMCreate800() throws SQLException {

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

	/*	// String passexpdate=df.formatdate(xb.getAccopendate());
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
*/		session.setAttribute("ReprefSeq", ReporefSeq);

		int rs = 0;

		int count = 0;

		StringBuffer sql = new StringBuffer();

		

	

		// for Inserting new record

		// for new Reference id
		/*if (newFlg.equals('Y'))

		{
			sql.append(
					" INSERT INTO FIM0800_MOD_TABLE(REPORT_REF_NO,TRADE_DATE,VALUE_DATE,TRAN_TYPE,BILL_CODE,BILL_HOLDER,COUNTER_PARTY_CODE,BILL_PRICE,YIELD,AMOUNT,MATURITY_DATE,BILL_BAND,ISIN,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)" + "VALUES ('"
							+ ReporefSeq + "','" + df1.formatdate(request.getParameter("trade1")) + "','"
							+  df1.formatdate(request.getParameter("valdate1")) + "','" + request.getParameter("typtrn1") + "','"
							+ request.getParameter("acntno1") + "','" + request.getParameter("cntprty1") + "','"
							+ request.getParameter("ccntprtycode1") + "','" + request.getParameter("nominalamt1") + "','"
							+ request.getParameter("yields1") + "','" + request.getParameter("clanpr1") + "','"
							+  df1.formatdate(request.getParameter("matudat1")) + "','" + request.getParameter("residudat1") + "','"
							+request.getParameter("isin1") + "','"
									+df1.formatdate(request.getParameter("dt2")) + "','"
							+ session.getAttribute("userName")+"',SYSDATE)");
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
			sql.append("SELECT COUNT(*) as count FROM FIM0800_MOD_TABLE WHERE REPORT_DATE='" + df1.formatdate(request.getParameter("dt2")) + "' "
					+ "AND BILL_CODE ='"
					+ request.getParameter("acntno1") + "'");
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
				sql2.setLength(0);
				sql2.append("UPDATE FIM0800_MOD_TABLE SET TRADE_DATE='" + df1.formatdate(request.getParameter("trade1"))
				+"', VALUE_DATE='" + df1.formatdate(request.getParameter("valdate1"))
				+"', TRAN_TYPE='" + request.getParameter("typtrn1")
				+"', AMOUNT='" + request.getParameter("clanpr1")	
				+"', BILL_HOLDER='" + request.getParameter("cntprty1")
				+"', COUNTER_PARTY_CODE='" + request.getParameter("ccntprtycode1")
				+"', BILL_PRICE='" + request.getParameter("nominalamt1")
														
                +"', YIELD='" + request.getParameter("yields1")
				+"', MATURITY_DATE='" + df1.formatdate(request.getParameter("matudat1"))
				+"', BILL_BAND='" + request.getParameter("residudat1")
        		+"', ISIN='" + request.getParameter("isin1")+ "',DEL_FLG='M' "						
				+ "WHERE  REPORT_DATE='"
				+ df1.formatdate(request.getParameter("dt2")) + "' " + "AND BILL_CODE='"
				+ request.getParameter("acntno1")
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

				sql3.append(
						" INSERT INTO FIM0800_MOD_TABLE(REPORT_REF_NO,TRADE_DATE,VALUE_DATE,TRAN_TYPE,BILL_CODE,BILL_HOLDER,COUNTER_PARTY_CODE,BILL_PRICE,YIELD,AMOUNT,MATURITY_DATE,BILL_BAND,ISIN,REPORT_DATE,DEL_FLG,LCHG_USER_ID,LCHG_TIME)" + "VALUES ('"
								+ ReporefSeq + "','" + df1.formatdate(request.getParameter("trade1")) + "','"
								+  df1.formatdate(request.getParameter("valdate1")) + "','" + request.getParameter("typtrn1") + "','"
								+ request.getParameter("acntno1") + "','" + request.getParameter("cntprty1") + "','"
								+ request.getParameter("ccntprtycode1") + "','" + request.getParameter("nominalamt1") + "','"
								+ request.getParameter("yields1") + "','" + request.getParameter("clanpr1") + "','"
								+  df1.formatdate(request.getParameter("matudat1")) + "','" + request.getParameter("residudat1") + "','"
								+request.getParameter("isin1") + "','"
								+df1.formatdate(request.getParameter("dt2")) + "','"
								+request.getParameter("modtyp") + "','"
								+ session.getAttribute("userName")+"',SYSDATE)");
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

				log.info("executeeeeeeeeeeeeeeeeeed ");
				refno = ReporefSeq;

				// String stat = bop0300add(ReporefSeq);

				refno = ReporefSeq;
			}

		/*}*/
return "success";
//return status;
	}
	public String summaryFIM0800detail() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("in summaryFIM0800detail");

		log.info("test----->" + request.getParameter("reportrefnos") + "dt333"
				+ df.formatdate(request.getParameter("dt1")) + df.formatdate(request.getParameter("dt2")));
		XBRLFIM0800Dao bsd = new XBRLFIM0800Dao();
		ArrayList<XBRLFIM0800Bean> arl = bsd.xbrlFIMsumEP(df.formatdate(request.getParameter("dt1")),
				df.formatdate(request.getParameter("dt2")), request.getParameter("reportrefnos"),request.getParameter("curr"));

		// summarystandard = arl.toArray(new String[arl.size()]);
		log.info("ARL------------>" + arl.size());
		Gson gson = new Gson();
		summaryFIM0800 = gson.toJson(arl);

		return "success";

	}


	public String detailFIM0800() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		
		
		XBRLFIM0800Dao bsd = new XBRLFIM0800Dao();

		ArrayList<XBRLFIM0800Bean> arl = bsd.xbrlFIMajaxdetails(request.getParameter("reptype"),
				request.getParameter("ReporefSeq"), request.getParameter("instno"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));
		// summarystandard = arl.toArray(new String[arl.size()]);
		
		Gson gson = new Gson();
		detailFIM0800 = gson.toJson(arl);

		return "success";

	}

	public String fim0800verify() {
	log.info("ddddddddddd");
		XBRLFIM0800Dao bsd = new XBRLFIM0800Dao();
		ArrayList<XBRLFIM0800Bean> arr=new ArrayList<XBRLFIM0800Bean>();
		arr=bsd.FIM0800verify();
		Gson gson = new Gson();
		detFIM0800 = gson.toJson(arr);
		return "success";
	}
	public String FIM0800vermaster() {
		String status="";
		XBRLFIM0800Dao bsd = new XBRLFIM0800Dao();
		HttpServletRequest request = ServletActionContext.getRequest();
		status=bsd.FIM0800verifymaster();
		
		if(status.equals("success")) {
			resalert="Verification Successful";
		}else {
			resalert="Technical Issue.Try Again Later.";
		}
		
		return "success";
	}
	
	
	
	

}
