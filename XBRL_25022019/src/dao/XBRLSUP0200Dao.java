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

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import basecode.DateFormat;
import bean.XBRLSUP0200Bean;
import bean.XBRLPYM0100Bean;
import bean.XBRLReportMasterBean;
import bean.XBRLSUP0200Bean;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRLSUP0200Dao {
	
	static Logger log = Logger.getLogger(XBRLSUP0200Dao.class);
	
	
	public String Reporef;
	
	
	
	
	

		
		
	public String getReporef() {
		return Reporef;
	}

	public void setReporef(String reporef) {
		Reporef = reporef;
	}
	public ArrayList<XBRLSUP0200Dao> ReporefSeq(String dt1, String dt2) {

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

		ArrayList<XBRLSUP0200Dao> arl = new ArrayList<XBRLSUP0200Dao>();
		sql.append("select REPORT_REF_NO from ( select REPORT_REF_NO from SUP0200_S1_MOD_TABLE where REPORT_DATE BETWEEN '"+dt1+"' AND '"+dt2+"') union all ( select REPORT_REF_NO from SUP0200_S2_MOD_TABLE where REPORT_DATE BETWEEN '"+dt1+"' AND '"+dt2+"' )");

		log.info("SELECTPROFILE" + sql.toString());

		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLSUP0200Dao xel = new XBRLSUP0200Dao();
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

	
	public ArrayList<String> xbrlsup100(String dt2,String curr) {
		
		
		ArrayList<String> arl = new ArrayList<String>();

		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();
		DateFormat df=new DateFormat();		
		dt2 =df.formatdate(dt2);
		
		sql.append("select * from SUP0200_S1_MAST_TABLE where REPORT_DATE='"+dt2+"' ");

	
		try {
		
			
			
			log.info(sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				arl.add(NullCheck.isNotNull(rs.getString("TOT_NO_OF_BRNCH")));					
				arl.add(NullCheck.isNotNull(rs.getString("NO_OF_BRNCH_MUR")));					
				arl.add(NullCheck.isNotNull(rs.getString("NO_OF_BRNCH_OPN_MUR")));					
				arl.add(NullCheck.isNotNull(rs.getString("NO_OF_BRNCH_CLS_MUR")));					
				arl.add(NullCheck.isNotNull(rs.getString("NO_OF_BRNCH_URB_MUR")));					
				arl.add(NullCheck.isNotNull(rs.getString("NO_OF_BRNCH_RUR_MUR")));					
				arl.add(NullCheck.isNotNull(rs.getString("NO_OF_BRNCH_OUT")));					
				arl.add(NullCheck.isNotNull(rs.getString("NO_OF_BRNCH_OPN_OUT")));					
				arl.add(NullCheck.isNotNull(rs.getString("NO_OF_BRNCH_CLS_OUT")));					
				arl.add(NullCheck.isNotNull(rs.getString("TOT_NO_OF_CNT")));					
				arl.add(NullCheck.isNotNull(rs.getString("NO_OF_CNT_MUR")));					
				arl.add(NullCheck.isNotNull(rs.getString("NO_OF_CNT_OPN_MUR")));					
				arl.add(NullCheck.isNotNull(rs.getString("NO_OF_CNT_CLS_MUR")));					
				arl.add(NullCheck.isNotNull(rs.getString("NO_OF_CNT_URB_MUR")));					
				arl.add(NullCheck.isNotNull(rs.getString("NO_OF_CNT_RUR_MUR")));					
				arl.add(NullCheck.isNotNull(rs.getString("NO_OF_CNT_OUT")));					
				arl.add(NullCheck.isNotNull(rs.getString("NO_OF_CNT_OPN_OUT")));					
				arl.add(NullCheck.isNotNull(rs.getString("NO_OF_CNT_CLS_OUT")));					
				arl.add(NullCheck.isNotNull(rs.getString("NO_OF_BNK_AGENTS")));					
				arl.add(NullCheck.isNotNull(rs.getString("TOT_NO_OF_DEP_APP_RCD")));					
				arl.add(NullCheck.isNotNull(rs.getString("NO_OF_TRANS_DEP")));					
				arl.add(NullCheck.isNotNull(rs.getString("NO_OF_SAVING_DEP")));					
				arl.add(NullCheck.isNotNull(rs.getString("NO_OF_TIME_DEP")));					
				arl.add(NullCheck.isNotNull(rs.getString("TOT_VAL_OF_DEP_RCD")));					
				arl.add(NullCheck.isNotNull(rs.getString("TOT_VAL_OF_TRANS_DEP")));					
				arl.add(NullCheck.isNotNull(rs.getString("TOT_VAL_OF_SAVING_DEP")));					
				arl.add(NullCheck.isNotNull(rs.getString("TOT_VAL_OF_TIME_DEP")));					
				arl.add(NullCheck.isNotNull(rs.getString("NO_OF_WITHDRAW")));					
				arl.add(NullCheck.isNotNull(rs.getString("VAL_OF_WITHDRAW")));					
				arl.add(NullCheck.isNotNull(rs.getString("NO_OF_LN_APP")));					
				arl.add(NullCheck.isNotNull(rs.getString("TOT_NO_REP_OUTSIDE_MUR")));					
				arl.add(NullCheck.isNotNull(rs.getString("NO_OF_MOBILE_VAN")));					
				arl.add(NullCheck.isNotNull(rs.getString("TOT_NO_OF_EMP")));					
				arl.add(NullCheck.isNotNull(rs.getString("NO_OF_EMP_MUR")));					
				arl.add(NullCheck.isNotNull(rs.getString("NO_OF_TRAINEE_MUR")));					
				arl.add(NullCheck.isNotNull(rs.getString("NO_OF_EXPATRIAT_MUR")));					
				arl.add(NullCheck.isNotNull(rs.getString("NO_OF_EMP_OUT")));					
				arl.add(NullCheck.isNotNull(rs.getString("NO_OF_MUR_NATION_OUT")));					
				arl.add(NullCheck.isNotNull(rs.getString("NO_OF_CONSULT")));					
				arl.add(NullCheck.isNotNull(rs.getString("NO_OF_EXPATRIATE_CONSULT")));					
				arl.add(NullCheck.isNotNull(rs.getString("REPORT_DATE")));					
				arl.add(NullCheck.isNotNull(rs.getString("RCRE_USER_ID")));					
				arl.add(NullCheck.isNotNull(rs.getString("RCRE_TIME")));					
				arl.add(NullCheck.isNotNull(rs.getString("LCHG_USER_ID")));					
				arl.add(NullCheck.isNotNull(rs.getString("LCHG_TIME")));					
			
			    
			    
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

public String SUP0200Formins() {
	String status="";
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	log.info(request.getParameter("bimnobrnchcls"));
	sql.append("INSERT INTO SUP0200_S1_MAST_TABLE(TOT_NO_OF_BRNCH,NO_OF_BRNCH_MUR,NO_OF_BRNCH_OPN_MUR,NO_OF_BRNCH_CLS_MUR,NO_OF_BRNCH_URB_MUR,NO_OF_BRNCH_RUR_MUR,NO_OF_BRNCH_OUT,NO_OF_BRNCH_OPN_OUT,NO_OF_BRNCH_CLS_OUT,TOT_NO_OF_CNT,NO_OF_CNT_MUR,NO_OF_CNT_OPN_MUR,NO_OF_CNT_CLS_MUR,NO_OF_CNT_URB_MUR,NO_OF_CNT_RUR_MUR,NO_OF_CNT_OUT,NO_OF_CNT_OPN_OUT,NO_OF_CNT_CLS_OUT,NO_OF_BNK_AGENTS,TOT_NO_OF_DEP_APP_RCD,NO_OF_TRANS_DEP,NO_OF_SAVING_DEP,NO_OF_TIME_DEP,TOT_VAL_OF_DEP_RCD,TOT_VAL_OF_TRANS_DEP,TOT_VAL_OF_SAVING_DEP,TOT_VAL_OF_TIME_DEP,NO_OF_WITHDRAW,VAL_OF_WITHDRAW,NO_OF_LN_APP,TOT_NO_REP_OUTSIDE_MUR,NO_OF_MOBILE_VAN,TOT_NO_OF_EMP,NO_OF_EMP_MUR,NO_OF_TRAINEE_MUR,NO_OF_EXPATRIAT_MUR,NO_OF_EMP_OUT,NO_OF_MUR_NATION_OUT,NO_OF_CONSULT,NO_OF_EXPATRIATE_CONSULT,REPORT_DATE,RCRE_USER_ID,RCRE_TIME,LCHG_USER_ID,LCHG_TIME)  VALUES('"+request.getParameter("nofbinchdof")+"','"+request.getParameter("binmts")+"','"+request.getParameter("bimnobrnchopn")+"','"+request.getParameter("bimnobrnchcls")+"','"+request.getParameter("nofbrurarea")+"','"+request.getParameter("nofbrrlarea")+"','"+request.getParameter("boutmts")+"','"+request.getParameter("bomnofbrnchopn")+"','"+request.getParameter("bomnobrnchcls")+"','"+request.getParameter("nofcntrs")+"','"+request.getParameter("cinmts")+"','"+request.getParameter("inofcntrsopn")+"','"+request.getParameter("inofcntrscls")+"','"+request.getParameter("inofcntrsinurarea")+"','"+request.getParameter("inofcntrsinrlarea")+"','"+request.getParameter("coutmts")+"','"+request.getParameter("onofcntrsopn")+"','"+request.getParameter("onofcntrscls")+"','"+request.getParameter("nofbkagent")+"','"+request.getParameter("nofdpapplcnrev")+"','"+request.getParameter("ntfbldep")+"','"+request.getParameter("nsvngdp")+"','"+request.getParameter("ntimedp")+"','"+request.getParameter("valofdp")+"','"+request.getParameter("vtfbldep")+"','"+request.getParameter("vsvngdp")+"','"+request.getParameter("vtimedp")+"','"+request.getParameter("nofwthdrwls")+"','"+request.getParameter("amtofwthdrwls")+"','"+request.getParameter("noflnapplcn")+"','"+request.getParameter("totnofrepoutmts")+"','"+request.getParameter("nofmblvansinop")+"','"+request.getParameter("nofemps")+"','"+request.getParameter("einmts")+"','"+request.getParameter("ofwhchnoftrns")+"','"+request.getParameter("nofexpts")+"','"+request.getParameter("eoutmts")+"','"+request.getParameter("ofwhchmntnal")+"','"+request.getParameter("cnsltnts")+"','"+request.getParameter("ofwhchexpcsltnts")+"','"+df.formatdate(NullCheck.isNotNull(request.getParameter("dt2")))+"','"+NullCheck.isNotNull(session.getAttribute("userName").toString())+"',SYSDATE,'"+NullCheck.isNotNull(session.getAttribute("userName").toString())+"',SYSDATE)");
	try {
		log.info(sql.toString());
		ps=conn.prepareStatement(sql.toString());
		int rs=ps.executeUpdate();
		if(rs>0) {
			status="success";
		}else {
			status="error";
		}
		
	}catch (SQLException e) {
		status="error";
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
	
	
	return status;
}

public String SUP0200Formmod() {
	String status="";
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	
	//sql.append("UPDATE  SUP0200_MAST_TABLE  SET NO_OF_ATMS='"+NullCheck.isNotNull(sbs.getNoatminopa())+"',TOT_NO_OF_CARDS='"+NullCheck.isNotNull(sbs.getNocardsa())+"' ,NO_OF_CRD_CARDS,NO_OF_DBT_CARDS,NO_OF_OTH_CARDS,TOT_NO_OF_ATM_TRAN,NO_OF_CRD_ATM_TRAN,NO_OF_DBT_ATM_TRAN,NO_OF_OTH_ATM_TRAN,TOT_VAL_OF_ATM_TRAN,VAL_OF_CRD_ATM_TRAN,VAL_OF_DBT_ATM_TRAN,VAL_OF_CASH,VAL_OF_OTH,TOT_VAL_OF_ATM_TRAN_FC,VAL_OF_CRD_ATM_TRAN_FC,VAL_OF_DBT_ATM_TRAN_FC,VAL_OF_CASH_FC,VAL_OF_OTH_FC,TOT_NO_OF_SHRD_ATM_TRAN,TOT_VAL_OF_SHRD_ATM_TRAN,VAL_OF_CRD_SHRD_ATM_TRAN,VAL_OF_DBT_SHRD_ATM_TRAN,VAL_OF_OTH_SHRD_ATM_TRAN,TOT_VAL_OF_SHRD_ATM_TRAN_FC,VAL_OF_CRD_SHRD_ATM_TRAN_FC,VAL_OF_DBT_SHRD_ATM_TRAN_FC,VAL_OF_OTH_SHRD_ATM_TRAN_FC,TOT_NO_OF_MP,TOT_NO_OF_MP_TRAN,NO_OF_CRD_MP_TRAN,NO_OF_DBT_MP_TRAN,NO_OF_OTH_MP_TRAN,TOT_VAL_OF_MP_TRAN,VAL_OF_CRD_MP_TRAN,VAL_OF_DBT_MP_TRAN,VAL_OF_OTH_MP_TRAN,TOT_NO_OF_IB_CUST,TOT_NO_OF_IB_TRAN,NO_OF_DBT_IB_TRAN,NO_OF_CRD_IB_TRAN,TOT_VAL_OF_IB_TRAN,VAL_OF_DBT_IB_TRAN,VAL_OF_CRD_IB_TRAN,NO_OF_MB_CUST,NO_OF_ACTIVE_MM_CUST,NO_OF_MP_OUTLET,NO_OF_ACTIVE_MP_OUTLET,TOT_NO_OF_MB_MP_TRAN,NO_OF_TRANSFER_TRAN,NO_OF_PAYMENT_TRAN,NO_OF_CASH_BACK_TRAN,NO_OF_CASH_WITHDRAW_TRAN,NO_OF_MM_TRAN,VALUE_OF_MB_MP_TRAN,VALUE_OF_TRANSFER_TRAN,VALUE_OF_PAYMENT_TRAN,VALUE_OF_CASH_BACK_TRAN,VALUE_OF_CASH_WITHDRAW_TRAN,VALUE_OF_MM_TRAN,TOT_OUTSTANDING_MM_ACCTS,COMPLATS,ACTION_ON_COMPLAINTS,ACTION_OF_SERVICE_BREAK,SECURITY_LAPSE,LOSS_DETAILS,LOSS_OF_CONFIDENTIAL_DATA,BREACH_IN_GUIDE,TOT_NO_OF_OTH_ELEC_MT,NO_OF_DBT_TRAN,NO_OF_CRD_TRAN,TOT_VAL_OF_OTH_ELEC_MT,VAL_OF_DBT_TRAN,VAL_OF_CRD_TRAN,REPORT_DATE");
	
	sql.append("UPDATE  SUP0200_S1_MAST_TABLE  SET TOT_NO_OF_BRNCH='"+request.getParameter("nofbinchdof")+"',NO_OF_BRNCH_MUR='"+request.getParameter("binmts")+"',NO_OF_BRNCH_OPN_MUR='"+request.getParameter("bimnobrnchopn")+"',NO_OF_BRNCH_CLS_MUR='"+request.getParameter("bimnobrnchcls")+"',NO_OF_BRNCH_URB_MUR='"+request.getParameter("nofbrurarea")+"',NO_OF_BRNCH_RUR_MUR='"+request.getParameter("nofbrrlarea")+"',NO_OF_BRNCH_OUT='"+request.getParameter("boutmts")+"',NO_OF_BRNCH_OPN_OUT='"+request.getParameter("bomnofbrnchopn")+"',NO_OF_BRNCH_CLS_OUT='"+request.getParameter("bomnobrnchcls")+"',TOT_NO_OF_CNT='"+request.getParameter("nofcntrs")+"',NO_OF_CNT_MUR='"+request.getParameter("cinmts")+"',NO_OF_CNT_OPN_MUR='"+request.getParameter("inofcntrsopn")+"',NO_OF_CNT_CLS_MUR='"+request.getParameter("inofcntrscls")+"',NO_OF_CNT_URB_MUR='"+request.getParameter("inofcntrsinurarea")+"',NO_OF_CNT_RUR_MUR='"+request.getParameter("inofcntrsinrlarea")+"',NO_OF_CNT_OUT='"+request.getParameter("coutmts")+"',NO_OF_CNT_OPN_OUT='"+request.getParameter("onofcntrsopn")+"',NO_OF_CNT_CLS_OUT='"+request.getParameter("onofcntrscls")+"',NO_OF_BNK_AGENTS='"+request.getParameter("nofbkagent")+"',TOT_NO_OF_DEP_APP_RCD='"+request.getParameter("nofdpapplcnrev")+"',NO_OF_TRANS_DEP='"+request.getParameter("ntfbldep")+"',NO_OF_SAVING_DEP='"+request.getParameter("nsvngdp")+"',NO_OF_TIME_DEP='"+request.getParameter("ntimedp")+"',TOT_VAL_OF_DEP_RCD='"+request.getParameter("valofdp")+"',TOT_VAL_OF_TRANS_DEP='"+request.getParameter("vtfbldep")+"',TOT_VAL_OF_SAVING_DEP='"+request.getParameter("vsvngdp")+"',TOT_VAL_OF_TIME_DEP='"+request.getParameter("vtimedp")+"',NO_OF_WITHDRAW='"+request.getParameter("nofwthdrwls")+"',VAL_OF_WITHDRAW='"+request.getParameter("amtofwthdrwls")+"',NO_OF_LN_APP='"+request.getParameter("noflnapplcn")+"',TOT_NO_REP_OUTSIDE_MUR='"+request.getParameter("totnofrepoutmts")+"',NO_OF_MOBILE_VAN='"+request.getParameter("nofmblvansinop")+"',TOT_NO_OF_EMP='"+request.getParameter("nofemps")+"',NO_OF_EMP_MUR='"+request.getParameter("einmts")+"',NO_OF_TRAINEE_MUR='"+request.getParameter("ofwhchnoftrns")+"',NO_OF_EXPATRIAT_MUR='"+request.getParameter("nofexpts")+"',NO_OF_EMP_OUT='"+request.getParameter("eoutmts")+"',NO_OF_MUR_NATION_OUT='"+request.getParameter("ofwhchmntnal")+"',NO_OF_CONSULT='"+request.getParameter("cnsltnts")+"',NO_OF_EXPATRIATE_CONSULT='"+request.getParameter("ofwhchexpcsltnts")+"',REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("dt2")))+"',RCRE_USER_ID='"+NullCheck.isNotNull(session.getAttribute("userName").toString())+"',RCRE_TIME=SYSDATE,LCHG_USER_ID='"+NullCheck.isNotNull(session.getAttribute("userName").toString())+"',LCHG_TIME=SYSDATE where REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("dt2")))+"'");
	
	
	try {
		log.info(sql.toString());
		ps=conn.prepareStatement(sql.toString());
		int rs=ps.executeUpdate();
		if(rs>0) {
			status="success";
		}else {
			status="error";
		}
		
	}catch (SQLException e) {
		status="error";
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
	
	
	return status;
}

public String sup0200s1Formins(ArrayList<XBRLSUP0200Bean> arl,String type) {
	String status="";
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	PreparedStatement ps = null;
	if(type.equals("modify")) {
		sup0200s1Formdel(request.getParameter("dt2"));
	}
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	
	Iterator<XBRLSUP0200Bean> it=arl.iterator();

	
	      while(it.hasNext()){
	    	  sql.setLength(0);
	    	  XBRLSUP0200Bean sbs=it.next();
	    	  
	sql.append("INSERT INTO SUP0200_S2_MAST_TABLE(REPORT_DATE,TYPE_OF_BUSINESS,NAME_ADDRESS,LOCATION,OFFICER_INCHARGE,DEL_FLG,RCRE_USER_ID,RCRE_TIME,LCHG_USER_ID,LCHG_TIME)  VALUES('"+df.formatdate(NullCheck.isNotNull(request.getParameter("dt2")))+"','"+NullCheck.isNotNull(sbs.getTypofbsns())+"','"+NullCheck.isNotNull(sbs.getNmeofadrs())+"','"+NullCheck.isNotNull(sbs.getLcn())+"','"+NullCheck.isNotNull(sbs.getNmeofchrg())+"','N','"+NullCheck.isNotNull(session.getAttribute("userName").toString())+"',SYSDATE,'"+NullCheck.isNotNull(session.getAttribute("userName").toString())+"',SYSDATE)");
	try {
		log.info(sql.toString());
		ps=conn.prepareStatement(sql.toString());
		int rs=ps.executeUpdate();
		if(rs>0) {
			status="success";
		}else {
			status="error";
		}
		
	}catch (SQLException e) {
		status="error";
		e.printStackTrace();
	} /*finally {

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
	}*/
	
	      }
	return status;
}

public String sup0200s1Formdel(String Date) {
	String status="";
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();
	sql.append("DELETE  FROM SUP0200_S2_MAST_TABLE WHERE REPORT_DATE='"+NullCheck.isNotNull(df.formatdate(Date))+"'");
	try {
		log.info(sql.toString());
		ps=conn.prepareStatement(sql.toString());
		int rs=ps.executeUpdate();
		if(rs>0) {
			status="success";
		}else {
			status="error";
		}
	}catch(SQLException e) {
		e.printStackTrace();
	}
	return status;
}


public ArrayList<XBRLSUP0200Bean> sup0200s1Formselect(String Date) {
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	ArrayList<XBRLSUP0200Bean> arr=new ArrayList<XBRLSUP0200Bean>();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();
sql.setLength(0);
sql.append("SELECT * FROM SUP0200_S2_MAST_TABLE WHERE REPORT_DATE='"+NullCheck.isNotNull(df.formatdate(Date))+"'");
try {
log.info(sql.toString());
ps=conn.prepareStatement(sql.toString());
ResultSet rs=ps.executeQuery();
while(rs.next()) {
	XBRLSUP0200Bean sbs=new XBRLSUP0200Bean();
	sbs.setTypofbsns(NullCheck.isNotNull(rs.getString("TYPE_OF_BUSINESS")));
	sbs.setNmeofadrs(NullCheck.isNotNull(rs.getString("NAME_ADDRESS")));
	sbs.setLcn(NullCheck.isNotNull(rs.getString("LOCATION")));
	sbs.setNmeofchrg(NullCheck.isNotNull(rs.getString("OFFICER_INCHARGE")));
	arr.add(sbs);
}
}catch(SQLException e) {
e.printStackTrace();
}
	return arr;
}
/*detailSUP0200saves*/


public String detailSUP0200saves() {
	
	

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
	




