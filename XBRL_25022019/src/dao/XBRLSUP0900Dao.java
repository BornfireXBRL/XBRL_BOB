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
import bean.XBRLSUP0900Bean;
import bean.XBRLSUP0900Bean;
import bean.XBRLSUP0900Bean;
import bean.XBRLSUP0900Bean;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRLSUP0900Dao {

	static Logger log = Logger.getLogger(XBRLSUP0900Dao.class);
	
public String reporef;

	
	public String getReporef() {
	return reporef;
}
public void setReporef(String reporef) {
	this.reporef = reporef;
}
	public ArrayList<XBRLSUP0900Dao> ReporefSeq(String dt1, String dt2) {

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

		ArrayList<XBRLSUP0900Dao> arl = new ArrayList<XBRLSUP0900Dao>();
		sql.append("select REPORT_REF_NO from SUP0900_MOD_TABLE where REPORT_DATE='" + dt2 + "' ORDER BY REPORT_REF_NO");

		log.info("SELECTPROFILE" + sql.toString());

		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLSUP0900Dao xel = new XBRLSUP0900Dao();
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
public ArrayList<XBRLSUP0900Bean> xbrl1supsums1(String reptype,String ReporefSeq,String instno,String dt2,String dt1,String curr) {
		
		log.info(reptype);
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLSUP0900Bean> arl = new ArrayList<XBRLSUP0900Bean>();

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
				
				
				sql.append("select INSTANCE_NAME,INSTANCE_CODE,to_char(CF_LOSS,'9,999,999,999,990.99')CF_LOSS,to_char(CF_INSURE,'9,999,999,999,990.99')CF_INSURE,to_char(TRADE_LOSS,'9,999,999,999,990.99')TRADE_LOSS,to_char(TRADE_INSURE,'9,999,999,999,990.99')TRADE_INSURE,to_char(RETAIL_LOSS,'9,999,999,999,990.99')RETAIL_LOSS,to_char(RETAIL_INSURE,'9,999,999,999,990.99')RETAIL_INSURE,to_char(CB_LOSS,'9,999,999,999,990.99')CB_LOSS,to_char(CB_INSURE,'9,999,999,999,990.99')CB_INSURE,to_char(PS_LOSS,'9,999,999,999,990.99')PS_LOSS,to_char(PS_INSURE,'9,999,999,999,990.99')PS_INSURE,to_char(AG_LOSS,'9,999,999,999,990.99')AG_LOSS,to_char(AG_INSURE,'9,999,999,999,990.99')AG_INSURE,to_char(AM_LOSS,'9,999,999,999,990.99')AM_LOSS,to_char(AM_INSURE,'9,999,999,999,990.99')AM_INSURE,to_char(RB_LOSS,'9,999,999,999,990.99')RB_LOSS,to_char(RB_INSURE,'9,999,999,999,990.99')RB_INSURE from table(SUP0900_RPT_FUN('"+reptype+"','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','MUR'))");
				
		
			log.info("SUP0900S1 "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				XBRLSUP0900Bean xb=new XBRLSUP0900Bean();
				
					xb.setTypev(NullCheck.isNotNull(rs.getString("INSTANCE_NAME")));
					xb.setSrno(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
					xb.setAmlos(NullCheck.isNotNull(rs.getString("CF_LOSS")));
					xb.setInins(NullCheck.isNotNull(rs.getString("CF_INSURE")));
					xb.setAmlos1(NullCheck.isNotNull(rs.getString("TRADE_LOSS")));
					xb.setInins1(NullCheck.isNotNull(rs.getString("TRADE_INSURE")));
					xb.setAmlos2(NullCheck.isNotNull(rs.getString("RETAIL_LOSS")));
					xb.setInins2(NullCheck.isNotNull(rs.getString("RETAIL_INSURE")));
					xb.setAmlos3(NullCheck.isNotNull(rs.getString("CB_LOSS")));
					xb.setInins3(NullCheck.isNotNull(rs.getString("CB_INSURE")));
					xb.setAmlos4(NullCheck.isNotNull(rs.getString("PS_LOSS")));
					xb.setInins4(NullCheck.isNotNull(rs.getString("PS_INSURE")));
					xb.setAmlos5(NullCheck.isNotNull(rs.getString("AG_LOSS")));
					xb.setInins5(NullCheck.isNotNull(rs.getString("AG_INSURE")));
					xb.setAmlos6(NullCheck.isNotNull(rs.getString("AM_LOSS")));
					xb.setInins6(NullCheck.isNotNull(rs.getString("AM_INSURE")));
					xb.setAmlos7(NullCheck.isNotNull(rs.getString("RB_LOSS")));
					xb.setInins7(NullCheck.isNotNull(rs.getString("RB_INSURE")));

					
					
				
				
		
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



public ArrayList<XBRLSUP0900Bean> xbrlsup0900details(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLSUP0900Bean> arl = new ArrayList<XBRLSUP0900Bean>();
	
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
	

		sql.append("select TYPE_OF_EVENT,INSTANCE_CODE,to_char(CF_LOSS,'9,999,999,999,990.99')CF_LOSS,to_char(CF_INSURE,'9,999,999,999,990.99')CF_INSURE,to_char(TRADE_LOSS,'9,999,999,999,990.99')TRADE_LOSS,to_char(TRADE_INSURE,'9,999,999,999,990.99')TRADE_INSURE,to_char(RETAIL_LOSS,'9,999,999,999,990.99')RETAIL_LOSS,to_char(RETAIL_INSURE,'9,999,999,999,990.99')RETAIL_INSURE,to_char(CB_LOSS,'9,999,999,999,990.99')CB_LOSS,to_char(CB_INSURE,'9,999,999,999,990.99')CB_INSURE,to_char(PS_LOSS,'9,999,999,999,990.99')PS_LOSS,to_char(PS_INSURE,'9,999,999,999,990.99')PS_INSURE,to_char(AG_LOSS,'9,999,999,999,990.99')AG_LOSS,to_char(AG_INSURE,'9,999,999,999,990.99')AG_INSURE,to_char(AM_LOSS,'9,999,999,999,990.99')AM_LOSS,to_char(AM_INSURE,'9,999,999,999,990.99')AM_INSURE,to_char(RB_LOSS,'9,999,999,999,990.99')RB_LOSS,to_char(RB_INSURE,'9,999,999,999,990.99')RB_INSURE,TO_CHAR(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE from table(SUP0900_DTL_FUN('"+reptype+"','"+instno+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','MUR'))");
		

	log.info("SUP0900DETAILS"+sql.toString());
	
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		XBRLSUP0900Bean xb=new XBRLSUP0900Bean();
		
			
			xb.setTyeve(NullCheck.isNotNull(rs.getString("TYPE_OF_EVENT")));
			xb.setInco(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
			xb.setCfl(NullCheck.isNotNull(rs.getString("CF_LOSS")));
			xb.setCfi(NullCheck.isNotNull(rs.getString("CF_INSURE")));
			xb.setCfl1(NullCheck.isNotNull(rs.getString("TRADE_LOSS")));
			xb.setCfi1(NullCheck.isNotNull(rs.getString("TRADE_INSURE")));
			xb.setCfl2(NullCheck.isNotNull(rs.getString("RETAIL_LOSS")));
			xb.setCfi2(NullCheck.isNotNull(rs.getString("RETAIL_INSURE")));
			xb.setCfl3(NullCheck.isNotNull(rs.getString("CB_LOSS")));
			xb.setCfi3(NullCheck.isNotNull(rs.getString("CB_INSURE")));
			xb.setCfl4(NullCheck.isNotNull(rs.getString("PS_LOSS")));
			xb.setCfi4(NullCheck.isNotNull(rs.getString("PS_INSURE")));
			xb.setCfl5(NullCheck.isNotNull(rs.getString("AG_LOSS")));
			xb.setCfi5(NullCheck.isNotNull(rs.getString("AG_INSURE")));
			xb.setCfl6(NullCheck.isNotNull(rs.getString("AM_LOSS")));
			xb.setCfi6(NullCheck.isNotNull(rs.getString("AM_INSURE")));
			xb.setCfl7(NullCheck.isNotNull(rs.getString("RB_LOSS")));
			xb.setCfi7(NullCheck.isNotNull(rs.getString("RB_INSURE")));
			xb.setRedat(NullCheck.isNotNull(rs.getString("REPORT_DATE")));

			
			
				
				
		
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



public ArrayList<XBRLSUP0900Bean> xbrlsup0900(String reptype,String dt1,String dt2,String ReporefSeq,String instno,String curr) {
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLSUP0900Bean> arl = new ArrayList<XBRLSUP0900Bean>();
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
	
	sql.append("select TYPE_OF_EVENT,INSTANCE_CODE,to_char(CF_LOSS,'9,999,999,999,990.99')CF_LOSS,to_char(CF_INSURE,'9,999,999,999,990.99')CF_INSURE,to_char(TRADE_LOSS,'9,999,999,999,990.99')TRADE_LOSS,to_char(TRADE_INSURE,'9,999,999,999,990.99')TRADE_INSURE,to_char(RETAIL_LOSS,'9,999,999,999,990.99')RETAIL_LOSS,to_char(RETAIL_INSURE,'9,999,999,999,990.99')RETAIL_INSURE,to_char(CB_LOSS,'9,999,999,999,990.99')CB_LOSS,to_char(CB_INSURE,'9,999,999,999,990.99')CB_INSURE,to_char(PS_LOSS,'9,999,999,999,990.99')PS_LOSS,to_char(PS_INSURE,'9,999,999,999,990.99')PS_INSURE,to_char(AG_LOSS,'9,999,999,999,990.99')AG_LOSS,to_char(AG_INSURE,'9,999,999,999,990.99')AG_INSURE,to_char(AM_LOSS,'9,999,999,999,990.99')AM_LOSS,to_char(AM_INSURE,'9,999,999,999,990.99')AM_INSURE,to_char(RB_LOSS,'9,999,999,999,990.99')RB_LOSS,to_char(RB_INSURE,'9,999,999,999,990.99')RB_INSURE,TO_CHAR(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE from table(SUP0900_DTL_FUN('"+reptype+"','"+instno+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','MUR'))");
		
log.info("DOC&&&&SELECT Gayu"+sql.toString());
	
	try {
		
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		
		XBRLSUP0900Bean xb=new XBRLSUP0900Bean();
		xb.setTyeve(NullCheck.isNotNull(rs.getString("TYPE_OF_EVENT")));
		xb.setInco(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
		xb.setCfl(NullCheck.isNotNull(rs.getString("CF_LOSS")));
		xb.setCfi(NullCheck.isNotNull(rs.getString("CF_INSURE")));
		xb.setCfl1(NullCheck.isNotNull(rs.getString("TRADE_LOSS")));
		xb.setCfi1(NullCheck.isNotNull(rs.getString("TRADE_INSURE")));
		xb.setCfl2(NullCheck.isNotNull(rs.getString("RETAIL_LOSS")));
		xb.setCfi2(NullCheck.isNotNull(rs.getString("RETAIL_INSURE")));
		xb.setCfl3(NullCheck.isNotNull(rs.getString("CB_LOSS")));
		xb.setCfi3(NullCheck.isNotNull(rs.getString("CB_INSURE")));
		xb.setCfl4(NullCheck.isNotNull(rs.getString("PS_LOSS")));
		xb.setCfi4(NullCheck.isNotNull(rs.getString("PS_INSURE")));
		xb.setCfl5(NullCheck.isNotNull(rs.getString("AG_LOSS")));
		xb.setCfi5(NullCheck.isNotNull(rs.getString("AG_INSURE")));
		xb.setCfl6(NullCheck.isNotNull(rs.getString("AM_LOSS")));
		xb.setCfi6(NullCheck.isNotNull(rs.getString("AM_INSURE")));
		xb.setCfl7(NullCheck.isNotNull(rs.getString("RB_LOSS")));
		xb.setCfi7(NullCheck.isNotNull(rs.getString("RB_INSURE")));
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

public String detailSUP0900saves() {

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
