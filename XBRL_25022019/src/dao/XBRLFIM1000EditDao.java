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

public class XBRLFIM1000EditDao {
	
	static Logger log = Logger.getLogger(XBRLFIM1000EditDao.class);
	
public String Reporef;





public String getReporef() {
	return Reporef;
}





public void setReporef(String reporef) {
	Reporef = reporef;
}





public ArrayList<XBRLFIM1000EditDao> ReporefSeq(){
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	
	
	ArrayList<XBRLFIM1000EditDao> arl = new ArrayList<XBRLFIM1000EditDao>();
	sql.append("select REPORT_REF_NO from FIM01000_MOD_TABLE GROUP BY REPORT_REF_NO ORDER BY REPORT_REF_NO");
	
	log.info("SELECTPROFILE"+sql.toString());
	
	try {
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
	
			XBRLFIM1000EditDao xel=new XBRLFIM1000EditDao();
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
	
	
	
	
	
	
}
