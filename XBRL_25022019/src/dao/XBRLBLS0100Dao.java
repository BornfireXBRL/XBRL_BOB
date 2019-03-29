package dao;


import java.sql.CallableStatement;

/****************************************************************************************************************
*																												*
* 	* @companyName 			:	Bonfire Innovation Private Limited Chennai										*
* 	* @project 				:	Extensible Business Reporting Language (XBRL)									*
* 	* @name 				:	XBRLBLS0100Action.java															*
* 	* @path 				:	action																			*
* 	* @author 				:	D PraveenBabu																	*
* 	* @version 				: 	1.0																				*
* 	* @functionality 		:	It contains the action with multiple methods to create SUP01400 Report.													*
* 	* @relatedScripts 		: 	bean.XBRLBLS100Bean.java,dao.XBRLBLS0100Dao.java 								*
* 	* @creationDate 		:																					*
* 	* @lastModifiedDate 	:																					*
* 	* @modificationHistory 	: 																					*
*																												*
****************************************************************************************************************/



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.log4j.Logger;

import com.google.gson.Gson;

import basecode.DateFormat;

import bean.XBRLBLS0100Bean;
import bean.XBRLBLS0100Bean;
import bean.XBRLBLS0100Bean;
import bean.XBRLBLS0100Bean;
import bean.XBRLBLS0100Bean;
import utilities.ConnectionManager;
import utilities.NullCheck;

public class XBRLBLS0100Dao {
	static Logger log = Logger.getLogger(XBRLBLS0100Dao.class);

	public String cnt;
	public String getCnt() {
		return cnt;
	}

	public void setCnt(String cnt) {
		this.cnt = cnt;
	}

	public String bls0100sec1;
	
	
	public String getBls0100sec1() {
		return bls0100sec1;
	}

	public void setBls0100sec1(String bls0100sec1) {
		this.bls0100sec1 = bls0100sec1;
	}

	public String Reporef;

	public String getReporef() {
		return Reporef;
	}

	public void setReporef(String reporef) {
		Reporef = reporef;
	}
	
	
	public int cnt1;
	
	
	public int getCnt1() {
		return cnt1;
	}

	public void setCnt1(int cnt1) {
		this.cnt1 = cnt1;
	}

