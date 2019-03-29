package dao;

import java.sql.CallableStatement;
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
import bean.XBRLSUP1200Bean;

import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRLSUP1200Dao {
	static Logger log = Logger.getLogger(XBRLSUP1200Dao.class);
public String Reporef;
	
	
	public String getReporef() {
		return Reporef;
	}

	public void setReporef(String reporef) {
		Reporef = reporef;
	}


	public ArrayList<XBRLSUP1200Dao> ReporefSeq(String dt1,String dt2){
		
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
		
		ArrayList<XBRLSUP1200Dao> arl = new ArrayList<XBRLSUP1200Dao>();
		sql.append("select REPORT_REF_NO from ( select REPORT_REF_NO from SUP1200_S1_MOD_TABLE where REPORT_DATE BETWEEN '"+dt1+"' AND '"+dt2+"') union all ( select REPORT_REF_NO from SUP1200_S4_MOD_TABLE where REPORT_DATE BETWEEN '"+dt1+"' AND '"+dt2+"' )");

		//sql.append("select(select REPORT_REF_NO from SUP1200_S1_MOD_TABLE where REPORT_DATE BETWEEN '"+dt1+"' AND '"+dt2+"' GROUP BY REPORT_REF_NO ORDER BY REPORT_REF_NO)(select REPORT_REF_NO from SUP1200_S4_MOD_TABLE where REPORT_DATE BETWEEN '"+dt1+"' AND '"+dt2+"' GROUP BY REPORT_REF_NO ORDER BY REPORT_REF_NO)");

		log.info("SELECTPROFILE"+sql.toString());
		
		try {
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
		
				XBRLSUP1200Dao xel=new XBRLSUP1200Dao();
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
	
	
public ArrayList<XBRLSUP1200Bean> xbrlSUP1200(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
		
		
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLSUP1200Bean> arl = new ArrayList<XBRLSUP1200Bean>();
		
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
		
				
				sql.append("select INSTANCE_NAME,INSTANCE_CODE,VALUE  from table(SUP1200_S1_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
				
		
			log.info("SUP1200 "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				XBRLSUP1200Bean xb=new XBRLSUP1200Bean();
				
			
					xb.setS1intname(NullCheck.isNotNull(rs.getString("INSTANCE_NAME")));
					xb.setS1intcode(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
					xb.setS1value(NullCheck.isNotNull(rs.getString("VALUE")));
					
					
			
			
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
	
public ArrayList<XBRLSUP1200Bean> xbrlSUP1200s2(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {

	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLSUP1200Bean> arl = new ArrayList<XBRLSUP1200Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	
	try {
	
			
			sql.append("select ULTIMATE_BENE_SL_NO,NAME_OF_BENEFICIARY,to_char(TOT_PER_OF_SHARES, '9,999,999,999,990.99')TOT_PER_OF_SHARES,CITIZENSHIP  from table(SUP1200_S2_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");
			
	
		log.info("SUP1200 "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLSUP1200Bean xb=new XBRLSUP1200Bean();
			
				xb.setS2ultbenownno(NullCheck.isNotNull(rs.getString("ULTIMATE_BENE_SL_NO")));
				xb.setS2ultbenownname(NullCheck.isNotNull(rs.getString("NAME_OF_BENEFICIARY")));
				xb.setS2totpershare(NullCheck.isNotNull(rs.getString("TOT_PER_OF_SHARES")));
				xb.setS2citizen(NullCheck.isNotNull(rs.getString("CITIZENSHIP")));
				
		
		
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

public ArrayList<XBRLSUP1200Bean> xbrlSUP1200s3(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLSUP1200Bean> arl = new ArrayList<XBRLSUP1200Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	 
	try {
	
			
			sql.append("select ULTIMATE_BENE_SL_NO,TRAN_SL_NO,NAME_OF_BENEFICIARY,NAME_OF_SHAREHOLDER,CITIZENSHIP,TYPE_OF_HOLDING,to_char(NO_OF_SHARES_HELD, '9,999,999,999,990.99')NO_OF_SHARES_HELD,to_char(PERCENTAGE_OF_SHARE, '9,999,999,999,990.99')PERCENTAGE_OF_SHARE,to_char(PER_OF_DIR_INDIR_SHARE, '9,999,999,999,990.99')PER_OF_DIR_INDIR_SHARE from table(SUP1200_S3_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
	
		log.info("SUP1200 "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLSUP1200Bean xb=new XBRLSUP1200Bean();
			
		
				xb.setS3ultibenownno(NullCheck.isNotNull(rs.getString("ULTIMATE_BENE_SL_NO")));
				xb.setS3tranno(NullCheck.isNotNull(rs.getString("TRAN_SL_NO")));
				xb.setS3nameben(NullCheck.isNotNull(rs.getString("NAME_OF_BENEFICIARY")));
				xb.setS3nameshareholder(NullCheck.isNotNull(rs.getString("NAME_OF_SHAREHOLDER")));
				xb.setS3citizen(NullCheck.isNotNull(rs.getString("CITIZENSHIP")));
				xb.setS3typofhodng(NullCheck.isNotNull(rs.getString("TYPE_OF_HOLDING")));
				xb.setS3noofshares(NullCheck.isNotNull(rs.getString("NO_OF_SHARES_HELD")));
				xb.setS3pershare(NullCheck.isNotNull(rs.getString("PERCENTAGE_OF_SHARE")));
				xb.setS3perofdir(NullCheck.isNotNull(rs.getString("PER_OF_DIR_INDIR_SHARE")));
				
		
		
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

public ArrayList<XBRLSUP1200Bean> xbrlSUP1200s4(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLSUP1200Bean> arl = new ArrayList<XBRLSUP1200Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	try {
	
			
			sql.append("select SL_NO,NAME_OF_DIR,UNIQUE_ID,STATUS,REPORTING_TYPE,DESIGNATION,NAME_OF_INSTITUTION,to_char(DATE_OF_APPOINTMENT,'DD-MM-YYYY')DATE_OF_APPOINTMENT,to_char(DATE_OF_RESINGNATION,'DD-MM-YYYY')DATE_OF_RESINGNATION,CITIZENSHIP from table(SUP1200_S4_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
	
		log.info("SUP1200s4 "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLSUP1200Bean xb=new XBRLSUP1200Bean();
			
		        xb.setS4slno(NullCheck.isNotNull(rs.getString("SL_NO")));
				xb.setS4namedir(NullCheck.isNotNull(rs.getString("NAME_OF_DIR")));
				xb.setS4uniqid(NullCheck.isNotNull(rs.getString("UNIQUE_ID")));
				xb.setS4status(NullCheck.isNotNull(rs.getString("STATUS")));
				xb.setS4reporttyp(NullCheck.isNotNull(rs.getString("REPORTING_TYPE")));
				xb.setS4desgnatn(NullCheck.isNotNull(rs.getString("DESIGNATION")));
				xb.setS4nameinstitute(NullCheck.isNotNull(rs.getString("NAME_OF_INSTITUTION")));
				xb.setS4dateappoinmt(NullCheck.isNotNull(rs.getString("DATE_OF_APPOINTMENT")));
			    xb.setS4dateresign(NullCheck.isNotNull(rs.getString("DATE_OF_RESINGNATION")));
			    xb.setS4citizen(NullCheck.isNotNull(rs.getString("CITIZENSHIP")));
					
		
		
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




public ArrayList<XBRLSUP1200Bean> xbrlSUP1200d1(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLSUP1200Bean> arl = new ArrayList<XBRLSUP1200Bean>();
	
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
	/*	'BLS0106','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))"
*/			
			sql.append("select BENEFICIARY_OWNER_NAME,CITIZEN_SHIP,TYPE_OF_HOLDING,NO_OF_SHARES,to_char(PERCENTAGE_OF_SHARE, '9,999,999,999,990.99')PERCENTAGE_OF_SHARE,to_char(PER_OF_DIR_INDIR_SHARE, '9,999,999,999,990.99')PER_OF_DIR_INDIR_SHARE,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE from table(SUP1200_S1_DTL_FUN('SUP1200','"+chk.notZero(ReporefSeq)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
	
		log.info("SUP1200d1 "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLSUP1200Bean xb=new XBRLSUP1200Bean();
			
	         xb.setD1benownname(NullCheck.isNotNull(rs.getString("BENEFICIARY_OWNER_NAME")));
			 xb.setD1citiz(NullCheck.isNotNull(rs.getString("CITIZEN_SHIP")));
			 xb.setD1typhold(NullCheck.isNotNull(rs.getString("TYPE_OF_HOLDING")));
			 xb.setD1noofshares(NullCheck.isNotNull(rs.getString("NO_OF_SHARES")));
			 xb.setD1perofshare(NullCheck.isNotNull(rs.getString("PERCENTAGE_OF_SHARE")));
			 xb.setD1perofdirind(NullCheck.isNotNull(rs.getString("PER_OF_DIR_INDIR_SHARE")));
			 xb.setD1repdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
				
		
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
public ArrayList<XBRLSUP1200Bean> xbrlSUP1200d2(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLSUP1200Bean> arl = new ArrayList<XBRLSUP1200Bean>();
	
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
	
			
			sql.append("select NAME_OF_DIRECTOR,UNIQUE_ID,STATUS,REPORTING_TYPE,DESIGNATION,NAME_OF_INSTITUTION,to_char(DATE_OF_APPOINTMENT,'DD-MM-YYYY')DATE_OF_APPOINTMENT,to_char(DATE_OF_RESIGNATION,'DD-MM-YYYY')DATE_OF_RESIGNATION,CITIZENSHIP,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE from table(SUP1200_S4_DTL_FUN('SUP1200','"+chk.notZero(ReporefSeq)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
	
		log.info("SUP1200d2 "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLSUP1200Bean xb=new XBRLSUP1200Bean();
			
	         xb.setD2namofdir(NullCheck.isNotNull(rs.getString("NAME_OF_DIRECTOR")));
			 xb.setD2uniid(NullCheck.isNotNull(rs.getString("UNIQUE_ID")));
			 xb.setD2status(NullCheck.isNotNull(rs.getString("STATUS")));
			 xb.setD2reptyp(NullCheck.isNotNull(rs.getString("REPORTING_TYPE")));
			 xb.setD2designatn(NullCheck.isNotNull(rs.getString("DESIGNATION")));
			 xb.setD2nameinstitutn(NullCheck.isNotNull(rs.getString("NAME_OF_INSTITUTION")));
			 xb.setD2dateappoinmt(NullCheck.isNotNull(rs.getString("DATE_OF_APPOINTMENT")));
			 xb.setD2dateresignatn(NullCheck.isNotNull(rs.getString("DATE_OF_RESIGNATION")));
			 xb.setD2citizenship(NullCheck.isNotNull(rs.getString("CITIZENSHIP")));
			 xb.setD2repdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));	
		
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



public ArrayList<XBRLSUP1200Bean> xbrlSUP1200Ed1(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLSUP1200Bean> arl = new ArrayList<XBRLSUP1200Bean>();
	
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
	/*	'BLS0106','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))"
*/			
			sql.append("select BENEFICIARY_OWNER_NAME,CITIZEN_SHIP,TYPE_OF_HOLDING,NO_OF_SHARES,to_char(PERCENTAGE_OF_SHARE, '9,999,999,999,990.99')PERCENTAGE_OF_SHARE,to_char(PER_OF_DIR_INDIR_SHARE, '9,999,999,999,990.99')PER_OF_DIR_INDIR_SHARE,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE from table(SUP1200_S1_DTL_FUN('SUP1200','"+chk.notZero(ReporefSeq)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
	
		log.info("SUP1200d1 "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLSUP1200Bean xb=new XBRLSUP1200Bean();
			
	         xb.setD1benownname(NullCheck.isNotNull(rs.getString("BENEFICIARY_OWNER_NAME")));
			 xb.setD1citiz(NullCheck.isNotNull(rs.getString("CITIZEN_SHIP")));
			 xb.setD1typhold(NullCheck.isNotNull(rs.getString("TYPE_OF_HOLDING")));
			 xb.setD1noofshares(NullCheck.isNotNull(rs.getString("NO_OF_SHARES")));
			 xb.setD1perofshare(NullCheck.isNotNull(rs.getString("PERCENTAGE_OF_SHARE")));
			 xb.setD1perofdirind(NullCheck.isNotNull(rs.getString("PER_OF_DIR_INDIR_SHARE")));
			 xb.setD1repdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
				
		
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
public ArrayList<XBRLSUP1200Bean> xbrlSUP1200Ed2(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLSUP1200Bean> arl = new ArrayList<XBRLSUP1200Bean>();
	
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
	
			
			sql.append("select NAME_OF_DIRECTOR,UNIQUE_ID,STATUS,REPORTING_TYPE,DESIGNATION,NAME_OF_INSTITUTION,to_char(DATE_OF_APPOINTMENT,'DD-MM-YYYY')DATE_OF_APPOINTMENT,to_char(DATE_OF_RESIGNATION,'DD-MM-YYYY')DATE_OF_RESIGNATION,CITIZENSHIP,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE from table(SUP1200_S4_DTL_FUN('SUP1200','"+chk.notZero(ReporefSeq)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
	
		log.info("SUP1200d2 "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLSUP1200Bean xb=new XBRLSUP1200Bean();
			
	         xb.setD2namofdir(NullCheck.isNotNull(rs.getString("NAME_OF_DIRECTOR")));
			 xb.setD2uniid(NullCheck.isNotNull(rs.getString("UNIQUE_ID")));
			 xb.setD2status(NullCheck.isNotNull(rs.getString("STATUS")));
			 xb.setD2reptyp(NullCheck.isNotNull(rs.getString("REPORTING_TYPE")));
			 xb.setD2designatn(NullCheck.isNotNull(rs.getString("DESIGNATION")));
			 xb.setD2nameinstitutn(NullCheck.isNotNull(rs.getString("NAME_OF_INSTITUTION")));
			 xb.setD2dateappoinmt(NullCheck.isNotNull(rs.getString("DATE_OF_APPOINTMENT")));
			 xb.setD2dateresignatn(NullCheck.isNotNull(rs.getString("DATE_OF_RESIGNATION")));
			 xb.setD2citizenship(NullCheck.isNotNull(rs.getString("CITIZENSHIP")));
			 xb.setD2repdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));	
		
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
public String detailSUP1200saves() {

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
