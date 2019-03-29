package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import basecode.DateFormat;
import bean.XBRLBLS0100Bean;
import bean.XBRLBLS0140Bean;
import bean.XBRLBLS0140Bean;
import bean.XBRLBLS0140Bean;
import utilities.ConnectionManager;
import utilities.NullCheck;

public class XBRLBLS0140Dao {
	static Logger log = Logger.getLogger(XBRLBLS0140Dao.class);

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
	
	public String Reporef;

	public String getReporef() {
		return Reporef;
	}

	public void setReporef(String reporef) {
		Reporef = reporef;
	}
	
	public ArrayList<XBRLBLS0140Dao> ReporefSeq(String dt1, String dt2) {

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

		ArrayList<XBRLBLS0140Dao> arl = new ArrayList<XBRLBLS0140Dao>();
		sql.append("select REPORT_REF_NO from BLS0140_MOD_TABLE where REPORT_DATE='" + dt2 + "' ORDER BY REPORT_REF_NO");

		log.info("SELECTPROFILE" + sql.toString());

		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLBLS0140Dao xel = new XBRLBLS0140Dao();
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


	public String BLS0140chckmodified() {

		HttpServletRequest request = ServletActionContext.getRequest();
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		HttpSession session = request.getSession();
		StringBuffer sql = new StringBuffer();
		DateFormat df=new DateFormat();		
		sql.setLength(0);
		
		if(request.getParameter("type").equals("chkuser")) {
			sql.append("select(SELECT COUNT(REPORT_DATE) FROM BLS0140_MOD_TABLE )+(SELECT COUNT(REPORT_DATE) FROM BLS0110_MOD_TABLE WHERE ASSET_TYPE='MISC_LIAB') AS CNT from dual ");
		}else {
			sql.append("select(SELECT COUNT(REPORT_DATE) FROM BLS0140_MOD_TABLE )+(SELECT COUNT(REPORT_DATE) FROM BLS0110_MOD_TABLE WHERE ASSET_TYPE='MISC_LIAB') AS CNT from dual ");

		}
		
		
		try {
			ps=conn.prepareStatement(sql.toString());
			log.info(sql.toString());
		    ResultSet rs=ps.executeQuery();
		      while(rs.next()) {
		    	  cnt=NullCheck.isNotZero(rs.getString("CNT"));
		      }
		    
		}catch(SQLException e) {
			e.printStackTrace();
		}
		log.info("fjd"+cnt);
		return "success";
	}

public ArrayList<XBRLBLS0140Bean>BLS0140verify(){
		
		ArrayList<XBRLBLS0140Bean> arl = new ArrayList<XBRLBLS0140Bean>();
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();
		DateFormat df=new DateFormat();		
		sql.setLength(0);
		log.info("gfchj");
		sql.append("SELECT /* +FIRST_ROWS(100) */to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,ACCT_NO,ACID,DEPOSIT_TYPE,to_char(DEP_AMT, '9,999,999,999,990.99')DEP_AMT,ACCT_CRNCY_CODE,CUST_NRE_FLG,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,DECODE(DEL_FLG,'A','Added','M','Modified','D','Deleted') as DEL_FLG ,LCHG_USER_ID FROM BLS0140_MOD_TABLE");
		log.info("Gayu"+sql.toString());
		try {
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLBLS0140Bean xb=new XBRLBLS0140Bean();


			
			xb.setAcnum(NullCheck.isNotNull(rs.getString("ACCT_NO")));
			xb.setAcid(NullCheck.isNotNull(rs.getString("ACID")));
			xb.setDeptyp(NullCheck.isNotNull(rs.getString("DEPOSIT_TYPE")));
			xb.setDepamt(NullCheck.isNotNull(rs.getString("DEP_AMT")));
			xb.setActcurcod(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
			xb.setCusnreflg(NullCheck.isNotNull(rs.getString("CUST_NRE_FLG")));
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
		}
		return arl;	
	}


public ArrayList<XBRLBLS0140Bean>BLS0140verify1(){
	
	ArrayList<XBRLBLS0140Bean> arl = new ArrayList<XBRLBLS0140Bean>();
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);

	sql.append("SELECT INSTRMNT_NAME,CRNCY_CODE,to_char(AMT_IN_AC, '9,999,999,999,990.99')AMT_IN_AC,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,DECODE(DEL_FLG,'A','Added','M','Modified','D','Deleted') as DEL_FLG ,LCHG_USER_ID FROM BLS0110_MOD_TABLE WHERE ASSET_TYPE='MISC_LIAB'");
	log.info("Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		XBRLBLS0140Bean xb=new XBRLBLS0140Bean();


		xb.setRepdat(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
		xb.setNaminst(NullCheck.isNotNull(rs.getString("INSTRMNT_NAME")));
		xb.setAccur(NullCheck.isNotNull(rs.getString("CRNCY_CODE")));
		xb.setFcamt(NullCheck.isNotNull(rs.getString("AMT_IN_AC")));

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


	
public ArrayList<XBRLBLS0140Bean> xbrlBLS0140(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
		
		
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLBLS0140Bean> arl = new ArrayList<XBRLBLS0140Bean>();
		
		String status = "";
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		
		PreparedStatement ps = null;
		
		StringBuffer sql = new StringBuffer();
		
		
		DateFormat df=new DateFormat();		
		dt1 =df.formatdate(dt1);
		dt2 =df.formatdate(dt2);
		
		log.info("currency"+curr);
		
		 DecimalFormat dfs = new DecimalFormat("##,##.00");  
		 NullCheck chk=new NullCheck();
	
		try {
		
				
			//SELECT * FROM TABLE(BLS0140_S1_RPT_FUN('BLS0110','0','31-AUG-2018','01-AUG-2018','31-AUG-2018','MUR'));
				
				sql.append("SELECT INSTANCE_NAME,INSTANCE_CODE,to_char(RESIDENT_LC, '9,999,999,999,990.99')RESIDENT_LC,to_char(RESIDENT_AC, '9,999,999,999,990.99')RESIDENT_AC,to_char(NR_LC, '9,999,999,999,990.99')NR_LC,to_char(NR_AC, '9,999,999,999,990.99')NR_AC FROM TABLE(BLS0140_S1_RPT_FUN('BLS0140','"+chk.notZero(ReporefSeq)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
				
				
			log.info("BLS0140 sec1 "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				XBRLBLS0140Bean xb=new XBRLBLS0140Bean();
				
			
				xb.setInstname(NullCheck.isNotNull(rs.getString("INSTANCE_NAME")));
				xb.setInstcode(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
				xb.setNatcur(NullCheck.isNotNull(rs.getString("RESIDENT_LC")));
				xb.setFrecur(NullCheck.isNotNull(rs.getString("RESIDENT_AC")));
				xb.setNaticur(NullCheck.isNotNull(rs.getString("NR_LC")));
				xb.setFreicur(NullCheck.isNotNull(rs.getString("NR_AC")));


					
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
	
public ArrayList<XBRLBLS0140Bean> xbrl2BLS0140(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLBLS0140Bean> arl = new ArrayList<XBRLBLS0140Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	log.info("currency"+curr);
	
	 DecimalFormat dfs = new DecimalFormat("##,##.00");  
	 NullCheck chk=new NullCheck();

	try {
	
			
		//SELECT * FROM TABLE(BLS0140_S1_RPT_FUN('BLS0110','0','31-AUG-2018','01-AUG-2018','31-AUG-2018','MUR'));
			
			sql.append("SELECT SL_NO,NAME_OF_INSTRUMENT,ACCT_CURRENCY,to_char(AMT_FC, '9,999,999,999,990.99')AMT_FC,to_char(AMT_LC, '9,999,999,999,990.99')AMT_LC FROM TABLE(BLS0140_S2_RPT_FUN('BLS0140','"+chk.notZero(ReporefSeq)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
			
		log.info("BLS0140 sec2 "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLBLS0140Bean xb=new XBRLBLS0140Bean();
			
		
			xb.setSrno(NullCheck.isNotNull(rs.getString("SL_NO")));
			xb.setNaminst(NullCheck.isNotNull(rs.getString("NAME_OF_INSTRUMENT")));
			xb.setCurrency(NullCheck.isNotNull(rs.getString("ACCT_CURRENCY")));
			xb.setFrecuramt(NullCheck.isNotNull(rs.getString("AMT_FC")));
			xb.setOthacpaymcs(NullCheck.isNotNull(rs.getString("AMT_LC")));


				
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

	
public ArrayList<XBRLBLS0140Bean> xbrlBLS0140ajaxdetails(String repname,String reprefno,String instno,String dt2,String curr) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("repname    " + repname + "reprefno   "  + reprefno + "instno"+ instno +"dt2   " + dt2 +"currency" +curr);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLBLS0140Bean> arl = new ArrayList<XBRLBLS0140Bean>();
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
		
		
			
		sql.append("SELECT ACCT_NO,ACID,DEPOSIT_TYPE,to_char(DEP_AMT, '9,999,999,999,990.99')DEP_AMT,ACCT_CRNCY_CODE,CUST_NRE_FLG,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE FROM TABLE(BLS0140_S1_DTL_FUN('BLS0140','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
			log.info("BLS  Kumar  "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				//log.info("whileee");
								
				 
				XBRLBLS0140Bean xb=new XBRLBLS0140Bean();
				

				xb.setAcnum(NullCheck.isNotNull(rs.getString("ACCT_NO")));
				xb.setAcid(NullCheck.isNotNull(rs.getString("ACID")));
				xb.setDeptyp(NullCheck.isNotNull(rs.getString("DEPOSIT_TYPE")));
				xb.setDepamt(NullCheck.isNotNull(rs.getString("DEP_AMT")));
				xb.setActcurcod(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
				xb.setCusnreflg(NullCheck.isNotNull(rs.getString("CUST_NRE_FLG")));
				xb.setRepdat(NullCheck.isNotNull(rs.getString("REPORT_DATE")));


			
			
				
		
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
	
	
	
public ArrayList<XBRLBLS0140Bean> xbrlBLS01401ajaxdetails(String repname,String reprefno,String instno,String dt2,String curr) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("repname    " + repname + "reprefno   "  + reprefno + "instno"+ instno +"dt2   " + dt2 +"currency" +curr);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLBLS0140Bean> arl = new ArrayList<XBRLBLS0140Bean>();
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
		
		
			
		sql.append("SELECT SL_NO,NAME_OF_INSTRUMENT,ACCT_CURRENCY,to_char(AMT_FC, '9,999,999,999,990.99')AMT_FC,to_char(AMT_LC, '9,999,999,999,990.99')AMT_LC FROM TABLE(BLS0140_S2_DTL_FUN('BLS0140','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
			log.info("BLS  Kumar  "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				//log.info("whileee");
								
				 
				XBRLBLS0140Bean xb=new XBRLBLS0140Bean();
				

				xb.setSenum(NullCheck.isNotNull(rs.getString("SL_NO")));
				xb.setNaminst(NullCheck.isNotNull(rs.getString("NAME_OF_INSTRUMENT")));
				xb.setAccur(NullCheck.isNotNull(rs.getString("ACCT_CURRENCY")));
				xb.setFcamt(NullCheck.isNotNull(rs.getString("AMT_FC")));
				xb.setLcamt(NullCheck.isNotNull(rs.getString("AMT_LC")));
				
				

			
			
				
		
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
public ArrayList<XBRLBLS0140Bean> xbrlBLS0140edel1(String repname,String reprefno,String instno,String dt2,String curr) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("repname    " + repname + "reprefno   "  + reprefno + "instno"+ instno +"dt2   " + dt2 +"currency" +curr);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLBLS0140Bean> arl = new ArrayList<XBRLBLS0140Bean>();
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
		
		
			
		sql.append("SELECT ACCT_NO,ACID,DEPOSIT_TYPE,to_char(DEP_AMT, '9,999,999,999,990.99')DEP_AMT,ACCT_CRNCY_CODE,CUST_NRE_FLG,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE FROM TABLE(BLS0140_S1_DTL_FUN('BLS0140','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
			log.info("BLS  Kumar  "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				//log.info("whileee");
								
				 
				XBRLBLS0140Bean xb=new XBRLBLS0140Bean();
				

				xb.setAcnum(NullCheck.isNotNull(rs.getString("ACCT_NO")));
				xb.setAcid(NullCheck.isNotNull(rs.getString("ACID")));
				xb.setDeptyp(NullCheck.isNotNull(rs.getString("DEPOSIT_TYPE")));
				xb.setDepamt(NullCheck.isNotNull(rs.getString("DEP_AMT")));
				xb.setActcurcod(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
				xb.setCusnreflg(NullCheck.isNotNull(rs.getString("CUST_NRE_FLG")));
				xb.setRepdat(NullCheck.isNotNull(rs.getString("REPORT_DATE")));


			
			
				
		
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
	
	
	
public ArrayList<XBRLBLS0140Bean> xbrlBLS0140edel2(String repname,String reprefno,String instno,String dt2,String curr) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("repname    " + repname + "reprefno   "  + reprefno + "instno"+ instno +"dt2   " + dt2 +"currency" +curr);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLBLS0140Bean> arl = new ArrayList<XBRLBLS0140Bean>();
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
		
		
			
		sql.append("SELECT SL_NO,NAME_OF_INSTRUMENT,ACCT_CURRENCY,to_char(AMT_FC, '9,999,999,999,990.99')AMT_FC,to_char(AMT_LC, '9,999,999,999,990.99')AMT_LC FROM TABLE(BLS0140_S2_DTL_FUN('BLS0140','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");
			
			log.info("BLS  Kumar  "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				//log.info("whileee");
								
				 
				XBRLBLS0140Bean xb=new XBRLBLS0140Bean();
				

				xb.setSenum(NullCheck.isNotNull(rs.getString("SL_NO")));
				xb.setNaminst(NullCheck.isNotNull(rs.getString("NAME_OF_INSTRUMENT")));
				xb.setAccur(NullCheck.isNotNull(rs.getString("ACCT_CURRENCY")));
				xb.setFcamt(NullCheck.isNotNull(rs.getString("AMT_FC")));
				xb.setLcamt(NullCheck.isNotNull(rs.getString("AMT_LC")));
				
				

			
			
				
		
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
public String detailBLS0140saves() {

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
	


public String detailBLS0140savecheck() {

	ConnectionManager connmgr=new ConnectionManager();
	Connection conn=connmgr.getConnection();
	ArrayList<String> arl = new ArrayList<String>();
			HttpServletRequest request = ServletActionContext.getRequest();
			DateFormat df = new DateFormat();
			StringBuffer sql = new StringBuffer();
			PreparedStatement ps = null;
			
			sql.append("SELECT COUNT(REPORT_DATE) as repdate FROM BLS0140_S1_RPT_TB where REPORT_ID = '"+request.getParameter("reptype")+"' AND  REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ");
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

public String resalert;

public String getResalert() {
	return resalert;
}

public void setResalert(String resalert) {
	this.resalert = resalert;
}
public String modBLS0140cancel() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	log.info("sf+");
	int tabid;
	tabid = Integer.parseInt(request.getParameter("tabid"));
	log.info("dfsf"+tabid);
	if(tabid==1) {
	sql.append("DELETE FROM BLS0140_MOD_TABLE WHERE    ACCT_NO='"+NullCheck.isNotNull(request.getParameter("acnum"))+"'");
	}
	else
	{
		sql.append("DELETE FROM BLS0110_MOD_TABLE WHERE    INSTRMNT_NAME='"+NullCheck.isNotNull(request.getParameter("naminst"))+"' AND ASSET_TYPE='MISC_LIAB'");
	
	}
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


public String BLS0140verifymaster() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	HttpSession session = request.getSession();
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();	
	
	//------------------get data from mod table---------------------
	XBRLBLS0140Bean xb=new XBRLBLS0140Bean();
	
	sql.setLength(0);
	
	sql.append("SELECT ACCT_NO,ACID,DEPOSIT_TYPE,to_char(DEP_AMT, '9,999,999,999,990.99')DEP_AMT,ACCT_CRNCY_CODE,CUST_NRE_FLG,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,DEL_FLG,LCHG_USER_ID FROM BLS0140_MOD_TABLE "
			+ "WHERE ACCT_NO='"+NullCheck.isNotNull(request.getParameter("acnum"))+"' AND REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("repdat")))+"'  ");
	log.info("Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		

		
		xb.setAcnum(NullCheck.isNotNull(rs.getString("ACCT_NO")));
		xb.setAcid(NullCheck.isNotNull(rs.getString("ACID")));
		xb.setDeptyp(NullCheck.isNotNull(rs.getString("DEPOSIT_TYPE")));
		xb.setDepamt(NullCheck.isNotNull(rs.getString("DEP_AMT")));
		xb.setActcurcod(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
		xb.setCusnreflg(NullCheck.isNotNull(rs.getString("CUST_NRE_FLG")));
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
				" INSERT INTO BLS0140_MAST_TABLE(ACCT_NO,ACID,DEPOSIT_TYPE,DEP_AMT,ACCT_CRNCY_CODE,CUST_NRE_FLG,REPORT_DATE,DEL_FLG,LCHG_USER_ID,LCHG_TIME,VERIFY_USER_ID,VERIFY_TIME)" + "VALUES ('"
						
										+ request.getParameter("acnum") + "','" + request.getParameter("acid") + "','"
										+ request.getParameter("deptyp") + "','" + request.getParameter("depamt") + "','"
										+ request.getParameter("actcurcod") + "','" + request.getParameter("cusnreflg") + "','"
										+ df.formatdate(request.getParameter("repdat")) + "','"+xb.getModtyp()+"','"
						+ session.getAttribute("userName")+"',SYSDATE,'"+ session.getAttribute("userName")+"',SYSDATE)");
				
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("DELETE FROM BLS0140_MOD_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("repdat")))+"' and ACCT_NO='"+NullCheck.isNotNull(request.getParameter("acnum"))+"'");
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


	}else if (xb.getModtyp().equals("M") ) {
		
	//For Modified Records
		
		sql.setLength(0);
		sql.append("UPDATE BLS0140_MOD_TABLE SET ACID='" + request.getParameter("acid")
		+ "', DEPOSIT_TYPE ='" + request.getParameter("deptyp")
		+ "', DEP_AMT='" + request.getParameter("depamt")
		+ "', ACCT_CRNCY_CODE ='" + request.getParameter("actcurcod")
		+ "', CUST_NRE_FLG ='" + request.getParameter("cusnreflg")
		+ "', REPORT_DATE ='" + df.formatdate(request.getParameter("repdat"))
		+ "',VERIFY_USER_ID='"+session.getAttribute("userName")+"',VERIFY_TIME=SYSDATE "
		+ "WHERE REPORT_DATE='"
		+ df.formatdate(request.getParameter("repdat")) + "' " + "AND ACCT_NO='"
		+ request.getParameter("acnum")
		+ "'");
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("DELETE FROM BLS0140_MOD_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("repdat")))+"' and ACCT_NO='"+NullCheck.isNotNull(request.getParameter("acnum"))+"'");
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


		
	}else if (xb.getModtyp().equals("D") ) {
		
	//For Deleted Records
		
		sql.setLength(0);
		sql.append("DELETE FROM BLS0140_MAST_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("repdat")))+"' and ACCT_NO='"+NullCheck.isNotNull(request.getParameter("acnum"))+"'");
		
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("UPDATE BLS0140_MOD_TABLE SET LCHG_USER_ID='"+session.getAttribute("userName")+"' WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("repdat")))+"' and ACCT_NO='"+NullCheck.isNotNull(request.getParameter("acnum"))+"'");
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
		    sql.append("DELETE FROM BLS0140_MOD_TABLE WHERE REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("repdat")))+"' and ACCT_NO='"+NullCheck.isNotNull(request.getParameter("acnum"))+"'");
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


	}
	
	
	
	
	
	
	return status;
}




public String BLS0140verifymaster1() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	HttpSession session = request.getSession();
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();	
	
	//------------------get data from mod table---------------------
	XBRLBLS0140Bean xb=new XBRLBLS0140Bean();
	log.info("gffhjgkGayu");

	sql.setLength(0);
	sql.append("SELECT INSTRMNT_NAME,CRNCY_CODE,to_char(AMT_IN_AC, '9,999,999,999,990.99')AMT_IN_AC,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE,DEL_FLG,LCHG_USER_ID FROM BLS0110_MOD_TABLE "
			+ "WHERE INSTRMNT_NAME='"+NullCheck.isNotNull(request.getParameter("naminst"))+"' AND ASSET_TYPE='MISC_LIAB' ");
	
	/*sql.append("SELECT INSTRMNT_NAME,CRNCY_CODE,to_char(AMT_IN_AC, '9,999,999,999,990.99')AMT_IN_AC,DEL_FLG,LCHG_USER_ID FROM BLS0110_MOD_TABLE "
			+ "WHERE INSTRMNT_NAME='"+NullCheck.isNotNull(request.getParameter("naminst"))+"' AND REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("dt2")))+"' ");
	*/
	
	log.info("Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		

		
		xb.setNaminst(NullCheck.isNotNull(rs.getString("INSTRMNT_NAME")));
		xb.setAccur(NullCheck.isNotNull(rs.getString("CRNCY_CODE")));
		xb.setFcamt(NullCheck.isNotNull(rs.getString("AMT_IN_AC")));
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
				" INSERT INTO BLS0110_MAST_TABLE(INSTRMNT_NAME,ASSET_TYPE,CRNCY_CODE,AMT_IN_AC,REPORT_DATE,DEL_FLG,LCHG_USER_ID,LCHG_TIME,VERIFY_USER_ID,VERIFY_TIME)" + "VALUES ('"
						
										+ request.getParameter("naminst") + "','" + request.getParameter("astyp") + "','" + request.getParameter("accur") + "','"
										+ request.getParameter("fcamt") + "','" +df.formatdate( request.getParameter("repdate")) + "','"+xb.getModtyp()+"','"
						+ session.getAttribute("userName")+"',SYSDATE,'"+ session.getAttribute("userName")+"',SYSDATE)");
				
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("DELETE FROM BLS0110_MOD_TABLE WHERE   INSTRMNT_NAME='"+NullCheck.isNotNull(request.getParameter("naminst"))+"' AND ASSET_TYPE='MISC_LIAB'");
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
		}finally {

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
		
	}else if (xb.getModtyp().equals("M") ) {
		
	//For Modified Records
		
		sql.setLength(0);
		sql.append("UPDATE BLS0110_MOD_TABLE SET INSTRMNT_NAME='" + request.getParameter("naminst")
		+ "', CRNCY_CODE ='" + request.getParameter("accur")
		+ "', AMT_IN_AC='" + request.getParameter("fcamt")
		+ "', VERIFY_USER_ID='"+session.getAttribute("userName")+"',VERIFY_TIME=SYSDATE "
		+ " WHERE  INSTRMNT_NAME='"
		+ request.getParameter("naminst")
		+ "' AND ASSET_TYPE='MISC_LIAB' ");
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("DELETE FROM BLS0110_MOD_TABLE WHERE  INSTRMNT_NAME='"+NullCheck.isNotNull(request.getParameter("naminst"))+"' AND ASSET_TYPE='MISC_LIAB'");
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
		}finally {

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
		
		
	}else if (xb.getModtyp().equals("D") ) {
		
	//For Deleted Records
		
		sql.setLength(0);
		sql.append("DELETE FROM BLS0110_MAST_TABLE WHERE  INSTRMNT_NAME='"+NullCheck.isNotNull(request.getParameter("naminst"))+"' AND ASSET_TYPE='MISC_LIAB'");
		
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("UPDATE BLS0110_MOD_TABLE SET LCHG_USER_ID='"+session.getAttribute("userName")+"' WHERE  INSTRMNT_NAME='"+NullCheck.isNotNull(request.getParameter("naminst"))+"' AND ASSET_TYPE='MISC_LIAB'");
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
		    sql.append("DELETE FROM BLS0110_MOD_TABLE WHERE  INSTRMNT_NAME='"+NullCheck.isNotNull(request.getParameter("naminst"))+"' AND ASSET_TYPE='MISC_LIAB'");
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
		}finally {

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
	}
	
	
	
	
	
	
	return status;
}








}
