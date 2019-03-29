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
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import basecode.DateFormat;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class CriteriaDao {
	static Logger log = Logger.getLogger(CriteriaDao.class);
	
public int	count;

public int	coun;

public int fun;

public int code;

public int domain;

public int kasama;

public int shin;

public int japan;

public int pym0100;

public int dcg;


public int counte;

public int start;

public int end;

public int shuzuka;

public int sup14;

public int SUP0100;


public int SUP0101;

public int SUP0200;



public int getSUP0200() {
	return SUP0200;
}


public void setSUP0200(int sUP0200) {
	SUP0200 = sUP0200;
}


public int getSUP0101() {
	return SUP0101;
}


public void setSUP0101(int sUP0101) {
	SUP0101 = sUP0101;
}


public int getSUP0100() {
	return SUP0100;
}


public void setSUP0100(int sUP0100) {
	SUP0100 = sUP0100;
}






public int PSC0102;
public int PSC0300;
public int SUP0500;
public int SUP1000;
public int sup0400;
public int psc0020;


public int bls0120;
public int bls0140;

public int getBls0120() {
	return bls0120;
}


public void setBls0120(int bls0120) {
	this.bls0120 = bls0120;
}


public int getBls0140() {
	return bls0140;
}


public void setBls0140(int bls0140) {
	this.bls0140 = bls0140;
}




public int getPsc0020() {
	return psc0020;
}


public void setPsc0020(int psc0020) {
	this.psc0020 = psc0020;
}





public int getSup0400() {
	return sup0400;
}


public void setSup0400(int sup0400) {
	this.sup0400 = sup0400;
}


public int getSUP1000() {
	return SUP1000;
}


public void setSUP1000(int sUP1000) {
	SUP1000 = sUP1000;
}




public int getSUP0500() {
	return SUP0500;
}


public void setSUP0500(int sUP0500) {
	SUP0500 = sUP0500;
}






public int getPSC0300() {
	return PSC0300;
}


public void setPSC0300(int pSC0300) {
	PSC0300 = pSC0300;
}




public int getPSC0102() {
	return PSC0102;
}


public void setPSC0102(int pSC0102) {
	PSC0102 = pSC0102;
}






	public int getCount() {
	return count;
}


public void setCount(int count) {
	this.count = count;
}


public int getCoun() {
	return coun;
}


public void setCoun(int coun) {
	this.coun = coun;
}


public int getFun() {
	return fun;
}


public void setFun(int fun) {
	this.fun = fun;
}


public int getCode() {
	return code;
}


public void setCode(int code) {
	this.code = code;
}


public int getDomain() {
	return domain;
}


public void setDomain(int domain) {
	this.domain = domain;
}


public int getKasama() {
	return kasama;
}


public void setKasama(int kasama) {
	this.kasama = kasama;
}


public int getShin() {
	return shin;
}


public void setShin(int shin) {
	this.shin = shin;
}


public int getJapan() {
	return japan;
}


public void setJapan(int japan) {
	this.japan = japan;
}


public int getPym0100() {
	return pym0100;
}


public void setPym0100(int pym0100) {
	this.pym0100 = pym0100;
}


public int getDcg() {
	return dcg;
}


public void setDcg(int dcg) {
	this.dcg = dcg;
}


public int getCounte() {
	return counte;
}


public void setCounte(int counte) {
	this.counte = counte;
}


public int getStart() {
	return start;
}


public void setStart(int start) {
	this.start = start;
}


public int getEnd() {
	return end;
}


public void setEnd(int end) {
	this.end = end;
}


public int getShuzuka() {
	return shuzuka;
}


public void setShuzuka(int shuzuka) {
	this.shuzuka = shuzuka;
}


public int getSup14() {
	return sup14;
}


public void setSup14(int sup14) {
	this.sup14 = sup14;
}


	
	
	

	
public String FIM0100criteriaCheck(){
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	
	DateFormat df=new DateFormat();		
	
	
	
	sql.append("select count(REPORT_DATE) as userfun from FIM0100_MAST_TABLE where REPORT_DATE = '"+df.formatdate(request.getParameter("dt1"))+"' ORDER BY REPORT_DATE ASC ");
	
	log.info("SELECTPROFILE"+sql.toString());
	
	try {
		ps=conn.prepareStatement(sql.toString());
		
	   
	     

	    ResultSet rs = ps.executeQuery();
		if (rs.next()) {						
			fun = rs.getInt("userfun"); 
		
			log.info("FUNnnn------====="+fun);
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
	return "success";
}
public String FIM0200criteriaCheck(){
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	
	DateFormat df=new DateFormat();
	
	sql.append("select count(REPORT_DATE) as funuser from FIM0200_MAST_TABLE where REPORT_DATE = '"+df.formatdate(request.getParameter("dt1"))+"' ORDER BY REPORT_DATE ASC ");
	
	log.info("SELECTPROFILE"+sql.toString());
	
	try {
		ps=conn.prepareStatement(sql.toString());
		
	   
	     

	    ResultSet rs = ps.executeQuery();
		if (rs.next()) {						
			code = rs.getInt("funuser"); 
		
			
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
	return "success";
}









public String BOP0300criteriaCheck(){
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	
	DateFormat df=new DateFormat();
	
	
	
	
	sql.append("SELECT COUNT(*) AS A FROM TABLE(BOP0300_DTL_FUN('BOP0300','0','0','"+df.formatdate(request.getParameter("dt2"))+"','"+df.formatdate(request.getParameter("dt1"))+"','"+df.formatdate(request.getParameter("dt2"))+"','"+request.getParameter("curr")+"'))");
	
	//sql.append("select count(RPT_START_DATE) as a,count(RPT_END_DATE) as b FROM BOP300XBRLREPORT WHERE RPT_START_DATE = '"+df.formatdate(request.getParameter("dt1"))+"' and RPT_END_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ORDER BY RPT_START_DATE ASC ");
	
	log.info("SELECTPROFILE BOP0300criteriaCheck"+sql.toString());
	
	try {
		ps=conn.prepareStatement(sql.toString());
		
	   
	     

	    ResultSet rs = ps.executeQuery();
		if (rs.next()) {						
			start = rs.getInt("a"); 
			//end = rs.getInt("b");
			
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
	return "success";
}






public String PYM0100criteriaCheck(){
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	
	DateFormat df=new DateFormat();
	
	log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt1"));
	
	log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt2"));
	
	sql.append("select count(TRAN_DATE) as dom from PYM0100_MAST_TABLE where TRAN_DATE BETWEEN '"+df.formatdate(request.getParameter("dt1"))+"' and '"+df.formatdate(request.getParameter("dt2"))+"'    ORDER BY TRAN_DATE ASC ");
	
	log.info("SELECTPROFILE"+ sql.toString());
	
	try {
		ps=conn.prepareStatement(sql.toString());
		
	   
		
		

	    ResultSet rs = ps.executeQuery();
		if (rs.next()) {						
			pym0100 = rs.getInt("dom"); 
			/*counte=rs.getInt("dom");*/
		
	}
		
		log.info("domaaaaa"+pym0100);
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
	return "success";
}
















public int PSC0500;


public int getPSC0500() {
	return PSC0500;
}


public void setPSC0500(int pSC0500) {
	PSC0500 = pSC0500;
}

public String PSC0500criteriaCheck(){
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	
	DateFormat df=new DateFormat();
	
	log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt1"));
	
	log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt2"));
	
	sql.append("select count(REPORT_DATE) as dom from PSC0500_MAST_TABLE where REPORT_DATE BETWEEN '"+df.formatdate(request.getParameter("dt1"))+"' and '"+df.formatdate(request.getParameter("dt2"))+"'    ORDER BY REPORT_DATE ASC ");
	
	log.info("SELECTPROFILE"+ sql.toString());
	
	try {
		ps=conn.prepareStatement(sql.toString());
		
	   
	     

	    ResultSet rs = ps.executeQuery();
		if (rs.next()) {						
			PSC0500 = rs.getInt("dom"); 
		
			
	}
		log.info("domaaaaa"+PSC0500);
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
	return "success";
}






public int psc0501;


public int getPsc0501() {
	return psc0501;
}


public void setPsc0501(int psc0501) {
	this.psc0501 = psc0501;
}



public String PSC0501criteriaCheck(){
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	
	DateFormat df=new DateFormat();
	
	log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt1"));
	
	log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt2"));
	
	sql.append("select count(REPORT_DATE) as dom from PSC0501_MAST_TABLE where REPORT_DATE BETWEEN '"+df.formatdate(request.getParameter("dt1"))+"' and '"+df.formatdate(request.getParameter("dt2"))+"'    ORDER BY REPORT_DATE ASC ");
	
	log.info("SELECTPROFILE"+ sql.toString());
	
	try {
		ps=conn.prepareStatement(sql.toString());
		
	   
	     

	    ResultSet rs = ps.executeQuery();
		if (rs.next()) {						
			psc0501 = rs.getInt("dom"); 
		
			
	}
		log.info("domaaaaa"+domain);
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
	return "success";
}






public String FIM0800criteriaCheck(){
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	
	DateFormat df=new DateFormat();
	
	sql.append("select count(TRADE_DATE) as shinchan from FIM0800_MAST_TABLE where TRADE_DATE = '"+df.formatdate(request.getParameter("dt1"))+"' ORDER BY TRADE_DATE ASC ");
	
	log.info("SELECTPROFILE"+sql.toString());
	
	try {
		ps=conn.prepareStatement(sql.toString());
		
	   
	     

	    ResultSet rs = ps.executeQuery();
		if (rs.next()) {						
			fun = rs.getInt("shinchan"); 
		
			
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
	return "success";
}



public int bls0106;



	public int getBls0106() {
	return bls0106;
}


public void setBls0106(int bls0106) {
	this.bls0106 = bls0106;
}





public String BLS0106criteriaCheck(){
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	
	DateFormat df=new DateFormat();
	
	//log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt1"));
	
	log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt2"));
	
	//sql.append("select count(REPORT_DATE) AS REPDATE FROM BLS0106_MAST_TABLE WHERE REPORT_DATE = '"+df.formatdate(request.getParameter("dt1"))+"' || '"+df.formatdate(request.getParameter("dt2"))+"'    ORDER BY REPORT_DATE ASC ");
	sql.append("select count(REPORT_DATE) AS repdate FROM BLS0106_MAST_TABLE WHERE REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"'    ORDER BY REPORT_DATE ASC ");
	
	log.info("SELECTPROFILE"+ sql.toString());
	
	try {
		ps=conn.prepareStatement(sql.toString());
		   
	    
	    ResultSet rs = ps.executeQuery();
		if (rs.next()) {						
			bls0106 = rs.getInt("repdate"); 
				
	}
		log.info("domaaaaa"+bls0106);
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
	return "success";
}












public String FIM0300criteriaCheck(){
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	
	DateFormat df=new DateFormat();
	
	/*log.info("date isssssssss"+df.formatdate(request.getParameter("dt2")));*/
	
	sql.append("select count(REPORT_DATE) as counter from FIM0300_MAST_TABLE where REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ORDER BY REPORT_DATE ASC ");
	
	log.info("SELECTPROFILE"+sql.toString());
	
	try {
		ps=conn.prepareStatement(sql.toString());
		
	   
	     

	    ResultSet rs = ps.executeQuery();
		if (rs.next()) {						
			coun = rs.getInt("counter"); 
		/*log.info("count issssssssssssssssssssss"+coun);*/
			
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
	return "success";
}


public int fim0900;



	public int getFim0900() {
	return fim0900;
}


public void setFim0900(int fim0900) {
	this.fim0900 = fim0900;
}









/*********************     start of fim0900criteria   ********************/

public String FIM0900criteriaCheck(){
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	
	DateFormat df=new DateFormat();
	
	//log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt1"));
	
	log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt2"));
	
	//sql.append("select count(REPORT_DATE) AS REPDATE FROM BLS0106_MAST_TABLE WHERE REPORT_DATE = '"+df.formatdate(request.getParameter("dt1"))+"' || '"+df.formatdate(request.getParameter("dt2"))+"'    ORDER BY REPORT_DATE ASC ");
	sql.append("select count(REPORT_DATE) AS repdate FROM FIM0900_MAST_TABLE WHERE REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"'    ORDER BY REPORT_DATE ASC ");
	
	log.info("SELECTPROFILE"+ sql.toString());
	
	try {
		ps=conn.prepareStatement(sql.toString());
		   
	    
	    ResultSet rs = ps.executeQuery();
		if (rs.next()) {						
			fim0900 = rs.getInt("repdate"); 
				
	}
		log.info("domaaaaa"+fim0900);
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
	return "success";
}





/*********************     end of fim0900criteria   ********************/
public String FIM1000criteriaCheck(){
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	
	DateFormat df=new DateFormat();
	
	
	sql.append("select count(REPORT_DATE) as maldives from FIM1000_MAST_TABLE where REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ORDER BY REPORT_DATE ASC ");
	
	log.info("SELECTPROFILE"+sql.toString());
	
	try {
		ps=conn.prepareStatement(sql.toString());
		
	   
	     

	    ResultSet rs = ps.executeQuery();
		if (rs.next()) {						
			kasama = rs.getInt("maldives"); 
		
			
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
	return "success";
}

public String BLS0700criteriaCheck(){
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	
	DateFormat df=new DateFormat();
	
	
	
	
	
	sql.append("select count(REPORT_DATE) AS a FROM BLS0700_MAST_TABLE WHERE REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"'    ORDER BY REPORT_DATE ASC ");
	
	log.info("SELECTPROFILE BLS0700criteriaCheck"+sql.toString());
	
	try {
		ps=conn.prepareStatement(sql.toString());
		
	   
	     

	    ResultSet rs = ps.executeQuery();
		if (rs.next()) {						
			start = rs.getInt("a"); 
			//end = rs.getInt("b");
			
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
	return "success";
}

public String SUP1300criteriaCheck(){
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	
	DateFormat df=new DateFormat();		
	
	
	
	sql.append("select count(REPORT_DATE) as sup1 from SUP1300_MAST_TABLE where REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ORDER BY REPORT_DATE ASC ");
	
	log.info("SELECTPROFILE"+sql.toString());
	
	try {
		ps=conn.prepareStatement(sql.toString());
		 
	    
	    ResultSet rs = ps.executeQuery();
		if (rs.next()) {						
			sup14 = rs.getInt("sup1"); 
		
			log.info("FUNnnn------====="+sup14);
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
	return "success";
}

public int sup1100;



public int getSup1100() {
	return sup1100;
}



public void setSup1100(int sup1100) {
	this.sup1100 = sup1100;
}


public int sup1500;



public int getSup1500() {
	return sup1500;
}



public void setSup1500(int sup1500) {
	this.sup1500 = sup1500;
}










/*********************     start of sup1100criteria   ********************/

public String SUP1100criteriaCheck(){
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	
	DateFormat df=new DateFormat();
	
	//log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt1"));
	
	log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt2"));
	
	//sql.append("select count(REPORT_DATE) AS REPDATE FROM BLS0106_MAST_TABLE WHERE REPORT_DATE = '"+df.formatdate(request.getParameter("dt1"))+"' || '"+df.formatdate(request.getParameter("dt2"))+"'    ORDER BY REPORT_DATE ASC ");
	sql.append("select count(REPORT_DATE) AS repdate FROM SUP1100_MAST_TABLE WHERE REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"'    ORDER BY REPORT_DATE ASC ");
	
	log.info("SELECTPROFILE"+ sql.toString());
	
	try {
		ps=conn.prepareStatement(sql.toString());
		   
	    
	    ResultSet rs = ps.executeQuery();
		if (rs.next()) {						
			sup1100 = rs.getInt("repdate"); 
				
	}
		log.info("domaaaaa"+sup1100);
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
	return "success";
}





/*********************     end of sup1100criteria   ********************/



/*********************     start of sup1500criteria   ********************/

public String SUP1500criteriaCheck(){
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	
	DateFormat df=new DateFormat();
	
	//log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt1"));
	
	log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt2"));
	
	//sql.append("select count(REPORT_DATE) AS REPDATE FROM BLS0106_MAST_TABLE WHERE REPORT_DATE = '"+df.formatdate(request.getParameter("dt1"))+"' || '"+df.formatdate(request.getParameter("dt2"))+"'    ORDER BY REPORT_DATE ASC ");
	sql.append("select count(REPORT_DATE) AS repdate FROM SUP1500_MAST_TABLE WHERE REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"'    ORDER BY REPORT_DATE ASC ");
	
	log.info("SELECTPROFILE"+ sql.toString());
	
	try {
		ps=conn.prepareStatement(sql.toString());
		   
	    
	    ResultSet rs = ps.executeQuery();
		if (rs.next()) {						
			sup1500 = rs.getInt("repdate"); 
				
	}
		log.info("domaaaaa"+sup1500);
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
	return "success";
}





/*********************     end of sup1500criteria   ********************/



public int  fim0400;



	public int getFim0400() {
	return fim0400;
}



public void setFim0400(int fim0400) {
	this.fim0400 = fim0400;
}






public String FIM0400criteriaCheck(){
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	
	DateFormat df=new DateFormat();
	
	sql.append("SELECT COUNT(REPORT_DATE) as repdate FROM FIM0400_MAST_TABLE where REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ORDER BY REPORT_DATE ASC ");
	
	log.info("SELECTPROFILE"+sql.toString());
	
	try {
		ps=conn.prepareStatement(sql.toString());
		
	   
	     

	    ResultSet rs = ps.executeQuery();
		if (rs.next()) {						
			fim0400 = rs.getInt("repdate"); 
		
			
	}
		log.info("domaaaaa"+fim0400);
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
	return "success";
}


public String SUP0100criteriaCheck(){
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	
	DateFormat df=new DateFormat();
	
	sql.append("select count(REPORT_DATE) as kcg from SUP0100_MAST_TABLE where REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ORDER BY REPORT_DATE ASC ");
	
	log.info("SELECTPROFILE"+sql.toString());
	
	try {
		ps=conn.prepareStatement(sql.toString());
		
	   
	     

	    ResultSet rs = ps.executeQuery();
		if (rs.next()) {						
			SUP0100 = rs.getInt("kcg"); 
		
			
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
	return "success";
}



public String SUP0101criteriaCheck(){
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	
	DateFormat df=new DateFormat();
	
	sql.append("select count(REPORT_DATE) as kcg from SUP0101_MAST_TABLE where REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ORDER BY REPORT_DATE ASC ");
	
	log.info("SELECTPROFILE"+sql.toString());
	
	try {
		ps=conn.prepareStatement(sql.toString());
		
	   
	     

	    ResultSet rs = ps.executeQuery();
		if (rs.next()) {						
			SUP0101 = rs.getInt("kcg"); 
		
			
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
	return "success";
}



public String PSC0102criteriaCheck(){
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	
	DateFormat df=new DateFormat();
	
	log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt1"));
	
	log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt2"));
	
	sql.append("select count(REPORT_DATE) as dom from PSC0102_MAST_TABLE where REPORT_DATE BETWEEN '"+df.formatdate(request.getParameter("dt1"))+"' and '"+df.formatdate(request.getParameter("dt2"))+"'    ORDER BY REPORT_DATE ASC ");
	
	log.info("SELECTPROFILE"+ sql.toString());
	
	try {
		ps=conn.prepareStatement(sql.toString());
		
	   
	     

	    ResultSet rs = ps.executeQuery();
		if (rs.next()) {						
			PSC0102 = rs.getInt("dom"); 
		
			
	}
		log.info("domaaaaa"+PSC0102);
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
	return "success";
}






public int sup0900;





public int getSup0900() {
	return sup0900;
}


public void setSup0900(int sup0900) {
	this.sup0900 = sup0900;
}


public String SUP0900criteriaCheck(){

HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

String status = "";

ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();
PreparedStatement ps = null;
StringBuffer sql = new StringBuffer();

DateFormat df=new DateFormat();

sql.append("select count(REPORT_DATE) as sup0900 from SUP0900_MAST_TABLE where REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ORDER BY REPORT_DATE ASC ");

log.info("SELECTPROFILE"+ sql.toString());

try {
ps=conn.prepareStatement(sql.toString());

  
    

   ResultSet rs = ps.executeQuery();
if (rs.next()) {	
	sup0900 = rs.getInt("sup0900"); 


}
log.info("domaaaaa"+sup0900);
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
return "success";
}








public String SUP0500criteriaCheck(){
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	
	DateFormat df=new DateFormat();
	
	sql.append("select count(RPT_DATE) as userCount from SUP0500_MAST_TABLE where RPT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"'");
	
	log.info("SELECTPROFILE"+sql.toString());
	
	try {
		ps=conn.prepareStatement(sql.toString());
		
	   
	     

	    ResultSet rs = ps.executeQuery();
		if (rs.next()) {						
			SUP0500= rs.getInt("userCount"); 
		
			
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
	return "success";
}






public String SUP1000criteriaCheck(){
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	
	DateFormat df=new DateFormat();
	
	sql.append("select count(REPORT_DATE) as userCount from SUP1000_S1_MAST_TABLE where REPORT_DATE = '"+df.formatdate(request.getParameter("dt1"))+"'   ORDER BY REPORT_DATE ASC ");
	
	log.info("SELECTPROFILE"+sql.toString());
	
	try {
		ps=conn.prepareStatement(sql.toString());
		
	   
	     

	    ResultSet rs = ps.executeQuery();
		if (rs.next()) {						
			SUP1000= rs.getInt("userCount"); 
		
			
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
	return "success";
}

public String FIM0600criteriaCheck(){



HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

String status = "";

ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();
PreparedStatement ps = null;
StringBuffer sql = new StringBuffer();
DateFormat df=new DateFormat();


//sql.append("select count(REPORT_DATE) as port from FIM0600_S1_MAST_TABLE where REPORT_DATE = '"+df.formatdate(request.getParameter("dt2")+"' ORDER BY REPORT_DATE ASC "));
sql.append(" select (select count(REPORT_DATE)  from FIM0600_S3_MAST_TABLE where REPORT_DATE BETWEEN '"+df.formatdate(request.getParameter("dt1"))+"' and '"+df.formatdate(request.getParameter("dt2"))+"'    )+(select count(REPORT_DATE)  from FIM0600_S1_MAST_TABLE where REPORT_DATE BETWEEN '"+df.formatdate(request.getParameter("dt1"))+"' and '"+df.formatdate(request.getParameter("dt2"))+"'  )  as repdate from dual");	

log.info("SELECTPROFILE FIM0600criteriaChecksas"+sql.toString());

try {
ps=conn.prepareStatement(sql.toString());

  
    

   ResultSet rs = ps.executeQuery();
if (rs.next()) {	

shuzuka = rs.getInt("repdate"); 


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
return "success";
}
public int bop0202;




public int getBop0202() {
	return bop0202;
}


public void setBop0202(int bop0202) {
	this.bop0202 = bop0202;
}


public String BOP0202criteriaCheck(){
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	
	DateFormat df=new DateFormat();
	
	//log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt1"));
	
	log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt2"));
	
	//sql.append("select count(REPORT_DATE) AS REPDATE FROM BLS0106_MAST_TABLE WHERE REPORT_DATE = '"+df.formatdate(request.getParameter("dt1"))+"' || '"+df.formatdate(request.getParameter("dt2"))+"'    ORDER BY REPORT_DATE ASC ");
	sql.append("select count(REPORT_DATE) AS repdate FROM BOP0202_MAST_TABLE WHERE REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"'    ORDER BY REPORT_DATE ASC ");
	
	log.info("SELECTPROFILE"+ sql.toString());
	
	try {
		ps=conn.prepareStatement(sql.toString());
		   
	    
	    ResultSet rs = ps.executeQuery();
		if (rs.next()) {						
			bop0202 = rs.getInt("repdate"); 
				
	}
		log.info("domaaaaa"+bop0202);
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
	return "success";
}
public int psc0200;

public int getPsc0200() {
	return psc0200;
}


public void setPsc0200(int psc0200) {
	this.psc0200 = psc0200;
}





/*********************     start of psc0200criteria   ********************/


public String PSC0200criteriaCheck(){
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	
	DateFormat df=new DateFormat();
	
	log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt1"));
	
	log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt2"));
	
	sql.append("select count(REPORT_DATE) as repdate from PSC0200_MAST_TABLE where REPORT_DATE BETWEEN '"+df.formatdate(request.getParameter("dt1"))+"' and '"+df.formatdate(request.getParameter("dt2"))+"'    ORDER BY REPORT_DATE ASC ");
	
	log.info("SELECTPROFILE"+ sql.toString());
	
	try {
		ps=conn.prepareStatement(sql.toString());
		

	    ResultSet rs = ps.executeQuery();
		if (rs.next()) {						
			psc0200 = rs.getInt("repdate"); 
		
			
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
	return "success";
}

/*********************     end of psc0200criteria   ********************/
public String PSC0300criteriaCheck(){
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	
	DateFormat df=new DateFormat();
	
	log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt1"));
	
	log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt2"));
	
	sql.append("select count(REPORT_DATE) as dom from PSC0300_MAST_TABLE where REPORT_DATE BETWEEN '"+df.formatdate(request.getParameter("dt1"))+"' and '"+df.formatdate(request.getParameter("dt2"))+"'    ORDER BY REPORT_DATE ASC ");
	
	log.info("SELECTPROFILE"+ sql.toString());
	
	try {
		ps=conn.prepareStatement(sql.toString());
		
	   
	     

	    ResultSet rs = ps.executeQuery();
		if (rs.next()) {						
			PSC0300= rs.getInt("dom"); 
		
			
	}
		log.info("domaaaaa"+PSC0300);
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
	return "success";
}

public String SUP0400criteriaCheck(){

HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

String status = "";

ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();
PreparedStatement ps = null;
StringBuffer sql = new StringBuffer();

DateFormat df=new DateFormat();

log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt1"));

log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt2"));

sql.append("select count(REPORT_DATE) as dom from SUP0400_MAST_TABLE where REPORT_DATE BETWEEN '"+df.formatdate(request.getParameter("dt1"))+"' and '"+df.formatdate(request.getParameter("dt2"))+"'    ORDER BY REPORT_DATE ASC ");

log.info("SUP0400criteria"+ sql.toString());

try {
ps=conn.prepareStatement(sql.toString());

   
     

    ResultSet rs = ps.executeQuery();
if (rs.next()) {	
sup0400 = rs.getInt("dom"); 


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
return "success";
}

public int psc0104;



public int getPsc0104() {
return psc0104;
}


public void setPsc0104(int psc0104) {
this.psc0104 = psc0104;
}









/*********************     start of psc0104criteria   ********************/


public String PSC0104criteriaCheck(){

HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

String status = "";

ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();
PreparedStatement ps = null;
StringBuffer sql = new StringBuffer();

DateFormat df=new DateFormat();

log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt1"));

log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt2"));

/*sql.append("select (select count(REPORT_DATE)  from PSC0104_S1_MAST_TABLE where REPORT_DATE BETWEEN '"+df.formatdate(request.getParameter("dt1"))+"' and '"+df.formatdate(request.getParameter("dt2"))+"' ORDER BY REPORT_DATE ASC)+(select count(REPORT_DATE)  from PSC0104_S2_MAST_TABLE where REPORT_DATE BETWEEN '"+df.formatdate(request.getParameter("dt1"))+"' and '"+df.formatdate(request.getParameter("dt2"))+"' ORDER BY REPORT_DATE ASC )+(select count(REPORT_DATE)  from PSC0104_S3_MAST_TABLE where REPORT_DATE BETWEEN '"+df.formatdate(request.getParameter("dt1"))+"' and '"+df.formatdate(request.getParameter("dt2"))+"'    ORDER BY REPORT_DATE ASC ) as repdate from dual");	
*/

sql.append(" select (select count(REPORT_DATE)  from PSC0104_S3_MAST_TABLE where REPORT_DATE BETWEEN '"+df.formatdate(request.getParameter("dt1"))+"' and '"+df.formatdate(request.getParameter("dt2"))+"'   )+(select count(REPORT_DATE)  from PSC0104_S2_MAST_TABLE where REPORT_DATE BETWEEN '"+df.formatdate(request.getParameter("dt1"))+"' and '"+df.formatdate(request.getParameter("dt2"))+"'    )+(select count(REPORT_DATE)  from PSC0104_S1_MAST_TABLE where REPORT_DATE BETWEEN '"+df.formatdate(request.getParameter("dt1"))+"' and '"+df.formatdate(request.getParameter("dt2"))+"'  )  as repdate from dual");	


log.info("SELECTPROFILE"+ sql.toString());

try {
	ps=conn.prepareStatement(sql.toString());
	

    ResultSet rs = ps.executeQuery();
	if (rs.next()) {						
		psc0104 = rs.getInt("repdate"); 
	
		
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
return "success";
}

/*********************     end of psc0104criteria   ********************/

public int PSC0105106;

/*********************     start of psc0105&106criteria   ********************/

public String PSC0105106criteriaCheck(){

HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

String status = "";

ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();
PreparedStatement ps = null;
StringBuffer sql = new StringBuffer();

DateFormat df=new DateFormat();

log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt1"));

log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt2"));

sql.append(" select (select count(REPORT_DATE)  from PSC0105_S2_MAST_TABLE where REPORT_DATE BETWEEN '"+df.formatdate(request.getParameter("dt1"))+"' and '"+df.formatdate(request.getParameter("dt2"))+"'    )+(select count(REPORT_DATE)  from PSC0105_S1_MAST_TABLE where REPORT_DATE BETWEEN '"+df.formatdate(request.getParameter("dt1"))+"' and '"+df.formatdate(request.getParameter("dt2"))+"'  )  as repdate from dual");	

log.info("SELECTPROFILE"+ sql.toString());

try {
ps=conn.prepareStatement(sql.toString());

   
     

    ResultSet rs = ps.executeQuery();
if (rs.next()) {	
	PSC0105106 = rs.getInt("repdate"); 


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
return "success";
}
public int getPSC0105106() {
	return PSC0105106;
}


public void setPSC0105106(int pSC0105106) {
	PSC0105106 = pSC0105106;
}


/*********************     end of psc0105&106criteria   ********************/

public String PSC0106criteriaCheck(){

HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

String status = "";

ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();
PreparedStatement ps = null;
StringBuffer sql = new StringBuffer();

DateFormat df=new DateFormat();

log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt1"));

log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt2"));

sql.append("select count(REPORT_DATE) as dom from PSC0105_S1_MAST_TABLE where REPORT_DATE BETWEEN '"+df.formatdate(request.getParameter("dt1"))+"' and '"+df.formatdate(request.getParameter("dt2"))+"'    ORDER BY REPORT_DATE ASC ");

log.info("SELECTPROFILE"+ sql.toString());

try {
ps=conn.prepareStatement(sql.toString());

   
     

    ResultSet rs = ps.executeQuery();
if (rs.next()) {	
	sup14 = rs.getInt("dom"); 


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
return "success";
}





public String CRR0100criteriaCheck(){
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	
	DateFormat df=new DateFormat();
	
	//sql.append("select count(RPT_DATE) as userCount from CRR0100_MAST_TABLE where RPT_DATE = '"+df.formatdate(request.getParameter("dt1"))+"' and  REC_CODE='AB'  ORDER BY RPT_DATE ASC ");
	
	sql.append("select count(REPORT_DATE) as userCount from CRR0100_MAST_TABLE where REPORT_DATE = '"+df.formatdate(request.getParameter("dt1"))+"'  ORDER BY REPORT_DATE ASC ");
	
	log.info("SELECTPROFILE"+sql.toString());
	
	try {
		ps=conn.prepareStatement(sql.toString());
		

	    ResultSet rs = ps.executeQuery();
		if (rs.next()) {						
			count = rs.getInt("userCount"); 
		
			
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
	return "success";
}



public String SUP0200criteriaCheck(){
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	
	DateFormat df=new DateFormat();
	
	log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt1"));
	
	log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt2"));
	
	sql.append("select count(REPORT_DATE) as dom from SUP0200_S1_MAST_TABLE where REPORT_DATE BETWEEN '"+df.formatdate(request.getParameter("dt1"))+"' and '"+df.formatdate(request.getParameter("dt2"))+"'    ORDER BY REPORT_DATE ASC ");
	
	log.info("SELECTPROFILE"+ sql.toString());
	
	try {
		ps=conn.prepareStatement(sql.toString());
		
	   
	     

	    ResultSet rs = ps.executeQuery();
		if (rs.next()) {						
			SUP0200 = rs.getInt("dom"); 
		
			
	}
		log.info("domaaaaa"+SUP0200);
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
	return "success";
}



public int BLS0600;




public String BLS0600criteriaCheck(){
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	
	DateFormat df=new DateFormat();
	
	log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt1"));
	
	log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt2"));
	
	sql.append("select count(REPORT_DATE) as dom from BLS0600_MAST_TABLE where REPORT_DATE  BETWEEN '"+df.formatdate(request.getParameter("dt1"))+"' and '"+df.formatdate(request.getParameter("dt2"))+"'    ORDER BY REPORT_DATE ASC ");
	
	log.info("SELECTPROFILE"+ sql.toString());
	
	try {
		ps=conn.prepareStatement(sql.toString());
		
	   
	     

	    ResultSet rs = ps.executeQuery();
		if (rs.next()) {						
			BLS0600 = rs.getInt("dom"); 
		
			
	}
		log.info("domaaaaa"+domain);
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
	
	return "success";
}






public int getBLS0600() {
	return BLS0600;
}


public void setBLS0600(int BLS0600) {
	this.BLS0600 = BLS0600;
}


public int dcg0100;




public int getDcg0100() {
	return dcg0100;
}


public void setDcg0100(int dcg0100) {
	this.dcg0100 = dcg0100;
}


public String DCG0100criteriaCheck(){
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	
	DateFormat df=new DateFormat();		
	
	
	
	sql.append("select count(REPORT_DATE) as userdcg from DCG0100_MAST_TABLE where REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ORDER BY REPORT_DATE ASC ");
	
	log.info("SELECTPROFILE"+sql.toString());
	
	try {
		ps=conn.prepareStatement(sql.toString());
		 
	    
	    ResultSet rs = ps.executeQuery();
		if (rs.next()) {						
			dcg0100 = rs.getInt("userdcg"); 
		
			log.info("FUNnnn------====="+dcg);
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
	return "success";
}










public String FIM0500criteriaCheck(){
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	
	DateFormat df=new DateFormat();
    sql.append("select count(REPORT_DATE) as dmm from FIM0500_S2_MAST_TABLE where REPORT_DATE = '"+df.formatdate(request.getParameter("dt1"))+"' ORDER BY REPORT_DATE ASC ");
	//sql.append(" select (select count(REPORT_DATE)  from FIM0500_S2_MAST_TABLE where REPORT_DATE BETWEEN '"+df.formatdate(request.getParameter("dt1"))+"' and '"+df.formatdate(request.getParameter("dt2"))+"'    )+(select count(REPORT_DATE)  from FIM0500_S1_MAST_TABLE where REPORT_DATE BETWEEN '"+df.formatdate(request.getParameter("dt1"))+"' and '"+df.formatdate(request.getParameter("dt2"))+"'  )  as dmm from dual");	

	log.info("SELECTPROFILE"+sql.toString());
	
	try {
		ps=conn.prepareStatement(sql.toString());
		
	   
	     

	    ResultSet rs = ps.executeQuery();
		if (rs.next()) {						
		kasama = rs.getInt("dmm"); 
		
			
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
	return "success";
}


public int psc0103;

public int getPsc0103() {
	return psc0103;
}


public void setPsc0103(int psc0103) {
	this.psc0103 = psc0103;
}

public String PSC0103criteriaCheck(){
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	
	DateFormat df=new DateFormat();
	
	sql.append("select count(REPORT_DATE) as userCount from PSC0103_MAST_TABLE where REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"'   ORDER BY REPORT_DATE ASC ");
	
	log.info("SELECTPROFILE"+sql.toString());
	
	try {
		ps=conn.prepareStatement(sql.toString());
		
	   
	     

	    ResultSet rs = ps.executeQuery();
		if (rs.next()) {						
			psc0103= rs.getInt("userCount"); 
		
			
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
	return "success";
}









public int sup0600;

public int getSup0600() {
	return sup0600;
}
public void setSup0600(int sup0600) {
	this.sup0600 = sup0600;
}
public String SUP0600criteriaCheck(){

HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

String status = "";

ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();
PreparedStatement ps = null;
StringBuffer sql = new StringBuffer();

DateFormat df=new DateFormat();

sql.append("select count(REPORT_DATE) as sup06 from SUP0010_MAST_TABLE where REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ORDER BY REPORT_DATE ASC ");

log.info("SELECTPROFILE"+ sql.toString());

try {
ps=conn.prepareStatement(sql.toString());

  
    

   ResultSet rs = ps.executeQuery();
if (rs.next()) {	
sup0600=rs.getInt("sup06"); 


}
log.info("domaaaaa"+sup0600);
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
return "success";
}

public int sup0601;
public int sup0603;

public int getSup0601() {
	return sup0601;
}


public void setSup0601(int sup0601) {
	this.sup0601 = sup0601;
}



public int getSup0603() {
	return sup0603;
}


public void setSup0603(int sup0603) {
	this.sup0603 = sup0603;
}




public String SUP0601criteriaCheck(){

HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

String status = "";

ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();
PreparedStatement ps = null;
StringBuffer sql = new StringBuffer();

DateFormat df=new DateFormat();

sql.append("select count(REPORT_DATE) as sup06 from SUP0010_MAST_TABLE where REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ORDER BY REPORT_DATE ASC ");

log.info("SELECTPROFILE"+ sql.toString());

try {
ps=conn.prepareStatement(sql.toString());

  
    

   ResultSet rs = ps.executeQuery();
if (rs.next()) {	
sup0601 = rs.getInt("sup06"); 


}
log.info("domaaaaa"+sup0601);
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
return "success";
}


public int SUP0602;


public int getSUP0602() {
	return SUP0602;
}


public void setSUP0602(int sUP0602) {
	SUP0602 = sUP0602;
}


public String SUP0602criteriaCheck(){

HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

String status = "";

ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();
PreparedStatement ps = null;
StringBuffer sql = new StringBuffer();

DateFormat df=new DateFormat();		



sql.append("select count(REPORT_DATE) as userfun from SUP0010_MAST_TABLE where REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ORDER BY REPORT_DATE ASC ");

log.info("SELECTPROFILE"+sql.toString());

try {
	ps=conn.prepareStatement(sql.toString());
	
   
     

    ResultSet rs = ps.executeQuery();
	if (rs.next()) {						
		fun = rs.getInt("userfun"); 
	
		log.info("FUNnnn------====="+fun);
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
return "success";
}





public String SUP0603criteriaCheck(){

HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

String status = "";

ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();
PreparedStatement ps = null;
StringBuffer sql = new StringBuffer();

DateFormat df=new DateFormat();

sql.append("select count(REPORT_DATE) as sup06 from SUP0010_MAST_TABLE where REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ORDER BY REPORT_DATE ASC ");

log.info("SELECTPROFILE"+ sql.toString());

try {
ps=conn.prepareStatement(sql.toString());

  
    

   ResultSet rs = ps.executeQuery();
if (rs.next()) {	
sup0603 = rs.getInt("sup06"); 


}
log.info("domaaaaa"+sup0603);
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
return "success";
}




public int sup0604;

public int getSup0604() {
	return sup0604;
}
public void setSup0604(int sup0604) {
	this.sup0604 = sup0604;
}
public String SUP0604criteriaCheck(){

HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

String status = "";

ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();
PreparedStatement ps = null;
StringBuffer sql = new StringBuffer();

DateFormat df=new DateFormat();

sql.append("select count(REPORT_DATE) as sup06 from SUP0010_MAST_TABLE where REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ORDER BY REPORT_DATE ASC ");

log.info("SELECTPROFILE"+ sql.toString());

try {
ps=conn.prepareStatement(sql.toString());

  
    

   ResultSet rs = ps.executeQuery();
if (rs.next()) {	
sup0604=rs.getInt("sup06"); 


}
log.info("domaaaaa"+sup0604);
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
return "success";
}

public int sup0605;

public int getSup0605() {
	return sup0605;
}


public void setSup0605(int sup0605) {
	this.sup0605 = sup0605;
}



public String SUP0605criteriaCheck(){

HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

String status = "";

ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();
PreparedStatement ps = null;
StringBuffer sql = new StringBuffer();

DateFormat df=new DateFormat();

sql.append("select count(REPORT_DATE) as sup0605 from SUP0010_MAST_TABLE where REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ORDER BY REPORT_DATE ASC ");

log.info("SELECTPROFILE"+ sql.toString());

try {
ps=conn.prepareStatement(sql.toString());

  
    

   ResultSet rs = ps.executeQuery();
if (rs.next()) {	
	sup0605 = rs.getInt("sup0605"); 


}
log.info("domaaaaa"+sup0605);
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
return "success";
}

public String SUP0606criteriaCheck(){

HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

String status = "";

ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();
PreparedStatement ps = null;
StringBuffer sql = new StringBuffer();

DateFormat df=new DateFormat();		



sql.append("select count(REPORT_DATE) as userfun from SUP0010_MAST_TABLE where REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ORDER BY REPORT_DATE ASC ");

log.info("SELECTPROFILE"+sql.toString());

try {
	ps=conn.prepareStatement(sql.toString());
	
   
     

    ResultSet rs = ps.executeQuery();
	if (rs.next()) {						
		fun = rs.getInt("userfun"); 
	
		log.info("FUNnnn------====="+fun);
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
return "success";
}

/*********************     start of BOP0100 criteria   ********************/

public int bop0100;




public int getBop0100() {
	return bop0100;
}


public void setBop0100(int bop0100) {
	this.bop0100 = bop0100;
}






public String BOP0100criteriaCheck(){

HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

String status = "";

ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();
PreparedStatement ps = null;
StringBuffer sql = new StringBuffer();

DateFormat df=new DateFormat();

log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt1"));

log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt2"));

sql.append("select count(REPORT_DATE) as repdate from BOP0100_MAST_TABLE where REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"'    ");

log.info("SELECTPROFILE"+ sql.toString());

try {
ps=conn.prepareStatement(sql.toString());


ResultSet rs = ps.executeQuery();
if (rs.next()) {	
	bop0100 = rs.getInt("repdate"); 


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
return "success";
}



/*********************     end of BOP0100 criteria   ********************/


 /* ----------------SUP1400 START----------------*/
 
public int sup1400;



public int getSup1400() {
	return sup1400;
}


public void setSup1400(int sup1400) {
	this.sup1400 = sup1400;
}


public String SUP1400criteriaCheck(){

HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

String status = "";

ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();
PreparedStatement ps = null;
StringBuffer sql = new StringBuffer();

DateFormat df=new DateFormat();

log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt1"));

log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt2"));

sql.append("select count(REPORT_DATE) as repdate from SUP1400_MAST_TABLE where REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"'    ");

log.info("SELECTPROFILE"+ sql.toString());

try {
ps=conn.prepareStatement(sql.toString());


ResultSet rs = ps.executeQuery();
if (rs.next()) {	
	sup1400 = rs.getInt("repdate"); 


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
return "success";
}


                                  /* ***********SUP1400 ENDS**************/



public int SUP1200;
public int getSUP1200() {
	return SUP1200;
}


public void setSUP1200(int sUP1200) {
	SUP1200 = sUP1200;
}

public String SUP1200criteriaCheck(){
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	
	DateFormat df=new DateFormat();
	
	//sql.append("select count(REPORT_DATE) as userCount from SUP1200_MAST_TABLE where REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' and  REC_CODE='AB'  ORDER BY REPORT_DATE ASC ");
	sql.append(" select (select count(REPORT_DATE)  from SUP1200_S4_MAST_TABLE where REPORT_DATE BETWEEN '"+df.formatdate(request.getParameter("dt1"))+"' and '"+df.formatdate(request.getParameter("dt2"))+"'    )+(select count(REPORT_DATE)  from SUP1200_S1_MAST_TABLE where REPORT_DATE BETWEEN '"+df.formatdate(request.getParameter("dt1"))+"' and '"+df.formatdate(request.getParameter("dt2"))+"'  )  as userCount from dual");	

	log.info("SELECTPROFILE"+sql.toString());
	
	try {
		ps=conn.prepareStatement(sql.toString());
		
	   
	     

	    ResultSet rs = ps.executeQuery();
		if (rs.next()) {						
			SUP1200= rs.getInt("userCount"); 
		
			
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
	return "success";
}

/*********************     start of BLS0100criteria   ********************/

public int bls0100;



public int getBls0100() {
	return bls0100;
}


public void setBls0100(int bls0100) {
	this.bls0100 = bls0100;
}


public String BLS0100criteriaCheck(){

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();

	String status = "";

	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();

	DateFormat df=new DateFormat();

	log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt1"));

	log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt2"));

	sql.append("select count(REPORT_DATE) as repdate from BLS0100_MAST_TABLE where REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"'    ");

	log.info("SELECTPROFILE"+ sql.toString());

		try {
			ps=conn.prepareStatement(sql.toString());
	

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {						
				bls0100 = rs.getInt("repdate"); 
	
		
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
		return "success";
}



/*********************     end of BLS0100criteria   ********************/
/*********************     start of BLS0110criteria   ********************/

public int bls0110;



public int getBls0110() {
return bls0110;
}


public void setBls0110(int bls0110) {
this.bls0110 = bls0110;
}


public String BLS0110criteriaCheck(){

HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

String status = "";

ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();
PreparedStatement ps = null;
StringBuffer sql = new StringBuffer();

DateFormat df=new DateFormat();

log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt1"));

log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt2"));

sql.append("select count(REPORT_DATE) as repdate from BLS0110_MAST_TABLE where REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"'    ");

log.info("SELECTPROFILE"+ sql.toString());

try {
ps=conn.prepareStatement(sql.toString());


ResultSet rs = ps.executeQuery();
if (rs.next()) {	
bls0110 = rs.getInt("repdate"); 


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
return "success";
}



/*********************     end of BLS0110criteria ********************/

public String BLS0120criteriaCheck(){

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();

	String status = "";

	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();

	DateFormat df=new DateFormat();

	log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt1"));

	log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt2"));

	sql.append("select count(REPORT_DATE) as repdate from BLS0100_MAST_TABLE where REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"'    ");

	log.info("SELECTPROFILE"+ sql.toString());

		try {
			ps=conn.prepareStatement(sql.toString());
	

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {						
				bls0120 = rs.getInt("repdate"); 
	
		
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
		return "success";
}

/*********************     start of BLS0130criteria   ********************/

public int bls0130;



public int getBls0130() {
	return bls0130;
}


public void setBls0130(int bls0130) {
	this.bls0130 = bls0130;
}


public String BLS0130criteriaCheck(){

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();

	String status = "";

	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();

	DateFormat df=new DateFormat();

	log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt1"));

	log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt2"));

	sql.append("select count(REPORT_DATE) as repdate from BLS0110_MAST_TABLE where REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"'    ");

	log.info("SELECTPROFILE"+ sql.toString());

		try {
			ps=conn.prepareStatement(sql.toString());
	

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {						
				bls0130 = rs.getInt("repdate"); 
	
		
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
		return "success";
}



/*********************     end of BLS0130criteria   ********************/

public String BLS0140criteriaCheck(){

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();

	String status = "";

	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();

	DateFormat df=new DateFormat();

	log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt1"));

	log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt2"));

	sql.append("select count(REPORT_DATE) as repdate from BLS0100_MAST_TABLE where REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"'    ");

	log.info("SELECTPROFILE"+ sql.toString());

		try {
			ps=conn.prepareStatement(sql.toString());
	

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {						
				bls0140 = rs.getInt("repdate"); 
	
		
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
		return "success";
}
public int bls0102;


public int getBls0102() {
return bls0102;
}


public void setBls0102(int bls0102) {
this.bls0102 = bls0102;
}
 public String BLS0102criteriaCheck(){

HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

String status = "";

ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();
PreparedStatement ps = null;
StringBuffer sql = new StringBuffer();

DateFormat df=new DateFormat();

//log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt1");

log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt2"));

//sql.append("select count(REPORT_DATE) AS REPDATE FROM BLS0106_MAST_TABLE WHERE REPORT_DATE = '"+df.formatdate(request.getParameter("dt1")+"' || '"+df.formatdate(request.getParameter("dt2")+"'    ORDER BY REPORT_DATE ASC ";
sql.append("select count(REPORT_DATE) AS repdate FROM BLS0102_MAST_TABLE WHERE REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"'  ORDER BY REPORT_DATE ASC ");

log.info("SELECTPROFILE"+ sql.toString());

try {
ps=conn.prepareStatement(sql.toString());
   
    
    ResultSet rs = ps.executeQuery();
if (rs.next()) {	
bls0102 = rs.getInt("repdate"); 

}
log.info("domaaaaa"+bls0102);
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
return "success";
}
 
 public int bls0103;


 public int getBls0103() {
 return bls0103;
 }


 public void setBls0103(int bls0103) {
 this.bls0103 = bls0103;
 }
  /*******************************bls0103****************************************/
  public String BLS0103criteriaCheck(){

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();

	String status = "";

	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();

	DateFormat df=new DateFormat();

	log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt1"));

	log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt2"));

	 sql.append("select count(REPORT_DATE) AS repdate FROM BLS0103_MAST_TABLE WHERE REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"'  ORDER BY REPORT_DATE ASC ");

	log.info("SELECTPROFILE"+ sql.toString());

		try {
			ps=conn.prepareStatement(sql.toString());
	

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {						
				bls0103 = rs.getInt("repdate"); 
	
		
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
		return "success";
}

public int bls0104;



public int getBls0104() {
return bls0104;
}


public void setBls0104(int bls0104) {
this.bls0104 = bls0104;
}


public String BLS0104criteriaCheck(){

HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

String status = "";

ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();
PreparedStatement ps = null;
StringBuffer sql = new StringBuffer();

DateFormat df=new DateFormat();

log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt1"));

log.info("dateeeeeeeeeeeeeeee" + request.getParameter("dt2"));

sql.append("select count(REPORT_DATE) as repdate from BLS0104_MAST_TABLE where REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"'    ");

log.info("SELECTPROFILE"+ sql.toString());

try {
ps=conn.prepareStatement(sql.toString());


ResultSet rs = ps.executeQuery();
if (rs.next()) {	
bls0104 = rs.getInt("repdate"); 


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
return "success";
}



/*********************     end of BLS0104criteria ********************/

/*********************     start of BLS0105criteria   ********************/

public int bls0105;




public int getBls0105() {
	return bls0105;
}


public void setBls0105(int bls0105) {
	this.bls0105 = bls0105;
}






public String BLS0105criteriaCheck(){

HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

String status = "";

ConnectionManager connMgr = new ConnectionManager();
Connection conn = connMgr.getConnection();
PreparedStatement ps = null;
StringBuffer sql = new StringBuffer();

DateFormat df=new DateFormat();

log.info("date " + request.getParameter("dt1"));

log.info("date " + request.getParameter("dt2"));

sql.append("select count(REPORT_DATE) as repdate from BLS0105_MAST_TABLE where REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"'    ");

log.info("SELECTPROFILE"+ sql.toString());

try {
ps=conn.prepareStatement(sql.toString());


ResultSet rs = ps.executeQuery();
if (rs.next()) {	
	bls0105 = rs.getInt("repdate"); 


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
return "success";
}



/*********************     end of BLS0105criteria   ********************/
}
