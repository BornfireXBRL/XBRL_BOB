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
import bean.XBRLSUP0500Bean;
import bean.XBRLSUP0500Bean;

import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRLSUP0500Dao {
	static Logger log = Logger.getLogger(XBRLSUP0500Dao.class);
	public String Reporef;

	
	
	
	public String getReporef() {
		return Reporef;
	}



	public void setReporef(String reporef) {
		Reporef = reporef;
	}








	public ArrayList<XBRLSUP0500Dao> ReporefSeq(String dt1, String dt2) {

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

		ArrayList<XBRLSUP0500Dao> arl = new ArrayList<XBRLSUP0500Dao>();
		sql.append("select REPORT_REF_NO from SUP0500_MOD_TABLE where REPORT_DATE='" + dt2 + "' ORDER BY REPORT_REF_NO");

		log.info("SELECTPROFILE" + sql.toString());

		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLSUP0500Dao xel = new XBRLSUP0500Dao();
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

	
/*-------------------------------------------------------------------------------------------*/
	
	
	/*----------------------------- EXCEL REP SECTION-------------------------------------*/ 
	
	
	public ArrayList<XBRLSUP0500Bean> xbrlSUP500ER(String reptype,String dt1,String dt2,String ReporefSeq,String instno,String curr) {
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLSUP0500Bean> arl = new ArrayList<XBRLSUP0500Bean>();
		NullCheck chk=new NullCheck();
		
		
		String status = "";
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		
		PreparedStatement ps = null;
		
		StringBuffer sql = new StringBuffer();
		
		
		DateFormat df=new DateFormat();
		
		dt1 =df.formatdate(dt1);
		dt2 =df.formatdate(dt2);
		
		//sql.append("SELECT * FROM TABLE(SUP0500_DTL_FUN('SUP0500','0','0','31-AUG-2018','01-AUG-2018','31-AUG-2018','MUR'))");
			
		sql.append("select INSTANCE_NAME,INSTANCE_CODE,to_char(RESIDENT, '9,999,999,999,990.99')RESIDENT,to_char(NON_RESIDENT, '9,999,999,999,990.99')NON_RESIDENT,to_char(TOTAL, '9,999,999,999,990.99')TOTAL  from table(SUP0500_DTL_FUN('"+reptype+"','"+ReporefSeq+"','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
		log.info("DOC&&&&SELECT Gayu"+sql.toString());
		try {
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			
			XBRLSUP0500Bean xb=new XBRLSUP0500Bean();
			
			xb.setInstname(NullCheck.isNotNull(rs.getString("INSTANCE_NAME")));
			xb.setInstcode(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
			xb.setRes(NullCheck.isNotNull(rs.getString("RESIDENT")));
			xb.setNonresi(NullCheck.isNotNull(rs.getString("NON_RESIDENT")));
			xb.setTotal(NullCheck.isNotNull(rs.getString("TOTAL")));


		
			
			
			
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
	
	
	
	
	/*----------------------------- EXCEL REP SECTION-------------------------------------*/ 

	
	
	
	
	
	
	/*----------------------------- SUMMARY SECTION 1-------------------------------------*/                        

	
	
	
	
	
	
	
	/*----------------------------- SUMMARY SECTION 1-------------------------------------*/                        

	
	
	
public ArrayList<XBRLSUP0500Bean> xbrlSUP0500(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
		
		
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLSUP0500Bean> arl = new ArrayList<XBRLSUP0500Bean>();
		
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
		
				
				sql.append("select  INSTANCE_NAME,INSTANCE_CODE,to_char(RESIDENT, '9,999,999,999,990.99')RESIDENT,to_char(NON_RESIDENT, '9,999,999,999,990.99')NON_RESIDENT,to_char(TOTAL, '9,999,999,999,990.99')TOTAL from table(SUP0500_S1_RPT_FUN('"+reptype+"','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','MUR'))");
				
		
			log.info("SUP0500 "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				XBRLSUP0500Bean xb=new XBRLSUP0500Bean();
				
			
					xb.setInsname(NullCheck.isNotNull(rs.getString("INSTANCE_NAME")));
					xb.setInscode(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
					xb.setResident(NullCheck.isNotNull(rs.getString("RESIDENT")));
					xb.setNonres(NullCheck.isNotNull(rs.getString("NON_RESIDENT")));
					xb.setTot(NullCheck.isNotNull(rs.getString("TOTAL")));
					
					
			
			
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
	
/*----------------------------- SUMMARY SECTION 1-------------------------------------*/                        



/*----------------------------- SUMMARY SECTION 2-------------------------------------*/                        



public ArrayList<XBRLSUP0500Bean> xbrlSUP0500s2(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {

	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLSUP0500Bean> arl = new ArrayList<XBRLSUP0500Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	
	try {
	
			
			sql.append("select INSTANCE_NAME,INSTANCE_CODE,to_char(RESIDENT, '9,999,999,999,990.99')RESIDENT,to_char(NON_RESIDENT, '9,999,999,999,990.99')NON_RESIDENT,to_char(TOTAL, '9,999,999,999,990.99')TOTAL  from table(SUP0500_S2_RPT_FUN('"+reptype+"','"+instno+"','"+dt2+"','"+dt1+"','"+dt2+"','MUR'))");
			
	
		log.info("SUP0500 sec2"+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLSUP0500Bean xb=new XBRLSUP0500Bean();
			

			xb.setInsname(NullCheck.isNotNull(rs.getString("INSTANCE_NAME")));
			xb.setInscode(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
			xb.setResident(NullCheck.isNotNull(rs.getString("RESIDENT")));
			xb.setNonres(NullCheck.isNotNull(rs.getString("NON_RESIDENT")));
			xb.setTot(NullCheck.isNotNull(rs.getString("TOTAL")));
		
		
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

/*----------------------------- SUMMARY SECTION 2-------------------------------------*/                        




/*----------------------------- SUMMARY SECTION 3-------------------------------------*/                        



public ArrayList<XBRLSUP0500Bean> xbrlSUP0500s3(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLSUP0500Bean> arl = new ArrayList<XBRLSUP0500Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	 
	try {
	
			
			sql.append("select INSTANCE_NAME,INSTANCE_CODE,to_char(RESIDENT, '9,999,999,999,990.99')RESIDENT,to_char(NON_RESIDENT, '9,999,999,999,990.99')NON_RESIDENT,to_char(TOTAL, '9,999,999,999,990.99')TOTAL  from table(SUP0500_S3_RPT_FUN('"+reptype+"','"+instno+"','"+dt2+"','"+dt1+"','"+dt2+"','MUR'))");
			
	
		log.info("SUP0500 "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLSUP0500Bean xb=new XBRLSUP0500Bean();
			
		

			xb.setInsname(NullCheck.isNotNull(rs.getString("INSTANCE_NAME")));
			xb.setInscode(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
			xb.setResident(NullCheck.isNotNull(rs.getString("RESIDENT")));
			xb.setNonres(NullCheck.isNotNull(rs.getString("NON_RESIDENT")));
			xb.setTot(NullCheck.isNotNull(rs.getString("TOTAL")));
		
		
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



/*----------------------------- SUMMARY SECTION 3-------------------------------------*/                        


/*----------------------------- SUMMARY SECTION 4-------------------------------------*/                        



public ArrayList<XBRLSUP0500Bean> xbrlSUP0500s4(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLSUP0500Bean> arl = new ArrayList<XBRLSUP0500Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	try {
	
			
			sql.append("select INSTANCE_NAME,INSTANCE_CODE,to_char(RESIDENT, '9,999,999,999,990.99')RESIDENT,to_char(NON_RESIDENT, '9,999,999,999,990.99')NON_RESIDENT,to_char(TOTAL, '9,999,999,999,990.99')TOTAL  from table(SUP0500_S4_RPT_FUN('"+reptype+"','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','MUR'))");
			
	
		log.info("SUP0500s4 "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLSUP0500Bean xb=new XBRLSUP0500Bean();
			

			xb.setInsname(NullCheck.isNotNull(rs.getString("INSTANCE_NAME")));
			xb.setInscode(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
			xb.setResident(NullCheck.isNotNull(rs.getString("RESIDENT")));
			xb.setNonres(NullCheck.isNotNull(rs.getString("NON_RESIDENT")));
			xb.setTot(NullCheck.isNotNull(rs.getString("TOTAL")));
					
		
		
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



/*----------------------------- SUMMARY SECTION 4-------------------------------------*/                        





/*----------------------------- DETAILS SECTION 1-------------------------------------*/                        




public ArrayList<XBRLSUP0500Bean> xbrlSUP0500d1(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLSUP0500Bean> arl = new ArrayList<XBRLSUP0500Bean>();
	
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
/*			sql.append("select INSTANCE_NAME,INSTANCE_CODE,to_char(RESIDENT, '9,999,999,999,990.99')RESIDENT,to_char(NON_RESIDENT, '9,999,999,999,990.99')NON_RESIDENT,to_char(TOTAL, '9,999,999,999,990.99')TOTAL  from table(SUP0500_DTL_FUN('SUP0500','"+chk.notZero(ReporefSeq)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
*/			
		sql.append("select INSTANCE_NAME,INSTANCE_CODE,to_char(RESIDENT, '9,999,999,999,990.99')RESIDENT,to_char(NON_RESIDENT, '9,999,999,999,990.99')NON_RESIDENT,to_char(TOTAL, '9,999,999,999,990.99')TOTAL  from table(SUP0500_DTL_FUN('"+reptype+"','"+ReporefSeq+"','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");

		log.info("SUP0500d1 "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

	    
	    
		while(rs.next()){
			XBRLSUP0500Bean xb=new XBRLSUP0500Bean();
			

			xb.setInstname(NullCheck.isNotNull(rs.getString("INSTANCE_NAME")));
			xb.setInstcode(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
			xb.setRes(NullCheck.isNotNull(rs.getString("RESIDENT")));
			xb.setNonresi(NullCheck.isNotNull(rs.getString("NON_RESIDENT")));
			xb.setTotal(NullCheck.isNotNull(rs.getString("TOTAL")));
		
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


/*----------------------------- DETAILS SECTION 1-------------------------------------*/                        


public String detailSUP0500saves() {

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
