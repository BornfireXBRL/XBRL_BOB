
package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import org.apache.log4j.Logger;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;

import basecode.DateFormat;
import bean.XBRLPSC0200Bean;
import bean.XBRLPSC0200Bean;
import bean.XBRLPSC0200Bean;
import bean.XBRLFIM0900Bean;
import bean.XBRLPSC0200Bean;

import utilities.ConnectionManager;
import utilities.NullCheck;

public class XBRLPSC0200Dao {
	
	static Logger log = Logger.getLogger(XBRLPSC0200Dao.class);
	
	public String Reporef;

	public String getReporef() {
		return Reporef;
	}

	public void setReporef(String reporef) {
		Reporef = reporef;
	}

	public static Logger getLog() {
		return log;
	}

	public static void setLog(Logger log) {
		XBRLPSC0200Dao.log = log;
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

	public ArrayList<XBRLPSC0200Dao> ReporefSeq(String dt1, String dt2) {

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

		ArrayList<XBRLPSC0200Dao> arl = new ArrayList<XBRLPSC0200Dao>();
		sql.append("select REPORT_REF_NO from PSC0200_MOD_TABLE where REPORT_DATE='" + dt2 + "' ORDER BY REPORT_REF_NO");

		log.info("SELECTPROFILE" + sql.toString());

		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLPSC0200Dao xel = new XBRLPSC0200Dao();
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

	
	public String PSC0200chckmodified() {

		HttpServletRequest request = ServletActionContext.getRequest();
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		HttpSession session = request.getSession();
		StringBuffer sql = new StringBuffer();
		DateFormat df=new DateFormat();		
		sql.setLength(0);
		if(request.getParameter("type").equals("chkuser")) {
			sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM PSC0200_MOD_TABLE ");
			log.info("bj"+sql.toString());
			}else {
				sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM PSC0200_MOD_TABLE ");
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
	public String detailPSC0200savecheck() {

		ConnectionManager connmgr=new ConnectionManager();
		Connection conn=connmgr.getConnection();
		ArrayList<String> arl = new ArrayList<String>();
				HttpServletRequest request = ServletActionContext.getRequest();
				DateFormat df = new DateFormat();
				StringBuffer sql = new StringBuffer();
				PreparedStatement ps = null;
				
				sql.append("SELECT COUNT(REPORT_DATE) as repdate FROM PSC0200_S1_RPT_TB where REPORT_ID = '"+request.getParameter("reptype")+"' AND  REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ");
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
	public String detailPSC0200saves() {

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
	
public ArrayList<XBRLPSC0200Bean> xbrlpsc0200(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
		
		
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLPSC0200Bean> arl = new ArrayList<XBRLPSC0200Bean>();
		
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
		
				
				sql.append("select SL_NO,CUST_NAME,RESIDENT_STATUS,COUNTRY,UNIQUE_IDENTITY,ISIC_CODE,ACCT_NUMBER,GROUP_CODE,to_char(OUTSTANDING_AMT, '9,999,999,999,990.99')OUTSTANDING_AMT,to_char(OUTSTANDING_NFB_AMT, '9,999,999,999,990.99')OUTSTANDING_NFB_AMT  from table(PSC0200_S1_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
				
		
			log.info("Psc0200 "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				XBRLPSC0200Bean xb=new XBRLPSC0200Bean();
				
			
					xb.setIsicsrlno(NullCheck.isNotNull(rs.getString("SL_NO")));
					xb.setIsicnameofcustm(NullCheck.isNotNull(rs.getString("CUST_NAME")));
					xb.setIsicresidetstatus(NullCheck.isNotNull(rs.getString("RESIDENT_STATUS")));
					xb.setIsiccountrofresid(NullCheck.isNotNull(rs.getString("COUNTRY")));
					xb.setIsicuniqidenti(NullCheck.isNotNull(rs.getString("UNIQUE_IDENTITY")));
					xb.setIsiccode(NullCheck.isNotNull(rs.getString("ISIC_CODE")));
					xb.setIsicaccno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
					xb.setIsicgroupappli(NullCheck.isNotNull(rs.getString("GROUP_CODE")));
					xb.setIsicoutstfunbasfaci(NullCheck.isNotNull(rs.getString("OUTSTANDING_AMT")));
					xb.setIsicoutstnonfunbasfaci(NullCheck.isNotNull(rs.getString("OUTSTANDING_NFB_AMT")));
				
			
			
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
	
public ArrayList<XBRLPSC0200Bean> xbrlpsc0200s2(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {

	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLPSC0200Bean> arl = new ArrayList<XBRLPSC0200Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	
	try {
	
			
			sql.append("select SL_NO,CUST_NAME,RESIDENT_STATUS,COUNTRY,UNIQUE_IDENTITY,PURPOSE,ACCT_NUMBER,to_char(OUTSTANDING_AMT, '9,999,999,999,990.99')OUTSTANDING_AMT,to_char(OUTSTANDING_NFB_AMT, '9,999,999,999,990.99')OUTSTANDING_NFB_AMT  from table(PSC0200_S2_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
	
		log.info("Psc0020 "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLPSC0200Bean xb=new XBRLPSC0200Bean();
			
				xb.setHoussrlno(NullCheck.isNotNull(rs.getString("SL_NO")));
				xb.setHousnameofcustm(NullCheck.isNotNull(rs.getString("CUST_NAME")));
				xb.setHousresidetstatus(NullCheck.isNotNull(rs.getString("RESIDENT_STATUS")));
				xb.setHouscountrofresid(NullCheck.isNotNull(rs.getString("COUNTRY")));
				xb.setHousuniqidenti(NullCheck.isNotNull(rs.getString("UNIQUE_IDENTITY")));
				xb.setHouspurpose(NullCheck.isNotNull(rs.getString("PURPOSE")));
				xb.setHousaccno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
				xb.setHousoutstfunbasfaci(NullCheck.isNotNull(rs.getString("OUTSTANDING_AMT")));
				xb.setHousoutstnonfunbasfaci(NullCheck.isNotNull(rs.getString("OUTSTANDING_NFB_AMT")));
				
					
		
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

public ArrayList<XBRLPSC0200Bean> xbrlpsc0200s3(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLPSC0200Bean> arl = new ArrayList<XBRLPSC0200Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	 
	try {
	
			
			sql.append("select SL_NO,CUST_NAME,RESIDENT_STATUS,COUNTRY,UNIQUE_IDENTITY,INSTITUTIONAL_SECTOR,GROUP_CODE,to_char(OUTSTANDING_AMT, '9,999,999,999,990.99')OUTSTANDING_AMT,to_char(OUTSTANDING_NFB_AMT, '9,999,999,999,990.99')OUTSTANDING_NFB_AMT   from table(PSC0200_S3_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
	
		log.info("Psc0020 "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLPSC0200Bean xb=new XBRLPSC0200Bean();
			
		
				xb.setNfcsrlno(NullCheck.isNotNull(rs.getString("SL_NO")));
				xb.setNfcnameofcustm(NullCheck.isNotNull(rs.getString("CUST_NAME")));
				xb.setNfcresidetstatus(NullCheck.isNotNull(rs.getString("RESIDENT_STATUS")));
				xb.setNfccountrofresid(NullCheck.isNotNull(rs.getString("COUNTRY")));
				xb.setNfcuniqidenti(NullCheck.isNotNull(rs.getString("UNIQUE_IDENTITY")));
				xb.setNfcinstitusect(NullCheck.isNotNull(rs.getString("INSTITUTIONAL_SECTOR")));
				xb.setNfcgroupappli(NullCheck.isNotNull(rs.getString("GROUP_CODE")));
				xb.setNfcoutstfunbasfaci(NullCheck.isNotNull(rs.getString("OUTSTANDING_AMT")));
				xb.setNfcoutstnonfunbasfaci(NullCheck.isNotNull(rs.getString("OUTSTANDING_NFB_AMT")));
				
			
		
		
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

public ArrayList<XBRLPSC0200Bean> xbrlpsc0200ajaxdetails(String repname,String ReporefSeq,String instno,String dt2,String curr) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("repname    " + repname + "ReporefSeq   "  + ReporefSeq + "instno"+ instno +"dt2   " + dt2 +"currency" +curr);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLPSC0200Bean> arl = new ArrayList<XBRLPSC0200Bean>();
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
		
			
		//	log.info("AJAX DETAILS KUMAR" + reprefno );
			
			sql.append("SELECT   /* +FIRST_ROWS(100) */ ACCT_NUMBER,CUST_ID,CUST_NAME,NRE_FLG,COUNTRY_CODE,UNIQUE_IDENTIFIER,ISIC_CODE,GROUP_CODE,to_char(OS_FUND_BASED_AMT, '9,999,999,999,990.99')OS_FUND_BASED_AMT,to_char(OS_NFB_AMT, '9,999,999,999,990.99')OS_NFB_AMT,PURPOSE_OF_CREDIT,NATURE_OF_CUST,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE FROM TABLE(PSC0200_DTL_FUN('PSC0200','"+chk.notZero(ReporefSeq)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");			
			
			log.info("BLS  Kumar  "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				//log.info("whileee");
								
				 
				XBRLPSC0200Bean xb=new XBRLPSC0200Bean();
				
				
				xb.setAccno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
				xb.setCustid(NullCheck.isNotNull(rs.getString("CUST_ID")));
				xb.setCustname(NullCheck.isNotNull(rs.getString("CUST_NAME")));
				xb.setNreflg(NullCheck.isNotNull(rs.getString("NRE_FLG")));
				xb.setCountrcode(NullCheck.isNotNull(rs.getString("COUNTRY_CODE")));
				xb.setUniqidenti(NullCheck.isNotNull(rs.getString("UNIQUE_IDENTIFIER")));
				
				xb.setDetisiccode(NullCheck.isNotNull(rs.getString("ISIC_CODE")));
				
				
				
				
				
				xb.setGroupcode(NullCheck.isNotNull(rs.getString("GROUP_CODE")));
				
				
				xb.setOutstandamt(NullCheck.isNotNull(rs.getString("OS_FUND_BASED_AMT")));
				xb.setOutstandnfbamt(NullCheck.isNotNull(rs.getString("OS_NFB_AMT")));
				xb.setPurpose(NullCheck.isNotNull(rs.getString("PURPOSE_OF_CREDIT")));
				xb.setNatofcre(NullCheck.isNotNull(rs.getString("NATURE_OF_CUST")));
				xb.setReportdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
				
				
						
				/*xb.setDelflg(NullCheck.isNotNull(rs.getString("DEL_FLG")));
				xb.setRcrusrid(NullCheck.isNotNull(rs.getString("RCRE_USER_ID")));
				xb.setRcrtime(NullCheck.isNotNull(rs.getString("RCRE_TIME")));
				xb.setLchgusrid(NullCheck.isNotNull(rs.getString("LCHG_USER_ID")));
				xb.setLchgtime(NullCheck.isNotNull(rs.getString("LCHG_TIME")));*/
				
		
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



public ArrayList<XBRLPSC0200Bean> xbrlpsc200RR(String dt1,String dt2,String ReporefSeq,String instno,String curr) {

HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

ArrayList<XBRLPSC0200Bean> arl = new ArrayList<XBRLPSC0200Bean>();
NullCheck chk=new NullCheck();


String status = "";

ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();

PreparedStatement ps = null;

StringBuffer sql = new StringBuffer();


DateFormat df=new DateFormat();

dt1 =df.formatdate(dt1);
dt2 =df.formatdate(dt2);

//sql.append("SELECT * FROM TABLE(BLS0100_DTL_FUN('BLS0100','0','0','31-AUG-2018','01-AUG-2018','31-AUG-2018','MUR'))";

sql.append("SELECT   /* +FIRST_ROWS(100) */ ACCT_NUMBER,CUST_ID,CUST_NAME,NRE_FLG,COUNTRY_CODE,UNIQUE_IDENTIFIER,ISIC_CODE,GROUP_CODE,to_char(OS_FUND_BASED_AMT, '9,999,999,999,990.99')OS_FUND_BASED_AMT,to_char(OS_NFB_AMT, '9,999,999,999,990.99')OS_NFB_AMT,PURPOSE_OF_CREDIT,NATURE_OF_CUST,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE FROM TABLE(PSC0200_DTL_FUN('PSC0200','"+ReporefSeq+"','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");	
log.info("DOC&&&&SELECT Gayu"+sql.toString());
try {
ps=conn.prepareStatement(sql.toString());

    ResultSet rs=ps.executeQuery();
     

while(rs.next()){

XBRLPSC0200Bean xb=new XBRLPSC0200Bean();


xb.setAccno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
xb.setCustid(NullCheck.isNotNull(rs.getString("CUST_ID")));
xb.setCustname(NullCheck.isNotNull(rs.getString("CUST_NAME")));
xb.setNreflg(NullCheck.isNotNull(rs.getString("NRE_FLG")));
xb.setCountrcode(NullCheck.isNotNull(rs.getString("COUNTRY_CODE")));
xb.setUniqidenti(NullCheck.isNotNull(rs.getString("UNIQUE_IDENTIFIER")));

xb.setDetisiccode(NullCheck.isNotNull(rs.getString("ISIC_CODE")));

xb.setGroupcode(NullCheck.isNotNull(rs.getString("GROUP_CODE")));


xb.setOutstandamt(NullCheck.isNotNull(rs.getString("OS_FUND_BASED_AMT")));
xb.setOutstandnfbamt(NullCheck.isNotNull(rs.getString("OS_NFB_AMT")));
xb.setPurpose(NullCheck.isNotNull(rs.getString("PURPOSE_OF_CREDIT")));
xb.setNatofcre(NullCheck.isNotNull(rs.getString("NATURE_OF_CUST")));
xb.setReportdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));




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

public String resalert;
public String getResalert() {
	return resalert;
}

public void setResalert(String resalert) {
	this.resalert = resalert;
}
public String modPSC0200cancel() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	sql.append("DELETE FROM PSC0200_MOD_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("date")))+"' and CUST_ID='"+NullCheck.isNotNull(request.getParameter("custid"))+"'and ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("accno"))+"'");
	
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

public ArrayList<XBRLPSC0200Bean> PSC0200verify(){
	
	ArrayList<XBRLPSC0200Bean> arl = new ArrayList<XBRLPSC0200Bean>();
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	sql.append("SELECT ACCT_NUMBER,CUST_ID,CUST_NAME,NRE_FLG,COUNTRY_CODE,UNIQUE_IDENTIFIER,ISIC_CODE,GROUP_CODE,to_char(OS_FUND_BASED_AMT, '9,999,999,999,990.99')OS_FUND_BASED_AMT,to_char(OS_NFB_AMT, '9,999,999,999,990.99')OS_NFB_AMT,PURPOSE_OF_CREDIT,NATURE_OF_CUST,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,DECODE(DEL_FLG,'A','Added','M','Modified','D','Deleted') as DEL_FLG ,LCHG_USER_ID FROM PSC0200_MOD_TABLE");
	log.info("Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		XBRLPSC0200Bean xb=new XBRLPSC0200Bean();
		xb.setAccno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
		xb.setCustid(NullCheck.isNotNull(rs.getString("CUST_ID")));
		xb.setCustname(NullCheck.isNotNull(rs.getString("CUST_NAME")));
		xb.setNreflg(NullCheck.isNotNull(rs.getString("NRE_FLG")));
		xb.setCountrcode(NullCheck.isNotNull(rs.getString("COUNTRY_CODE")));
		xb.setUniqidenti(NullCheck.isNotNull(rs.getString("UNIQUE_IDENTIFIER")));
		
		xb.setDetisiccode(NullCheck.isNotNull(rs.getString("ISIC_CODE")));
		
		
		
		
		
		xb.setGroupcode(NullCheck.isNotNull(rs.getString("GROUP_CODE")));
		
		
		xb.setOutstandamt(NullCheck.isNotNull(rs.getString("OS_FUND_BASED_AMT")));
		xb.setOutstandnfbamt(NullCheck.isNotNull(rs.getString("OS_NFB_AMT")));
		xb.setPurpose(NullCheck.isNotNull(rs.getString("PURPOSE_OF_CREDIT")));
		xb.setNatofcre(NullCheck.isNotNull(rs.getString("NATURE_OF_CUST")));
		xb.setReportdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
	
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

public String PSC0200verifymaster() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	HttpSession session = request.getSession();
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();	
	
	//------------------get data from mod table---------------------
	XBRLPSC0200Bean xb=new XBRLPSC0200Bean();
	System.out.println("fdjhf");
	sql.setLength(0);
	sql.append("SELECT ACCT_NUMBER,CUST_ID,CUST_NAME,NRE_FLG,COUNTRY_CODE,UNIQUE_IDENTIFIER,ISIC_CODE,GROUP_CODE,to_char(OS_FUND_BASED_AMT, '9,999,999,999,990.99')OS_FUND_BASED_AMT,to_char(OS_NFB_AMT, '9,999,999,999,990.99')OS_NFB_AMT,PURPOSE_OF_CREDIT,NATURE_OF_CUST,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,DEL_FLG,LCHG_USER_ID FROM PSC0200_MOD_TABLE "
			+ "WHERE CUST_ID='"+NullCheck.isNotNull(request.getParameter("custid"))+"' AND REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("reportdate")))+"' ");
	log.info("Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		
		xb.setAccno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
		xb.setCustid(NullCheck.isNotNull(rs.getString("CUST_ID")));
		xb.setCustname(NullCheck.isNotNull(rs.getString("CUST_NAME")));
		xb.setNreflg(NullCheck.isNotNull(rs.getString("NRE_FLG")));
		xb.setCountrcode(NullCheck.isNotNull(rs.getString("COUNTRY_CODE")));
		xb.setUniqidenti(NullCheck.isNotNull(rs.getString("UNIQUE_IDENTIFIER")));
		
		xb.setDetisiccode(NullCheck.isNotNull(rs.getString("ISIC_CODE")));
		
		
		
		
		
		xb.setGroupcode(NullCheck.isNotNull(rs.getString("GROUP_CODE")));
		
		
		xb.setOutstandamt(NullCheck.isNotNull(rs.getString("OS_FUND_BASED_AMT")));
		xb.setOutstandnfbamt(NullCheck.isNotNull(rs.getString("OS_NFB_AMT")));
		xb.setPurpose(NullCheck.isNotNull(rs.getString("PURPOSE_OF_CREDIT")));
		xb.setNatofcre(NullCheck.isNotNull(rs.getString("NATURE_OF_CUST")));
		xb.setReportdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
			
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
				" INSERT INTO PSC0200_MAST_TABLE(ACCT_NUMBER,CUST_ID,CUST_NAME,NRE_FLG,COUNTRY_CODE,UNIQUE_IDENTIFIER,ISIC_CODE,GROUP_CODE,OS_FUND_BASED_AMT,OS_NFB_AMT,PURPOSE_OF_CREDIT,NATURE_OF_CUST,REPORT_DATE,DEL_FLG,LCHG_USER_ID,LCHG_TIME,VERIFY_USER_ID,VERIFY_TIME)" + "VALUES ('"
					

+ request.getParameter("accno") + "','" + request.getParameter("custid") + "','" + request.getParameter("custname") + "','"
				+ request.getParameter("nreflg") + "','" 
						+ request.getParameter("countrcode") + "','" 
						+ request.getParameter("uniqidenti") + "','"
								+ request.getParameter("detisiccode") + "','" 
								+ request.getParameter("groupcode") + "','" 
								+ request.getParameter("outstandamt") + "','"
										+ request.getParameter("outstandnfbamt") + "','" 
										+ request.getParameter("purpose") + "','" 
										+ request.getParameter("natofcre") + "','"
						+df.formatdate(request.getParameter("reportdate"))+ "','"+xb.getModtyp()+"','" + session.getAttribute("userName")
													+ "',SYSDATE,'"+ session.getAttribute("userName")+"',SYSDATE)");
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("DELETE FROM PSC0200_MOD_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("reportdate")))+"'and ACCT_NUMBER ='" + request.getParameter("accno") +"' and CUST_ID='"+NullCheck.isNotNull(request.getParameter("custid"))+"'");
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
		sql.append("UPDATE PSC0200_MAST_TABLE SET ACCT_NUMBER='"+NullCheck.isNotNull(request.getParameter("accno"))+"',CUST_ID='"+NullCheck.isNotNull(request.getParameter("custid"))+"',CUST_NAME='"+NullCheck.isNotNull(request.getParameter("custname"))+"',NRE_FLG='"+NullCheck.isNotNull(request.getParameter("nreflg"))+"',COUNTRY_CODE='"+NullCheck.isNotNull(request.getParameter("countrcode"))+"',UNIQUE_IDENTIFIER='"+NullCheck.isNotNull(request.getParameter("uniqidenti"))+"',ISIC_CODE='"+NullCheck.isNotNull(request.getParameter("detisiccode"))+"',GROUP_CODE='"+NullCheck.isNotNull(request.getParameter("groupcode"))+"',OS_FUND_BASED_AMT='"+NullCheck.isNotNull(request.getParameter("outstandamt"))+"',OS_NFB_AMT='"+NullCheck.isNotNull(request.getParameter("outstandnfbamt"))+"',PURPOSE_OF_CREDIT='"+NullCheck.isNotNull(request.getParameter("purpose"))+"',NATURE_OF_CUST='"+NullCheck.isNotNull(request.getParameter("natofcre"))+"',REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("reportdate")))+"',VERIFY_USER_ID='"+session.getAttribute("userName")+"',VERIFY_TIME=SYSDATE WHERE CUST_ID='"+NullCheck.isNotNull(request.getParameter("custid"))+"' AND  ACCT_NUMBER ='" + request.getParameter("accno") +"' and  REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("reportdate")))+"'");
		
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("DELETE FROM PSC0200_MOD_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("reportdate")))+"' and ACCT_NUMBER ='" + request.getParameter("accno") +"' and CUST_ID='"+NullCheck.isNotNull(request.getParameter("custid"))+"'");
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
		sql.append("DELETE FROM PSC0200_MAST_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("reportdate")))+"'and  ACCT_NUMBER ='" + request.getParameter("accno") +"' and CUST_ID='"+NullCheck.isNotNull(request.getParameter("custid"))+"'");
		
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("UPDATE PSC0200_MOD_TABLE SET LCHG_USER_ID='"+session.getAttribute("userName")+"' WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("reportdate")))+"' and ACCT_NUMBER ='" + request.getParameter("accno") +"' and CUST_ID='"+NullCheck.isNotNull(request.getParameter("custid"))+"'");
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
		    sql.append("DELETE FROM PSC0200_MOD_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("reportdate")))+"' and CUST_ID='"+NullCheck.isNotNull(request.getParameter("custid"))+"'");
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
