package dao;


import java.sql.CallableStatement;

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
import java.math.BigDecimal;
import basecode.DateFormat;
import bean.XBRLFIM0800Bean;
import bean.XBRLFIM0800Bean;
import bean.XBRLReportMasterBean;


import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class  XBRLFIM0800Dao  {
	
	static Logger log = Logger.getLogger(XBRLFIM0800Dao.class);
	
	
public String resalert;
	
	public String cnt;
	
	public int cnt1;
	
	
	public int getCnt1() {
		return cnt1;
	}

	public void setCnt1(int cnt1) {
		this.cnt1 = cnt1;
	}

	public String getResalert() {
		return resalert;
	}

	public void setResalert(String resalert) {
		this.resalert = resalert;
	}

	public String getCnt() {
		return cnt;
	}

	public void setCnt(String cnt) {
		this.cnt = cnt;
	}


	public String Reporef;
	
	
	
	
	

		
		
	public String getReporef() {
		return Reporef;
	}

	public void setReporef(String reporef) {
		Reporef = reporef;
	}



	public ArrayList<XBRLFIM0800Dao> ReporefSeq(String dt1,String dt2){
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		String status = "";
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();
		DateFormat df=new DateFormat();		
		dt1 =df.formatdate(dt1);
		dt2 =df.formatdate(dt2);
		
		ArrayList<XBRLFIM0800Dao> arl = new ArrayList<XBRLFIM0800Dao>();
		sql.append("select REPORT_REF_NO from FIM0800_MOD_TABLE where REPORT_DATE BETWEEN '"+dt1+"' AND '"+dt2+"' GROUP BY REPORT_REF_NO ORDER BY REPORT_REF_NO");
		
		log.info("SELECTPROFILE"+sql.toString());
		
		try {
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
		
				XBRLFIM0800Dao xel=new XBRLFIM0800Dao();
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
	
	
	
	
	
	
	
	
	
	
	
	
	public ArrayList<XBRLFIM0800Bean> xbrlFIMSum() {
		
		
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLFIM0800Bean> arl = new ArrayList<XBRLFIM0800Bean>();
		
		String status = "";
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		
		PreparedStatement ps = null;
		
		StringBuffer sql = new StringBuffer();
		
		
		/*DateFormat df=new DateFormat();		
		dt1 =df.formatdate(dt1);
		dt2 =df.formatdate(dt2);*/
		
	
		try {
		
			
	
			//sql.append("SELECT DYNAMIC_DOMAIN,to_char(REP_DATE,'DD-MM-YYYY')REP_DATE,INSTITUTE_ID,TRAN_ID,INSTITUTE_NAME,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,SECTOR,SPOT_RATE,FWD_RATE,to_char(DUE_DATE,'DD-MM-YYYY')DUE_DATE,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME    FROM   FIM0400_MAST_TABLE  Where  REP_DATE >='"+dt1+"' and REP_DATE <= '"+dt2+"' ORDER BY cast(TRAN_ID as int) ASC ");
			
			//sql.append("SELECT MODES,CHQ_ALPHA,CHQ_NUMBER,ACCT_NUMBER,ACCT_NAME,to_char(TRAN_DATE,'DD-MM-YYYY')TRAN_DATE,to_char(VALUE_DATE,'DD-MM-YYYY')VALUE_DATE,CHQ_AMOUNT,CRNCY,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME    FROM   FIM0800_MAST_TABLE  Where  TRAN_DATE >='"+dt1+"' and TRAN_DATE <= '"+dt2+"' ORDER BY TRAN_DATE  ASC ");
			
			
			
			sql.append("SELECT COUNT(MODES) as cnt	FROM FIM0800_MAST_TABLE	WHERE MODES='A'");
			
			
			
			log.info("CRRRRRRRRRRRRRR"+sql.toString());
			
			
			

			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				log.info("whileee");
				XBRLFIM0800Bean xb=new XBRLFIM0800Bean();
				
				
				status=NullCheck.isNotZero(rs.getString("cnt"));
				
				
				
				
			
			 
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
		
		
	/*************DB Link****************/
	
	public ArrayList<XBRLFIM0800Bean> xbrlFIMsumEP(String dt1,String dt2,String ReporefSeq,String curr) {
		
		log.info("FIM SUMMARY List Data AB " + dt1 + "dt22222" + dt2);
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLFIM0800Bean> arl = new ArrayList<XBRLFIM0800Bean>();
		
		String status = "";
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		
		PreparedStatement ps = null;
		
		StringBuffer sql = new StringBuffer();
		
		
		DateFormat df=new DateFormat();		
		dt1 =df.formatdate(dt1);
		dt2 =df.formatdate(dt2);
		
		 DecimalFormat dfs = new DecimalFormat("##,##.00");  
		
	
		try {
		
			
			log.info("Gnana" + ReporefSeq.trim());
			//sql.append("SELECT DYNAMIC_DOMAIN,to_char(REP_DATE,'DD-MM-YYYY')REP_DATE,INSTITUTE_ID,TRAN_ID,INSTITUTE_NAME,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,SECTOR,SPOT_RATE,FWD_RATE,to_char(DUE_DATE,'DD-MM-YYYY')DUE_DATE,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME    FROM   FIM0400_MAST_TABLE  Where  REP_DATE >='"+dt1+"' and REP_DATE <= '"+dt2+"' ORDER BY cast(TRAN_ID as int) ASC ");
			
			
			
				log.info("Report ref" );
			
			
				sql.append("SELECT SL_NO,to_char(TRADE_DATE,'DD-MM-YYYY')TRADE_DATE,to_char(VALUE_DATE,'DD-MM-YYYY')VALUE_DATE,TRAN_TYPE,ACCT_NUMBER,COUNTER_PARTY_NAME,COUNTER_PARTY_CODE,SECURITY_AMOUNT,YIELD,PRICE,to_char(MATURITY_DATE,'DD-MM-YYYY')MATURITY_DATE,RESIDUAL_DAYS,ISIN FROM TABLE(FIM0800_RPT_FUN('FIM0800','"+ReporefSeq.trim()+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
			/*xbrl_report_master_tb*/
			
			
		   
			
			log.info("FIM SUMMARYsdrd "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				
				
				
				 
				XBRLFIM0800Bean xb=new XBRLFIM0800Bean();
				
				xb.setSno(NullCheck.isNotNull(rs.getString("SL_NO")));
				xb.setTrade(NullCheck.isNotNull(rs.getString("TRADE_DATE")));
				xb.setValdate(NullCheck.isNotNull(rs.getString("VALUE_DATE")));			
				xb.setTyptrn(NullCheck.isNotNull(rs.getString("TRAN_TYPE")));
				xb.setAcntno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
				xb.setCntprty(NullCheck.isNotNull(rs.getString("COUNTER_PARTY_NAME")));
				xb.setCcntprtycode(NullCheck.isNotNull(rs.getString("COUNTER_PARTY_CODE")));
				xb.setNominalamt(NullCheck.isNotNull(rs.getString("SECURITY_AMOUNT")));
				xb.setYields(NullCheck.isNotNull(rs.getString("YIELD")));
				xb.setClanpr(NullCheck.isNotNull(rs.getString("PRICE")));
				xb.setMatudat(NullCheck.isNotNull(rs.getString("MATURITY_DATE")));
				xb.setResidudat(NullCheck.isNotNull(rs.getString("RESIDUAL_DAYS")));
				xb.setIsin(NullCheck.isNotNull(rs.getString("ISIN")));
				
				
			
			
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
	/*=========================>>>>>>>>>>>>>>>>>>>>*/
	

	public ArrayList<XBRLFIM0800Bean> xbrlfimRR(String reptype,String ReporefSeq,String instno,String dt2,String dt1,String curr) {
		
		
		log.info("+++++++++++++++==================================++++++++++++++++++++++++");
				
				
	log.info("repname    " + reptype + "reprefno   " + ReporefSeq + "instno   " + instno + "dt2     " + dt2 +  "dt1    " + dt1);


			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			
			ArrayList<XBRLFIM0800Bean> arl = new ArrayList<XBRLFIM0800Bean>();
			NullCheck chk=new NullCheck();
			String status = "";
			
			ConnectionManager connMgr = new ConnectionManager();
			Connection conn = connMgr.getConnection();
			
			PreparedStatement ps = null;
			
			StringBuffer sql = new StringBuffer();
			
			
			DateFormat df=new DateFormat();		
			dt1 =df.formatdate(dt1);
			dt2 =df.formatdate(dt2);
			
			 DecimalFormat dfs = new DecimalFormat("##,##.00");  
			
		
			try {
			
				
				log.info("AJAX DETAILS GNANA" + ReporefSeq );
				/*select * from TABLE(FIM0800_DTL_FUN('FIM0800','0','0','31-MAR-2014','01-MAR-2014','31-MAR-2014','MUR'));*/
				sql.append("SELECT SL_NO,to_char(TRADE_DATE,'DD-MM-YYYY')TRADE_DATE,to_char(VALUE_DATE,'DD-MM-YYYY')VALUE_DATE,TRAN_TYPE,ACCT_NUMBER,COUNTER_PARTY_NAME,COUNTER_PARTY_CODE,SECURITY_AMOUNT,YIELD,PRICE,to_char(MATURITY_DATE,'DD-MM-YYYY')MATURITY_DATE,RESIDUAL_DAYS,ISIN FROM TABLE(FIM0800_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
				
				
				log.info("FIM Vinoth Kumaryttttu  "+sql.toString());
				
				ps=conn.prepareStatement(sql.toString());
				
			    ResultSet rs=ps.executeQuery();
			     

				while(rs.next()){
					//log.info("whileee");
					
					
					 
					XBRLFIM0800Bean xb=new XBRLFIM0800Bean();
		
					xb.setSrlno(NullCheck.isNotNull(rs.getString("SL_NO")));
					xb.setTrade1(NullCheck.isNotNull(rs.getString("TRADE_DATE")));
					xb.setValdate1(NullCheck.isNotNull(rs.getString("VALUE_DATE")));
					xb.setTyptrn1(NullCheck.isNotNull(rs.getString("TRAN_TYPE")));
					xb.setAcntno1(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
					xb.setCntprty1(NullCheck.isNotNull(rs.getString("COUNTER_PARTY_NAME")));
					xb.setCcntprtycode1(NullCheck.isNotNull(rs.getString("COUNTER_PARTY_CODE")));
					xb.setNominalamt1(NullCheck.isNotNull(rs.getString("SECURITY_AMOUNT")));
					xb.setYields1(NullCheck.isNotNull(rs.getString("YIELD")));
					xb.setClanpr1(NullCheck.isNotNull(rs.getString("PRICE")));
					xb.setMatudat1(NullCheck.isNotNull(rs.getString("MATURITY_DATE")));
					xb.setResidudat1(NullCheck.isNotNull(rs.getString("RESIDUAL_DAYS")));
					xb.setIsin1(NullCheck.isNotNull(rs.getString("ISIN")));
				
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




	
	
	/*************************Details FIM0800***********************/
	
	
	
	
	
public ArrayList<XBRLFIM0800Bean> xbrlFIMajaxdetails(String reptype,String reprefno,String instno,String dt2,String dt1,String curr) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("repname    " + reptype + "reprefno   " + reprefno + "instno   " + instno + "dt2     " + dt2 +  "dt1    " + dt1);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLFIM0800Bean> arl = new ArrayList<XBRLFIM0800Bean>();
		NullCheck chk=new NullCheck();
		String status = "";
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		
		PreparedStatement ps = null;
		
		StringBuffer sql = new StringBuffer();
		
		
		DateFormat df=new DateFormat();		
		dt1 =df.formatdate(dt1);
		dt2 =df.formatdate(dt2);
		
		 DecimalFormat dfs = new DecimalFormat("##,##.00");  
		
	
		try {
		
			
			log.info("AJAX DETAILS GNANA" + reprefno );
			/*select * from TABLE(FIM0800_DTL_FUN('FIM0800','0','0','31-MAR-2014','01-MAR-2014','31-MAR-2014','MUR'));*/
			sql.append("SELECT SL_NO,to_char(TRADE_DATE,'DD-MM-YYYY')TRADE_DATE,to_char(VALUE_DATE,'DD-MM-YYYY')VALUE_DATE,TRAN_TYPE,ACCT_NUMBER,COUNTER_PARTY_NAME,COUNTER_PARTY_CODE,SECURITY_AMOUNT,YIELD,PRICE,to_char(MATURITY_DATE,'DD-MM-YYYY')MATURITY_DATE,RESIDUAL_DAYS,ISIN FROM TABLE(FIM0800_RPT_FUN('"+reptype+"','"+reprefno+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
			
			log.info("FIM Vinoth Kumar  "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				//log.info("whileee");
				
				
				 
				XBRLFIM0800Bean xb=new XBRLFIM0800Bean();
	
				xb.setSrlno(NullCheck.isNotNull(rs.getString("SL_NO")));
				xb.setTrade1(NullCheck.isNotNull(rs.getString("TRADE_DATE")));
				xb.setValdate1(NullCheck.isNotNull(rs.getString("VALUE_DATE")));
				xb.setTyptrn1(NullCheck.isNotNull(rs.getString("TRAN_TYPE")));
				xb.setAcntno1(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
				xb.setCntprty1(NullCheck.isNotNull(rs.getString("COUNTER_PARTY_NAME")));
				xb.setCcntprtycode1(NullCheck.isNotNull(rs.getString("COUNTER_PARTY_CODE")));
				xb.setNominalamt1(NullCheck.isNotNull(rs.getString("SECURITY_AMOUNT")));
				xb.setYields1(NullCheck.isNotNull(rs.getString("YIELD")));
				xb.setClanpr1(NullCheck.isNotNull(rs.getString("PRICE")));
				xb.setMatudat1(NullCheck.isNotNull(rs.getString("MATURITY_DATE")));
				xb.setResidudat1(NullCheck.isNotNull(rs.getString("RESIDUAL_DAYS")));
				xb.setIsin1(NullCheck.isNotNull(rs.getString("ISIN")));
			
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
public String detailFIM0800saves() {

	ConnectionManager connmgr=new ConnectionManager();
	Connection conn=connmgr.getConnection();
			HttpServletRequest request = ServletActionContext.getRequest();
			DateFormat df = new DateFormat();
			log.info(request.getParameter("reptype"));
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

public String FIM0800chckmodified() {

	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	HttpSession session = request.getSession();
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	if(request.getParameter("type").equals("chkuser")) {
		sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM FIM0800_MOD_TABLE ");
	}else {
		//sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM FIM0800_MOD_TABLE WHERE REPORT_DATE='"+NullCheck.isNotNull(df.formatdate(request.getParameter("repdate")))+"'");
		sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM FIM0800_MOD_TABLE ");

	}
	
	
	try {
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	      while(rs.next()) {
	    	  cnt=NullCheck.isNotZero(rs.getString("CNT"));
	      }
	    
	}catch(SQLException e) {
		e.printStackTrace();
	}
	return "success";
}


public String detailFIM0800savecheck() {

	ConnectionManager connmgr=new ConnectionManager();
	Connection conn=connmgr.getConnection();
	ArrayList<String> arl = new ArrayList<String>();
			HttpServletRequest request = ServletActionContext.getRequest();
			DateFormat df = new DateFormat();
			StringBuffer sql = new StringBuffer();
			PreparedStatement ps = null;
			
			sql.append("SELECT COUNT(REPORT_DATE) as repdate FROM FIM0800_RPT_TB where REPORT_ID = '"+request.getParameter("reptype")+"' AND  REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ");
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


public String modFIM0800cancel() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	sql.append("DELETE FROM FIM0800_MOD_TABLE WHERE  BILL_CODE='"+NullCheck.isNotNull(request.getParameter("acntno1"))+"'");
	
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
		resalert="Cancellation Successful";
	}else {
		resalert="Technical Issue.Try Again Later.";
	}
	
	return "success";
}



public ArrayList<XBRLFIM0800Bean> FIM0800verify(){
	
	ArrayList<XBRLFIM0800Bean> arl = new ArrayList<XBRLFIM0800Bean>();
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	sql.append("SELECT /* +FIRST_ROWS(100) */to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,to_char(TRADE_DATE,'DD-MM-YYYY')TRADE_DATE,to_char(VALUE_DATE,'DD-MM-YYYY')VALUE_DATE,TRAN_TYPE,BILL_CODE,BILL_HOLDER,COUNTER_PARTY_CODE,AMOUNT,YIELD,BILL_PRICE,to_char(MATURITY_DATE,'DD-MM-YYYY')MATURITY_DATE,BILL_BAND,ISIN,DECODE(DEL_FLG,'A','Added','M','Modified','D','Deleted') as DEL_FLG ,LCHG_USER_ID FROM FIM0800_MOD_TABLE");
	log.info("Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		XBRLFIM0800Bean xb=new XBRLFIM0800Bean();
		 xb.setRepdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));

		
		xb.setTrade1(NullCheck.isNotNull(rs.getString("TRADE_DATE")));
		xb.setValdate1(NullCheck.isNotNull(rs.getString("VALUE_DATE")));
		xb.setTyptrn1(NullCheck.isNotNull(rs.getString("TRAN_TYPE")));
		xb.setAcntno1(NullCheck.isNotNull(rs.getString("BILL_CODE")));
		xb.setCntprty1(NullCheck.isNotNull(rs.getString("BILL_HOLDER")));
		xb.setCcntprtycode1(NullCheck.isNotNull(rs.getString("COUNTER_PARTY_CODE")));
		xb.setNominalamt1(NullCheck.isNotNull(rs.getString("AMOUNT")));
		xb.setYields1(NullCheck.isNotNull(rs.getString("YIELD")));
		xb.setClanpr1(NullCheck.isNotNull(rs.getString("BILL_PRICE")));
		xb.setMatudat1(NullCheck.isNotNull(rs.getString("MATURITY_DATE")));
		xb.setResidudat1(NullCheck.isNotNull(rs.getString("BILL_BAND")));
		xb.setIsin1(NullCheck.isNotNull(rs.getString("ISIN")));
	
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

public String FIM0800verifymaster() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	HttpSession session = request.getSession();
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();	
	
	//------------------get data from mod table---------------------
	XBRLFIM0800Bean xb=new XBRLFIM0800Bean();
	
	sql.setLength(0);
	sql.append("SELECT /* +FIRST_ROWS(100) */to_char(TRADE_DATE,'DD-MM-YYYY')TRADE_DATE,to_char(VALUE_DATE,'DD-MM-YYYY')VALUE_DATE,TRAN_TYPE,BILL_CODE,BILL_HOLDER,COUNTER_PARTY_CODE,AMOUNT,YIELD,BILL_PRICE,to_char(MATURITY_DATE,'DD-MM-YYYY')MATURITY_DATE,BILL_BAND,ISIN,DEL_FLG,LCHG_USER_ID FROM FIM0800_MOD_TABLE "
			+ "WHERE BILL_CODE='"+NullCheck.isNotNull(request.getParameter("acntno1"))+"' ");
	log.info("Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		

		xb.setTrade1(NullCheck.isNotNull(rs.getString("TRADE_DATE")));
		xb.setValdate1(NullCheck.isNotNull(rs.getString("VALUE_DATE")));
		xb.setTyptrn1(NullCheck.isNotNull(rs.getString("TRAN_TYPE")));
		xb.setAcntno1(NullCheck.isNotNull(rs.getString("BILL_CODE")));
		xb.setCntprty1(NullCheck.isNotNull(rs.getString("BILL_HOLDER")));
		xb.setCcntprtycode1(NullCheck.isNotNull(rs.getString("COUNTER_PARTY_CODE")));
		xb.setNominalamt1(NullCheck.isNotNull(rs.getString("AMOUNT")));
		xb.setYields1(NullCheck.isNotNull(rs.getString("YIELD")));
		xb.setClanpr1(NullCheck.isNotNull(rs.getString("BILL_PRICE")));
		xb.setMatudat1(NullCheck.isNotNull(rs.getString("MATURITY_DATE")));
		xb.setResidudat1(NullCheck.isNotNull(rs.getString("BILL_BAND")));
		xb.setIsin1(NullCheck.isNotNull(rs.getString("ISIN")));
	
	
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
				" INSERT INTO FIM0800_MOD_TABLE(TRADE_DATE,REPORT_DATE,VALUE_DATE,TRAN_TYPE,BILL_CODE,BILL_HOLDER,COUNTER_PARTY_CODE,BILL_PRICE,YIELD,AMOUNT,MATURITY_DATE,BILL_BAND,ISIN,DEL_FLG,LCHG_USER_ID,LCHG_TIME,VERIFY_USER_ID,VERIFY_TIME)" + "VALUES ('"
                      + df.formatdate(request.getParameter("trade1")) + "','" + df.formatdate(request.getParameter("repdate")) + "','"
						+  df.formatdate(request.getParameter("valdate1")) + "','" + request.getParameter("typtrn1") + "','"
						+ request.getParameter("acntno1") + "','" + request.getParameter("cntprty1") + "','"
						+ request.getParameter("ccntprtycode1") + "','" + request.getParameter("nominalamt1") + "','"
						+ request.getParameter("yields1") + "','" + request.getParameter("clanpr1") + "','"
						+  df.formatdate(request.getParameter("matudat1")) + "','" + request.getParameter("residudat1") + "','"
						+request.getParameter("isin1") + "','"
						+xb.getModtyp() + "','"
						+ session.getAttribute("userName")+"',SYSDATE,'"+ session.getAttribute("userName")+"',SYSDATE)");
		
		
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("DELETE FROM FIM0800_MOD_TABLE WHERE BILL_CODE='"+NullCheck.isNotNull(request.getParameter("acntno1"))+"'");
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
		
	}else if (xb.getModtyp().equals("M") ) {
		
	//For Modified Records
		
		sql.setLength(0);
		sql.append("UPDATE FIM0800_MAST_TABLE SET TRADE_DATE='" + df.formatdate(request.getParameter("trade1"))
		+"', VALUE_DATE='" + df.formatdate(request.getParameter("valdate1"))
		+"', TRAN_TYPE='" + request.getParameter("typtrn1")
		+"', AMOUNT='" + request.getParameter("clanpr1")	
		+"', BILL_HOLDER='" + request.getParameter("cntprty1")
		+"', COUNTER_PARTY_CODE='" + request.getParameter("ccntprtycode1")
		+"', BILL_PRICE='" + request.getParameter("nominalamt1")
												
        +"', YIELD='" + request.getParameter("yields1")
		+"', MATURITY_DATE='" + df.formatdate(request.getParameter("matudat1"))
		+"', BILL_BAND='" + request.getParameter("residudat1")
		+"', ISIN='" + request.getParameter("isin1")+ "',VERIFY_USER_ID='"+session.getAttribute("userName")+"',VERIFY_TIME=SYSDATE  "						
		+ "WHERE  BILL_CODE='"+NullCheck.isNotNull(request.getParameter("acntno1"))+"'");
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("DELETE FROM FIM0800_MOD_TABLE WHERE BILL_CODE='"+NullCheck.isNotNull(request.getParameter("acntno1"))+"'");
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
		
		
	}else if (xb.getModtyp().equals("D") ) {
		
	//For Deleted Records
		
		sql.setLength(0);
		sql.append("DELETE FROM FIM0800_MAST_TABLE WHERE BILL_CODE='"+NullCheck.isNotNull(request.getParameter("acntno1"))+"'");
		
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("UPDATE FIM0800_MOD_TABLE SET LCHG_USER_ID='"+session.getAttribute("userName")+"' WHERE BILL_CODE='"+NullCheck.isNotNull(request.getParameter("acntno1"))+"'");
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
		    sql.append("DELETE FROM FIM0800_MOD_TABLE WHERE BILL_CODE='"+NullCheck.isNotNull(request.getParameter("acntno1"))+"'");
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
	}
	
	
	
	
	
	
	return status;
}





	

}

