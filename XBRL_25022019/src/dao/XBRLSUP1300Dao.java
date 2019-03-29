package dao;


import java.sql.CallableStatement;

/****************************************************************************************************************
*																												*
* 	* @companyName 			:	Bonfire Innovation Private Limited Chennai										*
* 	* @project 				:	Extensible Business Reporting Language (XBRL)									*
* 	* @name 				:	XBRLSUP1300Action.java															*
* 	* @path 				:	action																			*
* 	* @author 				:	D PraveenBabu																	*
* 	* @version 				: 	1.0																				*
* 	* @functionality 		:	It contains the action with multiple methods to create SUP01400 Report.													*
* 	* @relatedScripts 		: 	bean.XBRLSUP1300Bean.java,dao.XBRLSUP1300Dao.java 								*
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

import basecode.DateFormat;
import bean.XBRLSUP1300Bean;
import bean.XBRLSUP1300Bean;
import org.apache.log4j.Logger;
import utilities.ConnectionManager;
import utilities.NullCheck;

public class XBRLSUP1300Dao {
	
	static Logger log = Logger.getLogger(XBRLSUP1300Dao.class);
	
public String Reporef;
	
	
	public String getReporef() {
		return Reporef;
	}

	public void setReporef(String reporef) {
		Reporef = reporef;
	}


	public ArrayList<XBRLSUP1300Dao> ReporefSeq(String dt1,String dt2){
		
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
		
		ArrayList<XBRLSUP1300Dao> arl = new ArrayList<XBRLSUP1300Dao>();
		sql.append("select REPORT_REF_NO from SUP1300_MOD_TABLE where REPORT_DATE='" + dt2 + "' ORDER BY REPORT_REF_NO");


		log.info("SELECTPROFILE"+sql.toString());
		
		try {
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
		
				XBRLSUP1300Dao xel=new XBRLSUP1300Dao();
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
	
	
	public ArrayList<XBRLSUP1300Bean> xbrlsupsumEP(String reptype,String ReporefSeq,String dt2,String dt1,String curr) {
		
		log.info("SUP SUMMARY List Data AB " + dt1 + "dt22222" + dt2);
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLSUP1300Bean> arl = new ArrayList<XBRLSUP1300Bean>();
		
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
			
			
		
				log.info("No Report Ref" );
			
								//sql.append("SELECT /* +FIRST_ROWS(100) */DYNAMIC_DOMAIN ,TRAN_CRNCY,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,INSTITUTION_SL_NO,TRANSACTION_SL_NO,INSTITUTION_NAME,TRAN_NATURE,INSTITUTE_CODE, to_char(SM_TRAN_AMT, '9,999,999,999,990.99')SM_TRAN_AMT,to_char(SM_INT_RATE, '9,999,999,999,990.99')SM_INT_RATE, to_char(MSN_TRAN_AMT, '9,999,999,999,990.99')MSN_TRAN_AMT,to_char(MSN_START_DATE,'DD-MM-YYYY')MSN_START_DATE,to_char(MSN_END_DATE,'DD-MM-YYYY')MSN_END_DATE, to_char(MSN_INT_RATE, '9,999,999,999,990.99')MSN_INT_RATE, to_char(TM_TRAN_AMT, '9,999,999,999,990.99')TM_TRAN_AMT,to_char(TM_START_DATE,'DD-MM-YYYY')TM_START_DATE,to_char(TM_END_DATE,'DD-MM-YYYY')TM_END_DATE,to_char(TM_INT_RATE, '9,999,999,999,990.99')TM_INT_RATE FROM TABLE(SUP1300_RPT_FUN('SUP1300',0,'"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
				sql.append("select /* +FIRST_ROWS(100) */ INSTANCE_NAME,INSTANCE_CODE,INDIVIDUALS,CORPORATES,OTHERS from table(SUP1300_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");
		
			
			                                                                                                                                                                                                                                                                               
			
			
			log.info("SUP SUMMARY "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
			
				XBRLSUP1300Bean xb=new XBRLSUP1300Bean();
				
			
		xb.setInsname(NullCheck.isNotNull(rs.getString("INSTANCE_NAME")));
		xb.setInscode(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
		xb.setIndividuals(NullCheck.isNotNull(rs.getString("INDIVIDUALS")));
		xb.setCorporates(NullCheck.isNotNull(rs.getString("CORPORATES")));
		xb.setOthers(NullCheck.isNotNull(rs.getString("OTHERS")));
				
				

			
			
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

	public ArrayList<XBRLSUP1300Bean> xbrlsupajaxdetails(String repname,String reprefno,String instno,String dt2,String dt1,String curr) {
			
		
		
				
				


			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			
			ArrayList<XBRLSUP1300Bean> arl = new ArrayList<XBRLSUP1300Bean>();
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
			
				
				
				
				
			//	sql.append("SELECT /* +FIRST_ROWS(100) */ MODES,CHQ_NUMBER,ACCT_NUMBER,ACCT_NAME,to_char(TRAN_DATE,'DD-MM-YYYY')TRAN_DATE,to_char(CHQ_AMOUNT, '9,999,999,999,990.99')CHQ_AMOUNT,CRNCY,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME FROM TABLE(PYM0100_DTL_FUN('PYM0100','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");
				//select * from table(SUP1300_DTL_FUN('SUP1300','0','0','31-MAR-2014','31-MAR-2014','31-MAR-2014','MUR'));
				//sql.append("SELECT /* +FIRST_ROWS(100) */ Dynamic Domain,Institution Serial Number,Transaction Serial Number,Name of Institution,Institution Code,Currency,Transaction Type,to_char(Call money,'DD-MM-YYYY')Call money,to_char(Money at Short Notice,'DD-MM-YYYY')Money at Short Notice,to_char(Team Money,'DD-MM-YYYY')Team Money,CRNCY,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME FROM TABLE(SUP1300_DTL_FUN('SUP1300','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");
				
			
				
				//sql.append("SELECT /* +FIRST_ROWS(100) */ TRAN_CRNCY,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,INSTITUTION_NAME,TRAN_NATURE,INSTITUTE_CODE,TRAN_TYPE,to_char(TRAN_AMT, '9,999,999,999,990.99')TRAN_AMT,to_char(START_DATE,'DD-MM-YYYY')START_DATE,to_char(END_DATE,'DD-MM-YYYY')END_DATE,to_char(INT_RATE, '9,999,999,999,990.99')INT_RATE FROM TABLE(SUP1300_DTL_FUN('SUP1300','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");

			//sql.append("select * from table(SUP1300_RPT_FUN('SUP1300','0','31-MAR-2014','31-MAR-2014','31-MAR-2014','MUR'))");
			sql.append("select /* +FIRST_ROWS(100) */ INSTANCE_NAME,INSTANCE_CODE,INDIVIDUALS,CORPORATES,OTHERS from table(SUP1300_RPT_FUN('"+repname+"','"+chk.notZero(reprefno)+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");

				log.info("SUP1300 Vinoth Kumar  "+sql.toString());
				
				ps=conn.prepareStatement(sql.toString());
				
			    ResultSet rs=ps.executeQuery();
			     

				while(rs.next()){
					XBRLSUP1300Bean xb=new XBRLSUP1300Bean();
					xb.setInsname(NullCheck.isNotNull(rs.getString("INSTANCE_NAME")));
					xb.setInscode(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
					xb.setIndividuals(NullCheck.isNotNull(rs.getString("INDIVIDUALS")));
					xb.setCorporates(NullCheck.isNotNull(rs.getString("CORPORATES")));
					xb.setOthers(NullCheck.isNotNull(rs.getString("OTHERS")));
									
							

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
	public ArrayList<XBRLSUP1300Bean> xbrls12ede(String repname,String reprefno,String instno,String dt2,String dt1,String curr) {
		
		
		
		
		


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLSUP1300Bean> arl = new ArrayList<XBRLSUP1300Bean>();
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
		
			
			
			
			
		//	sql.append("SELECT /* +FIRST_ROWS(100) */ MODES,CHQ_NUMBER,ACCT_NUMBER,ACCT_NAME,to_char(TRAN_DATE,'DD-MM-YYYY')TRAN_DATE,to_char(CHQ_AMOUNT, '9,999,999,999,990.99')CHQ_AMOUNT,CRNCY,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME FROM TABLE(PYM0100_DTL_FUN('PYM0100','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");
			//select * from table(SUP1300_DTL_FUN('SUP1300','0','0','31-MAR-2014','31-MAR-2014','31-MAR-2014','MUR'));
			//sql.append("SELECT /* +FIRST_ROWS(100) */ Dynamic Domain,Institution Serial Number,Transaction Serial Number,Name of Institution,Institution Code,Currency,Transaction Type,to_char(Call money,'DD-MM-YYYY')Call money,to_char(Money at Short Notice,'DD-MM-YYYY')Money at Short Notice,to_char(Team Money,'DD-MM-YYYY')Team Money,CRNCY,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME FROM TABLE(SUP1300_DTL_FUN('SUP1300','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");
			
		
			
			//sql.append("SELECT /* +FIRST_ROWS(100) */ TRAN_CRNCY,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,INSTITUTION_NAME,TRAN_NATURE,INSTITUTE_CODE,TRAN_TYPE,to_char(TRAN_AMT, '9,999,999,999,990.99')TRAN_AMT,to_char(START_DATE,'DD-MM-YYYY')START_DATE,to_char(END_DATE,'DD-MM-YYYY')END_DATE,to_char(INT_RATE, '9,999,999,999,990.99')INT_RATE FROM TABLE(SUP1300_DTL_FUN('SUP1300','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");

		//sql.append("select * from table(SUP1300_RPT_FUN('SUP1300','0','31-MAR-2014','31-MAR-2014','31-MAR-2014','MUR'))");
		sql.append("select /* +FIRST_ROWS(100) */ INSTANCE_NAME,INSTANCE_CODE,INDIVIDUALS,CORPORATES,OTHERS from table(SUP1300_RPT_FUN('"+repname+"','"+chk.notZero(reprefno)+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");

			log.info("SUP1300 Vinoth Kumar  "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				XBRLSUP1300Bean xb=new XBRLSUP1300Bean();
				xb.setInsname(NullCheck.isNotNull(rs.getString("INSTANCE_NAME")));
				xb.setInscode(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
				xb.setIndividuals(NullCheck.isNotNull(rs.getString("INDIVIDUALS")));
				xb.setCorporates(NullCheck.isNotNull(rs.getString("CORPORATES")));
				xb.setOthers(NullCheck.isNotNull(rs.getString("OTHERS")));
								
						

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
	
	public String detailSUP1300saves() {
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

