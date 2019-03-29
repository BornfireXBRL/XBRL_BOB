package dao;


import java.sql.CallableStatement;

/****************************************************************************************************************
*																												*
* 	* @companyName 			:	Bonfire Innovation Private Limited Chennai										*
* 	* @project 				:	Extensible Business Reporting Language (XBRL)									*
* 	* @name 				:	XBRLBLS0105Action.java															*
* 	* @path 				:	action																			*
* 	* @author 				:	D PraveenBabu																	*
* 	* @version 				: 	1.0																				*
* 	* @functionality 		:	It contains the action with multiple methods to create SUP01400 Report.													*
* 	* @relatedScripts 		: 	bean.XBRLBLS100Bean.java,dao.XBRLBLS0105Dao.java 								*
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

import com.google.gson.Gson;

import basecode.DateFormat;
import bean.XBRLBLS0105Bean;
import bean.XBRLBLS0105Bean;
import bean.XBRLBLS0105Bean;
import bean.XBRLBLS0105Bean;
import bean.XBRLBLS0105Bean;
import bean.XBRLBLS0105Bean;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRLBLS0105Dao {
	static Logger log = Logger.getLogger(XBRLBLS0105Dao.class);
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
	public String cnt;
	public static Logger getLog() {
		return log;
	}

	public static void setLog(Logger log) {
		XBRLBLS0105Dao.log = log;
	}

	public String getCnt() {
		return cnt;
	}

	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	public int cnt1;
	
	public int getCnt1() {
		return cnt1;
	}

	public void setCnt1(int cnt1) {
		this.cnt1 = cnt1;
	}

	public ArrayList<XBRLBLS0105Dao> ReporefSeq(String dt1, String dt2) {

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

		ArrayList<XBRLBLS0105Dao> arl = new ArrayList<XBRLBLS0105Dao>();
		sql.append("select REPORT_REF_NO from BLS0105_MOD_TABLE where REPORT_DATE='" + dt2 + "' ORDER BY REPORT_REF_NO");

		log.info("SELECTPROFILE" + sql.toString());

		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLBLS0105Dao xel = new XBRLBLS0105Dao();
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


	
	public String modBLS0105cancel() {
		String status="";
		HttpServletRequest request = ServletActionContext.getRequest();
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();
		DateFormat df=new DateFormat();		
		sql.setLength(0);
		sql.append("DELETE FROM BLS0105_MOD_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"' and CUST_ID='"+NullCheck.isNotNull(request.getParameter("cusid"))+"'");
		
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
	public String detailBLS0105savecheck() {

		ConnectionManager connmgr=new ConnectionManager();
		Connection conn=connmgr.getConnection();
		ArrayList<String> arl = new ArrayList<String>();
				HttpServletRequest request = ServletActionContext.getRequest();
				DateFormat df = new DateFormat();
				StringBuffer sql = new StringBuffer();
				PreparedStatement ps = null;
				
				sql.append("SELECT COUNT(REPORT_DATE) as repdate FROM BLS0105_RPT_TB where REPORT_ID = '"+request.getParameter("reptype")+"' AND  REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ");
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
	public String BLS0105chckmodified() {

		HttpServletRequest request = ServletActionContext.getRequest();
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		HttpSession session = request.getSession();
		StringBuffer sql = new StringBuffer();
		DateFormat df=new DateFormat();		
		sql.setLength(0);
		if(request.getParameter("type").equals("chkuser")) {
			sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM BLS0105_MOD_TABLE ");
		}else {
			sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM BLS0105_MOD_TABLE ");

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
	public ArrayList<XBRLBLS0105Bean> BLS0105verify(){
		
		ArrayList<XBRLBLS0105Bean> arl = new ArrayList<XBRLBLS0105Bean>();
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();
		DateFormat df=new DateFormat();		
		sql.setLength(0);
		sql.append("SELECT CUST_ID,CUST_NAME,CUST_GRP,NATURE_OF_CUST,ISIC_CODE,UNIQ_ID,EXPOSURE_TYPE,CRNCY_CODE,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,to_char(BALANCE_AMT_AC, '9,999,999,999,990.99')BALANCE_AMT_AC,DECODE(DEL_FLG,'A','Added','M','Modified','D','Deleted') as DEL_FLG ,LCHG_USER_ID FROM BLS0105_MOD_TABLE");
		log.info("Gayu"+sql.toString());
		try {
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLBLS0105Bean xb=new XBRLBLS0105Bean();
			   xb.setCusid(NullCheck.isNotNull(rs.getString("CUST_ID")));
				xb.setCusnam(NullCheck.isNotNull(rs.getString("CUST_NAME")));
				xb.setCusgrp(NullCheck.isNotNull(rs.getString("CUST_GRP")));
				xb.setNatucus(NullCheck.isNotNull(rs.getString("NATURE_OF_CUST")));
				xb.setIsiccod(NullCheck.isNotNull(rs.getString("ISIC_CODE")));
				xb.setUniid(NullCheck.isNotNull(rs.getString("UNIQ_ID")));
				xb.setExpotyp(NullCheck.isNotNull(rs.getString("EXPOSURE_TYPE")));
				xb.setBalamt(NullCheck.isNotNull(rs.getString("BALANCE_AMT_AC")));
				xb.setCurrcod(NullCheck.isNotNull(rs.getString("CRNCY_CODE")));
				xb.setRepodat(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
		
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
	
	
	
	public String BLS0105verifymaster() {
		String status="";
		HttpServletRequest request = ServletActionContext.getRequest();
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		HttpSession session = request.getSession();
		StringBuffer sql = new StringBuffer();
		DateFormat df=new DateFormat();	
		
		//------------------get data from mod table---------------------
		XBRLBLS0105Bean xb=new XBRLBLS0105Bean();
		System.out.println("fdjhf");
		sql.setLength(0);
		sql.append("SELECT CUST_ID,CUST_NAME,CUST_GRP,NATURE_OF_CUST,ISIC_CODE,UNIQ_ID,EXPOSURE_TYPE,CRNCY_CODE,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,to_char(BALANCE_AMT_AC, '9,999,999,999,990.99')BALANCE_AMT_AC,DEL_FLG,LCHG_USER_ID FROM BLS0105_MOD_TABLE "
				+ "WHERE CUST_ID='"+NullCheck.isNotNull(request.getParameter("cusid"))+"' AND REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("repodat")))+"' ");
		log.info("Gayu"+sql.toString());
		try {
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			

			xb.setCusid(NullCheck.isNotNull(rs.getString("CUST_ID")));
			xb.setCusnam(NullCheck.isNotNull(rs.getString("CUST_NAME")));
			xb.setCusgrp(NullCheck.isNotNull(rs.getString("CUST_GRP")));
			xb.setNatucus(NullCheck.isNotNull(rs.getString("NATURE_OF_CUST")));
			xb.setIsiccod(NullCheck.isNotNull(rs.getString("ISIC_CODE")));
			xb.setUniid(NullCheck.isNotNull(rs.getString("UNIQ_ID")));
			xb.setExpotyp(NullCheck.isNotNull(rs.getString("EXPOSURE_TYPE")));
			xb.setBalamt(NullCheck.isNotNull(rs.getString("BALANCE_AMT_AC")));
			xb.setCurrcod(NullCheck.isNotNull(rs.getString("CRNCY_CODE")));
			xb.setRepodat(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
				
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
					" INSERT INTO BLS0105_MAST_TABLE(CUST_ID,CUST_NAME,CUST_GRP,NATURE_OF_CUST,ISIC_CODE,UNIQ_ID,EXPOSURE_TYPE,CRNCY_CODE,REPORT_DATE,BALANCE_AMT_AC,DEL_FLG,LCHG_USER_ID,LCHG_TIME,VERIFY_USER_ID,VERIFY_TIME)" + "VALUES ('"
						
 + request.getParameter("cusid") + "','"
				+ request.getParameter("cusnam") + "','" + request.getParameter("cusgrp") + "','"
				+ request.getParameter("natucus") + "','" + request.getParameter("isiccod") + "','"
				+ request.getParameter("uniid") + "','" + request.getParameter("expotyp") + "','"
				+ request.getParameter("currcod") + "','" + df.formatdate(request.getParameter("repodat"))
				+ "','" + request.getParameter("balamt") + "','"+request.getParameter("modtyp")+"','"
							+ session.getAttribute("userName")+"',SYSDATE,'"+ session.getAttribute("userName")+"',SYSDATE)");
					
			try {
				log.info(sql.toString());
				ps=conn.prepareStatement(sql.toString());
				
			    int rs=0;
			    rs=ps.executeUpdate();
			     
			    status="success";
			    
			    sql.setLength(0);
			    sql.append("DELETE FROM BLS0105_MOD_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("repodat")))+"' and CUST_ID='"+NullCheck.isNotNull(request.getParameter("cusid"))+"'");
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
			sql.append("UPDATE BLS0105_MAST_TABLE SET CUST_ID='"+NullCheck.isNotNull(request.getParameter("cusid"))+"',CUST_NAME='"+NullCheck.isNotNull(request.getParameter("cusnam"))+"',CUST_GRP='"+NullCheck.isNotNull(request.getParameter("cusgrp"))+"',NATURE_OF_CUST='"+NullCheck.isNotNull(request.getParameter("natucus"))+"',ISIC_CODE='"+NullCheck.isNotNull(request.getParameter("isiccod"))+"',UNIQ_ID='"+NullCheck.isNotNull(request.getParameter("uniid"))+"',EXPOSURE_TYPE='"+NullCheck.isNotNull(request.getParameter("expotyp"))+"',CRNCY_CODE='"+NullCheck.isNotNull(request.getParameter("currcod"))+"',BALANCE_AMT_AC='"+NullCheck.isNotNull(request.getParameter("balamt"))+"',REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("repodat")))+"',VERIFY_USER_ID='"+session.getAttribute("userName")+"',VERIFY_TIME=SYSDATE WHERE CUST_ID='"+NullCheck.isNotNull(request.getParameter("cusid"))+"' AND REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("repodat")))+"'");
			
			try {
				log.info(sql.toString());
				ps=conn.prepareStatement(sql.toString());
				
			    int rs=0;
			    rs=ps.executeUpdate();
			     
			    status="success";
			    
			    sql.setLength(0);
			    sql.append("DELETE FROM BLS0105_MOD_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("repodat")))+"' and CUST_ID='"+NullCheck.isNotNull(request.getParameter("cusid"))+"'");
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
			sql.append("DELETE FROM BLS0105_MAST_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("repodat")))+"' and CUST_ID='"+NullCheck.isNotNull(request.getParameter("cusid"))+"'");
			
			try {
				log.info(sql.toString());
				ps=conn.prepareStatement(sql.toString());
				
			    int rs=0;
			    rs=ps.executeUpdate();
			     
			    status="success";
			    
			    sql.setLength(0);
			    sql.append("UPDATE BLS0105_MOD_TABLE SET LCHG_USER='"+session.getAttribute("userName")+"' WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("repodat")))+"' and CUST_ID='"+NullCheck.isNotNull(request.getParameter("cusid"))+"'");
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
			    sql.append("DELETE FROM BLS0105_MOD_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("repodat")))+"' and CUST_ID='"+NullCheck.isNotNull(request.getParameter("cusid"))+"'");
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

public ArrayList<XBRLBLS0105Bean> xbrlBLS0105(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
		
		
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLBLS0105Bean> arl = new ArrayList<XBRLBLS0105Bean>();
		
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
				
				sql.append("SELECT SL_NO,CUST_NAME,UNIQ_ID,NATURE_OF_CUST,to_char(AMT_FUND_BASED, '9,999,999,999,990.99')AMT_FUND_BASED,to_char(AMT_NON_FUND_BASED, '9,999,999,999,990.99')AMT_NON_FUND_BASED FROM TABLE(BLS0105_RPT_FUN('BLS0105','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
				
				
			log.info("BLS0105 sec1 "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				XBRLBLS0105Bean xb=new XBRLBLS0105Bean();
				
			
				xb.setSrno(NullCheck.isNotNull(rs.getString("SL_NO")));
				xb.setNameofcus(NullCheck.isNotNull(rs.getString("CUST_NAME")));
				xb.setUniiden(NullCheck.isNotNull(rs.getString("UNIQ_ID")));
				xb.setCatgbc(NullCheck.isNotNull(rs.getString("NATURE_OF_CUST")));
				xb.setAmtfubas(NullCheck.isNotNull(rs.getString("AMT_FUND_BASED")));
				xb.setAmtnonfunbas(NullCheck.isNotNull(rs.getString("AMT_NON_FUND_BASED")));
				


					
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
	
public ArrayList<XBRLBLS0105Bean> xbrlBLS0105ajaxdetails(String repname,String ReporefSeq,String instno,String dt2,String curr) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("repname    " + repname + "reprefno   "  + ReporefSeq + "instno"+ instno +"dt2   " + dt2 +"currency" +curr);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLBLS0105Bean> arl = new ArrayList<XBRLBLS0105Bean>();
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
		
		
			
		sql.append("SELECT /* +FIRST_ROWS(100) */CUST_ID,CUST_NAME,CUST_GRP,NATURE_OF_CUST,ISIC_CODE,UNIQ_ID,EXPOSURE_TYPE,CRNCY_CODE,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,to_char(BALANCE_AMT_AC, '9,999,999,999,990.99')BALANCE_AMT_AC FROM TABLE(BLS0105_DTL_FUN('BLS0105','"+chk.notZero(ReporefSeq)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
			log.info("BLS  Gayu  "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				
								
				 
				XBRLBLS0105Bean xb=new XBRLBLS0105Bean();
				
				
				    xb.setCusid(NullCheck.isNotNull(rs.getString("CUST_ID")));
					xb.setCusnam(NullCheck.isNotNull(rs.getString("CUST_NAME")));
					xb.setCusgrp(NullCheck.isNotNull(rs.getString("CUST_GRP")));
					xb.setNatucus(NullCheck.isNotNull(rs.getString("NATURE_OF_CUST")));
					xb.setIsiccod(NullCheck.isNotNull(rs.getString("ISIC_CODE")));
					xb.setUniid(NullCheck.isNotNull(rs.getString("UNIQ_ID")));
					xb.setExpotyp(NullCheck.isNotNull(rs.getString("EXPOSURE_TYPE")));
					xb.setBalamt(NullCheck.isNotNull(rs.getString("BALANCE_AMT_AC")));
					xb.setCurrcod(NullCheck.isNotNull(rs.getString("CRNCY_CODE")));
					xb.setRepodat(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
					
				

			
			 
				
		
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
public ArrayList<XBRLBLS0105Bean> xbrlbls4RR(String dt1,String dt2,String reprefno,String instno,String curr) {
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLBLS0105Bean> arl = new ArrayList<XBRLBLS0105Bean>();
	NullCheck chk=new NullCheck();
	
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();
	
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	//sql.append("SELECT * FROM TABLE(BLS0105_DTL_FUN('BLS0105','0','0','31-AUG-2018','01-AUG-2018','31-AUG-2018','MUR'))");
		
	sql.append("SELECT /* +FIRST_ROWS(100) */CUST_ID,CUST_NAME,CUST_GRP,NATURE_OF_CUST,ISIC_CODE,UNIQ_ID,EXPOSURE_TYPE,CRNCY_CODE,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,to_char(BALANCE_AMT_AC, '9,999,999,999,990.99')BALANCE_AMT_AC FROM TABLE(BLS0105_DTL_FUN('BLS0105','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
	log.info("DOC&&&&SELECT Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		
		XBRLBLS0105Bean xb=new XBRLBLS0105Bean();
		   xb.setCusid(NullCheck.isNotNull(rs.getString("CUST_ID")));
			xb.setCusnam(NullCheck.isNotNull(rs.getString("CUST_NAME")));
			xb.setCusgrp(NullCheck.isNotNull(rs.getString("CUST_GRP")));
			xb.setNatucus(NullCheck.isNotNull(rs.getString("NATURE_OF_CUST")));
			xb.setIsiccod(NullCheck.isNotNull(rs.getString("ISIC_CODE")));
			xb.setUniid(NullCheck.isNotNull(rs.getString("UNIQ_ID")));
			xb.setExpotyp(NullCheck.isNotNull(rs.getString("EXPOSURE_TYPE")));
			xb.setBalamt(NullCheck.isNotNull(rs.getString("BALANCE_AMT_AC")));
			xb.setCurrcod(NullCheck.isNotNull(rs.getString("CRNCY_CODE")));
			xb.setRepodat(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
		
	
		
		
		
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

public String detailBLS0105saves() {

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


