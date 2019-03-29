package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;

import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRLMenuDao {
	
	static Logger log = Logger.getLogger(XBRLMenuDao.class);
    
	private String reportId;
	private String subReportId;
	private String reportName;
	private String subReportName;
	private String subReportFlg;
	private String frquency;
	private String menulist;
	private String domainId;
	
public String getReportDeatails(){
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		ArrayList<XBRLMenuDao> arl = new ArrayList<XBRLMenuDao>();
		String status = "";
		log.info("fffffffffffffffffffffffff");
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();
		
	
	
		sql.append("SELECT REPORT_ID,SUB_REPORT,SUB_REPORT_NAME,REPORT_NAME,REPORT_FREQUENCY,SUB_REPORT_FLG, DOMAIN_ID FROM MENU_VIEW");
		
		log.info("SELECTPROFILE"+sql.toString());
		
		try {
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				
				XBRLMenuDao xmd=new XBRLMenuDao();
			
				xmd.setReportId(NullCheck.isNotNull(rs.getString("REPORT_ID")));
				xmd.setSubreportId(NullCheck.isNotNull(rs.getString("SUB_REPORT")));
				xmd.setReportName(NullCheck.isNotNull(rs.getString("REPORT_NAME")));
				xmd.setSubreportName(NullCheck.isNotNull(rs.getString("SUB_REPORT_NAME")));
				xmd.setFrquency(NullCheck.isNotNull(rs.getString("REPORT_FREQUENCY")));
				xmd.setSubReportFlg(NullCheck.isNotNull(rs.getString("SUB_REPORT_FLG")));
				xmd.setDomainId(NullCheck.isNotNull(rs.getString("DOMAIN_ID")));
				arl.add(xmd);
		
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
		
		Gson gson=new Gson();
		menulist =gson.toJson(arl);
		return "success";
	}	
	
	public String getReportId() {
		return reportId;
	}
	public String getSubReportId() {
		return subReportId;
	}

	public void setSubReportId(String subReportId) {
		this.subReportId = subReportId;
	}

	public String getSubReportName() {
		return subReportName;
	}

	public void setSubReportName(String subReportName) {
		this.subReportName = subReportName;
	}

	public String getDomainId() {
		return domainId;
	}

	public void setDomainId(String domainId) {
		this.domainId = domainId;
	}

	public void setReportId(String reportId) {
		this.reportId = reportId;
	}
	
	public String getSubreportId() {
		return subReportId;
	}
	public void setSubreportId(String subReportId) {
		this.subReportId = subReportId;
	}
	
	public String getReportName() {
		return reportName;
	}
	public void setReportName(String reportName) {
		this.reportName = reportName;
	}
	
	public String getSubreportName() {
		return subReportName;
	}
	public void setSubreportName(String subReportName) {
		this.subReportName = subReportName;
	}
	
	public String getFrquency() {
		return frquency;
	}

	public void setFrquency(String frquency) {
		this.frquency = frquency;
	}

	public String getSubReportFlg() {
		return subReportFlg;
	}

	public void setSubReportFlg(String subReportFlg) {
		this.subReportFlg = subReportFlg;
	}

	public String getMenulist() {
		return menulist;
	}

	public void setMenulist(String menulist) {
		this.menulist = menulist;
	}
	
	
	
public String getReportarch(){
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		String status = "";
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();
		
		
		ArrayList<XBRLMenuDao> arl = new ArrayList<XBRLMenuDao>();
		sql.append("SELECT REPORT_ID,SUB_REPORT,SUB_REPORT_NAME,REPORT_NAME,REPORT_FREQUENCY,SUB_REPORT_FLG, DOMAIN_ID FROM MENU_H_VIEW");
		
		log.info("SELECTPROFILE"+sql.toString());
		
		try {
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
		
				XBRLMenuDao xmd=new XBRLMenuDao();
				xmd.setReportId(NullCheck.isNotNull(rs.getString("REPORT_ID")));
				xmd.setSubreportId(NullCheck.isNotNull(rs.getString("SUB_REPORT")));
				xmd.setReportName(NullCheck.isNotNull(rs.getString("REPORT_NAME")));
				xmd.setSubreportName(NullCheck.isNotNull(rs.getString("SUB_REPORT_NAME")));
				xmd.setFrquency(NullCheck.isNotNull(rs.getString("REPORT_FREQUENCY")));
				xmd.setSubReportFlg(NullCheck.isNotNull(rs.getString("SUB_REPORT_FLG")));
				xmd.setDomainId(NullCheck.isNotNull(rs.getString("DOMAIN_ID")));
		
		arl.add(xmd);
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
		
		Gson gson=new Gson();
		menulist =gson.toJson(arl);
		return "success";
	}	
}
