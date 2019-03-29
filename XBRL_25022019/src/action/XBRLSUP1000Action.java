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
import bean.XBRLSUP1000Bean;
import bean.XBRLSUP1000Bean;
import dao.XBRLSUP1000Dao;
import utilities.ConnectionManager;
import utilities.NullCheck;
import dao.XBRLSUP1000Dao;
import org.apache.log4j.Logger;
public class XBRLSUP1000Action {
	static Logger log = Logger.getLogger(XBRLSUP1000Action.class);
	public String sec1SUP1000;
	public String sec1SUP1000s2;
	public String sec1SUP1000s3;
	public String sec1SUP1000s4;
	public String sec1SUP1000d1;
	public String sec1SUP1000d2;
	public String sec1SUP1000d3;
	public String sec1SUP1000d4;
	public String getSec1SUP1000d3() {
		return sec1SUP1000d3;
	}

	public void setSec1SUP1000d3(String sec1sup1000d3) {
		sec1SUP1000d3 = sec1sup1000d3;
	}

	public String getSec1SUP1000d4() {
		return sec1SUP1000d4;
	}

	public void setSec1SUP1000d4(String sec1sup1000d4) {
		sec1SUP1000d4 = sec1sup1000d4;
	}

	public void setSec1SUP1000(String sec1SUP1000) {
		sec1SUP1000 = sec1SUP1000;
	}

	public void setSec1SUP1000s2(String sec1SUP1000s2) {
		sec1SUP1000s2 = sec1SUP1000s2;
	}

	public void setSec1SUP1000s3(String sec1SUP1000s3) {
		sec1SUP1000s3 = sec1SUP1000s3;
	}

	public void setSec1SUP1000s4(String sec1SUP1000s4) {
		sec1SUP1000s4 = sec1SUP1000s4;
	}

	

	public String getSec1SUP1000d1() {
		return sec1SUP1000d1;
	}

	public void setSec1SUP1000d1(String sec1SUP1000d1) {
		sec1SUP1000d1 = sec1SUP1000d1;
	}

	public String getSec1SUP1000d2() {
		return sec1SUP1000d2;
	}

	public void setSec1SUP1000d2(String sec1SUP1000d2) {
		sec1SUP1000d2 = sec1SUP1000d2;
	}

	public String getSec1SUP1000s4() {
		return sec1SUP1000s4;
	}

	

	public String getSec1SUP1000s3() {
		return sec1SUP1000s3;
	}

	

	public String getSec1SUP1000s2() {
		return sec1SUP1000s2;
	}

	

	public String getSec1SUP1000() {
		return sec1SUP1000;
	}

	public String refno;
	public String getRefno() {
		return refno;
	}

