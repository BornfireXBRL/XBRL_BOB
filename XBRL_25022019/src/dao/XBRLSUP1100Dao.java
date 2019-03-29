package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import basecode.DateFormat;
import bean.XBRLSUP1100Bean;
import bean.XBRLSUP1100Bean;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRLSUP1100Dao {


static Logger log = Logger.getLogger(XBRLSUP1100Dao.class);
public String resalert;

public String cnt;

public int cnt1;


public int getCnt1() {
	return cnt1;
}

public void setCnt1(int cnt1) {
	this.cnt1 = cnt1;
}

public String getResalert() {
	return resalert;
}

public void setResalert(String resalert) {
	this.resalert = resalert;
}

public String getCnt() {
	return cnt;
}

public void setCnt(String cnt) {
	this.cnt = cnt;
}

public String Reporef;

	public String getReporef() {
		return Reporef;
	}

	public void setReporef(String reporef) {
		Reporef = reporef;
	}
	
	public ArrayList<XBRLSUP1100Dao> ReporefSeq(String dt1, String dt2) {

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

		ArrayList<XBRLSUP1100Dao> arl = new ArrayList<XBRLSUP1100Dao>();
		sql.append("select REPORT_REF_NO from SUP1100_MOD_TABLE where REPORT_DATE='" + dt2 + "' ORDER BY REPORT_REF_NO");

		log.info("SELECTPROFILE" + sql.toString());

		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLSUP1100Dao xel = new XBRLSUP1100Dao();
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

	


	
	/*************DB Link****************/
	
	public ArrayList<XBRLSUP1100Bean> xbrlsup1100sumEP(String dt2,String ReporefSeq,String curr) {
		
		log.info("SUP SUMMARY List Data AB "  + "dt22222" + dt2);
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLSUP1100Bean> arl = new ArrayList<XBRLSUP1100Bean>();
		
		String status = "";
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		
		PreparedStatement ps = null;
		
		StringBuffer sql = new StringBuffer();
		
		
		DateFormat df=new DateFormat();		
		//dt1 =df.formatdate(dt1);
		dt2 =df.formatdate(dt2);
		
		 DecimalFormat dfs = new DecimalFormat("##,##.00");  
		
	
		try {
		
			
			log.info("Kumar" + ReporefSeq.trim());
			//sql.append("SELECT DYNAMIC_DOMAIN,to_char(REP_DATE,'DD-MM-YYYY')REP_DATE,INSTITUTE_ID,TRAN_ID,INSTITUTE_NAME,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,SECTOR,SPOT_RATE,FWD_RATE,to_char(DUE_DATE,'DD-MM-YYYY')DUE_DATE,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME    FROM   FIM0400_MAST_TABLE  Where  REP_DATE >='"+dt1+"' and REP_DATE <= '"+dt2+"' ORDER BY cast(TRAN_ID as int) ASC ");
			
				
				log.info("Report ref" );
				
				//sql.append("SELECT REPORT_REF_NO,MODES,CHQ_NUMBER,ACCT_NUMBER,ACCT_NAME,to_char(TRAN_DATE,'DD-MM-YYYY')TRAN_DATE,CHQ_AMOUNT,CRNCY,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME  FROM TABLE(PYM0100_RPT_FUN('PYM0100','"+ReporefSeq.trim()+"','31-MAR-2014','31-MAR-2014','31-MAR-2014'))");
							
				sql.append("SELECT  CUST_NAME,UNIQUE_ID,to_char(SANC_DATE,'DD-MM-YYYY')SANC_DATE,TYPE_OF_FACILITY,to_char(AMT, '9,999,999,999,990.99')AMT,PURPOSE,"
							+ "SECURITY_DETAILS,to_char(SEC_VALUATION_DT,'DD-MM-YYYY')SEC_VALUATION_DT,SEC_VALUE,SEC_VALUER_NAME,to_char(NPA_DATE,'DD-MM-YYYY')NPA_DATE,REALIS_VALUE_OF_SEC,"
						+ "PROVISION,to_char(LEGAL_ACTION_Dt,'DD-MM-YYYY')LEGAL_ACTION_Dt,BALANCE_ON_FORECLOSURE,to_char(SALE_BY_LEVY_DATE,'DD-MM-YYYY')SALE_BY_LEVY_DATE,"
						+ "SALE_REF_NO,SECURITY_ENFORCED,to_char(ACTUAL_SALE_DATE,'DD-MM-YYYY')ACTUAL_SALE_DATE,to_char(AMOUNT_OF_SALE, '9,999,999,999,990.99')AMOUNT_OF_SALE,AMT_ATTRIBUTED_BANK,to_char(RECOVERY_COST, '9,999,999,999,990.99')RECOVERY_COST,ASSET_PURCHASED "
						+ " FROM TABLE(SUP1100_RPT_FUN('SUP1100','"+ReporefSeq.trim()+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
				
			
			log.info("BLS SUMMARY "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				
				
				 
				XBRLSUP1100Bean xb=new XBRLSUP1100Bean();
				
				xb.setCustomername(NullCheck.isNotNull(rs.getString("CUST_NAME")));	  	
				xb.setUniqidentinoofcust(NullCheck.isNotNull(rs.getString("UNIQUE_ID")));	   	
				xb.setSanctiondate(NullCheck.isNotNull(rs.getString("SANC_DATE")));	    	
				xb.setTypeoffacility(NullCheck.isNotNull(rs.getString("TYPE_OF_FACILITY")));	
				xb.setAmtsantioned(NullCheck.isNotNull(rs.getString("AMT")));           	
				xb.setPurpose(NullCheck.isNotNull(rs.getString("PURPOSE")));          	
				xb.setDetaiofsecurity(NullCheck.isNotNull(rs.getString("SECURITY_DETAILS")));	
				xb.setLastvaluadate(NullCheck.isNotNull(rs.getString("SEC_VALUATION_DT")));	
				xb.setValueofsecurity(NullCheck.isNotNull(rs.getString("SEC_VALUE")));	     	
				xb.setNameofvaluer(NullCheck.isNotNull(rs.getString("SEC_VALUER_NAME")));	   
				xb.setDateclassiasnpa(NullCheck.isNotNull(rs.getString("NPA_DATE")));      	
				xb.setEstirealivalofsecur(NullCheck.isNotNull(rs.getString("REALIS_VALUE_OF_SEC")));
				xb.setAmtofprovismade(NullCheck.isNotNull(rs.getString("PROVISION")));	    	
				xb.setDateonwhlegactwainit(NullCheck.isNotNull(rs.getString("LEGAL_ACTION_Dt")));	   
				xb.setOutstabalatforclsdate(NullCheck.isNotNull(rs.getString("BALANCE_ON_FORECLOSURE")));	
				xb.setDateofsalbylevy(NullCheck.isNotNull(rs.getString("SALE_BY_LEVY_DATE")));	
				xb.setLeavysalrefno(NullCheck.isNotNull(rs.getString("SALE_REF_NO")));	
				xb.setSecurenforced(NullCheck.isNotNull(rs.getString("SECURITY_ENFORCED")));	
				xb.setDateofactusal(NullCheck.isNotNull(rs.getString("ACTUAL_SALE_DATE")));	
				xb.setAmtofactusal(NullCheck.isNotNull(rs.getString("AMOUNT_OF_SALE")));		
				xb.setAmtattritobank(NullCheck.isNotNull(rs.getString("AMT_ATTRIBUTED_BANK")));
				xb.setActurecovcosts(NullCheck.isNotNull(rs.getString("RECOVERY_COST")));		
				xb.setStatwheasstwerpurbank(NullCheck.isNotNull(rs.getString("ASSET_PURCHASED")));
				
				/*	
				  	
				xb.setInstancname(NullCheck.isNotNull(rs.getString("INSTANCE_NAME")));
				xb.setInstanccode(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));			
				xb.setNooftrans(NullCheck.isNotNull(rs.getString("NO_OF_TRAN")));
				xb.setValoftrans(NullCheck.isNotNull(rs.getString("VALUE_OF_TRAN")));*/
				
			
			
				arl.add(xb);
			   
			}
		
		
		log.info("ARLLL"+arl.size());
		
		
		
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
	
	
	
	/*************************Details SUP1100***********************/
	
	
public ArrayList<XBRLSUP1100Bean> xbrlsup1100ajaxdetails(String reptype,String ReporefSeq,String instno,String dt2,String dt1,String curr) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("reptype    " + reptype + "ReporefSeq   "  + ReporefSeq + "instno"+ instno +"dt2   " + dt2 +"currency" +curr);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLSUP1100Bean> arl = new ArrayList<XBRLSUP1100Bean>();
		NullCheck chk=new NullCheck();
		String status = "";
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		
		PreparedStatement ps = null;
		
		StringBuffer sql = new StringBuffer();
		
		
		DateFormat df=new DateFormat();		
		//dt1 =df.formatdate(dt1);
		dt2 =df.formatdate(dt2);
		
		 DecimalFormat dfs = new DecimalFormat("##,##.00");  
		
	
		try {
		
			
	log.info("AJAX DETAILS KUMAR" + ReporefSeq );
			sql.append("SELECT  CUST_NAME,UNIQUE_ID,to_char(SANC_DATE,'DD-MM-YYYY')SANC_DATE,TYPE_OF_FACILITY,to_char(AMT, '9,999,999,999,990.99')AMT,PURPOSE,"
					+ "SECURITY_DETAILS,to_char(SEC_VALUATION_DT,'DD-MM-YYYY')SEC_VALUATION_DT,SEC_VALUE,SEC_VALUER_NAME,to_char(NPA_DATE,'DD-MM-YYYY')NPA_DATE,REALIS_VALUE_OF_SEC,"
				+ "PROVISION,to_char(LEGAL_ACTION_Dt,'DD-MM-YYYY')LEGAL_ACTION_Dt,BALANCE_ON_FORECLOSURE,to_char(SALE_BY_LEVY_DATE,'DD-MM-YYYY')SALE_BY_LEVY_DATE,"
				+ "SALE_REF_NO,SECURITY_ENFORCED,to_char(ACTUAL_SALE_DATE,'DD-MM-YYYY')ACTUAL_SALE_DATE,to_char(AMOUNT_OF_SALE, '9,999,999,999,990.99')AMOUNT_OF_SALE,AMT_ATTRIBUTED_BANK,to_char(RECOVERY_COST, '9,999,999,999,990.99')RECOVERY_COST,ASSET_PURCHASED "
				+ " FROM TABLE(SUP1100_DTL_FUN('"+reptype+"','"+chk.notZero(ReporefSeq)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
		

			log.info("BLS  Kumar  "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				//log.info("whileee");
								
				 
				XBRLSUP1100Bean xb=new XBRLSUP1100Bean();
				
				
				//xb.setSrlno(NullCheck.isNotNull(rs.getString("SL_NO")));	          	
				xb.setCustomername(NullCheck.isNotNull(rs.getString("CUST_NAME")));	  	
				xb.setUniqidentinoofcust(NullCheck.isNotNull(rs.getString("UNIQUE_ID")));	   	
				xb.setSanctiondate(NullCheck.isNotNull(rs.getString("SANC_DATE")));	    	
				xb.setTypeoffacility(NullCheck.isNotNull(rs.getString("TYPE_OF_FACILITY")));	
				xb.setAmtsantioned(NullCheck.isNotNull(rs.getString("AMT")));           	
				xb.setPurpose(NullCheck.isNotNull(rs.getString("PURPOSE")));          	
				xb.setDetaiofsecurity(NullCheck.isNotNull(rs.getString("SECURITY_DETAILS")));	
				xb.setLastvaluadate(NullCheck.isNotNull(rs.getString("SEC_VALUATION_DT")));	
				xb.setValueofsecurity(NullCheck.isNotNull(rs.getString("SEC_VALUE")));	     	
				xb.setNameofvaluer(NullCheck.isNotNull(rs.getString("SEC_VALUER_NAME")));	   
				xb.setDateclassiasnpa(NullCheck.isNotNull(rs.getString("NPA_DATE")));      	
				xb.setEstirealivalofsecur(NullCheck.isNotNull(rs.getString("REALIS_VALUE_OF_SEC")));
				xb.setAmtofprovismade(NullCheck.isNotNull(rs.getString("PROVISION")));	    	
				xb.setDateonwhlegactwainit(NullCheck.isNotNull(rs.getString("LEGAL_ACTION_Dt")));	   
				xb.setOutstabalatforclsdate(NullCheck.isNotNull(rs.getString("BALANCE_ON_FORECLOSURE")));	
				xb.setDateofsalbylevy(NullCheck.isNotNull(rs.getString("SALE_BY_LEVY_DATE")));	
				xb.setLeavysalrefno(NullCheck.isNotNull(rs.getString("SALE_REF_NO")));	
				xb.setSecurenforced(NullCheck.isNotNull(rs.getString("SECURITY_ENFORCED")));	
				xb.setDateofactusal(NullCheck.isNotNull(rs.getString("ACTUAL_SALE_DATE")));	
				xb.setAmtofactusal(NullCheck.isNotNull(rs.getString("AMOUNT_OF_SALE")));		
				xb.setAmtattritobank(NullCheck.isNotNull(rs.getString("AMT_ATTRIBUTED_BANK")));
				xb.setActurecovcosts(NullCheck.isNotNull(rs.getString("RECOVERY_COST")));		
				xb.setStatwheasstwerpurbank(NullCheck.isNotNull(rs.getString("ASSET_PURCHASED")));	


		
				arl.add(xb);
			    
			}
		
		
		log.info("ARLLL"+arl.size());
		
		
		
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



public String detailSUP1100saves(){

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

public String detailSUP1100savecheck() {

	ConnectionManager connmgr=new ConnectionManager();
	Connection conn=connmgr.getConnection();
	ArrayList<String> arl = new ArrayList<String>();
			HttpServletRequest request = ServletActionContext.getRequest();
			DateFormat df = new DateFormat();
			StringBuffer sql = new StringBuffer();
			PreparedStatement ps = null;
			
			sql.append("SELECT COUNT(REPORT_DATE) as repdate FROM SUP1100_RPT_TB where REPORT_ID = '"+request.getParameter("reptype")+"' AND  REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ");
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



public String SUP1100chckmodified() {

	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	HttpSession session = request.getSession();
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	if(request.getParameter("type").equals("chkuser")) {
		sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM SUP1100_MOD_TABLE ");
	}else {
		//sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM SUP1100_MOD_TABLE WHERE REPORT_DATE='"+NullCheck.isNotNull(df.formatdate(request.getParameter("repdate")))+"'");
		sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM SUP1100_MOD_TABLE ");

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


public String modSUP1100cancel() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	sql.append("DELETE FROM SUP1100_MOD_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"' and CODE='"+NullCheck.isNotNull(request.getParameter("code"))+"'");
	
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



public ArrayList<XBRLSUP1100Bean> SUP1100verify(){
	
	ArrayList<XBRLSUP1100Bean> arl = new ArrayList<XBRLSUP1100Bean>();
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	sql.append("SELECT /* +FIRST_ROWS(100) */REPORT_DATE,CUST_NAME,UNIQUE_ID,SANC_DATE,TYPE_OF_FACILITY,AMT,PURPOSE, SECURITY_DETAILS,SEC_VALUATION_DT,SEC_VALUE,SEC_VALUER_NAME,NPA_DATE,REALIS_VALUE_OF_SEC,PROVISION,LEGAL_ACTION_Dt,BALANCE_ON_FORECLOSURE,SALE_BY_LEVY_DATE,SALE_REF_NO,SECURITY_ENFORCED,ACTUAL_SALE_DATE,AMOUNT_OF_SALE,AMT_ATTRIBUTED_BANK,RECOVERY_COST,ASSET_PURCHASED ,REPORT_DATE,DECODE(DEL_FLG,'A','Added','M','Modified','D','Deleted') as DEL_FLG ,LCHG_USER_ID FROM SUP1100_MOD_TABLE");
	log.info("Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		XBRLSUP1100Bean xb=new XBRLSUP1100Bean();
		xb.setRepdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));	  	

		xb.setCustomername(NullCheck.isNotNull(rs.getString("CUST_NAME")));	  	
		xb.setUniqidentinoofcust(NullCheck.isNotNull(rs.getString("UNIQUE_ID")));	   	
		xb.setSanctiondate(NullCheck.isNotNull(rs.getString("SANC_DATE")));	    	
		xb.setTypeoffacility(NullCheck.isNotNull(rs.getString("TYPE_OF_FACILITY")));	
		xb.setAmtsantioned(NullCheck.isNotNull(rs.getString("AMT")));           	
		xb.setPurpose(NullCheck.isNotNull(rs.getString("PURPOSE")));          	
		xb.setDetaiofsecurity(NullCheck.isNotNull(rs.getString("SECURITY_DETAILS")));	
		xb.setLastvaluadate(NullCheck.isNotNull(rs.getString("SEC_VALUATION_DT")));	
		xb.setValueofsecurity(NullCheck.isNotNull(rs.getString("SEC_VALUE")));	     	
		xb.setNameofvaluer(NullCheck.isNotNull(rs.getString("SEC_VALUER_NAME")));	   
		xb.setDateclassiasnpa(NullCheck.isNotNull(rs.getString("NPA_DATE")));      	
		xb.setEstirealivalofsecur(NullCheck.isNotNull(rs.getString("REALIS_VALUE_OF_SEC")));
		xb.setAmtofprovismade(NullCheck.isNotNull(rs.getString("PROVISION")));	    	
		xb.setDateonwhlegactwainit(NullCheck.isNotNull(rs.getString("LEGAL_ACTION_Dt")));	   
		xb.setOutstabalatforclsdate(NullCheck.isNotNull(rs.getString("BALANCE_ON_FORECLOSURE")));	
		xb.setDateofsalbylevy(NullCheck.isNotNull(rs.getString("SALE_BY_LEVY_DATE")));	
		xb.setLeavysalrefno(NullCheck.isNotNull(rs.getString("SALE_REF_NO")));	
		xb.setSecurenforced(NullCheck.isNotNull(rs.getString("SECURITY_ENFORCED")));	
		xb.setDateofactusal(NullCheck.isNotNull(rs.getString("ACTUAL_SALE_DATE")));	
		xb.setAmtofactusal(NullCheck.isNotNull(rs.getString("AMOUNT_OF_SALE")));		
		xb.setAmtattritobank(NullCheck.isNotNull(rs.getString("AMT_ATTRIBUTED_BANK")));
		xb.setActurecovcosts(NullCheck.isNotNull(rs.getString("RECOVERY_COST")));		
		xb.setStatwheasstwerpurbank(NullCheck.isNotNull(rs.getString("ASSET_PURCHASED")));	


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

public String SUP1100verifymaster() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	HttpSession session = request.getSession();
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();	
	
	//------------------get data from mod table---------------------
	XBRLSUP1100Bean xb=new XBRLSUP1100Bean();
	
	sql.setLength(0);
	sql.append("SELECT /* +FIRST_ROWS(100) */CUST_NAME,UNIQUE_ID,SANC_DATE,TYPE_OF_FACILITY,AMT,PURPOSE, SECURITY_DETAILS,SEC_VALUATION_DT,SEC_VALUE,SEC_VALUER_NAME,NPA_DATE,REALIS_VALUE_OF_SEC,PROVISION,LEGAL_ACTION_Dt,BALANCE_ON_FORECLOSURE,SALE_BY_LEVY_DATE,SALE_REF_NO,SECURITY_ENFORCED,ACTUAL_SALE_DATE,AMOUNT_OF_SALE,AMT_ATTRIBUTED_BANK,RECOVERY_COST,ASSET_PURCHASED ,REPORT_DATE,DEL_FLG,LCHG_USER_ID FROM SUP1100_MOD_TABLE "
			+ "WHERE CUST_NAME ='" + NullCheck.isNotNull(request.getParameter("customername")) +"'and UNIQUE_ID ='" + NullCheck.isNotNull(request.getParameter("uniqidentinoofcust")) +"' and REPORT_DATE ='" + df.formatdate(request.getParameter("repdate"))+"'");
	log.info("Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		

		xb.setCustomername(NullCheck.isNotNull(rs.getString("CUST_NAME")));	  	
		xb.setUniqidentinoofcust(NullCheck.isNotNull(rs.getString("UNIQUE_ID")));	   	
		xb.setSanctiondate(NullCheck.isNotNull(rs.getString("SANC_DATE")));	    	
		xb.setTypeoffacility(NullCheck.isNotNull(rs.getString("TYPE_OF_FACILITY")));	
		xb.setAmtsantioned(NullCheck.isNotNull(rs.getString("AMT")));           	
		xb.setPurpose(NullCheck.isNotNull(rs.getString("PURPOSE")));          	
		xb.setDetaiofsecurity(NullCheck.isNotNull(rs.getString("SECURITY_DETAILS")));	
		xb.setLastvaluadate(NullCheck.isNotNull(rs.getString("SEC_VALUATION_DT")));	
		xb.setValueofsecurity(NullCheck.isNotNull(rs.getString("SEC_VALUE")));	     	
		xb.setNameofvaluer(NullCheck.isNotNull(rs.getString("SEC_VALUER_NAME")));	   
		xb.setDateclassiasnpa(NullCheck.isNotNull(rs.getString("NPA_DATE")));      	
		xb.setEstirealivalofsecur(NullCheck.isNotNull(rs.getString("REALIS_VALUE_OF_SEC")));
		xb.setAmtofprovismade(NullCheck.isNotNull(rs.getString("PROVISION")));	    	
		xb.setDateonwhlegactwainit(NullCheck.isNotNull(rs.getString("LEGAL_ACTION_Dt")));	   
		xb.setOutstabalatforclsdate(NullCheck.isNotNull(rs.getString("BALANCE_ON_FORECLOSURE")));	
		xb.setDateofsalbylevy(NullCheck.isNotNull(rs.getString("SALE_BY_LEVY_DATE")));	
		xb.setLeavysalrefno(NullCheck.isNotNull(rs.getString("SALE_REF_NO")));	
		xb.setSecurenforced(NullCheck.isNotNull(rs.getString("SECURITY_ENFORCED")));	
		xb.setDateofactusal(NullCheck.isNotNull(rs.getString("ACTUAL_SALE_DATE")));	
		xb.setAmtofactusal(NullCheck.isNotNull(rs.getString("AMOUNT_OF_SALE")));		
		xb.setAmtattritobank(NullCheck.isNotNull(rs.getString("AMT_ATTRIBUTED_BANK")));
		xb.setActurecovcosts(NullCheck.isNotNull(rs.getString("RECOVERY_COST")));		
		xb.setStatwheasstwerpurbank(NullCheck.isNotNull(rs.getString("ASSET_PURCHASED")));	


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
				"INSERT INTO SUP1100_MOD_TABLE(REPORT_REF_NO, CUST_NAME,UNIQUE_ID,SANC_DATE,TYPE_OF_FACILITY,AMT,PURPOSE, SECURITY_DETAILS,SEC_VALUATION_DT,SEC_VALUE,SEC_VALUER_NAME,NPA_DATE,REALIS_VALUE_OF_SEC,PROVISION,LEGAL_ACTION_Dt,BALANCE_ON_FORECLOSURE,SALE_BY_LEVY_DATE,SALE_REF_NO,SECURITY_ENFORCED,ACTUAL_SALE_DATE,AMOUNT_OF_SALE,AMT_ATTRIBUTED_BANK,RECOVERY_COST,ASSET_PURCHASED ,REPORT_DATE,DEL_FLG,LCHG_USER_ID,LCHG_TIME,VERIFY_USER_ID,VERIFY_TIME)"
						+ "values('" + request.getParameter("customername")
						+ "','" + request.getParameter("uniqidentinoofcust") + "','"
						+ df.formatdate(request.getParameter("sanctiondate")) + "','" 
						+ request.getParameter("typeoffacility") + "','"
						+ request.getParameter("amtsantioned") + "','" 
						+request.getParameter("purpose") + "','"
						+ request.getParameter("detaiofsecurity") + "','" 
						+df.formatdate(request.getParameter("lastvaluadate")) + "','"
						+ request.getParameter("valueofsecurity") + "','"
						+ request.getParameter("nameofvaluer") + "','" 
						+ df.formatdate(request.getParameter("dateclassiasnpa")) + "','"
						+ request.getParameter("estirealivalofsecur") + "','" 
						+ request.getParameter("amtofprovismade") + "','"
						+df.formatdate(request.getParameter("dateonwhlegactwainit")) + "','" 
						+ request.getParameter("outstabalatforclsdate") + "','" 
						+ df.formatdate(request.getParameter("dateofsalbylevy")) + "','" 
						+ request.getParameter("leavysalrefno") + "','" 
						+ request.getParameter("securenforced") + "','" 
						+ df.formatdate(request.getParameter("dateofactusal")) + "','" 
						+ request.getParameter("amtofactusal") + "','"  
						+ request.getParameter("amtattritobank") + "','" 
								+ request.getParameter("acturecovcosts") + "','" 
										+ request.getParameter("statwheasstwerpurbank") + "','" 
						+df.formatdate(request.getParameter("dt2"))+ "','"+ request.getParameter("modtyp") + "','" + session.getAttribute("userName")
						+ "',SYSDATE,'"+ session.getAttribute("userName")+"',SYSDATE)");
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("DELETE FROM SUP1100_MOD_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"' and CODE='"+NullCheck.isNotNull(request.getParameter("code"))+"'");
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
		sql.append("UPDATE SUP1100_MAST_TABLE SET CODE='"+NullCheck.isNotNull(request.getParameter("code"))+"',NO_OF_COINS='"+NullCheck.isNotNull(request.getParameter("noofcoin"))+"',REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"',VERIFY_USER='"+session.getAttribute("userName")+"',VERIFY_TIME=SYSDATE WHERE CODE='"+NullCheck.isNotNull(request.getParameter("code"))+"' AND REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"'");
		
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("DELETE FROM SUP1100_MOD_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"' and CODE='"+NullCheck.isNotNull(request.getParameter("code"))+"'");
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
		sql.append("DELETE FROM SUP1100_MAST_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"' and CODE='"+NullCheck.isNotNull(request.getParameter("code"))+"'");
		
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("UPDATE SUP1100_MOD_TABLE SET LCHG_USER='"+session.getAttribute("userName")+"' WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"' and CODE='"+NullCheck.isNotNull(request.getParameter("code"))+"'");
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
		    sql.append("DELETE FROM SUP1100_MOD_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"' and CODE='"+NullCheck.isNotNull(request.getParameter("code"))+"'");
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
