package dao;


/****************************************************************************************************************
*																												*
* 	* @companyName 			:	Bonfire Innovation Private Limited Chennai										*
* 	* @project 				:	Extensible Business Reporting Language (XBRL)									*
* 	* @name 				:	XBRLBOPDao.java															*
* 	* @path 				:	action																			*
* 	* @author 				:	D PraveenBabu																	*
* 	* @version 				: 	1.0																				*
* 	* @functionality 		:	It contains the dao with multiple methods to create BOP0300 Report.				*
* 	* @relatedScripts 		: 	bean.XBRLBOPBean.java,dao.XBRLBOPDao.java 								*
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
import utilities.ConnectionManager;
import utilities.NullCheck;
import bean.XBRLBOPBean;
import bean.XBRLPYM0100Bean;
import org.apache.log4j.Logger;
public class XBRLBOPDao {
	
	static Logger log = Logger.getLogger(XBRLBOPDao.class);
	private String accno;
	
	public String getAccno() {
		return accno;
	}



	public void setAccno(String accno) {
		this.accno = accno;
	}


/************************BOP DEMO**********************************/

public ArrayList<XBRLBOPBean> xbrlBOP0300(String dt1,String dt2) {
	
	log.info("FIM0100 List Data AB " + dt1 + "dt22222" + dt2);
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLBOPBean> arl = new ArrayList<XBRLBOPBean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	

	try {
	
	
		//sql.append("SELECT /* +FIRST_ROWS(100) */ MODES,CHQ_NUMBER,ACCT_NUMBER,ACCT_NAME,to_char(TRAN_DATE,'DD-MM-YYYY')TRAN_DATE,CHQ_AMOUNT,CRNCY,DEL_FLG,RCRE_USER_ID,to_char(RCRE_TIME,'DD-MM-YYYY')RCRE_TIME,LCHG_USER_ID,to_char(LCHG_TIME,'DD-MM-YYYY')LCHG_TIME FROM TABLE(PYM0100_DTL_FUN('PYM0100','0','0','"+dt2+"','"+dt1+"','"+dt2+"'))");
		
		
		sql.append("SELECT to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE, a.*  FROM TABLE(BOP0300_DTL_FUN('BOP0300','0','0','31-MAR-2014','01-JAN-2014','31-MAR-2014')) a");
		
		
		log.info("BOP0300"+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
		//	log.info("whileee");
			XBRLBOPBean xb=new XBRLBOPBean();
			
		
			xb.setRptdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
			xb.setAcctno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));			
			xb.setAcctname(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
			xb.setCustid(NullCheck.isNotNull(rs.getString("CUST_ID")));
			xb.setSchmtype(NullCheck.isNotNull(rs.getString("SCHM_TYPE")));
			xb.setNreflg(NullCheck.isNotNull(rs.getString("NRE_FLG")));
			xb.setIntrate(NullCheck.isNotNull(rs.getString("INT_RATE")));
			xb.setAcccrncycode(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
			xb.setBalanceamt(NullCheck.isNotNull(rs.getString("BALANCE_AMT")));
			xb.setAsstliabnrflg(NullCheck.isNotNull(rs.getString("ASSET_LIAB_NR_FLG")));
			
			xb.setIntamtqtr(NullCheck.isNotNull(rs.getString("INTEREST_AMOUNT_QTR")));
			xb.setDelflg(NullCheck.isNotNull(rs.getString("DEL_FLG")));
			xb.setRcreusrid(NullCheck.isNotNull(rs.getString("RCRE_USER_ID")));
			xb.setRcretme(NullCheck.isNotNull(rs.getString("RCRE_TIME")));
			xb.setLchgusrid(NullCheck.isNotNull(rs.getString("LCHG_USER_ID")));
			xb.setLchgtme(NullCheck.isNotNull(rs.getString("LCHG_TIME")));
				
	
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
