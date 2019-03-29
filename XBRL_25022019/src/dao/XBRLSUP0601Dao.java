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
import bean.XBRLSUP0601Bean;
import bean.XBRLSUP0601Bean;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRLSUP0601Dao {
public String Reporef;
	
static Logger log = Logger.getLogger(XBRLSUP0601Dao.class);
	public String getReporef() {
		return Reporef;
	}

	public void setReporef(String reporef) {
		Reporef = reporef;
	}
	public ArrayList<XBRLSUP0601Dao> ReporefSeq(String dt1, String dt2) {

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

		ArrayList<XBRLSUP0601Dao> arl = new ArrayList<XBRLSUP0601Dao>();
		sql.append("select REPORT_REF_NO from SUP0010_MOD_TABLE where REPORT_DATE='" + dt2 + "' ORDER BY REPORT_REF_NO");

		log.info("SELECTPROFILE" + sql.toString());

		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLSUP0601Dao xel = new XBRLSUP0601Dao();
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
public ArrayList<XBRLSUP0601Bean> xbrlsup0601s1(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
		
		
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLSUP0601Bean> arl = new ArrayList<XBRLSUP0601Bean>();
		
		String status = "";
		
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
		
				
				sql.append("select INSTANCE_CODE,REF_CODE_DESC,to_char(TOT_OUTSTANDING,'9,999,999,999,990.99')TOT_OUTSTANDING,to_char(B1_90_TOT_OUTSTANDINGS,'9,999,999,999,990.99')B1_90_TOT_OUTSTANDINGS,to_char(B1_90_IMAPIRED_AMTS,'9,999,999,999,990.99')B1_90_IMAPIRED_AMTS,to_char(B1_90_SPEC_PROVS,'9,999,999,999,990.99')B1_90_SPEC_PROVS,to_char(B91_180_TOT_OUTSTANDINGS,'9,999,999,999,990.99')B91_180_TOT_OUTSTANDINGS,to_char(B91_180_IMAPIRED_AMTS,'9,999,999,999,990.99')B91_180_IMAPIRED_AMTS,to_char(B91_180_SPEC_PROVS,'9,999,999,999,990.99')B91_180_SPEC_PROVS,to_char(B181_360_TOT_OUTSTANDINGS,'9,999,999,999,990.99')B181_360_TOT_OUTSTANDINGS,to_char(B181_360_IMAPIRED_AMTS,'9,999,999,999,990.99')B181_360_IMAPIRED_AMTS,to_char(B181_360_SPEC_PROVS,'9,999,999,999,990.99')B181_360_SPEC_PROVS,to_char(G360_TOT_OUTSTANDINGS,'9,999,999,999,990.99')G360_TOT_OUTSTANDINGS,to_char(G360_IMAPIRED_AMTS,'9,999,999,999,990.99')G360_IMAPIRED_AMTS,to_char(G360_SPEC_PROVS,'9,999,999,999,990.99')G360_SPEC_PROVS,to_char(OTH_TOT_OUTSTANDING,'9,999,999,999,990.99')OTH_TOT_OUTSTANDING,to_char(OTH_IMPAIRED_AMT,'9,999,999,999,990.99')OTH_IMPAIRED_AMT,to_char(OTH_SPEC_PROV,'9,999,999,999,990.99')OTH_SPEC_PROV,to_char(TOT_ARREARS,'9,999,999,999,990.99')TOT_ARREARS,to_char(TOT_IMPAIRED_AMT,'9,999,999,999,990.99')TOT_IMPAIRED_AMT,to_char(TOT_SPEC_PROV,'9,999,999,999,990.99')TOT_SPEC_PROV from table(SUP0601_S1_RPT_FUN('"+reptype+"','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','MUR'))");
				
		
			log.info("SUP0601S1 "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				XBRLSUP0601Bean xb=new XBRLSUP0601Bean();
				
					xb.setInstanceName(NullCheck.isNotNull(rs.getString("REF_CODE_DESC")));
					xb.setInstanceCode(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
					xb.setTotOutstanding(NullCheck.isNotNull(rs.getString("TOT_OUTSTANDING")));
					xb.setB190totOut(NullCheck.isNotNull(rs.getString("B1_90_TOT_OUTSTANDINGS")));
					xb.setB190impamts(NullCheck.isNotNull(rs.getString("B1_90_IMAPIRED_AMTS")));
					xb.setB190specprov(NullCheck.isNotNull(rs.getString("B1_90_SPEC_PROVS")));
					xb.setB191to180totOut(NullCheck.isNotNull(rs.getString("B91_180_TOT_OUTSTANDINGS")));
					xb.setB191to180impamts(NullCheck.isNotNull(rs.getString("B91_180_IMAPIRED_AMTS")));
					xb.setB191to180specprov(NullCheck.isNotNull(rs.getString("B91_180_SPEC_PROVS")));
					xb.setB181to360totOut(NullCheck.isNotNull(rs.getString("B181_360_TOT_OUTSTANDINGS")));
					xb.setB181to360impamts(NullCheck.isNotNull(rs.getString("B181_360_IMAPIRED_AMTS")));
					xb.setB181to360specprov(NullCheck.isNotNull(rs.getString("B181_360_SPEC_PROVS")));
					xb.setGto360totOut(NullCheck.isNotNull(rs.getString("G360_TOT_OUTSTANDINGS")));
					xb.setGto360impamts(NullCheck.isNotNull(rs.getString("G360_IMAPIRED_AMTS")));
					xb.setGto360specprov(NullCheck.isNotNull(rs.getString("G360_SPEC_PROVS")));
					xb.setOthertotOutstanding(NullCheck.isNotNull(rs.getString("OTH_TOT_OUTSTANDING")));
					xb.setOtherImpairedAmt(NullCheck.isNotNull(rs.getString("OTH_IMPAIRED_AMT")));
					xb.setOtherSpecProv(NullCheck.isNotNull(rs.getString("OTH_SPEC_PROV")));
					xb.setTotArrears(NullCheck.isNotNull(rs.getString("TOT_ARREARS")));
					xb.setTotImpairedAmt(NullCheck.isNotNull(rs.getString("TOT_IMPAIRED_AMT")));
					xb.setTotSpecProv(NullCheck.isNotNull(rs.getString("TOT_SPEC_PROV")));
					
					
			
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

public ArrayList<XBRLSUP0601Bean> xbrlsup0601s2(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLSUP0601Bean> arl = new ArrayList<XBRLSUP0601Bean>();
	
	String status = "";
	
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
	
			
			sql.append("select INSTANCE_CODE,REF_CODE_DESC,to_char(TOT_OUTSTANDING,'9,999,999,999,990.99')TOT_OUTSTANDING,to_char(B1_90_TOT_OUTSTANDINGS,'9,999,999,999,990.99')B1_90_TOT_OUTSTANDINGS,to_char(B1_90_IMAPIRED_AMTS,'9,999,999,999,990.99')B1_90_IMAPIRED_AMTS,to_char(B1_90_SPEC_PROVS,'9,999,999,999,990.99')B1_90_SPEC_PROVS,to_char(B91_180_TOT_OUTSTANDINGS,'9,999,999,999,990.99')B91_180_TOT_OUTSTANDINGS,to_char(B91_180_IMAPIRED_AMTS,'9,999,999,999,990.99')B91_180_IMAPIRED_AMTS,to_char(B91_180_SPEC_PROVS,'9,999,999,999,990.99')B91_180_SPEC_PROVS,to_char(B181_360_TOT_OUTSTANDINGS,'9,999,999,999,990.99')B181_360_TOT_OUTSTANDINGS,to_char(B181_360_IMAPIRED_AMTS,'9,999,999,999,990.99')B181_360_IMAPIRED_AMTS,to_char(B181_360_SPEC_PROVS,'9,999,999,999,990.99')B181_360_SPEC_PROVS,to_char(G360_TOT_OUTSTANDINGS,'9,999,999,999,990.99')G360_TOT_OUTSTANDINGS,to_char(G360_IMAPIRED_AMTS,'9,999,999,999,990.99')G360_IMAPIRED_AMTS,to_char(G360_SPEC_PROVS,'9,999,999,999,990.99')G360_SPEC_PROVS,to_char(OTH_TOT_OUTSTANDING,'9,999,999,999,990.99')OTH_TOT_OUTSTANDING,to_char(OTH_IMPAIRED_AMT,'9,999,999,999,990.99')OTH_IMPAIRED_AMT,to_char(OTH_SPEC_PROV,'9,999,999,999,990.99')OTH_SPEC_PROV,to_char(TOT_ARREARS,'9,999,999,999,990.99')TOT_ARREARS,to_char(TOT_IMPAIRED_AMT,'9,999,999,999,990.99')TOT_IMPAIRED_AMT,to_char(TOT_SPEC_PROV,'9,999,999,999,990.99')TOT_SPEC_PROV from table(SUP0601_S2_RPT_FUN('"+reptype+"','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','MUR'))");
			
	
		log.info("SUP0601S2 "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLSUP0601Bean xb=new XBRLSUP0601Bean();
			
				
				xb.setInstanceCode(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
				xb.setRefCode(NullCheck.isNotNull(rs.getString("REF_CODE_DESC")));
				xb.setTotOutstanding(NullCheck.isNotNull(rs.getString("TOT_OUTSTANDING")));
				xb.setB190totOut(NullCheck.isNotNull(rs.getString("B1_90_TOT_OUTSTANDINGS")));
				xb.setB190impamts(NullCheck.isNotNull(rs.getString("B1_90_IMAPIRED_AMTS")));
				xb.setB190specprov(NullCheck.isNotNull(rs.getString("B1_90_SPEC_PROVS")));
				xb.setB191to180totOut(NullCheck.isNotNull(rs.getString("B91_180_TOT_OUTSTANDINGS")));
				xb.setB191to180impamts(NullCheck.isNotNull(rs.getString("B91_180_IMAPIRED_AMTS")));
				xb.setB191to180specprov(NullCheck.isNotNull(rs.getString("B91_180_SPEC_PROVS")));
				xb.setB181to360totOut(NullCheck.isNotNull(rs.getString("B181_360_TOT_OUTSTANDINGS")));
				xb.setB181to360impamts(NullCheck.isNotNull(rs.getString("B181_360_IMAPIRED_AMTS")));
				xb.setB181to360specprov(NullCheck.isNotNull(rs.getString("B181_360_SPEC_PROVS")));
				xb.setGto360totOut(NullCheck.isNotNull(rs.getString("G360_TOT_OUTSTANDINGS")));
				xb.setGto360impamts(NullCheck.isNotNull(rs.getString("G360_IMAPIRED_AMTS")));
				xb.setGto360specprov(NullCheck.isNotNull(rs.getString("G360_SPEC_PROVS")));
				xb.setOthertotOutstanding(NullCheck.isNotNull(rs.getString("OTH_TOT_OUTSTANDING")));
				xb.setOtherImpairedAmt(NullCheck.isNotNull(rs.getString("OTH_IMPAIRED_AMT")));
				xb.setOtherSpecProv(NullCheck.isNotNull(rs.getString("OTH_SPEC_PROV")));
				xb.setTotArrears(NullCheck.isNotNull(rs.getString("TOT_ARREARS")));
				xb.setTotImpairedAmt(NullCheck.isNotNull(rs.getString("TOT_IMPAIRED_AMT")));
				xb.setTotSpecProv(NullCheck.isNotNull(rs.getString("TOT_SPEC_PROV")));
				
				
		
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

public ArrayList<XBRLSUP0601Bean> xbrlsup0601s3(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLSUP0601Bean> arl = new ArrayList<XBRLSUP0601Bean>();
	
	String status = "";
	
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
	
			
			sql.append("select INSTANCE_CODE,REF_CODE_DESC,to_char(VALUE,'9,999,999,999,990.99')VALUE from table(SUP0601_S3_RPT_FUN('"+reptype+"','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','MUR'))");
			
	
		log.info("SUP0601S3 "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLSUP0601Bean xb=new XBRLSUP0601Bean();
			
				
				xb.setInstanceCode(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
				xb.setRefCode3(NullCheck.isNotNull(rs.getString("REF_CODE_DESC")));
				xb.setValue(NullCheck.isNotNull(rs.getString("VALUE")));
				
				
				
		
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

public ArrayList<XBRLSUP0601Bean> xbrlsup0601s4(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLSUP0601Bean> arl = new ArrayList<XBRLSUP0601Bean>();
	
	String status = "";
	
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
	
			
			sql.append("select INSTANCE_CODE,REF_CODE_DESC,to_char(TOT_OUTSTANDING,'9,999,999,999,990.99')TOT_OUTSTANDING,to_char(B1_90_TOT_OUTSTANDINGS,'9,999,999,999,990.99')B1_90_TOT_OUTSTANDINGS,to_char(B1_90_IMAPIRED_AMTS,'9,999,999,999,990.99')B1_90_IMAPIRED_AMTS,to_char(B1_90_SPEC_PROVS,'9,999,999,999,990.99')B1_90_SPEC_PROVS,to_char(B91_180_TOT_OUTSTANDINGS,'9,999,999,999,990.99')B91_180_TOT_OUTSTANDINGS,to_char(B91_180_IMAPIRED_AMTS,'9,999,999,999,990.99')B91_180_IMAPIRED_AMTS,to_char(B91_180_SPEC_PROVS,'9,999,999,999,990.99')B91_180_SPEC_PROVS,to_char(B181_360_TOT_OUTSTANDINGS,'9,999,999,999,990.99')B181_360_TOT_OUTSTANDINGS,to_char(B181_360_IMAPIRED_AMTS,'9,999,999,999,990.99')B181_360_IMAPIRED_AMTS,to_char(B181_360_SPEC_PROVS,'9,999,999,999,990.99')B181_360_SPEC_PROVS,to_char(G360_TOT_OUTSTANDINGS,'9,999,999,999,990.99')G360_TOT_OUTSTANDINGS,to_char(G360_IMAPIRED_AMTS,'9,999,999,999,990.99')G360_IMAPIRED_AMTS,to_char(G360_SPEC_PROVS,'9,999,999,999,990.99')G360_SPEC_PROVS,to_char(OTH_TOT_OUTSTANDING,'9,999,999,999,990.99')OTH_TOT_OUTSTANDING,to_char(OTH_IMPAIRED_AMT,'9,999,999,999,990.99')OTH_IMPAIRED_AMT,to_char(OTH_SPEC_PROV,'9,999,999,999,990.99')OTH_SPEC_PROV,to_char(TOT_ARREARS,'9,999,999,999,990.99')TOT_ARREARS,to_char(TOT_IMPAIRED_AMT,'9,999,999,999,990.99')TOT_IMPAIRED_AMT,to_char(TOT_SPEC_PROV,'9,999,999,999,990.99')TOT_SPEC_PROV from table(SUP0601_S4_RPT_FUN('"+reptype+"','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','MUR'))");
			
	
		log.info("SUP0601S4 "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLSUP0601Bean xb=new XBRLSUP0601Bean();
			
				
				xb.setInstanceCode(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
				xb.setRefCode4(NullCheck.isNotNull(rs.getString("REF_CODE_DESC")));
				xb.setTotOutstanding(NullCheck.isNotNull(rs.getString("TOT_OUTSTANDING")));
				xb.setB190totOut(NullCheck.isNotNull(rs.getString("B1_90_TOT_OUTSTANDINGS")));
				xb.setB190impamts(NullCheck.isNotNull(rs.getString("B1_90_IMAPIRED_AMTS")));
				xb.setB190specprov(NullCheck.isNotNull(rs.getString("B1_90_SPEC_PROVS")));
				xb.setB191to180totOut(NullCheck.isNotNull(rs.getString("B91_180_TOT_OUTSTANDINGS")));
				xb.setB191to180impamts(NullCheck.isNotNull(rs.getString("B91_180_IMAPIRED_AMTS")));
				xb.setB191to180specprov(NullCheck.isNotNull(rs.getString("B91_180_SPEC_PROVS")));
				xb.setB181to360totOut(NullCheck.isNotNull(rs.getString("B181_360_TOT_OUTSTANDINGS")));
				xb.setB181to360impamts(NullCheck.isNotNull(rs.getString("B181_360_IMAPIRED_AMTS")));
				xb.setB181to360specprov(NullCheck.isNotNull(rs.getString("B181_360_SPEC_PROVS")));
				xb.setGto360totOut(NullCheck.isNotNull(rs.getString("G360_TOT_OUTSTANDINGS")));
				xb.setGto360impamts(NullCheck.isNotNull(rs.getString("G360_IMAPIRED_AMTS")));
				xb.setGto360specprov(NullCheck.isNotNull(rs.getString("G360_SPEC_PROVS")));
				xb.setOthertotOutstanding(NullCheck.isNotNull(rs.getString("OTH_TOT_OUTSTANDING")));
				xb.setOtherImpairedAmt(NullCheck.isNotNull(rs.getString("OTH_IMPAIRED_AMT")));
				xb.setOtherSpecProv(NullCheck.isNotNull(rs.getString("OTH_SPEC_PROV")));
				xb.setTotArrears(NullCheck.isNotNull(rs.getString("TOT_ARREARS")));
				xb.setTotImpairedAmt(NullCheck.isNotNull(rs.getString("TOT_IMPAIRED_AMT")));
				xb.setTotSpecProv(NullCheck.isNotNull(rs.getString("TOT_SPEC_PROV")));
				
				
		
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


public ArrayList<XBRLSUP0601Bean> xbrlsup0601details(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLSUP0601Bean> arl = new ArrayList<XBRLSUP0601Bean>();
	
	String status = "";
	
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
	
			
		sql.append("select ACCT_NUMBER,ACCT_NAME,CUST_ID,SCHM_CODE,SCHM_TYPE,TO_CHAR(ACCT_OPN_DATE,'DD-MM-YYYY')ACCT_OPN_DATE,to_char(INT_RATE,'9,999,999,999,990.99')INT_RATE,to_char(ACCT_BALANCE_AMT_AC,'9,999,999,999,990.99')ACCT_BALANCE_AMT_AC,ACCT_CRNCY_CODE,ISIC_CODE,NATURE_OF_CUST,NRE_FLG,COUNTRY,BOM_GROUP_IDENTIFIER,CUST_UNIQUE_IDENTIFIER,to_char(LOAN_AMOUNT,'9,999,999,999,990.99')LOAN_AMOUNT,to_char(SPEC_PROV,'9,999,999,999,990.99')SPEC_PROV,to_char(BAD_DR_WR_OFF,'9,999,999,999,990.99')BAD_DR_WR_OFF,DPD_CNTR,IMPAIRED_FLG,to_char(SEC_AMOUNT,'9,999,999,999,990.99')SEC_AMOUNT,PURPOSE_OF_LOAN,SME_FLG,NON_FUND_BASED_FACILITIES,TO_CHAR(RESHDL_DATE,'DD-MM-YYYY')RESHDL_DATE,RESTRUCTURED_FLG,NO_OF_RESTRUCTURE,TO_CHAR(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE from table(SUP0601_DTL_FUN('"+reptype+"','"+instno+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','MUR'))");
			
	
		log.info("SUP0601DETAILS"+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLSUP0601Bean xb=new XBRLSUP0601Bean();
			
			xb.setAcctNum(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
			xb.setAcctName(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
			xb.setCustId(NullCheck.isNotNull(rs.getString("CUST_ID")));
			xb.setSchmCode(NullCheck.isNotNull(rs.getString("SCHM_CODE")));
			xb.setSchmType(NullCheck.isNotNull(rs.getString("SCHM_TYPE")));
			xb.setAcctopenDate(NullCheck.isNotNull(rs.getString("ACCT_OPN_DATE")));
			xb.setIntRate(NullCheck.isNotNull(rs.getString("INT_RATE")));
			xb.setAcctBalanceamtac(NullCheck.isNotNull(rs.getString("ACCT_BALANCE_AMT_AC")));
			xb.setAcctCrncyCode(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
			xb.setIsicCode(NullCheck.isNotNull(rs.getString("ISIC_CODE")));
			xb.setNatureofCust(NullCheck.isNotNull(rs.getString("NATURE_OF_CUST")));
			xb.setNreFlg(NullCheck.isNotNull(rs.getString("NRE_FLG")));
			xb.setCountry(NullCheck.isNotNull(rs.getString("COUNTRY")));
			xb.setBomGroupIdentifier(NullCheck.isNotNull(rs.getString("BOM_GROUP_IDENTIFIER")));
			xb.setCustUniqueIdentifier(NullCheck.isNotNull(rs.getString("CUST_UNIQUE_IDENTIFIER")));
			xb.setLoanAmt(NullCheck.isNotNull(rs.getString("LOAN_AMOUNT")));
			xb.setSpecProv(NullCheck.isNotNull(rs.getString("SPEC_PROV")));
			xb.setBadDrwroff(NullCheck.isNotNull(rs.getString("BAD_DR_WR_OFF")));
			xb.setDprCntr(NullCheck.isNotNull(rs.getString("DPD_CNTR")));
			xb.setImpairedFlg(NullCheck.isNotNull(rs.getString("IMPAIRED_FLG")));
			xb.setSecAmt(NullCheck.isNotNull(rs.getString("SEC_AMOUNT")));
			xb.setPurposeofLoan(NullCheck.isNotNull(rs.getString("PURPOSE_OF_LOAN")));
			xb.setSmeFlg(NullCheck.isNotNull(rs.getString("SME_FLG")));
			xb.setNonFundBasedFacilities(NullCheck.isNotNull(rs.getString("NON_FUND_BASED_FACILITIES")));
			xb.setSchdate(NullCheck.isNotNull(rs.getString("RESHDL_DATE")));
			xb.setResflg(NullCheck.isNotNull(rs.getString("RESTRUCTURED_FLG")));
			xb.setNoofres(NullCheck.isNotNull(rs.getString("NO_OF_RESTRUCTURE")));
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



public ArrayList<XBRLSUP0601Bean> xbrlsup601(String reptype,String dt1,String dt2,String ReporefSeq,String instno,String curr) {
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLSUP0601Bean> arl = new ArrayList<XBRLSUP0601Bean>();
	NullCheck chk=new NullCheck();
	
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();
	log.info(dt1);
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	sql.append("select ACCT_NUMBER,ACCT_NAME,CUST_ID,SCHM_CODE,SCHM_TYPE,TO_CHAR(ACCT_OPN_DATE,'DD-MM-YYYY')ACCT_OPN_DATE,to_char(INT_RATE,'9,999,999,999,990.99')INT_RATE,to_char(ACCT_BALANCE_AMT_AC,'9,999,999,999,990.99')ACCT_BALANCE_AMT_AC,ACCT_CRNCY_CODE,ISIC_CODE,NATURE_OF_CUST,NRE_FLG,COUNTRY,BOM_GROUP_IDENTIFIER,CUST_UNIQUE_IDENTIFIER,to_char(LOAN_AMOUNT,'9,999,999,999,990.99')LOAN_AMOUNT,to_char(SPEC_PROV,'9,999,999,999,990.99')SPEC_PROV,to_char(BAD_DR_WR_OFF,'9,999,999,999,990.99')BAD_DR_WR_OFF,DPD_CNTR,IMPAIRED_FLG,to_char(SEC_AMOUNT,'9,999,999,999,990.99')SEC_AMOUNT,PURPOSE_OF_LOAN,SME_FLG,NON_FUND_BASED_FACILITIES,TO_CHAR(RESHDL_DATE,'DD-MM-YYYY')RESHDL_DATE,RESTRUCTURED_FLG,NO_OF_RESTRUCTURE,TO_CHAR(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE from table(SUP0601_DTL_FUN('"+reptype+"','"+instno+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','MUR'))");
		
log.info("DOC&&&&SELECT Gayu"+sql.toString());
	
	try {
		
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		
		XBRLSUP0601Bean xb=new XBRLSUP0601Bean();
		xb.setAcctNum(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
		xb.setAcctName(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
		xb.setCustId(NullCheck.isNotNull(rs.getString("CUST_ID")));
		xb.setSchmCode(NullCheck.isNotNull(rs.getString("SCHM_CODE")));
		xb.setSchmType(NullCheck.isNotNull(rs.getString("SCHM_TYPE")));
		xb.setAcctopenDate(NullCheck.isNotNull(rs.getString("ACCT_OPN_DATE")));
		xb.setIntRate(NullCheck.isNotNull(rs.getString("INT_RATE")));
		xb.setAcctBalanceamtac(NullCheck.isNotNull(rs.getString("ACCT_BALANCE_AMT_AC")));
		xb.setAcctCrncyCode(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
		xb.setIsicCode(NullCheck.isNotNull(rs.getString("ISIC_CODE")));
		xb.setNatureofCust(NullCheck.isNotNull(rs.getString("NATURE_OF_CUST")));
		xb.setNreFlg(NullCheck.isNotNull(rs.getString("NRE_FLG")));
		xb.setCountry(NullCheck.isNotNull(rs.getString("COUNTRY")));
		xb.setBomGroupIdentifier(NullCheck.isNotNull(rs.getString("BOM_GROUP_IDENTIFIER")));
		xb.setCustUniqueIdentifier(NullCheck.isNotNull(rs.getString("CUST_UNIQUE_IDENTIFIER")));
		xb.setLoanAmt(NullCheck.isNotNull(rs.getString("LOAN_AMOUNT")));
		xb.setSpecProv(NullCheck.isNotNull(rs.getString("SPEC_PROV")));
		xb.setBadDrwroff(NullCheck.isNotNull(rs.getString("BAD_DR_WR_OFF")));
		xb.setDprCntr(NullCheck.isNotNull(rs.getString("DPD_CNTR")));
		xb.setImpairedFlg(NullCheck.isNotNull(rs.getString("IMPAIRED_FLG")));
		xb.setSecAmt(NullCheck.isNotNull(rs.getString("SEC_AMOUNT")));
		xb.setPurposeofLoan(NullCheck.isNotNull(rs.getString("PURPOSE_OF_LOAN")));
		xb.setSmeFlg(NullCheck.isNotNull(rs.getString("SME_FLG")));
		xb.setNonFundBasedFacilities(NullCheck.isNotNull(rs.getString("NON_FUND_BASED_FACILITIES")));
		xb.setSchdate(NullCheck.isNotNull(rs.getString("RESHDL_DATE")));
		xb.setResflg(NullCheck.isNotNull(rs.getString("RESTRUCTURED_FLG")));
		xb.setNoofres(NullCheck.isNotNull(rs.getString("NO_OF_RESTRUCTURE")));
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

public String detailSUP0601saves() {
	
	

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



}
