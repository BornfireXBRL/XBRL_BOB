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
import bean.XBRLPSC0102Bean;
import bean.XBRLPSC0106Bean;

import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRLPSC0106Dao {
	
	static Logger log = Logger.getLogger(XBRLPSC0106Dao.class);
	
	

	public int cnt1;
	public String cnt;

	public String resalert;
	
		
	public String Reporef;

	public String getReporef() {
		return Reporef;
	}

	public void setReporef(String reporef) {
		Reporef = reporef;
	}
	
	public ArrayList<XBRLPSC0106Dao> ReporefSeq(String dt1, String dt2) {

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

		ArrayList<XBRLPSC0106Dao> arl = new ArrayList<XBRLPSC0106Dao>();
		sql.append("select REPORT_REF_NO from PSC0105_S1_MOD_TABLE where REPORT_DATE='" + dt2 + "' ORDER BY REPORT_REF_NO");

		log.info("SELECTPROFILE" + sql.toString());

		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLPSC0106Dao xel = new XBRLPSC0106Dao();
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



public ArrayList<XBRLPSC0106Bean> xbrlpsc0106(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLPSC0106Bean> arl = new ArrayList<XBRLPSC0106Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	NullCheck chk=new NullCheck();

	 

	try {
	
			
			sql.append("select ACCT_NAME,TYPE_OF_ENTITY,ISIC_CODE,to_char(AMT_PERFORMING,'9,999,999,999,990.99')AMT_PERFORMING,to_char(AMT_IMPAIRED,'9,999,999,999,990.99')AMT_IMPAIRED,to_char(SME_AMT,'9,999,999,999,990.99')SME_AMT,to_char(OD_AMT,'9,999,999,999,990.99')OD_AMT,to_char(FL_AMT,'9,999,999,999,990.99')FL_AMT,to_char(OTHERS_AMT,'9,999,999,999,990.99')OTHERS_AMT,to_char(TOTAL_AMT,'9,999,999,999,990.99')TOTAL_AMT,to_char(OUTS_SME_AMT,'9,999,999,999,990.99')OUTS_SME_AMT,to_char(OUTS_OD_AMT,'9,999,999,999,990.99')OUTS_OD_AMT,to_char(OUTS_FL_AMT,'9,999,999,999,990.99')OUTS_FL_AMT,to_char(OUTS_OTHERS_AMT,'9,999,999,999,990.99')OUTS_OTHERS_AMT,to_char(OUTS_TOTAL_AMT,'9,999,999,999,990.99')OUTS_TOTAL_AMT from table(PSC0106_RPT_FUN('"+reptype+"','"+chk.notZero(ReporefSeq)+"','"+dt2+"','"+dt2+"','"+dt2+"','MUR'))");
			
	
		log.info("Psc00106 "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLPSC0106Bean xb=new XBRLPSC0106Bean();
		

			xb.setIsicCode(NullCheck.isNotNull(rs.getString("ISIC_CODE")));
				xb.setAcctName(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
				xb.setEntityType(NullCheck.isNotNull(rs.getString("TYPE_OF_ENTITY")));
				xb.setAmtPerforming(NullCheck.isNotNull(rs.getString("AMT_PERFORMING")));
				xb.setAmtImpaired(NullCheck.isNotNull(rs.getString("AMT_IMPAIRED")));
				xb.setSmeAmt(NullCheck.isNotNull(rs.getString("SME_AMT")));
				xb.setOutstandingAmt(NullCheck.isNotNull(rs.getString("OD_AMT")));
				xb.setFlAmt(NullCheck.isNotNull(rs.getString("FL_AMT")));
				xb.setOtherAmt(NullCheck.isNotNull(rs.getString("OTHERS_AMT")));
				xb.setTotalAmt(NullCheck.isNotNull(rs.getString("TOTAL_AMT")));
				xb.setOutsmeAmt(NullCheck.isNotNull(rs.getString("OUTS_SME_AMT")));
				xb.setOutOd(NullCheck.isNotNull(rs.getString("OUTS_OD_AMT")));
				xb.setOutFlease(NullCheck.isNotNull(rs.getString("OUTS_FL_AMT")));
				xb.setOutOthers(NullCheck.isNotNull(rs.getString("OUTS_OTHERS_AMT")));
				xb.setOutTotal(NullCheck.isNotNull(rs.getString("OUTS_TOTAL_AMT")));
			
		
		
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


public ArrayList<XBRLPSC0106Bean> xbrlpsc0106details(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
	
	
		
		
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLPSC0106Bean> arl = new ArrayList<XBRLPSC0106Bean>();
		
		String status = "";
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		
		PreparedStatement ps = null;
		
		StringBuffer sql = new StringBuffer();
		
		
		DateFormat df=new DateFormat();		
		dt1 =df.formatdate(dt1);
		dt2 =df.formatdate(dt2);
		
		NullCheck chk=new NullCheck();

		try {
		/*	'BLS0106','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))"
	*/			
			sql.append("select /* +FIRST_ROWS(100) */ACCT_NUMBER,ACCT_NAME,SCHM_CODE,SCHM_TYPE,ISIC_CODE,SME_FLG,to_char(OUTSTANDING_AMT, '9,999,999,999,990.99')OUTSTANDING_AMT,IMPAIRED_FLAG,to_char(ACCT_OPN_DATE,'DD-MM-YYYY')ACCT_OPN_DATE,to_char(RENEWAL_DATE,'DD-MM-YYYY')RENEWAL_DATE,SECURITY_FLG,RESTRUCTURED_FLG,to_char(RESTRUCTURED_DATE,'DD-MM-YYYY')RESTRUCTURED_DATE,to_char(SANCTION_AMT, '9,999,999,999,990.99')SANCTION_AMT,ACCT_CRNCY_CODE,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE  from table(PSC0105_S1_DTL_FUN('PSC0105','"+chk.notZero(ReporefSeq)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
				
		
			log.info("PSC0105d1 "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				XBRLPSC0106Bean xb=new XBRLPSC0106Bean();

				xb.setAccno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
				xb.setAcnam(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
				xb.setScode(NullCheck.isNotNull(rs.getString("SCHM_CODE")));
				xb.setStype(NullCheck.isNotNull(rs.getString("SCHM_TYPE")));
				xb.setIscode(NullCheck.isNotNull(rs.getString("ISIC_CODE")));
				xb.setSflag(NullCheck.isNotNull(rs.getString("SME_FLG")));
				xb.setOutamt(NullCheck.isNotNull(rs.getString("OUTSTANDING_AMT")));
				xb.setImpflg(NullCheck.isNotNull(rs.getString("IMPAIRED_FLAG")));
				xb.setAccopndat(NullCheck.isNotNull(rs.getString("ACCT_OPN_DATE")));
			
				xb.setRendat(NullCheck.isNotNull(rs.getString("RENEWAL_DATE")));
				xb.setSecflg(NullCheck.isNotNull(rs.getString("SECURITY_FLG")));
				xb.setReflg(NullCheck.isNotNull(rs.getString("RESTRUCTURED_FLG")));
				xb.setResdat(NullCheck.isNotNull(rs.getString("RESTRUCTURED_DATE")));
				xb.setSanamt(NullCheck.isNotNull(rs.getString("SANCTION_AMT")));
				xb.setAcccrcode(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
				xb.setRepdat(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
				
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
public ArrayList<XBRLPSC0106Bean> xbrpsc6RR(String reptype,String instno,String ReporefSeq,String dt1,String dt2,String curr) {
	
	
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLPSC0106Bean> arl = new ArrayList<XBRLPSC0106Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	NullCheck chk=new NullCheck();

	try {
	/*	'BLS0106','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))"
*/			
		sql.append("select /* +FIRST_ROWS(100) */ACCT_NUMBER,ACCT_NAME,SCHM_CODE,SCHM_TYPE,ISIC_CODE,SME_FLG,to_char(OUTSTANDING_AMT, '9,999,999,999,990.99')OUTSTANDING_AMT,IMPAIRED_FLAG,to_char(ACCT_OPN_DATE,'DD-MM-YYYY')ACCT_OPN_DATE,to_char(RENEWAL_DATE,'DD-MM-YYYY')RENEWAL_DATE,SECURITY_FLG,RESTRUCTURED_FLG,to_char(RESTRUCTURED_DATE,'DD-MM-YYYY')RESTRUCTURED_DATE,to_char(SANCTION_AMT, '9,999,999,999,990.99')SANCTION_AMT,ACCT_CRNCY_CODE,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE  from table(PSC0105_S1_DTL_FUN('PSC0105','"+chk.notZero(ReporefSeq)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
	
		log.info("PSC0105d1 "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLPSC0106Bean xb=new XBRLPSC0106Bean();

			xb.setAccno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
			xb.setAcnam(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
			xb.setScode(NullCheck.isNotNull(rs.getString("SCHM_CODE")));
			xb.setStype(NullCheck.isNotNull(rs.getString("SCHM_TYPE")));
			xb.setIscode(NullCheck.isNotNull(rs.getString("ISIC_CODE")));
			xb.setSflag(NullCheck.isNotNull(rs.getString("SME_FLG")));
			xb.setOutamt(NullCheck.isNotNull(rs.getString("OUTSTANDING_AMT")));
			xb.setImpflg(NullCheck.isNotNull(rs.getString("IMPAIRED_FLAG")));
			xb.setAccopndat(NullCheck.isNotNull(rs.getString("ACCT_OPN_DATE")));
		
			xb.setRendat(NullCheck.isNotNull(rs.getString("RENEWAL_DATE")));
			xb.setSecflg(NullCheck.isNotNull(rs.getString("SECURITY_FLG")));
			xb.setReflg(NullCheck.isNotNull(rs.getString("RESTRUCTURED_FLG")));
			xb.setResdat(NullCheck.isNotNull(rs.getString("RESTRUCTURED_DATE")));
			xb.setSanamt(NullCheck.isNotNull(rs.getString("SANCTION_AMT")));
			xb.setAcccrcode(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
			xb.setRepdat(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
			
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


public String detailPSC0106savecheck() {

	ConnectionManager connmgr=new ConnectionManager();
	Connection conn=connmgr.getConnection();
	ArrayList<String> arl = new ArrayList<String>();
			HttpServletRequest request = ServletActionContext.getRequest();
			DateFormat df = new DateFormat();
			StringBuffer sql = new StringBuffer();
			PreparedStatement ps = null;
			
			sql.append("SELECT COUNT(REPORT_DATE) as repdate FROM PSC0106_RPT_TB where REPORT_ID = '"+request.getParameter("reptype")+"' AND  REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ");
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




public String PSC0106chckmodified() {

	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	HttpSession session = request.getSession();
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	if(request.getParameter("type").equals("chkuser")) {
		sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM PSC0105_S1_MOD_TABLE ");
	}else {
		//sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM PSC0106_MOD_TABLE WHERE REPORT_DATE='"+NullCheck.isNotNull(df.formatdate(request.getParameter("repdate")))+"'");
		sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM PSC0105_S1_MOD_TABLE ");

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



public ArrayList<XBRLPSC0106Bean>PSC0106verify(){
	
	ArrayList<XBRLPSC0106Bean> arl = new ArrayList<XBRLPSC0106Bean>();
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	sql.	append("SELECT   /* +FIRST_ROWS(100) */ ACCT_NUMBER,ACCT_NAME,SCHM_CODE,SCHM_TYPE,ISIC_CODE,SME_FLG,to_char(OUTSTANDING_AMT, '9,999,999,999,990.99')OUTSTANDING_AMT,IMPAIRED_FLAG,to_char(ACCT_OPN_DATE,'DD-MM-YYYY')ACCT_OPN_DATE,to_char(RENEWAL_DATE,'DD-MM-YYYY')RENEWAL_DATE,SECURITY_FLG,RESTRUCTURED_FLG,to_char(RESTRUCTURED_DATE,'DD-MM-YYYY')RESTRUCTURED_DATE,to_char(SANCTION_AMT, '9,999,999,999,990.99')SANCTION_AMT,ACCT_CRNCY_CODE,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,DECODE(DEL_FLG,'A','Added','M','Modified','D','Deleted') as DEL_FLG,LCHG_USER_ID  FROM PSC0105_S1_MOD_TABLE ");
	log.info("Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     
	

	while(rs.next()){
		
		
		
		XBRLPSC0106Bean xb=new XBRLPSC0106Bean();
		xb.setAccno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
		xb.setAcnam(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
		xb.setScode(NullCheck.isNotNull(rs.getString("SCHM_CODE")));
		xb.setStype(NullCheck.isNotNull(rs.getString("SCHM_TYPE")));
		xb.setIscode(NullCheck.isNotNull(rs.getString("ISIC_CODE")));
		xb.setSflag(NullCheck.isNotNull(rs.getString("SME_FLG")));
		xb.setOutamt(NullCheck.isNotNull(rs.getString("OUTSTANDING_AMT")));
		xb.setImpflg(NullCheck.isNotNull(rs.getString("IMPAIRED_FLAG")));
		xb.setAccopndat(NullCheck.isNotNull(rs.getString("ACCT_OPN_DATE")));
	
		xb.setRendat(NullCheck.isNotNull(rs.getString("RENEWAL_DATE")));
		xb.setSecflg(NullCheck.isNotNull(rs.getString("SECURITY_FLG")));
		xb.setReflg(NullCheck.isNotNull(rs.getString("RESTRUCTURED_FLG")));
		xb.setResdat(NullCheck.isNotNull(rs.getString("RESTRUCTURED_DATE")));
		xb.setSanamt(NullCheck.isNotNull(rs.getString("SANCTION_AMT")));
		xb.setAcccrcode(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
		xb.setRepdat(NullCheck.isNotNull(rs.getString("REPORT_DATE")));

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
public String modPSC0106cancel() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	sql.append("DELETE FROM PSC0105_S1_MOD_TABLE WHERE   ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("accno"))+"' ");
	
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


public String PSC0106verifymaster() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	HttpSession session = request.getSession();
	StringBuffer sql = new StringBuffer();
	DateFormat df1=new DateFormat();		
	
	//------------------get data from mod table---------------------
	XBRLPSC0106Bean xb=new XBRLPSC0106Bean();
	
	sql.setLength(0);
	sql.append("SELECT   /* +FIRST_ROWS(100) */ ACCT_NUMBER,ACCT_NAME,SCHM_CODE,SCHM_TYPE,ISIC_CODE,SME_FLG,to_char(OUTSTANDING_AMT, '9,999,999,999,990.99')OUTSTANDING_AMT,IMPAIRED_FLAG,to_char(ACCT_OPN_DATE,'DD-MM-YYYY')ACCT_OPN_DATE,to_char(RENEWAL_DATE,'DD-MM-YYYY')RENEWAL_DATE,SECURITY_FLG,RESTRUCTURED_FLG,to_char(RESTRUCTURED_DATE,'DD-MM-YYYY')RESTRUCTURED_DATE,to_char(SANCTION_AMT, '9,999,999,999,990.99')SANCTION_AMT,ACCT_CRNCY_CODE,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,DEL_FLG,LCHG_USER_ID  FROM PSC0105_S1_MOD_TABLE "
			+ "WHERE ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("accno"))+"' ");
	log.info("Gayu"+sql.toString());
	try {
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			
			xb.setAccno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
			xb.setAcnam(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
			xb.setScode(NullCheck.isNotNull(rs.getString("SCHM_CODE")));
			xb.setStype(NullCheck.isNotNull(rs.getString("SCHM_TYPE")));
			xb.setIscode(NullCheck.isNotNull(rs.getString("ISIC_CODE")));
			xb.setSflag(NullCheck.isNotNull(rs.getString("SME_FLG")));
			xb.setOutamt(NullCheck.isNotNull(rs.getString("OUTSTANDING_AMT")));
			xb.setImpflg(NullCheck.isNotNull(rs.getString("IMPAIRED_FLAG")));
			xb.setAccopndat(NullCheck.isNotNull(rs.getString("ACCT_OPN_DATE")));
		
			xb.setRendat(NullCheck.isNotNull(rs.getString("RENEWAL_DATE")));
			xb.setSecflg(NullCheck.isNotNull(rs.getString("SECURITY_FLG")));
			xb.setReflg(NullCheck.isNotNull(rs.getString("RESTRUCTURED_FLG")));
			xb.setResdat(NullCheck.isNotNull(rs.getString("RESTRUCTURED_DATE")));
			xb.setSanamt(NullCheck.isNotNull(rs.getString("SANCTION_AMT")));
			xb.setAcccrcode(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
			xb.setRepdat(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
			

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
	System.out.println("11111kjk11111111"+xb.getModtyp());
	System.out.println("11111kjk11111111"+request.getParameter("modtyp"));


sql.setLength(0);
sql.append(
		"INSERT INTO PSC0105_S1_MAST_TABLE(ACCT_NUMBER,ACCT_NAME,SCHM_CODE,SCHM_TYPE,ISIC_CODE,SME_FLG,OUTSTANDING_AMT,IMPAIRED_FLAG,ACCT_OPN_DATE,RENEWAL_DATE,SECURITY_FLG,RESTRUCTURED_FLG,SANCTION_AMT,ACCT_CRNCY_CODE,RESTRUCTURED_DATE,REPORT_DATE,LCHG_USER_ID,LCHG_TIME )"
				+ "values('" + NullCheck.isNotNull(request.getParameter("accno"))
				+ "','" + NullCheck.isNotNull(request.getParameter("acnam")) + "','"
				+ NullCheck.isNotNull(request.getParameter("scode")) + "','"
				+ NullCheck.isNotNull(request.getParameter("stype")) + "','"
				+ NullCheck.isNotNull(request.getParameter("iscode")) + "','"
				+ NullCheck.isNotNull(request.getParameter("sflag")) + "','"
				+ NullCheck.isNotNull(request.getParameter("outamt")) + "','"
				+ NullCheck.isNotNull(request.getParameter("impflg")) + "','"
				+ df1.formatdate(request.getParameter("accopndat")) + "','"
				+ df1.formatdate(request.getParameter("rendat")) + "','"
				+ NullCheck.isNotNull(request.getParameter("secflg")) + "','"
				+ NullCheck.isNotNull(request.getParameter("reflg")) + "','"

				+ NullCheck.isNotNull(request.getParameter("sanamt")) + "','"
				+ NullCheck.isNotNull(request.getParameter("acccrcode")) + "','"
				+ df1.formatdate(request.getParameter("resdat")) + "','"
				+ df1.formatdate(request.getParameter("repdat")) + "','" + session.getAttribute("userName")
				+ "',SYSDATE)");
try {
	log.info(sql.toString());
	ps=conn.prepareStatement(sql.toString());
	
    int rs=0;
    rs=ps.executeUpdate();
     
    status="success";
    
    sql.setLength(0);
    sql.append("DELETE FROM PSC0105_S1_MOD_TABLE WHERE ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("accno"))+"'");
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
sql.append("UPDATE PSC0105_S1_MAST_TABLE SET ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("accno "))+"',ACCT_NAME='"+NullCheck.isNotNull(request.getParameter("acnam"))+"',SCHM_CODE='"+NullCheck.isNotNull(request.getParameter("scode"))+"',SCHM_TYPE='"+NullCheck.isNotNull(request.getParameter("stype"))+"',ISIC_CODE='"+NullCheck.isNotNull(request.getParameter("iscode"))+"',SME_FLG='"+NullCheck.isNotNull(request.getParameter("sflag"))+"',OUTSTANDING_AMT='"+NullCheck.isNotNull(request.getParameter("outamt"))+"',IMPAIRED_FLAG='"+NullCheck.isNotNull(request.getParameter("impflg"))+"',ACCT_OPN_DATE='"+df1.formatdate(request.getParameter("accopndat"))+"',RENEWAL_DATE='"+df1.formatdate(request.getParameter("rendat"))+"',SECURITY_FLG='"+NullCheck.isNotNull(request.getParameter("secflg"))+"',RESTRUCTURED_FLG='"+NullCheck.isNotNull(request.getParameter("reflg"))+"',RESTRUCTURED_DATE='"+df1.formatdate(request.getParameter("resdat"))+"',SANCTION_AMT='"+NullCheck.isNotNull(request.getParameter("sanamt"))+"',ACCT_CRNCY_CODE='"+NullCheck.isNotNull(request.getParameter("acccrcode"))+"',REPORT_DATE='"+df1.formatdate(request.getParameter("repdat"))+"',DEL_FLG='"+xb.getModtyp()+"',LCHG_USER_ID='"+session.getAttribute("entryuser")+"',VERIFY_TIME=SYSDATE WHERE ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("accno "))+"'");


try {
	log.info(sql.toString());
 

	ps=conn.prepareStatement(sql.toString());
	
    int rs=0;
    rs=ps.executeUpdate();
     
    status="success";
    
    sql.setLength(0);
    sql.append("DELETE FROM PSC0105_S1_MOD_TABLE WHERE ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("accno"))+"'");

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
	sql.append("DELETE FROM PSC0105_S1_MAST_TABLE WHERE ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("accno"))+"'");

	try {
		log.info(sql.toString());
		ps=conn.prepareStatement(sql.toString());
		
	    int rs=0;
	    rs=ps.executeUpdate();
	     
	    status="success";
	    log.info(status);
	    sql.setLength(0);
	    sql.append("UPDATE PSC0105_S1_MOD_TABLE SET LCHG_USER='"+session.getAttribute("userName")+"' WHERE REPORT_DATE='"+df1.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"' and ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("accno"))+"'");

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
		sql.append("DELETE FROM PSC0105_S1_MOD_TABLE WHERE ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("accno"))+"'");
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





public String detailPSC0106saves() {

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

}


