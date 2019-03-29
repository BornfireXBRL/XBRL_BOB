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
import bean.XBRLSUP0601Bean;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRLSUP0601CriteriaDao {
	
	static Logger log = Logger.getLogger(XBRLSUP0601CriteriaDao.class);
	
	
	public ArrayList<XBRLSUP0601Bean> xbrlSUP0601(String dt3) {
		
		log.info("xbrlSUP0601 List Data AB " + dt3 );
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLSUP0601Bean> arl = new ArrayList<XBRLSUP0601Bean>();
		
		String status = "";
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		
		PreparedStatement ps = null;
		
		StringBuffer sql = new StringBuffer();
		
		
		DateFormat df=new DateFormat();		
		dt3 =df.formatdate(dt3);
		
		
	
		try {
		
			//sql.append("select SRL_NO,NAME_OF_CUST,CIF_ID,ACCT_NUM,ACCT_PRODUCTS,to_char(ACCT_OPN_DATE,'DD-MM-YYYY')ACCT_OPN_DATE,ACCT_CRNCY,ACCT_BAL,RATE_OF_INT,DAILY_AVG_AMT,WEIGHT_AVG_INT_RATE,INT_INC_EXP from BOP300XBRLREPORT where RPT_START_DATE='"+fromdate+"' and RPT_END_DATE='"+todate+"'");
	
			//sql.append("SELECT DYNAMIC_DOMAIN,to_char(REP_DATE,'DD-MM-YYYY')REP_DATE,INSTITUTE_ID,TRAN_ID,INSTITUTE_NAME,TRAN_NATURE,INSTITUTE_CODE,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,NVL(to_char(INT_START_DATE,'DD-MM-YYYY'),'NA')INT_START_DATE,NVL(to_char(INT_END_DATE,'DD-MM-YYYY'),'NA')INT_END_DATE,INT_RATE,DEL_FLG,RCRE_USER_ID,RCRE_TIME,LCHG_USER_ID,LCHG_TIME FROM FIM0100_MAST_TABLE Where  REP_DATE >='"+dt1+"' and REP_DATE <= '"+dt2+"'");
		
			sql.append("SELECT SECTOR_CODE,ACCT_NUMBER,ACCT_NAME,SCHM_CODE,LOAN_AMOUNT,PR_OUTSTANDING,INT_OUTSTANDING,DPD_CNTR,SPEC_PROV,PORT_PROV,BAD_DR_WR_OFF,SEC_AMOUNT,DEL_FLG,RCRE_USER_ID,RCRE_TIME,LCHG_USER_ID,LCHG_TIME FROM LOAN_MASTER_TABLE Where  ACCT_OPN_DATE <='"+dt3+"' and ACCT_CLS_FLG ='N'");
			
			log.info("CRRRRRRRRRRRRRR"+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				log.info("whileee");
				XBRLSUP0601Bean xb=new XBRLSUP0601Bean();
				
				
			
			/*	xb.setSector(NullCheck.isNotNull(rs.getString("SECTOR_CODE")));
				xb.setAccntno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
				xb.setAccntname(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
				xb.setSchcode(NullCheck.isNotNull(rs.getString("SCHM_CODE")));
				xb.setLoanamnt(NullCheck.isNotNull(rs.getString("LOAN_AMOUNT")));
				xb.setPrinamntout(NullCheck.isNotNull(rs.getString("PR_OUTSTANDING")));
				xb.setIntanmtout(NullCheck.isNotNull(rs.getString("INT_OUTSTANDING")));
				xb.setNoofdaysdue(NullCheck.isNotNull(rs.getString("DPD_CNTR")));
				xb.setSpecificprov(NullCheck.isNotNull(rs.getString("SPEC_PROV")));
				xb.setPortprov(NullCheck.isNotNull(rs.getString("PORT_PROV")));
				xb.setBaddebits(NullCheck.isNotNull(rs.getString("BAD_DR_WR_OFF")));
				xb.setSecurityamnt(NullCheck.isNotNull(rs.getString("SEC_AMOUNT")));
				xb.setDel(NullCheck.isNotNull(rs.getString("DEL_FLG")));
				xb.setRcreuserid(NullCheck.isNotNull(rs.getString("RCRE_USER_ID")));
				xb.setRcretime(NullCheck.isNotNull(rs.getString("RCRE_TIME")));
				xb.setLchguserid(NullCheck.isNotNull(rs.getString("LCHG_USER_ID")));
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
public ArrayList<XBRLSUP0601Bean> xbrlSUP0601EE(String ReporefSeq ) {
		
		log.info("xbrlSUP0601 List Data AB " + ReporefSeq );
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLSUP0601Bean> arl = new ArrayList<XBRLSUP0601Bean>();
		
		String status = "";
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		
		PreparedStatement ps = null;
		
		StringBuffer sql = new StringBuffer();
		
		
		DateFormat df=new DateFormat();		
		//dt3 =df.formatdate(dt3);
		
		
	
		try {
		
			//sql.append("select SRL_NO,NAME_OF_CUST,CIF_ID,ACCT_NUM,ACCT_PRODUCTS,to_char(ACCT_OPN_DATE,'DD-MM-YYYY')ACCT_OPN_DATE,ACCT_CRNCY,ACCT_BAL,RATE_OF_INT,DAILY_AVG_AMT,WEIGHT_AVG_INT_RATE,INT_INC_EXP from BOP300XBRLREPORT where RPT_START_DATE='"+fromdate+"' and RPT_END_DATE='"+todate+"'");
	
			//sql.append("SELECT DYNAMIC_DOMAIN,to_char(REP_DATE,'DD-MM-YYYY')REP_DATE,INSTITUTE_ID,TRAN_ID,INSTITUTE_NAME,TRAN_NATURE,INSTITUTE_CODE,TRAN_CRNCY,TRAN_TYPE,TRAN_AMT,NVL(to_char(INT_START_DATE,'DD-MM-YYYY'),'NA')INT_START_DATE,NVL(to_char(INT_END_DATE,'DD-MM-YYYY'),'NA')INT_END_DATE,INT_RATE,DEL_FLG,RCRE_USER_ID,RCRE_TIME,LCHG_USER_ID,LCHG_TIME FROM FIM0100_MAST_TABLE Where  REP_DATE >='"+dt1+"' and REP_DATE <= '"+dt2+"'");
		
			sql.append("SELECT SECTOR_CODE,ACCT_NUMBER,ACCT_NAME,SCHM_CODE,LOAN_AMOUNT,PR_OUTSTANDING,INT_OUTSTANDING,DPD_CNTR,SPEC_PROV,PORT_PROV,BAD_DR_WR_OFF,SEC_AMOUNT FROM LOAN_MASTER_TABLE Where REPORT_REF_NO = '"+ReporefSeq+"' ORDER BY ACCT_OPN_DATE ASC ");
			
			log.info("CRRRRRRRRRRRRRR"+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				log.info("whileee");
				XBRLSUP0601Bean xb=new XBRLSUP0601Bean();
				
				
			
				/*xb.setSector(NullCheck.isNotNull(rs.getString("SECTOR_CODE")));
				xb.setAccntno(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
				xb.setAccntname(NullCheck.isNotNull(rs.getString("ACCT_NAME")));
				xb.setSchcode(NullCheck.isNotNull(rs.getString("SCHM_CODE")));
				xb.setLoanamnt(NullCheck.isNotNull(rs.getString("LOAN_AMOUNT")));
				xb.setPrinamntout(NullCheck.isNotNull(rs.getString("PR_OUTSTANDING")));
				xb.setIntanmtout(NullCheck.isNotNull(rs.getString("INT_OUTSTANDING")));
				xb.setNoofdaysdue(NullCheck.isNotNull(rs.getString("DPD_CNTR")));
				xb.setSpecificprov(NullCheck.isNotNull(rs.getString("SPEC_PROV")));
				xb.setPortprov(NullCheck.isNotNull(rs.getString("PORT_PROV")));
				xb.setBaddebits(NullCheck.isNotNull(rs.getString("BAD_DR_WR_OFF")));
				xb.setSecurityamnt(NullCheck.isNotNull(rs.getString("SEC_AMOUNT")));
				
				
			
			 */
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
