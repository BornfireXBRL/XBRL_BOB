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

import bean.XBRLBOP0300Bean;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRLBOP0300ArchivalDao {

	static Logger log = Logger.getLogger(XBRLBOP0300ArchivalDao.class);

public ArrayList<XBRLBOP0300Bean> repdate(){
	ArrayList<XBRLBOP0300Bean> repdate=new ArrayList<XBRLBOP0300Bean>();
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();

	PreparedStatement ps = null;

	StringBuffer sql = new StringBuffer();

	
	
	sql.append("SELECT DISTINCT to_char(AS_ON_DATE,'DD-MM-YYYY')AS_ON_DATE,REPORT_REF_NO FROM BOP0300_MAST_H_TABLE");
	try {
		log.info(sql.toString());
		ps=conn.prepareStatement(sql.toString());
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			XBRLBOP0300Bean arb=new XBRLBOP0300Bean();
			arb.setRepdate(NullCheck.isNotNull(rs.getString("AS_ON_DATE")));
			arb.setReprefno(NullCheck.isNotZero(rs.getString("REPORT_REF_NO")));
			
			repdate.add(arb);
		}
		
	}catch(SQLException e) {
		e.printStackTrace();
	}
	
	return repdate;
}
}
