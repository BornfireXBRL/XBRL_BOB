package dao;


import java.sql.CallableStatement;

/****************************************************************************************************************
*																												*
* 	* @companyName 			:	Bonfire Innovation Private Limited Chennai										*
* 	* @project 				:	Extensible Business Reporting Language (XBRL)									*
* 	* @name 				:	XBRLBLS0103Action.java															*
* 	* @path 				:	action																			*
* 	* @author 				:	D PraveenBabu																	*
* 	* @version 				: 	1.0																				*
* 	* @functionality 		:	It contains the action with multiple methods to create SUP01400 Report.													*
* 	* @relatedScripts 		: 	bean.XBRLBLS100Bean.java,dao.XBRLBLS0103Dao.java 								*
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
import bean.XBRLBLS0103Bean;
import bean.XBRLBLS0103Bean;
import bean.XBRLBLS0103Bean;
import bean.XBRLBLS0102Bean;
import bean.XBRLBLS0103Bean;
import bean.XBRLBLS0103Bean;
import bean.XBRLBLS0103Bean;
import bean.XBRLBLS0103Bean;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRLBLS0103Dao {
	
	static Logger log = Logger.getLogger(XBRLBLS0103Dao.class);
	public String cnt;
	public int cnt1;
	public int getCnt1() {
		return cnt1;
	}

	public void setCnt1(int cnt1) {
		this.cnt1 = cnt1;
	}



	public String resalert;

	

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

	public String getReporef() {
		return Reporef;
	}

	public void setReporef(String reporef) {
		Reporef = reporef;
	}
	

	
	public String Reporef;
	public ArrayList<XBRLBLS0103Dao> ReporefSeq(String dt1, String dt2) {

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

		ArrayList<XBRLBLS0103Dao> arl = new ArrayList<XBRLBLS0103Dao>();
		sql.append("select REPORT_REF_NO from BLS0103_MOD_TABLE where REPORT_DATE='" + dt2 + "' ORDER BY REPORT_REF_NO");

		log.info("SELECTPROFILE" + sql.toString());

		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLBLS0103Dao xel = new XBRLBLS0103Dao();
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

	
public ArrayList<XBRLBLS0103Bean> xbrlBLS0103(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
		
		log.info("inside the section dao method");
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLBLS0103Bean> arl = new ArrayList<XBRLBLS0103Bean>();
		
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
		
				
			//sql.append("SELECT * FROM TABLE(BLS0103_S1_RPT_FUN('BLS0103','0','31-MAR-2018','01-MAR-2018','31-MAR-2018','MUR'))");
				
			sql.append("SELECT COUNT_PRTY_SL_NO,CUST_NAME,UNIQ_ID from table(BLS0103_S1_RPT_FUN('BLS0103','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
				
				
			log.info("sec1 "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				XBRLBLS0103Bean xb=new XBRLBLS0103Bean();
				
			
			xb.setCountno(NullCheck.isNotNull(rs.getString("COUNT_PRTY_SL_NO")));
				xb.setNamentity(NullCheck.isNotNull(rs.getString("CUST_NAME")));
				xb.setUniidenentity(NullCheck.isNotNull(rs.getString("UNIQ_ID")));
				
		
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
	
public ArrayList<XBRLBLS0103Bean> xbrlBLS0103s2(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {

	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLBLS0103Bean> arl = new ArrayList<XBRLBLS0103Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	
	try {
	
		sql.append("SELECT /* +FIRST_ROWS(110) */ DYNAMIC_DOMAIN,TRAN_SL_NO,COUNT_PRTY_SL_NO,CUST_NAME,ISIC_CODE,UNIQ_ID, INVEST_TYPE,INVEST_INSTRMNT_TYPE,CLASS_OF_SHARES,QUAL_FOR_DEDUCTION,CNTRY_NAME,to_char(ACQUISITION_DATE,'DD-MM-YYYY')ACQUISITION_DATE,to_char(MATURITY_DATE,'DD-MM-YYYY')MATURITY_DATE,CRNCY_CODE,to_char(NOMINAL_VALUE, '9,999,999,999,990.99')NOMINAL_VALUE,to_char(TRADING_BOOK_COST, '9,999,999,999,990.99')TRADING_BOOK_COST,to_char(BANKING_BOOK_COST, '9,999,999,999,990.99')BANKING_BOOK_COST,SHARE_PCNT,to_char(DATE_REG_APPR,'DD-MM-YYYY')DATE_REG_APPR,to_char(INVST_VALUE_DISPOSED, '9,999,999,999,990.99')INVST_VALUE_DISPOSED FROM TABLE(BLS0103_S2_RPT_FUN('BLS0103','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");	
	
		log.info("sec2"+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLBLS0103Bean xb=new XBRLBLS0103Bean();
			xb.setDydom(NullCheck.isNotNull(rs.getString("DYNAMIC_DOMAIN")));
			xb.setTrno(NullCheck.isNotNull(rs.getString("TRAN_SL_NO")));
			xb.setCouno(NullCheck.isNotNull(rs.getString("COUNT_PRTY_SL_NO")));
			xb.setNamenti(NullCheck.isNotNull(rs.getString("CUST_NAME")));
			xb.setUident(NullCheck.isNotNull(rs.getString("UNIQ_ID")));
			xb.setIsiccode(NullCheck.isNotNull(rs.getString("ISIC_CODE")));
			xb.setTypinvesdispo(NullCheck.isNotNull(rs.getString("INVEST_TYPE")));
			xb.setTypinvesinst(NullCheck.isNotNull(rs.getString("INVEST_INSTRMNT_TYPE")));
			xb.setClashar(NullCheck.isNotNull(rs.getString("CLASS_OF_SHARES")));
			xb.setQualded(NullCheck.isNotNull(rs.getString("QUAL_FOR_DEDUCTION")));
			xb.setCountryname(NullCheck.isNotNull(rs.getString("CNTRY_NAME")));
			xb.setDoacq(NullCheck.isNotNull(rs.getString("ACQUISITION_DATE")));
			xb.setMatdate(NullCheck.isNotNull(rs.getString("MATURITY_DATE")));
			xb.setCur(NullCheck.isNotNull(rs.getString("CRNCY_CODE")));
			xb.setNomval(NullCheck.isNotNull(rs.getString("NOMINAL_VALUE")));
			xb.setTrabook(NullCheck.isNotNull(rs.getString("TRADING_BOOK_COST")));
			xb.setBankbook(NullCheck.isNotNull(rs.getString("BANKING_BOOK_COST")));
			xb.setPershare(NullCheck.isNotNull(rs.getString("SHARE_PCNT")));
			xb.setDatreguappr(NullCheck.isNotNull(rs.getString("DATE_REG_APPR")));
			xb.setValinvesdispo(NullCheck.isNotNull(rs.getString("INVST_VALUE_DISPOSED")));
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



public ArrayList<XBRLBLS0103Bean> xbrlBLS0103ajaxdetails(String repname,String ReporefSeq,String instno,String dt2,String curr) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("repname    " + repname + "reprefno   "  + ReporefSeq + "instno"+ instno +"dt2   " + dt2 +"currency" +curr);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLBLS0103Bean> arl = new ArrayList<XBRLBLS0103Bean>();
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
		
		
			sql.append("SELECT /* +FIRST_ROWS(110) */ CUST_ID,CUST_NAME,ISIC_CODE,UNIQ_ID, INVEST_TYPE,INVEST_INSTRMNT_TYPE,CLASS_OF_SHARES,QUAL_FOR_DEDUCTION,CNTRY_NAME,to_char(ACQUISITION_DATE,'DD-MM-YYYY')ACQUISITION_DATE,to_char(MATURITY_DATE,'DD-MM-YYYY')MATURITY_DATE,CRNCY_CODE,to_char(NOMINAL_VALUE, '9,999,999,999,990.99')NOMINAL_VALUE,to_char(TRADING_BOOK_COST, '9,999,999,999,990.99')TRADING_BOOK_COST,to_char(BANKING_BOOK_COST, '9,999,999,999,990.99')BANKING_BOOK_COST,SHARE_PCNT,to_char(DATE_REG_APPR,'DD-MM-YYYY')DATE_REG_APPR,to_char(INVST_VALUE_DISPOSED, '9,999,999,999,990.99')INVST_VALUE_DISPOSED,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE FROM TABLE(BLS0103_DTL_FUN('BLS0103','"+ReporefSeq+"','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");	

			
			log.info("det1"+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				//log.info("whileee");
								
				 
				XBRLBLS0103Bean xb=new XBRLBLS0103Bean();
				
				
				xb.setCusid(NullCheck.isNotNull(rs.getString("CUST_ID")));
				xb.setCusnam(NullCheck.isNotNull(rs.getString("CUST_NAME")));
				xb.setUniqid(NullCheck.isNotNull(rs.getString("UNIQ_ID")));
				xb.setIsiccod(NullCheck.isNotNull(rs.getString("ISIC_CODE")));
				xb.setInvestyp(NullCheck.isNotNull(rs.getString("INVEST_TYPE")));
				xb.setInvesintrutyp(NullCheck.isNotNull(rs.getString("INVEST_INSTRMNT_TYPE")));
				xb.setClsshr(NullCheck.isNotNull(rs.getString("CLASS_OF_SHARES")));
				xb.setQuaedu(NullCheck.isNotNull(rs.getString("QUAL_FOR_DEDUCTION")));
				xb.setCounam(NullCheck.isNotNull(rs.getString("CNTRY_NAME")));
				xb.setAcqudat(NullCheck.isNotNull(rs.getString("ACQUISITION_DATE")));
				xb.setMatudat(NullCheck.isNotNull(rs.getString("MATURITY_DATE")));
				xb.setCurrcod(NullCheck.isNotNull(rs.getString("CRNCY_CODE")));
				xb.setNomival(NullCheck.isNotNull(rs.getString("NOMINAL_VALUE")));
				xb.setTradcos(NullCheck.isNotNull(rs.getString("TRADING_BOOK_COST")));
				xb.setBankcos(NullCheck.isNotNull(rs.getString("BANKING_BOOK_COST")));
				xb.setSharpc(NullCheck.isNotNull(rs.getString("SHARE_PCNT")));
				xb.setPagregap(NullCheck.isNotNull(rs.getString("DATE_REG_APPR")));
				xb.setInvesdip(NullCheck.isNotNull(rs.getString("INVST_VALUE_DISPOSED")));
				xb.setRedat(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
	
				

					
				

			
			
				
		
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


public String detailBLS0103saves() {

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
public ArrayList<XBRLBLS0103Bean> xbrlbls4RR(String dt1,String dt2,String reprefno,String instno,String curr) {
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLBLS0103Bean> arl = new ArrayList<XBRLBLS0103Bean>();
	NullCheck chk=new NullCheck();
	
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();
	
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	//sql.append("SELECT * FROM TABLE(BLS0103_DTL_FUN('BLS0103','0','0','31-AUG-2018','01-AUG-2018','31-AUG-2018','MUR'))");
		
	sql.append("SELECT /* +FIRST_ROWS(110) */ CUST_ID,CUST_NAME,ISIC_CODE,UNIQ_ID, INVEST_TYPE,INVEST_INSTRMNT_TYPE,CLASS_OF_SHARES,QUAL_FOR_DEDUCTION,CNTRY_NAME,to_char(ACQUISITION_DATE,'DD-MM-YYYY')ACQUISITION_DATE,to_char(MATURITY_DATE,'DD-MM-YYYY')MATURITY_DATE,CRNCY_CODE,to_char(NOMINAL_VALUE, '9,999,999,999,990.99')NOMINAL_VALUE,to_char(TRADING_BOOK_COST, '9,999,999,999,990.99')TRADING_BOOK_COST,to_char(BANKING_BOOK_COST, '9,999,999,999,990.99')BANKING_BOOK_COST,SHARE_PCNT,to_char(DATE_REG_APPR,'DD-MM-YYYY')DATE_REG_APPR,to_char(INVST_VALUE_DISPOSED, '9,999,999,999,990.99')INVST_VALUE_DISPOSED,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE FROM TABLE(BLS0103_DTL_FUN('BLS0103','0','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");		log.info("DOC&&&&SELECT"+sql.toString());
	log.info("DOC&&&&SELECT Gayu"+sql.toString());
	
	try {
		
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		
		XBRLBLS0103Bean xb=new XBRLBLS0103Bean();
		xb.setCusid(NullCheck.isNotNull(rs.getString("CUST_ID")));
		xb.setCusnam(NullCheck.isNotNull(rs.getString("CUST_NAME")));
		xb.setUniqid(NullCheck.isNotNull(rs.getString("UNIQ_ID")));
		xb.setIsiccod(NullCheck.isNotNull(rs.getString("ISIC_CODE")));
		xb.setInvestyp(NullCheck.isNotNull(rs.getString("INVEST_TYPE")));
		xb.setInvesintrutyp(NullCheck.isNotNull(rs.getString("INVEST_INSTRMNT_TYPE")));
		xb.setClsshr(NullCheck.isNotNull(rs.getString("CLASS_OF_SHARES")));
		xb.setQuaedu(NullCheck.isNotNull(rs.getString("QUAL_FOR_DEDUCTION")));
		xb.setCounam(NullCheck.isNotNull(rs.getString("CNTRY_NAME")));
		xb.setAcqudat(NullCheck.isNotNull(rs.getString("ACQUISITION_DATE")));
		xb.setMatudat(NullCheck.isNotNull(rs.getString("MATURITY_DATE")));
		xb.setCurrcod(NullCheck.isNotNull(rs.getString("CRNCY_CODE")));
		xb.setNomival(NullCheck.isNotNull(rs.getString("NOMINAL_VALUE")));
		xb.setTradcos(NullCheck.isNotNull(rs.getString("TRADING_BOOK_COST")));
		xb.setBankcos(NullCheck.isNotNull(rs.getString("BANKING_BOOK_COST")));
		xb.setSharpc(NullCheck.isNotNull(rs.getString("SHARE_PCNT")));
		xb.setPagregap(NullCheck.isNotNull(rs.getString("DATE_REG_APPR")));
		xb.setInvesdip(NullCheck.isNotNull(rs.getString("INVST_VALUE_DISPOSED")));
		xb.setRedat(NullCheck.isNotNull(rs.getString("REPORT_DATE")));

		
		
	
		
		
		
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



public String BLS0103chckmodified() {

HttpServletRequest request = ServletActionContext.getRequest();
ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();
PreparedStatement ps = null;
HttpSession session = request.getSession();
StringBuffer sql = new StringBuffer();
DateFormat df=new DateFormat();		
sql.setLength(0);
if(request.getParameter("type").equals("chkuser")) {
	sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM BLS0103_MOD_TABLE ");
}else {
	sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM BLS0103_MOD_TABLE ");
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


public String modBLS0103cancel() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	sql.append("DELETE FROM BLS0103_MOD_TABLE WHERE  CUST_ID='"+NullCheck.isNotNull(request.getParameter("cusid"))+"' ");
	
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


public ArrayList<XBRLBLS0103Bean> BLS0103verify(){
	
	ArrayList<XBRLBLS0103Bean> arl = new ArrayList<XBRLBLS0103Bean>();
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	sql.append("SELECT /* +FIRST_ROWS(100) */ CUST_ID,CUST_NAME,ISIC_CODE,UNIQ_ID, INVEST_TYPE,INVEST_INSTRMNT_TYPE,CLASS_OF_SHARES,QUAL_FOR_DEDUCTION,CNTRY_NAME,to_char(ACQUISITION_DATE,'DD-MM-YYYY')ACQUISITION_DATE,to_char(MATURITY_DATE,'DD-MM-YYYY')MATURITY_DATE,CRNCY_CODE,to_char(NOMINAL_VALUE, '9,999,999,999,990.99')NOMINAL_VALUE,to_char(TRADING_BOOK_COST, '9,999,999,999,990.99')TRADING_BOOK_COST,to_char(BANKING_BOOK_COST, '9,999,999,999,990.99')BANKING_BOOK_COST,SHARE_PCNT,to_char(DATE_REG_APPR,'DD-MM-YYYY')DATE_REG_APPR,to_char(INVST_VALUE_DISPOSED, '9,999,999,999,990.99')INVST_VALUE_DISPOSED,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE ,DECODE(DEL_FLG,'A','Added','M','Modified','D','Deleted') as DEL_FLG,LCHG_USER_ID FROM BLS0103_MOD_TABLE ");
	log.info("Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		
		XBRLBLS0103Bean xb=new XBRLBLS0103Bean();
		
		xb.setCusid(NullCheck.isNotNull(rs.getString("CUST_ID")));
		xb.setCusnam(NullCheck.isNotNull(rs.getString("CUST_NAME")));
		xb.setUniqid(NullCheck.isNotNull(rs.getString("UNIQ_ID")));
		xb.setIsiccod(NullCheck.isNotNull(rs.getString("ISIC_CODE")));
		xb.setInvestyp(NullCheck.isNotNull(rs.getString("INVEST_TYPE")));
		xb.setInvesintrutyp(NullCheck.isNotNull(rs.getString("INVEST_INSTRMNT_TYPE")));
		xb.setClsshr(NullCheck.isNotNull(rs.getString("CLASS_OF_SHARES")));
		xb.setQuaedu(NullCheck.isNotNull(rs.getString("QUAL_FOR_DEDUCTION")));
		xb.setCounam(NullCheck.isNotNull(rs.getString("CNTRY_NAME")));
		xb.setAcqudat(NullCheck.isNotNull(rs.getString("ACQUISITION_DATE")));
		xb.setMatudat(NullCheck.isNotNull(rs.getString("MATURITY_DATE")));
		xb.setCurrcod(NullCheck.isNotNull(rs.getString("CRNCY_CODE")));
		xb.setNomival(NullCheck.isNotNull(rs.getString("NOMINAL_VALUE")));
		xb.setTradcos(NullCheck.isNotNull(rs.getString("TRADING_BOOK_COST")));
		xb.setBankcos(NullCheck.isNotNull(rs.getString("BANKING_BOOK_COST")));
		xb.setSharpc(NullCheck.isNotNull(rs.getString("SHARE_PCNT")));
		xb.setPagregap(NullCheck.isNotNull(rs.getString("DATE_REG_APPR")));
		xb.setInvesdip(NullCheck.isNotNull(rs.getString("INVST_VALUE_DISPOSED")));
		xb.setRedat(NullCheck.isNotNull(rs.getString("REPORT_DATE")));

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
	} return arl;	
}


public String BLS0103verifymaster() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	HttpSession session = request.getSession();
	StringBuffer sql = new StringBuffer();
	DateFormat df1=new DateFormat();		
	
	//------------------get data from mod table---------------------
	XBRLBLS0103Bean xb=new XBRLBLS0103Bean();
	
	sql.setLength(0);
	sql.append("SELECT /* +FIRST_ROWS(100) */ CUST_ID,CUST_NAME,ISIC_CODE,UNIQ_ID, INVEST_TYPE,INVEST_INSTRMNT_TYPE,CLASS_OF_SHARES,QUAL_FOR_DEDUCTION,CNTRY_NAME,to_char(ACQUISITION_DATE,'DD-MM-YYYY')ACQUISITION_DATE,to_char(MATURITY_DATE,'DD-MM-YYYY')MATURITY_DATE,CRNCY_CODE,to_char(NOMINAL_VALUE, '9,999,999,999,990.99')NOMINAL_VALUE,to_char(TRADING_BOOK_COST, '9,999,999,999,990.99')TRADING_BOOK_COST,to_char(BANKING_BOOK_COST, '9,999,999,999,990.99')BANKING_BOOK_COST,SHARE_PCNT,to_char(DATE_REG_APPR,'DD-MM-YYYY')DATE_REG_APPR,to_char(INVST_VALUE_DISPOSED, '9,999,999,999,990.99')INVST_VALUE_DISPOSED,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,DEL_FLG,LCHG_USER_ID FROM BLS0103_MOD_TABLE "
			+ "WHERE CUST_ID='"+NullCheck.isNotNull(request.getParameter("cusid"))+"' ");
	log.info("Gayu"+sql.toString());
	try {
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			
			xb.setCusid(NullCheck.isNotNull(rs.getString("CUST_ID")));
			xb.setCusnam(NullCheck.isNotNull(rs.getString("CUST_NAME")));
			xb.setUniqid(NullCheck.isNotNull(rs.getString("UNIQ_ID")));
			xb.setIsiccod(NullCheck.isNotNull(rs.getString("ISIC_CODE")));
			xb.setInvestyp(NullCheck.isNotNull(rs.getString("INVEST_TYPE")));
			xb.setInvesintrutyp(NullCheck.isNotNull(rs.getString("INVEST_INSTRMNT_TYPE")));
			xb.setClsshr(NullCheck.isNotNull(rs.getString("CLASS_OF_SHARES")));
			xb.setQuaedu(NullCheck.isNotNull(rs.getString("QUAL_FOR_DEDUCTION")));
			xb.setCounam(NullCheck.isNotNull(rs.getString("CNTRY_NAME")));
			xb.setAcqudat(NullCheck.isNotNull(rs.getString("ACQUISITION_DATE")));
			xb.setMatudat(NullCheck.isNotNull(rs.getString("MATURITY_DATE")));
			xb.setCurrcod(NullCheck.isNotNull(rs.getString("CRNCY_CODE")));
			xb.setNomival(NullCheck.isNotNull(rs.getString("NOMINAL_VALUE")));
			xb.setTradcos(NullCheck.isNotNull(rs.getString("TRADING_BOOK_COST")));
			xb.setBankcos(NullCheck.isNotNull(rs.getString("BANKING_BOOK_COST")));
			xb.setSharpc(NullCheck.isNotNull(rs.getString("SHARE_PCNT")));
			xb.setPagregap(NullCheck.isNotNull(rs.getString("DATE_REG_APPR")));
			xb.setInvesdip(NullCheck.isNotNull(rs.getString("INVST_VALUE_DISPOSED")));
			xb.setRedat(NullCheck.isNotNull(rs.getString("REPORT_DATE")));

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
		"INSERT INTO BLS0103_MAST_TABLE(REPORT_DATE,CUST_ID,CUST_NAME,UNIQ_ID,ISIC_CODE, INVEST_TYPE,INVEST_INSTRMNT_TYPE,CLASS_OF_SHARES,QUAL_FOR_DEDUCTION,CNTRY_NAME,ACQUISITION_DATE,MATURITY_DATE,CRNCY_CODE,NOMINAL_VALUE,TRADING_BOOK_COST,BANKING_BOOK_COST,SHARE_PCNT,DATE_REG_APPR,INVST_VALUE_DISPOSED,LCHG_USER_ID,LCHG_TIME)" + "VALUES ('"
								+ df1.formatdate(request.getParameter("redat")) + "','"+ request.getParameter("cusid") 
								+ "','" + request.getParameter("cusnam") + "','" + request.getParameter("uniqid") + "','"
								+ request.getParameter("isiccod") + "','"+ request.getParameter("investyp") 
								+ "','" + request.getParameter("invesintrutyp") + "','" + request.getParameter("clsshr") 
								+ "','" + request.getParameter("quaedu") + "','" + request.getParameter("counam") 
								+ "','" +df1.formatdate( request.getParameter("acqudat"))+ "','" + df1.formatdate(request.getParameter("matudat")) 
								+ "','" + request.getParameter("currcod") + "','" + request.getParameter("nomival") 
								+ "','" + request.getParameter("tradcos") + "','" + request.getParameter("bankcos")
								+ "','" + NullCheck.isNotZero(request.getParameter("sharpc")) + "','" + df1.formatdate(request.getParameter("pagregap")) + "','"+ request.getParameter("invesdip") + "','"
								+ session.getAttribute("userName")+"',SYSDATE)");
try {
	log.info(sql.toString());
	ps=conn.prepareStatement(sql.toString());
	
    int rs=0;
    rs=ps.executeUpdate();
     
    status="success";
    
    sql.setLength(0);
    sql.append("DELETE FROM BLS0103_MOD_TABLE WHERE CUST_ID='"+NullCheck.isNotNull(request.getParameter("cusid"))+"'");
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
sql.append("UPDATE BLS0103_MAST_TABLE SET CUST_ID='"+NullCheck.isNotNull(request.getParameter("cusid"))+"',CUST_NAME='"+NullCheck.isNotNull(request.getParameter("cusnam"))+"',UNIQ_ID='"+NullCheck.isNotNull(request.getParameter("uniqid"))+"',ISIC_CODE='"+NullCheck.isNotNull(request.getParameter("isiccod"))+"',INVEST_TYPE='"+NullCheck.isNotNull(request.getParameter("investyp"))+"',INVEST_INSTRMNT_TYPE='"+NullCheck.isNotNull(request.getParameter("invesintrutyp"))+"',CLASS_OF_SHARES='"+request.getParameter("clsshr")+"',QUAL_FOR_DEDUCTION='"+request.getParameter("quaedu")+"',CNTRY_NAME='"+request.getParameter("counam")+"',ACQUISITION_DATE='"+df1.formatdate(request.getParameter("acqudat"))+"',MATURITY_DATE='"+df1.formatdate(request.getParameter("matudat"))+"',CRNCY_CODE='"+request.getParameter("currcod")+"',NOMINAL_VALUE='"+request.getParameter("nomival")+"',TRADING_BOOK_COST='"+request.getParameter("tradcos")+"',BANKING_BOOK_COST='"+request.getParameter("bankcos")+"',SHARE_PCNT='"+request.getParameter("sharpc")+"',DATE_REG_APPR='"+df1.formatdate(request.getParameter("pagregap"))+"',INVST_VALUE_DISPOSED='"+request.getParameter("invesdip")+"',REPORT_DATE='"+df1.formatdate(request.getParameter("redat"))+"' ,DEL_FLG='"+xb.getModtyp()+"',LCHG_USER_ID='"+session.getAttribute("entryuser")+"',VERIFY_TIME=SYSDATE WHERE CUST_ID='"+NullCheck.isNotNull(request.getParameter("cusid"))+"'");

try {
	log.info(sql.toString());
	ps=conn.prepareStatement(sql.toString());
	
    int rs=0;
    rs=ps.executeUpdate();
     
    status="success";
    
    sql.setLength(0);
    sql.append("DELETE FROM BLS0103_MOD_TABLE WHERE CUST_ID='"+NullCheck.isNotNull(request.getParameter("cusid"))+"'");
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
	sql.append("DELETE FROM BLS0103_MOD_TABLE WHERE CUST_ID='"+NullCheck.isNotNull(request.getParameter("cusid"))+"'");
	
	try {
		log.info(sql.toString());
		ps=conn.prepareStatement(sql.toString());
		
	    int rs=0;
	    rs=ps.executeUpdate();
	     
	    status="success";
	    
	    sql.setLength(0);
	    sql.append("UPDATE BLS0103_MAST_TABLE SET CUST_ID='"+NullCheck.isNotNull(request.getParameter("cusid"))+"',CUST_NAME='"+NullCheck.isNotNull(request.getParameter("cusnam"))+"',UNIQ_ID='"+NullCheck.isNotNull(request.getParameter("uniqid"))+"',ISIC_CODE='"+NullCheck.isNotNull(request.getParameter("isiccod"))+"',INVEST_TYPE='"+NullCheck.isNotNull(request.getParameter("investyp"))+"',INVEST_INSTRMNT_TYPE='"+NullCheck.isNotNull(request.getParameter("invesintrutyp"))+"',CLASS_OF_SHARES='"+request.getParameter("clsshr")+"',QUAL_FOR_DEDUCTION='"+request.getParameter("quaedu")+"',CNTRY_NAME='"+request.getParameter("counam")+"',ACQUISITION_DATE='"+df1.formatdate(request.getParameter("acqudat"))+"',MATURITY_DATE='"+df1.formatdate(request.getParameter("matudat"))+"',CRNCY_CODE='"+request.getParameter("currcod")+"',NOMINAL_VALUE='"+request.getParameter("nomival")+"',TRADING_BOOK_COST='"+request.getParameter("tradcos")+"',BANKING_BOOK_COST='"+request.getParameter("bankcos")+"',SHARE_PCNT='"+request.getParameter("sharpc")+"',DATE_REG_APPR='"+df1.formatdate(request.getParameter("pagregap"))+"',INVST_VALUE_DISPOSED='"+request.getParameter("invesdip")+"',REPORT_DATE='"+df1.formatdate(request.getParameter("redat"))+"' ,DEL_FLG='"+request.getParameter("modtyp")+"',LCHG_USER_ID='"+session.getAttribute("entryuser")+"',VERIFY_TIME=SYSDATE WHERE CUST_ID='"+NullCheck.isNotNull(request.getParameter("cusid"))+"'");
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
	    sql.append("DELETE FROM BLS0103_MOD_TABLE WHERE CUST_ID='"+NullCheck.isNotNull(request.getParameter("cusid"))+"'");
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

public String detailBLS0103savecheck() {

	ConnectionManager connmgr=new ConnectionManager();
	Connection conn=connmgr.getConnection();
	ArrayList<String> arl = new ArrayList<String>();
			HttpServletRequest request = ServletActionContext.getRequest();
			DateFormat df = new DateFormat();
			StringBuffer sql = new StringBuffer();
			PreparedStatement ps = null;
			
			sql.append("SELECT COUNT(REPORT_DATE) as repdate FROM BLS0103_S2_RPT_TB where REPORT_ID = '"+request.getParameter("reptype")+"' AND  REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ");
			 System.out.println(sql.toString());
				
				try {
					ps = conn.prepareStatement(sql.toString());
					ResultSet rs = ps.executeQuery();
				

					while (rs.next()) {
						
						cnt1=rs.getInt("repdate");
					
					}
					System.out.println("fdsafdsaf"+cnt1);

					
				
				
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

public static Logger getLog() {
	return log;
}

public static void setLog(Logger log) {
	XBRLBLS0103Dao.log = log;
}






}
