package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import bean.XBRL_CONFIGBean;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRL_CONFIGDao {
	
	static Logger log = Logger.getLogger(XBRL_CONFIGDao.class);

	public ArrayList<XBRL_CONFIGBean> refcodetype() throws SQLException{
		ArrayList<XBRL_CONFIGBean> arr=new ArrayList<XBRL_CONFIGBean>();
		ConnectionManager connmgr=new ConnectionManager();
		Connection conn=connmgr.getConnection();
		StringBuffer sql=new StringBuffer();
		PreparedStatement ps=null;
		
		sql.append("SELECT * FROM GEN_REF_CODE_DESC_TB");
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				XBRL_CONFIGBean cnb=new XBRL_CONFIGBean();
				cnb.setRefcode(NullCheck.isNotNull(rs.getString("REF_CODE_TYPE")));
				cnb.setRefdesc(rs.getString("REF_CODE_TYPE_DESC"));
				cnb.setRefcodeview(NullCheck.isNotNull(rs.getString("REF_CODE_VIEW")));
				arr.add(cnb);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return arr;
		
	}
	
	public ArrayList<XBRL_CONFIGBean> refcodearr(String refcodetype){
		
		ArrayList<XBRL_CONFIGBean> arl=new ArrayList<XBRL_CONFIGBean>();
		ConnectionManager conmgr= new ConnectionManager();
		Connection conn=conmgr.getConnection();
		PreparedStatement ps=null;
		StringBuffer sql=new StringBuffer();
		sql.append("SELECT DISTINCT REF_CODE, REF_CODE_DESC FROM "+refcodetype+"");
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				XBRL_CONFIGBean cnb=new XBRL_CONFIGBean();
				cnb.setRefcode(NullCheck.isNotNull(rs.getString("REF_CODE")));
				cnb.setRefdesc(NullCheck.isNotNull(rs.getString("REF_CODE_DESC")));
				arl.add(cnb);
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return arl;
	}
	
public ArrayList<XBRL_CONFIGBean> refcodelist(){
		
		ArrayList<XBRL_CONFIGBean> arl=new ArrayList<XBRL_CONFIGBean>();
		HttpServletRequest request=ServletActionContext.getRequest();
		ConnectionManager conmgr= new ConnectionManager();
		Connection conn=conmgr.getConnection();
		PreparedStatement ps=null;
		StringBuffer sql=new StringBuffer();
		sql.append("SELECT * FROM "+request.getParameter("refcodeview")+" WHERE REF_CODE='"+request.getParameter("refcode")+"'");
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				XBRL_CONFIGBean cnb=new XBRL_CONFIGBean();
				cnb.setRefcode(NullCheck.isNotNull(rs.getString("REF_CODE")));
				cnb.setRefdesc(NullCheck.isNotNull(rs.getString("REF_CODE_DESC")));
				cnb.setSrcsyscode(NullCheck.isNotNull(rs.getString("SOURCE_SYS_CODE")));
				arl.add(cnb);
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return arl;
	}

public String syscodeupdate() {
	String status="";
	HttpServletRequest request=ServletActionContext.getRequest();
	ConnectionManager conmgr= new ConnectionManager();
	Connection conn=conmgr.getConnection();
	PreparedStatement ps=null;
	StringBuffer sql=new StringBuffer();
	sql.append("UPDATE GEN_REF_CODE_MAST_TB SET SOURCE_SYS_CODE='"+request.getParameter("syscode")+"' WHERE REF_CODE_TYPE='"+request.getParameter("refcodetyp")+"' AND REF_CODE='"+request.getParameter("refcode")+"'");
	try {
			log.info(sql.toString());
		ps=conn.prepareStatement(sql.toString());
		ResultSet rs=ps.executeQuery();
		status="success";
	}catch(SQLException e) {
		status="error";
		e.printStackTrace();
	}
	return status;
}
}