	public ArrayList<XBRLBLS0100Dao> ReporefSeq(String dt1, String dt2) {

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		String status = "";

		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();
		DateFormat df = new DateFormat();
		dt1 = df.formatdate(dt1);
		dt2 = df.formatdate(dt2);

		ArrayList<XBRLBLS0100Dao> arl = new ArrayList<XBRLBLS0100Dao>();
		sql.append("select REPORT_REF_NO from BLS0100_MOD_TABLE where REPORT_DATE='" + dt2 + "' ORDER BY REPORT_REF_NO");

		log.info("SELECTPROFILE" + sql.toString());

		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLBLS0100Dao xel = new XBRLBLS0100Dao();
				xel.setReporef(NullCheck.isNotNull(rs.getString("REPORT_REF_NO")));

				arl.add(xel);
			}
		} catch (SQLException e) {

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
	public ArrayList<XBRLBLS0100Bean>BLS0100verify(){
		
		ArrayList<XBRLBLS0100Bean> arl = new ArrayList<XBRLBLS0100Bean>();
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();
		DateFormat df=new DateFormat();		
		sql.setLength(0);
		sql.append("SELECT /* +FIRST_ROWS(100) */ACCT_NO,ACCT_NAME,CUST_ID,GLSH_CODE,SCH_CODE,SCH_TYPE,ACCT_CRNCY_CODE,to_char(EAB_DATE,'DD-MM-YYYY')EAB_DATE,to_char(EAB_BAL, '9,999,999,999,990.99')EAB_BAL,DECODE(DEL_FLG,'A','Added','M','Modified','D','Deleted') as DEL_FLG ,LCHG_USER_ID FROM BLS0100_MOD_TABLE");
		log.info("Gayu"+sql.toString());
		try {
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLBLS0100Bean xb=new XBRLBLS0100Bean();


			
			xb.setAccno(NullCheck.isNotNull(rs.getString("ACCT_NO")));
				xb.setAccname(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
				xb.setCustid(NullCheck.isNotNull(rs.getString("CUST_ID")));
				xb.setGlshcode(NullCheck.isNotNull(rs.getString("GLSH_CODE")));
				xb.setSchmcode(NullCheck.isNotNull(rs.getString("SCH_CODE")));
				xb.setSchmtyp(NullCheck.isNotNull(rs.getString("SCH_TYPE")));
				xb.setAccrycde(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
				xb.setBaldte(NullCheck.isNotNull(rs.getString("EAB_DATE")));
				xb.setBalamt(NullCheck.isNotNull(rs.getString("EAB_BAL")));
			    xb.setModtyp(NullCheck.isNotNull(rs.getString("DEL_FLG")));
			    xb.setEntryuser(NullCheck.isNotNull(rs.getString("LCHG_USER_ID")));
			 arl.add(xb);
		}
		}catch(SQLException e){
			e.printStackTrace();
		}
			
		
		finally {

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
	
	
	public String BLS0100sec1filter() {

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		ArrayList<XBRLBLS0100Bean> arl = new ArrayList<XBRLBLS0100Bean>();
		NullCheck chk = new NullCheck();
		String status = "";

		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();

		PreparedStatement ps = null;

		StringBuffer sql = new StringBuffer();

		DateFormat df = new DateFormat();

		DecimalFormat dfs = new DecimalFormat("##,##.00");
		log.info("col_value:" + request.getParameter("colvalue"));
		try {

			sql.append(
					"SELECT /* +FIRST_ROWS(100) */REMARKS,ACCT_NO,ACCT_NAME,CUST_ID,GLSH_CODE,SCH_CODE,SCH_TYPE,ACCT_CRNCY_CODE,to_char(EAB_DATE,'DD-MM-YYYY')EAB_DATE,to_char(EAB_BAL, '9,999,999,999,990.99')EAB_BAL FROM TABLE(BLS0100_S1_DTL_FUN('"
							+ request.getParameter("reptype") + "','" + request.getParameter("ReporefSeq") + "','"
							+ request.getParameter("instno") + "','" + df.formatdate(request.getParameter("dt2"))
							+ "','" + df.formatdate(request.getParameter("dt1")) + "','"
							+ df.formatdate(request.getParameter("dt1")) + "','" + request.getParameter("curr")
							+ "')) where " + request.getParameter("colname") + " like '%"
							+ request.getParameter("colvalue") + "%'");

			log.info("BLS  Kumar  " + sql.toString());

			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLBLS0100Bean xb = new XBRLBLS0100Bean();
				xb.setRmks(NullCheck.isNotNull(rs.getString("REMARKS")));
				xb.setAccno(NullCheck.isNotNull(rs.getString("ACCT_NO")));
				xb.setAccname(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
				xb.setCustid(NullCheck.isNotNull(rs.getString("CUST_ID")));
				xb.setGlshcode(NullCheck.isNotNull(rs.getString("GLSH_CODE")));
				xb.setSchmcode(NullCheck.isNotNull(rs.getString("SCH_CODE")));
				xb.setSchmtyp(NullCheck.isNotNull(rs.getString("SCH_TYPE")));
				xb.setAccrycde(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
				xb.setBaldte(NullCheck.isNotNull(rs.getString("EAB_DATE")));
				xb.setBalamt(NullCheck.isNotNull(rs.getString("EAB_BAL")));

				arl.add(xb);

			}

			log.info("ARLLL" + arl.size());

		} catch (SQLException e) {

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

		Gson gson = new Gson();
		bls0100sec1 = gson.toJson(arl);
		System.out.print(bls0100sec1);
		return "success";
	}

	
	public String BLS0100verifymaster() {
		String status="";
		HttpServletRequest request = ServletActionContext.getRequest();
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		HttpSession session = request.getSession();
		StringBuffer sql = new StringBuffer();
		DateFormat df=new DateFormat();	
		
		//------------------get data from mod table---------------------
		XBRLBLS0100Bean xb=new XBRLBLS0100Bean();
		
		sql.setLength(0);
		sql.append("SELECT ACCT_NO,ACCT_NAME,CUST_ID,GLSH_CODE,SCH_CODE,SCH_TYPE,ACCT_CRNCY_CODE,to_char(EAB_DATE,'DD-MM-YYYY')EAB_DATE,to_char(EAB_BAL, '9,999,999,999,990.99')EAB_BAL,DEL_FLG,LCHG_USER_ID FROM BLS0100_MOD_TABLE "
				+ "WHERE ACCT_NO='"+NullCheck.isNotNull(request.getParameter("accno"))+"' AND EAB_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("baldt")))+"' ");
		log.info("Gayu"+sql.toString());
		try {
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			

			
			    xb.setAccno(NullCheck.isNotNull(rs.getString("ACCT_NO")));
				xb.setAccname(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
				xb.setCustid(NullCheck.isNotNull(rs.getString("CUST_ID")));
				xb.setGlshcode(NullCheck.isNotNull(rs.getString("GLSH_CODE")));
				xb.setSchmcode(NullCheck.isNotNull(rs.getString("SCH_CODE")));
				xb.setSchmtyp(NullCheck.isNotNull(rs.getString("SCH_TYPE")));
				xb.setAccrycde(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
				xb.setBaldte(NullCheck.isNotNull(rs.getString("EAB_DATE")));
				xb.setBalamt(NullCheck.isNotNull(rs.getString("EAB_BAL")));
				xb.setModtyp(NullCheck.isNotNull(rs.getString("DEL_FLG")));
			    xb.setEntryuser(NullCheck.isNotNull(rs.getString("LCHG_USER_ID")));
		}
		}catch(SQLException e){
			e.printStackTrace();
		}
			
		
		finally {

			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					
				}
			}
			/*if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					
				}
			}*/
		}

		//---------------get data from mod table------------------------
		
		
		
		
		
		if (xb.getModtyp().equals("A") ) {
			
		//For Added Records
			
			
			sql.setLength(0);
			sql.append(
					" INSERT INTO BLS0100_MAST_TABLE(REPORT_DATE,ACCT_NO,ACCT_NAME,CUST_ID,GLSH_CODE,SCH_CODE,SCH_TYPE,ACCT_CRNCY_CODE,EAB_DATE,EAB_BAL,DEL_FLG,LCHG_USER_ID,LCHG_TIME,VERIFY_USER_ID,VERIFY_TIME)" + "VALUES ('"
							 + df.formatdate(request.getParameter("dt2")) + "','"
											+ request.getParameter("accno") + "','" + request.getParameter("acc") + "','"
											+ request.getParameter("custid") + "','" + request.getParameter("glsh") + "','"
											+ request.getParameter("schmc") + "','" + request.getParameter("schmt") + "','"
											+ request.getParameter("accrycd") + "','" + df.formatdate(request.getParameter("baldt")) + "','"
											+ request.getParameter("bal") + "','"+request.getParameter("modtyp")+"','"
							+ session.getAttribute("userName")+"',SYSDATE,'"+ session.getAttribute("userName")+"',SYSDATE)");
					
			try {
				log.info(sql.toString());
				ps=conn.prepareStatement(sql.toString());
				
			    int rs=0;
			    rs=ps.executeUpdate();
			     
			    status="success";
			    
			    sql.setLength(0);
			    sql.append("DELETE FROM BLS0100_MOD_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("dt2")))+"' and ACCT_NO='"+NullCheck.isNotNull(request.getParameter("accno"))+"'");
			    try {
					log.info(sql.toString());
					ps=conn.prepareStatement(sql.toString());
					
				    int rs1=0;
				    rs1=ps.executeUpdate();
				     
				    status="success";
			    }
			    catch(SQLException e) {
					e.printStackTrace();
					status="error";
				}
			    
			    
			}catch(SQLException e) {
				e.printStackTrace();
				status="error";
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
			
		}else if (xb.getModtyp().equals("M") ) {
			
		//For Modified Records
			
			sql.setLength(0);
			sql.append("UPDATE BLS0100_MOD_TABLE SET ACCT_NAME='" + request.getParameter("acc")
			+ "', CUST_ID ='" + request.getParameter("custid")
			+ "', GLSH_CODE='" + request.getParameter("glsh")
			+ "', SCH_CODE ='" + request.getParameter("schmc")
			+ "', SCH_TYPE ='" + request.getParameter("schmt")
			+ "', ACCT_CRNCY_CODE ='" + request.getParameter("accrycd")
			+ "', EAB_BAL  ='" + request.getParameter("bal")
			+ "', EAB_DATE='" + df.formatdate(request.getParameter("baldt")) + "',VERIFY_USER_ID='"+session.getAttribute("userName")+"',VERIFY_TIME=SYSDATE "
			+ "WHERE EAB_DATE='"
			+ df.formatdate(request.getParameter("baldt")) + "' " + "AND ACCT_NO='"
			+ request.getParameter("accno")
			+ "'");
			try {
				log.info(sql.toString());
				ps=conn.prepareStatement(sql.toString());
				
			    int rs=0;
			    rs=ps.executeUpdate();
			     
			    status="success";
			    
			    sql.setLength(0);
			    sql.append("DELETE FROM BLS0100_MOD_TABLE WHERE EAB_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("baldt")))+"' and ACCT_NO='"+NullCheck.isNotNull(request.getParameter("accno"))+"'");
			    try {
					log.info(sql.toString());
					ps=conn.prepareStatement(sql.toString());
					
				    int rs1=0;
				    rs1=ps.executeUpdate();
				     
				    status="success";
			    }
			    catch(SQLException e) {
					e.printStackTrace();
					status="error";
				}
			    
			    
			}catch(SQLException e) {
				e.printStackTrace();
				status="error";
			}finally {

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
			
			
		}else if (xb.getModtyp().equals("D") ) {
			
		//For Deleted Records
			
			sql.setLength(0);
			sql.append("DELETE FROM BLS0100_MAST_TABLE WHERE EAB_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("baldt")))+"' and ACCT_NO='"+NullCheck.isNotNull(request.getParameter("accno"))+"'");
			
			try {
				log.info(sql.toString());
				ps=conn.prepareStatement(sql.toString());
				
			    int rs=0;
			    rs=ps.executeUpdate();
			     
			    status="success";
			    
			    sql.setLength(0);
			    sql.append("UPDATE BLS0100_MOD_TABLE SET LCHG_USER_ID='"+session.getAttribute("userName")+"' WHERE EAB_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("baldt")))+"' and ACCT_NO='"+NullCheck.isNotNull(request.getParameter("accno"))+"'");
			    try {
					log.info(sql.toString());
					ps=conn.prepareStatement(sql.toString());
					
				    int rs1=0;
				    rs1=ps.executeUpdate();
				     
				    status="success";
			    }
			    catch(SQLException e) {
					e.printStackTrace();
					status="error";
				}
			    
			    
			    sql.setLength(0);
			    sql.append("DELETE FROM BLS0100_MOD_TABLE WHERE EAB_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("baldt")))+"' and ACCT_NO='"+NullCheck.isNotNull(request.getParameter("accno"))+"'");
			    try {
					log.info(sql.toString());
					ps=conn.prepareStatement(sql.toString());
					
				    int rs1=0;
				    rs1=ps.executeUpdate();
				     
				    status="success";
			    }
			    catch(SQLException e) {
					e.printStackTrace();
					status="error";
				}
			    
			    
			}catch(SQLException e) {
				e.printStackTrace();
				status="error";
			}
			finally {

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
		}
		
		
		
		
		
		
		return status;
	}

	public String BLS0100chckmodified() {

		HttpServletRequest request = ServletActionContext.getRequest();
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		HttpSession session = request.getSession();
		StringBuffer sql = new StringBuffer();
		DateFormat df=new DateFormat();		
		sql.setLength(0);
		if(request.getParameter("type").equals("chkuser")) {
			sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM BLS0100_MOD_TABLE ");
		}else {
			sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM BLS0100_MOD_TABLE ");

		}
		
		
		try {
			ps=conn.prepareStatement(sql.toString());
			log.info(sql.toString());
		    ResultSet rs=ps.executeQuery();
		      while(rs.next()) {
		    	  cnt=NullCheck.isNotZero(rs.getString("CNT"));
		      }
		    
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return "success";
	}

	public String resalert;
	
	public String getResalert() {
		return resalert;
	}

	public void setResalert(String resalert) {
		this.resalert = resalert;
	}
	public String modBLS0100cancel() {
		String status="";
		HttpServletRequest request = ServletActionContext.getRequest();
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();
		DateFormat df=new DateFormat();		
		sql.setLength(0);
		log.info("sf+");
		sql.append("DELETE FROM BLS0100_MOD_TABLE WHERE  ACCT_NO='"+NullCheck.isNotNull(request.getParameter("accno"))+"'");
		
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		}catch(SQLException e) {
			e.printStackTrace();
			status="error";
		}
		
		if(status.equals("success")) {
			resalert="Cancelation Successful";
		}else {
			resalert="Technical Issue.Try Again Later.";
		}
		
		return "success";
	}


	public String detailBLS0100savecheck() {

		ConnectionManager connmgr=new ConnectionManager();
		Connection conn=connmgr.getConnection();
		ArrayList<String> arl = new ArrayList<String>();
				HttpServletRequest request = ServletActionContext.getRequest();
				DateFormat df = new DateFormat();
				StringBuffer sql = new StringBuffer();
				PreparedStatement ps = null;
				
				sql.append("SELECT COUNT(REPORT_DATE) as repdate FROM BLS0100_S1_RPT_TB where REPORT_ID = '"+request.getParameter("reptype")+"' AND  REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ");
				 log.info(sql.toString());
					
					try {
						ps = conn.prepareStatement(sql.toString());
						ResultSet rs = ps.executeQuery();
					

						while (rs.next()) {
							
							cnt1=rs.getInt("repdate");
						
						}
						log.info("fdsafdsaf"+cnt1);

						
					
					
					} catch (SQLException e) {
						
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

					return "success";

				}
	
	
	
	
	
public ArrayList<XBRLBLS0100Bean> xbrlBLS0100(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
		
		
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLBLS0100Bean> arl = new ArrayList<XBRLBLS0100Bean>();
		
		String status = "";
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		
		PreparedStatement ps = null;
		
		StringBuffer sql = new StringBuffer();
		
		
		DateFormat df=new DateFormat();		
		dt1 =df.formatdate(dt1);
		dt2 =df.formatdate(dt2);
		
		log.info("currency"+curr);
		
		 DecimalFormat dfs = new DecimalFormat("##,##.00");  
		 NullCheck chk=new NullCheck();
	
		try {
		
				
				//sql.append("select SL_NO,CUST_NAME,RESIDENT_STATUS,COUNTRY,UNIQUE_IDENTITY,ISIC_CODE,ACCT_NUMBER,GROUP_CODE,to_char(OUTSTANDING_AMT, '9,999,999,999,990.99')OUTSTANDING_AMT,to_char(OUTSTANDING_NFB_AMT, '9,999,999,999,990.99')OUTSTANDING_NFB_AMT  from table(PSC0200_S1_RPT_FUN('"+reptype+"','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
				
				sql.append("SELECT REF_CODE_DESC,INSTANCE_CODE,to_char(CENTRAL_BANK, '9,999,999,999,990.99')CENTRAL_BANK,to_char(BANKS, '9,999,999,999,990.99')BANKS,to_char(NON_BNK, '9,999,999,999,990.99')NON_BNK,to_char(CREDIT_UNIONS, '9,999,999,999,990.99')CREDIT_UNIONS,to_char(FIN_GBC1, '9,999,999,999,990.99')FIN_GBC1,to_char(TRUSTS_NR_GBC, '9,999,999,999,990.99')TRUSTS_NR_GBC,to_char(INSURANCE_CORP, '9,999,999,999,990.99')INSURANCE_CORP,to_char(PENSION, '9,999,999,999,990.99')PENSION,to_char(INVESTMENT, '9,999,999,999,990.99')INVESTMENT,to_char(HOLDING_COMP, '9,999,999,999,990.99')HOLDING_COMP,to_char(FINANCIAL_AUX, '9,999,999,999,990.99')FINANCIAL_AUX,to_char(CENTRAL_GOV, '9,999,999,999,990.99')CENTRAL_GOV,to_char(STATE_LOC_GOV, '9,999,999,999,990.99')STATE_LOC_GOV,to_char(NON_FINANCE_GBC, '9,999,999,999,990.99')NON_FINANCE_GBC,to_char(GBC2, '9,999,999,999,990.99')GBC2,to_char(PUBLIC_NON_FIN_CORP, '9,999,999,999,990.99')PUBLIC_NON_FIN_CORP,to_char(OTH_NON_FIN_CORP, '9,999,999,999,990.99')OTH_NON_FIN_CORP,to_char(HOUSEHOLD, '9,999,999,999,990.99')HOUSEHOLD,to_char(NON_PROF_INSTITUTE, '9,999,999,999,990.99')NON_PROF_INSTITUTE,to_char(AFF_NR, '9,999,999,999,990.99')AFF_NR,to_char(OTH_NR, '9,999,999,999,990.99')OTH_NR,to_char(TOT_LC, '9,999,999,999,990.99')TOT_LC,to_char(FC_CENTRAL_BNK, '9,999,999,999,990.99')FC_CENTRAL_BNK,to_char(FC_BANKS, '9,999,999,999,990.99')FC_BANKS,to_char(FC_NON_BNK, '9,999,999,999,990.99')FC_NON_BNK,to_char(FC_CREDIT_UNIONS, '9,999,999,999,990.99')FC_CREDIT_UNIONS,to_char(FC_FIN_GBC1, '9,999,999,999,990.99')FC_FIN_GBC1,to_char(FC_TRUSTS_NR_GBC, '9,999,999,999,990.99')FC_TRUSTS_NR_GBC,to_char(FC_INSURANCE_CORP, '9,999,999,999,990.99')FC_INSURANCE_CORP,to_char(FC_PENSION, '9,999,999,999,990.99')FC_PENSION,to_char(FC_INVESTMENT, '9,999,999,999,990.99')FC_INVESTMENT,to_char(FC_HOLDING_COMP, '9,999,999,999,990.99')FC_HOLDING_COMP,to_char(FC_FINANCIAL_AUX, '9,999,999,999,990.99')FC_FINANCIAL_AUX,to_char(FC_CENTRAL_GOV, '9,999,999,999,990.99')FC_CENTRAL_GOV,to_char(FC_STATE_LOC_GOV, '9,999,999,999,990.99')FC_STATE_LOC_GOV,to_char(FC_NON_FINANCE_GBC, '9,999,999,999,990.99')FC_NON_FINANCE_GBC,to_char(FC_GBC2, '9,999,999,999,990.99')FC_GBC2,to_char(FC_PUBLIC_NON_FIN_CORP, '9,999,999,999,990.99')FC_PUBLIC_NON_FIN_CORP,to_char(FC_OTH_NON_FIN_CORP, '9,999,999,999,990.99')FC_OTH_NON_FIN_CORP,to_char(FC_HOUSEHOLD, '9,999,999,999,990.99')FC_HOUSEHOLD,to_char(FC_NON_PROF_INSTITUTE, '9,999,999,999,990.99')FC_NON_PROF_INSTITUTE,to_char(FC_AFF_NR_BNK, '9,999,999,999,990.99')FC_AFF_NR_BNK,to_char(FC_AFF_NR_NON_BNK, '9,999,999,999,990.99')FC_AFF_NR_NON_BNK,to_char(FC_OTH_NR_BNK, '9,999,999,999,990.99')FC_OTH_NR_BNK,to_char(FC_OTH_NR_NON_BNK, '9,999,999,999,990.99')FC_OTH_NR_NON_BNK,to_char(TOT_FC, '9,999,999,999,990.99')TOT_FC,to_char(GRAND_TOT, '9,999,999,999,990.99')GRAND_TOT   FROM TABLE(BLS0100_S1_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
				
				
			log.info("BLS0100 1"+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				XBRLBLS0100Bean xb=new XBRLBLS0100Bean();
				
			
				xb.setInstaname(NullCheck.isNotNull(rs.getString("REF_CODE_DESC")));
				xb.setInstcode(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
				xb.setInnccentlbank(NullCheck.isNotNull(rs.getString("CENTRAL_BANK")));
				xb.setInncbank(NullCheck.isNotNull(rs.getString("BANKS")));
				xb.setInncnobnkdeptakins(NullCheck.isNotNull(rs.getString("NON_BNK")));
				xb.setInnccredunio(NullCheck.isNotNull(rs.getString("CREDIT_UNIONS")));
				xb.setInncfingbc1s(NullCheck.isNotNull(rs.getString("FIN_GBC1")));
				xb.setInnctrusnonsetnbeni(NullCheck.isNotNull(rs.getString("TRUSTS_NR_GBC")));
				xb.setInncinsucorp(NullCheck.isNotNull(rs.getString("INSURANCE_CORP")));
				xb.setInncpensifnd(NullCheck.isNotNull(rs.getString("PENSION")));
				xb.setInncinvtfund(NullCheck.isNotNull(rs.getString("INVESTMENT")));
				xb.setInncholdcompan(NullCheck.isNotNull(rs.getString("HOLDING_COMP")));
				xb.setInncfinauxintme(NullCheck.isNotNull(rs.getString("FINANCIAL_AUX")));
				xb.setInnccntragovt(NullCheck.isNotNull(rs.getString("CENTRAL_GOV")));
				xb.setInncstatnlocgovt(NullCheck.isNotNull(rs.getString("STATE_LOC_GOV")));
				xb.setInncnonfingbc1s(NullCheck.isNotNull(rs.getString("NON_FINANCE_GBC")));
				xb.setInncgbc2s(NullCheck.isNotNull(rs.getString("GBC2")));
				xb.setInncpubnonfincorp(NullCheck.isNotNull(rs.getString("PUBLIC_NON_FIN_CORP")));
				xb.setInncothrnonfincorp(NullCheck.isNotNull(rs.getString("OTH_NON_FIN_CORP")));
				xb.setInnchoushold(NullCheck.isNotNull(rs.getString("HOUSEHOLD")));
				xb.setInncnonproinsereshouhld(NullCheck.isNotNull(rs.getString("NON_PROF_INSTITUTE")));
				xb.setInncaffilinonresi(NullCheck.isNotNull(rs.getString("AFF_NR")));
				xb.setInncothrnonresi(NullCheck.isNotNull(rs.getString("OTH_NR")));
				xb.setInnctotnaticrncy(NullCheck.isNotNull(rs.getString("TOT_LC")));
				xb.setInfccentlbank(NullCheck.isNotNull(rs.getString("FC_CENTRAL_BNK")));
				xb.setInfcbank(NullCheck.isNotNull(rs.getString("FC_BANKS")));
				xb.setInfcnobnkdeptakins(NullCheck.isNotNull(rs.getString("FC_NON_BNK")));
				xb.setInfccredunio(NullCheck.isNotNull(rs.getString("FC_CREDIT_UNIONS")));
				xb.setInfcfingbc1s(NullCheck.isNotNull(rs.getString("FC_FIN_GBC1")));
				xb.setInfctrusnonsetnbeni(NullCheck.isNotNull(rs.getString("FC_TRUSTS_NR_GBC")));
				xb.setInfcinsucorp(NullCheck.isNotNull(rs.getString("FC_INSURANCE_CORP")));
				xb.setInfcpensifnd(NullCheck.isNotNull(rs.getString("FC_PENSION")));
				xb.setInfcinvtfund(NullCheck.isNotNull(rs.getString("FC_INVESTMENT")));
				xb.setInfcholdcompan(NullCheck.isNotNull(rs.getString("FC_HOLDING_COMP")));
				xb.setInfcfinauxintme(NullCheck.isNotNull(rs.getString("FC_FINANCIAL_AUX")));
				xb.setInfccntragovt(NullCheck.isNotNull(rs.getString("FC_CENTRAL_GOV")));
				xb.setInfcstatnlocgovt(NullCheck.isNotNull(rs.getString("FC_STATE_LOC_GOV")));
				xb.setInfcnonfingbc1s(NullCheck.isNotNull(rs.getString("FC_NON_FINANCE_GBC")));
				xb.setInfcgbc2s(NullCheck.isNotNull(rs.getString("FC_GBC2")));
				xb.setInfcpubnonfincorp(NullCheck.isNotNull(rs.getString("FC_PUBLIC_NON_FIN_CORP")));
				xb.setInfcothrnonfincorp(NullCheck.isNotNull(rs.getString("FC_OTH_NON_FIN_CORP")));
				xb.setInfchoushold(NullCheck.isNotNull(rs.getString("FC_HOUSEHOLD")));
				xb.setInfcnonproinsereshouhld(NullCheck.isNotNull(rs.getString("FC_NON_PROF_INSTITUTE")));
				xb.setInfcaffilinonresibnk(NullCheck.isNotNull(rs.getString("FC_AFF_NR_BNK")));
				xb.setInfcaffilinonresioth(NullCheck.isNotNull(rs.getString("FC_AFF_NR_NON_BNK")));
				xb.setInfcothrnonresibnk(NullCheck.isNotNull(rs.getString("FC_OTH_NR_BNK")));
				xb.setInfcothrnonresioth(NullCheck.isNotNull(rs.getString("FC_OTH_NR_NON_BNK")));
				xb.setInfctotforeicrncy(NullCheck.isNotNull(rs.getString("TOT_FC")));
				xb.setGrandtotal(NullCheck.isNotNull(rs.getString("GRAND_TOT")));


					
				arl.add(xb);
			   
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
	
public ArrayList<XBRLBLS0100Bean> xbrlBLS0100s2(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {

	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLBLS0100Bean> arl = new ArrayList<XBRLBLS0100Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	
	try {
	
			
			sql.append("SELECT REF_CODE_DESC,INSTANCE_CODE,to_char(CENTRAL_BANK, '9,999,999,999,990.99')CENTRAL_BANK,to_char(BANKS, '9,999,999,999,990.99')BANKS,to_char(NON_BNK, '9,999,999,999,990.99')NON_BNK,to_char(CREDIT_UNIONS, '9,999,999,999,990.99')CREDIT_UNIONS,to_char(FIN_GBC1, '9,999,999,999,990.99')FIN_GBC1,to_char(TRUSTS_NR_GBC, '9,999,999,999,990.99')TRUSTS_NR_GBC,to_char(INSURANCE_CORP, '9,999,999,999,990.99')INSURANCE_CORP,to_char(PENSION, '9,999,999,999,990.99')PENSION,to_char(INVESTMENT, '9,999,999,999,990.99')INVESTMENT,to_char(HOLDING_COMP, '9,999,999,999,990.99')HOLDING_COMP,to_char(FINANCIAL_AUX, '9,999,999,999,990.99')FINANCIAL_AUX,to_char(CENTRAL_GOV, '9,999,999,999,990.99')CENTRAL_GOV,to_char(STATE_LOC_GOV, '9,999,999,999,990.99')STATE_LOC_GOV,to_char(NON_FINANCE_GBC, '9,999,999,999,990.99')NON_FINANCE_GBC,to_char(GBC2, '9,999,999,999,990.99')GBC2,to_char(PUBLIC_NON_FIN_CORP, '9,999,999,999,990.99')PUBLIC_NON_FIN_CORP,to_char(OTH_NON_FIN_CORP, '9,999,999,999,990.99')OTH_NON_FIN_CORP,to_char(HOUSEHOLD, '9,999,999,999,990.99')HOUSEHOLD,to_char(NON_PROF_INSTITUTE, '9,999,999,999,990.99')NON_PROF_INSTITUTE,to_char(AFF_NR, '9,999,999,999,990.99')AFF_NR,to_char(OTH_NR, '9,999,999,999,990.99')OTH_NR,to_char(TOT_LC, '9,999,999,999,990.99')TOT_LC,to_char(FC_CENTRAL_BNK, '9,999,999,999,990.99')FC_CENTRAL_BNK,to_char(FC_BANKS, '9,999,999,999,990.99')FC_BANKS,to_char(FC_NON_BNK, '9,999,999,999,990.99')FC_NON_BNK,to_char(FC_CREDIT_UNIONS, '9,999,999,999,990.99')FC_CREDIT_UNIONS,to_char(FC_FIN_GBC1, '9,999,999,999,990.99')FC_FIN_GBC1,to_char(FC_TRUSTS_NR_GBC, '9,999,999,999,990.99')FC_TRUSTS_NR_GBC,to_char(FC_INSURANCE_CORP, '9,999,999,999,990.99')FC_INSURANCE_CORP,to_char(FC_PENSION, '9,999,999,999,990.99')FC_PENSION,to_char(FC_INVESTMENT, '9,999,999,999,990.99')FC_INVESTMENT,to_char(FC_HOLDING_COMP, '9,999,999,999,990.99')FC_HOLDING_COMP,to_char(FC_FINANCIAL_AUX, '9,999,999,999,990.99')FC_FINANCIAL_AUX,to_char(FC_CENTRAL_GOV, '9,999,999,999,990.99')FC_CENTRAL_GOV,to_char(FC_STATE_LOC_GOV, '9,999,999,999,990.99')FC_STATE_LOC_GOV,to_char(FC_NON_FINANCE_GBC, '9,999,999,999,990.99')FC_NON_FINANCE_GBC,to_char(FC_GBC2, '9,999,999,999,990.99')FC_GBC2,to_char(FC_PUBLIC_NON_FIN_CORP, '9,999,999,999,990.99')FC_PUBLIC_NON_FIN_CORP,to_char(FC_OTH_NON_FIN_CORP, '9,999,999,999,990.99')FC_OTH_NON_FIN_CORP,to_char(FC_HOUSEHOLD, '9,999,999,999,990.99')FC_HOUSEHOLD,to_char(FC_NON_PROF_INSTITUTE, '9,999,999,999,990.99')FC_NON_PROF_INSTITUTE,to_char(FC_AFF_NR_BNK, '9,999,999,999,990.99')FC_AFF_NR_BNK,to_char(FC_AFF_NR_NON_BNK, '9,999,999,999,990.99')FC_AFF_NR_NON_BNK,to_char(FC_OTH_NR_BNK, '9,999,999,999,990.99')FC_OTH_NR_BNK,to_char(FC_OTH_NR_NON_BNK, '9,999,999,999,990.99')FC_OTH_NR_NON_BNK,to_char(TOT_FC, '9,999,999,999,990.99')TOT_FC,to_char(GRAND_TOT, '9,999,999,999,990.99')GRAND_TOT  FROM TABLE(BLS0100_S2_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
	
		log.info("BLS0100 2"+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLBLS0100Bean xb=new XBRLBLS0100Bean();
			
			xb.setInstaname(NullCheck.isNotNull(rs.getString("REF_CODE_DESC")));
			xb.setInstcode(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
			xb.setInnccentlbank(NullCheck.isNotNull(rs.getString("CENTRAL_BANK")));
			xb.setInncbank(NullCheck.isNotNull(rs.getString("BANKS")));
			xb.setInncnobnkdeptakins(NullCheck.isNotNull(rs.getString("NON_BNK")));
			xb.setInnccredunio(NullCheck.isNotNull(rs.getString("CREDIT_UNIONS")));
			xb.setInncfingbc1s(NullCheck.isNotNull(rs.getString("FIN_GBC1")));
			xb.setInnctrusnonsetnbeni(NullCheck.isNotNull(rs.getString("TRUSTS_NR_GBC")));
			xb.setInncinsucorp(NullCheck.isNotNull(rs.getString("INSURANCE_CORP")));
			xb.setInncpensifnd(NullCheck.isNotNull(rs.getString("PENSION")));
			xb.setInncinvtfund(NullCheck.isNotNull(rs.getString("INVESTMENT")));
			xb.setInncholdcompan(NullCheck.isNotNull(rs.getString("HOLDING_COMP")));
			xb.setInncfinauxintme(NullCheck.isNotNull(rs.getString("FINANCIAL_AUX")));
			xb.setInnccntragovt(NullCheck.isNotNull(rs.getString("CENTRAL_GOV")));
			xb.setInncstatnlocgovt(NullCheck.isNotNull(rs.getString("STATE_LOC_GOV")));
			xb.setInncnonfingbc1s(NullCheck.isNotNull(rs.getString("NON_FINANCE_GBC")));
			xb.setInncgbc2s(NullCheck.isNotNull(rs.getString("GBC2")));
			xb.setInncpubnonfincorp(NullCheck.isNotNull(rs.getString("PUBLIC_NON_FIN_CORP")));
			xb.setInncothrnonfincorp(NullCheck.isNotNull(rs.getString("OTH_NON_FIN_CORP")));
			xb.setInnchoushold(NullCheck.isNotNull(rs.getString("HOUSEHOLD")));
			xb.setInncnonproinsereshouhld(NullCheck.isNotNull(rs.getString("NON_PROF_INSTITUTE")));
			xb.setInncaffilinonresi(NullCheck.isNotNull(rs.getString("AFF_NR")));
			xb.setInncothrnonresi(NullCheck.isNotNull(rs.getString("OTH_NR")));
			xb.setInnctotnaticrncy(NullCheck.isNotNull(rs.getString("TOT_LC")));
			xb.setInfccentlbank(NullCheck.isNotNull(rs.getString("FC_CENTRAL_BNK")));
			xb.setInfcbank(NullCheck.isNotNull(rs.getString("FC_BANKS")));
			xb.setInfcnobnkdeptakins(NullCheck.isNotNull(rs.getString("FC_NON_BNK")));
			xb.setInfccredunio(NullCheck.isNotNull(rs.getString("FC_CREDIT_UNIONS")));
			xb.setInfcfingbc1s(NullCheck.isNotNull(rs.getString("FC_FIN_GBC1")));
			xb.setInfctrusnonsetnbeni(NullCheck.isNotNull(rs.getString("FC_TRUSTS_NR_GBC")));
			xb.setInfcinsucorp(NullCheck.isNotNull(rs.getString("FC_INSURANCE_CORP")));
			xb.setInfcpensifnd(NullCheck.isNotNull(rs.getString("FC_PENSION")));
			xb.setInfcinvtfund(NullCheck.isNotNull(rs.getString("FC_INVESTMENT")));
			xb.setInfcholdcompan(NullCheck.isNotNull(rs.getString("FC_HOLDING_COMP")));
			xb.setInfcfinauxintme(NullCheck.isNotNull(rs.getString("FC_FINANCIAL_AUX")));
			xb.setInfccntragovt(NullCheck.isNotNull(rs.getString("FC_CENTRAL_GOV")));
			xb.setInfcstatnlocgovt(NullCheck.isNotNull(rs.getString("FC_STATE_LOC_GOV")));
			xb.setInfcnonfingbc1s(NullCheck.isNotNull(rs.getString("FC_NON_FINANCE_GBC")));
			xb.setInfcgbc2s(NullCheck.isNotNull(rs.getString("FC_GBC2")));
			xb.setInfcpubnonfincorp(NullCheck.isNotNull(rs.getString("FC_PUBLIC_NON_FIN_CORP")));
			xb.setInfcothrnonfincorp(NullCheck.isNotNull(rs.getString("FC_OTH_NON_FIN_CORP")));
			xb.setInfchoushold(NullCheck.isNotNull(rs.getString("FC_HOUSEHOLD")));
			xb.setInfcnonproinsereshouhld(NullCheck.isNotNull(rs.getString("FC_NON_PROF_INSTITUTE")));
			xb.setInfcaffilinonresibnk(NullCheck.isNotNull(rs.getString("FC_AFF_NR_BNK")));
			xb.setInfcaffilinonresioth(NullCheck.isNotNull(rs.getString("FC_AFF_NR_NON_BNK")));
			xb.setInfcothrnonresibnk(NullCheck.isNotNull(rs.getString("FC_OTH_NR_BNK")));
			xb.setInfcothrnonresioth(NullCheck.isNotNull(rs.getString("FC_OTH_NR_NON_BNK")));
			xb.setInfctotforeicrncy(NullCheck.isNotNull(rs.getString("TOT_FC")));
			xb.setGrandtotal(NullCheck.isNotNull(rs.getString("GRAND_TOT")));

					
		
			arl.add(xb);
		   
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

public ArrayList<XBRLBLS0100Bean> xbrlBLS0100s3(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLBLS0100Bean> arl = new ArrayList<XBRLBLS0100Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	 
	try {
	
			
			sql.append("SELECT REF_CODE_DESC,INSTANCE_CODE,to_char(CENTRAL_BANK, '9,999,999,999,990.99')CENTRAL_BANK,to_char(BANKS, '9,999,999,999,990.99')BANKS,to_char(NON_BNK, '9,999,999,999,990.99')NON_BNK,to_char(CREDIT_UNIONS, '9,999,999,999,990.99')CREDIT_UNIONS,to_char(FIN_GBC1, '9,999,999,999,990.99')FIN_GBC1,to_char(TRUSTS_NR_GBC, '9,999,999,999,990.99')TRUSTS_NR_GBC,to_char(INSURANCE_CORP, '9,999,999,999,990.99')INSURANCE_CORP,to_char(PENSION, '9,999,999,999,990.99')PENSION,to_char(INVESTMENT, '9,999,999,999,990.99')INVESTMENT,to_char(HOLDING_COMP, '9,999,999,999,990.99')HOLDING_COMP,to_char(FINANCIAL_AUX, '9,999,999,999,990.99')FINANCIAL_AUX,to_char(CENTRAL_GOV, '9,999,999,999,990.99')CENTRAL_GOV,to_char(STATE_LOC_GOV, '9,999,999,999,990.99')STATE_LOC_GOV,to_char(NON_FINANCE_GBC, '9,999,999,999,990.99')NON_FINANCE_GBC,to_char(GBC2, '9,999,999,999,990.99')GBC2,to_char(PUBLIC_NON_FIN_CORP, '9,999,999,999,990.99')PUBLIC_NON_FIN_CORP,to_char(OTH_NON_FIN_CORP, '9,999,999,999,990.99')OTH_NON_FIN_CORP,to_char(HOUSEHOLD, '9,999,999,999,990.99')HOUSEHOLD,to_char(NON_PROF_INSTITUTE, '9,999,999,999,990.99')NON_PROF_INSTITUTE,to_char(AFF_NR, '9,999,999,999,990.99')AFF_NR,to_char(OTH_NR, '9,999,999,999,990.99')OTH_NR,to_char(TOT_LC, '9,999,999,999,990.99')TOT_LC,to_char(FC_CENTRAL_BNK, '9,999,999,999,990.99')FC_CENTRAL_BNK,to_char(FC_BANKS, '9,999,999,999,990.99')FC_BANKS,to_char(FC_NON_BNK, '9,999,999,999,990.99')FC_NON_BNK,to_char(FC_CREDIT_UNIONS, '9,999,999,999,990.99')FC_CREDIT_UNIONS,to_char(FC_FIN_GBC1, '9,999,999,999,990.99')FC_FIN_GBC1,to_char(FC_TRUSTS_NR_GBC, '9,999,999,999,990.99')FC_TRUSTS_NR_GBC,to_char(FC_INSURANCE_CORP, '9,999,999,999,990.99')FC_INSURANCE_CORP,to_char(FC_PENSION, '9,999,999,999,990.99')FC_PENSION,to_char(FC_INVESTMENT, '9,999,999,999,990.99')FC_INVESTMENT,to_char(FC_HOLDING_COMP, '9,999,999,999,990.99')FC_HOLDING_COMP,to_char(FC_FINANCIAL_AUX, '9,999,999,999,990.99')FC_FINANCIAL_AUX,to_char(FC_CENTRAL_GOV, '9,999,999,999,990.99')FC_CENTRAL_GOV,to_char(FC_STATE_LOC_GOV, '9,999,999,999,990.99')FC_STATE_LOC_GOV,to_char(FC_NON_FINANCE_GBC, '9,999,999,999,990.99')FC_NON_FINANCE_GBC,to_char(FC_GBC2, '9,999,999,999,990.99')FC_GBC2,to_char(FC_PUBLIC_NON_FIN_CORP, '9,999,999,999,990.99')FC_PUBLIC_NON_FIN_CORP,to_char(FC_OTH_NON_FIN_CORP, '9,999,999,999,990.99')FC_OTH_NON_FIN_CORP,to_char(FC_HOUSEHOLD, '9,999,999,999,990.99')FC_HOUSEHOLD,to_char(FC_NON_PROF_INSTITUTE, '9,999,999,999,990.99')FC_NON_PROF_INSTITUTE,to_char(FC_AFF_NR_BNK, '9,999,999,999,990.99')FC_AFF_NR_BNK,to_char(FC_AFF_NR_NON_BNK, '9,999,999,999,990.99')FC_AFF_NR_NON_BNK,to_char(FC_OTH_NR_BNK, '9,999,999,999,990.99')FC_OTH_NR_BNK,to_char(FC_OTH_NR_NON_BNK, '9,999,999,999,990.99')FC_OTH_NR_NON_BNK,to_char(TOT_FC, '9,999,999,999,990.99')TOT_FC,to_char(GRAND_TOT, '9,999,999,999,990.99')GRAND_TOT  FROM TABLE(BLS0100_S3_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
	
		log.info("BLS0100 3"+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLBLS0100Bean xb=new XBRLBLS0100Bean();
			
			xb.setInstaname(NullCheck.isNotNull(rs.getString("REF_CODE_DESC")));
			xb.setInstcode(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
			xb.setInnccentlbank(NullCheck.isNotNull(rs.getString("CENTRAL_BANK")));
			xb.setInncbank(NullCheck.isNotNull(rs.getString("BANKS")));
			xb.setInncnobnkdeptakins(NullCheck.isNotNull(rs.getString("NON_BNK")));
			xb.setInnccredunio(NullCheck.isNotNull(rs.getString("CREDIT_UNIONS")));
			xb.setInncfingbc1s(NullCheck.isNotNull(rs.getString("FIN_GBC1")));
			xb.setInnctrusnonsetnbeni(NullCheck.isNotNull(rs.getString("TRUSTS_NR_GBC")));
			xb.setInncinsucorp(NullCheck.isNotNull(rs.getString("INSURANCE_CORP")));
			xb.setInncpensifnd(NullCheck.isNotNull(rs.getString("PENSION")));
			xb.setInncinvtfund(NullCheck.isNotNull(rs.getString("INVESTMENT")));
			xb.setInncholdcompan(NullCheck.isNotNull(rs.getString("HOLDING_COMP")));
			xb.setInncfinauxintme(NullCheck.isNotNull(rs.getString("FINANCIAL_AUX")));
			xb.setInnccntragovt(NullCheck.isNotNull(rs.getString("CENTRAL_GOV")));
			xb.setInncstatnlocgovt(NullCheck.isNotNull(rs.getString("STATE_LOC_GOV")));
			xb.setInncnonfingbc1s(NullCheck.isNotNull(rs.getString("NON_FINANCE_GBC")));
			xb.setInncgbc2s(NullCheck.isNotNull(rs.getString("GBC2")));
			xb.setInncpubnonfincorp(NullCheck.isNotNull(rs.getString("PUBLIC_NON_FIN_CORP")));
			xb.setInncothrnonfincorp(NullCheck.isNotNull(rs.getString("OTH_NON_FIN_CORP")));
			xb.setInnchoushold(NullCheck.isNotNull(rs.getString("HOUSEHOLD")));
			xb.setInncnonproinsereshouhld(NullCheck.isNotNull(rs.getString("NON_PROF_INSTITUTE")));
			xb.setInncaffilinonresi(NullCheck.isNotNull(rs.getString("AFF_NR")));
			xb.setInncothrnonresi(NullCheck.isNotNull(rs.getString("OTH_NR")));
			xb.setInnctotnaticrncy(NullCheck.isNotNull(rs.getString("TOT_LC")));
			xb.setInfccentlbank(NullCheck.isNotNull(rs.getString("FC_CENTRAL_BNK")));
			xb.setInfcbank(NullCheck.isNotNull(rs.getString("FC_BANKS")));
			xb.setInfcnobnkdeptakins(NullCheck.isNotNull(rs.getString("FC_NON_BNK")));
			xb.setInfccredunio(NullCheck.isNotNull(rs.getString("FC_CREDIT_UNIONS")));
			xb.setInfcfingbc1s(NullCheck.isNotNull(rs.getString("FC_FIN_GBC1")));
			xb.setInfctrusnonsetnbeni(NullCheck.isNotNull(rs.getString("FC_TRUSTS_NR_GBC")));
			xb.setInfcinsucorp(NullCheck.isNotNull(rs.getString("FC_INSURANCE_CORP")));
			xb.setInfcpensifnd(NullCheck.isNotNull(rs.getString("FC_PENSION")));
			xb.setInfcinvtfund(NullCheck.isNotNull(rs.getString("FC_INVESTMENT")));
			xb.setInfcholdcompan(NullCheck.isNotNull(rs.getString("FC_HOLDING_COMP")));
			xb.setInfcfinauxintme(NullCheck.isNotNull(rs.getString("FC_FINANCIAL_AUX")));
			xb.setInfccntragovt(NullCheck.isNotNull(rs.getString("FC_CENTRAL_GOV")));
			xb.setInfcstatnlocgovt(NullCheck.isNotNull(rs.getString("FC_STATE_LOC_GOV")));
			xb.setInfcnonfingbc1s(NullCheck.isNotNull(rs.getString("FC_NON_FINANCE_GBC")));
			xb.setInfcgbc2s(NullCheck.isNotNull(rs.getString("FC_GBC2")));
			xb.setInfcpubnonfincorp(NullCheck.isNotNull(rs.getString("FC_PUBLIC_NON_FIN_CORP")));
			xb.setInfcothrnonfincorp(NullCheck.isNotNull(rs.getString("FC_OTH_NON_FIN_CORP")));
			xb.setInfchoushold(NullCheck.isNotNull(rs.getString("FC_HOUSEHOLD")));
			xb.setInfcnonproinsereshouhld(NullCheck.isNotNull(rs.getString("FC_NON_PROF_INSTITUTE")));
			xb.setInfcaffilinonresibnk(NullCheck.isNotNull(rs.getString("FC_AFF_NR_BNK")));
			xb.setInfcaffilinonresioth(NullCheck.isNotNull(rs.getString("FC_AFF_NR_NON_BNK")));
			xb.setInfcothrnonresibnk(NullCheck.isNotNull(rs.getString("FC_OTH_NR_BNK")));
			xb.setInfcothrnonresioth(NullCheck.isNotNull(rs.getString("FC_OTH_NR_NON_BNK")));
			xb.setInfctotforeicrncy(NullCheck.isNotNull(rs.getString("TOT_FC")));
			xb.setGrandtotal(NullCheck.isNotNull(rs.getString("GRAND_TOT")));


		
			arl.add(xb);
		   
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




public ArrayList<XBRLBLS0100Bean> xbrlBLS0100s4(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLBLS0100Bean> arl = new ArrayList<XBRLBLS0100Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	 
	try {
	
			
			sql.append("SELECT REF_CODE_DESC,INSTANCE_CODE,to_char(CENTRAL_BANK, '9,999,999,999,990.99')CENTRAL_BANK,to_char(BANKS, '9,999,999,999,990.99')BANKS,to_char(NON_BNK, '9,999,999,999,990.99')NON_BNK,to_char(CREDIT_UNIONS, '9,999,999,999,990.99')CREDIT_UNIONS,to_char(FIN_GBC1, '9,999,999,999,990.99')FIN_GBC1,to_char(TRUSTS_NR_GBC, '9,999,999,999,990.99')TRUSTS_NR_GBC,to_char(INSURANCE_CORP, '9,999,999,999,990.99')INSURANCE_CORP,to_char(PENSION, '9,999,999,999,990.99')PENSION,to_char(INVESTMENT, '9,999,999,999,990.99')INVESTMENT,to_char(HOLDING_COMP, '9,999,999,999,990.99')HOLDING_COMP,to_char(FINANCIAL_AUX, '9,999,999,999,990.99')FINANCIAL_AUX,to_char(CENTRAL_GOV, '9,999,999,999,990.99')CENTRAL_GOV,to_char(STATE_LOC_GOV, '9,999,999,999,990.99')STATE_LOC_GOV,to_char(NON_FINANCE_GBC, '9,999,999,999,990.99')NON_FINANCE_GBC,to_char(GBC2, '9,999,999,999,990.99')GBC2,to_char(PUBLIC_NON_FIN_CORP, '9,999,999,999,990.99')PUBLIC_NON_FIN_CORP,to_char(OTH_NON_FIN_CORP, '9,999,999,999,990.99')OTH_NON_FIN_CORP,to_char(HOUSEHOLD, '9,999,999,999,990.99')HOUSEHOLD,to_char(NON_PROF_INSTITUTE, '9,999,999,999,990.99')NON_PROF_INSTITUTE,to_char(AFF_NR, '9,999,999,999,990.99')AFF_NR,to_char(OTH_NR, '9,999,999,999,990.99')OTH_NR,to_char(TOT_LC, '9,999,999,999,990.99')TOT_LC,to_char(FC_CENTRAL_BNK, '9,999,999,999,990.99')FC_CENTRAL_BNK,to_char(FC_BANKS, '9,999,999,999,990.99')FC_BANKS,to_char(FC_NON_BNK, '9,999,999,999,990.99')FC_NON_BNK,to_char(FC_CREDIT_UNIONS, '9,999,999,999,990.99')FC_CREDIT_UNIONS,to_char(FC_FIN_GBC1, '9,999,999,999,990.99')FC_FIN_GBC1,to_char(FC_TRUSTS_NR_GBC, '9,999,999,999,990.99')FC_TRUSTS_NR_GBC,to_char(FC_INSURANCE_CORP, '9,999,999,999,990.99')FC_INSURANCE_CORP,to_char(FC_PENSION, '9,999,999,999,990.99')FC_PENSION,to_char(FC_INVESTMENT, '9,999,999,999,990.99')FC_INVESTMENT,to_char(FC_HOLDING_COMP, '9,999,999,999,990.99')FC_HOLDING_COMP,to_char(FC_FINANCIAL_AUX, '9,999,999,999,990.99')FC_FINANCIAL_AUX,to_char(FC_CENTRAL_GOV, '9,999,999,999,990.99')FC_CENTRAL_GOV,to_char(FC_STATE_LOC_GOV, '9,999,999,999,990.99')FC_STATE_LOC_GOV,to_char(FC_NON_FINANCE_GBC, '9,999,999,999,990.99')FC_NON_FINANCE_GBC,to_char(FC_GBC2, '9,999,999,999,990.99')FC_GBC2,to_char(FC_PUBLIC_NON_FIN_CORP, '9,999,999,999,990.99')FC_PUBLIC_NON_FIN_CORP,to_char(FC_OTH_NON_FIN_CORP, '9,999,999,999,990.99')FC_OTH_NON_FIN_CORP,to_char(FC_HOUSEHOLD, '9,999,999,999,990.99')FC_HOUSEHOLD,to_char(FC_NON_PROF_INSTITUTE, '9,999,999,999,990.99')FC_NON_PROF_INSTITUTE,to_char(FC_AFF_NR_BNK, '9,999,999,999,990.99')FC_AFF_NR_BNK,to_char(FC_AFF_NR_NON_BNK, '9,999,999,999,990.99')FC_AFF_NR_NON_BNK,to_char(FC_OTH_NR_BNK, '9,999,999,999,990.99')FC_OTH_NR_BNK,to_char(FC_OTH_NR_NON_BNK, '9,999,999,999,990.99')FC_OTH_NR_NON_BNK,to_char(TOT_FC, '9,999,999,999,990.99')TOT_FC,to_char(GRAND_TOT, '9,999,999,999,990.99')GRAND_TOT  FROM TABLE(BLS0100_S4_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
	
		log.info("BLS0100 4"+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLBLS0100Bean xb=new XBRLBLS0100Bean();
			
			xb.setInstaname(NullCheck.isNotNull(rs.getString("REF_CODE_DESC")));
			xb.setInstcode(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
			xb.setInnccentlbank(NullCheck.isNotNull(rs.getString("CENTRAL_BANK")));
			xb.setInncbank(NullCheck.isNotNull(rs.getString("BANKS")));
			xb.setInncnobnkdeptakins(NullCheck.isNotNull(rs.getString("NON_BNK")));
			xb.setInnccredunio(NullCheck.isNotNull(rs.getString("CREDIT_UNIONS")));
			xb.setInncfingbc1s(NullCheck.isNotNull(rs.getString("FIN_GBC1")));
			xb.setInnctrusnonsetnbeni(NullCheck.isNotNull(rs.getString("TRUSTS_NR_GBC")));
			xb.setInncinsucorp(NullCheck.isNotNull(rs.getString("INSURANCE_CORP")));
			xb.setInncpensifnd(NullCheck.isNotNull(rs.getString("PENSION")));
			xb.setInncinvtfund(NullCheck.isNotNull(rs.getString("INVESTMENT")));
			xb.setInncholdcompan(NullCheck.isNotNull(rs.getString("HOLDING_COMP")));
			xb.setInncfinauxintme(NullCheck.isNotNull(rs.getString("FINANCIAL_AUX")));
			xb.setInnccntragovt(NullCheck.isNotNull(rs.getString("CENTRAL_GOV")));
			xb.setInncstatnlocgovt(NullCheck.isNotNull(rs.getString("STATE_LOC_GOV")));
			xb.setInncnonfingbc1s(NullCheck.isNotNull(rs.getString("NON_FINANCE_GBC")));
			xb.setInncgbc2s(NullCheck.isNotNull(rs.getString("GBC2")));
			xb.setInncpubnonfincorp(NullCheck.isNotNull(rs.getString("PUBLIC_NON_FIN_CORP")));
			xb.setInncothrnonfincorp(NullCheck.isNotNull(rs.getString("OTH_NON_FIN_CORP")));
			xb.setInnchoushold(NullCheck.isNotNull(rs.getString("HOUSEHOLD")));
			xb.setInncnonproinsereshouhld(NullCheck.isNotNull(rs.getString("NON_PROF_INSTITUTE")));
			xb.setInncaffilinonresi(NullCheck.isNotNull(rs.getString("AFF_NR")));
			xb.setInncothrnonresi(NullCheck.isNotNull(rs.getString("OTH_NR")));
			xb.setInnctotnaticrncy(NullCheck.isNotNull(rs.getString("TOT_LC")));
			xb.setInfccentlbank(NullCheck.isNotNull(rs.getString("FC_CENTRAL_BNK")));
			xb.setInfcbank(NullCheck.isNotNull(rs.getString("FC_BANKS")));
			xb.setInfcnobnkdeptakins(NullCheck.isNotNull(rs.getString("FC_NON_BNK")));
			xb.setInfccredunio(NullCheck.isNotNull(rs.getString("FC_CREDIT_UNIONS")));
			xb.setInfcfingbc1s(NullCheck.isNotNull(rs.getString("FC_FIN_GBC1")));
			xb.setInfctrusnonsetnbeni(NullCheck.isNotNull(rs.getString("FC_TRUSTS_NR_GBC")));
			xb.setInfcinsucorp(NullCheck.isNotNull(rs.getString("FC_INSURANCE_CORP")));
			xb.setInfcpensifnd(NullCheck.isNotNull(rs.getString("FC_PENSION")));
			xb.setInfcinvtfund(NullCheck.isNotNull(rs.getString("FC_INVESTMENT")));
			xb.setInfcholdcompan(NullCheck.isNotNull(rs.getString("FC_HOLDING_COMP")));
			xb.setInfcfinauxintme(NullCheck.isNotNull(rs.getString("FC_FINANCIAL_AUX")));
			xb.setInfccntragovt(NullCheck.isNotNull(rs.getString("FC_CENTRAL_GOV")));
			xb.setInfcstatnlocgovt(NullCheck.isNotNull(rs.getString("FC_STATE_LOC_GOV")));
			xb.setInfcnonfingbc1s(NullCheck.isNotNull(rs.getString("FC_NON_FINANCE_GBC")));
			xb.setInfcgbc2s(NullCheck.isNotNull(rs.getString("FC_GBC2")));
			xb.setInfcpubnonfincorp(NullCheck.isNotNull(rs.getString("FC_PUBLIC_NON_FIN_CORP")));
			xb.setInfcothrnonfincorp(NullCheck.isNotNull(rs.getString("FC_OTH_NON_FIN_CORP")));
			xb.setInfchoushold(NullCheck.isNotNull(rs.getString("FC_HOUSEHOLD")));
			xb.setInfcnonproinsereshouhld(NullCheck.isNotNull(rs.getString("FC_NON_PROF_INSTITUTE")));
			xb.setInfcaffilinonresibnk(NullCheck.isNotNull(rs.getString("FC_AFF_NR_BNK")));
			xb.setInfcaffilinonresioth(NullCheck.isNotNull(rs.getString("FC_AFF_NR_NON_BNK")));
			xb.setInfcothrnonresibnk(NullCheck.isNotNull(rs.getString("FC_OTH_NR_BNK")));
			xb.setInfcothrnonresioth(NullCheck.isNotNull(rs.getString("FC_OTH_NR_NON_BNK")));
			xb.setInfctotforeicrncy(NullCheck.isNotNull(rs.getString("TOT_FC")));
			xb.setGrandtotal(NullCheck.isNotNull(rs.getString("GRAND_TOT")));


		
			arl.add(xb);
		   
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



public ArrayList<XBRLBLS0100Bean> xbrlBLS0100ajaxdetails(String repname,String reprefno,String instno,String dt2,String curr) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("repname    " + repname + "reprefno   "  + reprefno + "instno"+ instno +"dt2   " + dt2 +"currency" +curr);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLBLS0100Bean> arl = new ArrayList<XBRLBLS0100Bean>();
		NullCheck chk=new NullCheck();
		String status = "";
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		
		PreparedStatement ps = null;
		
		StringBuffer sql = new StringBuffer();
		
		
		DateFormat df=new DateFormat();		
		//dt1 =df.formatdate(dt1);
		dt2 =df.formatdate(dt2);
		
		 DecimalFormat dfs = new DecimalFormat("##,##.00");  
		
	
		try {
		
			
		//	log.info("AJAX DETAILS KUMAR" + reprefno );
			
	//sql.append("SELECT * FROM TABLE(BLS0100_DTL_FUN('BLS0100','0','0','31-AUG-2018','01-AUG-2018','31-AUG-2018','MUR'))");
			
		sql.append("SELECT /* +FIRST_ROWS(100) */REMARKS,ACCT_NO,ACCT_NAME,CUST_ID,GLSH_CODE,SCH_CODE,SCH_TYPE,ACCT_CRNCY_CODE,to_char(EAB_DATE,'DD-MM-YYYY')EAB_DATE,to_char(EAB_BAL, '9,999,999,999,990.99')EAB_BAL FROM TABLE(BLS0100_S1_DTL_FUN('"+repname+"','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"')) WHERE ROWNUM<=500 ");
			
			log.info("BLS  Kumar  "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				//log.info("whileee");
								
				 
				XBRLBLS0100Bean xb=new XBRLBLS0100Bean();
				xb.setRmks(NullCheck.isNotNull(rs.getString("REMARKS")));
			xb.setAccno(NullCheck.isNotNull(rs.getString("ACCT_NO")));
				xb.setAccname(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
				xb.setCustid(NullCheck.isNotNull(rs.getString("CUST_ID")));
				xb.setGlshcode(NullCheck.isNotNull(rs.getString("GLSH_CODE")));
				xb.setSchmcode(NullCheck.isNotNull(rs.getString("SCH_CODE")));
				xb.setSchmtyp(NullCheck.isNotNull(rs.getString("SCH_TYPE")));
				xb.setAccrycde(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
				xb.setBaldte(NullCheck.isNotNull(rs.getString("EAB_DATE")));
				xb.setBalamt(NullCheck.isNotNull(rs.getString("EAB_BAL")));
				

			
			
				
		
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
public ArrayList<XBRLBLS0100Bean> xbrlBLS0100ajaxdetails2(String repname,String reprefno,String instno,String dt2,String curr) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("repname    " + repname + "reprefno   "  + reprefno + "instno"+ instno +"dt2   " + dt2 +"currency" +curr);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLBLS0100Bean> arl = new ArrayList<XBRLBLS0100Bean>();
		NullCheck chk=new NullCheck();
		String status = "";
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		
		PreparedStatement ps = null;
		
		StringBuffer sql = new StringBuffer();
		
		
		DateFormat df=new DateFormat();		
		//dt1 =df.formatdate(dt1);
		dt2 =df.formatdate(dt2);
		
		 DecimalFormat dfs = new DecimalFormat("##,##.00");  
		
	
		try {
		
			
		//	log.info("AJAX DETAILS KUMAR" + reprefno );
			
	//sql.append("SELECT * FROM TABLE(BLS0100_DTL_FUN('BLS0100','0','0','31-AUG-2018','01-AUG-2018','31-AUG-2018','MUR'))");
			
		sql.append("SELECT /* +FIRST_ROWS(100) */REMARKS,ACCT_NO,ACCT_NAME,CUST_ID,GLSH_CODE,SCH_CODE,SCH_TYPE,ACCT_CRNCY_CODE,to_char(EAB_DATE,'DD-MM-YYYY')EAB_DATE,to_char(EAB_BAL, '9,999,999,999,990.99')EAB_BAL FROM TABLE(BLS0100_S2_DTL_FUN('"+repname+"','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"')) WHERE ROWNUM<=500");
			
			log.info("BLS  gayu "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				//log.info("whileee");
								
				 
				XBRLBLS0100Bean xb=new XBRLBLS0100Bean();
				xb.setRmks(NullCheck.isNotNull(rs.getString("REMARKS")));

			xb.setAccno(NullCheck.isNotNull(rs.getString("ACCT_NO")));
				xb.setAccname(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
				xb.setCustid(NullCheck.isNotNull(rs.getString("CUST_ID")));
				xb.setGlshcode(NullCheck.isNotNull(rs.getString("GLSH_CODE")));
				xb.setSchmcode(NullCheck.isNotNull(rs.getString("SCH_CODE")));
				xb.setSchmtyp(NullCheck.isNotNull(rs.getString("SCH_TYPE")));
				xb.setAccrycde(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
				xb.setBaldte(NullCheck.isNotNull(rs.getString("EAB_DATE")));
				xb.setBalamt(NullCheck.isNotNull(rs.getString("EAB_BAL")));
				

			
			
				
		
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
public ArrayList<XBRLBLS0100Bean> xbrlBLS0100ajaxdetails3(String repname,String reprefno,String instno,String dt2,String curr) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("repname    " + repname + "reprefno   "  + reprefno + "instno"+ instno +"dt2   " + dt2 +"currency" +curr);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLBLS0100Bean> arl = new ArrayList<XBRLBLS0100Bean>();
		NullCheck chk=new NullCheck();
		String status = "";
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		
		PreparedStatement ps = null;
		
		StringBuffer sql = new StringBuffer();
		
		
		DateFormat df=new DateFormat();		
		//dt1 =df.formatdate(dt1);
		dt2 =df.formatdate(dt2);
		
		 DecimalFormat dfs = new DecimalFormat("##,##.00");  
		
	
		try {
		
			
		//	log.info("AJAX DETAILS KUMAR" + reprefno );
			
	//sql.append("SELECT * FROM TABLE(BLS0100_DTL_FUN('BLS0100','0','0','31-AUG-2018','01-AUG-2018','31-AUG-2018','MUR'))");
			
		sql.append("SELECT /* +FIRST_ROWS(100) */REMARKS,ACCT_NO,ACCT_NAME,CUST_ID,GLSH_CODE,SCH_CODE,SCH_TYPE,ACCT_CRNCY_CODE,to_char(EAB_DATE,'DD-MM-YYYY')EAB_DATE,to_char(EAB_BAL, '9,999,999,999,990.99')EAB_BAL FROM TABLE(BLS0100_S3_DTL_FUN('"+repname+"','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"')) WHERE ROWNUM<=500");
			
			log.info("BLS  gayu  "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				//log.info("whileee");
								
				 
				XBRLBLS0100Bean xb=new XBRLBLS0100Bean();
				xb.setRmks(NullCheck.isNotNull(rs.getString("REMARKS")));

			xb.setAccno(NullCheck.isNotNull(rs.getString("ACCT_NO")));
				xb.setAccname(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
				xb.setCustid(NullCheck.isNotNull(rs.getString("CUST_ID")));
				xb.setGlshcode(NullCheck.isNotNull(rs.getString("GLSH_CODE")));
				xb.setSchmcode(NullCheck.isNotNull(rs.getString("SCH_CODE")));
				xb.setSchmtyp(NullCheck.isNotNull(rs.getString("SCH_TYPE")));
				xb.setAccrycde(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
				xb.setBaldte(NullCheck.isNotNull(rs.getString("EAB_DATE")));
				xb.setBalamt(NullCheck.isNotNull(rs.getString("EAB_BAL")));
				

			
			
				
		
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


public ArrayList<XBRLBLS0100Bean> xbrlBLS0100ajaxdetails4(String repname,String reprefno,String instno,String dt2,String curr) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("repname    " + repname + "reprefno   "  + reprefno + "instno"+ instno +"dt2   " + dt2 +"currency" +curr);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLBLS0100Bean> arl = new ArrayList<XBRLBLS0100Bean>();
		NullCheck chk=new NullCheck();
		String status = "";
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		
		PreparedStatement ps = null;
		
		StringBuffer sql = new StringBuffer();
		
		
		DateFormat df=new DateFormat();		
		//dt1 =df.formatdate(dt1);
		dt2 =df.formatdate(dt2);
		
		 DecimalFormat dfs = new DecimalFormat("##,##.00");  
		
	
		try {
		
			
		//	log.info("AJAX DETAILS KUMAR" + reprefno );
			
	//sql.append("SELECT * FROM TABLE(BLS0100_DTL_FUN('BLS0100','0','0','31-AUG-2018','01-AUG-2018','31-AUG-2018','MUR'))");
			
		sql.append("SELECT /* +FIRST_ROWS(100) */REMARKS,ACCT_NO,ACCT_NAME,CUST_ID,GLSH_CODE,SCH_CODE,SCH_TYPE,ACCT_CRNCY_CODE,to_char(EAB_DATE,'DD-MM-YYYY')EAB_DATE,to_char(EAB_BAL, '9,999,999,999,990.99')EAB_BAL FROM TABLE(BLS0100_S4_DTL_FUN('"+repname+"','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"')) WHERE ROWNUM<=500");
			
			log.info("BLS  gayu  "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				//log.info("whileee");
								
				 
				XBRLBLS0100Bean xb=new XBRLBLS0100Bean();
				xb.setRmks(NullCheck.isNotNull(rs.getString("REMARKS")));

			xb.setAccno(NullCheck.isNotNull(rs.getString("ACCT_NO")));
				xb.setAccname(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
				xb.setCustid(NullCheck.isNotNull(rs.getString("CUST_ID")));
				xb.setGlshcode(NullCheck.isNotNull(rs.getString("GLSH_CODE")));
				xb.setSchmcode(NullCheck.isNotNull(rs.getString("SCH_CODE")));
				xb.setSchmtyp(NullCheck.isNotNull(rs.getString("SCH_TYPE")));
				xb.setAccrycde(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
				xb.setBaldte(NullCheck.isNotNull(rs.getString("EAB_DATE")));
				xb.setBalamt(NullCheck.isNotNull(rs.getString("EAB_BAL")));
				

			
			
				
		
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
public ArrayList<XBRLBLS0100Bean> xbrlbls4RR(String reptype,String dt1,String dt2,String ReporefSeq,String instno,String curr) {
	
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLBLS0100Bean> arl = new ArrayList<XBRLBLS0100Bean>();
		NullCheck chk=new NullCheck();
		
		
		String status = "";
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		
		PreparedStatement ps = null;
		
		StringBuffer sql = new StringBuffer();
		
		
		DateFormat df=new DateFormat();
		
		dt1 =df.formatdate(dt1);
		dt2 =df.formatdate(dt2);
		
		//sql.append("SELECT * FROM TABLE(BLS0100_DTL_FUN('BLS0100','0','0','31-AUG-2018','01-AUG-2018','31-AUG-2018','MUR'))");
			
		sql.append("SELECT /* +FIRST_ROWS(100) */ACCT_NO,ACCT_NAME,CUST_ID,GLSH_CODE,SCH_CODE,SCH_TYPE,ACCT_CRNCY_CODE,to_char(EAB_DATE,'DD-MM-YYYY')EAB_DATE,to_char(EAB_BAL, '9,999,999,999,990.99')EAB_BAL FROM TABLE(BLS0100_S1_DTL_FUN('"+reptype+"','"+chk.notZero(ReporefSeq)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"')) WHERE ROWNUM<=500");
		log.info("DOC&&&&SELECT"+sql.toString());
		try {
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			
			XBRLBLS0100Bean xb=new XBRLBLS0100Bean();
			
			xb.setAccno(NullCheck.isNotNull(rs.getString("ACCT_NO")));
			xb.setAccname(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
			xb.setCustid(NullCheck.isNotNull(rs.getString("CUST_ID")));
			xb.setGlshcode(NullCheck.isNotNull(rs.getString("GLSH_CODE")));
			xb.setSchmcode(NullCheck.isNotNull(rs.getString("SCH_CODE")));
			xb.setSchmtyp(NullCheck.isNotNull(rs.getString("SCH_TYPE")));
			xb.setAccrycde(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
			xb.setBaldte(NullCheck.isNotNull(rs.getString("EAB_DATE")));
			xb.setBalamt(NullCheck.isNotNull(rs.getString("EAB_BAL")));
			
			
			
			
			
			
			 arl.add(xb);
		}
		}catch(SQLException e){
			e.printStackTrace();
		}
			
		
		finally {

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
public ArrayList<XBRLBLS0100Bean> xbrlbls4RR2(String reptype,String dt1,String dt2,String ReporefSeq,String instno,String curr) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("repname    " + reptype + "reprefno   "  + ReporefSeq + "instno"+ instno +"dt2   " + dt2 +"currency" +curr);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLBLS0100Bean> arl = new ArrayList<XBRLBLS0100Bean>();
		NullCheck chk=new NullCheck();
		String status = "";
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		
		PreparedStatement ps = null;
		
		StringBuffer sql = new StringBuffer();
		
		
		DateFormat df=new DateFormat();		
		//dt1 =df.formatdate(dt1);
		dt2 =df.formatdate(dt2);
		
		 DecimalFormat dfs = new DecimalFormat("##,##.00");  
		
	
		try {
		
			
		//	log.info("AJAX DETAILS KUMAR" + reprefno );
			
	//sql.append("SELECT * FROM TABLE(BLS0100_DTL_FUN('BLS0100','0','0','31-AUG-2018','01-AUG-2018','31-AUG-2018','MUR'))");
			
		sql.append("SELECT /* +FIRST_ROWS(100) */REMARKS,ACCT_NO,ACCT_NAME,CUST_ID,GLSH_CODE,SCH_CODE,SCH_TYPE,ACCT_CRNCY_CODE,to_char(EAB_DATE,'DD-MM-YYYY')EAB_DATE,to_char(EAB_BAL, '9,999,999,999,990.99')EAB_BAL FROM TABLE(BLS0100_S2_DTL_FUN('"+reptype+"','"+chk.notZero(ReporefSeq)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"')) WHERE ROWNUM<=500");
			
			log.info("BLS  gayu "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				//log.info("whileee");
								
				 
				XBRLBLS0100Bean xb=new XBRLBLS0100Bean();
				xb.setRmks(NullCheck.isNotNull(rs.getString("REMARKS")));

			xb.setAccno(NullCheck.isNotNull(rs.getString("ACCT_NO")));
				xb.setAccname(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
				xb.setCustid(NullCheck.isNotNull(rs.getString("CUST_ID")));
				xb.setGlshcode(NullCheck.isNotNull(rs.getString("GLSH_CODE")));
				xb.setSchmcode(NullCheck.isNotNull(rs.getString("SCH_CODE")));
				xb.setSchmtyp(NullCheck.isNotNull(rs.getString("SCH_TYPE")));
				xb.setAccrycde(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
				xb.setBaldte(NullCheck.isNotNull(rs.getString("EAB_DATE")));
				xb.setBalamt(NullCheck.isNotNull(rs.getString("EAB_BAL")));
				

			
			
				
		
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
public ArrayList<XBRLBLS0100Bean> xbrlbls4RR3(String reptype,String dt1,String dt2,String ReporefSeq,String instno,String curr) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("repname    " + reptype + "reprefno   "  + ReporefSeq + "instno"+ instno +"dt2   " + dt2 +"currency" +curr);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLBLS0100Bean> arl = new ArrayList<XBRLBLS0100Bean>();
		NullCheck chk=new NullCheck();
		String status = "";
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		
		PreparedStatement ps = null;
		
		StringBuffer sql = new StringBuffer();
		
		
		DateFormat df=new DateFormat();		
		//dt1 =df.formatdate(dt1);
		dt2 =df.formatdate(dt2);
		
		 DecimalFormat dfs = new DecimalFormat("##,##.00");  
		
	
		try {
		
			
		//	log.info("AJAX DETAILS KUMAR" + reprefno );
			
	//sql.append("SELECT * FROM TABLE(BLS0100_DTL_FUN('BLS0100','0','0','31-AUG-2018','01-AUG-2018','31-AUG-2018','MUR'))");
			
		sql.append("SELECT /* +FIRST_ROWS(100) */REMARKS,ACCT_NO,ACCT_NAME,CUST_ID,GLSH_CODE,SCH_CODE,SCH_TYPE,ACCT_CRNCY_CODE,to_char(EAB_DATE,'DD-MM-YYYY')EAB_DATE,to_char(EAB_BAL, '9,999,999,999,990.99')EAB_BAL FROM TABLE(BLS0100_S3_DTL_FUN('"+reptype+"','"+chk.notZero(ReporefSeq)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"')) WHERE ROWNUM<=500 ");
			
			log.info("BLS  gayu  "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				//log.info("whileee");
								
				 
				XBRLBLS0100Bean xb=new XBRLBLS0100Bean();
				xb.setRmks(NullCheck.isNotNull(rs.getString("REMARKS")));

			xb.setAccno(NullCheck.isNotNull(rs.getString("ACCT_NO")));
				xb.setAccname(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
				xb.setCustid(NullCheck.isNotNull(rs.getString("CUST_ID")));
				xb.setGlshcode(NullCheck.isNotNull(rs.getString("GLSH_CODE")));
				xb.setSchmcode(NullCheck.isNotNull(rs.getString("SCH_CODE")));
				xb.setSchmtyp(NullCheck.isNotNull(rs.getString("SCH_TYPE")));
				xb.setAccrycde(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
				xb.setBaldte(NullCheck.isNotNull(rs.getString("EAB_DATE")));
				xb.setBalamt(NullCheck.isNotNull(rs.getString("EAB_BAL")));
				

			
			
				
		
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


public ArrayList<XBRLBLS0100Bean> xbrlbls4RR4(String reptype,String dt1,String dt2,String ReporefSeq,String instno,String curr) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("repname    " + reptype + "reprefno   "  + ReporefSeq + "instno"+ instno +"dt2   " + dt2 +"currency" +curr);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLBLS0100Bean> arl = new ArrayList<XBRLBLS0100Bean>();
		NullCheck chk=new NullCheck();
		String status = "";
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		
		PreparedStatement ps = null;
		
		StringBuffer sql = new StringBuffer();
		
		
		DateFormat df=new DateFormat();		
		//dt1 =df.formatdate(dt1);
		dt2 =df.formatdate(dt2);
		
		 DecimalFormat dfs = new DecimalFormat("##,##.00");  
		
	
		try {
		
			
		//	log.info("AJAX DETAILS KUMAR" + reprefno );
			
	//sql.append("SELECT * FROM TABLE(BLS0100_DTL_FUN('BLS0100','0','0','31-AUG-2018','01-AUG-2018','31-AUG-2018','MUR'))");
			
		sql.append("SELECT /* +FIRST_ROWS(100) */REMARKS,ACCT_NO,ACCT_NAME,CUST_ID,GLSH_CODE,SCH_CODE,SCH_TYPE,ACCT_CRNCY_CODE,to_char(EAB_DATE,'DD-MM-YYYY')EAB_DATE,to_char(EAB_BAL, '9,999,999,999,990.99')EAB_BAL FROM TABLE(BLS0100_S4_DTL_FUN('"+reptype+"','"+chk.notZero(ReporefSeq)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"')) WHERE ROWNUM<=500");
			
			log.info("BLS  gayu  "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				//log.info("whileee");
								
				 
				XBRLBLS0100Bean xb=new XBRLBLS0100Bean();
				xb.setRmks(NullCheck.isNotNull(rs.getString("REMARKS")));

			xb.setAccno(NullCheck.isNotNull(rs.getString("ACCT_NO")));
				xb.setAccname(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
				xb.setCustid(NullCheck.isNotNull(rs.getString("CUST_ID")));
				xb.setGlshcode(NullCheck.isNotNull(rs.getString("GLSH_CODE")));
				xb.setSchmcode(NullCheck.isNotNull(rs.getString("SCH_CODE")));
				xb.setSchmtyp(NullCheck.isNotNull(rs.getString("SCH_TYPE")));
				xb.setAccrycde(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
				xb.setBaldte(NullCheck.isNotNull(rs.getString("EAB_DATE")));
				xb.setBalamt(NullCheck.isNotNull(rs.getString("EAB_BAL")));
				

			
			
				
		
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
public ArrayList<XBRLBLS0100Bean> xbrlblssumEP(String reptype,String dt1, String dt2, String ReporefSeq, String curr) {

	log.info("PYM SUMMARY List Data AB " + dt1 + "dt22222" + dt2);

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();

	ArrayList<XBRLBLS0100Bean> arl = new ArrayList<XBRLBLS0100Bean>();

	String status = "";

	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();

	PreparedStatement ps = null;

	StringBuffer sql = new StringBuffer();

	DateFormat df = new DateFormat();
	dt1 = df.formatdate(dt1);
	dt2 = df.formatdate(dt2);

	DecimalFormat dfs = new DecimalFormat("##,##.00");
	NullCheck chk = new NullCheck();

	try {

		log.info("Gnana" + ReporefSeq.trim());
		

		sql.append("SELECT REF_CODE_DESC,INSTANCE_CODE,to_char(CENTRAL_BANK, '9,999,999,999,990.99')CENTRAL_BANK,to_char(BANKS, '9,999,999,999,990.99')BANKS,to_char(NON_BNK, '9,999,999,999,990.99')NON_BNK,to_char(CREDIT_UNIONS, '9,999,999,999,990.99')CREDIT_UNIONS,to_char(FIN_GBC1, '9,999,999,999,990.99')FIN_GBC1,to_char(TRUSTS_NR_GBC, '9,999,999,999,990.99')TRUSTS_NR_GBC,to_char(INSURANCE_CORP, '9,999,999,999,990.99')INSURANCE_CORP,to_char(PENSION, '9,999,999,999,990.99')PENSION,to_char(INVESTMENT, '9,999,999,999,990.99')INVESTMENT,to_char(HOLDING_COMP, '9,999,999,999,990.99')HOLDING_COMP,to_char(FINANCIAL_AUX, '9,999,999,999,990.99')FINANCIAL_AUX,to_char(CENTRAL_GOV, '9,999,999,999,990.99')CENTRAL_GOV,to_char(STATE_LOC_GOV, '9,999,999,999,990.99')STATE_LOC_GOV,to_char(NON_FINANCE_GBC, '9,999,999,999,990.99')NON_FINANCE_GBC,to_char(GBC2, '9,999,999,999,990.99')GBC2,to_char(PUBLIC_NON_FIN_CORP, '9,999,999,999,990.99')PUBLIC_NON_FIN_CORP,to_char(OTH_NON_FIN_CORP, '9,999,999,999,990.99')OTH_NON_FIN_CORP,to_char(HOUSEHOLD, '9,999,999,999,990.99')HOUSEHOLD,to_char(NON_PROF_INSTITUTE, '9,999,999,999,990.99')NON_PROF_INSTITUTE,to_char(AFF_NR, '9,999,999,999,990.99')AFF_NR,to_char(OTH_NR, '9,999,999,999,990.99')OTH_NR,to_char(TOT_LC, '9,999,999,999,990.99')TOT_LC,to_char(FC_CENTRAL_BNK, '9,999,999,999,990.99')FC_CENTRAL_BNK,to_char(FC_BANKS, '9,999,999,999,990.99')FC_BANKS,to_char(FC_NON_BNK, '9,999,999,999,990.99')FC_NON_BNK,to_char(FC_CREDIT_UNIONS, '9,999,999,999,990.99')FC_CREDIT_UNIONS,to_char(FC_FIN_GBC1, '9,999,999,999,990.99')FC_FIN_GBC1,to_char(FC_TRUSTS_NR_GBC, '9,999,999,999,990.99')FC_TRUSTS_NR_GBC,to_char(FC_INSURANCE_CORP, '9,999,999,999,990.99')FC_INSURANCE_CORP,to_char(FC_PENSION, '9,999,999,999,990.99')FC_PENSION,to_char(FC_INVESTMENT, '9,999,999,999,990.99')FC_INVESTMENT,to_char(FC_HOLDING_COMP, '9,999,999,999,990.99')FC_HOLDING_COMP,to_char(FC_FINANCIAL_AUX, '9,999,999,999,990.99')FC_FINANCIAL_AUX,to_char(FC_CENTRAL_GOV, '9,999,999,999,990.99')FC_CENTRAL_GOV,to_char(FC_STATE_LOC_GOV, '9,999,999,999,990.99')FC_STATE_LOC_GOV,to_char(FC_NON_FINANCE_GBC, '9,999,999,999,990.99')FC_NON_FINANCE_GBC,to_char(FC_GBC2, '9,999,999,999,990.99')FC_GBC2,to_char(FC_PUBLIC_NON_FIN_CORP, '9,999,999,999,990.99')FC_PUBLIC_NON_FIN_CORP,to_char(FC_OTH_NON_FIN_CORP, '9,999,999,999,990.99')FC_OTH_NON_FIN_CORP,to_char(FC_HOUSEHOLD, '9,999,999,999,990.99')FC_HOUSEHOLD,to_char(FC_NON_PROF_INSTITUTE, '9,999,999,999,990.99')FC_NON_PROF_INSTITUTE,to_char(FC_AFF_NR_BNK, '9,999,999,999,990.99')FC_AFF_NR_BNK,to_char(FC_AFF_NR_NON_BNK, '9,999,999,999,990.99')FC_AFF_NR_NON_BNK,to_char(FC_OTH_NR_BNK, '9,999,999,999,990.99')FC_OTH_NR_BNK,to_char(FC_OTH_NR_NON_BNK, '9,999,999,999,990.99')FC_OTH_NR_NON_BNK,to_char(TOT_FC, '9,999,999,999,990.99')TOT_FC,to_char(GRAND_TOT, '9,999,999,999,990.99')GRAND_TOT   FROM TABLE(BLS0100_S1_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");		

		/* xbrl_report_master_tb */

		log.info("PYM SUMMARY " + sql.toString());

		ps = conn.prepareStatement(sql.toString());

		ResultSet rs = ps.executeQuery();

		while (rs.next()) {

			XBRLBLS0100Bean xb = new XBRLBLS0100Bean();
			
			
			xb.setInstaname(NullCheck.isNotNull(rs.getString("REF_CODE_DESC")));
			xb.setInstcode(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
			xb.setInnccentlbank(NullCheck.isNotNull(rs.getString("CENTRAL_BANK")));
			xb.setInncbank(NullCheck.isNotNull(rs.getString("BANKS")));
			xb.setInncnobnkdeptakins(NullCheck.isNotNull(rs.getString("NON_BNK")));
			xb.setInnccredunio(NullCheck.isNotNull(rs.getString("CREDIT_UNIONS")));
			xb.setInncfingbc1s(NullCheck.isNotNull(rs.getString("FIN_GBC1")));
			xb.setInnctrusnonsetnbeni(NullCheck.isNotNull(rs.getString("TRUSTS_NR_GBC")));
			xb.setInncinsucorp(NullCheck.isNotNull(rs.getString("INSURANCE_CORP")));
			xb.setInncpensifnd(NullCheck.isNotNull(rs.getString("PENSION")));
			xb.setInncinvtfund(NullCheck.isNotNull(rs.getString("INVESTMENT")));
			xb.setInncholdcompan(NullCheck.isNotNull(rs.getString("HOLDING_COMP")));
			xb.setInncfinauxintme(NullCheck.isNotNull(rs.getString("FINANCIAL_AUX")));
			xb.setInnccntragovt(NullCheck.isNotNull(rs.getString("CENTRAL_GOV")));
			xb.setInncstatnlocgovt(NullCheck.isNotNull(rs.getString("STATE_LOC_GOV")));
			xb.setInncnonfingbc1s(NullCheck.isNotNull(rs.getString("NON_FINANCE_GBC")));
			xb.setInncgbc2s(NullCheck.isNotNull(rs.getString("GBC2")));
			xb.setInncpubnonfincorp(NullCheck.isNotNull(rs.getString("PUBLIC_NON_FIN_CORP")));
			xb.setInncothrnonfincorp(NullCheck.isNotNull(rs.getString("OTH_NON_FIN_CORP")));
			xb.setInnchoushold(NullCheck.isNotNull(rs.getString("HOUSEHOLD")));
			xb.setInncnonproinsereshouhld(NullCheck.isNotNull(rs.getString("NON_PROF_INSTITUTE")));
			xb.setInncaffilinonresi(NullCheck.isNotNull(rs.getString("AFF_NR")));
			xb.setInncothrnonresi(NullCheck.isNotNull(rs.getString("OTH_NR")));
			xb.setInnctotnaticrncy(NullCheck.isNotNull(rs.getString("TOT_LC")));
			xb.setInfccentlbank(NullCheck.isNotNull(rs.getString("FC_CENTRAL_BNK")));
			xb.setInfcbank(NullCheck.isNotNull(rs.getString("FC_BANKS")));
			xb.setInfcnobnkdeptakins(NullCheck.isNotNull(rs.getString("FC_NON_BNK")));
			xb.setInfccredunio(NullCheck.isNotNull(rs.getString("FC_CREDIT_UNIONS")));
			xb.setInfcfingbc1s(NullCheck.isNotNull(rs.getString("FC_FIN_GBC1")));
			xb.setInfctrusnonsetnbeni(NullCheck.isNotNull(rs.getString("FC_TRUSTS_NR_GBC")));
			xb.setInfcinsucorp(NullCheck.isNotNull(rs.getString("FC_INSURANCE_CORP")));
			xb.setInfcpensifnd(NullCheck.isNotNull(rs.getString("FC_PENSION")));
			xb.setInfcinvtfund(NullCheck.isNotNull(rs.getString("FC_INVESTMENT")));
			xb.setInfcholdcompan(NullCheck.isNotNull(rs.getString("FC_HOLDING_COMP")));
			xb.setInfcfinauxintme(NullCheck.isNotNull(rs.getString("FC_FINANCIAL_AUX")));
			xb.setInfccntragovt(NullCheck.isNotNull(rs.getString("FC_CENTRAL_GOV")));
			xb.setInfcstatnlocgovt(NullCheck.isNotNull(rs.getString("FC_STATE_LOC_GOV")));
			xb.setInfcnonfingbc1s(NullCheck.isNotNull(rs.getString("FC_NON_FINANCE_GBC")));
			xb.setInfcgbc2s(NullCheck.isNotNull(rs.getString("FC_GBC2")));
			xb.setInfcpubnonfincorp(NullCheck.isNotNull(rs.getString("FC_PUBLIC_NON_FIN_CORP")));
			xb.setInfcothrnonfincorp(NullCheck.isNotNull(rs.getString("FC_OTH_NON_FIN_CORP")));
			xb.setInfchoushold(NullCheck.isNotNull(rs.getString("FC_HOUSEHOLD")));
			xb.setInfcnonproinsereshouhld(NullCheck.isNotNull(rs.getString("FC_NON_PROF_INSTITUTE")));
			xb.setInfcaffilinonresibnk(NullCheck.isNotNull(rs.getString("FC_AFF_NR_BNK")));
			xb.setInfcaffilinonresioth(NullCheck.isNotNull(rs.getString("FC_AFF_NR_NON_BNK")));
			xb.setInfcothrnonresibnk(NullCheck.isNotNull(rs.getString("FC_OTH_NR_BNK")));
			xb.setInfcothrnonresioth(NullCheck.isNotNull(rs.getString("FC_OTH_NR_NON_BNK")));
			xb.setInfctotforeicrncy(NullCheck.isNotNull(rs.getString("TOT_FC")));
			xb.setGrandtotal(NullCheck.isNotNull(rs.getString("GRAND_TOT")));

			arl.add(xb);

		}

		log.info("ARLLL" + arl.size());

	} catch (SQLException e) {

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
public ArrayList<XBRLBLS0100Bean> xbrlblssumEP1(String reptype,String dt1, String dt2, String ReporefSeq, String curr) {

	log.info("PYM SUMMARY List Data AB " + dt1 + "dt22222" + dt2);

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();

	ArrayList<XBRLBLS0100Bean> arl = new ArrayList<XBRLBLS0100Bean>();

	String status = "";

	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();

	PreparedStatement ps = null;

	StringBuffer sql = new StringBuffer();

	DateFormat df = new DateFormat();
	dt1 = df.formatdate(dt1);
	dt2 = df.formatdate(dt2);

	DecimalFormat dfs = new DecimalFormat("##,##.00");
	NullCheck chk = new NullCheck();

	try {

		log.info("Gayu" + ReporefSeq.trim());
		// sql.append("SELECT
		// DYNAMIC_DOMAIN,to_char(REP_DATE,'DD-MM-YYYY')REP_DATE,INSTITUTE_ID,TRAN_ID,INSTITUTE_NAME,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,SECTOR,SPOT_RATE,FWD_RATE,to_char(DUE_DATE,'DD-MM-YYYY')DUE_DATE,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME
		// FROM FIM0400_MAST_TABLE Where REP_DATE >='"+dt1+"' and REP_DATE
		// <= '"+dt2+"' ORDER BY cast(TRAN_ID as int) ASC ");

		// sql.append("SELECT
		// REPORT_REF_NO,MODES,CHQ_NUMBER,ACCT_NUMBER,ACCT_NAME,to_char(TRAN_DATE,'DD-MM-YYYY')TRAN_DATE,CHQ_AMOUNT,CRNCY,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME
		// FROM
		// TABLE(BLS0100_RPT_FUN('BLS0100','"+ReporefSeq.trim()+"','31-MAR-2014','31-MAR-2014','31-MAR-2014'))");


		sql.append("SELECT REF_CODE_DESC,INSTANCE_CODE,to_char(CENTRAL_BANK, '9,999,999,999,990.99')CENTRAL_BANK,to_char(BANKS, '9,999,999,999,990.99')BANKS,to_char(NON_BNK, '9,999,999,999,990.99')NON_BNK,to_char(CREDIT_UNIONS, '9,999,999,999,990.99')CREDIT_UNIONS,to_char(FIN_GBC1, '9,999,999,999,990.99')FIN_GBC1,to_char(TRUSTS_NR_GBC, '9,999,999,999,990.99')TRUSTS_NR_GBC,to_char(INSURANCE_CORP, '9,999,999,999,990.99')INSURANCE_CORP,to_char(PENSION, '9,999,999,999,990.99')PENSION,to_char(INVESTMENT, '9,999,999,999,990.99')INVESTMENT,to_char(HOLDING_COMP, '9,999,999,999,990.99')HOLDING_COMP,to_char(FINANCIAL_AUX, '9,999,999,999,990.99')FINANCIAL_AUX,to_char(CENTRAL_GOV, '9,999,999,999,990.99')CENTRAL_GOV,to_char(STATE_LOC_GOV, '9,999,999,999,990.99')STATE_LOC_GOV,to_char(NON_FINANCE_GBC, '9,999,999,999,990.99')NON_FINANCE_GBC,to_char(GBC2, '9,999,999,999,990.99')GBC2,to_char(PUBLIC_NON_FIN_CORP, '9,999,999,999,990.99')PUBLIC_NON_FIN_CORP,to_char(OTH_NON_FIN_CORP, '9,999,999,999,990.99')OTH_NON_FIN_CORP,to_char(HOUSEHOLD, '9,999,999,999,990.99')HOUSEHOLD,to_char(NON_PROF_INSTITUTE, '9,999,999,999,990.99')NON_PROF_INSTITUTE,to_char(AFF_NR, '9,999,999,999,990.99')AFF_NR,to_char(OTH_NR, '9,999,999,999,990.99')OTH_NR,to_char(TOT_LC, '9,999,999,999,990.99')TOT_LC,to_char(FC_CENTRAL_BNK, '9,999,999,999,990.99')FC_CENTRAL_BNK,to_char(FC_BANKS, '9,999,999,999,990.99')FC_BANKS,to_char(FC_NON_BNK, '9,999,999,999,990.99')FC_NON_BNK,to_char(FC_CREDIT_UNIONS, '9,999,999,999,990.99')FC_CREDIT_UNIONS,to_char(FC_FIN_GBC1, '9,999,999,999,990.99')FC_FIN_GBC1,to_char(FC_TRUSTS_NR_GBC, '9,999,999,999,990.99')FC_TRUSTS_NR_GBC,to_char(FC_INSURANCE_CORP, '9,999,999,999,990.99')FC_INSURANCE_CORP,to_char(FC_PENSION, '9,999,999,999,990.99')FC_PENSION,to_char(FC_INVESTMENT, '9,999,999,999,990.99')FC_INVESTMENT,to_char(FC_HOLDING_COMP, '9,999,999,999,990.99')FC_HOLDING_COMP,to_char(FC_FINANCIAL_AUX, '9,999,999,999,990.99')FC_FINANCIAL_AUX,to_char(FC_CENTRAL_GOV, '9,999,999,999,990.99')FC_CENTRAL_GOV,to_char(FC_STATE_LOC_GOV, '9,999,999,999,990.99')FC_STATE_LOC_GOV,to_char(FC_NON_FINANCE_GBC, '9,999,999,999,990.99')FC_NON_FINANCE_GBC,to_char(FC_GBC2, '9,999,999,999,990.99')FC_GBC2,to_char(FC_PUBLIC_NON_FIN_CORP, '9,999,999,999,990.99')FC_PUBLIC_NON_FIN_CORP,to_char(FC_OTH_NON_FIN_CORP, '9,999,999,999,990.99')FC_OTH_NON_FIN_CORP,to_char(FC_HOUSEHOLD, '9,999,999,999,990.99')FC_HOUSEHOLD,to_char(FC_NON_PROF_INSTITUTE, '9,999,999,999,990.99')FC_NON_PROF_INSTITUTE,to_char(FC_AFF_NR_BNK, '9,999,999,999,990.99')FC_AFF_NR_BNK,to_char(FC_AFF_NR_NON_BNK, '9,999,999,999,990.99')FC_AFF_NR_NON_BNK,to_char(FC_OTH_NR_BNK, '9,999,999,999,990.99')FC_OTH_NR_BNK,to_char(FC_OTH_NR_NON_BNK, '9,999,999,999,990.99')FC_OTH_NR_NON_BNK,to_char(TOT_FC, '9,999,999,999,990.99')TOT_FC,to_char(GRAND_TOT, '9,999,999,999,990.99')GRAND_TOT   FROM TABLE(BLS0100_S2_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");		

		/* xbrl_report_master_tb */

		log.info("PYM SUMMARY " + sql.toString());

		ps = conn.prepareStatement(sql.toString());

		ResultSet rs = ps.executeQuery();
int i=1;
		while (rs.next()) {

			XBRLBLS0100Bean xb = new XBRLBLS0100Bean();
			
			
			xb.setInstaname(NullCheck.isNotNull(rs.getString("REF_CODE_DESC")));
			xb.setInstcode(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
			xb.setInnccentlbank(NullCheck.isNotNull(rs.getString("CENTRAL_BANK")));
			xb.setInncbank(NullCheck.isNotNull(rs.getString("BANKS")));
			xb.setInncnobnkdeptakins(NullCheck.isNotNull(rs.getString("NON_BNK")));
			xb.setInnccredunio(NullCheck.isNotNull(rs.getString("CREDIT_UNIONS")));
			xb.setInncfingbc1s(NullCheck.isNotNull(rs.getString("FIN_GBC1")));
			xb.setInnctrusnonsetnbeni(NullCheck.isNotNull(rs.getString("TRUSTS_NR_GBC")));
			xb.setInncinsucorp(NullCheck.isNotNull(rs.getString("INSURANCE_CORP")));
			xb.setInncpensifnd(NullCheck.isNotNull(rs.getString("PENSION")));
			xb.setInncinvtfund(NullCheck.isNotNull(rs.getString("INVESTMENT")));
			xb.setInncholdcompan(NullCheck.isNotNull(rs.getString("HOLDING_COMP")));
			xb.setInncfinauxintme(NullCheck.isNotNull(rs.getString("FINANCIAL_AUX")));
			xb.setInnccntragovt(NullCheck.isNotNull(rs.getString("CENTRAL_GOV")));
			xb.setInncstatnlocgovt(NullCheck.isNotNull(rs.getString("STATE_LOC_GOV")));
			xb.setInncnonfingbc1s(NullCheck.isNotNull(rs.getString("NON_FINANCE_GBC")));
			xb.setInncgbc2s(NullCheck.isNotNull(rs.getString("GBC2")));
			xb.setInncpubnonfincorp(NullCheck.isNotNull(rs.getString("PUBLIC_NON_FIN_CORP")));
			xb.setInncothrnonfincorp(NullCheck.isNotNull(rs.getString("OTH_NON_FIN_CORP")));
			xb.setInnchoushold(NullCheck.isNotNull(rs.getString("HOUSEHOLD")));
			xb.setInncnonproinsereshouhld(NullCheck.isNotNull(rs.getString("NON_PROF_INSTITUTE")));
			xb.setInncaffilinonresi(NullCheck.isNotNull(rs.getString("AFF_NR")));
			xb.setInncothrnonresi(NullCheck.isNotNull(rs.getString("OTH_NR")));
			xb.setInnctotnaticrncy(NullCheck.isNotNull(rs.getString("TOT_LC")));
			xb.setInfccentlbank(NullCheck.isNotNull(rs.getString("FC_CENTRAL_BNK")));
			xb.setInfcbank(NullCheck.isNotNull(rs.getString("FC_BANKS")));
			xb.setInfcnobnkdeptakins(NullCheck.isNotNull(rs.getString("FC_NON_BNK")));
			xb.setInfccredunio(NullCheck.isNotNull(rs.getString("FC_CREDIT_UNIONS")));
			xb.setInfcfingbc1s(NullCheck.isNotNull(rs.getString("FC_FIN_GBC1")));
			xb.setInfctrusnonsetnbeni(NullCheck.isNotNull(rs.getString("FC_TRUSTS_NR_GBC")));
			xb.setInfcinsucorp(NullCheck.isNotNull(rs.getString("FC_INSURANCE_CORP")));
			xb.setInfcpensifnd(NullCheck.isNotNull(rs.getString("FC_PENSION")));
			xb.setInfcinvtfund(NullCheck.isNotNull(rs.getString("FC_INVESTMENT")));
			xb.setInfcholdcompan(NullCheck.isNotNull(rs.getString("FC_HOLDING_COMP")));
			xb.setInfcfinauxintme(NullCheck.isNotNull(rs.getString("FC_FINANCIAL_AUX")));
			xb.setInfccntragovt(NullCheck.isNotNull(rs.getString("FC_CENTRAL_GOV")));
			xb.setInfcstatnlocgovt(NullCheck.isNotNull(rs.getString("FC_STATE_LOC_GOV")));
			xb.setInfcnonfingbc1s(NullCheck.isNotNull(rs.getString("FC_NON_FINANCE_GBC")));
			xb.setInfcgbc2s(NullCheck.isNotNull(rs.getString("FC_GBC2")));
			xb.setInfcpubnonfincorp(NullCheck.isNotNull(rs.getString("FC_PUBLIC_NON_FIN_CORP")));
			xb.setInfcothrnonfincorp(NullCheck.isNotNull(rs.getString("FC_OTH_NON_FIN_CORP")));
			xb.setInfchoushold(NullCheck.isNotNull(rs.getString("FC_HOUSEHOLD")));
			xb.setInfcnonproinsereshouhld(NullCheck.isNotNull(rs.getString("FC_NON_PROF_INSTITUTE")));
			xb.setInfcaffilinonresibnk(NullCheck.isNotNull(rs.getString("FC_AFF_NR_BNK")));
			xb.setInfcaffilinonresioth(NullCheck.isNotNull(rs.getString("FC_AFF_NR_NON_BNK")));
			xb.setInfcothrnonresibnk(NullCheck.isNotNull(rs.getString("FC_OTH_NR_BNK")));
			xb.setInfcothrnonresioth(NullCheck.isNotNull(rs.getString("FC_OTH_NR_NON_BNK")));
			xb.setInfctotforeicrncy(NullCheck.isNotNull(rs.getString("TOT_FC")));
			xb.setGrandtotal(NullCheck.isNotNull(rs.getString("GRAND_TOT")));
            xb.setSec( Integer.toString(i));

			arl.add(xb);
i++;
		}

		log.info("ARLLL" + arl.size());

	} catch (SQLException e) {

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
public ArrayList<XBRLBLS0100Bean> xbrlblssumEP2(String dt1, String dt2, String ReporefSeq, String curr) {

	log.info("PYM SUMMARY List Data AB " + dt1 + "dt22222" + dt2);

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();

	ArrayList<XBRLBLS0100Bean> arl = new ArrayList<XBRLBLS0100Bean>();

	String status = "";

	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();

	PreparedStatement ps = null;

	StringBuffer sql = new StringBuffer();

	DateFormat df = new DateFormat();
	dt1 = df.formatdate(dt1);
	dt2 = df.formatdate(dt2);

	DecimalFormat dfs = new DecimalFormat("##,##.00");
	NullCheck chk = new NullCheck();

	try {

		log.info("Gnana" + ReporefSeq.trim());
		// sql.append("SELECT
		// DYNAMIC_DOMAIN,to_char(REP_DATE,'DD-MM-YYYY')REP_DATE,INSTITUTE_ID,TRAN_ID,INSTITUTE_NAME,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,SECTOR,SPOT_RATE,FWD_RATE,to_char(DUE_DATE,'DD-MM-YYYY')DUE_DATE,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME
		// FROM FIM0400_MAST_TABLE Where REP_DATE >='"+dt1+"' and REP_DATE
		// <= '"+dt2+"' ORDER BY cast(TRAN_ID as int) ASC ");

		// sql.append("SELECT
		// REPORT_REF_NO,MODES,CHQ_NUMBER,ACCT_NUMBER,ACCT_NAME,to_char(TRAN_DATE,'DD-MM-YYYY')TRAN_DATE,CHQ_AMOUNT,CRNCY,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME
		// FROM
		// TABLE(BLS0100_RPT_FUN('BLS0100','"+ReporefSeq.trim()+"','31-MAR-2014','31-MAR-2014','31-MAR-2014'))");


		sql.append("SELECT REF_CODE_DESC,INSTANCE_CODE,to_char(CENTRAL_BANK, '9,999,999,999,990.99')CENTRAL_BANK,to_char(BANKS, '9,999,999,999,990.99')BANKS,to_char(NON_BNK, '9,999,999,999,990.99')NON_BNK,to_char(CREDIT_UNIONS, '9,999,999,999,990.99')CREDIT_UNIONS,to_char(FIN_GBC1, '9,999,999,999,990.99')FIN_GBC1,to_char(TRUSTS_NR_GBC, '9,999,999,999,990.99')TRUSTS_NR_GBC,to_char(INSURANCE_CORP, '9,999,999,999,990.99')INSURANCE_CORP,to_char(PENSION, '9,999,999,999,990.99')PENSION,to_char(INVESTMENT, '9,999,999,999,990.99')INVESTMENT,to_char(HOLDING_COMP, '9,999,999,999,990.99')HOLDING_COMP,to_char(FINANCIAL_AUX, '9,999,999,999,990.99')FINANCIAL_AUX,to_char(CENTRAL_GOV, '9,999,999,999,990.99')CENTRAL_GOV,to_char(STATE_LOC_GOV, '9,999,999,999,990.99')STATE_LOC_GOV,to_char(NON_FINANCE_GBC, '9,999,999,999,990.99')NON_FINANCE_GBC,to_char(GBC2, '9,999,999,999,990.99')GBC2,to_char(PUBLIC_NON_FIN_CORP, '9,999,999,999,990.99')PUBLIC_NON_FIN_CORP,to_char(OTH_NON_FIN_CORP, '9,999,999,999,990.99')OTH_NON_FIN_CORP,to_char(HOUSEHOLD, '9,999,999,999,990.99')HOUSEHOLD,to_char(NON_PROF_INSTITUTE, '9,999,999,999,990.99')NON_PROF_INSTITUTE,to_char(AFF_NR, '9,999,999,999,990.99')AFF_NR,to_char(OTH_NR, '9,999,999,999,990.99')OTH_NR,to_char(TOT_LC, '9,999,999,999,990.99')TOT_LC,to_char(FC_CENTRAL_BNK, '9,999,999,999,990.99')FC_CENTRAL_BNK,to_char(FC_BANKS, '9,999,999,999,990.99')FC_BANKS,to_char(FC_NON_BNK, '9,999,999,999,990.99')FC_NON_BNK,to_char(FC_CREDIT_UNIONS, '9,999,999,999,990.99')FC_CREDIT_UNIONS,to_char(FC_FIN_GBC1, '9,999,999,999,990.99')FC_FIN_GBC1,to_char(FC_TRUSTS_NR_GBC, '9,999,999,999,990.99')FC_TRUSTS_NR_GBC,to_char(FC_INSURANCE_CORP, '9,999,999,999,990.99')FC_INSURANCE_CORP,to_char(FC_PENSION, '9,999,999,999,990.99')FC_PENSION,to_char(FC_INVESTMENT, '9,999,999,999,990.99')FC_INVESTMENT,to_char(FC_HOLDING_COMP, '9,999,999,999,990.99')FC_HOLDING_COMP,to_char(FC_FINANCIAL_AUX, '9,999,999,999,990.99')FC_FINANCIAL_AUX,to_char(FC_CENTRAL_GOV, '9,999,999,999,990.99')FC_CENTRAL_GOV,to_char(FC_STATE_LOC_GOV, '9,999,999,999,990.99')FC_STATE_LOC_GOV,to_char(FC_NON_FINANCE_GBC, '9,999,999,999,990.99')FC_NON_FINANCE_GBC,to_char(FC_GBC2, '9,999,999,999,990.99')FC_GBC2,to_char(FC_PUBLIC_NON_FIN_CORP, '9,999,999,999,990.99')FC_PUBLIC_NON_FIN_CORP,to_char(FC_OTH_NON_FIN_CORP, '9,999,999,999,990.99')FC_OTH_NON_FIN_CORP,to_char(FC_HOUSEHOLD, '9,999,999,999,990.99')FC_HOUSEHOLD,to_char(FC_NON_PROF_INSTITUTE, '9,999,999,999,990.99')FC_NON_PROF_INSTITUTE,to_char(FC_AFF_NR_BNK, '9,999,999,999,990.99')FC_AFF_NR_BNK,to_char(FC_AFF_NR_NON_BNK, '9,999,999,999,990.99')FC_AFF_NR_NON_BNK,to_char(FC_OTH_NR_BNK, '9,999,999,999,990.99')FC_OTH_NR_BNK,to_char(FC_OTH_NR_NON_BNK, '9,999,999,999,990.99')FC_OTH_NR_NON_BNK,to_char(TOT_FC, '9,999,999,999,990.99')TOT_FC,to_char(GRAND_TOT, '9,999,999,999,990.99')GRAND_TOT   FROM TABLE(BLS0100_S3_RPT_FUN('"+ReporefSeq+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");		

		/* xbrl_report_master_tb */

		log.info("PYM SUMMARY " + sql.toString());

		ps = conn.prepareStatement(sql.toString());

		ResultSet rs = ps.executeQuery();

		while (rs.next()) {

			XBRLBLS0100Bean xb = new XBRLBLS0100Bean();
			
			
			xb.setInstaname(NullCheck.isNotNull(rs.getString("REF_CODE_DESC")));
			xb.setInstcode(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
			xb.setInnccentlbank(NullCheck.isNotNull(rs.getString("CENTRAL_BANK")));
			xb.setInncbank(NullCheck.isNotNull(rs.getString("BANKS")));
			xb.setInncnobnkdeptakins(NullCheck.isNotNull(rs.getString("NON_BNK")));
			xb.setInnccredunio(NullCheck.isNotNull(rs.getString("CREDIT_UNIONS")));
			xb.setInncfingbc1s(NullCheck.isNotNull(rs.getString("FIN_GBC1")));
			xb.setInnctrusnonsetnbeni(NullCheck.isNotNull(rs.getString("TRUSTS_NR_GBC")));
			xb.setInncinsucorp(NullCheck.isNotNull(rs.getString("INSURANCE_CORP")));
			xb.setInncpensifnd(NullCheck.isNotNull(rs.getString("PENSION")));
			xb.setInncinvtfund(NullCheck.isNotNull(rs.getString("INVESTMENT")));
			xb.setInncholdcompan(NullCheck.isNotNull(rs.getString("HOLDING_COMP")));
			xb.setInncfinauxintme(NullCheck.isNotNull(rs.getString("FINANCIAL_AUX")));
			xb.setInnccntragovt(NullCheck.isNotNull(rs.getString("CENTRAL_GOV")));
			xb.setInncstatnlocgovt(NullCheck.isNotNull(rs.getString("STATE_LOC_GOV")));
			xb.setInncnonfingbc1s(NullCheck.isNotNull(rs.getString("NON_FINANCE_GBC")));
			xb.setInncgbc2s(NullCheck.isNotNull(rs.getString("GBC2")));
			xb.setInncpubnonfincorp(NullCheck.isNotNull(rs.getString("PUBLIC_NON_FIN_CORP")));
			xb.setInncothrnonfincorp(NullCheck.isNotNull(rs.getString("OTH_NON_FIN_CORP")));
			xb.setInnchoushold(NullCheck.isNotNull(rs.getString("HOUSEHOLD")));
			xb.setInncnonproinsereshouhld(NullCheck.isNotNull(rs.getString("NON_PROF_INSTITUTE")));
			xb.setInncaffilinonresi(NullCheck.isNotNull(rs.getString("AFF_NR")));
			xb.setInncothrnonresi(NullCheck.isNotNull(rs.getString("OTH_NR")));
			xb.setInnctotnaticrncy(NullCheck.isNotNull(rs.getString("TOT_LC")));
			xb.setInfccentlbank(NullCheck.isNotNull(rs.getString("FC_CENTRAL_BNK")));
			xb.setInfcbank(NullCheck.isNotNull(rs.getString("FC_BANKS")));
			xb.setInfcnobnkdeptakins(NullCheck.isNotNull(rs.getString("FC_NON_BNK")));
			xb.setInfccredunio(NullCheck.isNotNull(rs.getString("FC_CREDIT_UNIONS")));
			xb.setInfcfingbc1s(NullCheck.isNotNull(rs.getString("FC_FIN_GBC1")));
			xb.setInfctrusnonsetnbeni(NullCheck.isNotNull(rs.getString("FC_TRUSTS_NR_GBC")));
			xb.setInfcinsucorp(NullCheck.isNotNull(rs.getString("FC_INSURANCE_CORP")));
			xb.setInfcpensifnd(NullCheck.isNotNull(rs.getString("FC_PENSION")));
			xb.setInfcinvtfund(NullCheck.isNotNull(rs.getString("FC_INVESTMENT")));
			xb.setInfcholdcompan(NullCheck.isNotNull(rs.getString("FC_HOLDING_COMP")));
			xb.setInfcfinauxintme(NullCheck.isNotNull(rs.getString("FC_FINANCIAL_AUX")));
			xb.setInfccntragovt(NullCheck.isNotNull(rs.getString("FC_CENTRAL_GOV")));
			xb.setInfcstatnlocgovt(NullCheck.isNotNull(rs.getString("FC_STATE_LOC_GOV")));
			xb.setInfcnonfingbc1s(NullCheck.isNotNull(rs.getString("FC_NON_FINANCE_GBC")));
			xb.setInfcgbc2s(NullCheck.isNotNull(rs.getString("FC_GBC2")));
			xb.setInfcpubnonfincorp(NullCheck.isNotNull(rs.getString("FC_PUBLIC_NON_FIN_CORP")));
			xb.setInfcothrnonfincorp(NullCheck.isNotNull(rs.getString("FC_OTH_NON_FIN_CORP")));
			xb.setInfchoushold(NullCheck.isNotNull(rs.getString("FC_HOUSEHOLD")));
			xb.setInfcnonproinsereshouhld(NullCheck.isNotNull(rs.getString("FC_NON_PROF_INSTITUTE")));
			xb.setInfcaffilinonresibnk(NullCheck.isNotNull(rs.getString("FC_AFF_NR_BNK")));
			xb.setInfcaffilinonresioth(NullCheck.isNotNull(rs.getString("FC_AFF_NR_NON_BNK")));
			xb.setInfcothrnonresibnk(NullCheck.isNotNull(rs.getString("FC_OTH_NR_BNK")));
			xb.setInfcothrnonresioth(NullCheck.isNotNull(rs.getString("FC_OTH_NR_NON_BNK")));
			xb.setInfctotforeicrncy(NullCheck.isNotNull(rs.getString("TOT_FC")));
			xb.setGrandtotal(NullCheck.isNotNull(rs.getString("GRAND_TOT")));

			arl.add(xb);

		}

		log.info("ARLLL" + arl.size());

	} catch (SQLException e) {

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
public ArrayList<XBRLBLS0100Bean> xbrlblssumEP3(String dt1, String dt2, String ReporefSeq, String curr) {

	log.info("PYM SUMMARY List Data AB " + dt1 + "dt22222" + dt2);

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();

	ArrayList<XBRLBLS0100Bean> arl = new ArrayList<XBRLBLS0100Bean>();

	String status = "";

	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();

	PreparedStatement ps = null;

	StringBuffer sql = new StringBuffer();

	DateFormat df = new DateFormat();
	dt1 = df.formatdate(dt1);
	dt2 = df.formatdate(dt2);

	DecimalFormat dfs = new DecimalFormat("##,##.00");
	NullCheck chk = new NullCheck();

	try {

		log.info("Gnana" + ReporefSeq.trim());
		// sql.append("SELECT
		// DYNAMIC_DOMAIN,to_char(REP_DATE,'DD-MM-YYYY')REP_DATE,INSTITUTE_ID,TRAN_ID,INSTITUTE_NAME,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,SECTOR,SPOT_RATE,FWD_RATE,to_char(DUE_DATE,'DD-MM-YYYY')DUE_DATE,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME
		// FROM FIM0400_MAST_TABLE Where REP_DATE >='"+dt1+"' and REP_DATE
		// <= '"+dt2+"' ORDER BY cast(TRAN_ID as int) ASC ");

		// sql.append("SELECT
		// REPORT_REF_NO,MODES,CHQ_NUMBER,ACCT_NUMBER,ACCT_NAME,to_char(TRAN_DATE,'DD-MM-YYYY')TRAN_DATE,CHQ_AMOUNT,CRNCY,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME
		// FROM
		// TABLE(BLS0100_RPT_FUN('BLS0100','"+ReporefSeq.trim()+"','31-MAR-2014','31-MAR-2014','31-MAR-2014'))");


		sql.append("SELECT REF_CODE_DESC,INSTANCE_CODE,to_char(CENTRAL_BANK, '9,999,999,999,990.99')CENTRAL_BANK,to_char(BANKS, '9,999,999,999,990.99')BANKS,to_char(NON_BNK, '9,999,999,999,990.99')NON_BNK,to_char(CREDIT_UNIONS, '9,999,999,999,990.99')CREDIT_UNIONS,to_char(FIN_GBC1, '9,999,999,999,990.99')FIN_GBC1,to_char(TRUSTS_NR_GBC, '9,999,999,999,990.99')TRUSTS_NR_GBC,to_char(INSURANCE_CORP, '9,999,999,999,990.99')INSURANCE_CORP,to_char(PENSION, '9,999,999,999,990.99')PENSION,to_char(INVESTMENT, '9,999,999,999,990.99')INVESTMENT,to_char(HOLDING_COMP, '9,999,999,999,990.99')HOLDING_COMP,to_char(FINANCIAL_AUX, '9,999,999,999,990.99')FINANCIAL_AUX,to_char(CENTRAL_GOV, '9,999,999,999,990.99')CENTRAL_GOV,to_char(STATE_LOC_GOV, '9,999,999,999,990.99')STATE_LOC_GOV,to_char(NON_FINANCE_GBC, '9,999,999,999,990.99')NON_FINANCE_GBC,to_char(GBC2, '9,999,999,999,990.99')GBC2,to_char(PUBLIC_NON_FIN_CORP, '9,999,999,999,990.99')PUBLIC_NON_FIN_CORP,to_char(OTH_NON_FIN_CORP, '9,999,999,999,990.99')OTH_NON_FIN_CORP,to_char(HOUSEHOLD, '9,999,999,999,990.99')HOUSEHOLD,to_char(NON_PROF_INSTITUTE, '9,999,999,999,990.99')NON_PROF_INSTITUTE,to_char(AFF_NR, '9,999,999,999,990.99')AFF_NR,to_char(OTH_NR, '9,999,999,999,990.99')OTH_NR,to_char(TOT_LC, '9,999,999,999,990.99')TOT_LC,to_char(FC_CENTRAL_BNK, '9,999,999,999,990.99')FC_CENTRAL_BNK,to_char(FC_BANKS, '9,999,999,999,990.99')FC_BANKS,to_char(FC_NON_BNK, '9,999,999,999,990.99')FC_NON_BNK,to_char(FC_CREDIT_UNIONS, '9,999,999,999,990.99')FC_CREDIT_UNIONS,to_char(FC_FIN_GBC1, '9,999,999,999,990.99')FC_FIN_GBC1,to_char(FC_TRUSTS_NR_GBC, '9,999,999,999,990.99')FC_TRUSTS_NR_GBC,to_char(FC_INSURANCE_CORP, '9,999,999,999,990.99')FC_INSURANCE_CORP,to_char(FC_PENSION, '9,999,999,999,990.99')FC_PENSION,to_char(FC_INVESTMENT, '9,999,999,999,990.99')FC_INVESTMENT,to_char(FC_HOLDING_COMP, '9,999,999,999,990.99')FC_HOLDING_COMP,to_char(FC_FINANCIAL_AUX, '9,999,999,999,990.99')FC_FINANCIAL_AUX,to_char(FC_CENTRAL_GOV, '9,999,999,999,990.99')FC_CENTRAL_GOV,to_char(FC_STATE_LOC_GOV, '9,999,999,999,990.99')FC_STATE_LOC_GOV,to_char(FC_NON_FINANCE_GBC, '9,999,999,999,990.99')FC_NON_FINANCE_GBC,to_char(FC_GBC2, '9,999,999,999,990.99')FC_GBC2,to_char(FC_PUBLIC_NON_FIN_CORP, '9,999,999,999,990.99')FC_PUBLIC_NON_FIN_CORP,to_char(FC_OTH_NON_FIN_CORP, '9,999,999,999,990.99')FC_OTH_NON_FIN_CORP,to_char(FC_HOUSEHOLD, '9,999,999,999,990.99')FC_HOUSEHOLD,to_char(FC_NON_PROF_INSTITUTE, '9,999,999,999,990.99')FC_NON_PROF_INSTITUTE,to_char(FC_AFF_NR_BNK, '9,999,999,999,990.99')FC_AFF_NR_BNK,to_char(FC_AFF_NR_NON_BNK, '9,999,999,999,990.99')FC_AFF_NR_NON_BNK,to_char(FC_OTH_NR_BNK, '9,999,999,999,990.99')FC_OTH_NR_BNK,to_char(FC_OTH_NR_NON_BNK, '9,999,999,999,990.99')FC_OTH_NR_NON_BNK,to_char(TOT_FC, '9,999,999,999,990.99')TOT_FC,to_char(GRAND_TOT, '9,999,999,999,990.99')GRAND_TOT   FROM TABLE(BLS0100_S4_RPT_FUN('"+ReporefSeq+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");		

		/* xbrl_report_master_tb */

		log.info("PYM SUMMARY " + sql.toString());

		ps = conn.prepareStatement(sql.toString());

		ResultSet rs = ps.executeQuery();

		while (rs.next()) {

			XBRLBLS0100Bean xb = new XBRLBLS0100Bean();
			
			
			xb.setInstaname(NullCheck.isNotNull(rs.getString("REF_CODE_DESC")));
			xb.setInstcode(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
			xb.setInnccentlbank(NullCheck.isNotNull(rs.getString("CENTRAL_BANK")));
			xb.setInncbank(NullCheck.isNotNull(rs.getString("BANKS")));
			xb.setInncnobnkdeptakins(NullCheck.isNotNull(rs.getString("NON_BNK")));
			xb.setInnccredunio(NullCheck.isNotNull(rs.getString("CREDIT_UNIONS")));
			xb.setInncfingbc1s(NullCheck.isNotNull(rs.getString("FIN_GBC1")));
			xb.setInnctrusnonsetnbeni(NullCheck.isNotNull(rs.getString("TRUSTS_NR_GBC")));
			xb.setInncinsucorp(NullCheck.isNotNull(rs.getString("INSURANCE_CORP")));
			xb.setInncpensifnd(NullCheck.isNotNull(rs.getString("PENSION")));
			xb.setInncinvtfund(NullCheck.isNotNull(rs.getString("INVESTMENT")));
			xb.setInncholdcompan(NullCheck.isNotNull(rs.getString("HOLDING_COMP")));
			xb.setInncfinauxintme(NullCheck.isNotNull(rs.getString("FINANCIAL_AUX")));
			xb.setInnccntragovt(NullCheck.isNotNull(rs.getString("CENTRAL_GOV")));
			xb.setInncstatnlocgovt(NullCheck.isNotNull(rs.getString("STATE_LOC_GOV")));
			xb.setInncnonfingbc1s(NullCheck.isNotNull(rs.getString("NON_FINANCE_GBC")));
			xb.setInncgbc2s(NullCheck.isNotNull(rs.getString("GBC2")));
			xb.setInncpubnonfincorp(NullCheck.isNotNull(rs.getString("PUBLIC_NON_FIN_CORP")));
			xb.setInncothrnonfincorp(NullCheck.isNotNull(rs.getString("OTH_NON_FIN_CORP")));
			xb.setInnchoushold(NullCheck.isNotNull(rs.getString("HOUSEHOLD")));
			xb.setInncnonproinsereshouhld(NullCheck.isNotNull(rs.getString("NON_PROF_INSTITUTE")));
			xb.setInncaffilinonresi(NullCheck.isNotNull(rs.getString("AFF_NR")));
			xb.setInncothrnonresi(NullCheck.isNotNull(rs.getString("OTH_NR")));
			xb.setInnctotnaticrncy(NullCheck.isNotNull(rs.getString("TOT_LC")));
			xb.setInfccentlbank(NullCheck.isNotNull(rs.getString("FC_CENTRAL_BNK")));
			xb.setInfcbank(NullCheck.isNotNull(rs.getString("FC_BANKS")));
			xb.setInfcnobnkdeptakins(NullCheck.isNotNull(rs.getString("FC_NON_BNK")));
			xb.setInfccredunio(NullCheck.isNotNull(rs.getString("FC_CREDIT_UNIONS")));
			xb.setInfcfingbc1s(NullCheck.isNotNull(rs.getString("FC_FIN_GBC1")));
			xb.setInfctrusnonsetnbeni(NullCheck.isNotNull(rs.getString("FC_TRUSTS_NR_GBC")));
			xb.setInfcinsucorp(NullCheck.isNotNull(rs.getString("FC_INSURANCE_CORP")));
			xb.setInfcpensifnd(NullCheck.isNotNull(rs.getString("FC_PENSION")));
			xb.setInfcinvtfund(NullCheck.isNotNull(rs.getString("FC_INVESTMENT")));
			xb.setInfcholdcompan(NullCheck.isNotNull(rs.getString("FC_HOLDING_COMP")));
			xb.setInfcfinauxintme(NullCheck.isNotNull(rs.getString("FC_FINANCIAL_AUX")));
			xb.setInfccntragovt(NullCheck.isNotNull(rs.getString("FC_CENTRAL_GOV")));
			xb.setInfcstatnlocgovt(NullCheck.isNotNull(rs.getString("FC_STATE_LOC_GOV")));
			xb.setInfcnonfingbc1s(NullCheck.isNotNull(rs.getString("FC_NON_FINANCE_GBC")));
			xb.setInfcgbc2s(NullCheck.isNotNull(rs.getString("FC_GBC2")));
			xb.setInfcpubnonfincorp(NullCheck.isNotNull(rs.getString("FC_PUBLIC_NON_FIN_CORP")));
			xb.setInfcothrnonfincorp(NullCheck.isNotNull(rs.getString("FC_OTH_NON_FIN_CORP")));
			xb.setInfchoushold(NullCheck.isNotNull(rs.getString("FC_HOUSEHOLD")));
			xb.setInfcnonproinsereshouhld(NullCheck.isNotNull(rs.getString("FC_NON_PROF_INSTITUTE")));
			xb.setInfcaffilinonresibnk(NullCheck.isNotNull(rs.getString("FC_AFF_NR_BNK")));
			xb.setInfcaffilinonresioth(NullCheck.isNotNull(rs.getString("FC_AFF_NR_NON_BNK")));
			xb.setInfcothrnonresibnk(NullCheck.isNotNull(rs.getString("FC_OTH_NR_BNK")));
			xb.setInfcothrnonresioth(NullCheck.isNotNull(rs.getString("FC_OTH_NR_NON_BNK")));
			xb.setInfctotforeicrncy(NullCheck.isNotNull(rs.getString("TOT_FC")));
			xb.setGrandtotal(NullCheck.isNotNull(rs.getString("GRAND_TOT")));

			arl.add(xb);

		}

		log.info("ARLLL" + arl.size());

	} catch (SQLException e) {

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
	log.info("ARLLL" );
	return arl;
}



public String detailBLS0100saves() {

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
}


