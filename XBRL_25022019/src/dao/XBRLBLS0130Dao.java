package dao;


import java.sql.CallableStatement;

/****************************************************************************************************************
*																												*
* 	* @companyName 			:	Bonfire Innovation Private Limited Chennai										*
* 	* @project 				:	Extensible Business Reporting Language (XBRL)									*
* 	* @name 				:	XBRLBLS0130Action.java															*
* 	* @path 				:	action																			*
* 	* @author 				:	D PraveenBabu																	*
* 	* @version 				: 	1.0																				*
* 	* @functionality 		:	It contains the action with multiple methods to create SUP01400 Report.													*
* 	* @relatedScripts 		: 	bean.XBRLBLS100Bean.java,dao.XBRLBLS0130Dao.java 								*
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
import bean.XBRLBLS0130Bean;
import bean.XBRLBLS0130Bean;
import bean.XBRLBLS0130Bean;
import bean.XBRLBLS0120Bean;
import bean.XBRLBLS0130Bean;
import bean.XBRLBLS0130Bean;
import bean.XBRLBLS0130Bean;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRLBLS0130Dao {
	static Logger log = Logger.getLogger(XBRLBLS0130Dao.class);
	public String resalert;

public String cnt;
	
	public int cnt1;
	
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
	
	public ArrayList<XBRLBLS0130Dao> ReporefSeq(String dt1, String dt2) {

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

		ArrayList<XBRLBLS0130Dao> arl = new ArrayList<XBRLBLS0130Dao>();
		sql.append("select REPORT_REF_NO from BLS0110_MOD_TABLE where REPORT_DATE='" + dt2 + "' ORDER BY REPORT_REF_NO");

		log.info("SELECTPROFILE" + sql.toString());

		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLBLS0130Dao xel = new XBRLBLS0130Dao();
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

	
public ArrayList<XBRLBLS0130Bean> xbrlBLS0130(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
		
		
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLBLS0130Bean> arl = new ArrayList<XBRLBLS0130Bean>();
		
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
				
				sql.append("SELECT SL_NO,NAME_OF_INSTRUMENT,ACCT_CURRENCY,to_char(AMT_FC, '9,999,999,999,990.99')AMT_FC,to_char(AMT_LC, '9,999,999,999,990.99')AMT_LC FROM TABLE(BLS0130_RPT_FUN('"+NullCheck.isNotNull(reptype)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
				
				
			log.info("BLS0130 sec1 "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				XBRLBLS0130Bean xb=new XBRLBLS0130Bean();
				
			
				xb.setSrno(NullCheck.isNotNull(rs.getString("SL_NO")));
				xb.setNameofins(NullCheck.isNotNull(rs.getString("NAME_OF_INSTRUMENT")));
				xb.setCurrency(NullCheck.isNotNull(rs.getString("ACCT_CURRENCY")));
				xb.setFcamt(NullCheck.isNotNull(rs.getString("AMT_FC")));
				xb.setOthacpaymcs(NullCheck.isNotNull(rs.getString("AMT_LC")));
				


					
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
	


public ArrayList<XBRLBLS0130Bean> xbrlBLS0130ajaxdetails(String repname,String reprefno,String instno,String dt2,String curr) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("repname    " + repname + "reprefno   "  + reprefno + "instno"+ instno +"dt2   " + dt2 +"currency" +curr);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLBLS0130Bean> arl = new ArrayList<XBRLBLS0130Bean>();
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
		
		
			
		sql.append("SELECT SL_NO,NAME_OF_INSTRUMENT,ACCT_CURRENCY,to_char(AMT_FC, '9,999,999,999,990.99')AMT_FC FROM TABLE(BLS0130_DTL_FUN('BLS0130','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
			log.info("BLS  Kumar  "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				//log.info("whileee");
								
				 
				XBRLBLS0130Bean xb=new XBRLBLS0130Bean();
				

				xb.setSenum(NullCheck.isNotNull(rs.getString("SL_NO")));
				xb.setNaminst(NullCheck.isNotNull(rs.getString("NAME_OF_INSTRUMENT")));
				xb.setAccur(NullCheck.isNotNull(rs.getString("ACCT_CURRENCY")));
				xb.setAmtfc(NullCheck.isNotNull(rs.getString("AMT_FC")));
				/*xb.setAmtlc(NullCheck.isNotNull(rs.getString("AMT_LC")));*/
				
				

			
			
				
		
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