	public void setRefno(String refno) {
		this.refno = refno;
	}

	
	public String modXbSUPCreate1000() throws SQLException {


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

		int tabid;
		tabid = Integer.parseInt(request.getParameter("tabid"));
		StringBuffer sql = new StringBuffer();

		// HttpSession session = request.getSession();
		log.info("insert Action modXbCreateSUP1000");

		log.info("NEW FLG:" + newFlg);

		// for Inserting new record

		// for new Reference id
		if (newFlg.equals('Y'))

		{
			
			if(tabid==1) {
			sql.append(
					"INSERT INTO SUP1000_S1_MOD_TABLE(REPORT_REF_NO,COMPLETE_FLG,UNIQUE_ID,ACCT_NUMBER,ACCT_NAME,ADDRESS,LAST_TRAN_DATE,ACCT_CURRENCY,OUT_BALANCE,DATE_OF_TRANSFER,REMARKS,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
							+ "values('" + ReporefSeq + "','"
							+ request.getParameter("s1dettyp") + "','" 
							+ request.getParameter("unqid") + "','"
							+ request.getParameter("acno") + "','" 
							+ request.getParameter("name") + "','"
							+ request.getParameter("adrs") + "','" 
							+df1.formatdate(request.getParameter("s3dtddchq")) + "','"
							+ request.getParameter("accurncy") + "','"
							+ request.getParameter("outbal") + "','" 
							+ df1.formatdate(request.getParameter("dttran")) + "','"
									+ request.getParameter("rmrk") + "','"
							+ df1.formatdate(request.getParameter("dt2")) + "','" + session.getAttribute("userName")
							+ "',SYSDATE)");
			}
			if(tabid==2) {
				sql.append(
						"INSERT INTO SUP1000_S2_MOD_TABLE(REPORT_REF_NO,COMPLETE_FLG,UNIQUE_ID,ACCT_NUMBER,ACCT_NAME,ADDRESS,ACCT_CURRENCY,OUT_BALANCE,DATE_OF_TRANSFER,REMARKS,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
								+ "values('" + ReporefSeq + "','"
								+ request.getParameter("s1dettyp") + "','" 
								+ request.getParameter("unqid") + "','"
								+ request.getParameter("acno") + "','" 
								+ request.getParameter("name") + "','"
								+ request.getParameter("adrs") + "','" 
								+ request.getParameter("accurncy") + "','"
								+ request.getParameter("outbal") + "','" 
								+ df1.formatdate(request.getParameter("dttran")) + "','"
										+ request.getParameter("rmrk") + "','"
								+ df1.formatdate(request.getParameter("dt2")) + "','" + session.getAttribute("userName")
								+ "',SYSDATE)");
				}
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
			
			
			sql.append(
					"SELECT Count (*) as count FROM   (SELECT DISTINCT REPORT_DATE FROM  SUP1000_S"+tabid+"_MOD_TABLE where REPORT_REF_NO='"
							+ ReporefSeq.trim() + "'and UNIQUE_ID = '"
							+ request.getParameter("unqid") + "'and ACCT_NUMBER = '"+ request.getParameter("acno") + "'and ACCT_NAME = '"+ request.getParameter("name") + "'and REPORT_DATE ='" + df1.formatdate(request.getParameter("dt2"))+"')");

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
				
				if(tabid==1) {
				sql2.append("update  SUP1000_S1_MOD_TABLE set REPORT_REF_NO ='" + ReporefSeq + "',COMPLETE_FLG ='" +NullCheck.isNotNull( request.getParameter("s1dettyp"))
						+ "',UNIQUE_ID ='" + NullCheck.isNotNull(request.getParameter("unqid")) + "',ACCT_NUMBER ='"
						+ NullCheck.isNotNull(request.getParameter("acno")) + "',ACCT_NAME ='"+ NullCheck.isNotNull(request.getParameter("name"))
						+ "',ADDRESS ='" +request.getParameter("adrs")
						+ "',LAST_TRAN_DATE ='"
						+ NullCheck.isNotNull(df1.formatdate(request.getParameter("s3dtddchq")))+ "',ACCT_CURRENCY ='" +NullCheck.isNotNull( request.getParameter("accurncy"))
						+ "',OUT_BALANCE ='" +NullCheck.isNotNull( request.getParameter("outbal")) + "',DATE_OF_TRANSFER ='"
						+ NullCheck.isNotNull(df1.formatdate(request.getParameter("dttran"))) + "',REMARKS ='"+NullCheck.isNotNull(request.getParameter("rmrk"))
						+ "',REPORT_DATE ='" +NullCheck.isNotNull( df1.formatdate(request.getParameter("dt2"))) + "',LCHG_USER_ID ='" +NullCheck.isNotNull( request.getParameter("userName")) + "',LCHG_TIME ='" +NullCheck.isNotNull( request.getParameter("SYSDATE")) + "' where UNIQUE_ID ='" + NullCheck.isNotNull(request.getParameter("unqid")) +"'and ACCT_NUMBER ='" + NullCheck.isNotNull(request.getParameter("acno")) +"' and ACCT_NAME ='" + NullCheck.isNotNull(request.getParameter("name")) +"'and  REPORT_REF_NO ='" + ReporefSeq + "'and REPORT_DATE ='" + df1.formatdate(request.getParameter("dt2"))+"'");
				}
				
				if(tabid==2) {
					sql2.append("update  SUP1000_S2_MOD_TABLE set REPORT_REF_NO ='" + ReporefSeq + "',COMPLETE_FLG ='" +NullCheck.isNotNull( request.getParameter("s1dettyp"))
							+ "',UNIQUE_ID ='" + NullCheck.isNotNull(request.getParameter("unqid")) + "',ACCT_NUMBER ='"
							+ NullCheck.isNotNull(request.getParameter("acno")) + "',ACCT_NAME ='"+ NullCheck.isNotNull(request.getParameter("name"))
							+ "',ADDRESS ='" +request.getParameter("adrs")
							+ "',ACCT_CURRENCY ='" +NullCheck.isNotNull( request.getParameter("accurncy"))
							+ "',OUT_BALANCE ='" +NullCheck.isNotNull( request.getParameter("outbal")) + "',DATE_OF_TRANSFER ='"
							+ NullCheck.isNotNull(df1.formatdate(request.getParameter("dttran"))) + "',REMARKS ='"+NullCheck.isNotNull(request.getParameter("rmrk"))
							+ "',REPORT_DATE ='" +NullCheck.isNotNull( df1.formatdate(request.getParameter("dt2"))) + "',LCHG_USER_ID ='" +NullCheck.isNotNull( request.getParameter("userName")) + "',LCHG_TIME ='" +NullCheck.isNotNull( request.getParameter("SYSDATE")) + "' where UNIQUE_ID ='" + NullCheck.isNotNull(request.getParameter("unqid")) +"'and ACCT_NUMBER ='" + NullCheck.isNotNull(request.getParameter("acno")) +"' and ACCT_NAME ='" + NullCheck.isNotNull(request.getParameter("name")) +"'and  REPORT_REF_NO ='" + ReporefSeq + "'and REPORT_DATE ='" + df1.formatdate(request.getParameter("dt2"))+"'");
					}
				
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

				if(tabid==1) {
				
				sql3.append(
						"INSERT INTO SUP1000_S1_MOD_TABLE(REPORT_REF_NO,COMPLETE_FLG,UNIQUE_ID,ACCT_NUMBER,ACCT_NAME,ADDRESS,LAST_TRAN_DATE,ACCT_CURRENCY,OUT_BALANCE,DATE_OF_TRANSFER,REMARKS,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
								+ "values('" + ReporefSeq + "','"
								+ request.getParameter("s1dettyp") + "','" 
								+ request.getParameter("unqid") + "','"
								+ request.getParameter("acno") + "','" 
								+ request.getParameter("name") + "','"
								+ request.getParameter("adrs") + "','" 
								+df1.formatdate(request.getParameter("s3dtddchq")) + "','"
								+request.getParameter("accurncy") + "','"
								+ request.getParameter("outbal") + "','" 
								+  df1.formatdate(request.getParameter("dttran")) + "','"
										+ request.getParameter("rmrk") + "','"
								+ df1.formatdate(request.getParameter("dt2")) + "','" + session.getAttribute("userName")
								+ "',SYSDATE)");
				}
				
				if(tabid==2) {
					
					sql3.append(
							"INSERT INTO SUP1000_S2_MOD_TABLE(REPORT_REF_NO,COMPLETE_FLG,UNIQUE_ID,ACCT_NUMBER,ACCT_NAME,ADDRESS,ACCT_CURRENCY,OUT_BALANCE,DATE_OF_TRANSFER,REMARKS,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
									+ "values('" + ReporefSeq + "','"
									+ request.getParameter("s1dettyp") + "','" 
									+ request.getParameter("unqid") + "','"
									+ request.getParameter("acno") + "','" 
									+ request.getParameter("name") + "','"
									+ request.getParameter("adrs") + "','" 
									+request.getParameter("accurncy") + "','"
									+ request.getParameter("outbal") + "','" 
									+  df1.formatdate(request.getParameter("dttran")) + "','"
											+ request.getParameter("rmrk") + "','"
									+ df1.formatdate(request.getParameter("dt2")) + "','" + session.getAttribute("userName")
									+ "',SYSDATE)");
					}
					
				
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
	
	
	
	public String modXbSUPCreate1000d34() throws SQLException {


		log.info("XBRL XBRL XBRL action 2");

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
		log.info("hghj");
		int tabid;
		tabid = Integer.parseInt(request.getParameter("tabid"));
		log.info("hghj");
		StringBuffer sql = new StringBuffer();

		// HttpSession session = request.getSession();
		log.info("insert Action modXbCreateSUP1000");

		log.info("NEW FLG:" + newFlg);

		// for Inserting new record

		// for new Reference id
		if (newFlg.equals('Y'))

		{
			
			
			sql.append(
					"INSERT INTO SUP1000_S"+tabid+"_MOD_TABLE(REPORT_REF_NO,COMPLETE_FLG,UNIQUE_ID,DATE_OF_DD_CHQ,DD_CHQ_NUMBER,ACCT_NAME,ADDRESS,ACCT_NUMBER,BENEFICIARY_NAME,BENEFICIARY_ADDRESS,ACCT_CURRENCY,OUT_BALANCE,DATE_OF_TRANSFER,REMARKS,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
							+ "values('" + ReporefSeq + "','"
							+ request.getParameter("s1dettyp") + "','" 
							+ request.getParameter("unqid") + "','"
							+ df1.formatdate(request.getParameter("s3dtddchq")) + "','" 
							+ request.getParameter("s3ddchqno") + "','"
							+ request.getParameter("name") + "','" 
							+request.getParameter("adrs") + "','"
							+ request.getParameter("acno") + "','"
							+ request.getParameter("bfryname") + "','" 
							+ request.getParameter("bfryadrs") + "','" 
							+ request.getParameter("accurncy") + "','" 
							+ request.getParameter("outbal") + "','" 
							+ df1.formatdate(request.getParameter("dttran")) + "','"
									+ request.getParameter("rmrk") + "','"
							+ df1.formatdate(request.getParameter("dt2")) + "','" + session.getAttribute("userName")
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
			
			
			sql.append(
					"SELECT Count (*) as count FROM   (SELECT DISTINCT REPORT_DATE FROM  SUP1000_S"+tabid+"_MOD_TABLE where REPORT_REF_NO='"
							+ ReporefSeq.trim() + "'and UNIQUE_ID = '"
							+ request.getParameter("unqid") + "'and ACCT_NUMBER = '"+ request.getParameter("acno") + "'and ACCT_NAME = '"+ request.getParameter("name") + "'and REPORT_DATE ='" + df1.formatdate(request.getParameter("dt2"))+"')");

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
				
				
				sql2.append("update  SUP1000_S"+tabid+"_MOD_TABLE set REPORT_REF_NO ='" + ReporefSeq + "',COMPLETE_FLG ='" +NullCheck.isNotNull( request.getParameter("s1dettyp"))
						+ "',UNIQUE_ID ='" + NullCheck.isNotNull(request.getParameter("unqid")) + "',DATE_OF_DD_CHQ ='"
						+ NullCheck.isNotNull(df1.formatdate(request.getParameter("s3dtddchq"))) + "',DD_CHQ_NUMBER ='"+ NullCheck.isNotNull(request.getParameter("s3ddchqno"))
						+ "',ACCT_NAME ='" +request.getParameter("name")
						+ "',ADDRESS ='" +request.getParameter("adrs")
						+ "',ACCT_NUMBER ='" +request.getParameter("acno")
						+ "',BENEFICIARY_NAME ='"
						+ NullCheck.isNotNull(request.getParameter("bfryname"))+ "',BENEFICIARY_ADDRESS ='" +NullCheck.isNotNull( request.getParameter("bfryadrs"))
						+ "',ACCT_CURRENCY ='" +NullCheck.isNotNull( request.getParameter("accurncy")) + "',OUT_BALANCE ='" +NullCheck.isNotNull( request.getParameter("outbal")) + "',DATE_OF_TRANSFER ='"
						+ NullCheck.isNotNull(df1.formatdate(request.getParameter("dttran"))) + "',REMARKS ='"+NullCheck.isNotNull(request.getParameter("rmrk"))
						+ "',REPORT_DATE ='" +NullCheck.isNotNull( df1.formatdate(request.getParameter("dt2"))) + "',LCHG_USER_ID ='" +NullCheck.isNotNull( request.getParameter("userName")) + "',LCHG_TIME ='" +NullCheck.isNotNull( request.getParameter("SYSDATE")) + "' where UNIQUE_ID ='" + NullCheck.isNotNull(request.getParameter("unqid")) +"'and ACCT_NUMBER ='" + NullCheck.isNotNull(request.getParameter("acno")) +"' and ACCT_NAME ='" + NullCheck.isNotNull(request.getParameter("name")) +"'and  REPORT_REF_NO ='" + ReporefSeq + "'and REPORT_DATE ='" + df1.formatdate(request.getParameter("dt2"))+"'");
				
				
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
						"INSERT INTO SUP1000_S"+tabid+"_MOD_TABLE(REPORT_REF_NO,COMPLETE_FLG,UNIQUE_ID,DATE_OF_DD_CHQ,DD_CHQ_NUMBER,ACCT_NAME,ADDRESS,ACCT_NUMBER,BENEFICIARY_NAME,BENEFICIARY_ADDRESS,ACCT_CURRENCY,OUT_BALANCE,DATE_OF_TRANSFER,REMARKS,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
								+ "values('" + ReporefSeq + "','"
								+ request.getParameter("s1dettyp") + "','" 
								+ request.getParameter("unqid") + "','"
								+ df1.formatdate(request.getParameter("s3dtddchq")) + "','" 
								+ request.getParameter("s3ddchqno") + "','"
								+ request.getParameter("name") + "','" 
								+request.getParameter("adrs") + "','"
								+ request.getParameter("acno") + "','"
								+ request.getParameter("bfryname") + "','" 
								+ request.getParameter("bfryadrs") + "','" 
								+ request.getParameter("accurncy") + "','" 
								+ request.getParameter("outbal") + "','" 
								+ df1.formatdate(request.getParameter("dttran")) + "','"
										+ request.getParameter("rmrk") + "','"
								+ df1.formatdate(request.getParameter("dt2")) + "','" + session.getAttribute("userName")
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
	
	
	
	public String section1SUP1000() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside SUP1000 action");
		
		XBRLSUP1000Dao bsd = new XBRLSUP1000Dao();

		ArrayList<XBRLSUP1000Bean> arl = bsd.xbrlSUP1000(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1SUP1000 = gson.toJson(arl);

		return "success";

	}
	
	public String section2SUP1000() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside SUP1000 action");
		
		XBRLSUP1000Dao bsd = new XBRLSUP1000Dao();

		ArrayList<XBRLSUP1000Bean> arl = bsd.xbrlSUP1000s2(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1SUP1000s2 = gson.toJson(arl);

		return "success";

	}
	
	public String section3SUP1000() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside SUP1000 action");
		
		XBRLSUP1000Dao bsd = new XBRLSUP1000Dao();

		ArrayList<XBRLSUP1000Bean> arl = bsd.xbrlSUP1000s3(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1SUP1000s3 = gson.toJson(arl);

		return "success";

	}
	
	public String section4SUP1000() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside SUP1000action");
		
		XBRLSUP1000Dao bsd = new XBRLSUP1000Dao();

		ArrayList<XBRLSUP1000Bean> arl = bsd.xbrlSUP1000s4(request.getParameter("repname"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1SUP1000s4 = gson.toJson(arl);

		return "success";

	}
	

	public String detsec1SUP1000() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside SUP1000 action 1 sec");
		
		XBRLSUP1000Dao bsd = new XBRLSUP1000Dao();

		ArrayList<XBRLSUP1000Bean> arl = bsd.xbrlSUP1000d1(request.getParameter("reptype"),
				request.getParameter("ReporefSeq"),request.getParameter("instno"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1SUP1000d1= gson.toJson(arl);

		return "success";

	}
	

	public String detsec2SUP1000() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside SUP1000 action");
		
		XBRLSUP1000Dao bsd = new XBRLSUP1000Dao();

		ArrayList<XBRLSUP1000Bean> arl = bsd.xbrlSUP1000d2(request.getParameter("reptype"),request.getParameter("instno"),
				request.getParameter("ReporefSeq"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1SUP1000d2 = gson.toJson(arl);

		return "success";

	}
	
	

	public String detsec3SUP1000() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside SUP1000 action");
		
		XBRLSUP1000Dao bsd = new XBRLSUP1000Dao();

		ArrayList<XBRLSUP1000Bean> arl = bsd.xbrlSUP1000d3(request.getParameter("reptype"),
				request.getParameter("ReporefSeq"),request.getParameter("instno"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1SUP1000d3 = gson.toJson(arl);

		return "success";

	}
	
	
	

	public String detsec4SUP1000() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("inside SUP1000 action");
		
		XBRLSUP1000Dao bsd = new XBRLSUP1000Dao();

		ArrayList<XBRLSUP1000Bean> arl = bsd.xbrlSUP1000d4(request.getParameter("reptype"),
				request.getParameter("ReporefSeq"),request.getParameter("instno"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
		
		Gson gson = new Gson();
		sec1SUP1000d4 = gson.toJson(arl);

		return "success";

	}
}

