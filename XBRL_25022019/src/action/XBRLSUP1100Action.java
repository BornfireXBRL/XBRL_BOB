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

import bean.XBRLSUP1100Bean;
import dao.XBRLFIM0900Dao;
import dao.XBRLSUP1100Dao;
import bean.XBRLFIM0900Bean;
import bean.XBRLReportMasterBean;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;


public class XBRLSUP1100Action {
	
	static Logger log = Logger.getLogger(XBRLSUP1100Action.class);
	

	
	public String resalert;

	
	public String getResalert() {
		return resalert;
	}

	public void setResalert(String resalert) {
		this.resalert = resalert;
	}
	public String Reporef;
	
		
	public String getReporef() {
		return Reporef;
	}

	public void setReporef(String reporef) {
		Reporef = reporef;
	}

	

	
	public String detSUP1100;
	public String summarySUP1100;
	
	
	
	
	
	public String getDetSUP1100() {
		return detSUP1100;
	}

	public void setDetSUP1100(String detSUP1100) {
		this.detSUP1100 = detSUP1100;
	}

	public String getSummarySUP1100() {
		return summarySUP1100;
	}

	public void setSummarySUP1100(String summarySUP1100) {
		this.summarySUP1100 = summarySUP1100;
	}
	
	public String refno;
	public String getRefno() {
		return refno;
	}

	public void setRefno(String refno) {
		this.refno = refno;
	}

	public String modXbSUPCreate1100() throws SQLException {

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

		}
		log.info("===ReporefSeq===" + ReporefSeq);
		// log.info("<< EIDSeq >> " + EIDSeq);
*/		session.setAttribute("ReprefSeq", ReporefSeq);

		int rs = 0;

		int count = 0;

		StringBuffer sql = new StringBuffer();

		// HttpSession session = request.getSession();
		log.info("insert Action modXbCreateSUP1100");

		// for Inserting new record

		// for new Reference id
		/*if (newFlg.equals('Y'))

		{
			
			sql.append(
					"INSERT INTO SUP1100_MOD_TABLE(REPORT_REF_NO, CUST_NAME,UNIQUE_ID,SANC_DATE,TYPE_OF_FACILITY,AMT,PURPOSE, SECURITY_DETAILS,SEC_VALUATION_DT,SEC_VALUE,SEC_VALUER_NAME,NPA_DATE,REALIS_VALUE_OF_SEC,PROVISION,LEGAL_ACTION_Dt,BALANCE_ON_FORECLOSURE,SALE_BY_LEVY_DATE,SALE_REF_NO,SECURITY_ENFORCED,ACTUAL_SALE_DATE,AMOUNT_OF_SALE,AMT_ATTRIBUTED_BANK,RECOVERY_COST,ASSET_PURCHASED ,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)"
							+ "values('" + ReporefSeq + "','" + request.getParameter("customername")
							+ "','" + request.getParameter("uniqidentinoofcust") + "','"
							+ df1.formatdate(request.getParameter("sanctiondate")) + "','" 
							+ request.getParameter("typeoffacility") + "','"
							+ request.getParameter("amtsantioned") + "','" 
							+request.getParameter("purpose") + "','"
							+ request.getParameter("detaiofsecurity") + "','" 
							+df1.formatdate(request.getParameter("lastvaluadate")) + "','"
							+ request.getParameter("valueofsecurity") + "','"
							+ request.getParameter("nameofvaluer") + "','" 
							+ df1.formatdate(request.getParameter("dateclassiasnpa")) + "','"
							+ request.getParameter("estirealivalofsecur") + "','" 
							+ request.getParameter("amtofprovismade") + "','"
							+df1.formatdate(request.getParameter("dateonwhlegactwainit")) + "','" 
							+ request.getParameter("outstabalatforclsdate") + "','" 
							+ df1.formatdate(request.getParameter("dateofsalbylevy")) + "','" 
							+ request.getParameter("leavysalrefno") + "','" 
							+ request.getParameter("securenforced") + "','" 
							+ df1.formatdate(request.getParameter("dateofactusal")) + "','" 
							+ request.getParameter("amtofactusal") + "','"  
							+ request.getParameter("amtattritobank") + "','" 
									+ request.getParameter("acturecovcosts") + "','" 
											+ request.getParameter("statwheasstwerpurbank") + "','" 
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

			log.info("executeUIUFDJJFGFUDFUDGJd");
			refno = ReporefSeq;

		}

		// for old Reference id
		else {*/

			int rowcount = 0;
			
