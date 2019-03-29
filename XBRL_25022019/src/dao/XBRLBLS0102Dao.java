package dao;


import java.sql.CallableStatement;

/****************************************************************************************************************
*																												*
* 	* @companyName 			:	Bonfire Innovation Private Limited Chennai										*
* 	* @project 				:	Extensible Business Reporting Language (XBRL)									*
* 	* @name 				:	XBRLBLS0102Action.java															*
* 	* @path 				:	action																			*
* 	* @author 				:	D PraveenBabu																	*
* 	* @version 				: 	1.0																				*
* 	* @functionality 		:	It contains the action with multiple methods to create SUP01400 Report.													*
* 	* @relatedScripts 		: 	bean.XBRLBLS100Bean.java,dao.XBRLBLS0102Dao.java 								*
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
import bean.XBRLBLS0102Bean;
import bean.XBRLBLS0102Bean;
import bean.XBRLBLS0110Bean;
import bean.XBRLBLS0102Bean;
import bean.XBRLBLS0102Bean;
import bean.XBRLBLS0102Bean;
import bean.XBRLBLS0102Bean;
import bean.XBRLBLS0102Bean;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRLBLS0102Dao {
	
	static Logger log = Logger.getLogger(XBRLBLS0102Dao.class);
	public String cnt;
	public String getCnt() {
		return cnt;
	}

	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	
public String resalert;
	
	
	public int cnt1;
	
	public String getResalert() {
		return resalert;
	}

	public void setResalert(String resalert) {
		this.resalert = resalert;
	}

	public int getCnt1() {
		return cnt1;
	}

	public void setCnt1(int cnt1) {
		this.cnt1 = cnt1;
	}

	public String Reporef;

	public String getReporef() {
		return Reporef;
	}

	public void setReporef(String reporef) {
		Reporef = reporef;
	}
	public String detailBLS0102savecheck() {

		ConnectionManager connmgr=new ConnectionManager();
		Connection conn=connmgr.getConnection();
		ArrayList<String> arl = new ArrayList<String>();
				HttpServletRequest request = ServletActionContext.getRequest();
				DateFormat df = new DateFormat();
				StringBuffer sql = new StringBuffer();
				PreparedStatement ps = null;
				
				sql.append("SELECT COUNT(REPORT_DATE) as repdate FROM BLS0102_S1_RPT_TB where REPORT_ID = '"+request.getParameter("reptype")+"' AND  REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ");
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
	public ArrayList<XBRLBLS0102Dao> ReporefSeq(String dt1, String dt2) {

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

		ArrayList<XBRLBLS0102Dao> arl = new ArrayList<XBRLBLS0102Dao>();
		sql.append("select REPORT_REF_NO from BLS0102_MOD_TABLE where REPORT_DATE='" + dt2 + "' ORDER BY REPORT_REF_NO");

		log.info("SELECTPROFILE" + sql.toString());

		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLBLS0102Dao xel = new XBRLBLS0102Dao();
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

	
public ArrayList<XBRLBLS0102Bean> xbrlBLS0102(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
		
		log.info("inside the section dao method");
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLBLS0102Bean> arl = new ArrayList<XBRLBLS0102Bean>();
		
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
		
				
			//sql.append("SELECT * FROM TABLE(BLS0102_S1_RPT_FUN('BLS0102','0','31-MAR-2018','01-MAR-2018','31-MAR-2018','MUR'))");
				
			sql.append("SELECT COUNT_PRTY_SL_NO,CUST_NAME,CUST_SUB_GRP,UNIQ_ID from table(BLS0102_S1_RPT_FUN('BLS0102','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
				
				
			log.info("sec1 "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				XBRLBLS0102Bean xb=new XBRLBLS0102Bean();
				
			
				xb.setCoun(NullCheck.isNotNull(rs.getString("COUNT_PRTY_SL_NO")));
				xb.setNamcou(NullCheck.isNotNull(rs.getString("CUST_NAME")));
				xb.setTyrela(NullCheck.isNotNull(rs.getString("CUST_SUB_GRP")));
				xb.setUniiden(NullCheck.isNotNull(rs.getString("UNIQ_ID")));
		
				arl.add(xb);
		
			}
			
			log.info("ARLLL"+arl.size());
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
	
public ArrayList<XBRLBLS0102Bean> xbrlBLS0102s2(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {

	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLBLS0102Bean> arl = new ArrayList<XBRLBLS0102Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	
	try {
	
		sql.append("SELECT /* +FIRST_ROWS(110) */ COUNT_PRTY_SL_NO,TRAN_SL_NO,CUST_NAME,CUST_SUB_GRP,ISIC_CODE,UNIQ_ID, EXPOSURE_TYPE,to_char(AMT_TO_COUNTER_PRTY, '9,999,999,999,990.99')AMT_TO_COUNTER_PRTY,to_char(AMT_FROM_COUNTER_PRTY, '9,999,999,999,990.99')AMT_FROM_COUNTER_PRTY FROM TABLE(BLS0102_S2_RPT_FUN('BLS0102','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");	
	
		log.info("sec2"+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLBLS0102Bean xb=new XBRLBLS0102Bean();
			
			xb.setCoupa(NullCheck.isNotNull(rs.getString("COUNT_PRTY_SL_NO")));
			xb.setTrasrno(NullCheck.isNotNull(rs.getString("TRAN_SL_NO")));
			xb.setNamcoutpar(NullCheck.isNotNull(rs.getString("CUST_NAME")));
			xb.setTyprelati(NullCheck.isNotNull(rs.getString("CUST_SUB_GRP")));
			xb.setUniidentifi(NullCheck.isNotNull(rs.getString("UNIQ_ID")));
			xb.setIsiccode(NullCheck.isNotNull(rs.getString("ISIC_CODE")));
			xb.setTypexp(NullCheck.isNotNull(rs.getString("EXPOSURE_TYPE")));
			xb.setAmtduetocou(NullCheck.isNotNull(rs.getString("AMT_TO_COUNTER_PRTY")));
			xb.setAmtduefrocou(NullCheck.isNotNull(rs.getString("AMT_FROM_COUNTER_PRTY")));
		
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



public ArrayList<XBRLBLS0102Bean> xbrlBLS0102ajaxdetails(String repname,String ReporefSeq,String instno,String dt2,String curr) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("repname    " + repname + "reprefno   "  + ReporefSeq + "instno"+ instno +"dt2   " + dt2 +"currency" +curr);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLBLS0102Bean> arl = new ArrayList<XBRLBLS0102Bean>();
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
		
		
			sql.append("SELECT /* +FIRST_ROWS(110) */ CUST_ID,CUST_NAME,CUST_GRP,CUST_SUB_GRP,ISIC_CODE,UNIQ_ID, EXPOSURE_TYPE,to_char(BALANCE_AMT_AC, '9,999,999,999,990.99')BALANCE_AMT_AC,CRNCY_CODE,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE FROM TABLE(BLS0102_DTL_FUN('BLS0102','"+ReporefSeq+"','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");	

			
			log.info("det1"+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				//log.info("whileee");
								
				 
				XBRLBLS0102Bean xb=new XBRLBLS0102Bean();
				
				
			    	xb.setCusid(NullCheck.isNotNull(rs.getString("CUST_ID")));
					xb.setCusnam(NullCheck.isNotNull(rs.getString("CUST_NAME")));
					xb.setCusgrp(NullCheck.isNotNull(rs.getString("CUST_GRP")));
					xb.setCussugrp(NullCheck.isNotNull(rs.getString("CUST_SUB_GRP")));
					xb.setIsiccod(NullCheck.isNotNull(rs.getString("ISIC_CODE")));
					xb.setUnicod(NullCheck.isNotNull(rs.getString("UNIQ_ID")));
					xb.setExsutyp(NullCheck.isNotNull(rs.getString("EXPOSURE_TYPE")));
					xb.setBalamtac(NullCheck.isNotNull(rs.getString("BALANCE_AMT_AC")));
					xb.setCurcod(NullCheck.isNotNull(rs.getString("CRNCY_CODE")));
				 	xb.setRepdat(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
					/*xb.setDlflg(NullCheck.isNotNull(rs.getString("DLETE_FLOUG")));
					xb.setRequsid(NullCheck.isNotNull(rs.getString("REQUIER_USER_ID")));
					xb.setReqtim(NullCheck.isNotNull(rs.getString("REQUIER_TIME")));
					xb.setLcghusid(NullCheck.isNotNull(rs.getString("LCHG_USER_ID")));
					xb.setLchgtim(NullCheck.isNotNull(rs.getString("LCHG_TIME")));
					xb.setVerusid(NullCheck.isNotNull(rs.getString("VERIFY_USER_ID")));
					xb.setVertim(NullCheck.isNotNull(rs.getString("VERIFY_TIME")));*/
					
					
				

					
				

			
			
				
		
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

public ArrayList<XBRLBLS0102Bean> xbrlbls4RR(String dt1,String dt2,String ReporefSeq,String instno,String curr) {
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLBLS0102Bean> arl = new ArrayList<XBRLBLS0102Bean>();
	NullCheck chk=new NullCheck();
	
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();
	
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	//sql.append("SELECT * FROM TABLE(BLS0102_DTL_FUN('BLS0102','0','0','31-AUG-2018','01-AUG-2018','31-AUG-2018','MUR'))");
		
	sql.append("SELECT /* +FIRST_ROWS(110) */ CUST_ID,CUST_NAME,CUST_GRP,CUST_SUB_GRP,ISIC_CODE,UNIQ_ID, EXPOSURE_TYPE,to_char(BALANCE_AMT_AC, '9,999,999,999,990.99')BALANCE_AMT_AC,CRNCY_CODE,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE FROM TABLE(BLS0102_DTL_FUN('BLS0102','"+ReporefSeq+"','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");	
	log.info("DOC&&&&SELECT Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		
		XBRLBLS0102Bean xb=new XBRLBLS0102Bean();
	 	xb.setCusid(NullCheck.isNotNull(rs.getString("CUST_ID")));
		xb.setCusnam(NullCheck.isNotNull(rs.getString("CUST_NAME")));
		xb.setCusgrp(NullCheck.isNotNull(rs.getString("CUST_GRP")));
		xb.setCussugrp(NullCheck.isNotNull(rs.getString("CUST_SUB_GRP")));
		xb.setIsiccod(NullCheck.isNotNull(rs.getString("ISIC_CODE")));
		xb.setUnicod(NullCheck.isNotNull(rs.getString("UNIQ_ID")));
		xb.setExsutyp(NullCheck.isNotNull(rs.getString("EXPOSURE_TYPE")));
		xb.setBalamtac(NullCheck.isNotNull(rs.getString("BALANCE_AMT_AC")));
		xb.setCurcod(NullCheck.isNotNull(rs.getString("CRNCY_CODE")));
	 	xb.setRepdat(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
		
	
		
		
		
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
public String detailBLS0102saves() {

ConnectionManager connmgr=new ConnectionManager();
Connection conn=connmgr.getConnection();
		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();
		log.info("{call FINAL_REPORT_UPDATE_SP('"+request.getParameter("reptype")+"','0','"+df.formatdate(request.getParameter("dt2"))+"','"+df.formatdate(request.getParameter("dt1"))+"','"+df.formatdate(request.getParameter("dt2"))+"','"+request.getParameter("curr")+"')}");
		
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
public String BLS0102chckmodified() {

	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	HttpSession session = request.getSession();
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	if(request.getParameter("type").equals("chkuser")) {
		sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM BLS0102_MOD_TABLE ");
	}else {
		//sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM BLS0102_MOD_TABLE WHERE REPORT_DATE='"+NullCheck.isNotNull(df.formatdate(request.getParameter("repdate")))+"'");
		sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM BLS0102_MOD_TABLE ");

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

public String modBLS0102cancel() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	sql.append("DELETE FROM BLS0102_MOD_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"' and CUST_ID='"+NullCheck.isNotNull(request.getParameter("cusid"))+"'");
	
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




public ArrayList<XBRLBLS0102Bean> BLS0102verify(){
	
	ArrayList<XBRLBLS0102Bean> arl = new ArrayList<XBRLBLS0102Bean>();
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	sql.append("SELECT /* +FIRST_ROWS(100) */to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,CUST_ID,CUST_NAME,CUST_GRP,CUST_GRP,CUST_SUB_GRP,ISIC_CODE,UNIQ_ID,EXPOSURE_TYPE,BALANCE_AMT_AC,CRNCY_CODE,DECODE(DEL_FLG,'A','Added','M','Modified','D','Deleted') as DEL_FLG ,LCHG_USER_ID FROM BLS0102_MOD_TABLE");
	log.info("Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		XBRLBLS0102Bean xb=new XBRLBLS0102Bean();

		xb.setRepdat(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
		xb.setCusid(NullCheck.isNotNull(rs.getString("CUST_ID")));
		xb.setCusnam(NullCheck.isNotNull(rs.getString("CUST_NAME")));
		xb.setCusgrp(NullCheck.isNotNull(rs.getString("CUST_GRP")));
		xb.setCussugrp(NullCheck.isNotNull(rs.getString("CUST_SUB_GRP")));
		xb.setIsiccod(NullCheck.isNotNull(rs.getString("ISIC_CODE")));
		xb.setUnicod(NullCheck.isNotNull(rs.getString("UNIQ_ID")));
		xb.setExsutyp(NullCheck.isNotNull(rs.getString("EXPOSURE_TYPE")));
		xb.setBalamtac(NullCheck.isNotNull(rs.getString("BALANCE_AMT_AC")));
		xb.setCurcod(NullCheck.isNotNull(rs.getString("CRNCY_CODE")));
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

public String BLS0102verifymaster() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	HttpSession session = request.getSession();
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();	
	
	//------------------get data from mod table---------------------
	XBRLBLS0102Bean xb=new XBRLBLS0102Bean();
	
	log.info("inside dao");
	sql.setLength(0);
	sql.append("SELECT /* +FIRST_ROWS(100) */to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,CUST_ID,CUST_NAME,CUST_GRP,CUST_SUB_GRP,ISIC_CODE,UNIQ_ID,EXPOSURE_TYPE,BALANCE_AMT_AC,CRNCY_CODE,DEL_FLG,LCHG_USER_ID FROM BLS0102_MOD_TABLE "
			+ "WHERE CUST_ID='"+NullCheck.isNotNull(request.getParameter("cusid"))+"' AND REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"' ");
	log.info("Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		
	 	xb.setRepdat(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
		xb.setCusid(NullCheck.isNotNull(rs.getString("CUST_ID")));
		xb.setCusnam(NullCheck.isNotNull(rs.getString("CUST_NAME")));
		xb.setCusgrp(NullCheck.isNotNull(rs.getString("CUST_GRP")));
		xb.setCussugrp(NullCheck.isNotNull(rs.getString("CUST_SUB_GRP")));
		xb.setIsiccod(NullCheck.isNotNull(rs.getString("ISIC_CODE")));
		xb.setUnicod(NullCheck.isNotNull(rs.getString("UNIQ_ID")));
		xb.setExsutyp(NullCheck.isNotNull(rs.getString("EXPOSURE_TYPE")));
		xb.setBalamtac(NullCheck.isNotNull(rs.getString("BALANCE_AMT_AC")));
		xb.setCurcod(NullCheck.isNotNull(rs.getString("CRNCY_CODE")));
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
				" INSERT INTO BLS0102_MAST_TABLE(REPORT_DATE,CUST_ID,CUST_NAME,CUST_GRP,CUST_SUB_GRP,ISIC_CODE,UNIQ_ID,EXPOSURE_TYPE,BALANCE_AMT_AC,CRNCY_CODE,DEL_FLG,LCHG_USER_ID,LCHG_TIME,VERIFY_USER_ID,VERIFY_TIME)" + "VALUES ('"
						+df.formatdate(request.getParameter("date")) + "','"
						+ request.getParameter("cusid") + "','" + request.getParameter("cusnam") + "','"
						+ request.getParameter("cusgrp") + "','" + request.getParameter("cussugrp") + "','"
						+ request.getParameter("isiccod") + "','" + request.getParameter("unicod") + "','"
						+ request.getParameter("exsutyp") + "','" + request.getParameter("balamtac") + "','"
						+ request.getParameter("curcod") + "','"+xb.getModtyp()+"','"
						+ session.getAttribute("userName")+"',SYSDATE,'"+ session.getAttribute("userName")+"',SYSDATE)");
				
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("DELETE FROM BLS0102_MOD_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"' and CUST_ID='"+NullCheck.isNotNull(request.getParameter("cusid"))+"'");
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
		sql.append("UPDATE BLS0102_MAST_TABLE SET CUST_ID='"+NullCheck.isNotNull(request.getParameter("cusid"))+"',CUST_NAME='"+NullCheck.isNotNull(request.getParameter("cusnam"))+"',CUST_GRP='"+NullCheck.isNotNull(request.getParameter("cusgrp"))+"',CUST_SUB_GRP='"+NullCheck.isNotNull(request.getParameter("cussugrp"))+"',ISIC_CODE='"+NullCheck.isNotNull(request.getParameter("isiccod"))+"',UNIQ_ID='"+NullCheck.isNotNull(request.getParameter("unicod"))+"',EXPOSURE_TYPE='"+NullCheck.isNotNull(request.getParameter("exsutyp"))+"',BALANCE_AMT_AC='"+NullCheck.isNotNull(request.getParameter("balamtac"))+"',CRNCY_CODE='"+NullCheck.isNotNull(request.getParameter("curcod"))+"',REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"',VERIFY_USER_ID='"+session.getAttribute("userName")+"',VERIFY_TIME=SYSDATE WHERE CUST_ID='"+NullCheck.isNotNull(request.getParameter("cusid"))+"' AND REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"'");
		
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("DELETE FROM BLS0102_MOD_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"' and CUST_ID='"+NullCheck.isNotNull(request.getParameter("cusid"))+"'");
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
		sql.append("DELETE FROM BLS0102_MAST_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"' and CUST_ID='"+NullCheck.isNotNull(request.getParameter("cusid"))+"'");
		
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("UPDATE BLS0102_MOD_TABLE SET LCHG_USER_ID='"+session.getAttribute("userName")+"' WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"' and CUST_ID='"+NullCheck.isNotNull(request.getParameter("cusid"))+"'");
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
		    sql.append("DELETE FROM BLS0102_MOD_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"' and CUST_ID='"+NullCheck.isNotNull(request.getParameter("cusid"))+"'");
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