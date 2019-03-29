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
import bean.XBRLBLS0106Bean;
import bean.XBRLFIM0400Bean;
import bean.XBRLFIM0400Bean;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRLFIM0400Dao {
	
	static Logger log = Logger.getLogger(XBRLFIM0400Dao.class);
	public String Reporef;

	public int cnt1;
	public String cnt;
	
	public String getCnt() {
		return cnt;
	}

	public void setCnt(String cnt) {
		this.cnt = cnt;
	}

	public String resalert;
	
	
	public static Logger getLog() {
		return log;
	}

	public static void setLog(Logger log) {
		XBRLFIM0400Dao.log = log;
	}

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

	public String getReporef() {
		return Reporef;
	}

	public void setReporef(String reporef) {
		Reporef = reporef;
	}
	
	public ArrayList<XBRLFIM0400Dao> ReporefSeq(String dt1, String dt2) {

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

		ArrayList<XBRLFIM0400Dao> arl = new ArrayList<XBRLFIM0400Dao>();
		sql.append("select REPORT_REF_NO from FIM0400_MOD_TABLE where REPORT_DATE='" + dt2 + "' ORDER BY REPORT_REF_NO");

		log.info("SELECTPROFILE" + sql.toString());

		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLFIM0400Dao xel = new XBRLFIM0400Dao();
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
	
	public ArrayList<XBRLFIM0400Bean> xbrlFIM0400sumEP(String dt2,String ReporefSeq,String curr) {
		
		log.info("SUP SUMMARY List Data AB "  + "dt22222" + dt2);
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLFIM0400Bean> arl = new ArrayList<XBRLFIM0400Bean>();
		
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
							
				sql.append("SELECT  DYNAMIC_DOMAIN,INSTITUTE_ID,TRAN_ID,INSTITUTE_NAME,TRAN_CRNCY,TRAN_TYPE,to_char(TRAN_AMT, '9,999,999,999,990.99')TRAN_AMT,SECTOR,SPOT_RATE,FWD_RATE,INT_RATE_BASE_CURR,INT_RATE_QUOTED_CURR,to_char(DUE_DATE,'DD-MM-YYYY')DUE_DATE FROM TABLE(FIM0400_RPT_FUN('FIM0400','"+ReporefSeq.trim()+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
						
				
			
			log.info("BLS SUMMARY "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				
				
				 
				XBRLFIM0400Bean xb=new XBRLFIM0400Bean();
				
				xb.setDydo(NullCheck.isNotNull(rs.getString("DYNAMIC_DOMAIN")));
				xb.setCpui(NullCheck.isNotNull(rs.getString("INSTITUTE_ID")));	
				xb.setTrano(NullCheck.isNotNull(rs.getString("TRAN_ID")));	
				xb.setCpn(NullCheck.isNotNull(rs.getString("INSTITUTE_NAME")));	
				xb.setCurr(NullCheck.isNotNull(rs.getString("TRAN_CRNCY")));	
				xb.setTranty(NullCheck.isNotNull(rs.getString("TRAN_TYPE")));	
				xb.setAm(NullCheck.isNotNull(rs.getString("TRAN_AMT")));	
				xb.setSec(NullCheck.isNotNull(rs.getString("SECTOR")));	
				xb.setSpora(NullCheck.isNotNull(rs.getString("SPOT_RATE")));	
				xb.setForra(NullCheck.isNotNull(rs.getString("FWD_RATE")));	
				xb.setInrat(NullCheck.isNotNull(rs.getString("INT_RATE_BASE_CURR")));	
				xb.setInratqu(NullCheck.isNotNull(rs.getString("INT_RATE_QUOTED_CURR")));	
				xb.setDue(NullCheck.isNotNull(rs.getString("DUE_DATE")));	

				
				
			
			
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
	
	
	
	/*************************Details FIM0400***********************/
	
	
public ArrayList<XBRLFIM0400Bean> xbrlFIM0400ajaxdetails(String repname,String reprefno,String instno,String dt2,String curr) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("repname    " + repname + "reprefno   "  + reprefno + "instno"+ instno +"dt2   " + dt2 +"currency" +curr);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLFIM0400Bean> arl = new ArrayList<XBRLFIM0400Bean>();
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
			
			
			
			sql.append("SELECT /* +FIRST_ROWS(100) */ INSTITUTE_ID,INSTITUTE_NAME,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,SECTOR,SPOT_RATE,FWD_RATE,INT_RATE_BASE_CURR,INT_RATE_QUOTED_CURR,to_char(DUE_DATE,'DD-MM-YYYY')DUE_DATE  FROM TABLE(FIM0400_DTL_FUN('FIM0400','"+chk.notZero(reprefno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
					
			
			log.info("BLS  Kumar  "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				//log.info("whileee");
								
				 
				XBRLFIM0400Bean xb=new XBRLFIM0400Bean();
				
				
				//xb.setSrlno(NullCheck.isNotNull(rs.getString("SL_NO")));	          	
				///xb.setDyndomain(NullCheck.isNotNull(rs.getString("DYNAMIC_DOMAIN")));
				xb.setCntrptyuid(NullCheck.isNotNull(rs.getString("INSTITUTE_ID")));	
				//xb.setTranid(NullCheck.isNotNull(rs.getString("TRAN_ID")));	
				xb.setCntrptyname(NullCheck.isNotNull(rs.getString("INSTITUTE_NAME")));	
				xb.setCurncyiso(NullCheck.isNotNull(rs.getString("TRAN_CRNCY")));	
				xb.setTrantype(NullCheck.isNotNull(rs.getString("TRAN_TYPE")));	
				xb.setAmt(NullCheck.isNotNull(rs.getString("TRAN_AMT")));	
				xb.setSetr(NullCheck.isNotNull(rs.getString("SECTOR")));	
				xb.setSpotrate(NullCheck.isNotNull(rs.getString("SPOT_RATE")));	
				xb.setFrdrt(NullCheck.isNotNull(rs.getString("FWD_RATE")));	
				xb.setInsbs(NullCheck.isNotNull(rs.getString("INT_RATE_BASE_CURR")));	
				xb.setInsqu(NullCheck.isNotNull(rs.getString("INT_RATE_QUOTED_CURR")));	
				xb.setDuedt(NullCheck.isNotNull(rs.getString("DUE_DATE")));	
	


				
				
		
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



public ArrayList<XBRLFIM0400Bean> xbrlfim400RR(String reptype,String dt2,String reprefno,String instno,String curr) {
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLFIM0400Bean> arl = new ArrayList<XBRLFIM0400Bean>();
	NullCheck chk=new NullCheck();
	
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();
	
	//dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	//sql.append("SELECT * FROM TABLE(FIM0400_DTL_FUN('FIM0400','0','0','31-AUG-2018','01-AUG-2018','31-AUG-2018','MUR'))");
		
	sql.append("SELECT /* +FIRST_ROWS(100) */ INSTITUTE_ID,INSTITUTE_NAME,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,SECTOR,SPOT_RATE,FWD_RATE,INT_RATE_BASE_CURR,INT_RATE_QUOTED_CURR,to_char(DUE_DATE,'DD-MM-YYYY')DUE_DATE  FROM TABLE(FIM0400_DTL_FUN('FIM0400','"+chk.notZero(reprefno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
	log.info("DOC&&&&SELECT Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		
		XBRLFIM0400Bean xb=new XBRLFIM0400Bean();
		//xb.setDyndomain(NullCheck.isNotNull(rs.getString("DYNAMIC_DOMAIN")));
		xb.setCntrptyuid(NullCheck.isNotNull(rs.getString("INSTITUTE_ID")));	
		//xb.setTranid(NullCheck.isNotNull(rs.getString("TRAN_ID")));	
		xb.setCntrptyname(NullCheck.isNotNull(rs.getString("INSTITUTE_NAME")));	
		xb.setCurncyiso(NullCheck.isNotNull(rs.getString("TRAN_CRNCY")));	
		xb.setTrantype(NullCheck.isNotNull(rs.getString("TRAN_TYPE")));	
		xb.setAmt(NullCheck.isNotNull(rs.getString("TRAN_AMT")));	
		xb.setSetr(NullCheck.isNotNull(rs.getString("SECTOR")));	
		xb.setSpotrate(NullCheck.isNotNull(rs.getString("SPOT_RATE")));	
		xb.setFrdrt(NullCheck.isNotNull(rs.getString("FWD_RATE")));	
		xb.setInsbs(NullCheck.isNotNull(rs.getString("INT_RATE_BASE_CURR")));	
		xb.setInsqu(NullCheck.isNotNull(rs.getString("INT_RATE_QUOTED_CURR")));	
		xb.setDuedt(NullCheck.isNotNull(rs.getString("DUE_DATE")));	

		
	
		
		
		
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
public String detailBLS0106saves() {
		
	HttpServletRequest request = ServletActionContext.getRequest();
DateFormat df=new DateFormat();
			
	

		Connection conn = null;
		 try {
		  //Load and register Oracle driver
		  DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
		 //Establish a connection

		 conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.22:1521:orcl", "xbrl", "xbrl1");
		 
		
		 
		 CallableStatement pstmt =  conn.prepareCall("{call FINAL_REPORT_UPDATE_SP(?,?,?)}");
		 pstmt.setString(1, request.getParameter("reptype"));
		 pstmt.setInt(2, 0);
		 pstmt.setString(3,df.formatdate(request.getParameter("dt2")) );
		/* pstmt.setString(4, df.formatdate(request.getParameter("dt1")));
		 pstmt.setString(5, df.formatdate(request.getParameter("dt2")));
		 */
		 
		 pstmt.executeUpdate();
		 
		 

		 pstmt.close();
		 conn.close();

		 }catch (SQLException e) {
				
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


public String detailFIM0400savecheck() {

	ConnectionManager connmgr=new ConnectionManager();
	Connection conn=connmgr.getConnection();
	ArrayList<String> arl = new ArrayList<String>();
			HttpServletRequest request = ServletActionContext.getRequest();
			DateFormat df = new DateFormat();
			StringBuffer sql = new StringBuffer();
			PreparedStatement ps = null;
			
			sql.append("SELECT COUNT(REPORT_DATE) as repdate FROM FIM0400_RPT_TB where REPORT_ID = '"+request.getParameter("reptype")+"' AND  REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ");
			 System.out.println(sql.toString());
				
				try {
					ps = conn.prepareStatement(sql.toString());
					ResultSet rs = ps.executeQuery();
				

					while (rs.next()) {
						
						cnt1=rs.getInt("repdate");
					
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

				return "success";

			}

public String FIM0400chckmodified() {

HttpServletRequest request = ServletActionContext.getRequest();
ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();
PreparedStatement ps = null;
HttpSession session = request.getSession();
StringBuffer sql = new StringBuffer();
DateFormat df=new DateFormat();		
sql.setLength(0);
if(request.getParameter("type").equals("chkuser")) {
	sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM FIM0400_MOD_TABLE ");
}else {
	sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM FIM0400_MOD_TABLE ");
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


public ArrayList<XBRLFIM0400Bean> FIM0400verify(){
	
	ArrayList<XBRLFIM0400Bean> arl = new ArrayList<XBRLFIM0400Bean>();
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	sql.	append("SELECT   /* +FIRST_ROWS(100) */ TO_CHAR(REPORT_DATE,'DD-MM-YYYY') REPORT_DATE, INSTITUTE_ID,INSTITUTE_NAME,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,SECTOR,SPOT_RATE,FWD_RATE,INT_RATE_BASE_CURR,INT_RATE_QUOTED_CURR,to_char(DUE_DATE,'DD-MM-YYYY')DUE_DATE,DECODE(DEL_FLG,'A','Added','M','Modified','D','Deleted') as DEL_FLG,LCHG_USER_ID  FROM FIM0400_MOD_TABLE ");
	log.info("Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		
		XBRLFIM0400Bean xb=new XBRLFIM0400Bean();
		
		xb.setCntrptyuid(NullCheck.isNotNull(rs.getString("INSTITUTE_ID")));	
		//xb.setTranid(NullCheck.isNotNull(rs.getString("TRAN_ID")));	
		xb.setCntrptyname(NullCheck.isNotNull(rs.getString("INSTITUTE_NAME")));	
		xb.setCurncyiso(NullCheck.isNotNull(rs.getString("TRAN_CRNCY")));	
		xb.setTrantype(NullCheck.isNotNull(rs.getString("TRAN_TYPE")));	
		xb.setAmt(NullCheck.isNotNull(rs.getString("TRAN_AMT")));	
		xb.setSetr(NullCheck.isNotNull(rs.getString("SECTOR")));	
		xb.setSpotrate(NullCheck.isNotNull(rs.getString("SPOT_RATE")));	
		xb.setFrdrt(NullCheck.isNotNull(rs.getString("FWD_RATE")));	
		xb.setInsbs(NullCheck.isNotNull(rs.getString("INT_RATE_BASE_CURR")));	
		xb.setInsqu(NullCheck.isNotNull(rs.getString("INT_RATE_QUOTED_CURR")));	
		xb.setDuedt(NullCheck.isNotNull(rs.getString("DUE_DATE")));	
		 xb.setModtyp(NullCheck.isNotNull(rs.getString("DEL_FLG")));

		 xb.setEntryuser(NullCheck.isNotNull(rs.getString("LCHG_USER_ID")));
		 xb.setRepdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));


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


public String modFIM0400cancel() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	sql.append("DELETE FROM FIM0400_MOD_TABLE WHERE   INSTITUTE_ID='"+NullCheck.isNotNull(request.getParameter("cntrptyuid"))+"' ");
	
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
public String detailFIM0400saves() {

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

public String FIM0400verifymaster() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	HttpSession session = request.getSession();
	StringBuffer sql = new StringBuffer();
	DateFormat df1=new DateFormat();		
	
	//------------------get data from mod table---------------------
	XBRLFIM0400Bean xb=new XBRLFIM0400Bean();
	
	sql.setLength(0);
	sql.append("SELECT   /* +FIRST_ROWS(100) */ INSTITUTE_ID,INSTITUTE_NAME,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,SECTOR,SPOT_RATE,FWD_RATE,INT_RATE_BASE_CURR,INT_RATE_QUOTED_CURR,to_char(DUE_DATE,'DD-MM-YYYY')DUE_DATE,DEL_FLG,LCHG_USER_ID  FROM FIM0400_MOD_TABLE "
			+ "WHERE INSTITUTE_NAME='"+NullCheck.isNotNull(request.getParameter("cntrptyname"))+"' ");
	log.info("Gayu"+sql.toString());
	try {
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			
			xb.setCntrptyuid(NullCheck.isNotNull(rs.getString("INSTITUTE_ID")));	
			//xb.setTranid(NullCheck.isNotNull(rs.getString("TRAN_ID")));	
			xb.setCntrptyname(NullCheck.isNotNull(rs.getString("INSTITUTE_NAME")));	
			xb.setCurncyiso(NullCheck.isNotNull(rs.getString("TRAN_CRNCY")));	
			xb.setTrantype(NullCheck.isNotNull(rs.getString("TRAN_TYPE")));	
			xb.setAmt(NullCheck.isNotNull(rs.getString("TRAN_AMT")));	
			xb.setSetr(NullCheck.isNotNull(rs.getString("SECTOR")));	
			xb.setSpotrate(NullCheck.isNotNull(rs.getString("SPOT_RATE")));	
			xb.setFrdrt(NullCheck.isNotNull(rs.getString("FWD_RATE")));	
			xb.setInsbs(NullCheck.isNotNull(rs.getString("INT_RATE_BASE_CURR")));	
			xb.setInsqu(NullCheck.isNotNull(rs.getString("INT_RATE_QUOTED_CURR")));	
			xb.setDuedt(NullCheck.isNotNull(rs.getString("DUE_DATE")));	

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
sql.append("INSERT INTO FIM0400_MAST_TABLE(INSTITUTE_ID,INSTITUTE_NAME,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,SECTOR,SPOT_RATE,FWD_RATE,INT_RATE_BASE_CURR,INT_RATE_QUOTED_CURR,DUE_DATE,REPORT_DATE,LCHG_USER_ID,LCHG_TIME)" + "VALUES ('"
           + request.getParameter("cntrptyuid ")
         + "','" + request.getParameter("cntrptyname") + "','" + request.getParameter("curncyiso") + "','"
          + request.getParameter("trantype") + "','" + request.getParameter("amt") + "','"
	      	+ request.getParameter("setr") + "','"+ request.getParameter("spotrate") + "','"
			+ request.getParameter("frdrt") + "','"+ request.getParameter("insbs") + "','"+ request.getParameter("insqu") + "','"+ df1.formatdate(request.getParameter("duedt")) + "','"
         +df1.formatdate(request.getParameter("rptdate"))+ "','" + session.getAttribute("userName")
         + "',SYSDATE)");
try {
	log.info(sql.toString());
	ps=conn.prepareStatement(sql.toString());
	
    int rs=0;
    rs=ps.executeUpdate();
     
    status="success";
    
    sql.setLength(0);
    sql.append("DELETE FROM FIM0400_MOD_TABLE WHERE INSTITUTE_ID='"+NullCheck.isNotNull(request.getParameter("cntrptyuid"))+"'");
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
sql.append("UPDATE FIM0400_MAST_TABLE SET INSTITUTE_ID='"+NullCheck.isNotNull(request.getParameter("cntrptyuid"))+"',INSTITUTE_NAME='"+NullCheck.isNotNull(request.getParameter("cntrptyname"))+"',TRAN_CRNCY='"+NullCheck.isNotNull(request.getParameter("curncyiso"))+"',TRAN_TYPE='"+NullCheck.isNotNull(request.getParameter("trantype"))+"',TRAN_AMT='"+NullCheck.isNotNull(request.getParameter("amt"))+"',SECTOR='"+NullCheck.isNotNull(request.getParameter("setr"))+"',SPOT_RATE='"+NullCheck.isNotNull(request.getParameter("spotrate"))+"',FWD_RATE='"+NullCheck.isNotNull(request.getParameter("frdrt"))+"',INT_RATE_BASE_CURR='"+NullCheck.isNotNull(request.getParameter("insbs"))+"',INT_RATE_QUOTED_CURR='"+NullCheck.isNotNull(request.getParameter("insqu"))+"',DUE_DATE='"+df1.formatdate(request.getParameter("duedt"))+"',REPORT_DATE='"+df1.formatdate(request.getParameter("repdate"))+"',DEL_FLG='"+xb.getModtyp()+"',LCHG_USER_ID='"+session.getAttribute("entryuser")+"',VERIFY_TIME=SYSDATE WHERE INSTITUTE_ID='"+NullCheck.isNotNull(request.getParameter("cntrptyuid"))+"'");

try {
	log.info(sql.toString());
	ps=conn.prepareStatement(sql.toString());
	
    int rs=0;
    rs=ps.executeUpdate();
     
    status="success";
    
    sql.setLength(0);
    sql.append("DELETE FROM FIM0400_MOD_TABLE WHERE INSTITUTE_ID='"+NullCheck.isNotNull(request.getParameter("cntrptyuid"))+"'");
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
	sql.append("DELETE FROM FIM0400_MAST_TABLE WHERE INSTITUTE_ID='"+NullCheck.isNotNull(request.getParameter("cntrptyuid"))+"'");
	
	try {
		log.info(sql.toString());
		ps=conn.prepareStatement(sql.toString());
		
	    int rs=0;
	    rs=ps.executeUpdate();
	     
	    status="success";
	    log.info(status);
	    sql.setLength(0);
	    sql.append("UPDATE FIM0400_MOD_TABLE SET INSTITUTE_ID='"+NullCheck.isNotNull(request.getParameter("cntrptyuid"))+"',INSTITUTE_NAME='"+NullCheck.isNotNull(request.getParameter("cntrptyname"))+"',TRAN_CRNCY='"+NullCheck.isNotNull(request.getParameter("curncyiso"))+"',TRAN_TYPE='"+NullCheck.isNotNull(request.getParameter("trantype"))+"',TRAN_AMT='"+NullCheck.isNotNull(request.getParameter("amt"))+"',SECTOR='"+NullCheck.isNotNull(request.getParameter("setr"))+"',SPOT_RATE='"+NullCheck.isNotNull(request.getParameter("spotrate"))+"',FWD_RATE='"+NullCheck.isNotNull(request.getParameter("frdrt"))+"',INT_RATE_BASE_CURR='"+NullCheck.isNotNull(request.getParameter("insbs"))+"',INT_RATE_BASE_CURR='"+NullCheck.isNotNull(request.getParameter("insqu"))+"',DUE_DATE='"+df1.formatdate(request.getParameter("duedt"))+"',DEL_FLG='"+xb.getModtyp()+"',LCHG_USER_ID='"+session.getAttribute("entryuser")+"',VERIFY_TIME=SYSDATE WHERE INSTITUTE_ID='"+NullCheck.isNotNull(request.getParameter("cntrptyuid "))+"'");
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
		sql.append("DELETE FROM FIM0400_MOD_TABLE WHERE INSTITUTE_ID='"+NullCheck.isNotNull(request.getParameter("cntrptyuid"))+"'");
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
