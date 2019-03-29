package dao;

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
import bean.XBRLSUP1000Bean;
import bean.XBRLSUP1000Bean;

import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRLSUP1000Dao {
	static Logger log = Logger.getLogger(XBRLSUP1000Dao.class);
	
	
	

public String Reporef;

	public String getReporef() {
		return Reporef;
	}

	public void setReporef(String reporef) {
		Reporef = reporef;
	}
	
	public ArrayList<XBRLSUP1000Dao> ReporefSeq(String dt1, String dt2) {

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

		ArrayList<XBRLSUP1000Dao> arl = new ArrayList<XBRLSUP1000Dao>();
		
		
		sql.append("select REPORT_REF_NO from ( select REPORT_REF_NO from SUP1000_S1_MOD_TABLE where REPORT_DATE BETWEEN '"+dt1+"' AND '"+dt2+"') union all ( select REPORT_REF_NO from SUP1000_S2_MOD_TABLE where REPORT_DATE BETWEEN '"+dt1+"' AND '"+dt2+"') union all ( select REPORT_REF_NO from SUP1000_S3_MOD_TABLE where REPORT_DATE BETWEEN '"+dt1+"' AND '"+dt2+"') union all ( select REPORT_REF_NO from SUP1000_S4_MOD_TABLE where REPORT_DATE BETWEEN '"+dt1+"' AND '"+dt2+"') ");

		//sql.append("select REPORT_REF_NO from SUP1000_MOD_TABLE where REPORT_DATE='" + dt2 + "' ORDER BY REPORT_REF_NO");

		log.info("SELECTPROFILE" + sql.toString());

		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLSUP1000Dao xel = new XBRLSUP1000Dao();
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

	
public ArrayList<XBRLSUP1000Bean> xbrlSUP1000(String reptype,String ReporefSeq,String instno,String dt2,String dt1,String curr) {
		
		
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLSUP1000Bean> arl = new ArrayList<XBRLSUP1000Bean>();
		
		String status = "";
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		
		PreparedStatement ps = null;
		
		StringBuffer sql = new StringBuffer();
		
		
		DateFormat df=new DateFormat();		
		dt1 =df.formatdate(dt1);
		dt2 =df.formatdate(dt2);
		
		 DecimalFormat dfs = new DecimalFormat("##,##.00");  
		 NullCheck chk=new NullCheck();
	
		try {
		
				
				sql.append("select SL_NO,DETAIL_TYPE,UNIQUE_ID,ACCT_NUMBER,ACCT_NAME,ADDRESS,to_char(LAST_TRAN_DATE,'DD-MM-YYYY')LAST_TRAN_DATE,ACCT_CURRENCY,to_char(OUT_BALANCE,'9,999,999,999,990.99')OUT_BALANCE,to_char(DATE_OF_TRANSFER,'DD-MM-YYYY')DATE_OF_TRANSFER,REMARKS from table(SUP1000_S1_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
				
		
			log.info("SUP1000 "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				XBRLSUP1000Bean xb=new XBRLSUP1000Bean();
				
			
					xb.setSlno(NullCheck.isNotNull(rs.getString("SL_NO")));
					xb.setS1dettyp(NullCheck.isNotNull(rs.getString("DETAIL_TYPE")));
					xb.setUnqid(NullCheck.isNotNull(rs.getString("UNIQUE_ID")));
					xb.setAcno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
					xb.setName(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
					xb.setAdrs(NullCheck.isNotNull(rs.getString("ADDRESS")));
					xb.setLstrandt(NullCheck.isNotNull(rs.getString("LAST_TRAN_DATE")));
					xb.setAccurncy(NullCheck.isNotNull(rs.getString("ACCT_CURRENCY")));
					xb.setOutbal(NullCheck.isNotNull(rs.getString("OUT_BALANCE")));
					xb.setDttran(NullCheck.isNotNull(rs.getString("DATE_OF_TRANSFER")));
					xb.setRmrk(NullCheck.isNotNull(rs.getString("REMARKS")));
					
					
			
			
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
	
public ArrayList<XBRLSUP1000Bean> xbrlSUP1000s2(String reptype,String ReporefSeq,String instno,String dt2,String dt1,String curr) {

	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLSUP1000Bean> arl = new ArrayList<XBRLSUP1000Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	
	try {
	
			
			sql.append("select SL_NO,DETAIL_TYPE,UNIQUE_ID,ACCT_NUMBER,ACCT_NAME,ADDRESS,ACCT_CURRENCY,to_char(OUT_BALANCE,'9,999,999,999,990.99')OUT_BALANCE,to_char(DATE_OF_TRANSFER,'DD-MM-YYYY')DATE_OF_TRANSFER,REMARKS from table(SUP1000_S2_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");
			
	
		log.info("SUP1000 "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLSUP1000Bean xb=new XBRLSUP1000Bean();
			
			xb.setSlno(NullCheck.isNotNull(rs.getString("SL_NO")));
			xb.setUnqid(NullCheck.isNotNull(rs.getString("UNIQUE_ID")));
			xb.setAcno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
			xb.setName(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
			xb.setAdrs(NullCheck.isNotNull(rs.getString("ADDRESS")));
			xb.setAccurncy(NullCheck.isNotNull(rs.getString("ACCT_CURRENCY")));
			xb.setOutbal(NullCheck.isNotNull(rs.getString("OUT_BALANCE")));
			xb.setDttran(NullCheck.isNotNull(rs.getString("DATE_OF_TRANSFER")));
			xb.setS1dettyp(NullCheck.isNotNull(rs.getString("DETAIL_TYPE")));
			xb.setRmrk(NullCheck.isNotNull(rs.getString("REMARKS")));
			
		
		
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

public ArrayList<XBRLSUP1000Bean> xbrlSUP1000s3(String reptype,String ReporefSeq,String instno,String dt2,String dt1,String curr) {
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLSUP1000Bean> arl = new ArrayList<XBRLSUP1000Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	 
	try {
	
			
			sql.append("select SL_NO,DETAIL_TYPE,UNIQUE_ID,to_char(DATE_OF_DD_CHQ,'DD-MM-YYYY')DATE_OF_DD_CHQ,DD_CHQ_NUMBER,ACCT_NAME,ADDRESS,ACCT_NUMBER,BENEFICIARY_NAME,BENEFICIARY_ADDRESS,ACCT_CURRENCY,to_char(OUT_BALANCE,'9,999,999,999,990.99')OUT_BALANCE,to_char(DATE_OF_TRANSFER,'DD-MM-YYYY')DATE_OF_TRANSFER,REMARKS from table(SUP1000_S3_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");
			
	
		log.info("SUP1000 "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLSUP1000Bean xb=new XBRLSUP1000Bean();
			
		
			xb.setSlno(NullCheck.isNotNull(rs.getString("SL_NO")));
			xb.setS1dettyp(NullCheck.isNotNull(rs.getString("DETAIL_TYPE")));
			xb.setUnqid(NullCheck.isNotNull(rs.getString("UNIQUE_ID")));
			xb.setS3dtddchq(NullCheck.isNotNull(rs.getString("DATE_OF_DD_CHQ")));
			xb.setS3ddchqno(NullCheck.isNotNull(rs.getString("DD_CHQ_NUMBER")));
			xb.setName(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
			xb.setAdrs(NullCheck.isNotNull(rs.getString("ADDRESS")));
			xb.setAcno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
			xb.setBfryname(NullCheck.isNotNull(rs.getString("BENEFICIARY_NAME")));
			xb.setBfryadrs(NullCheck.isNotNull(rs.getString("BENEFICIARY_ADDRESS")));
			xb.setAccurncy(NullCheck.isNotNull(rs.getString("ACCT_CURRENCY")));
			xb.setOutbal(NullCheck.isNotNull(rs.getString("OUT_BALANCE")));
			xb.setDttran(NullCheck.isNotNull(rs.getString("DATE_OF_TRANSFER")));
			xb.setRmrk(NullCheck.isNotNull(rs.getString("REMARKS")));
				
		
		
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

public ArrayList<XBRLSUP1000Bean> xbrlSUP1000s4(String reptype,String ReporefSeq,String instno,String dt2,String dt1,String curr) {
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLSUP1000Bean> arl = new ArrayList<XBRLSUP1000Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	try {
	
			
			sql.append("select SL_NO,UNIQUE_ID,to_char(DATE_OF_DD_CHQ,'DD-MM-YYYY')DATE_OF_DD_CHQ,DD_CHQ_NUMBER,ACCT_NAME,ADDRESS,ACCT_NUMBER,BENEFICIARY_NAME,BENEFICIARY_ADDRESS,ACCT_CURRENCY,to_char(OUT_BALANCE,'9,999,999,999,990.99')OUT_BALANCE,to_char(DATE_OF_TRANSFER,'DD-MM-YYYY')DATE_OF_TRANSFER,DETAIL_TYPE,REMARKS from table(SUP1000_S4_RPT_FUN('"+reptype+"','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
	
		log.info("SUP1000s4 "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLSUP1000Bean xb=new XBRLSUP1000Bean();
			xb.setSlno(NullCheck.isNotNull(rs.getString("SL_NO")));
			xb.setUnqid(NullCheck.isNotNull(rs.getString("UNIQUE_ID")));
			xb.setS3dtddchq(NullCheck.isNotNull(rs.getString("DATE_OF_DD_CHQ")));
			xb.setS3ddchqno(NullCheck.isNotNull(rs.getString("DD_CHQ_NUMBER")));
			xb.setName(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
			xb.setAdrs(NullCheck.isNotNull(rs.getString("ADDRESS")));
			xb.setAcno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
			xb.setBfryname(NullCheck.isNotNull(rs.getString("BENEFICIARY_NAME")));
			xb.setBfryadrs(NullCheck.isNotNull(rs.getString("BENEFICIARY_ADDRESS")));
			xb.setAccurncy(NullCheck.isNotNull(rs.getString("ACCT_CURRENCY")));
			xb.setOutbal(NullCheck.isNotNull(rs.getString("OUT_BALANCE")));
			xb.setDttran(NullCheck.isNotNull(rs.getString("DATE_OF_TRANSFER")));
			xb.setS1dettyp(NullCheck.isNotNull(rs.getString("DETAIL_TYPE")));
			xb.setRmrk(NullCheck.isNotNull(rs.getString("REMARKS")));
			
		
		
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




public ArrayList<XBRLSUP1000Bean> xbrlSUP1000d1(String reptype,String ReporefSeq,String instno,String dt2,String dt1,String curr) {
	
	
	log.info("inside dao 1 sec");
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLSUP1000Bean> arl = new ArrayList<XBRLSUP1000Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	
	dt1 =df.formatdate(dt1);
	
	dt2 =df.formatdate(dt2);
	log.info("after dt2");
	NullCheck chk=new NullCheck();
	log.info(chk.notZero(ReporefSeq)+"repseq");
	sql.append("select SL_NO,DETAIL_TYPE,UNIQUE_ID,ACCT_NUMBER,ACCT_NAME,ADDRESS,to_char(LAST_TRAN_DATE,'DD-MM-YYYY')LAST_TRAN_DATE,ACCT_CURRENCY,to_char(OUT_BALANCE,'9,999,999,999,990.99')OUT_BALANCE,to_char(DATE_OF_TRANSFER,'DD-MM-YYYY')DATE_OF_TRANSFER,REMARKS from table(SUP1000_S1_DTL_FUN('"+chk.notZero(reptype)+"','"+chk.notZero(ReporefSeq)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
	log.info("after sqlllllllll");
	try {
	/*	'BLS0106','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))"
*/			
			
			
	
		log.info("SUP1000d1 "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLSUP1000Bean xb=new XBRLSUP1000Bean();
			xb.setSlno(NullCheck.isNotNull(rs.getString("SL_NO")));
			xb.setS1dettyp(NullCheck.isNotNull(rs.getString("DETAIL_TYPE")));
			xb.setUnqid(NullCheck.isNotNull(rs.getString("UNIQUE_ID")));
			xb.setAcno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
			xb.setName(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
			xb.setAdrs(NullCheck.isNotNull(rs.getString("ADDRESS")));
			xb.setS3dtddchq(NullCheck.isNotNull(rs.getString("LAST_TRAN_DATE")));
			xb.setAccurncy(NullCheck.isNotNull(rs.getString("ACCT_CURRENCY")));
			xb.setOutbal(NullCheck.isNotNull(rs.getString("OUT_BALANCE")));
			xb.setDttran(NullCheck.isNotNull(rs.getString("DATE_OF_TRANSFER")));
			xb.setRmrk(NullCheck.isNotNull(rs.getString("REMARKS")));
			
		
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
public ArrayList<XBRLSUP1000Bean> xbrlSUP1000d2(String reptype,String ReporefSeq,String instno,String dt2,String dt1,String curr) {
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLSUP1000Bean> arl = new ArrayList<XBRLSUP1000Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	NullCheck chk=new NullCheck();

	try {
	
		sql.append("select SL_NO,DETAIL_TYPE,UNIQUE_ID,ACCT_NUMBER,ACCT_NAME,ADDRESS,ACCT_CURRENCY,to_char(OUT_BALANCE,'9,999,999,999,990.99')OUT_BALANCE,to_char(DATE_OF_TRANSFER,'DD-MM-YYYY')DATE_OF_TRANSFER,REMARKS from table(SUP1000_S2_DTL_FUN('"+reptype+"','"+chk.notZero(ReporefSeq)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
	
			
	
		log.info("SUP1000d2 "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLSUP1000Bean xb=new XBRLSUP1000Bean();
			xb.setSlno(NullCheck.isNotNull(rs.getString("SL_NO")));
			xb.setUnqid(NullCheck.isNotNull(rs.getString("UNIQUE_ID")));
			xb.setAcno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
			xb.setName(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
			xb.setAdrs(NullCheck.isNotNull(rs.getString("ADDRESS")));
			xb.setAccurncy(NullCheck.isNotNull(rs.getString("ACCT_CURRENCY")));
			xb.setOutbal(NullCheck.isNotNull(rs.getString("OUT_BALANCE")));
			xb.setDttran(NullCheck.isNotNull(rs.getString("DATE_OF_TRANSFER")));
			xb.setS1dettyp(NullCheck.isNotNull(rs.getString("DETAIL_TYPE")));
			xb.setRmrk(NullCheck.isNotNull(rs.getString("REMARKS")));
		
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



public ArrayList<XBRLSUP1000Bean> xbrlSUP1000d3(String reptype,String ReporefSeq,String instno,String dt2,String dt1,String curr) {
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLSUP1000Bean> arl = new ArrayList<XBRLSUP1000Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	NullCheck chk=new NullCheck();

	try {
		sql.append("select SL_NO,DETAIL_TYPE,UNIQUE_ID,to_char(DATE_OF_DD_CHQ,'DD-MM-YYYY')DATE_OF_DD_CHQ,DD_CHQ_NUMBER,ACCT_NAME,ADDRESS,ACCT_NUMBER,BENEFICIARY_NAME,BENEFICIARY_ADDRESS,ACCT_CURRENCY,to_char(OUT_BALANCE,'9,999,999,999,990.99')OUT_BALANCE,to_char(DATE_OF_TRANSFER,'DD-MM-YYYY')DATE_OF_TRANSFER,REMARKS  from table(SUP1000_S3_DTL_FUN('"+reptype+"','"+chk.notZero(ReporefSeq)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
	
			
	
		log.info("SUP1000d3 "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLSUP1000Bean xb=new XBRLSUP1000Bean();

			xb.setSlno(NullCheck.isNotNull(rs.getString("SL_NO")));
			xb.setS1dettyp(NullCheck.isNotNull(rs.getString("DETAIL_TYPE")));
			xb.setUnqid(NullCheck.isNotNull(rs.getString("UNIQUE_ID")));
			xb.setS3dtddchq(NullCheck.isNotNull(rs.getString("DATE_OF_DD_CHQ")));
			xb.setS3ddchqno(NullCheck.isNotNull(rs.getString("DD_CHQ_NUMBER")));
			xb.setName(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
			xb.setAdrs(NullCheck.isNotNull(rs.getString("ADDRESS")));
			xb.setAcno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
			xb.setBfryname(NullCheck.isNotNull(rs.getString("BENEFICIARY_NAME")));
			xb.setBfryadrs(NullCheck.isNotNull(rs.getString("BENEFICIARY_ADDRESS")));
			xb.setAccurncy(NullCheck.isNotNull(rs.getString("ACCT_CURRENCY")));
			xb.setOutbal(NullCheck.isNotNull(rs.getString("OUT_BALANCE")));
			xb.setDttran(NullCheck.isNotNull(rs.getString("DATE_OF_TRANSFER")));
			xb.setRmrk(NullCheck.isNotNull(rs.getString("REMARKS")));
				
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



public ArrayList<XBRLSUP1000Bean> xbrlSUP1000d4(String reptype,String ReporefSeq,String instno,String dt2,String dt1,String curr) {
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLSUP1000Bean> arl = new ArrayList<XBRLSUP1000Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	NullCheck chk=new NullCheck();

	try {
		
		
		sql.append("select SL_NO,UNIQUE_ID,to_char(DATE_OF_DD_CHQ,'DD-MM-YYYY')DATE_OF_DD_CHQ,DD_CHQ_NUMBER,ACCT_NAME,ADDRESS,ACCT_NUMBER,BENEFICIARY_NAME,BENEFICIARY_ADDRESS,ACCT_CURRENCY,to_char(OUT_BALANCE,'9,999,999,999,990.99')OUT_BALANCE,to_char(DATE_OF_TRANSFER,'DD-MM-YYYY')DATE_OF_TRANSFER,DETAIL_TYPE,REMARKS  from table(SUP1000_S4_DTL_FUN('"+reptype+"','"+chk.notZero(ReporefSeq)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
	
			
	
		log.info("SUP1000d4 "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLSUP1000Bean xb=new XBRLSUP1000Bean();

			xb.setSlno(NullCheck.isNotNull(rs.getString("SL_NO")));
			xb.setUnqid(NullCheck.isNotNull(rs.getString("UNIQUE_ID")));
			xb.setS3dtddchq(NullCheck.isNotNull(rs.getString("DATE_OF_DD_CHQ")));
			xb.setS3ddchqno(NullCheck.isNotNull(rs.getString("DD_CHQ_NUMBER")));
			xb.setName(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
			xb.setAdrs(NullCheck.isNotNull(rs.getString("ADDRESS")));
			xb.setAcno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
			xb.setBfryname(NullCheck.isNotNull(rs.getString("BENEFICIARY_NAME")));
			xb.setBfryadrs(NullCheck.isNotNull(rs.getString("BENEFICIARY_ADDRESS")));
			xb.setAccurncy(NullCheck.isNotNull(rs.getString("ACCT_CURRENCY")));
			xb.setOutbal(NullCheck.isNotNull(rs.getString("OUT_BALANCE")));
			xb.setDttran(NullCheck.isNotNull(rs.getString("DATE_OF_TRANSFER")));
			xb.setS1dettyp(NullCheck.isNotNull(rs.getString("DETAIL_TYPE")));
			xb.setRmrk(NullCheck.isNotNull(rs.getString("REMARKS")));
			
				
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


public ArrayList<XBRLSUP1000Bean> xbrlsupd1(String reptype,String dt1,String dt2,String ReporefSeq,String instno,String curr) {
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLSUP1000Bean> arl = new ArrayList<XBRLSUP1000Bean>();
	NullCheck chk=new NullCheck();
	
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();
	log.info(dt1);
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	sql.append("select SL_NO,DETAIL_TYPE,UNIQUE_ID,ACCT_NUMBER,ACCT_NAME,ADDRESS,to_char(LAST_TRAN_DATE,'DD-MM-YYYY')LAST_TRAN_DATE,ACCT_CURRENCY,to_char(OUT_BALANCE,'9,999,999,999,990.99')OUT_BALANCE,to_char(DATE_OF_TRANSFER,'DD-MM-YYYY')DATE_OF_TRANSFER,REMARKS from table(SUP1000_S1_DTL_FUN('"+chk.notZero(reptype)+"','"+chk.notZero(ReporefSeq)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
		
log.info("DOC&&&&SELECT Gayu"+sql.toString());
	
	try {
		
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		
		XBRLSUP1000Bean xb=new XBRLSUP1000Bean();
		xb.setSlno(NullCheck.isNotNull(rs.getString("SL_NO")));
		xb.setS1dettyp(NullCheck.isNotNull(rs.getString("DETAIL_TYPE")));
		xb.setUnqid(NullCheck.isNotNull(rs.getString("UNIQUE_ID")));
		xb.setAcno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
		xb.setName(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
		xb.setAdrs(NullCheck.isNotNull(rs.getString("ADDRESS")));
		xb.setS3dtddchq(NullCheck.isNotNull(rs.getString("LAST_TRAN_DATE")));
		xb.setAccurncy(NullCheck.isNotNull(rs.getString("ACCT_CURRENCY")));
		xb.setOutbal(NullCheck.isNotNull(rs.getString("OUT_BALANCE")));
		xb.setDttran(NullCheck.isNotNull(rs.getString("DATE_OF_TRANSFER")));
		xb.setRmrk(NullCheck.isNotNull(rs.getString("REMARKS")));
		
		
		
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

public ArrayList<XBRLSUP1000Bean> xbrlsupd2(String reptype,String dt1,String dt2,String ReporefSeq,String instno,String curr) {
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLSUP1000Bean> arl = new ArrayList<XBRLSUP1000Bean>();
	NullCheck chk=new NullCheck();
	
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();
	log.info(dt1);
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	sql.append("select SL_NO,DETAIL_TYPE,UNIQUE_ID,ACCT_NUMBER,ACCT_NAME,ADDRESS,ACCT_CURRENCY,to_char(OUT_BALANCE,'9,999,999,999,990.99')OUT_BALANCE,to_char(DATE_OF_TRANSFER,'DD-MM-YYYY')DATE_OF_TRANSFER,REMARKS from table(SUP1000_S2_DTL_FUN('"+reptype+"','"+chk.notZero(ReporefSeq)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
		
log.info("DOC&&&&SELECT Gayu"+sql.toString());
	
	try {
		
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		
		XBRLSUP1000Bean xb=new XBRLSUP1000Bean();
		xb.setSlno(NullCheck.isNotNull(rs.getString("SL_NO")));
		xb.setUnqid(NullCheck.isNotNull(rs.getString("UNIQUE_ID")));
		xb.setAcno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
		xb.setName(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
		xb.setAdrs(NullCheck.isNotNull(rs.getString("ADDRESS")));
		xb.setAccurncy(NullCheck.isNotNull(rs.getString("ACCT_CURRENCY")));
		xb.setOutbal(NullCheck.isNotNull(rs.getString("OUT_BALANCE")));
		xb.setDttran(NullCheck.isNotNull(rs.getString("DATE_OF_TRANSFER")));
		xb.setS1dettyp(NullCheck.isNotNull(rs.getString("DETAIL_TYPE")));
		xb.setRmrk(NullCheck.isNotNull(rs.getString("REMARKS")));
		
		
		
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



public ArrayList<XBRLSUP1000Bean> xbrlsupd34(String reptype,String dt1,String dt2,String ReporefSeq,String instno,String curr) {
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLSUP1000Bean> arl = new ArrayList<XBRLSUP1000Bean>();
	NullCheck chk=new NullCheck();
	
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();
	log.info(dt1);
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	sql.append("select UNIQUE_ID,to_char(DATE_OF_DD_CHQ,'DD-MM-YYYY')DATE_OF_DD_CHQ,DD_CHQ_NUMBER,ACCT_NAME,ADDRESS,ACCT_NUMBER,BENEFICIARY_NAME,BENEFICIARY_ADDRESS,ACCT_CURRENCY,to_char(OUT_BALANCE,'9,999,999,999,990.99')OUT_BALANCE,to_char(DATE_OF_TRANSFER,'DD-MM-YYYY')DATE_OF_TRANSFER,DETAIL_TYPE,REMARKS  from table(SUP1000_S4_DTL_FUN('"+reptype+"','"+chk.notZero(ReporefSeq)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
		
log.info("DOC&&&&SELECT Gayu"+sql.toString());
	
	try {
		
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		
		XBRLSUP1000Bean xb=new XBRLSUP1000Bean();

		
		xb.setUnqid(NullCheck.isNotNull(rs.getString("UNIQUE_ID")));
		xb.setS3dtddchq(NullCheck.isNotNull(rs.getString("DATE_OF_DD_CHQ")));
		xb.setS3ddchqno(NullCheck.isNotNull(rs.getString("DD_CHQ_NUMBER")));
		xb.setName(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
		xb.setAdrs(NullCheck.isNotNull(rs.getString("ADDRESS")));
		xb.setAcno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
		xb.setBfryname(NullCheck.isNotNull(rs.getString("BENEFICIARY_NAME")));
		xb.setBfryadrs(NullCheck.isNotNull(rs.getString("BENEFICIARY_ADDRESS")));
		xb.setAccurncy(NullCheck.isNotNull(rs.getString("ACCT_CURRENCY")));
		xb.setOutbal(NullCheck.isNotNull(rs.getString("OUT_BALANCE")));
		xb.setDttran(NullCheck.isNotNull(rs.getString("DATE_OF_TRANSFER")));
		xb.setS1dettyp(NullCheck.isNotNull(rs.getString("DETAIL_TYPE")));
		xb.setRmrk(NullCheck.isNotNull(rs.getString("REMARKS")));
		
		
		
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

}
