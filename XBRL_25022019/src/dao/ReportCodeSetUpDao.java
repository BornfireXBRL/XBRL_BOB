package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import basecode.DateFormat;

import bean.XBRLReportCodeSetUpBean;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class ReportCodeSetUpDao {
	
	static Logger log = Logger.getLogger(ReportCodeSetUpDao.class);
	
	public ArrayList<XBRLReportCodeSetUpBean> selectReportId() {
		
		ArrayList<XBRLReportCodeSetUpBean> arl = new ArrayList<XBRLReportCodeSetUpBean>();

		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();

		
		sql.append("select distinct RPT_NO FROM XBRL_RRC_MAP_TABLE where RPT_NO IS NOT NULL  order by RPT_NO asc  ");
	     
		try {
			log.info(sql.toString());
			ps = conn.prepareStatement(sql.toString());
			ResultSet rs = ps.executeQuery();
		

			while (rs.next()) {
				
			
				XBRLReportCodeSetUpBean rmb = new XBRLReportCodeSetUpBean();
				rmb.setReportNo(NullCheck.isNotNull(rs.getString("RPT_NO")));
				
				arl.add(rmb);
		
				
			}
			

		} catch (SQLException e) {
			
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
	
	public ArrayList<XBRLReportCodeSetUpBean> detReportsetup(String  reportId) {
		
		ArrayList<XBRLReportCodeSetUpBean> arl = new ArrayList<XBRLReportCodeSetUpBean>();

		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();
		DateFormat df=new DateFormat();
		 
		
			
			sql.append(" SELECT RRCM.RPT_LEVEL,RRCM.RPT_REF_CODE,RRCM.RPT_REF_DESC_1,RRCM.CUST_ID,RRCM.ACCT_NO,RRCM.SCH_CODE,RRCM.GLSL_CODE,ACBAL.EAB_DATE REPORT_DATE, ACBAL.EAB_BAL ACCT_BAL  FROM XBRL_RRC_MAP_TABLE RRCM JOIN XBRL_ACCT_BAL_TB ACBAL ON RRCM.ACCT_NO=ACBAL.ACCT_NO WHERE RPT_NO='"+reportId+"'");
		
			log.info("report code set up"+sql.toString());
		try {
			ps = conn.prepareStatement(sql.toString());
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				XBRLReportCodeSetUpBean jeb = new XBRLReportCodeSetUpBean();
				jeb.setLevel(NullCheck.isNotNull(rs.getString("RPT_LEVEL")));
				jeb.setCode(NullCheck.isNotNull(rs.getString("RPT_REF_CODE")));
				jeb.setDesc(NullCheck.isNotNull(rs.getString("RPT_REF_DESC_1")));
				jeb.setCustId(NullCheck.isNotNull(rs.getString("CUST_ID")));
				jeb.setAcctNo(NullCheck.isNotNull(rs.getString("ACCT_NO")));
				jeb.setSchemeCode(NullCheck.isNotNull(rs.getString("SCH_CODE")));
				jeb.setGlsh(NullCheck.isNotNull(rs.getString("GLSL_CODE")));
			    jeb.setReportDate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
				jeb.setAcctBal(NullCheck.isNotNull(rs.getString("ACCT_BAL")));
				
				
				arl.add(jeb);

			}
			
		} catch (SQLException e) {
			
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
