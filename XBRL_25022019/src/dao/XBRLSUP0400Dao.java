package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import basecode.DateFormat;
import bean.XBRLSUP0400Bean;
import bean.XBRLSUP0400Bean;
import bean.XBRLSUP0400Bean;
import bean.XBRLSUP0400Bean;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRLSUP0400Dao {
	static Logger log = Logger.getLogger(XBRLSUP0400Dao.class);
	
	
	
	
	public String Reporef;
	
	public String getReporef() {
		return Reporef;
	}

	public void setReporef(String reporef) {
		Reporef = reporef;
	}
	
	public String cnt;
	public String getCnt() {
		return cnt;
	}

	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	public int cnt1;
	public int getCnt1() {
		return cnt1;
	}

	public void setCnt1(int cnt1) {
		this.cnt1 = cnt1;
	}
	public ArrayList<XBRLSUP0400Dao> ReporefSeq(String dt1, String dt2) {

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();

		String status = "";

		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();
		DateFormat df = new DateFormat();
		dt1 = df.formatdate(dt1);
		dt2 = df.formatdate(dt2);

		ArrayList<XBRLSUP0400Dao> arl = new ArrayList<XBRLSUP0400Dao>();
		sql.append("select REPORT_REF_NO from SUP0400_MOD_TABLE where REPORT_DATE='" + dt2 + "' ORDER BY REPORT_REF_NO");

		log.info("SELECTPROFILE" + sql.toString());

		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLSUP0400Dao xel = new XBRLSUP0400Dao();
				xel.setReporef(NullCheck.isNotNull(rs.getString("REPORT_REF_NO")));

				arl.add(xel);
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

	
	public String SUP0400chckmodified() {

		HttpServletRequest request = ServletActionContext.getRequest();
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		HttpSession session = request.getSession();
		StringBuffer sql = new StringBuffer();
		DateFormat df=new DateFormat();		
		sql.setLength(0);
		if(request.getParameter("type").equals("chkuser")) {
			sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM SUP0400_MOD_TABLE ");
			log.info("bj"+sql.toString());
			}else {
				sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM SUP0400_MOD_TABLE ");
				log.info("bh"+sql.toString());
		}
		
		
		try {
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		      while(rs.next()) {
		    	  cnt=NullCheck.isNotZero(rs.getString("CNT"));
   	
		    	
		      }
		    
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return "success";
	}
	

	public String detailSUP0400savecheck() {
	ConnectionManager connmgr=new ConnectionManager();
	Connection conn=connmgr.getConnection();
	ArrayList<String> arl = new ArrayList<String>();
			HttpServletRequest request = ServletActionContext.getRequest();
			DateFormat df = new DateFormat();
			StringBuffer sql = new StringBuffer();
			PreparedStatement ps = null;
			
			sql.append("SELECT COUNT(REPORT_DATE) as repdate FROM SUP0400_S1_RPT_TB where REPORT_ID = '"+request.getParameter("reptype")+"' AND  REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ");
			 log.info(sql.toString());
				
				try {
					ps = conn.prepareStatement(sql.toString());
					ResultSet rs = ps.executeQuery();
				

					while (rs.next()) {
						
						cnt1=rs.getInt("repdate");
					
					}
					log.info("fdsafdsaf"+cnt1);

					
				
				
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

				return "success";

			}
	
	public String detailSUP0400saves() {

		ConnectionManager connmgr=new ConnectionManager();
		Connection conn=connmgr.getConnection();
				HttpServletRequest request = ServletActionContext.getRequest();
				DateFormat df = new DateFormat();
				log.info("{call FINAL_REPORT_UPDATE_SP('"+request.getParameter("reptype")+"','"+NullCheck.isNotZero(request.getParameter("refno"))+"','"+df.formatdate(request.getParameter("dt2"))+"','"+df.formatdate(request.getParameter("dt1"))+"','"+df.formatdate(request.getParameter("dt2"))+"','"+request.getParameter("curr")+"')}");
				
				try {
				

					CallableStatement pstmt = conn.prepareCall("{call FINAL_REPORT_UPDATE_SP(?,?,?,?,?,?)}");
					pstmt.setString(1, request.getParameter("reptype"));
					pstmt.setString(2, NullCheck.isNotZero(request.getParameter("refno")));
					pstmt.setString(3, df.formatdate(request.getParameter("dt2")));
					pstmt.setString(4, df.formatdate(request.getParameter("dt1")));
					pstmt.setString(5, df.formatdate(request.getParameter("dt2")));
					pstmt.setString(6, request.getParameter("curr"));

					pstmt.executeUpdate();

					pstmt.close();
					conn.close();

				} catch (SQLException e) {

					e.printStackTrace();
				} finally {

					if (conn != null) {
						try {
							conn.close();
						} catch (SQLException e) {

						}
					}
				}
				return "success";
			}
	
	public ArrayList<XBRLSUP0400Bean> xbrlsup400(String dt1,String dt2,String ReporefSeq,String instno,String curr) {
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLSUP0400Bean> arl = new ArrayList<XBRLSUP0400Bean>();
		NullCheck chk=new NullCheck();
		
		
		String status = "";
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		
		PreparedStatement ps = null;
		
		StringBuffer sql = new StringBuffer();
		
		
		DateFormat df=new DateFormat();
		
		dt1 =df.formatdate(dt1);
		dt2 =df.formatdate(dt2);
		
		sql.append("select GROUP_NAME,GROUP_ID,PARTY_NAME,UNIQUE_ID,TYPE_OF_PARTY,RELATIONSHIP,PURPOSE,to_char(APPROVAL_DATE,'dd-mm-yyyy')APPROVAL_DATE,ORIGINAL_CURRENCY,to_char(SANCT_AMT_ACCT_CRNCY_FB,'9,999,999,999,990.99')SANCT_AMT_ACCT_CRNCY_FB,to_char(SANCT_AMT_ACCT_CRNCY_NFB,'9,999,999,999,990.99')SANCT_AMT_ACCT_CRNCY_NFB,to_char(OUT_AMT_ACCT_CRNCY_FB,'9,999,999,999,990.99')OUT_AMT_ACCT_CRNCY_FB,to_char(OUT_AMT_ACCT_CRNCY_NFB,'9,999,999,999,990.99')OUT_AMT_ACCT_CRNCY_NFB,to_char(NUMERATOR,'9,999,999,999,990.99')NUMERATOR,NO_OF_ARREAR_DAYS,to_char(INT_RATE,'9,999,999,999,990.99')INT_RATE,REMAINING_MATURY_DAYS,COLLATERAL_TYPE,COLLATERAL_DESC,to_char(LAST_VALUATION_DATE,'dd-mm-yyyy')LAST_VALUATION_DATE,to_char(VALUE,'9,999,999,999,990.99')VALUE,to_char(REPORT_DATE,'dd-mm-yyyy')REPORT_DATE from table(SUP0400_DTL_FUN('SUP0400','"+ReporefSeq+"','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','MUR'))");
			
log.info("DOC&&&&SELECT Gayu"+sql.toString());
		
		try {
			
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			
			XBRLSUP0400Bean xb=new XBRLSUP0400Bean();
			
			xb.setGroupName(NullCheck.isNotNull(rs.getString("GROUP_NAME")));
			xb.setGroupId(NullCheck.isNotNull(rs.getString("GROUP_ID")));
			xb.setPartyName(NullCheck.isNotNull(rs.getString("PARTY_NAME")));
			xb.setUniqueId(NullCheck.isNotNull(rs.getString("UNIQUE_ID")));
			xb.setTypeofParty(NullCheck.isNotNull(rs.getString("TYPE_OF_PARTY")));
			xb.setRelationship(NullCheck.isNotNull(rs.getString("RELATIONSHIP")));
			xb.setPurpose(NullCheck.isNotNull(rs.getString("PURPOSE")));
			xb.setApprovalDate(NullCheck.isNotNull(rs.getString("APPROVAL_DATE")));
			xb.setOriginalCurrency(NullCheck.isNotNull(rs.getString("ORIGINAL_CURRENCY")));
			xb.setSancamtcurfb(NullCheck.isNotNull(rs.getString("SANCT_AMT_ACCT_CRNCY_FB")));
			xb.setSancamtcurnfb(NullCheck.isNotNull(rs.getString("SANCT_AMT_ACCT_CRNCY_NFB")));
			xb.setOutamtcurfb(NullCheck.isNotNull(rs.getString("OUT_AMT_ACCT_CRNCY_FB")));
			xb.setOutamtcurnfb(NullCheck.isNotNull(rs.getString("OUT_AMT_ACCT_CRNCY_NFB")));
		
			xb.setNumerator(NullCheck.isNotNull(rs.getString("NUMERATOR")));
			xb.setNoofarrears(NullCheck.isNotNull(rs.getString("NO_OF_ARREAR_DAYS")));
			xb.setIntRate(NullCheck.isNotNull(rs.getString("INT_RATE")));
			xb.setRemainingMaturityDays(NullCheck.isNotNull(rs.getString("REMAINING_MATURY_DAYS")));
			xb.setCollateralType(NullCheck.isNotNull(rs.getString("COLLATERAL_TYPE")));
			xb.setCollateralDesc(NullCheck.isNotNull(rs.getString("COLLATERAL_DESC")));
			xb.setLastValuationDate(NullCheck.isNotNull(rs.getString("LAST_VALUATION_DATE")));
			xb.setValue(NullCheck.isNotNull(rs.getString("VALUE")));
			xb.setReportDate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
		
			
		
			
			
			
			 arl.add(xb);
		}
		}catch(SQLException e){
			e.printStackTrace();
		}
			
		
		finally {

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
	
public ArrayList<XBRLSUP0400Bean> xbrlsup0400(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
		
		
		
		HttpServletRequest request = ServletActionContext.getRequest();
		
		
		ArrayList<XBRLSUP0400Bean> arl = new ArrayList<XBRLSUP0400Bean>();
		
		
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		
		PreparedStatement ps = null;
		
		StringBuffer sql = new StringBuffer();
		
		
		DateFormat df=new DateFormat();		
		dt1 =df.formatdate(dt1);
		dt2 =df.formatdate(dt2);
		
		 DecimalFormat dfs = new DecimalFormat("##,##.00");  
		 NullCheck chk=new NullCheck();
	
		try {
		
				
				sql.append("select INSTANCE_NAME,INSTANCE_CODE,to_char(AMT,'9,999,999,999,990.99')AMT,to_char(PERCENTAGE,'9,999,999,999,990.99')PERCENTAGE from table(SUP0400_S1_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','MUR'))");
				
		
			log.info("sup0400s1 "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				XBRLSUP0400Bean xb=new XBRLSUP0400Bean();
				
					xb.setInstName(NullCheck.isNotNull(rs.getString("INSTANCE_NAME")));
					xb.setInstCode(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
					xb.setAmt(NullCheck.isNotNull(rs.getString("AMT")));
					xb.setPercentage(NullCheck.isNotNull(rs.getString("PERCENTAGE")));
				
			
			
				arl.add(xb);
			   
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

public ArrayList<XBRLSUP0400Bean> xbrlsup0400section2(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	
	
	ArrayList<XBRLSUP0400Bean> arl = new ArrayList<XBRLSUP0400Bean>();
	
	
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	 DecimalFormat dfs = new DecimalFormat("##,##.00");  
	 NullCheck chk=new NullCheck();

	try {
	
			
			sql.append("select * from table(SUP0400_S2_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','MUR'))");
			
	
		log.info("sup0400s2 "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLSUP0400Bean xb=new XBRLSUP0400Bean();
			
				xb.setSlNo(NullCheck.isNotNull(rs.getString("SL_NO")));
				xb.setGroupName(NullCheck.isNotNull(rs.getString("GROUP_NAME")));
				xb.setGroupId(NullCheck.isNotNull(rs.getString("GROUP_ID")));
				xb.setPartyName(NullCheck.isNotNull(rs.getString("PARTY_NAME")));
				xb.setUniqueId(NullCheck.isNotNull(rs.getString("UNIQUE_ID")));
			
		
		
			arl.add(xb);
		   
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
	
public ArrayList<XBRLSUP0400Bean> xbrlsup0400section3(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	
	
	ArrayList<XBRLSUP0400Bean> arl = new ArrayList<XBRLSUP0400Bean>();
	
	
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	 DecimalFormat dfs = new DecimalFormat("##,##.00");  
	 NullCheck chk=new NullCheck();

	try {
	
			
			sql.append("select DYNAMIC_DOMAIN,PARTY_SL_NO,TRAN_SL_NO,GROUP_NAME,GROUP_ID,PARTY_NAME,UNIQUE_ID,TYPE_OF_PARTY,RELATIONSHIP,PURPOSE,to_char(APPROVAL_DATE,'dd-mm-yyyy')APPROVAL_DATE,ORIGINAL_CURRENCY,to_char(AMT_ORIGINAL_CURR,'9,999,999,999,990.99')AMT_ORIGINAL_CURR,to_char(FB_AMT_REPOR_CURR,'9,999,999,999,990.99')FB_AMT_REPOR_CURR,to_char(NFB_AMT_REPORT_CURR,'9,999,999,999,990.99')NFB_AMT_REPORT_CURR,to_char(OUT_AMT_ORIGINAL_CURR,'9,999,999,999,990.99')OUT_AMT_ORIGINAL_CURR,to_char(FB_OUT_AMT_REPORT_CURR,'9,999,999,999,990.99')FB_OUT_AMT_REPORT_CURR,to_char(NFB_OUT_AMT_REPORT_CURR,'9,999,999,999,990.99')NFB_OUT_AMT_REPORT_CURR,to_char(NUMERATOR,'9,999,999,999,990.99')NUMERATOR,to_char(TIER1_PERCENTAGE,'9,999,999,999,990.99')TIER1_PERCENTAGE,NO_OF_ARREAR_DAYS,to_char(INT_RATE,'9,999,999,999,990.99')INT_RATE,REMAINING_MATURY_DAYS,COLLATERAL_TYPE_1,COLLATERAL_DESC_1,to_char(LAST_VALUATION_DATE_1,'dd-mm-yyyy')LAST_VALUATION_DATE_1,to_char(VALUE_1,'9,999,999,999,990.99')VALUE_1 from table(SUP0400_S3_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','MUR'))");
			
	
		log.info("sup0400s3 "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLSUP0400Bean xb=new XBRLSUP0400Bean();
			     
			    xb.setDyndom(NullCheck.isNotNull(rs.getString("DYNAMIC_DOMAIN")));
				xb.setPartyslNo(NullCheck.isNotNull(rs.getString("PARTY_SL_NO")));
				xb.setTranslNo(NullCheck.isNotNull(rs.getString("TRAN_SL_NO")));
				xb.setGroupName(NullCheck.isNotNull(rs.getString("GROUP_NAME")));
				xb.setGroupId(NullCheck.isNotNull(rs.getString("GROUP_ID")));
				xb.setPartyName(NullCheck.isNotNull(rs.getString("PARTY_NAME")));
				xb.setUniqueId(NullCheck.isNotNull(rs.getString("UNIQUE_ID")));
				xb.setTypeofParty(NullCheck.isNotNull(rs.getString("TYPE_OF_PARTY")));
				xb.setRelationship(NullCheck.isNotNull(rs.getString("RELATIONSHIP")));
				xb.setPurpose(NullCheck.isNotNull(rs.getString("PURPOSE")));
				xb.setApprovalDate(NullCheck.isNotNull(rs.getString("APPROVAL_DATE")));
				xb.setOriginalCurrency(NullCheck.isNotNull(rs.getString("ORIGINAL_CURRENCY")));
				xb.setAmtoriginalCurrency(NullCheck.isNotNull(rs.getString("AMT_ORIGINAL_CURR")));
				xb.setFbamtreporCurrency(NullCheck.isNotNull(rs.getString("FB_AMT_REPOR_CURR")));
				xb.setNfbreporCurrency(NullCheck.isNotNull(rs.getString("NFB_AMT_REPORT_CURR")));
				xb.setOutamtoriginalCurrency(NullCheck.isNotNull(rs.getString("OUT_AMT_ORIGINAL_CURR")));
				xb.setFboutamureporCurrency(NullCheck.isNotNull(rs.getString("FB_OUT_AMT_REPORT_CURR")));
				xb.setNfboutamtreporCurrency(NullCheck.isNotNull(rs.getString("NFB_OUT_AMT_REPORT_CURR")));
				xb.setNumerator(NullCheck.isNotNull(rs.getString("NUMERATOR")));
				xb.setTier1Percentage(NullCheck.isNotNull(rs.getString("TIER1_PERCENTAGE")));
				xb.setNoofarrears(NullCheck.isNotNull(rs.getString("NO_OF_ARREAR_DAYS")));
				xb.setIntRate(NullCheck.isNotNull(rs.getString("INT_RATE")));
				xb.setRemainingMaturityDays(NullCheck.isNotNull(rs.getString("REMAINING_MATURY_DAYS")));
				xb.setCollateralType(NullCheck.isNotNull(rs.getString("COLLATERAL_TYPE_1")));
				xb.setCollateralDesc(NullCheck.isNotNull(rs.getString("COLLATERAL_DESC_1")));
				xb.setLastValuationDate(NullCheck.isNotNull(rs.getString("LAST_VALUATION_DATE_1")));
				xb.setValue(NullCheck.isNotNull(rs.getString("VALUE_1")));
			
			
		
		
			arl.add(xb);
		   
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

public ArrayList<XBRLSUP0400Bean> xbrlsup0400details(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	
	
	ArrayList<XBRLSUP0400Bean> arl = new ArrayList<XBRLSUP0400Bean>();
	
	
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	 DecimalFormat dfs = new DecimalFormat("##,##.00");  
	 NullCheck chk=new NullCheck();

	try {
	
			
			sql.append("select GROUP_NAME,GROUP_ID,PARTY_NAME,UNIQUE_ID,TYPE_OF_PARTY,RELATIONSHIP,PURPOSE,to_char(APPROVAL_DATE,'dd-mm-yyyy')APPROVAL_DATE,ORIGINAL_CURRENCY,to_char(SANCT_AMT_ACCT_CRNCY_FB,'9,999,999,999,990.99')SANCT_AMT_ACCT_CRNCY_FB,to_char(SANCT_AMT_ACCT_CRNCY_NFB,'9,999,999,999,990.99')SANCT_AMT_ACCT_CRNCY_NFB,to_char(OUT_AMT_ACCT_CRNCY_FB,'9,999,999,999,990.99')OUT_AMT_ACCT_CRNCY_FB,to_char(OUT_AMT_ACCT_CRNCY_NFB,'9,999,999,999,990.99')OUT_AMT_ACCT_CRNCY_NFB,to_char(NUMERATOR,'9,999,999,999,990.99')NUMERATOR,NO_OF_ARREAR_DAYS,to_char(INT_RATE,'9,999,999,999,990.99')INT_RATE,REMAINING_MATURY_DAYS,COLLATERAL_TYPE,COLLATERAL_DESC,to_char(LAST_VALUATION_DATE,'dd-mm-yyyy')LAST_VALUATION_DATE,to_char(VALUE,'9,999,999,999,990.99')VALUE,to_char(REPORT_DATE,'dd-mm-yyyy')REPORT_DATE from table(SUP0400_DTL_FUN('SUP0400','"+ReporefSeq+"','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','MUR'))");
			
	
		log.info("sup0400details"+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLSUP0400Bean xb=new XBRLSUP0400Bean();
			
				
				
				xb.setGroupName(NullCheck.isNotNull(rs.getString("GROUP_NAME")));
				xb.setGroupId(NullCheck.isNotNull(rs.getString("GROUP_ID")));
				xb.setPartyName(NullCheck.isNotNull(rs.getString("PARTY_NAME")));
				xb.setUniqueId(NullCheck.isNotNull(rs.getString("UNIQUE_ID")));
				xb.setTypeofParty(NullCheck.isNotNull(rs.getString("TYPE_OF_PARTY")));
				xb.setRelationship(NullCheck.isNotNull(rs.getString("RELATIONSHIP")));
				xb.setPurpose(NullCheck.isNotNull(rs.getString("PURPOSE")));
				xb.setApprovalDate(NullCheck.isNotNull(rs.getString("APPROVAL_DATE")));
				xb.setOriginalCurrency(NullCheck.isNotNull(rs.getString("ORIGINAL_CURRENCY")));
				xb.setSancamtcurfb(NullCheck.isNotNull(rs.getString("SANCT_AMT_ACCT_CRNCY_FB")));
				xb.setSancamtcurnfb(NullCheck.isNotNull(rs.getString("SANCT_AMT_ACCT_CRNCY_NFB")));
				xb.setOutamtcurfb(NullCheck.isNotNull(rs.getString("OUT_AMT_ACCT_CRNCY_FB")));
				xb.setOutamtcurnfb(NullCheck.isNotNull(rs.getString("OUT_AMT_ACCT_CRNCY_NFB")));
			
				xb.setNumerator(NullCheck.isNotNull(rs.getString("NUMERATOR")));
				xb.setNoofarrears(NullCheck.isNotNull(rs.getString("NO_OF_ARREAR_DAYS")));
				xb.setIntRate(NullCheck.isNotNull(rs.getString("INT_RATE")));
				xb.setRemainingMaturityDays(NullCheck.isNotNull(rs.getString("REMAINING_MATURY_DAYS")));
				xb.setCollateralType(NullCheck.isNotNull(rs.getString("COLLATERAL_TYPE")));
				xb.setCollateralDesc(NullCheck.isNotNull(rs.getString("COLLATERAL_DESC")));
				xb.setLastValuationDate(NullCheck.isNotNull(rs.getString("LAST_VALUATION_DATE")));
				xb.setValue(NullCheck.isNotNull(rs.getString("VALUE")));
				xb.setReportDate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
			
			
		
		
			arl.add(xb);
		   
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



public String resalert;
public String getResalert() {
	return resalert;
}

public void setResalert(String resalert) {
	this.resalert = resalert;
}
public String modSUP0400cancel() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	sql.append("DELETE FROM SUP0400_MOD_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("reportDate")))+"' and GROUP_NAME='"+NullCheck.isNotNull(request.getParameter("groupName"))+"'and GROUP_ID='"+NullCheck.isNotNull(request.getParameter("groupId"))+"'");
	
	try {
		log.info(sql.toString());
		ps=conn.prepareStatement(sql.toString());
		
	    int rs=0;
	    rs=ps.executeUpdate();
	     
	    status="success";
	}catch(SQLException e) {
		e.printStackTrace();
		status="error";
	}
	
	if(status.equals("success")) {
		resalert="Cancellation Successful";
	}else {
		resalert="Technical Issue.Try Again Later.";
	}
	
	return "success";
}

public ArrayList<XBRLSUP0400Bean> SUP0400verify(){
	
	ArrayList<XBRLSUP0400Bean> arl = new ArrayList<XBRLSUP0400Bean>();
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	sql.append("SELECT GROUP_NAME,GROUP_ID,PARTY_NAME,UNIQUE_ID,TYPE_OF_PARTY,RELATIONSHIP,PURPOSE,to_char(APPROVAL_DATE,'dd-mm-yyyy')APPROVAL_DATE,ORIGINAL_CURRENCY,to_char(SANCT_AMT_ACCT_CRNCY_FB,'9,999,999,999,990.99')SANCT_AMT_ACCT_CRNCY_FB,to_char(SANCT_AMT_ACCT_CRNCY_NFB,'9,999,999,999,990.99')SANCT_AMT_ACCT_CRNCY_NFB,to_char(OUT_AMT_ACCT_CRNCY_FB,'9,999,999,999,990.99')OUT_AMT_ACCT_CRNCY_FB,to_char(OUT_AMT_ACCT_CRNCY_NFB,'9,999,999,999,990.99')OUT_AMT_ACCT_CRNCY_NFB,to_char(NUMERATOR,'9,999,999,999,990.99')NUMERATOR,NO_OF_ARREAR_DAYS,to_char(INT_RATE,'9,999,999,999,990.99')INT_RATE,REMAINING_MATURY_DAYS,COLLATERAL_TYPE,COLLATERAL_DESC,to_char(LAST_VALUATION_DATE,'dd-mm-yyyy')LAST_VALUATION_DATE,to_char(VALUE,'9,999,999,999,990.99')VALUE,to_char(REPORT_DATE,'dd-mm-yyyy')REPORT_DATE,DECODE(DEL_FLG,'A','Added','M','Modified','D','Deleted') as DEL_FLG ,LCHG_USER_ID FROM SUP0400_MOD_TABLE");
	log.info("Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		XBRLSUP0400Bean xb=new XBRLSUP0400Bean();
		xb.setGroupName(NullCheck.isNotNull(rs.getString("GROUP_NAME")));
		xb.setGroupId(NullCheck.isNotNull(rs.getString("GROUP_ID")));
		xb.setPartyName(NullCheck.isNotNull(rs.getString("PARTY_NAME")));
		xb.setUniqueId(NullCheck.isNotNull(rs.getString("UNIQUE_ID")));
		xb.setTypeofParty(NullCheck.isNotNull(rs.getString("TYPE_OF_PARTY")));
		xb.setRelationship(NullCheck.isNotNull(rs.getString("RELATIONSHIP")));
		xb.setPurpose(NullCheck.isNotNull(rs.getString("PURPOSE")));
		xb.setApprovalDate(NullCheck.isNotNull(rs.getString("APPROVAL_DATE")));
		xb.setOriginalCurrency(NullCheck.isNotNull(rs.getString("ORIGINAL_CURRENCY")));
		xb.setSancamtcurfb(NullCheck.isNotNull(rs.getString("SANCT_AMT_ACCT_CRNCY_FB")));
		xb.setSancamtcurnfb(NullCheck.isNotNull(rs.getString("SANCT_AMT_ACCT_CRNCY_NFB")));
		xb.setOutamtcurfb(NullCheck.isNotNull(rs.getString("OUT_AMT_ACCT_CRNCY_FB")));
		xb.setOutamtcurnfb(NullCheck.isNotNull(rs.getString("OUT_AMT_ACCT_CRNCY_NFB")));
	
		xb.setNumerator(NullCheck.isNotNull(rs.getString("NUMERATOR")));
		xb.setNoofarrears(NullCheck.isNotNull(rs.getString("NO_OF_ARREAR_DAYS")));
		xb.setIntRate(NullCheck.isNotNull(rs.getString("INT_RATE")));
		xb.setRemainingMaturityDays(NullCheck.isNotNull(rs.getString("REMAINING_MATURY_DAYS")));
		xb.setCollateralType(NullCheck.isNotNull(rs.getString("COLLATERAL_TYPE")));
		xb.setCollateralDesc(NullCheck.isNotNull(rs.getString("COLLATERAL_DESC")));
		xb.setLastValuationDate(NullCheck.isNotNull(rs.getString("LAST_VALUATION_DATE")));
		xb.setValue(NullCheck.isNotNull(rs.getString("VALUE")));
		xb.setReportDate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
	
		 xb.setModtyp(NullCheck.isNotNull(rs.getString("DEL_FLG")));
	    xb.setEntryuser(NullCheck.isNotNull(rs.getString("LCHG_USER_ID")));

		 arl.add(xb);
	}
	}catch(SQLException e){
		e.printStackTrace();
	}
		
	
	finally {

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

public String SUP0400verifymaster() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	HttpSession session = request.getSession();
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();	
	
	//------------------get data from mod table---------------------
	XBRLSUP0400Bean xb=new XBRLSUP0400Bean();
	System.out.println("fdjhf");
	sql.setLength(0);
	sql.append("SELECT GROUP_NAME,GROUP_ID,PARTY_NAME,UNIQUE_ID,TYPE_OF_PARTY,RELATIONSHIP,PURPOSE,to_char(APPROVAL_DATE,'dd-mm-yyyy')APPROVAL_DATE,ORIGINAL_CURRENCY,to_char(SANCT_AMT_ACCT_CRNCY_FB,'9,999,999,999,990.99')SANCT_AMT_ACCT_CRNCY_FB,to_char(SANCT_AMT_ACCT_CRNCY_NFB,'9,999,999,999,990.99')SANCT_AMT_ACCT_CRNCY_NFB,to_char(OUT_AMT_ACCT_CRNCY_FB,'9,999,999,999,990.99')OUT_AMT_ACCT_CRNCY_FB,to_char(OUT_AMT_ACCT_CRNCY_NFB,'9,999,999,999,990.99')OUT_AMT_ACCT_CRNCY_NFB,to_char(NUMERATOR,'9,999,999,999,990.99')NUMERATOR,NO_OF_ARREAR_DAYS,to_char(INT_RATE,'9,999,999,999,990.99')INT_RATE,REMAINING_MATURY_DAYS,COLLATERAL_TYPE,COLLATERAL_DESC,to_char(LAST_VALUATION_DATE,'dd-mm-yyyy')LAST_VALUATION_DATE,to_char(VALUE,'9,999,999,999,990.99')VALUE,to_char(REPORT_DATE,'dd-mm-yyyy')REPORT_DATE,DEL_FLG,LCHG_USER_ID FROM SUP0400_MOD_TABLE "
			+ "WHERE GROUP_NAME='"+NullCheck.isNotNull(request.getParameter("groupName"))+"' AND REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("reportDate")))+"' ");
	log.info("Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		
		xb.setGroupName(NullCheck.isNotNull(rs.getString("GROUP_NAME")));
		xb.setGroupId(NullCheck.isNotNull(rs.getString("GROUP_ID")));
		xb.setPartyName(NullCheck.isNotNull(rs.getString("PARTY_NAME")));
		xb.setUniqueId(NullCheck.isNotNull(rs.getString("UNIQUE_ID")));
		xb.setTypeofParty(NullCheck.isNotNull(rs.getString("TYPE_OF_PARTY")));
		xb.setRelationship(NullCheck.isNotNull(rs.getString("RELATIONSHIP")));
		xb.setPurpose(NullCheck.isNotNull(rs.getString("PURPOSE")));
		xb.setApprovalDate(NullCheck.isNotNull(rs.getString("APPROVAL_DATE")));
		xb.setOriginalCurrency(NullCheck.isNotNull(rs.getString("ORIGINAL_CURRENCY")));
		xb.setSancamtcurfb(NullCheck.isNotNull(rs.getString("SANCT_AMT_ACCT_CRNCY_FB")));
		xb.setSancamtcurnfb(NullCheck.isNotNull(rs.getString("SANCT_AMT_ACCT_CRNCY_NFB")));
		xb.setOutamtcurfb(NullCheck.isNotNull(rs.getString("OUT_AMT_ACCT_CRNCY_FB")));
		xb.setOutamtcurnfb(NullCheck.isNotNull(rs.getString("OUT_AMT_ACCT_CRNCY_NFB")));
	
		xb.setNumerator(NullCheck.isNotNull(rs.getString("NUMERATOR")));
		xb.setNoofarrears(NullCheck.isNotNull(rs.getString("NO_OF_ARREAR_DAYS")));
		xb.setIntRate(NullCheck.isNotNull(rs.getString("INT_RATE")));
		xb.setRemainingMaturityDays(NullCheck.isNotNull(rs.getString("REMAINING_MATURY_DAYS")));
		xb.setCollateralType(NullCheck.isNotNull(rs.getString("COLLATERAL_TYPE")));
		xb.setCollateralDesc(NullCheck.isNotNull(rs.getString("COLLATERAL_DESC")));
		xb.setLastValuationDate(NullCheck.isNotNull(rs.getString("LAST_VALUATION_DATE")));
		xb.setValue(NullCheck.isNotNull(rs.getString("VALUE")));
		xb.setReportDate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
			
		xb.setModtyp(NullCheck.isNotNull(rs.getString("DEL_FLG")));
	    xb.setEntryuser(NullCheck.isNotNull(rs.getString("LCHG_USER_ID")));

		
	}
	}catch(SQLException e){
		e.printStackTrace();
	}
		
	
	finally {

		if (ps != null) {
			try {
				ps.close();
			} catch (SQLException e) {
				
			}
		}
		/*if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				
			}
		}*/
	}
	
	
	
	//---------------get data from mod table------------------------
	
	
	
	
	
	if (xb.getModtyp().equals("A") ) {
		
	//For Added Records
		
		
		sql.setLength(0);
		sql.append(
				" INSERT INTO SUP0400_MAST_TABLE(GROUP_NAME,GROUP_ID,PARTY_NAME,UNIQUE_ID,TYPE_OF_PARTY,RELATIONSHIP,PURPOSE,APPROVAL_DATE,ORIGINAL_CURRENCY,SANCT_AMT_ACCT_CRNCY_FB,SANCT_AMT_ACCT_CRNCY_NFB,OUT_AMT_ACCT_CRNCY_FB,OUT_AMT_ACCT_CRNCY_NFB,NUMERATOR,NO_OF_ARREAR_DAYS,INT_RATE,REMAINING_MATURY_DAYS,COLLATERAL_TYPE,COLLATERAL_DESC,LAST_VALUATION_DATE,VALUE,REPORT_DATE,DEL_FLG,LCHG_USER_ID,LCHG_TIME,VERIFY_USER_ID,VERIFY_TIME)" + "VALUES ('"
					 + request.getParameter("groupName")
				+ "','" + request.getParameter("groupId") + "','"
				+ request.getParameter("partyName") + "','" 
				+ request.getParameter("uniqueId") + "','"
				+ request.getParameter("typeofParty") + "','" 
				+ request.getParameter("relationship") + "','"
				+ request.getParameter("purpose") + "','" 
				+df.formatdate( request.getParameter("approvalDate")) + "','"
				+ request.getParameter("originalCurrency") + "','"
				+ request.getParameter("sancamtcurfb") + "','" 
				+ request.getParameter("sancamtcurnfb") + "','"
				+ request.getParameter("outamtcurfb") + "','" 
				+ request.getParameter("outamtcurnfb") + "','"
				+request.getParameter("numerator") + "','" 
				+ request.getParameter("noofarrears") + "','" 
				+ request.getParameter("intRate") + "','" 
				+ request.getParameter("remainingMaturityDays") + "','" 
				+ request.getParameter("collateralType") + "','" 
				+ request.getParameter("collateralDesc") + "','" 
				+ df.formatdate(request.getParameter("lastValuationDate")) + "','"  
				+ request.getParameter("value") + "','" 
				+df.formatdate(request.getParameter("reportDate"))+ "','"+xb.getModtyp()+"','" + session.getAttribute("userName")
													+ "',SYSDATE,'"+ session.getAttribute("userName")+"',SYSDATE)");
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("DELETE FROM SUP0400_MOD_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("reportDate")))+"'and GROUP_NAME ='" + request.getParameter("groupName") +"' and GROUP_ID='"+NullCheck.isNotNull(request.getParameter("groupId"))+"'");
		    try {
				log.info(sql.toString());
				ps=conn.prepareStatement(sql.toString());
				
			    int rs1=0;
			    rs1=ps.executeUpdate();
			     
			    status="success";
		    }
		    catch(SQLException e) {
				e.printStackTrace();
				status="error";
			}
		    
		    
		}catch(SQLException e) {
			e.printStackTrace();
			status="error";
		}
		
	}else if (xb.getModtyp().equals("M") ) {
		
	//For Modified Records
		
		sql.setLength(0);
		sql.append("UPDATE SUP0400_MAST_TABLE SET GROUP_NAME='"+NullCheck.isNotNull(request.getParameter("groupName"))+"',GROUP_ID='"+NullCheck.isNotNull(request.getParameter("groupId"))+"',CUST_NAME='"+NullCheck.isNotNull(request.getParameter("custname"))+"',NRE_FLG='"+NullCheck.isNotNull(request.getParameter("nreflg"))+"',COUNTRY_CODE='"+NullCheck.isNotNull(request.getParameter("countrcode"))+"',UNIQUE_IDENTIFIER='"+NullCheck.isNotNull(request.getParameter("uniqidenti"))+"',ISIC_CODE='"+NullCheck.isNotNull(request.getParameter("detisiccode"))+"',GROUP_CODE='"+NullCheck.isNotNull(request.getParameter("groupcode"))+"',OS_FUND_BASED_AMT='"+NullCheck.isNotNull(request.getParameter("outstandamt"))+"',OS_NFB_AMT='"+NullCheck.isNotNull(request.getParameter("outstandnfbamt"))+"',PURPOSE_OF_CREDIT='"+NullCheck.isNotNull(request.getParameter("purpose"))+"',NATURE_OF_CUST='"+NullCheck.isNotNull(request.getParameter("natofcre"))+"',REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("reportDate")))+"',VERIFY_USER_ID='"+session.getAttribute("userName")+"',VERIFY_TIME=SYSDATE WHERE GROUP_ID='"+NullCheck.isNotNull(request.getParameter("groupId"))+"' AND  GROUP_NAME ='" + request.getParameter("groupName") +"' and  REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("reportDate")))+"'");
		
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("DELETE FROM SUP0400_MOD_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("reportDate")))+"' and GROUP_NAME ='" + request.getParameter("groupName") +"' and GROUP_ID='"+NullCheck.isNotNull(request.getParameter("groupId"))+"'");
		    try {
				log.info(sql.toString());
				ps=conn.prepareStatement(sql.toString());
				
			    int rs1=0;
			    rs1=ps.executeUpdate();
			     
			    status="success";
		    }
		    catch(SQLException e) {
				e.printStackTrace();
				status="error";
			}
		    
		    
		}catch(SQLException e) {
			e.printStackTrace();
			status="error";
		}
		
		
	}else if (xb.getModtyp().equals("D") ) {
		
	//For Deleted Records
		
		sql.setLength(0);
		sql.append("DELETE FROM SUP0400_MAST_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("reportDate")))+"'and  GROUP_NAME ='" + request.getParameter("groupName") +"' and GROUP_ID='"+NullCheck.isNotNull(request.getParameter("groupId"))+"'");
		
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("UPDATE SUP0400_MOD_TABLE SET LCHG_USER_ID='"+session.getAttribute("userName")+"' WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("reportDate")))+"' and GROUP_NAME ='" + request.getParameter("groupName") +"' and GROUP_ID='"+NullCheck.isNotNull(request.getParameter("groupId"))+"'");
		    try {
				log.info(sql.toString());
				ps=conn.prepareStatement(sql.toString());
				
			    int rs1=0;
			    rs1=ps.executeUpdate();
			     
			    status="success";
		    }
		    catch(SQLException e) {
				e.printStackTrace();
				status="error";
			}
		    
		    
		    sql.setLength(0);
		    sql.append("DELETE FROM SUP0400_MOD_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("reportDate")))+"' and GROUP_ID='"+NullCheck.isNotNull(request.getParameter("groupId"))+"'");
		    try {
				log.info(sql.toString());
				ps=conn.prepareStatement(sql.toString());
				
			    int rs1=0;
			    rs1=ps.executeUpdate();
			     
			    status="success";
		    }
		    catch(SQLException e) {
				e.printStackTrace();
				status="error";
			}
		    
		    
		}catch(SQLException e) {
			e.printStackTrace();
			status="error";
		}
	}
	
	
	
	
	
	
	return status;
}


}
