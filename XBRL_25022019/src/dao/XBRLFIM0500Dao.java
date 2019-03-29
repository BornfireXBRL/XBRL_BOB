package dao;



/****************************************************************************************************************
*																												*
* 	* @companyName 			:	Bonfire Innovation Private Limited Chennai										*
* 	* @project 				:	Extensible Business Reporting Language (XBRL)									*
* 	* @name 				:	XBRLSUP1400Action.java															*
* 	* @path 				:	action																			*
* 	* @author 				:	D PraveenBabu																	*
* 	* @version 				: 	1.0																				*
* 	* @functionality 		:	It contains the action with multiple methods to create SUP01400 Report.													*
* 	* @relatedScripts 		: 	bean.XBRLSUP1400Bean.java,dao.XBRLSUP1400Dao.java 								*
* 	* @creationDate 		:																					*
* 	* @lastModifiedDate 	:																					*
* 	* @modificationHistory 	: 																					*
*																												*
****************************************************************************************************************/

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
import bean.XBRLBOPBean;
import bean.XBRLFIM0500Bean;
import bean.XBRLFIM0500Bean;
import bean.XBRLFIM0500Bean;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRLFIM0500Dao  {
	
	static Logger log = Logger.getLogger(XBRLFIM0500Dao.class);
	
	public String Reporef;

	public String getReporef() {
		return Reporef;
	}

	public void setReporef(String reporef) {
		Reporef = reporef;
	}
	
	public ArrayList<XBRLFIM0500Dao> ReporefSeq(String dt1, String dt2) {

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

		ArrayList<XBRLFIM0500Dao> arl = new ArrayList<XBRLFIM0500Dao>();
		sql.append("select REPORT_REF_NO from FIM0500_S2_MOD_TABLE where REPORT_DATE='" + dt2 + "' ORDER BY REPORT_REF_NO");

		log.info("SELECTPROFILE" + sql.toString());

		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLFIM0500Dao xel = new XBRLFIM0500Dao();
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

	
	/*
public ArrayList<XBRLFIM0500Bean> xbrlfim500(String dt1,String dt2) {
	
		log.info("xbrlcrr500 List Data AB " + dt1 + "dt22222" + dt2);
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLFIM0500Bean> arl = new ArrayList<XBRLFIM0500Bean>();
		
		String status = "";
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		
		PreparedStatement ps = null;
		
		StringBuffer sql = new StringBuffer();
		
		
		DateFormat df=new DateFormat();		
		
		dt1 =df.formatdate(dt1);
		dt2 =df.formatdate(dt2);
		
	
		try {
		
			//sql.append("select SRL_NO,NAME_OF_CUST,CIF_ID,ACCT_NUM,ACCT_PRODUCTS,to_char(ACCT_OPN_DATE,'DD-MM-YYYY')ACCT_OPN_DATE,ACCT_CRNCY,ACCT_BAL,RATE_OF_INT,DAILY_AVG_AMT,WEIGHT_AVG_INT_RATE,INT_INC_EXP from BOP300XBRLREPORT where RPT_START_DATE='"+fromdate+"' and RPT_END_DATE='"+todate+"'");
	
			//sql.append("SELECT DYNAMIC_DOMAIN,to_char(REP_DATE,'DD-MM-YYYY')REP_DATE,INSTITUTE_ID,TRAN_ID,INSTITUTE_NAME,TRAN_NATURE,INSTITUTE_CODE,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,NVL(to_char(INT_START_DATE,'DD-MM-YYYY'),'NA')INT_START_DATE,NVL(to_char(INT_END_DATE,'DD-MM-YYYY'),'NA')INT_END_DATE,INT_RATE,DEL_FLG,RCRE_USER_ID,RCRE_TIME,LCHG_USER_ID,LCHG_TIME FROM FIM0500_MAST_TABLE Where  REP_DATE >='"+dt1+"' and REP_DATE <= '"+dt2+"'");
		
			sql.append("SELECT DYNAMIC_DOMAIN,to_char(REP_DATE,'DD-MM-YYYY')REP_DATE,INSTITUTE_ID,TRAN_ID,INSTITUTE_NAME,TRAN_NATURE,INSTITUTE_CODE,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,to_char(INT_START_DATE,'DD-MM-YYYY')INT_START_DATE,to_char(INT_END_DATE,'DD-MM-YYYY')INT_END_DATE,INT_RATE,DEL_FLG,RCRE_USER_ID,RCRE_TIME,LCHG_USER_ID,LCHG_TIME FROM FIM0500_MAST_TABLE Where  REP_DATE >='"+dt1+"' and REP_DATE <= '"+dt2+"' order by  CAST(TRAN_ID AS int)");
			
			log.info("FIM0500"+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				log.info("whileee");
				XBRLFIM0500Bean xb=new XBRLFIM0500Bean();
				
				
			
				xb.setDyndomain(NullCheck.isNotNull(rs.getString("DYNAMIC_DOMAIN")));
				xb.setRptdate(NullCheck.isNotNull(rs.getString("REP_DATE")));
				xb.setInstitid(NullCheck.isNotNull(rs.getString("INSTITUTE_ID")));
				xb.setTranid(NullCheck.isNotNull(rs.getString("TRAN_ID")));
				xb.setInstitname(NullCheck.isNotNull(rs.getString("INSTITUTE_NAME")));
				xb.setTrannature(NullCheck.isNotNull(rs.getString("TRAN_NATURE")));
				xb.setInstitcode(NullCheck.isNotNull(rs.getString("INSTITUTE_CODE")));
				xb.setTrancrcny(NullCheck.isNotNull(rs.getString("TRAN_CRNCY")));
				xb.setTrantype(NullCheck.isNotNull(rs.getString("TRAN_TYPE")));
				xb.setTranamt(NullCheck.isNotNull(rs.getString("TRAN_AMT")));
				xb.setIntstadate(NullCheck.isNotNull(rs.getString("INT_START_DATE")));
				xb.setIntenddate(NullCheck.isNotNull(rs.getString("INT_END_DATE")));
				xb.setIntrate(NullCheck.isNotNull(rs.getString("INT_RATE")));
				xb.setDelflg(NullCheck.isNotNull(rs.getString("DEL_FLG")));
				xb.setRcrusrid(NullCheck.isNotNull(rs.getString("RCRE_USER_ID")));
				xb.setRcrtime(NullCheck.isNotNull(rs.getString("RCRE_TIME")));
				xb.setLchgusrid(NullCheck.isNotNull(rs.getString("LCHG_USER_ID")));
				xb.setLchgtime(NullCheck.isNotNull(rs.getString("LCHG_TIME")));
				
			
			 
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


public ArrayList<XBRLFIM0500Bean> xbrlfim500BB( String dt1, String dt2) {
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLFIM0500Bean> arl = new ArrayList<XBRLFIM0500Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();	
	
		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	
	

	try {
	

		sql.append("SELECT DYNAMIC_DOMAIN,to_char(REP_DATE,'DD-MM-YYYY')REP_DATE,INSTITUTE_ID,TRAN_ID,INSTITUTE_NAME,TRAN_NATURE,INSTITUTE_CODE,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,to_char(INT_START_DATE,'DD-MM-YYYY')INT_START_DATE,to_char(INT_END_DATE,'DD-MM-YYYY')INT_END_DATE,INT_RATE,DEL_FLG,RCRE_USER_ID,RCRE_TIME,LCHG_USER_ID,LCHG_TIME FROM FIM0500_MAST_TABLE Where  REP_DATE >='"+dt1+"' and REP_DATE <= '"+dt2+"'");
	
		log.info("CRRRRRRRRRRRRRR"+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			log.info("whileee");
			XBRLFIM0500Bean xb=new XBRLFIM0500Bean();	
		
			xb.setDyndomain(NullCheck.isNotNull(rs.getString("DYNAMIC_DOMAIN")));
			xb.setRptdate(NullCheck.isNotNull(rs.getString("REP_DATE")));
			xb.setInstitid(NullCheck.isNotNull(rs.getString("INSTITUTE_ID")));
			xb.setTranid(NullCheck.isNotNull(rs.getString("TRAN_ID")));
			xb.setInstitname(NullCheck.isNotNull(rs.getString("INSTITUTE_NAME")));
			xb.setTrannature(NullCheck.isNotNull(rs.getString("TRAN_NATURE")));
			xb.setInstitcode(NullCheck.isNotNull(rs.getString("INSTITUTE_CODE")));
			xb.setTrancrcny(NullCheck.isNotNull(rs.getString("TRAN_CRNCY")));
			xb.setTrantype(NullCheck.isNotNull(rs.getString("TRAN_TYPE")));
			xb.setTranamt(NullCheck.isNotNull(rs.getString("TRAN_AMT")));
			xb.setIntstadate(NullCheck.isNotNull(rs.getString("INT_START_DATE")));
			xb.setIntenddate(NullCheck.isNotNull(rs.getString("INT_END_DATE")));
			xb.setIntrate(NullCheck.isNotNull(rs.getString("INT_RATE")));
			//xb.setDelflg(NullCheck.isNotNull(rs.getString("DEL_FLG")));
			xb.setRcrusrid(NullCheck.isNotNull(rs.getString("RCRE_USER_ID")));
			xb.setRcrtime(NullCheck.isNotNull(rs.getString("RCRE_TIME")));
			xb.setLchgusrid(NullCheck.isNotNull(rs.getString("LCHG_USER_ID")));
			xb.setLchgtime(NullCheck.isNotNull(rs.getString("LCHG_TIME")));
			
			
		
		 
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





public ArrayList<XBRLFIM0500Bean> xbrlfim500AC(String dt1,String dt2) {
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLFIM0500Bean> arl = new ArrayList<XBRLFIM0500Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	

	try {
	
		//sql.append("select SRL_NO,NAME_OF_CUST,CIF_ID,ACCT_NUM,ACCT_PRODUCTS,to_char(ACCT_OPN_DATE,'DD-MM-YYYY')ACCT_OPN_DATE,ACCT_CRNCY,ACCT_BAL,RATE_OF_INT,DAILY_AVG_AMT,WEIGHT_AVG_INT_RATE,INT_INC_EXP from BOP300XBRLREPORT where RPT_START_DATE='"+fromdate+"' and RPT_END_DATE='"+todate+"'");

		sql.append("SELECT DYNAMIC_DOMAIN,to_char(REP_DATE,'DD-MM-YYYY')REP_DATE,INSTITUTE_ID,TRAN_ID,INSTITUTE_NAME,TRAN_NATURE,INSTITUTE_CODE,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,to_char(INT_START_DATE,'DD-MM-YYYY')INT_START_DATE,to_char(INT_END_DATE,'DD-MM-YYYY')INT_END_DATE,INT_RATE,DEL_FLG,RCRE_USER_ID,RCRE_TIME,LCHG_USER_ID,LCHG_TIME FROM FIM0500_MAST_TABLE Where  REP_DATE >='"+dt1+"' and REP_DATE <= '"+dt2+"'");
	
		log.info("CRRRRRRRRRRRRRR"+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			log.info("whileee");
			XBRLFIM0500Bean xb=new XBRLFIM0500Bean();
			
			
		
			
			xb.setDyndomain(NullCheck.isNotNull(rs.getString("DYNAMIC_DOMAIN")));
			xb.setRptdate(NullCheck.isNotNull(rs.getString("REP_DATE")));
			xb.setInstitid(NullCheck.isNotNull(rs.getString("INSTITUTE_ID")));
			xb.setTranid(NullCheck.isNotNull(rs.getString("TRAN_ID")));
			xb.setInstitname(NullCheck.isNotNull(rs.getString("INSTITUTE_NAME")));
			xb.setTrannature(NullCheck.isNotNull(rs.getString("TRAN_NATURE")));
			xb.setInstitcode(NullCheck.isNotNull(rs.getString("INSTITUTE_CODE")));
			xb.setTrancrcny(NullCheck.isNotNull(rs.getString("TRAN_CRNCY")));
			xb.setTrantype(NullCheck.isNotNull(rs.getString("TRAN_TYPE")));
			xb.setTranamt(NullCheck.isNotNull(rs.getString("TRAN_AMT")));
			xb.setIntstadate(NullCheck.isNotNull(rs.getString("INT_START_DATE")));
			xb.setIntenddate(NullCheck.isNotNull(rs.getString("INT_END_DATE")));
			xb.setIntrate(NullCheck.isNotNull(rs.getString("INT_RATE")));
			//xb.setDelflg(NullCheck.isNotNull(rs.getString("DEL_FLG")));
			xb.setRcrusrid(NullCheck.isNotNull(rs.getString("RCRE_USER_ID")));
			xb.setRcrtime(NullCheck.isNotNull(rs.getString("RCRE_TIME")));
			xb.setLchgusrid(NullCheck.isNotNull(rs.getString("LCHG_USER_ID")));
			xb.setLchgtime(NullCheck.isNotNull(rs.getString("LCHG_TIME")));
			
		
		 
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


public ArrayList<XBRLFIM0500Bean> xbrlfimRR(String dt1,String dt2,String ReporefSeq) {
	log.info("xbrlEID Method=== xbrlcrrRR");
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLFIM0500Bean> arl = new ArrayList<XBRLFIM0500Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	PreparedStatement ps1 = null;
	
	StringBuffer sql = new StringBuffer();
	StringBuffer sql1 = new StringBuffer();
	
	DateFormat df=new DateFormat();
	
log.info("ReporefSeq/////////////////////////////////////**************************"+request.getParameter("ReporefSeq"));
	try {
	
	
		
		//sql.append("SELECT RPT_DAY,to_char(RPT_DATE,'DD-MM-YYYY')RPT_DATE,REC_CODE,DEPOSIT_AMT_IN_MUR,DEPOSIT_DENOM_IN_EUR,DEPOSIT_DENOM_IN_GBP,DEPOSIT_DENOM_IN_USD,USD_EQUIV_OTH_FCY_DEPOSIT,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME  FROM   CRR0500_MAST_TABLE where REC_CODE='AB' and REC_CODE="" and  RCRE_TIME not in (Select RCRE_TIME from FIM0300_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq+"')	UNION 	SELECT RPT_DATE,RPT_DAY,REC_CODE,DEPOSIT_AMT_IN_MUR,DEPOSIT_DENOM_IN_EUR,DEPOSIT_DENOM_IN_GBP,DEPOSIT_DENOM_IN_USD,USD_EQUIV_OTH_FCY_DEPOSIT,DEL_FLG,RCRE_USER_ID,RCRE_TIME,LCHG_USER_ID,LCHG_TIME FROM CRR0500_MOD_TABLE WHERE REPORT_REF_NO='"+ReporefSeq+"' ORDER BY SRL_NO ASC ") ;
		
		
		sql.append("SELECT DYNAMIC_DOMAIN,to_char(REP_DATE,'DD-MM-YYYY')REP_DATE,INSTITUTE_ID,TRAN_ID,INSTITUTE_NAME,TRAN_NATURE,INSTITUTE_CODE,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,to_char(INT_START_DATE,'DD-MM-YYYY')INT_START_DATE,to_char(INT_END_DATE,'DD-MM-YYYY')INT_END_DATE,INT_RATE,DEL_FLG,RCRE_USER_ID,RCRE_TIME,LCHG_USER_ID,LCHG_TIME FROM FIM0500_MAST_TABLE  where  (TRAN_ID) not  in (Select TRAN_ID from FIM0500_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq+"') UNION SELECT DYNAMIC_DOMAIN,to_char(REP_DATE,'DD-MM-YYYY')REP_DATE,INSTITUTE_ID,TRAN_ID,INSTITUTE_NAME,TRAN_NATURE,INSTITUTE_CODE,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,to_char(INT_START_DATE,'DD-MM-YYYY')INT_START_DATE,to_char(INT_END_DATE,'DD-MM-YYYY')INT_END_DATE,INT_RATE,DEL_FLG,RCRE_USER_ID,RCRE_TIME,LCHG_USER_ID,LCHG_TIME FROM FIM0500_MOD_TABLE  WHERE   REPORT_REF_NO = '"+ReporefSeq+"'  ORDER BY REP_DATE ASC") ;
		
		//sql.append("SELECT DYNAMIC_DOMAIN,to_char(REP_DATE,'DD-MM-YYYY')REP_DATE,INSTITUTE_ID,TRAN_ID,INSTITUTE_NAME,TRAN_NATURE,INSTITUTE_CODE,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,to_char(INT_START_DATE,'DD-MM-YYYY')INT_START_DATE,to_char(INT_END_DATE,'DD-MM-YYYY')INT_END_DATE,INT_RATE,DEL_FLG,RCRE_USER_ID,RCRE_TIME,LCHG_USER_ID,LCHG_TIME FROM FIM0500_MAST_TABLE Where  REP_DATE >='"+dt1+"' and REP_DATE <= '"+dt2+"'");
		
		
	log.info("DOC&&&&SELECT"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		log.info("whileee--->RS");
		XBRLFIM0500Bean xb=new XBRLFIM0500Bean();
		
		
		xb.setDyndomain(NullCheck.isNotNull(rs.getString("DYNAMIC_DOMAIN")));
		xb.setRptdate(NullCheck.isNotNull(rs.getString("REP_DATE")));
		xb.setInstitid(NullCheck.isNotNull(rs.getString("INSTITUTE_ID")));
		xb.setTranid(NullCheck.isNotNull(rs.getString("TRAN_ID")));
		xb.setInstitname(NullCheck.isNotNull(rs.getString("INSTITUTE_NAME")));
		xb.setTrannature(NullCheck.isNotNull(rs.getString("TRAN_NATURE")));
		xb.setInstitcode(NullCheck.isNotNull(rs.getString("INSTITUTE_CODE")));
		xb.setTrancrcny(NullCheck.isNotNull(rs.getString("TRAN_CRNCY")));
		xb.setTrantype(NullCheck.isNotNull(rs.getString("TRAN_TYPE")));
		xb.setTranamt(NullCheck.isNotNull(rs.getString("TRAN_AMT")));
		xb.setIntstadate(NullCheck.isNotNull(rs.getString("INT_START_DATE")));
		xb.setIntenddate(NullCheck.isNotNull(rs.getString("INT_END_DATE")));
		xb.setIntrate(NullCheck.isNotNull(rs.getString("INT_RATE")));
		xb.setDelflg(NullCheck.isNotNull(rs.getString("DEL_FLG")));
		xb.setRcrusrid(NullCheck.isNotNull(rs.getString("RCRE_USER_ID")));
		xb.setRcrtime(NullCheck.isNotNull(rs.getString("RCRE_TIME")));
		xb.setLchgusrid(NullCheck.isNotNull(rs.getString("LCHG_USER_ID")));
		xb.setLchgtime(NullCheck.isNotNull(rs.getString("LCHG_TIME")));
		
		
		 arl.add(xb);
	}
	}catch(SQLException e){
		e.printStackTrace();
	}
		
	
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




public ArrayList<XBRLFIM0500Bean> xbrlfimACRR(String dt1,String dt2,String ReporefSeq) {
	log.info("xbrlEID Method=== xbrlcrrRR");
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLFIM0500Bean> arl = new ArrayList<XBRLFIM0500Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	PreparedStatement ps1 = null;
	
	StringBuffer sql = new StringBuffer();
	StringBuffer sql1 = new StringBuffer();
	
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2=df.formatdate(dt2);
	
log.info("ReporefSeq/////////////////////////////////////**************************"+request.getParameter("ReporefSeq"));
	try {
	
	
		
		//sql.append("SELECT RPT_DAY,to_char(RPT_DATE,'DD-MM-YYYY')RPT_DATE,REC_CODE,DEPOSIT_AMT_IN_MUR,DEPOSIT_DENOM_IN_EUR,DEPOSIT_DENOM_IN_GBP,DEPOSIT_DENOM_IN_USD,USD_EQUIV_OTH_FCY_DEPOSIT,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME  FROM   CRR0500_MAST_TABLE where REC_CODE='AB' and REC_CODE="" and  RCRE_TIME not in (Select RCRE_TIME from FIM0300_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq+"')	UNION 	SELECT RPT_DATE,RPT_DAY,REC_CODE,DEPOSIT_AMT_IN_MUR,DEPOSIT_DENOM_IN_EUR,DEPOSIT_DENOM_IN_GBP,DEPOSIT_DENOM_IN_USD,USD_EQUIV_OTH_FCY_DEPOSIT,DEL_FLG,RCRE_USER_ID,RCRE_TIME,LCHG_USER_ID,LCHG_TIME FROM CRR0500_MOD_TABLE WHERE REPORT_REF_NO='"+ReporefSeq+"' ORDER BY SRL_NO ASC ") ;
		
		
		sql.append("SELECT DYNAMIC_DOMAIN,to_char(REP_DATE,'DD-MM-YYYY')REP_DATE,INSTITUTE_ID,TRAN_ID,INSTITUTE_NAME,TRAN_NATURE,INSTITUTE_CODE,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,to_char(INT_START_DATE,'DD-MM-YYYY')INT_START_DATE,to_char(INT_END_DATE,'DD-MM-YYYY')INT_END_DATE,INT_RATE,DEL_FLG,RCRE_USER_ID,RCRE_TIME,LCHG_USER_ID,LCHG_TIME FROM FIM0500_MAST_TABLE Where  REP_DATE >='"+dt1+"' and REP_DATE <= '"+dt2+"'");
		
		
	log.info("DOC&&&&SELECT"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		log.info("whileee--->RS");
		XBRLFIM0500Bean xb=new XBRLFIM0500Bean();
		
		
		xb.setDyndomain(NullCheck.isNotNull(rs.getString("DYNAMIC_DOMAIN")));
		xb.setRptdate(NullCheck.isNotNull(rs.getString("REP_DATE")));
		xb.setInstitid(NullCheck.isNotNull(rs.getString("INSTITUTE_ID")));
		xb.setTranid(NullCheck.isNotNull(rs.getString("TRAN_ID")));
		xb.setInstitname(NullCheck.isNotNull(rs.getString("INSTITUTE_NAME")));
		xb.setTrannature(NullCheck.isNotNull(rs.getString("TRAN_NATURE")));
		xb.setInstitcode(NullCheck.isNotNull(rs.getString("INSTITUTE_CODE")));
		xb.setTrancrcny(NullCheck.isNotNull(rs.getString("TRAN_CRNCY")));
		xb.setTrantype(NullCheck.isNotNull(rs.getString("TRAN_TYPE")));
		xb.setTranamt(NullCheck.isNotNull(rs.getString("TRAN_AMT")));
		xb.setIntstadate(NullCheck.isNotNull(rs.getString("INT_START_DATE")));
		xb.setIntenddate(NullCheck.isNotNull(rs.getString("INT_END_DATE")));
		xb.setIntrate(NullCheck.isNotNull(rs.getString("INT_RATE")));
		//xb.setDelflg(NullCheck.isNotNull(rs.getString("DEL_FLG")));
		xb.setRcrusrid(NullCheck.isNotNull(rs.getString("RCRE_USER_ID")));
		xb.setRcrtime(NullCheck.isNotNull(rs.getString("RCRE_TIME")));
		xb.setLchgusrid(NullCheck.isNotNull(rs.getString("LCHG_USER_ID")));
		xb.setLchgtime(NullCheck.isNotNull(rs.getString("LCHG_TIME")));
		
		
		
		 arl.add(xb);
	}
	}catch(SQLException e){
		e.printStackTrace();
	}
		
	
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
			}*/
public ArrayList<XBRLFIM0500Bean> xbrlfimsEP(String dt1,String dt2,String ReporefSeq,String curr,String rtime) {
	
	log.info("PYM SUMMARY List Data AB " + dt1 + "dt22222" + dt2);
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLFIM0500Bean> arl = new ArrayList<XBRLFIM0500Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	sql.setLength(0);
	
	DateFormat df=new DateFormat();		
	/*dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);*/
	
	 DecimalFormat dfs = new DecimalFormat("##,##.00");  
	NullCheck chk=new NullCheck();
	log.info("Gnana" + ReporefSeq.trim());
	sql.append("SELECT /* +FIRST_ROWS(500) */VERSION_NO,T09_30_AM,T12_30_PM,T04_30_PM FROM TABLE(FIM0500_S1_RPT_FUN('FIM0500','"+chk.notZero(ReporefSeq.trim())+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"','"+rtime+"'))");
	try {
	
		
		
                                                                                                                                                                                                                                                                             
		//sql.append("SELECT /* +FIRST_ROWS(500) */ INT_RATE,TRAN_NATURE,INSTITUTION_NAME,INSTITUTE_CODE,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,to_char(START_DATE,'DD-MM-YYYY')START_DATE,to_char(END_DATE,'DD-MM-YYYY')END_DATE FROM TABLE(FIM0500_DTL_FUN('FIM0500','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");

		/*xbrl_report_master_tb*/
		
		log.info("FIM SUMMARY "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
		
			XBRLFIM0500Bean xb=new XBRLFIM0500Bean();
			
		
	xb.setVerno(NullCheck.isNotNull(rs.getString("VERSION_NO")));
	xb.setT930(NullCheck.isNotNull(rs.getString("T09_30_AM")));
	xb.setT1230(NullCheck.isNotNull(rs.getString("T12_30_PM")));
	xb.setT430(NullCheck.isNotNull(rs.getString("T04_30_PM")));
	
		
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

public ArrayList<XBRLFIM0500Bean> xbrlfimsumEP(String dt1,String dt2,String ReporefSeq,String curr,String rtime) {
	
	log.info("PYM SUMMARY List Data AB " + dt1 + "dt22222" + dt2);
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLFIM0500Bean> arl = new ArrayList<XBRLFIM0500Bean>();
	
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
	
		
		log.info("Gnana" + ReporefSeq.trim());
		
		sql.setLength(0);
		
			sql.append("SELECT /* +FIRST_ROWS(500) */DYNAMIC_DOMAIN ,TRAN_ID,TRAN_TYPE,FCY_CRNCY,to_char(TRAN_AMT, '9,999,999,999,990.99')TRAN_AMT,INSTITUTE_ID,INSTITUTE_NAME,SECTOR,SPOT_RATE,FWD_RATE,to_char(TRAN_AMT_LCY, '9,999,999,999,990.99')TRAN_AMT_LCY,to_char(FWD_DATE,'DD-MM-YYYY')FWD_DATE FROM TABLE(FIM0500_S2_RPT_FUN('FIM0500','"+chk.notZero(ReporefSeq.trim())+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"','"+rtime+"'))");
		
		
		
		                                                                                                                                                                                                                                                                               
		//sql.append("SELECT /* +FIRST_ROWS(500) */ INT_RATE,TRAN_NATURE,INSTITUTION_NAME,INSTITUTE_CODE,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,to_char(START_DATE,'DD-MM-YYYY')START_DATE,to_char(END_DATE,'DD-MM-YYYY')END_DATE FROM TABLE(FIM0500_DTL_FUN('FIM0500','"+chk.notZero(reprefno)+"','"+chk.notZero(instno)+"','"+dt2+"','"+dt1+"','"+dt2+"','"+curr+"'))");

		/*xbrl_report_master_tb*/
		
		log.info("FIM SUMMARY "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
		
			XBRLFIM0500Bean xb=new XBRLFIM0500Bean();
			
		
	xb.setDynamicdomain(NullCheck.isNotNull(rs.getString("DYNAMIC_DOMAIN")));
	xb.setTransactionno(NullCheck.isNotNull(rs.getString("TRAN_ID")));
	xb.setTransactiontype(NullCheck.isNotNull(rs.getString("TRAN_TYPE")));
	xb.setFcy(NullCheck.isNotNull(rs.getString("FCY_CRNCY")));
	xb.setAmount(NullCheck.isNotNull(rs.getString("TRAN_AMT")));

			xb.setCounterpartyuniqueidentifier(NullCheck.isNotNull(rs.getString("INSTITUTE_ID")));
			xb.setCounterpartyname(NullCheck.isNotNull(rs.getString("INSTITUTE_NAME")));			
			xb.setSector(NullCheck.isNotNull(rs.getString("SECTOR")));
			
			xb.setSpotrate(NullCheck.isNotNull(rs.getString("SPOT_RATE")));			
			xb.setFwdrate(NullCheck.isNotNull(rs.getString("FWD_RATE")));			
			xb.setMuramt(NullCheck.isNotNull(rs.getString("TRAN_AMT_LCY")));			
			xb.setFwddate(NullCheck.isNotNull(rs.getString("FWD_DATE")));			
		
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

public ArrayList<XBRLFIM0500Bean> xbrlfimajaxdetails(String repname,String reprefno,String instno,String dt2,String dt1,String curr,String rtime) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("repname    " + repname + "reprefno   " + reprefno + "instno   " + instno + "dt2     " + dt2 +  "dt1    " + dt1);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLFIM0500Bean> arl = new ArrayList<XBRLFIM0500Bean>();
		NullCheck chk=new NullCheck();
		String status = "";
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		
		PreparedStatement ps = null;
		
		StringBuffer sql = new StringBuffer();
		
		
		DateFormat df=new DateFormat();		
		dt1 =df.formatdate(dt1);
		dt2 =df.formatdate(dt2);
		
		 DecimalFormat dfs = new DecimalFormat("##,##.00");  
		
	
		try {
		
			
			log.info("AJAX DETAILS GNANA" + reprefno );
			
		
			sql.append("SELECT /* +FIRST_ROWS(500) */TRAN_TYPE,FCY_CRNCY,to_char(TRAN_AMT, '9,999,999,999,990.99')TRAN_AMT,INSTITUTE_ID,INSTITUTE_NAME,SECTOR,SPOT_RATE,FWD_RATE,to_char(FWD_DATE,'DD-MM-YYYY')FWD_DATE FROM TABLE(FIM0500_S2_DTL_FUN('FIM0500','"+chk.notZero(reprefno.trim())+"','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"','"+rtime+"'))");
			
			log.info("PYM Vinoth Kumar  "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				XBRLFIM0500Bean xb=new XBRLFIM0500Bean();
	
				
				xb.setTransactiontype(NullCheck.isNotNull(rs.getString("TRAN_TYPE")));
				xb.setFcy(NullCheck.isNotNull(rs.getString("FCY_CRNCY")));
				xb.setAmount(NullCheck.isNotNull(rs.getString("TRAN_AMT")));

						xb.setCounterpartyuniqueidentifier(NullCheck.isNotNull(rs.getString("INSTITUTE_ID")));
						xb.setCounterpartyname(NullCheck.isNotNull(rs.getString("INSTITUTE_NAME")));			
						xb.setSector(NullCheck.isNotNull(rs.getString("SECTOR")));
						
						xb.setSpotrate(NullCheck.isNotNull(rs.getString("SPOT_RATE")));			
						xb.setFwdrate(NullCheck.isNotNull(rs.getString("FWD_RATE")));			
						xb.setFwddate(NullCheck.isNotNull(rs.getString("FWD_DATE")));			
					
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
public ArrayList<XBRLFIM0500Bean> xbrlfim5RR(String repname,String reprefno,String instno,String dt2,String dt1,String curr,String rtime) {
		
	
	log.info("+++++++++++++++==================================++++++++++++++++++++++++");
			
			
log.info("repname    " + repname + "reprefno   " + reprefno + "instno   " + instno + "dt2     " + dt2 +  "dt1    " + dt1);


		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLFIM0500Bean> arl = new ArrayList<XBRLFIM0500Bean>();
		NullCheck chk=new NullCheck();
		String status = "";
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		
		PreparedStatement ps = null;
		
		StringBuffer sql = new StringBuffer();
		
		
		DateFormat df=new DateFormat();		
		dt1 =df.formatdate(dt1);
		dt2 =df.formatdate(dt2);
		
		 DecimalFormat dfs = new DecimalFormat("##,##.00");  
		
	
		try {
		
			
			log.info("AJAX DETAILS GNANA" + reprefno );
			
		
			sql.append("SELECT /* +FIRST_ROWS(500) */TRAN_TYPE,FCY_CRNCY,to_char(TRAN_AMT, '9,999,999,999,990.99')TRAN_AMT,INSTITUTE_ID,INSTITUTE_NAME,SECTOR,SPOT_RATE,FWD_RATE,to_char(FWD_DATE,'DD-MM-YYYY')FWD_DATE FROM TABLE(FIM0500_S2_DTL_FUN('FIM0500','"+chk.notZero(reprefno.trim())+"','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"','"+rtime+"'))");
			
			log.info("PYM Vinoth Kumar  "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				XBRLFIM0500Bean xb=new XBRLFIM0500Bean();
	
				
				xb.setTransactiontype(NullCheck.isNotNull(rs.getString("TRAN_TYPE")));
				xb.setFcy(NullCheck.isNotNull(rs.getString("FCY_CRNCY")));
				xb.setAmount(NullCheck.isNotNull(rs.getString("TRAN_AMT")));

						xb.setCounterpartyuniqueidentifier(NullCheck.isNotNull(rs.getString("INSTITUTE_ID")));
						xb.setCounterpartyname(NullCheck.isNotNull(rs.getString("INSTITUTE_NAME")));			
						xb.setSector(NullCheck.isNotNull(rs.getString("SECTOR")));
						
						xb.setSpotrate(NullCheck.isNotNull(rs.getString("SPOT_RATE")));			
						xb.setFwdrate(NullCheck.isNotNull(rs.getString("FWD_RATE")));			
						xb.setFwddate(NullCheck.isNotNull(rs.getString("FWD_DATE")));			
					
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


}