public String detailBLS0130saves() {

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

public ArrayList<XBRLBLS0130Bean> xbrlbls4RR(String dt1,String dt2,String reprefno,String instno,String curr) {
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLBLS0130Bean> arl = new ArrayList<XBRLBLS0130Bean>();
	NullCheck chk=new NullCheck();
	
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();
	
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	//sql.append("SELECT * FROM TABLE(BLS0130_DTL_FUN('BLS0130','0','0','31-AUG-2018','01-AUG-2018','31-AUG-2018','MUR'))");
		
	sql.append("SELECT SL_NO,NAME_OF_INSTRUMENT,ACCT_CURRENCY,to_char(AMT_FC, '9,999,999,999,990.99')AMT_FC,to_char(AMT_LC, '9,999,999,999,990.99')AMT_LC FROM TABLE(BLS0130_DTL_FUN('BLS0130','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
	log.info("DOC&&&&SELECT"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		
		XBRLBLS0130Bean xb=new XBRLBLS0130Bean();
		
		xb.setSenum(NullCheck.isNotNull(rs.getString("SL_NO")));
		xb.setNaminst(NullCheck.isNotNull(rs.getString("NAME_OF_INSTRUMENT")));
		xb.setAccur(NullCheck.isNotNull(rs.getString("ACCT_CURRENCY")));
		xb.setAmtfc(NullCheck.isNotNull(rs.getString("AMT_FC")));
		xb.setAmtlc(NullCheck.isNotNull(rs.getString("AMT_LC")));
		
		
		
		
		
		
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



public ArrayList<XBRLBLS0130Bean> xbrlblssumEP(String dt1, String dt2, String ReporefSeq, String curr) {

	log.info("PYM SUMMARY List Data AB " + dt1 + "dt22222" + dt2);

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();

	ArrayList<XBRLBLS0130Bean> arl = new ArrayList<XBRLBLS0130Bean>();

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
		// TABLE(BLS0130_RPT_FUN('BLS0130','"+ReporefSeq.trim()+"','31-MAR-2014','31-MAR-2014','31-MAR-2014'))");


		sql.append("SELECT SL_NO,NAME_OF_INSTRUMENT,ACCT_CURRENCY,to_char(AMT_FC, '9,999,999,999,990.99')AMT_FC,to_char(AMT_LC, '9,999,999,999,990.99')AMT_LC FROM TABLE(BLS0130_RPT_FUN('BLS0120','0','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");

		/* xbrl_report_master_tb */

		log.info("PYM SUMMARY " + sql.toString());

		ps = conn.prepareStatement(sql.toString());

		ResultSet rs = ps.executeQuery();

		while (rs.next()) {

			XBRLBLS0130Bean xb = new XBRLBLS0130Bean();

			xb.setSrno(NullCheck.isNotNull(rs.getString("SL_NO")));
			xb.setNameofins(NullCheck.isNotNull(rs.getString("NAME_OF_INSTRUMENT")));
			xb.setCurrency(NullCheck.isNotNull(rs.getString("ACCT_CURRENCY")));
			xb.setFcamt(NullCheck.isNotNull(rs.getString("AMT_FC")));
			xb.setOthacpaymcs(NullCheck.isNotNull(rs.getString("AMT_LC")));

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



public String BLS0130chckmodified() {

HttpServletRequest request = ServletActionContext.getRequest();
ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();
PreparedStatement ps = null;
HttpSession session = request.getSession();
StringBuffer sql = new StringBuffer();
DateFormat df=new DateFormat();		
sql.setLength(0);
if(request.getParameter("type").equals("chkuser")) {
	sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM BLS0110_MOD_TABLE WHERE ASSET_TYPE='MISC_ASSET' ");
}else {
	//sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM BLS0130_MOD_TABLE WHERE REPORT_DATE='"+NullCheck.isNotNull(df.formatdate(request.getParameter("repdate")))+"'");
	sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM BLS0110_MOD_TABLE WHERE ASSET_TYPE='MISC_ASSET' ");

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

public String modBLS0130cancel() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	sql.append("DELETE FROM BLS0110_MOD_TABLE WHERE  INSTRMNT_NAME='"+NullCheck.isNotNull(request.getParameter("naminst"))+"'");
	
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
public ArrayList<XBRLBLS0130Bean> BLS0130verify(){
	
	ArrayList<XBRLBLS0130Bean> arl = new ArrayList<XBRLBLS0130Bean>();
	HttpServletRequest request = ServletActionContext.getRequest();

	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	sql.append("SELECT /* +FIRST_ROWS(100) */TO_CHAR(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,INSTRMNT_NAME,CRNCY_CODE,AMT_IN_AC,DECODE(DEL_FLG,'A','Added','M','Modified','D','Deleted') as DEL_FLG ,LCHG_USER_ID FROM BLS0110_MOD_TABLE WHERE ASSET_TYPE='MISC_ASSET'");
	log.info("Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		XBRLBLS0130Bean xb=new XBRLBLS0130Bean();
		 xb.setRepdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));

		xb.setNaminst(NullCheck.isNotNull(rs.getString("INSTRMNT_NAME")));
		xb.setAccur(NullCheck.isNotNull(rs.getString("CRNCY_CODE")));
		xb.setAmtfc(NullCheck.isNotNull(rs.getString("AMT_IN_AC")));
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

public String BLS0130verifymaster() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	HttpSession session = request.getSession();
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();	
	
	//------------------get data from mod table---------------------
	XBRLBLS0130Bean xb=new XBRLBLS0130Bean();
	
	sql.setLength(0);
	sql.append("SELECT /* +FIRST_ROWS(100) */ASSET_TYPE,INSTRMNT_NAME,CRNCY_CODE,AMT_IN_AC,DEL_FLG,LCHG_USER_ID FROM BLS0110_MOD_TABLE "
			+ "WHERE INSTRMNT_NAME='"+NullCheck.isNotNull(request.getParameter("naminst"))+"'  AND ASSET_TYPE='MISC_ASSET' ");
	log.info("Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		
		xb.setAstyp(NullCheck.isNotNull(rs.getString("ASSET_TYPE")));

		xb.setNaminst(NullCheck.isNotNull(rs.getString("INSTRMNT_NAME")));
		xb.setAccur(NullCheck.isNotNull(rs.getString("CRNCY_CODE")));
		xb.setAmtfc(NullCheck.isNotNull(rs.getString("AMT_IN_AC")));	
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
				" INSERT INTO BLS0110_MAST_TABLE(ASSET_TYPE,INSTRMNT_NAME,CRNCY_CODE,AMT_IN_AC,DEL_FLG,REPORT_DATE,LCHG_USER_ID,LCHG_TIME,VERIFY_USER_ID,VERIFY_TIME)" + "VALUES ('"
						 +request.getParameter("astyp") + "' ,'"+ request.getParameter("naminst")+ "','"
						+ request.getParameter("accur") + "','" + request.getParameter("amtfc") + "','"+xb.getModtyp()+"','" +df.formatdate(request.getParameter("repdate"))+ "','"
						+ session.getAttribute("userName")+"',SYSDATE,'"+ session.getAttribute("userName")+"',SYSDATE)");
				
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("DELETE FROM BLS0110_MOD_TABLE WHERE  INSTRMNT_NAME='"+NullCheck.isNotNull(request.getParameter("naminst"))+"' AND ASSET_TYPE='"+NullCheck.isNotNull(request.getParameter("astyp"))+"'");
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
		sql.append("UPDATE BLS0110_MAST_TABLE SET INSTRMNT_NAME='"+NullCheck.isNotNull(request.getParameter("naminst"))+"',CRNCY_CODE='"+NullCheck.isNotNull(request.getParameter("accur"))+"',AMT_IN_AC='"+NullCheck.isNotNull(request.getParameter("amtfc"))+"',VERIFY_USER_ID='"+session.getAttribute("userName")+"',VERIFY_TIME=SYSDATE WHERE INSTRMNT_NAME='"+NullCheck.isNotNull(request.getParameter("naminst"))+"' AND ASSET_TYPE='"+NullCheck.isNotNull(request.getParameter("astyp"))+"'");
		
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("DELETE FROM BLS0110_MOD_TABLE WHERE  INSTRMNT_NAME='"+NullCheck.isNotNull(request.getParameter("naminst"))+"' AND ASSET_TYPE='"+NullCheck.isNotNull(request.getParameter("astyp"))+"'");
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
		sql.append("DELETE FROM BLS0110_MAST_TABLE WHERE INSTRMNT_NAME='"+NullCheck.isNotNull(request.getParameter("naminst"))+"' AND ASSET_TYPE='"+NullCheck.isNotNull(request.getParameter("astyp"))+"'");
		
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("UPDATE BLS0110_MOD_TABLE SET LCHG_USER_ID='"+session.getAttribute("userName")+"' WHERE  INSTRMNT_NAME='"+NullCheck.isNotNull(request.getParameter("naminst"))+"' AND ASSET_TYPE='"+NullCheck.isNotNull(request.getParameter("astyp"))+"'");
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
		    sql.append("DELETE FROM BLS0110_MOD_TABLE WHERE INSTRMNT_NAME='"+NullCheck.isNotNull(request.getParameter("naminst"))+"' AND ASSET_TYPE='"+NullCheck.isNotNull(request.getParameter("astyp"))+"'");
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

public String detailBLS0130savecheck() {

	ConnectionManager connmgr=new ConnectionManager();
	Connection conn=connmgr.getConnection();
	ArrayList<String> arl = new ArrayList<String>();
			HttpServletRequest request = ServletActionContext.getRequest();
			DateFormat df = new DateFormat();
			StringBuffer sql = new StringBuffer();
			PreparedStatement ps = null;
			
			sql.append("SELECT COUNT(REPORT_DATE) as repdate FROM BLS0130_RPT_TB where  REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ");
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

}


