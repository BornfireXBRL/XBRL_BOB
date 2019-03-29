package utilities;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;

import utilities.ConnectionManager;
import org.apache.log4j.Logger;
public class SequenceNumber {

	static Logger log = Logger.getLogger(SequenceNumber.class);
	private static Connection mconn;
	
	public String entityrecordno(){
		log.info("entityrecordno");		
		PreparedStatement ps = null;
		StringBuffer sql = null;		
		sql = new StringBuffer();
		String entitySequenceNo="";	
		ConnectionManager connMgr = new ConnectionManager();		
		log.info("before get connection @ userSequenceNumbersFetch");
		mconn = connMgr.getConnection();
		
		try {
			sql = new StringBuffer();				
			sql.append("select ENTITY_ID.nextval as entity_id from dual");		
			log.info("Query := " + sql.toString());
			ps = mconn.prepareStatement(sql.toString());				  
			ResultSet rs = ps.executeQuery();
			if(rs != null){
				if (rs.next()) {						
					entitySequenceNo = rs.getString("entity_id");										
				}				
			} 					 
		} catch (Exception ex) {
			ex.printStackTrace();
		} 
		log.info("return value entitySequenceNo no := " + entitySequenceNo);
		return entitySequenceNo;
	}
	
	
	public String reporefno(){
		log.info("reporefno");		
		PreparedStatement ps = null;
		StringBuffer sql = null;		
		sql = new StringBuffer();
		String reporefSequenceNo="0";	
		/*ConnectionManager connMgr = new ConnectionManager();		
		log.info("before get connection @ userSequenceNumbersFetch");
		mconn = connMgr.getConnection();*/
		
/*		try {
			sql = new StringBuffer();				
			sql.append("select RR01.nextval as RR01 from dual");		
			log.info("Query := " + sql.toString());
			ps = mconn.prepareStatement(sql.toString());				  
			ResultSet rs = ps.executeQuery();
			if(rs != null){
				if (rs.next()) {						
					reporefSequenceNo = rs.getString("RR01");										
				}				
			} 					 
		} catch (Exception ex) {
			ex.printStackTrace();
		}*/ 
		log.info("return value entitySequenceNo no := " + reporefSequenceNo);
		return reporefSequenceNo;
	}
	
	
	
	
	public String FIMreporefno(){
		log.info("reporefno");		
		PreparedStatement ps = null;
		StringBuffer sql = null;		
		sql = new StringBuffer();
		String reporefSequenceNo="";	
		ConnectionManager connMgr = new ConnectionManager();		
		log.info("before get connection @ userSequenceNumbersFetch");
		mconn = connMgr.getConnection();
		
		try {
			sql = new StringBuffer();				
			sql.append("select FIMRR01.nextval as FIMRR01 from dual");		
			log.info("Query := " + sql.toString());
			ps = mconn.prepareStatement(sql.toString());				  
			ResultSet rs = ps.executeQuery();
			if(rs != null){
				if (rs.next()) {						
					reporefSequenceNo = rs.getString("FIMRR01");										
				}				
			} 					 
		} catch (Exception ex) {
			ex.printStackTrace();
		} 
		log.info("return value entitySequenceNo no := " + reporefSequenceNo);
		return reporefSequenceNo;
	}
	
	
	
	
	
	
	
}
