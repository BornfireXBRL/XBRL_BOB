package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import basecode.DateFormat;
import bean.XBRLSUP0101Bean;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRLSUP0101Dao {
	static Logger log = Logger.getLogger(XBRLSUP0101Dao.class);
	public String sup0101Formins(ArrayList<XBRLSUP0101Bean> arl,String type) {
		String status="";
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		PreparedStatement ps = null;
		if(type.equals("modify")) {
			sup0101Formdel(request.getParameter("dt2"));
		}
		StringBuffer sql = new StringBuffer();
		DateFormat df=new DateFormat();		
		
		Iterator<XBRLSUP0101Bean> it=arl.iterator();

		
		      while(it.hasNext()){
		    	  sql.setLength(0);
		    	  XBRLSUP0101Bean sbn=it.next();
		    	  
		sql.append("INSERT INTO SUP0101_MAST_TABLE(REPORT_DATE,ADDRESS,LOCATION,NO_OF_ATMS,DEL_FLG,RCRE_USER_ID,RCRE_TIME,LCHG_USER_ID,LCHG_TIME)  VALUES('"+df.formatdate(NullCheck.isNotNull(request.getParameter("dt2")))+"','"+NullCheck.isNotNull(sbn.getAdrs())+"','"+NullCheck.isNotNull(sbn.getLcn())+"','"+NullCheck.isNotNull(sbn.getNofatm())+"','N','"+NullCheck.isNotNull(session.getAttribute("userName").toString())+"',SYSDATE,'"+NullCheck.isNotNull(session.getAttribute("userName").toString())+"',SYSDATE)");
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			int rs=ps.executeUpdate();
			if(rs>0) {
				status="success";
			}else {
				status="error";
			}
			
		}catch (SQLException e) {
			status="error";
			e.printStackTrace();
		} /*finally {

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
		}*/
		
		      }
		return status;
	}

	public String sup0101Formdel(String Date) {
		String status="";
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();
		DateFormat df=new DateFormat();
		sql.append("DELETE  FROM SUP0101_MAST_TABLE WHERE REPORT_DATE='"+NullCheck.isNotNull(df.formatdate(Date))+"'");
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			int rs=ps.executeUpdate();
			if(rs>0) {
				status="success";
			}else {
				status="error";
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return status;
	}
	
	
	public ArrayList<XBRLSUP0101Bean> sup0101Formselect(String Date) {
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		ArrayList<XBRLSUP0101Bean> arr=new ArrayList<XBRLSUP0101Bean>();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();
		DateFormat df=new DateFormat();
	sql.setLength(0);
sql.append("SELECT * FROM SUP0101_MAST_TABLE WHERE REPORT_DATE='"+NullCheck.isNotNull(df.formatdate(Date))+"'");
try {
	log.info(sql.toString());
	ps=conn.prepareStatement(sql.toString());
	ResultSet rs=ps.executeQuery();
	while(rs.next()) {
		XBRLSUP0101Bean sbn=new XBRLSUP0101Bean();
		sbn.setAdrs(NullCheck.isNotNull(rs.getString("ADDRESS")));
		sbn.setLcn(NullCheck.isNotNull(rs.getString("LOCATION")));
		sbn.setNofatm(NullCheck.isNotNull(rs.getString("NO_OF_ATMS")));
		arr.add(sbn);
	}
}catch(SQLException e) {
	e.printStackTrace();
}
		return arr;
	}
/*detailSUP0101saves*/
	
	
	public String detailSUP0101saves() {
		
		

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