			sql.append(
					"SELECT Count (*) as count FROM   (SELECT DISTINCT REPORT_DATE FROM  SUP1100_MOD_TABLE where UNIQUE_ID = '"
							+ request.getParameter("uniqidentinoofcust") + "'and CUST_NAME = '"+ request.getParameter("customername") + "'and REPORT_DATE ='" + df1.formatdate(request.getParameter("dt2"))+"')");

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
				
			
				sql2.append("update  SUP1100_MOD_TABLE set CUST_NAME ='"
						+ NullCheck.isNotNull(request.getParameter("customername")) + "',UNIQUE_ID ='" +NullCheck.isNotNull( request.getParameter("uniqidentinoofcust"))
						+ "',SANC_DATE ='" + NullCheck.isNotNull(df1.formatdate(request.getParameter("sanctiondate"))) + "',TYPE_OF_FACILITY ='"
						+ NullCheck.isNotNull(request.getParameter("typeoffacility")) + "',AMT ='"+ NullCheck.isNotNull(request.getParameter("amtsantioned"))
						+ "',PURPOSE ='" +request.getParameter("purpose")
						+ "',SECURITY_DETAILS ='"
						+ NullCheck.isNotNull(request.getParameter("detaiofsecurity") )+ "',SEC_VALUATION_DT ='" +NullCheck.isNotNull( df1.formatdate(request.getParameter("lastvaluadate")))
						+ "',SEC_VALUE ='" +NullCheck.isNotNull( request.getParameter("valueofsecurity")) + "',SEC_VALUER_NAME ='"
						+ NullCheck.isNotNull(request.getParameter("nameofvaluer")) + "',NPA_DATE ='"+NullCheck.isNotNull( df1.formatdate(request.getParameter("dateclassiasnpa")))
						+ "',REALIS_VALUE_OF_SEC ='" +NullCheck.isNotNull(request.getParameter("estirealivalofsecur"))
						+ "',PROVISION ='"
						+ NullCheck.isNotNull(request.getParameter("amtofprovismade") )+ "',LEGAL_ACTION_Dt ='" +NullCheck.isNotNull(df1.formatdate(request.getParameter("dateonwhlegactwainit")))
						+ "',BALANCE_ON_FORECLOSURE ='" + NullCheck.isNotNull(request.getParameter("outstabalatforclsdate")) + "',SALE_BY_LEVY_DATE ='" + NullCheck.isNotNull(df1.formatdate(request.getParameter("dateofsalbylevy")) )+ "',SALE_REF_NO ='"
												 + NullCheck.isNotNull(request.getParameter("leavysalrefno")) + "',SECURITY_ENFORCED ='" +NullCheck.isNotNull( request.getParameter("securenforced")) + "',ACTUAL_SALE_DATE ='" + NullCheck.isNotNull(df1.formatdate(request.getParameter("dateofactusal"))) + "',AMOUNT_OF_SALE ='"+ NullCheck.isNotNull(request.getParameter("amtofactusal"))
												 	+ "',AMT_ATTRIBUTED_BANK ='"+ NullCheck.isNotNull(request.getParameter("amtattritobank"))
												 	+ "',RECOVERY_COST ='"+NullCheck.isNotNull( request.getParameter("acturecovcosts"))
												 	+ "',ASSET_PURCHASED ='"+NullCheck.isNotNull( request.getParameter("statwheasstwerpurbank"))
												 	
										+ "',REPORT_DATE ='"
			
						+ df1.formatdate(request.getParameter("dt2")) 
						+ "',DEL_FLG='M'"+ " where CUST_NAME ='" + NullCheck.isNotNull(request.getParameter("customername")) +"'and UNIQUE_ID ='" + NullCheck.isNotNull(request.getParameter("uniqidentinoofcust")) +"' and REPORT_DATE ='" + df1.formatdate(request.getParameter("dt2"))+"'");
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
						"INSERT INTO SUP1100_MOD_TABLE(REPORT_REF_NO, CUST_NAME,UNIQUE_ID,SANC_DATE,TYPE_OF_FACILITY,AMT,PURPOSE, SECURITY_DETAILS,SEC_VALUATION_DT,SEC_VALUE,SEC_VALUER_NAME,NPA_DATE,REALIS_VALUE_OF_SEC,PROVISION,LEGAL_ACTION_Dt,BALANCE_ON_FORECLOSURE,SALE_BY_LEVY_DATE,SALE_REF_NO,SECURITY_ENFORCED,ACTUAL_SALE_DATE,AMOUNT_OF_SALE,AMT_ATTRIBUTED_BANK,RECOVERY_COST,ASSET_PURCHASED ,REPORT_DATE,DEL_FLG,LCHG_USER_ID,LCHG_TIME)"
								+ "values('" + ReporefSeq + "','" + request.getParameter("customername")
								+ "','" + request.getParameter("uniqidentinoofcust") + "','"
								+ df1.formatdate(request.getParameter("sanctiondate")) + "','" 
								+ request.getParameter("typeoffacility") + "','"
								+ request.getParameter("amtsantioned") + "','" 
								+request.getParameter("purpose") + "','"
								+ request.getParameter("detaiofsecurity") + "','" 
								+df1.formatdate(request.getParameter("lastvaluadate")) + "','"
								+ request.getParameter("valueofsecurity") + "','"
								+ request.getParameter("nameofvaluer") + "','" 
								+ df1.formatdate(request.getParameter("dateclassiasnpa")) + "','"
								+ request.getParameter("estirealivalofsecur") + "','" 
								+ request.getParameter("amtofprovismade") + "','"
								+df1.formatdate(request.getParameter("dateonwhlegactwainit")) + "','" 
								+ request.getParameter("outstabalatforclsdate") + "','" 
								+ df1.formatdate(request.getParameter("dateofsalbylevy")) + "','" 
								+ request.getParameter("leavysalrefno") + "','" 
								+ request.getParameter("securenforced") + "','" 
								+ df1.formatdate(request.getParameter("dateofactusal")) + "','" 
								+ request.getParameter("amtofactusal") + "','"  
								+ request.getParameter("amtattritobank") + "','" 
										+ request.getParameter("acturecovcosts") + "','" 
												+ request.getParameter("statwheasstwerpurbank") + "','" 
								+df1.formatdate(request.getParameter("dt2"))+ "','"+ request.getParameter("modtyp") + "','" + session.getAttribute("userName")
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

