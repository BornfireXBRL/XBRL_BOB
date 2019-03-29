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
import bean.XBRLPSC0501Bean;
import bean.XBRLSUP0604Bean;
import bean.XBRLSUP0604Bean;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRLSUP0604Dao {

	static Logger log = Logger.getLogger(XBRLSUP0604Dao.class);


	public int cnt1;
	public String cnt;

	public String resalert;
	
		

	
public static Logger getLog() {
		return log;
	}

	public static void setLog(Logger log) {
		XBRLSUP0604Dao.log = log;
	}

	public int getCnt1() {
		return cnt1;
	}

	public void setCnt1(int cnt1) {
		this.cnt1 = cnt1;
	}

	public String getCnt() {
		return cnt;
	}

	public void setCnt(String cnt) {
		this.cnt = cnt;
	}

	public String getResalert() {
		return resalert;
	}

	public void setResalert(String resalert) {
		this.resalert = resalert;
	}
public String Reporef;
	
	
	public String getReporef() {
		return Reporef;
	}

	public void setReporef(String reporef) {
		Reporef = reporef;
	}
	public ArrayList<XBRLSUP0604Dao> ReporefSeq(String dt1, String dt2) {

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

		ArrayList<XBRLSUP0604Dao> arl = new ArrayList<XBRLSUP0604Dao>();
		sql.append("select REPORT_REF_NO from SUP0010_MOD_TABLE where REPORT_DATE='" + dt2 + "' ORDER BY REPORT_REF_NO");

		log.info("SELECTPROFILE" + sql.toString());

		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLSUP0604Dao xel = new XBRLSUP0604Dao();
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
public ArrayList<XBRLSUP0604Bean> xbrlsup0604s1(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
		
		
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLSUP0604Bean> arl = new ArrayList<XBRLSUP0604Bean>();
		
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
		
				
				sql.append("select SL_NO,NAME_OF_CUST,UNIQUE_IDENTIFIER,NRE_FLG,BOM_GROUP_IDENTIFIER from table(SUP0604_S1_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
				
		
			log.info("SUP0604S1 "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				XBRLSUP0604Bean xb=new XBRLSUP0604Bean();
				
					xb.setSno(NullCheck.isNotNull(rs.getString("SL_NO")));
					xb.setNamofcus(NullCheck.isNotNull(rs.getString("NAME_OF_CUST")));
					xb.setUnqidcus(NullCheck.isNotNull(rs.getString("UNIQUE_IDENTIFIER")));
					xb.setRestacus(NullCheck.isNotNull(rs.getString("NRE_FLG")));
					xb.setBomgrpid(NullCheck.isNotNull(rs.getString("BOM_GROUP_IDENTIFIER")));
					
					
			
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

public ArrayList<XBRLSUP0604Bean> xbrlsup0604s2(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLSUP0604Bean> arl = new ArrayList<XBRLSUP0604Bean>();
	
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
	
			
			sql.append("select SL_NO,TRAN_SL_NO,NAME_OF_CUST,UNIQUE_IDENTIFIER,NRE_FLG,BOM_GROUP_IDENTIFIER,ISIC_CODE,OLD_CRNCY,NEW_CRNCY,NPA_FLG,PR_FACILITY,PR_AMT,AF_FACILITY,AF_AMT,IMPAIRED_AMT,NORMAL_AMT,NO_OF_RESTRUCTURE from table(SUP0604_S2_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
	
		log.info("SUP0604S2 "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLSUP0604Bean xb=new XBRLSUP0604Bean();
			
				
				xb.setSno(NullCheck.isNotNull(rs.getString("SL_NO")));
				xb.setTransrno(NullCheck.isNotNull(rs.getString("TRAN_SL_NO")));
				xb.setNamofcus(NullCheck.isNotNull(rs.getString("NAME_OF_CUST")));
				xb.setUnqidcus(NullCheck.isNotNull(rs.getString("UNIQUE_IDENTIFIER")));
				xb.setRestacus(NullCheck.isNotNull(rs.getString("NRE_FLG")));
				xb.setBomgrpid(NullCheck.isNotNull(rs.getString("BOM_GROUP_IDENTIFIER")));
				xb.setIsicode(NullCheck.isNotNull(rs.getString("ISIC_CODE")));
				xb.setCurgrant(NullCheck.isNotNull(rs.getString("OLD_CRNCY")));
				xb.setCurresedule(NullCheck.isNotNull(rs.getString("NEW_CRNCY")));
				xb.setStatusfac(NullCheck.isNotNull(rs.getString("NPA_FLG")));
				xb.setPritypfac(NullCheck.isNotNull(rs.getString("PR_FACILITY")));
				xb.setPritotamt(NullCheck.isNotNull(rs.getString("PR_AMT")));
				xb.setAftrtypfac(NullCheck.isNotNull(rs.getString("AF_FACILITY")));
				xb.setAftrtotamt(NullCheck.isNotNull(rs.getString("AF_AMT")));
				xb.setAmtclsipm(NullCheck.isNotNull(rs.getString("IMPAIRED_AMT")));
				xb.setAmtdecstatus(NullCheck.isNotNull(rs.getString("NORMAL_AMT")));
				xb.setNooftyms(NullCheck.isNotNull(rs.getString("NO_OF_RESTRUCTURE")));
				
				
				
		
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


public ArrayList<XBRLSUP0604Bean> xbrlsup0604details(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLSUP0604Bean> arl = new ArrayList<XBRLSUP0604Bean>();
	
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
	
			
			sql.append("select ACCT_NUMBER,ACCT_NAME,CUST_ID,SCHM_CODE,SCHM_TYPE,TO_CHAR(ACCT_OPN_DATE,'DD-MM-YYYY')ACCT_OPN_DATE,to_char(INT_RATE,'9,999,999,999,990.99')INT_RATE,to_char(ACCT_BALANCE_AMT_AC,'9,999,999,999,990.99')ACCT_BALANCE_AMT_AC,ACCT_CRNCY_CODE,ISIC_CODE,NATURE_OF_CUST,NRE_FLG,COUNTRY,BOM_GROUP_IDENTIFIER,CUST_UNIQUE_IDENTIFIER,to_char(LOAN_AMOUNT,'9,999,999,999,990.99')LOAN_AMOUNT,to_char(SPEC_PROV,'9,999,999,999,990.99')SPEC_PROV,to_char(BAD_DR_WR_OFF,'9,999,999,999,990.99')BAD_DR_WR_OFF,DPD_CNTR,IMPAIRED_FLG,to_char(SEC_AMOUNT,'9,999,999,999,990.99')SEC_AMOUNT,PURPOSE_OF_LOAN,SME_FLG,NON_FUND_BASED_FACILITIES,TO_CHAR(RESHDL_DATE,'DD-MM-YYYY')RESHDL_DATE,RESTRUCTURED_FLG,NO_OF_RESTRUCTURE,TO_CHAR(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE from table(SUP0604_DTL_FUN('"+reptype+"','"+ReporefSeq+"','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
	
		log.info("SUP0604DETAILS"+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLSUP0604Bean xb=new XBRLSUP0604Bean();
			
				
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



public ArrayList<XBRLSUP0604Bean> xbrlsup604(String reptype,String dt1,String dt2,String ReporefSeq,String instno,String curr) {
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLSUP0604Bean> arl = new ArrayList<XBRLSUP0604Bean>();
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
	
	sql.append("select ACCT_NUMBER,ACCT_NAME,CUST_ID,SCHM_CODE,SCHM_TYPE,TO_CHAR(ACCT_OPN_DATE,'DD-MM-YYYY')ACCT_OPN_DATE,to_char(INT_RATE,'9,999,999,999,990.99')INT_RATE,to_char(ACCT_BALANCE_AMT_AC,'9,999,999,999,990.99')ACCT_BALANCE_AMT_AC,ACCT_CRNCY_CODE,ISIC_CODE,NATURE_OF_CUST,NRE_FLG,COUNTRY,BOM_GROUP_IDENTIFIER,CUST_UNIQUE_IDENTIFIER,to_char(LOAN_AMOUNT,'9,999,999,999,990.99')LOAN_AMOUNT,to_char(SPEC_PROV,'9,999,999,999,990.99')SPEC_PROV,to_char(BAD_DR_WR_OFF,'9,999,999,999,990.99')BAD_DR_WR_OFF,DPD_CNTR,IMPAIRED_FLG,to_char(SEC_AMOUNT,'9,999,999,999,990.99')SEC_AMOUNT,PURPOSE_OF_LOAN,SME_FLG,NON_FUND_BASED_FACILITIES,TO_CHAR(RESHDL_DATE,'DD-MM-YYYY')RESHDL_DATE,RESTRUCTURED_FLG,NO_OF_RESTRUCTURE,TO_CHAR(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE from table(SUP0604_DTL_FUN('"+reptype+"','"+ReporefSeq+"','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
		
log.info("DOC&&&&SELECT Gayu"+sql.toString());
	
	try {
		
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		
		XBRLSUP0604Bean xb=new XBRLSUP0604Bean();
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
public String detailSUP0604saves() {
	
	

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

public ArrayList<XBRLSUP0604Bean>SUP0604verify(){
	
	ArrayList<XBRLSUP0604Bean> arl = new ArrayList<XBRLSUP0604Bean>();
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	sql.	append("SELECT   /* +FIRST_ROWS(100) */ ACCT_NUMBER,ACCT_NAME,CUST_ID,SCHM_CODE,SCHM_TYPE,TO_CHAR(ACCT_OPN_DATE,'DD-MM-YYYY')ACCT_OPN_DATE,to_char(INT_RATE,'9,999,999,999,990.99')INT_RATE,to_char(ACCT_BALANCE_AMT_AC,'9,999,999,999,990.99')ACCT_BALANCE_AMT_AC,ACCT_CRNCY_CODE,ISIC_CODE,NATURE_OF_CUST,NRE_FLG,COUNTRY,BOM_GROUP_IDENTIFIER,CUST_UNIQUE_IDENTIFIER,to_char(LOAN_AMOUNT,'9,999,999,999,990.99')LOAN_AMOUNT,to_char(SPEC_PROV,'9,999,999,999,990.99')SPEC_PROV,to_char(BAD_DR_WR_OFF,'9,999,999,999,990.99')BAD_DR_WR_OFF,DPD_CNTR,IMPAIRED_FLG,to_char(SEC_AMOUNT,'9,999,999,999,990.99')SEC_AMOUNT,PURPOSE_OF_LOAN,SME_FLG,NON_FUND_BASED_FACILITIES,TO_CHAR(RESHDL_DATE,'DD-MM-YYYY')RESHDL_DATE,RESTRUCTURED_FLG,NO_OF_RESTRUCTURE,TO_CHAR(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,DECODE(DEL_FLG,'A','Added','M','Modified','D','Deleted') as DEL_FLG,LCHG_USER_ID  FROM SUP0010_MOD_TABLE ");
	log.info("Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     
	

	while(rs.next()){
		
		
		
		XBRLSUP0604Bean xb=new XBRLSUP0604Bean();
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
	} return arl;	
}



public String detailSUP0604savecheck() {

	ConnectionManager connmgr=new ConnectionManager();
	Connection conn=connmgr.getConnection();
	ArrayList<String> arl = new ArrayList<String>();
			HttpServletRequest request = ServletActionContext.getRequest();
			DateFormat df = new DateFormat();
			StringBuffer sql = new StringBuffer();
			PreparedStatement ps = null;
			
			sql.append("SELECT COUNT(REPORT_DATE) as repdate FROM SUP0604_S1_RPT_TB where REPORT_ID = '"+request.getParameter("reptype")+"' AND  REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ");
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
public String SUP0604chckmodified() {

	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	HttpSession session = request.getSession();
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	if(request.getParameter("type").equals("chkuser")) {
		sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM SUP0010_MOD_TABLE ");
	}else {
		//sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM PSC0106_MOD_TABLE WHERE REPORT_DATE='"+NullCheck.isNotNull(df.formatdate(request.getParameter("repdate")))+"'");
		sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM SUP0010_MOD_TABLE ");

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
	
	log.info("count in Mod table: "+cnt);
	return "success";
}
public String modSUP0604cancel() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	sql.append("DELETE FROM SUP0010_MOD_TABLE WHERE   CUST_ID='"+NullCheck.isNotNull(request.getParameter("custId"))+"' ");
	
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
public String SUP0604verifymaster() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	HttpSession session = request.getSession();
	StringBuffer sql = new StringBuffer();
	DateFormat df1=new DateFormat();	
	log.info("ddddddddddd");

	
	//------------------get data from mod table---------------------
	XBRLSUP0604Bean xb=new XBRLSUP0604Bean();
	
	log.info("ddddddddddd");

	sql.setLength(0);
	sql.append("SELECT   /* +FIRST_ROWS(100) */ ACCT_NUMBER,ACCT_NAME,CUST_ID,SCHM_CODE,SCHM_TYPE,TO_CHAR(ACCT_OPN_DATE,'DD-MM-YYYY')ACCT_OPN_DATE,to_char(INT_RATE,'9,999,999,999,990.99')INT_RATE,to_char(ACCT_BALANCE_AMT_AC,'9,999,999,999,990.99')ACCT_BALANCE_AMT_AC,ACCT_CRNCY_CODE,ISIC_CODE,NATURE_OF_CUST,NRE_FLG,COUNTRY,BOM_GROUP_IDENTIFIER,CUST_UNIQUE_IDENTIFIER,to_char(LOAN_AMOUNT,'9,999,999,999,990.99')LOAN_AMOUNT,to_char(SPEC_PROV,'9,999,999,999,990.99')SPEC_PROV,to_char(BAD_DR_WR_OFF,'9,999,999,999,990.99')BAD_DR_WR_OFF,DPD_CNTR,IMPAIRED_FLG,to_char(SEC_AMOUNT,'9,999,999,999,990.99')SEC_AMOUNT,PURPOSE_OF_LOAN,SME_FLG,NON_FUND_BASED_FACILITIES,TO_CHAR(RESHDL_DATE,'DD-MM-YYYY')RESHDL_DATE,RESTRUCTURED_FLG,NO_OF_RESTRUCTURE,TO_CHAR(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,DEL_FLG,LCHG_USER_ID  FROM SUP0010_MOD_TABLE "
			+ "WHERE CUST_ID='"+NullCheck.isNotNull(request.getParameter("custId"))+"' ");
	log.info("Gayu"+sql.toString());
	try {
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
		log.info("ddddddddddd");


		while(rs.next()){
			
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




	log.info("222222");

	if (xb.getModtyp().equals("A") ) {
		
	//For Added Records
		log.info("7544");


		sql.setLength(0);
		sql.append(
				"INSERT INTO SUP0010_MAST_TABLE(ACCT_NUMBER,ACCT_NAME,CUST_ID,SCHM_CODE,SCHM_TYPE,ACCT_OPN_DATE,INT_RATE,ACCT_BALANCE_AMT_AC,ACCT_CRNCY_CODE,ISIC_CODE,NATURE_OF_CUST,NRE_FLG,COUNTRY,BOM_GROUP_IDENTIFIER,CUST_UNIQUE_IDENTIFIER,LOAN_AMOUNT,SPEC_PROV,BAD_DR_WR_OFF,DPD_CNTR,IMPAIRED_FLG,SEC_AMOUNT,PURPOSE_OF_LOAN,SME_FLG,NON_FUND_BASED_FACILITIES,RESHDL_DATE,RESTRUCTURED_FLG,NO_OF_RESTRUCTURE,REPORT_DATE,DEL_FLG,LCHG_USER_ID,LCHG_TIME,VERIFY_USER_ID,VERIFY_TIME)"
						+ "values('" + request.getParameter("acctNum")
						+ "','" + request.getParameter("acctName") + "','"
						+ request.getParameter("custId") + "','" 
						+ request.getParameter("schmCode") + "','"
						+ request.getParameter("schmType") + "','" 
						+ df1.formatdate(request.getParameter("acctopenDate")) + "','"
						+ request.getParameter("intRate") + "','" 
						+request.getParameter("acctBalanceamtac") + "','"
						+ request.getParameter("acctCrncyCode") + "','"
						+ request.getParameter("isicCode") + "','" 
						+ request.getParameter("natureofCust") + "','"
						+ request.getParameter("nreFlg") + "','" 
						+ request.getParameter("country") + "','"
						+request.getParameter("bomGroupIdentifier") + "','" 
						+ request.getParameter("custUniqueIdentifier") + "','" 
						+ request.getParameter("loanAmt") + "','" 
						+ request.getParameter("specProv") + "','" 
						+ request.getParameter("badDrwroff") + "','" 
						+ request.getParameter("dprCntr") + "','" 
						+ request.getParameter("impairedFlg") + "','"  
						+ request.getParameter("secAmt") + "','" 
								+ request.getParameter("purposeofLoan") + "','" 
										+ request.getParameter("smeFlg") + "','" 
												+ request.getParameter("nonFundBasedFacilities") + "','" 
														+ df1.formatdate(request.getParameter("schdate")) + "','" 
																+ request.getParameter("resflg") + "','" 
																		+ request.getParameter("noofres") + "','" 
						+df1.formatdate(request.getParameter("reportDate"))+ "','"+xb.getModtyp()+"','"
								+ session.getAttribute("userName")+"',SYSDATE,'"+ session.getAttribute("userName")+"',SYSDATE)");


		log.info("224354542222");


try {
	log.info(sql.toString());

	ps=conn.prepareStatement(sql.toString());
	
    int rs=0;
    rs=ps.executeUpdate();
     
    status="success";
    
    sql.setLength(0);
    sql.append("DELETE FROM SUP0010_MOD_TABLE WHERE CUST_ID='"+NullCheck.isNotNull(request.getParameter("custId"))+"'");
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
log.info("0000000000000");

}else if (xb.getModtyp().equals("M") ) {

	log.info("999999999");

//For Modified Records
sql.setLength(0);
sql.append("UPDATE  SUP0010_MAST_TABLE set ACCT_NUMBER ='"
		+ NullCheck.isNotNull(request.getParameter("acctNum")) + "',ACCT_NAME ='" +NullCheck.isNotNull( request.getParameter("acctName"))
		+ "',CUST_ID ='" + NullCheck.isNotNull(request.getParameter("custId")) + "',SCHM_CODE ='"
		+ NullCheck.isNotNull(request.getParameter("schmCode")) + "',SCHM_TYPE ='"+ NullCheck.isNotNull(request.getParameter("schmType"))
		+ "',ACCT_OPN_DATE ='" +df1.formatdate(request.getParameter("acctopenDate"))
		+ "',INT_RATE ='"
		+ NullCheck.isNotNull(request.getParameter("intRate") )+ "',ACCT_BALANCE_AMT_AC ='" +NullCheck.isNotNull( request.getParameter("acctBalanceamtac"))
		+ "',ACCT_CRNCY_CODE ='" +NullCheck.isNotNull( request.getParameter("acctCrncyCode")) + "',ISIC_CODE ='"
		+ NullCheck.isNotNull(request.getParameter("isicCode")) + "',NATURE_OF_CUST ='"+NullCheck.isNotNull( request.getParameter("natureofCust"))
		+ "',NRE_FLG ='" +NullCheck.isNotNull(request.getParameter("nreFlg"))
		+ "',COUNTRY ='"
		+ NullCheck.isNotNull(request.getParameter("country") )+ "',BOM_GROUP_IDENTIFIER ='" +NullCheck.isNotNull(request.getParameter("bomGroupIdentifier"))
		+ "',CUST_UNIQUE_IDENTIFIER ='" + NullCheck.isNotNull(request.getParameter("custUniqueIdentifier")) + "',LOAN_AMOUNT ='" + NullCheck.isNotNull(request.getParameter("loanAmt") )+ "',SPEC_PROV ='"
								 + NullCheck.isNotNull(request.getParameter("specProv")) + "',BAD_DR_WR_OFF ='" +NullCheck.isNotNull( request.getParameter("badDrwroff")) + "',DPD_CNTR ='" + NullCheck.isNotNull(request.getParameter("dprCntr")) + "',IMPAIRED_FLG ='"+ NullCheck.isNotNull(request.getParameter("impairedFlg"))
								 	+ "',SEC_AMOUNT ='"+ NullCheck.isNotNull(request.getParameter("secAmt"))
								 	+ "',PURPOSE_OF_LOAN ='"+NullCheck.isNotNull( request.getParameter("purposeofLoan"))
								 	+ "',SME_FLG ='"+NullCheck.isNotNull( request.getParameter("smeFlg"))
								 	+ "',NON_FUND_BASED_FACILITIES ='"+ NullCheck.isNotNull(request.getParameter("nonFundBasedFacilities"))
								 	+ "',RESHDL_DATE ='"+ df1.formatdate(request.getParameter("schdate"))
								 	+ "',RESTRUCTURED_FLG ='"+ NullCheck.isNotNull(request.getParameter("resflg"))
								 	+ "',NO_OF_RESTRUCTURE ='"+ NullCheck.isNotNull(request.getParameter("noofres"))
						+ "',REPORT_DATE ='"

		+ df1.formatdate(request.getParameter("reportDate")) 
		+ "' ,VERIFY_USER_ID='"+session.getAttribute("userName")+"',VERIFY_TIME=SYSDATE "+ " "+ " where ACCT_NUMBER ='" + NullCheck.isNotNull(request.getParameter("acctNum")) +"'and ACCT_NAME ='" + NullCheck.isNotNull(request.getParameter("acctName")) +"' and  CUST_ID ='" + NullCheck.isNotNull(request.getParameter("custId")) +"'and   REPORT_DATE ='" + df1.formatdate(request.getParameter("reportDate"))+"'");

log.info("224354542222");

try {
	log.info(sql.toString());
 

	ps=conn.prepareStatement(sql.toString());
	
    int rs=0;
    rs=ps.executeUpdate();
     
    status="success";
    
    sql.setLength(0);
    sql.append("DELETE FROM SUP0010_MOD_TABLE WHERE CUST_ID='"+NullCheck.isNotNull(request.getParameter("custId"))+"'");

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
	sql.append("DELETE FROM SUP0010_MAST_TABLE WHERE CUST_ID='"+NullCheck.isNotNull(request.getParameter("custId"))+"'");

	try {
		log.info(sql.toString());
		ps=conn.prepareStatement(sql.toString());
		
	    int rs=0;
	    rs=ps.executeUpdate();
	     
	    status="success";
	    log.info(status);
	    sql.setLength(0);
	    sql.append("UPDATE SUP0010_MOD_TABLE SET LCHG_USER_ID='"+session.getAttribute("userName")+"' WHERE REPORT_DATE='"+df1.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"' and CUST_ID='"+NullCheck.isNotNull(request.getParameter("custId"))+"'");

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
		sql.append("DELETE FROM PSC501_MOD_TABLE WHERE CUST_ID='"+NullCheck.isNotNull(request.getParameter("custId"))+"'");
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
