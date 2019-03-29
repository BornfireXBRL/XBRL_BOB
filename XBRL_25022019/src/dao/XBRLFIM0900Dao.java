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
import bean.XBRLFIM0900Bean;
import bean.XBRLPSC0501Bean;
import bean.XBRLFIM0900Bean;
import bean.XBRLFIM0900Bean;
import bean.XBRLFIM0900Bean;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRLFIM0900Dao {

	static Logger log = Logger.getLogger(XBRLFIM0900Dao.class);
	
public String reporef;

public int cnt1;
public String cnt;

public String resalert;

	
	
	public static Logger getLog() {
	return log;
}
public static void setLog(Logger log) {
	XBRLFIM0900Dao.log = log;
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
	public String getReporef() {
	return reporef;
}
public void setReporef(String reporef) {
	this.reporef = reporef;
}
	public ArrayList<XBRLFIM0900Dao> ReporefSeq(String dt1, String dt2) {

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

		ArrayList<XBRLFIM0900Dao> arl = new ArrayList<XBRLFIM0900Dao>();
		sql.append("select REPORT_REF_NO from FIM0900_MOD_TABLE where REPORT_DATE='" + dt2 + "' ORDER BY REPORT_REF_NO");

		log.info("SELECTPROFILE" + sql.toString());

		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLFIM0900Dao xel = new XBRLFIM0900Dao();
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
public ArrayList<XBRLFIM0900Bean> xbrl1fimsums1(String reptype,String ReporefSeq,String instno,String dt2,String dt1,String curr) {
		
		log.info(reptype);
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLFIM0900Bean> arl = new ArrayList<XBRLFIM0900Bean>();
		log.info("cgffffffffffff");

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
				
				
				sql.append("select INSTANCE_NAME,INSTANCE_CODE,to_char(VALUE_OF_TRAN,'9,999,999,999,990.99')VALUE_OF_TRAN,NO_OF_TRAN from table(FIM0900_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
				
		
			log.info("FIM0900S1 "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				XBRLFIM0900Bean xb=new XBRLFIM0900Bean();
				
					xb.setInsna(NullCheck.isNotNull(rs.getString("INSTANCE_NAME")));
					xb.setSrno(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
					xb.setNumtra(NullCheck.isNotNull(rs.getString("NO_OF_TRAN")));
					xb.setValtra(NullCheck.isNotNull(rs.getString("VALUE_OF_TRAN")));
					
					
				
				
		
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



public ArrayList<XBRLFIM0900Bean> xbrlfim0900details(String reptype,String ReporefSeq,String instno,String dt2,String dt1,String curr) {
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLFIM0900Bean> arl = new ArrayList<XBRLFIM0900Bean>();
	
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
	

		sql.append("select TO_CHAR(TRAN_DATE,'DD-MM-YYYY')TRAN_DATE,TRAN_ID,TRAN_TYPE,TRAN_METHOD,to_char(TRAN_AMOUNT,'9,999,999,999,990.99')TRAN_AMOUNT,TO_CHAR(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE from table(FIM0900_DTL_FUN('"+reptype+"','"+ReporefSeq+"','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
		

	log.info("FIM0900DETAILS"+sql.toString());
	
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		XBRLFIM0900Bean xb=new XBRLFIM0900Bean();
		
			
			xb.setTrana(NullCheck.isNotNull(rs.getString("TRAN_DATE")));
			xb.setTraid(NullCheck.isNotNull(rs.getString("TRAN_ID")));
			xb.setTantyp(NullCheck.isNotNull(rs.getString("TRAN_TYPE")));
			xb.setTrame(NullCheck.isNotNull(rs.getString("TRAN_METHOD")));
			xb.setTraam(NullCheck.isNotNull(rs.getString("TRAN_AMOUNT")));
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



public ArrayList<XBRLFIM0900Bean> xbrlfim0900(String reptype,String dt1,String dt2,String ReporefSeq,String instno,String curr) {
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLFIM0900Bean> arl = new ArrayList<XBRLFIM0900Bean>();
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
	
	sql.append("select TO_CHAR(TRAN_DATE,'DD-MM-YYYY')TRAN_DATE,TRAN_ID,TRAN_TYPE,TRAN_METHOD,to_char(TRAN_AMOUNT,'9,999,999,999,990.99')TRAN_AMOUNT,TO_CHAR(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE from table(FIM0900_DTL_FUN('"+reptype+"','"+ReporefSeq+"','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
		
log.info("DOC&&&&SELECT Gayu"+sql.toString());
	
	try {
		
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		
		XBRLFIM0900Bean xb=new XBRLFIM0900Bean();
		xb.setTrana(NullCheck.isNotNull(rs.getString("TRAN_DATE")));
		xb.setTraid(NullCheck.isNotNull(rs.getString("TRAN_ID")));
		xb.setTantyp(NullCheck.isNotNull(rs.getString("TRAN_TYPE")));
		xb.setTrame(NullCheck.isNotNull(rs.getString("TRAN_METHOD")));
		xb.setTraam(NullCheck.isNotNull(rs.getString("TRAN_AMOUNT")));
		xb.setRepdat(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
		
		
	
		
		
		
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

public String detailFIM0900savecheck() {

	ConnectionManager connmgr=new ConnectionManager();
	Connection conn=connmgr.getConnection();
	ArrayList<String> arl = new ArrayList<String>();
			HttpServletRequest request = ServletActionContext.getRequest();
			DateFormat df = new DateFormat();
			StringBuffer sql = new StringBuffer();
			PreparedStatement ps = null;
			
			sql.append("SELECT COUNT(REPORT_DATE) as repdate FROM FIM0900_RPT_TB where REPORT_ID = '"+request.getParameter("reptype")+"' AND  REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ");
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
public String FIM0900chckmodified() {

	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	HttpSession session = request.getSession();
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	if(request.getParameter("type").equals("chkuser")) {
		sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM FIM0900_MOD_TABLE ");
	}else {
		//sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM PSC0106_MOD_TABLE WHERE REPORT_DATE='"+NullCheck.isNotNull(df.formatdate(request.getParameter("repdate")))+"'");
		sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM FIM0900_MOD_TABLE ");

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

public ArrayList<XBRLFIM0900Bean>FIM0900verify(){
	
	ArrayList<XBRLFIM0900Bean> arl = new ArrayList<XBRLFIM0900Bean>();
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	sql.	append("SELECT   /* +FIRST_ROWS(100) */ TO_CHAR(TRAN_DATE,'DD-MM-YYYY')TRAN_DATE,TRAN_ID,TRAN_TYPE,TRAN_METHOD,to_char(TRAN_AMOUNT,'9,999,999,999,990.99')TRAN_AMOUNT,TO_CHAR(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE ,DECODE(DEL_FLG,'A','Added','M','Modified','D','Deleted') as DEL_FLG,LCHG_USER_ID  FROM FIM0900_MOD_TABLE ");
	log.info("Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     
	

	while(rs.next()){
		
		
		
		XBRLFIM0900Bean xb=new XBRLFIM0900Bean();
		xb.setTrana(NullCheck.isNotNull(rs.getString("TRAN_DATE")));
		xb.setTraid(NullCheck.isNotNull(rs.getString("TRAN_ID")));
		xb.setTantyp(NullCheck.isNotNull(rs.getString("TRAN_TYPE")));
		xb.setTrame(NullCheck.isNotNull(rs.getString("TRAN_METHOD")));
		xb.setTraam(NullCheck.isNotNull(rs.getString("TRAN_AMOUNT")));
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

public String modFIM0900cancel() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	sql.append("DELETE FROM FIM0900_MOD_TABLE WHERE   TRAN_ID='"+NullCheck.isNotNull(request.getParameter("traid"))+"' ");
	
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

public String detailFIM0900saves(){

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


public String FIM0900verifymaster() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	HttpSession session = request.getSession();
	StringBuffer sql = new StringBuffer();
	DateFormat df1=new DateFormat();		
	
	//------------------get data from mod table---------------------
	XBRLFIM0900Bean xb=new XBRLFIM0900Bean();
	
	sql.setLength(0);
	sql.append("SELECT   /* +FIRST_ROWS(100) */TO_CHAR(TRAN_DATE,'DD-MM-YYYY')TRAN_DATE,TRAN_ID,TRAN_TYPE,TRAN_METHOD,to_char(TRAN_AMOUNT,'9,999,999,999,990.99')TRAN_AMOUNT,TO_CHAR(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,DEL_FLG,LCHG_USER_ID  FROM FIM0900_MOD_TABLE "
			+ "WHERE APPLICATION_NO='"+NullCheck.isNotNull(request.getParameter("applno"))+"' ");
	log.info("Gayu"+sql.toString());
	try {
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			
			xb.setTrana(NullCheck.isNotNull(rs.getString("TRAN_DATE")));
			xb.setTraid(NullCheck.isNotNull(rs.getString("TRAN_ID")));
			xb.setTantyp(NullCheck.isNotNull(rs.getString("TRAN_TYPE")));
			xb.setTrame(NullCheck.isNotNull(rs.getString("TRAN_METHOD")));
			xb.setTraam(NullCheck.isNotNull(rs.getString("TRAN_AMOUNT")));
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
		

		sql.setLength(0);

sql.append(
		"INSERT INTO FIM0900_MAST_TABLE(TRAN_DATE,TRAN_ID,TRAN_TYPE,TRAN_METHOD,TRAN_AMOUNT,REPORT_DATE,DEL_FLG,LCHG_USER_ID,LCHG_TIME,VERIFY_USER_ID,VERIFY_TIME)"
				+ "values('" + df1.formatdate(request.getParameter("trana"))
				+ "','" + request.getParameter("traid") + "','" + request.getParameter("tantyp") + "','"
				+ request.getParameter("trame") + "','" + request.getParameter("traam") + "','"
				+ df1.formatdate(request.getParameter("repdat")) + "','"+xb.getModtyp()+"','"
				+ session.getAttribute("userName")+"',SYSDATE,'"+ session.getAttribute("userName")+"',SYSDATE)");


try {
	log.info(sql.toString());

	ps=conn.prepareStatement(sql.toString());
	
    int rs=0;
    rs=ps.executeUpdate();
     
    status="success";
    
    sql.setLength(0);
    sql.append("DELETE FROM FIM0900_MOD_TABLE WHERE TRAN_ID='"+NullCheck.isNotNull(request.getParameter("traid"))+"'");
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
sql.append("UPDATE FIM0900_MAST_TABLE SET TRAN_DATE='"+NullCheck.isNotNull(request.getParameter("repdat"))+"',TRAN_ID='"+NullCheck.isNotNull(request.getParameter("traid"))+"',TRAN_TYPE='"+NullCheck.isNotNull(request.getParameter("tantyp"))+"',TRAN_METHOD='"+NullCheck.isNotNull(request.getParameter("trame"))+"',TRAN_AMOUNT='"+NullCheck.isNotNull(request.getParameter("traam"))+"',REPORT_DATE='"+df1.formatdate(NullCheck.isNotNull(request.getParameter("repdat")))+"',VERIFY_USER='"+session.getAttribute("userName")+"',VERIFY_TIME=SYSDATE WHERE TRAN_ID='"+NullCheck.isNotNull(request.getParameter("traid"))+"' AND REPORT_DATE='"+df1.formatdate(NullCheck.isNotNull(request.getParameter("repdat")))+"'");


try {
	log.info(sql.toString());
 

	ps=conn.prepareStatement(sql.toString());
	
    int rs=0;
    rs=ps.executeUpdate();
     
    status="success";
    
    sql.setLength(0);
    sql.append("DELETE FROM FIM0900_MOD_TABLE WHERE TRAN_ID='"+NullCheck.isNotNull(request.getParameter("traid"))+"'");

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
	sql.append("DELETE FROM FIM0900_MAST_TABLE WHERE TRAN_ID='"+NullCheck.isNotNull(request.getParameter("traid"))+"'");

	try {
		log.info(sql.toString());
		ps=conn.prepareStatement(sql.toString());
		
	    int rs=0;
	    rs=ps.executeUpdate();
	     
	    status="success";
	    log.info(status);
	    sql.setLength(0);
	    sql.append("UPDATE FIM0900_MOD_TABLE SET LCHG_USER='"+session.getAttribute("userName")+"' WHERE REPORT_DATE='"+df1.formatdate(NullCheck.isNotNull(request.getParameter("repdat")))+"' and TRAN_ID='"+NullCheck.isNotNull(request.getParameter("traid"))+"'");

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
		sql.append("DELETE FROM FIM0900_MOD_TABLE WHERE TRAN_ID='"+NullCheck.isNotNull(request.getParameter("traid"))+"'");
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
