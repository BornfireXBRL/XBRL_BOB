package dao;

import org.apache.log4j.Logger;
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
* 	* @relatedScripts 		: 	bean.XBRLBLS100Bean.java,dao.XBRLSUP1400Dao.java 								*
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
import bean.XBRLSUP1400Bean;
import utilities.ConnectionManager;
import utilities.NullCheck;

public class XBRLSUP1400Dao {
	
	static Logger log = Logger.getLogger(XBRLSUP1400Dao.class);
	public String Reporef;

	public String getReporef() {
		return Reporef;
	}

	public void setReporef(String reporef) {
		Reporef = reporef;
	}
	
	public ArrayList<XBRLSUP1400Dao> ReporefSeq(String dt1, String dt2) {

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

		ArrayList<XBRLSUP1400Dao> arl = new ArrayList<XBRLSUP1400Dao>();
		sql.append("select REPORT_REF_NO from SUP1400_MOD_TABLE where REPORT_DATE='" + dt2 + "' ORDER BY REPORT_REF_NO");

		log.info("SELECTPROFILE" + sql.toString());

		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLSUP1400Dao xel = new XBRLSUP1400Dao();
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


	
public ArrayList<XBRLSUP1400Bean> xbrlSUP1400(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
		
		
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLSUP1400Bean> arl = new ArrayList<XBRLSUP1400Bean>();
		
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
				
				sql.append("SELECT SL_NO,to_char(COMPLAINT_RCVD_DATE,'DD-MM-YYYY')COMPLAINT_RCVD_DATE,NAME_OF_COMPLAINANT,ADDRESS_OF_COMPLAINANT,COMPLAINT_NATURE,COMPLAINT_NATURE_DET,to_char(RESOLVE_DATE,'DD-MM-YYYY')RESOLVE_DATE,NATURE_OF_RESOLUTION,UNRESOLVED_DET FROM TABLE(SUP1400_RPT_FUN('SUP1400','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
				
				
			log.info("SUP1400 sec1 "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				XBRLSUP1400Bean xb=new XBRLSUP1400Bean();
				
			
				xb.setSrlno(NullCheck.isNotNull(rs.getString("SL_NO")));
				xb.setRcptdate(NullCheck.isNotNull(rs.getString("COMPLAINT_RCVD_DATE")));
				xb.setNamecmplnt(NullCheck.isNotNull(rs.getString("NAME_OF_COMPLAINANT")));
				xb.setAdrscmplnt(NullCheck.isNotNull(rs.getString("ADDRESS_OF_COMPLAINANT")));
				xb.setComnature(NullCheck.isNotNull(rs.getString("COMPLAINT_NATURE")));
				xb.setComnaturedel(NullCheck.isNotNull(rs.getString("COMPLAINT_NATURE_DET")));
				
				xb.setDtcmplntrsld(NullCheck.isNotNull(rs.getString("RESOLVE_DATE")));
				xb.setReslnature(NullCheck.isNotNull(rs.getString("NATURE_OF_RESOLUTION")));
				xb.setDurescmplnt(NullCheck.isNotNull(rs.getString("UNRESOLVED_DET")));

				

					
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
	
public ArrayList<XBRLSUP1400Bean> xbrlSUP1400ajaxdetails(String repname,String ReporefSeq,String instno,String dt2,String curr) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("repname    " + repname + "reprefno   "  + ReporefSeq + "instno"+ instno +"dt2   " + dt2 +"currency" +curr);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLSUP1400Bean> arl = new ArrayList<XBRLSUP1400Bean>();
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
		
		
			
/*		sql.append("SELECT SL_NO,to_char(COMPLAINT_RCVD_DATE,'DD-MM-YYYY')COMPLAINT_RCVD_DATE,NAME_OF_COMPLAINANT,ADDRESS_OF_COMPLAINANT,COMPLAINT_NATURE,COMPLAINT_NATURE_DET,to_char(RESOLVE_DATE,'DD-MM-YYYY')RESOLVE_DATE,NATURE_OF_RESOLUTION,UNRESOLVED_DET FROM TABLE(SUP1400_RPT_FUN('SUP1400','"+chk.notZero(ReporefSeq)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
*/			
			sql.append("SELECT SL_NO,to_char(COMPLAINT_RCVD_DATE,'DD-MM-YYYY')COMPLAINT_RCVD_DATE,NAME_OF_COMPLAINANT,ADDRESS_OF_COMPLAINANT,COMPLAINT_NATURE,COMPLAINT_NATURE_DET,to_char(RESOLVE_DATE,'DD-MM-YYYY')RESOLVE_DATE,NATURE_OF_RESOLUTION,UNRESOLVED_DET FROM TABLE(SUP1400_RPT_FUN('SUP1400','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");

			
			log.info("BLS  Gayu  "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				
								
				 
				XBRLSUP1400Bean xb=new XBRLSUP1400Bean();
				
				
				/*    xb.setCusid(NullCheck.isNotNull(rs.getString("CUST_ID")));
					xb.setCusnam(NullCheck.isNotNull(rs.getString("CUST_NAME")));
					xb.setCusgrp(NullCheck.isNotNull(rs.getString("CUST_GRP")));
					xb.setNatucus(NullCheck.isNotNull(rs.getString("NATURE_OF_CUST")));
					xb.setIsiccod(NullCheck.isNotNull(rs.getString("ISIC_CODE")));
					xb.setUniid(NullCheck.isNotNull(rs.getString("UNIQ_ID")));
					xb.setExpotyp(NullCheck.isNotNull(rs.getString("EXPOSURE_TYPE")));
					xb.setBalamt(NullCheck.isNotNull(rs.getString("BALANCE_AMT_AC")));
					xb.setCurrcod(NullCheck.isNotNull(rs.getString("CRNCY_CODE")));
					xb.setRepodat(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
					*/
				
				xb.setSrlno1(NullCheck.isNotNull(rs.getString("SL_NO")));
				xb.setRcptdate1(NullCheck.isNotNull(rs.getString("COMPLAINT_RCVD_DATE")));
				xb.setNamecmplnt1(NullCheck.isNotNull(rs.getString("NAME_OF_COMPLAINANT")));
				xb.setAdrscmplnt1(NullCheck.isNotNull(rs.getString("ADDRESS_OF_COMPLAINANT")));
				xb.setComnature1(NullCheck.isNotNull(rs.getString("COMPLAINT_NATURE")));
				xb.setComnaturedel1(NullCheck.isNotNull(rs.getString("COMPLAINT_NATURE_DET")));
				
				xb.setDtcmplntrsld1(NullCheck.isNotNull(rs.getString("RESOLVE_DATE")));
				xb.setReslnature1(NullCheck.isNotNull(rs.getString("NATURE_OF_RESOLUTION")));
				xb.setDurescmplnt1(NullCheck.isNotNull(rs.getString("UNRESOLVED_DET")));

			
			 
				
		
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
public ArrayList<XBRLSUP1400Bean> xbrlsup4RR(String reptype,String ReporefSeq,String instno,String dt2,String dt1,String curr)  {
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLSUP1400Bean> arl = new ArrayList<XBRLSUP1400Bean>();
	NullCheck chk=new NullCheck();
	
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();
	
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	//sql.append("SELECT * FROM TABLE(SUP1400_DTL_FUN('SUP1400','0','0','31-AUG-2018','01-AUG-2018','31-AUG-2018','MUR'))");
		
	sql.append("SELECT SL_NO,to_char(COMPLAINT_RCVD_DATE,'DD-MM-YYYY')COMPLAINT_RCVD_DATE,NAME_OF_COMPLAINANT,ADDRESS_OF_COMPLAINANT,COMPLAINT_NATURE,COMPLAINT_NATURE_DET,to_char(RESOLVE_DATE,'DD-MM-YYYY')RESOLVE_DATE,NATURE_OF_RESOLUTION,UNRESOLVED_DET FROM TABLE(SUP1400_RPT_FUN('SUP1400','"+chk.notZero(ReporefSeq)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
 


	
	log.info("DOC&&&&SELECT Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		
		XBRLSUP1400Bean xb=new XBRLSUP1400Bean();
		   
		
		xb.setSrlno1(NullCheck.isNotNull(rs.getString("SL_NO")));
		xb.setRcptdate1(NullCheck.isNotNull(rs.getString("COMPLAINT_RCVD_DATE")));
		xb.setNamecmplnt1(NullCheck.isNotNull(rs.getString("NAME_OF_COMPLAINANT")));
		xb.setAdrscmplnt1(NullCheck.isNotNull(rs.getString("ADDRESS_OF_COMPLAINANT")));
		xb.setComnature1(NullCheck.isNotNull(rs.getString("COMPLAINT_NATURE")));
		xb.setComnaturedel1(NullCheck.isNotNull(rs.getString("COMPLAINT_NATURE_DET")));
		
		xb.setDtcmplntrsld1(NullCheck.isNotNull(rs.getString("RESOLVE_DATE")));
		xb.setReslnature1(NullCheck.isNotNull(rs.getString("NATURE_OF_RESOLUTION")));
		xb.setDurescmplnt1(NullCheck.isNotNull(rs.getString("UNRESOLVED_DET")));

		
		
		
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

public String detailSUP1400saves() {

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


