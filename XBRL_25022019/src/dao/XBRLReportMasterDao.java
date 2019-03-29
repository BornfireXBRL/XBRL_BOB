package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import bean.XBRLBOP0300Bean;
import bean.XBRLReportMasterBean;
import utilities.ConnectionManager;
import org.apache.log4j.Logger;
public class XBRLReportMasterDao {
	static Logger log = Logger.getLogger(XBRLReportMasterDao.class);
	public String upflg;
	public String getUpflg() {
		return upflg;
	}



	public void setUpflg(String upflg) {
		this.upflg = upflg;
	}



	/***********PDF HEADER FROM XBRL REPORT MASTER***************/
	public XBRLReportMasterBean xbrlsummarypdf(String ReporefSeq){
		ArrayList<XBRLReportMasterBean> arr=new ArrayList<XBRLReportMasterBean>();
		
		HttpServletRequest request=ServletActionContext.getRequest();
		ConnectionManager conmgr=new ConnectionManager();
		Connection conn=conmgr.getConnection();
		 XBRLReportMasterBean xb=new XBRLReportMasterBean();
		PreparedStatement ps=null;
		StringBuffer sql=new StringBuffer();
		
		sql.append("SELECT * FROM XBRL_REPORT_MASTER_TB WHERE REPORT_ID='"+ReporefSeq+"'");
		try {
			log.info(sql.toString());
			 ps=conn.prepareStatement(sql.toString());
			
			 ResultSet rs=ps.executeQuery();
			 while(rs.next()) {
				
				 xb.setRprtid(rs.getString("REPORT_ID"));
				 xb.setRptname(rs.getString("REPORT_NAME"));
				 xb.setRptfreq(rs.getString("REPORT_FREQUENCY"));
				 xb.setTaxver(rs.getString("XBRL_TAXONOMY_VERSION"));
				 xb.setInstcode(rs.getString("INSTITUTION_CODE"));
				 xb.setInstname(rs.getString("INSTITUTION_NAME"));
				 xb.setInstcat(rs.getString("INSTITUTION_CATEGORY"));
				 xb.setToolname(rs.getString("TOOL_NAME"));
				 xb.setToolver(rs.getString("TOOL_VERSION"));
				 
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
		return xb;
			
	}
	
	public XBRLReportMasterBean xbrlsumpdf(String ReporefSeq){
		ArrayList<XBRLReportMasterBean> arr=new ArrayList<XBRLReportMasterBean>();
		
		HttpServletRequest request=ServletActionContext.getRequest();
		ConnectionManager conmgr=new ConnectionManager();
		Connection conn=conmgr.getConnection();
		 XBRLReportMasterBean xb=new XBRLReportMasterBean();
		PreparedStatement ps=null;
		StringBuffer sql=new StringBuffer();
		
		sql.append("SELECT * FROM XBRL_REPORT_MASTER_TB WHERE REPORT_ID='"+ReporefSeq+"'");
		
		try {
			

			 ps=conn.prepareStatement(sql.toString());
			
			 ResultSet rs=ps.executeQuery();
			 while(rs.next()) {
				 
				 xb.setRprtid(rs.getString("REPORT_ID"));
				 xb.setRptname(rs.getString("REPORT_NAME"));
				 xb.setRptfreq(rs.getString("REPORT_FREQUENCY"));
				 xb.setTaxver(rs.getString("XBRL_TAXONOMY_VERSION"));
				 xb.setInstcode(rs.getString("INSTITUTION_CODE"));
				 xb.setInstname(rs.getString("INSTITUTION_NAME"));
				 xb.setInstcat(rs.getString("INSTITUTION_CATEGORY"));
				 xb.setToolname(rs.getString("TOOL_NAME"));
				 xb.setToolver(rs.getString("TOOL_VERSION"));
				
				 
				 
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
		return xb;
			
	}
	
	
	public String repupload() {
		
		HttpServletRequest request=ServletActionContext.getRequest();
		
		StringBuffer sql=new StringBuffer();
		PreparedStatement ps=null;
		ConnectionManager connmgr=new ConnectionManager();
		Connection con=connmgr.getConnection();
		sql.append("SELECT MANUAL_UPLD_ENABLE_FUN('"+request.getParameter("repid")+"') as FLG FROM DUAL");
		try {
			log.info(sql.toString());
			ps=con.prepareStatement(sql.toString());
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				upflg=rs.getString("FLG");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return "success";
	}
}