	/*	}*/

		return "success";

	}
	
	public ArrayList<XBRLSUP1100Bean> xbrlsup1100(String dt1,String dt2,String curr) {
		
			log.info("BLS0106 List Data AB " + dt1 + "dt22222" + dt2);
			
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			
			ArrayList<XBRLSUP1100Bean> arl = new ArrayList<XBRLSUP1100Bean>();
			
			String status = "";
			
			ConnectionManager connMgr = new ConnectionManager();
			Connection conn = connMgr.getConnection();
			
			PreparedStatement ps = null;
			
			StringBuffer sql = new StringBuffer();
			
			
			DateFormat df=new DateFormat();		
			dt1 =df.formatdate(dt1);
			dt2 =df.formatdate(dt2);
			
		
			try {

				//sql.append("SELECT DYNAMIC_DOMAIN,to_char(REP_DATE,'DD-MM-YYYY')REP_DATE,INSTITUTE_ID,TRAN_ID,INSTITUTE_NAME,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,SECTOR,SPOT_RATE,FWD_RATE,to_char(DUE_DATE,'DD-MM-YYYY')DUE_DATE,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME    FROM   FIM0400_MAST_TABLE  Where  REP_DATE >='"+dt1+"' and REP_DATE <= '"+dt2+"' ORDER BY cast(TRAN_ID as int) ASC ");
				
				//sql.append("SELECT MODES,CHQ_ALPHA,CHQ_NUMBER,ACCT_NUMBER,ACCT_NAME,to_char(TRAN_DATE,'DD-MM-YYYY')TRAN_DATE,to_char(VALUE_DATE,'DD-MM-YYYY')VALUE_DATE,CHQ_AMOUNT,CRNCY,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME    FROM   PYM0100_MAST_TABLE  Where  TRAN_DATE >='"+dt1+"' and TRAN_DATE <= '"+dt2+"' ORDER BY TRAN_DATE  ASC ");
			
				sql.append("SELECT /* +FIRST_ROWS(100) */ ACCT_NUMBER,ACCT_NAME,TRANSFERABLE_FLG,SCHM_TYPE,NATURE_OF_CUSTOMER,NRE_FLG,CURRENCY_CODE,BALANCE_AMT,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME FROM TABLE(BLS0106_DTL_FUN('BLS0106','0','0','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
					
				
				log.info("Normal Kumar BLS"+sql.toString());
				
				ps=conn.prepareStatement(sql.toString());
				
			    ResultSet rs=ps.executeQuery();
			     

				while(rs.next()){
				//	log.info("whileee");
					XBRLSUP1100Bean xb=new XBRLSUP1100Bean();
					
			
					/*xb.setAccountNumber(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
					xb.setAccountName(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
					xb.setTransferflg(NullCheck.isNotNull(rs.getString("TRANSFERABLE_FLG")));
					xb.setSchemetype(NullCheck.isNotNull(rs.getString("SCHM_TYPE")));
					xb.setNatureofcustomer(NullCheck.isNotNull(rs.getString("NATURE_OF_CUSTOMER")));
					xb.setNreflg(NullCheck.isNotNull(rs.getString("NRE_FLG")));  
					xb.setCurrency(NullCheck.isNotNull(rs.getString("CURRENCY_CODE")));
					xb.setBalanceamt(NullCheck.isNotNull(rs.getString("BALANCE_AMT")));
					xb.setReportdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));*/
					
					xb.setDelflg(NullCheck.isNotNull(rs.getString("DEL_FLG")));
					xb.setRcrusrid(NullCheck.isNotNull(rs.getString("RCRE_USER_ID")));
					xb.setRcrtime(NullCheck.isNotNull(rs.getString("RCRE_TIME")));
					xb.setLchgusrid(NullCheck.isNotNull(rs.getString("LCHG_USER_ID")));
					xb.setLchgtime(NullCheck.isNotNull(rs.getString("LCHG_TIME")));
					
			 
				    arl.add(xb);
				}
			
			
			log.info("ARLLL"+arl.size());
			
			
			
			}catch (SQLException e) {
				
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
			return arl;
					}


	public ArrayList<XBRLSUP1100Bean> xbrlpym4RR(String dt1,String dt2,String ReporefSeq,String instno,String curr) {
	
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLSUP1100Bean> arl = new ArrayList<XBRLSUP1100Bean>();
			
		
		String status = "";
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		
		PreparedStatement ps = null;
		
		StringBuffer sql = new StringBuffer();
		
		
		DateFormat df=new DateFormat();
		
		dt1 =df.formatdate(dt1);
		dt2 =df.formatdate(dt2);
		

		try {
		
			sql.append("SELECT MODES,CHQ_ALPHA,CHQ_NUMBER,ACCT_NUMBER,ACCT_NAME,to_char(TRAN_DATE,'DD-MM-YYYY')TRAN_DATE,to_char(VALUE_DATE,'DD-MM-YYYY')VALUE_DATE,CHQ_AMOUNT,CRNCY,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME    FROM   PYM0100_MAST_TABLE where TRAN_DATE >='"+dt1+"' and TRAN_DATE <= '"+dt2+"'  and CHQ_NUMBER not in (Select CHQ_NUMBER from PYM0100_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq+"')	UNION all	SELECT MODES,CHQ_ALPHA,CHQ_NUMBER,ACCT_NUMBER,ACCT_NAME,to_char(TRAN_DATE,'DD-MM-YYYY')TRAN_DATE,to_char(VALUE_DATE,'DD-MM-YYYY')VALUE_DATE,CHQ_AMOUNT,CRNCY,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME    FROM   PYM0100_MOD_TABLE Where   REPORT_REF_NO ='"+ReporefSeq+"' ") ;
			
			sql.append("SELECT /* +FIRST_ROWS(100) */ MODES,CHQ_NUMBER,ACCT_NUMBER,ACCT_NAME,to_char(TRAN_DATE,'DD-MM-YYYY')TRAN_DATE,CHQ_AMOUNT,CRNCY,DEL_FLG,RCRE_USER_ID,RCRE_TIME,LCHG_USER_ID,LCHG_TIME FROM TABLE(PYM0100_DTL_FUN('PYM0100','"+ReporefSeq+"','"+instno+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");
			
		log.info("DOC&&&&SELECT"+sql.toString());
		try {
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			
			XBRLSUP1100Bean xb=new XBRLSUP1100Bean();
			
			/*
			xb.setAccountNumber(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
			xb.setAccountName(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
			xb.setCurrency(NullCheck.isNotNull(rs.getString("CRNCY")));			
			xb.setDelflg(NullCheck.isNotNull(rs.getString("DEL_FLG")));
			xb.setRcrusrid(NullCheck.isNotNull(rs.getString("RCRE_USER_ID")));
			xb.setRcrtime(NullCheck.isNotNull(rs.getString("RCRE_TIME")));
			xb.setLchgusrid(NullCheck.isNotNull(rs.getString("LCHG_USER_ID")));
			xb.setLchgtime(NullCheck.isNotNull(rs.getString("LCHG_TIME")));
			*/
			
			
			
			
			 arl.add(xb);
		}
		}catch(SQLException e){
			e.printStackTrace();
		}
			
		
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
		return arl;
				}
	


	
	public ArrayList<XBRLSUP1100Bean> ReporefSeq(String dt2){
		
		
		
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		String status = "";
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();
		DateFormat df=new DateFormat();		
		//dt1 =df.formatdate(dt1);
		dt2 =df.formatdate(dt2);
		
		log.info("inside the report seq");
		
		ArrayList<XBRLSUP1100Bean> arl = new ArrayList<XBRLSUP1100Bean>();
		
		sql.append("select REPORT_REF_NO from FIM0900_MOD_TABLE where REPORT_DATE = '"+dt2+"' GROUP BY REPORT_REF_NO ORDER BY REPORT_REF_NO");
		
		log.info("SELECTPROFILE"+sql.toString());
		
		try {
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
		
				XBRLSUP1100Bean xel=new XBRLSUP1100Bean();
				
				xel.setReporef(NullCheck.isNotNull(rs.getString("REPORT_REF_NO")));
				
				
				
		
		arl.add(xel);
			}
		}catch (SQLException e) {
			
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
		return arl;
	}
	

	
	
	/***********PDF and EXCEL HEADER FROM XBRL REPORT MASTER***************/
	public XBRLReportMasterBean xbrlsummarypdf(String ReporefSeq){
	
		XBRLReportMasterBean xb=new XBRLReportMasterBean();
		HttpServletRequest request=ServletActionContext.getRequest();
		ConnectionManager conmgr=new ConnectionManager();
		Connection conn=conmgr.getConnection();
		PreparedStatement ps=null;
		StringBuffer sql=new StringBuffer();
		
		sql.append("SELECT * FROM XBRL_REPORT_MASTER_TB WHERE REPORT_ID='"+ReporefSeq+"'");
		try {
			log.info(sql.toString());
			 ps=conn.prepareStatement(sql.toString());
			
			 ResultSet rs=ps.executeQuery();
			 while(rs.next()) {
				 xb.setRprtid(rs.getString("REPORT_ID"));
				 xb.setRptname(rs.getString("REPORT_NAME"));
				 xb.setRptfreq(rs.getString("REPORT_FREQUENCY"));
				 xb.setTaxver(rs.getString("XBRL_TAXONOMY_VERSION"));
				 xb.setInstcode(rs.getString("INSTITUTION_CODE"));
				 xb.setInstname(rs.getString("INSTITUTION_NAME"));
				 xb.setInstcat(rs.getString("INSTITUTION_CATEGORY"));
				 xb.setToolname(rs.getString("TOOL_NAME"));
				 xb.setToolver(rs.getString("TOOL_VERSION"));
				
			 }
		}catch (SQLException e) {
			
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
	
		return xb;
			
	}
		
	
	public String summarySUP1100detail() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("in summarySUP1100detail");

		log.info("test----->" + request.getParameter("reportrefnos") + "dt333"
				 + df.formatdate(request.getParameter("dt2")));
		XBRLSUP1100Dao bsd = new XBRLSUP1100Dao();
		/*ArrayList<XBRLFIM0900Bean> arl = bsd.xbrlfim0900sumEP(df.formatdate(request.getParameter("dt1")),df.formatdate(request.getParameter("dt2")), request.getParameter("reportrefnos"),request.getParameter("curr"));*/
		ArrayList<XBRLSUP1100Bean> arl = bsd.xbrlsup1100sumEP(df.formatdate(request.getParameter("dt2")), request.getParameter("reportrefnos"),request.getParameter("curr"));
		// summarystandard = arl.toArray(new String[arl.size()]);
		log.info("ARL------------>" + arl.size());
		Gson gson = new Gson();
		summarySUP1100 = gson.toJson(arl);

		return "success";

	}

	public String detailSUP1100() {

		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("test----->" );
		
		XBRLSUP1100Dao bsd = new XBRLSUP1100Dao();
		log.info("testgfr----->" );
		
		
		log.info("test----->" + request.getParameter("ReporefSeq") + "dt333"
				 +  df.formatdate(request.getParameter("dt1")));
		ArrayList<XBRLSUP1100Bean> arl = bsd.xbrlsup1100ajaxdetails(request.getParameter("reptype"),
				request.getParameter("ReporefSeq"),request.getParameter("instno"),
				df.formatdate(request.getParameter("dt2")), df.formatdate(request.getParameter("dt1")),request.getParameter("curr"));

		
	
		log.info("test----->" );
		Gson gson = new Gson();
		detSUP1100 = gson.toJson(arl);

		return "success";

	}

	
	
}
