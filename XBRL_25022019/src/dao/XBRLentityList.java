package dao;


/****************************************************************************************************************
*																												*
* 	* @companyName 			:	Bonfire Innovation Private Limited Chennai										*
* 	* @project 				:	Extensible Business Reporting Language (XBRL)									*
* 	* @name 				:	XBRLSUP1400Action.java															*
* 	* @path 				:	action																			*
* 	* @author 				:	D PraveenBabu																	*
* 	* @version 				: 	1.0																				*
* 	* @functionality 		:	It contains the action with multiple methods to create SUP01400 Report.													*
* 	* @relatedScripts 		: 	bean.XBRLSUP1400Bean.java,dao.XBRLSUP1400Dao.java 								*
* 	* @creationDate 		:																					*
* 	* @lastModifiedDate 	:																					*
* 	* @modificationHistory 	: 																					*
*																												*
****************************************************************************************************************/

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;


import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;

public class XBRLentityList {
	static Logger log = Logger.getLogger(XBRLentityList.class);
	
public String XBRLRepFIM0300;
public String XBRLRepFIM0100;
	
public String entityId;





public String getXBRLRepFIM0300() {
	return XBRLRepFIM0300;
}


public void setXBRLRepFIM0300(String xBRLRepFIM0300) {
	XBRLRepFIM0300 = xBRLRepFIM0300;
}


public String getXBRLRepFIM0100() {
	return XBRLRepFIM0100;
}


public void setXBRLRepFIM0100(String xBRLRepFIM0100) {
	XBRLRepFIM0100 = xBRLRepFIM0100;
}


public String getEntityId() {
	return entityId;
}


public void setEntityId(String entityId) {
	this.entityId = entityId;
}





public ArrayList<XBRLentityList> entitylist(){
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	
	
	ArrayList<XBRLentityList> arl = new ArrayList<XBRLentityList>();
	sql.append("select REPORT_REF_NO from BOP0300_MOD_TABLE GROUP BY REPORT_REF_NO ORDER BY REPORT_REF_NO");
	
	log.info("SELECTPROFILE"+sql.toString());
	
	try {
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
	
			XBRLentityList xel=new XBRLentityList();
			xel.setEntityId(NullCheck.isNotNull(rs.getString("REPORT_REF_NO")));
	
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
	

	


public ArrayList<XBRLentityList> entitylistFIM0100(){
HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

String status = "";

ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();
PreparedStatement ps = null;
StringBuffer sql = new StringBuffer();


ArrayList<XBRLentityList> arl = new ArrayList<XBRLentityList>();
sql.append("select REPORT_REF_NO from FIM0100_MOD_TABLE GROUP BY REPORT_REF_NO ORDER BY REPORT_REF_NO");

log.info("SELECTPROFILE"+sql.toString());

try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){

		XBRLentityList xel=new XBRLentityList();
		xel.setEntityId(NullCheck.isNotNull(rs.getString("REPORT_REF_NO")));

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

	


public ArrayList<XBRLentityList> entitylistFIM0300(){
HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

String status = "";

ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();
PreparedStatement ps = null;
StringBuffer sql = new StringBuffer();


ArrayList<XBRLentityList> arl = new ArrayList<XBRLentityList>();
sql.append("select REPORT_REF_NO from FIM0300_MOD_TABLE GROUP BY REPORT_REF_NO ORDER BY REPORT_REF_NO");

log.info("SELECTPROFILE"+sql.toString());

try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){

		XBRLentityList xel=new XBRLentityList();
		xel.setEntityId(NullCheck.isNotNull(rs.getString("REPORT_REF_NO")));

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



public ArrayList<XBRLentityList> entitylistSUP0100(){
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	
	
	ArrayList<XBRLentityList> arl = new ArrayList<XBRLentityList>();
	sql.append("select REPORT_REF_NO from SUP0100_MOD_TABLE GROUP BY REPORT_REF_NO ORDER BY REPORT_REF_NO");
	
	log.info("SELECTPROFILE"+sql.toString());
	
	try {
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
	
			XBRLentityList xel=new XBRLentityList();
			xel.setEntityId(NullCheck.isNotNull(rs.getString("REPORT_REF_NO")));
	
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





public ArrayList<XBRLentityList> entitylistSUP1400(){
HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

String status = "";

ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();
PreparedStatement ps = null;
StringBuffer sql = new StringBuffer();


ArrayList<XBRLentityList> arl = new ArrayList<XBRLentityList>();
sql.append("select REPORT_REF_NO from SUP1400_MOD_TABLE GROUP BY REPORT_REF_NO ORDER BY REPORT_REF_NO");

log.info("SELECTPROFILE"+sql.toString());

try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){

		XBRLentityList xel=new XBRLentityList();
		xel.setEntityId(NullCheck.isNotNull(rs.getString("REPORT_REF_NO")));

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





public ArrayList<XBRLentityList> entitylistDCG0100(){
HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

String status = "";

ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();
PreparedStatement ps = null;
StringBuffer sql = new StringBuffer();


ArrayList<XBRLentityList> arl = new ArrayList<XBRLentityList>();
sql.append("select REPORT_REF_NO from DCG0100_MOD_TABLE GROUP BY REPORT_REF_NO ORDER BY REPORT_REF_NO");

log.info("SELECTPROFILE"+sql.toString());

try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){

		XBRLentityList xel=new XBRLentityList();
		xel.setEntityId(NullCheck.isNotNull(rs.getString("REPORT_REF_NO")));

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






public ArrayList<XBRLentityList> entitylistFIM0800(){
HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

String status = "";

ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();
PreparedStatement ps = null;
StringBuffer sql = new StringBuffer();


ArrayList<XBRLentityList> arl = new ArrayList<XBRLentityList>();
sql.append("select REPORT_REF_NO from FIM0800_MOD_TABLE GROUP BY REPORT_REF_NO ORDER BY REPORT_REF_NO");

log.info("SELECTPROFILE"+sql.toString());

try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){

		XBRLentityList xel=new XBRLentityList();
		xel.setEntityId(NullCheck.isNotNull(rs.getString("REPORT_REF_NO")));

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



}
