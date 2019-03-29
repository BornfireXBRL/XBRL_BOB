package dao;


import java.sql.CallableStatement;

/****************************************************************************************************************
*																												*
* 	* @companyName 			:	Bonfire Innovation Private Limited Chennai										*
* 	* @project 				:	Extensible Business Reporting Language (XBRL)									*
* 	* @name 				:	XBRLBLS0104Action.java															*
* 	* @path 				:	action																			*
* 	* @author 				:	D PraveenBabu																	*
* 	* @version 				: 	1.0																				*
* 	* @functionality 		:	It contains the action with multiple methods to create SUP01400 Report.													*
* 	* @relatedScripts 		: 	bean.XBRLBLS100Bean.java,dao.XBRLBLS0104Dao.java 								*
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
import bean.XBRLBLS0104Bean;
import bean.XBRLBLS0104Bean;
import bean.XBRLBLS0104Bean;
import bean.XBRLBLS0104Bean;
import bean.XBRLBLS0104Bean;
import bean.XBRLBLS0104Bean;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRLBLS0104Dao {
	static Logger log = Logger.getLogger(XBRLBLS0104Dao.class);
	public String Reporef;

	public String getReporef() {
		return Reporef;
	}

	public void setReporef(String reporef) {
		Reporef = reporef;
	}
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

	public ArrayList<XBRLBLS0104Dao> ReporefSeq(String dt1, String dt2) {

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

		ArrayList<XBRLBLS0104Dao> arl = new ArrayList<XBRLBLS0104Dao>();
		sql.append("select REPORT_REF_NO from BLS0104_MOD_TABLE where REPORT_DATE='" + dt2 + "' ORDER BY REPORT_REF_NO");

		log.info("SELECTPROFILE" + sql.toString());

		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLBLS0104Dao xel = new XBRLBLS0104Dao();
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

	
public ArrayList<XBRLBLS0104Bean> xbrlBLS0104(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
		
		log.info("inside the section dao method");
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLBLS0104Bean> arl = new ArrayList<XBRLBLS0104Bean>();
		
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
				
				sql.append("SELECT SL_NO,CUST_NAME,to_char(BALANCE_AMT, '9,999,999,999,990.99')BALANCE_AMT,to_char(ACCRUED_INT, '9,999,999,999,990.99')ACCRUED_INT FROM TABLE(BLS0104_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"')) WHERE SECTION_ID='1'");
				
				
			log.info("sec1 "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				XBRLBLS0104Bean xb=new XBRLBLS0104Bean();
				
			
				xb.setSrno(NullCheck.isNotNull(rs.getString("SL_NO")));
				xb.setNamcou(NullCheck.isNotNull(rs.getString("CUST_NAME")));
				xb.setAmtinc(NullCheck.isNotNull(rs.getString("BALANCE_AMT")));
				xb.setAmtacrint(NullCheck.isNotNull(rs.getString("ACCRUED_INT")));
		
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
	
public ArrayList<XBRLBLS0104Bean> xbrlBLS0104s2(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {

	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLBLS0104Bean> arl = new ArrayList<XBRLBLS0104Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	
	try {
	
		//sql.append("SELECT /* +FIRST_ROWS(110) */ CUSTOMER_ID,CUSTOMER_NAME,CUSTOMER_GROUP,CUSTOMER_SUB_GROUP,ISIC_CODE,UNOQUE_CODE, CURRENCY_CODE,EXPO_SURE_TYPE,DLETE_FLOUG,REQUIER_USER_ID,REQUIER_TIME,LCHG_USER_ID,LCHG_TIME,VERIFY_USER_ID,VERIFY_TIME,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,to_char(BALANCE_AMOUNT_ACCOUNT, '9,999,999,999,990.99')BALANCE_AMOUNT_ACCOUNT FROM TABLE(BLS0104_S1_DTL_FUN('BLS0104','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");	
		sql.append("SELECT SL_NO,CUST_NAME,to_char(BALANCE_AMT, '9,999,999,999,990.99')BALANCE_AMT,to_char(ACCRUED_INT, '9,999,999,999,990.99')ACCRUED_INT FROM TABLE(BLS0104_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"')) WHERE SECTION_ID='2'");

		log.info("sec2"+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLBLS0104Bean xb=new XBRLBLS0104Bean();

			xb.setSrno(NullCheck.isNotNull(rs.getString("SL_NO")));
			xb.setNamcou(NullCheck.isNotNull(rs.getString("CUST_NAME")));
			xb.setAmtinc(NullCheck.isNotNull(rs.getString("BALANCE_AMT")));
			xb.setAmtacrint(NullCheck.isNotNull(rs.getString("ACCRUED_INT")));
		
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


public ArrayList<XBRLBLS0104Bean> xbrlBLS0104s3(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {


HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

ArrayList<XBRLBLS0104Bean> arl = new ArrayList<XBRLBLS0104Bean>();

String status = "";

ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();

PreparedStatement ps = null;

StringBuffer sql = new StringBuffer();


DateFormat df=new DateFormat();		
dt1 =df.formatdate(dt1);
dt2 =df.formatdate(dt2);


try {

	//sql.append("SELECT /* +FIRST_ROWS(110) */ CUSTOMER_ID,CUSTOMER_NAME,CUSTOMER_GROUP,CUSTOMER_SUB_GROUP,ISIC_CODE,UNOQUE_CODE, CURRENCY_CODE,EXPO_SURE_TYPE,DLETE_FLOUG,REQUIER_USER_ID,REQUIER_TIME,LCHG_USER_ID,LCHG_TIME,VERIFY_USER_ID,VERIFY_TIME,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,to_char(BALANCE_AMOUNT_ACCOUNT, '9,999,999,999,990.99')BALANCE_AMOUNT_ACCOUNT FROM TABLE(BLS0104_S1_DTL_FUN('BLS0104','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");	
	sql.append("SELECT SL_NO,CUST_NAME,to_char(BALANCE_AMT, '9,999,999,999,990.99')BALANCE_AMT,to_char(ACCRUED_INT, '9,999,999,999,990.99')ACCRUED_INT FROM TABLE(BLS0104_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"')) WHERE SECTION_ID='3'");

	log.info("sec3"+sql.toString());
	
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		XBRLBLS0104Bean xb=new XBRLBLS0104Bean();

		xb.setSrno(NullCheck.isNotNull(rs.getString("SL_NO")));
		xb.setNamcou(NullCheck.isNotNull(rs.getString("CUST_NAME")));
		xb.setAmtinc(NullCheck.isNotNull(rs.getString("BALANCE_AMT")));
		xb.setAmtacrint(NullCheck.isNotNull(rs.getString("ACCRUED_INT")));
	
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


public ArrayList<XBRLBLS0104Bean> xbrlBLS0104s4(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {


HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

ArrayList<XBRLBLS0104Bean> arl = new ArrayList<XBRLBLS0104Bean>();

String status = "";

ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();

PreparedStatement ps = null;

StringBuffer sql = new StringBuffer();


DateFormat df=new DateFormat();		
dt1 =df.formatdate(dt1);
dt2 =df.formatdate(dt2);


try {

	//sql.append("SELECT /* +FIRST_ROWS(110) */ CUSTOMER_ID,CUSTOMER_NAME,CUSTOMER_GROUP,CUSTOMER_SUB_GROUP,ISIC_CODE,UNOQUE_CODE, CURRENCY_CODE,EXPO_SURE_TYPE,DLETE_FLOUG,REQUIER_USER_ID,REQUIER_TIME,LCHG_USER_ID,LCHG_TIME,VERIFY_USER_ID,VERIFY_TIME,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,to_char(BALANCE_AMOUNT_ACCOUNT, '9,999,999,999,990.99')BALANCE_AMOUNT_ACCOUNT FROM TABLE(BLS0104_S1_DTL_FUN('BLS0104','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");	
	sql.append("SELECT SL_NO,CUST_NAME,to_char(BALANCE_AMT, '9,999,999,999,990.99')BALANCE_AMT,to_char(ACCRUED_INT, '9,999,999,999,990.99')ACCRUED_INT FROM TABLE(BLS0104_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"')) WHERE SECTION_ID='4'");

	log.info("sec4"+sql.toString());
	
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		XBRLBLS0104Bean xb=new XBRLBLS0104Bean();

		xb.setSrno(NullCheck.isNotNull(rs.getString("SL_NO")));
		xb.setNamcou(NullCheck.isNotNull(rs.getString("CUST_NAME")));
		xb.setAmtinc(NullCheck.isNotNull(rs.getString("BALANCE_AMT")));
		xb.setAmtacrint(NullCheck.isNotNull(rs.getString("ACCRUED_INT")));
	
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


public ArrayList<XBRLBLS0104Bean> xbrlBLS0104s5(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {


HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

ArrayList<XBRLBLS0104Bean> arl = new ArrayList<XBRLBLS0104Bean>();

String status = "";

ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();

PreparedStatement ps = null;

StringBuffer sql = new StringBuffer();


DateFormat df=new DateFormat();		
dt1 =df.formatdate(dt1);
dt2 =df.formatdate(dt2);


try {

	//sql.append("SELECT /* +FIRST_ROWS(110) */ CUSTOMER_ID,CUSTOMER_NAME,CUSTOMER_GROUP,CUSTOMER_SUB_GROUP,ISIC_CODE,UNOQUE_CODE, CURRENCY_CODE,EXPO_SURE_TYPE,DLETE_FLOUG,REQUIER_USER_ID,REQUIER_TIME,LCHG_USER_ID,LCHG_TIME,VERIFY_USER_ID,VERIFY_TIME,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,to_char(BALANCE_AMOUNT_ACCOUNT, '9,999,999,999,990.99')BALANCE_AMOUNT_ACCOUNT FROM TABLE(BLS0104_S1_DTL_FUN('BLS0104','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");	
	sql.append("SELECT SL_NO,CUST_NAME,to_char(BALANCE_AMT, '9,999,999,999,990.99')BALANCE_AMT,to_char(ACCRUED_INT, '9,999,999,999,990.99')ACCRUED_INT FROM TABLE(BLS0104_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"')) WHERE SECTION_ID='5'");

	log.info("sec5"+sql.toString());
	
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		XBRLBLS0104Bean xb=new XBRLBLS0104Bean();

		xb.setSrno(NullCheck.isNotNull(rs.getString("SL_NO")));
		xb.setNamcou(NullCheck.isNotNull(rs.getString("CUST_NAME")));
		xb.setAmtinc(NullCheck.isNotNull(rs.getString("BALANCE_AMT")));
		xb.setAmtacrint(NullCheck.isNotNull(rs.getString("ACCRUED_INT")));
	
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


public ArrayList<XBRLBLS0104Bean> xbrlBLS0104s6(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {


HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

ArrayList<XBRLBLS0104Bean> arl = new ArrayList<XBRLBLS0104Bean>();

String status = "";

ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();

PreparedStatement ps = null;

StringBuffer sql = new StringBuffer();


DateFormat df=new DateFormat();		
dt1 =df.formatdate(dt1);
dt2 =df.formatdate(dt2);


try {

	//sql.append("SELECT /* +FIRST_ROWS(110) */ CUSTOMER_ID,CUSTOMER_NAME,CUSTOMER_GROUP,CUSTOMER_SUB_GROUP,ISIC_CODE,UNOQUE_CODE, CURRENCY_CODE,EXPO_SURE_TYPE,DLETE_FLOUG,REQUIER_USER_ID,REQUIER_TIME,LCHG_USER_ID,LCHG_TIME,VERIFY_USER_ID,VERIFY_TIME,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,to_char(BALANCE_AMOUNT_ACCOUNT, '9,999,999,999,990.99')BALANCE_AMOUNT_ACCOUNT FROM TABLE(BLS0104_S1_DTL_FUN('BLS0104','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");	
	sql.append("SELECT SL_NO,CUST_NAME,to_char(BALANCE_AMT, '9,999,999,999,990.99')BALANCE_AMT,to_char(ACCRUED_INT, '9,999,999,999,990.99')ACCRUED_INT FROM TABLE(BLS0104_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"')) WHERE SECTION_ID='6'");

	log.info("sec6"+sql.toString());
	
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		XBRLBLS0104Bean xb=new XBRLBLS0104Bean();

		xb.setSrno(NullCheck.isNotNull(rs.getString("SL_NO")));
		xb.setNamcou(NullCheck.isNotNull(rs.getString("CUST_NAME")));
		xb.setAmtinc(NullCheck.isNotNull(rs.getString("BALANCE_AMT")));
		xb.setAmtacrint(NullCheck.isNotNull(rs.getString("ACCRUED_INT")));
	
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


public ArrayList<XBRLBLS0104Bean> xbrlBLS0104s7(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {


HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

ArrayList<XBRLBLS0104Bean> arl = new ArrayList<XBRLBLS0104Bean>();

String status = "";

ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();

PreparedStatement ps = null;

StringBuffer sql = new StringBuffer();


DateFormat df=new DateFormat();		
dt1 =df.formatdate(dt1);
dt2 =df.formatdate(dt2);


try {

	//sql.append("SELECT /* +FIRST_ROWS(110) */ CUSTOMER_ID,CUSTOMER_NAME,CUSTOMER_GROUP,CUSTOMER_SUB_GROUP,ISIC_CODE,UNOQUE_CODE, CURRENCY_CODE,EXPO_SURE_TYPE,DLETE_FLOUG,REQUIER_USER_ID,REQUIER_TIME,LCHG_USER_ID,LCHG_TIME,VERIFY_USER_ID,VERIFY_TIME,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,to_char(BALANCE_AMOUNT_ACCOUNT, '9,999,999,999,990.99')BALANCE_AMOUNT_ACCOUNT FROM TABLE(BLS0104_S1_DTL_FUN('BLS0104','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");	
	sql.append("SELECT SL_NO,CUST_NAME,to_char(BALANCE_AMT, '9,999,999,999,990.99')BALANCE_AMT,to_char(ACCRUED_INT, '9,999,999,999,990.99')ACCRUED_INT FROM TABLE(BLS0104_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"')) WHERE SECTION_ID='7'");

	log.info("sec7"+sql.toString());
	
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		XBRLBLS0104Bean xb=new XBRLBLS0104Bean();

		xb.setSrno(NullCheck.isNotNull(rs.getString("SL_NO")));
		xb.setNamcou(NullCheck.isNotNull(rs.getString("CUST_NAME")));
		xb.setAmtinc(NullCheck.isNotNull(rs.getString("BALANCE_AMT")));
		xb.setAmtacrint(NullCheck.isNotNull(rs.getString("ACCRUED_INT")));
	
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


public ArrayList<XBRLBLS0104Bean> xbrlBLS0104s8(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {


HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

ArrayList<XBRLBLS0104Bean> arl = new ArrayList<XBRLBLS0104Bean>();

String status = "";

ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();

PreparedStatement ps = null;

StringBuffer sql = new StringBuffer();


DateFormat df=new DateFormat();		
dt1 =df.formatdate(dt1);
dt2 =df.formatdate(dt2);


try {

	//sql.append("SELECT /* +FIRST_ROWS(110) */ CUSTOMER_ID,CUSTOMER_NAME,CUSTOMER_GROUP,CUSTOMER_SUB_GROUP,ISIC_CODE,UNOQUE_CODE, CURRENCY_CODE,EXPO_SURE_TYPE,DLETE_FLOUG,REQUIER_USER_ID,REQUIER_TIME,LCHG_USER_ID,LCHG_TIME,VERIFY_USER_ID,VERIFY_TIME,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,to_char(BALANCE_AMOUNT_ACCOUNT, '9,999,999,999,990.99')BALANCE_AMOUNT_ACCOUNT FROM TABLE(BLS0104_S1_DTL_FUN('BLS0104','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");	
	sql.append("SELECT SL_NO,CUST_NAME,to_char(BALANCE_AMT, '9,999,999,999,990.99')BALANCE_AMT,to_char(ACCRUED_INT, '9,999,999,999,990.99')ACCRUED_INT FROM TABLE(BLS0104_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"')) WHERE SECTION_ID='8'");

	log.info("sec8"+sql.toString());
	
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		XBRLBLS0104Bean xb=new XBRLBLS0104Bean();

		xb.setSrno(NullCheck.isNotNull(rs.getString("SL_NO")));
		xb.setNamcou(NullCheck.isNotNull(rs.getString("CUST_NAME")));
		xb.setAmtinc(NullCheck.isNotNull(rs.getString("BALANCE_AMT")));
		xb.setAmtacrint(NullCheck.isNotNull(rs.getString("ACCRUED_INT")));
	
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



public ArrayList<XBRLBLS0104Bean> xbrlBLS0104ajaxdetails(String repname,String ReporefSeq,String instno,String dt2,String curr) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("repname    " + repname + "reprefno   "  + ReporefSeq + "instno"+ instno +"dt2   " + dt2 +"currency" +curr);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLBLS0104Bean> arl = new ArrayList<XBRLBLS0104Bean>();
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
		
		
			
			sql.append("SELECT ACCT_NUMBER,CUST_ID,CUST_NAME,CUST_NRE_FLG,ACCT_CRNCY_CODE,to_char(BAL_LAST_MON_AC, '9,999,999,999,990.99')BAL_LAST_MON_AC,to_char(BAL_CUR_MON_AC, '9,999,999,999,990.99')BAL_CUR_MON_AC,to_char(ACCRU_INT, '9,999,999,999,990.99')ACCRU_INT,ACCT_TYPE,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE, CHANGE_TYPE," + 
					"SECTION_ID, CUST_RANK FROM TABLE(BLS0104_DTL_FUN('"+repname+"','"
					+ ""+chk.notZero(ReporefSeq)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
		
			log.info("det1"+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				//log.info("whileee");
								
				 
				XBRLBLS0104Bean xb=new XBRLBLS0104Bean();
				
				
			    	xb.setActnum(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
					xb.setCusid(NullCheck.isNotNull(rs.getString("CUST_ID")));
					xb.setCusnam(NullCheck.isNotNull(rs.getString("CUST_NAME")));
					xb.setCusnrflg(NullCheck.isNotNull(rs.getString("CUST_NRE_FLG")));
					xb.setAccurcode(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
					xb.setBalastmon(NullCheck.isNotNull(rs.getString("BAL_LAST_MON_AC")));
					xb.setBalcurmon(NullCheck.isNotNull(rs.getString("BAL_CUR_MON_AC")));
					xb.setAccrint(NullCheck.isNotNull(rs.getString("ACCRU_INT")));
					xb.setAccrtyp(NullCheck.isNotNull(rs.getString("ACCT_TYPE")));
				 	xb.setChangetyp(NullCheck.isNotNull(rs.getString("CHANGE_TYPE")));
					xb.setSecid(NullCheck.isNotNull(rs.getString("SECTION_ID")));
					xb.setCusrank(NullCheck.isNotNull(rs.getString("CUST_RANK")));
					xb.setReportdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
					
					
			
				
		
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


public String detailBLS0104saves() {

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



public ArrayList<XBRLBLS0104Bean> xbrlbls4RR(String dt1,String dt2,String reprefno,String instno,String curr) {

HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

ArrayList<XBRLBLS0104Bean> arl = new ArrayList<XBRLBLS0104Bean>();
NullCheck chk=new NullCheck();


String status = "";

ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();

PreparedStatement ps = null;

StringBuffer sql = new StringBuffer();


DateFormat df=new DateFormat();

dt1 =df.formatdate(dt1);
dt2 =df.formatdate(dt2);

//sql.append("SELECT * FROM TABLE(BLS0104_DTL_FUN('BLS0104','0','0','31-AUG-2018','01-AUG-2018','31-AUG-2018','MUR'))";

sql.append("SELECT ACCT_NUMBER,CUST_ID,CUST_NAME,CUST_NRE_FLG,ACCT_CRNCY_CODE,to_char(BAL_LAST_MON_AC, '9,999,999,999,990.99')BAL_LAST_MON_AC,to_char(BAL_CUR_MON_AC, '9,999,999,999,990.99')BAL_CUR_MON_AC,to_char(ACCRU_INT, '9,999,999,999,990.99')ACCRU_INT,ACCT_TYPE,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE FROM TABLE(BLS0104_DTL_FUN('BLS0104','0','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");	
log.info("DOC&&&&SELECT Gayu"+sql.toString());
try {
ps=conn.prepareStatement(sql.toString());

    ResultSet rs=ps.executeQuery();
     

while(rs.next()){

XBRLBLS0104Bean xb=new XBRLBLS0104Bean();

xb.setActnum(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
xb.setCusid(NullCheck.isNotNull(rs.getString("CUST_ID")));
xb.setCusnam(NullCheck.isNotNull(rs.getString("CUST_NAME")));
xb.setCusnrflg(NullCheck.isNotNull(rs.getString("CUST_NRE_FLG")));
xb.setAccurcode(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
xb.setBalastmon(NullCheck.isNotNull(rs.getString("BAL_LAST_MON_AC")));
xb.setBalcurmon(NullCheck.isNotNull(rs.getString("BAL_CUR_MON_AC")));
xb.setAccrint(NullCheck.isNotNull(rs.getString("ACCRU_INT")));
xb.setAccrtyp(NullCheck.isNotNull(rs.getString("ACCT_TYPE")));
	
xb.setReportdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));




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

public String BLS0104chckmodified() {

	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	HttpSession session = request.getSession();
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	if(request.getParameter("type").equals("chkuser")) {
		sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM BLS0104_MOD_TABLE ");
	}else {
		//sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM BLS0104_MOD_TABLE WHERE REPORT_DATE='"+NullCheck.isNotNull(df.formatdate(request.getParameter("repdate")))+"'");
		sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM BLS0104_MOD_TABLE ");

	}
	
	
	try {
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	      while(rs.next()) {
	    	  cnt=NullCheck.isNotZero(rs.getString("CNT"));
	    	  log.info(cnt);
	      }
	    
	}catch(SQLException e) {
		e.printStackTrace();
	}
	return "success";
}


public String modBLS0104cancel() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	sql.append("DELETE FROM BLS0104_MOD_TABLE WHERE REPORT_DATE='"+df.formatdate((request.getParameter("date")))+"' and ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("actnum"))+"'");
	
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



public ArrayList<XBRLBLS0104Bean> BLS0104verify(){
	
	ArrayList<XBRLBLS0104Bean> arl = new ArrayList<XBRLBLS0104Bean>();
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	sql.append("SELECT /* +FIRST_ROWS(100) */ACCT_NUMBER,CUST_ID,CUST_NAME,CUST_NRE_FLG,ACCT_CRNCY_CODE,BAL_LAST_MON_AC,BAL_CUR_MON_AC,ACCRU_INT,ACCT_TYPE,CHANGE_TYPE,SECTION_ID,CUST_RANK,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,DECODE(DEL_FLG,'A','Added','M','Modified','D','Deleted') as DEL_FLG ,LCHG_USER_ID FROM BLS0104_MOD_TABLE");
	log.info("Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		XBRLBLS0104Bean xb=new XBRLBLS0104Bean();

		xb.setActnum(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
		xb.setCusid(NullCheck.isNotNull(rs.getString("CUST_ID")));
		xb.setCusnam(NullCheck.isNotNull(rs.getString("CUST_NAME")));
		xb.setCusnrflg(NullCheck.isNotNull(rs.getString("CUST_NRE_FLG")));
		xb.setAccurcode(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
		xb.setBalastmon(NullCheck.isNotNull(rs.getString("BAL_LAST_MON_AC")));
		xb.setBalcurmon(NullCheck.isNotNull(rs.getString("BAL_CUR_MON_AC")));
		xb.setAccrint(NullCheck.isNotNull(rs.getString("ACCRU_INT")));
		xb.setAccrtyp(NullCheck.isNotNull(rs.getString("ACCT_TYPE")));
	    xb.setChangetyp(NullCheck.isNotNull(rs.getString("CHANGE_TYPE")));
		xb.setSecid(NullCheck.isNotNull(rs.getString("SECTION_ID")));
		xb.setCusrank(NullCheck.isNotNull(rs.getString("CUST_RANK")));
		xb.setReportdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
		
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

public String BLS0104verifymaster() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	HttpSession session = request.getSession();
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();	
	
	//------------------get data from mod table---------------------
	XBRLBLS0104Bean xb=new XBRLBLS0104Bean();
	
	sql.setLength(0);
	sql.append("SELECT /* +FIRST_ROWS(100) */ACCT_NUMBER,CUST_ID,CUST_NAME,CUST_NRE_FLG,ACCT_CRNCY_CODE,BAL_LAST_MON_AC,BAL_CUR_MON_AC,ACCRU_INT,ACCT_TYPE,CHANGE_TYPE,SECTION_ID,CUST_RANK,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,DEL_FLG,LCHG_USER_ID FROM BLS0104_MOD_TABLE "
			+ "WHERE ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("actnum"))+"' AND REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"' ");
	log.info("Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		

		xb.setActnum(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
		xb.setCusid(NullCheck.isNotNull(rs.getString("CUST_ID")));
		xb.setCusnam(NullCheck.isNotNull(rs.getString("CUST_NAME")));
		xb.setCusnrflg(NullCheck.isNotNull(rs.getString("CUST_NRE_FLG")));
		xb.setAccurcode(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
		xb.setBalastmon(NullCheck.isNotNull(rs.getString("BAL_LAST_MON_AC")));
		xb.setBalcurmon(NullCheck.isNotNull(rs.getString("BAL_CUR_MON_AC")));
		xb.setAccrint(NullCheck.isNotNull(rs.getString("ACCRU_INT")));
		xb.setAccrtyp(NullCheck.isNotNull(rs.getString("ACCT_TYPE")));
	    xb.setChangetyp(NullCheck.isNotNull(rs.getString("CHANGE_TYPE")));
		xb.setSecid(NullCheck.isNotNull(rs.getString("SECTION_ID")));
		xb.setCusrank(NullCheck.isNotNull(rs.getString("CUST_RANK")));
		xb.setReportdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
		
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
				" INSERT INTO BLS0104_MAST_TABLE(ACCT_NUMBER,CUST_ID,CUST_NAME,CUST_NRE_FLG,ACCT_CRNCY_CODE,BAL_LAST_MON_AC,BAL_CUR_MON_AC,ACCRU_INT,ACCT_TYPE,CHANGE_TYPE,SECTION_ID,CUST_RANK,REPORT_DATE,DEL_FLG,LCHG_USER_ID,LCHG_TIME,VERIFY_USER_ID,VERIFY_TIME)" + "VALUES ('"
						+ request.getParameter("actnum")
						+ "','" + request.getParameter("cusid") + "','" + request.getParameter("cusnam") + "','"
					+ request.getParameter("cusnrflg")+ "','"
					+ request.getParameter("accurcode") + "','"
							+ request.getParameter("balastmon") + "','"
									+ request.getParameter("balcurmon")+ "','"
											+ request.getParameter("accrint") + "','"
													+ request.getParameter("accrtyp") + "','"
			+df.formatdate(request.getParameter("reportdate"))+ "','"+request.getParameter("modtyp")+"','"
						+ session.getAttribute("userName")+"',SYSDATE,'"+ session.getAttribute("userName")+"',SYSDATE)");
				
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("DELETE FROM BLS0104_MOD_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"' and ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("actnum"))+"'");
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
		sql.append("UPDATE BLS0104_MAST_TABLE SET ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("actnum"))+"',CUST_ID='"+NullCheck.isNotNull(request.getParameter("cusid"))+"',CUST_NAME ='" + request.getParameter("cusnam") + "',CUST_NRE_FLG ='" + request.getParameter("cusnrflg") + "',ACCT_CRNCY_CODE ='" + request.getParameter("accurcode") + "',BAL_LAST_MON_AC ='" + request.getParameter("balastmon") + "',BAL_CUR_MON_AC='"+NullCheck.isNotNull(request.getParameter("balcurmon"))+"',ACCRU_INT='"+NullCheck.isNotNull(request.getParameter("accrint"))+"',ACCT_TYPE ='" + request.getParameter("accrtyp") + "',REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"',VERIFY_USER_ID='"+session.getAttribute("userName")+"',VERIFY_TIME=SYSDATE WHERE ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("actnum"))+"' AND REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"'");
		
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("DELETE FROM BLS0104_MOD_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"' and ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("actnum"))+"'");
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
		sql.append("DELETE FROM BLS0104_MAST_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"' and ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("actnum"))+"'");
		
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("UPDATE BLS0104_MOD_TABLE SET LCHG_USER_ID='"+session.getAttribute("userName")+"' WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"' and ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("actnum"))+"'");
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
		    sql.append("DELETE FROM BLS0104_MOD_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"' and ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("actnum"))+"'");
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



public String detailBLS0104savecheck() {

	ConnectionManager connmgr=new ConnectionManager();
	Connection conn=connmgr.getConnection();
	ArrayList<String> arl = new ArrayList<String>();
			HttpServletRequest request = ServletActionContext.getRequest();
			DateFormat df = new DateFormat();
			StringBuffer sql = new StringBuffer();
			PreparedStatement ps = null;
			
			sql.append("SELECT COUNT(REPORT_DATE) as repdate FROM BLS0104_RPT_TB where REPORT_ID = '"+request.getParameter("reptype")+"' AND  REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ");
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