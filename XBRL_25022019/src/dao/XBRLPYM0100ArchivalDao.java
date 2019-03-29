package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import basecode.DateFormat;
import bean.XBRLPYM0100ArchivalBean;
import bean.XBRLPYM0100Bean;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRLPYM0100ArchivalDao {

	static Logger log = Logger.getLogger(XBRLPYM0100ArchivalDao.class);

public ArrayList<XBRLPYM0100Bean> repdate(){
	ArrayList<XBRLPYM0100Bean> repdate=new ArrayList<XBRLPYM0100Bean>();
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();

	PreparedStatement ps = null;

	StringBuffer sql = new StringBuffer();

	
	
	sql.append("SELECT DISTINCT to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,REPORT_REF_NO FROM PYM0100_MAST_H_TABLE");
	try {
		log.info(sql.toString());
		ps=conn.prepareStatement(sql.toString());
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			XBRLPYM0100Bean arb=new XBRLPYM0100Bean();
			arb.setRepdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
			arb.setReprefno(NullCheck.isNotZero(rs.getString("REPORT_REF_NO")));
			
			repdate.add(arb);
		}
		
	}catch(SQLException e) {
		e.printStackTrace();
	}
	
	return repdate;
}
}
