package basecode;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import utilities.ConnectionManager;
import org.apache.log4j.Logger;
public class SequenceNumber {
	
	static Logger log = Logger.getLogger(SequenceNumber.class);
	
	private static Connection mconn;
	 private String slno;
	 
	 
	
	public String getSlno() {
		return slno;
	}



	public void setSlno(String slno) {
		this.slno = slno;
	}



	public String userSlnum(){
				
		PreparedStatement ps = null;
		StringBuffer sql = null;		
		sql = new StringBuffer();
		String sl="";
		int nxtsl=0;
		ConnectionManager connMgr = new ConnectionManager();		
		log.info("before get connection @ userSequenceNumbersFetch");
		mconn = connMgr.getConnection();
		
		try {
			sql = new StringBuffer();				
			sql.append("select MAX(SRL_NO) as USER_SLNO from USR order by SRL_NO");		
			log.info("Query := " + sql.toString());
			ps = mconn.prepareStatement(sql.toString());				  
			ResultSet rs = ps.executeQuery();
			if(rs != null){
				if (rs.next()) {						
					 sl = rs.getString("USER_SLNO");										
				}				
			} 	nxtsl=Integer.parseInt(sl)+1;				 
		} catch (Exception ex) {
			ex.printStackTrace();
		} 
		slno=Integer.toString(nxtsl);;
		log.info("return value USER_SLNO  := " + slno);
		return "success";
	}
	

	
}