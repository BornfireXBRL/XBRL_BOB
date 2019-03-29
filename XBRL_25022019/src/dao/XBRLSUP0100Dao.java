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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import basecode.DateFormat;
import bean.XBRLSUP0100Bean;
import bean.XBRLSUP0100Bean;
import bean.XBRLReportMasterBean;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRLSUP0100Dao {
	
	static Logger log = Logger.getLogger(XBRLSUP0100Dao.class);
	
	
	public String Reporef;
	
	
	
	
	

		
		
	public String getReporef() {
		return Reporef;
	}

	public void setReporef(String reporef) {
		Reporef = reporef;
	}

	public ArrayList<String> xbrlsup100(String dt2,String curr) {
	
			
			ArrayList<String> arl = new ArrayList<String>();

			ConnectionManager connMgr = new ConnectionManager();
			Connection conn = connMgr.getConnection();
			PreparedStatement ps = null;
			StringBuffer sql = new StringBuffer();
			DateFormat df=new DateFormat();		
			dt2 =df.formatdate(dt2);
			
			sql.append("select * from SUP0100_MAST_TABLE where REPORT_DATE='"+dt2+"' ");

		
			try {
			
				
				
				log.info(sql.toString());
				
				ps=conn.prepareStatement(sql.toString());
				
			    ResultSet rs=ps.executeQuery();
			     

				while(rs.next()){
					arl.add(NullCheck.isNotNull(rs.getString("NO_OF_ATMS")));
					arl.add(NullCheck.isNotNull(rs.getString("TOT_NO_OF_CARDS")));
					arl.add(NullCheck.isNotNull(rs.getString("NO_OF_CRD_CARDS")));
					arl.add(NullCheck.isNotNull(rs.getString("NO_OF_DBT_CARDS")));
					arl.add(NullCheck.isNotNull(rs.getString("NO_OF_OTH_CARDS")));
					arl.add(NullCheck.isNotNull(rs.getString("TOT_NO_OF_ATM_TRAN")));
					arl.add(NullCheck.isNotNull(rs.getString("NO_OF_CRD_ATM_TRAN")));
					arl.add(NullCheck.isNotNull(rs.getString("NO_OF_DBT_ATM_TRAN")));
					arl.add(NullCheck.isNotNull(rs.getString("NO_OF_OTH_ATM_TRAN")));
					arl.add(NullCheck.isNotNull(rs.getString("TOT_VAL_OF_ATM_TRAN")));      //10
					arl.add(NullCheck.isNotNull(rs.getString("VAL_OF_CRD_ATM_TRAN")));      
				    arl.add(NullCheck.isNotNull(rs.getString("VAL_OF_DBT_ATM_TRAN")));
				    arl.add(NullCheck.isNotNull(rs.getString("VAL_OF_CASH")));
				    arl.add(NullCheck.isNotNull(rs.getString("VAL_OF_CASH")));
				    arl.add(NullCheck.isNotNull(rs.getString("TOT_VAL_OF_ATM_TRAN_FC")));
					arl.add(NullCheck.isNotNull(rs.getString("VAL_OF_CRD_ATM_TRAN_FC")));
					arl.add(NullCheck.isNotNull(rs.getString("VAL_OF_DBT_ATM_TRAN_FC")));
					arl.add(NullCheck.isNotNull(rs.getString("VAL_OF_CASH_FC")));
					arl.add(NullCheck.isNotNull(rs.getString("VAL_OF_OTH_FC")));
					arl.add(NullCheck.isNotNull(rs.getString("TOT_NO_OF_SHRD_ATM_TRAN")));    //20
					arl.add(NullCheck.isNotNull(rs.getString("TOT_VAL_OF_SHRD_ATM_TRAN")));
					arl.add(NullCheck.isNotNull(rs.getString("VAL_OF_CRD_SHRD_ATM_TRAN")));        
					arl.add(NullCheck.isNotNull(rs.getString("VAL_OF_DBT_SHRD_ATM_TRAN")));
					arl.add(NullCheck.isNotNull(rs.getString("VAL_OF_OTH_SHRD_ATM_TRAN")));
					arl.add(NullCheck.isNotNull(rs.getString("TOT_VAL_OF_SHRD_ATM_TRAN_FC")));
				    arl.add(NullCheck.isNotNull(rs.getString("VAL_OF_CRD_SHRD_ATM_TRAN_FC")));
				    arl.add(NullCheck.isNotNull(rs.getString("VAL_OF_DBT_SHRD_ATM_TRAN_FC")));
				    arl.add(NullCheck.isNotNull(rs.getString("VAL_OF_OTH_SHRD_ATM_TRAN_FC")));
				    arl.add(NullCheck.isNotNull(rs.getString("TOT_NO_OF_MP")));
					arl.add(NullCheck.isNotNull(rs.getString("TOT_NO_OF_MP_TRAN")));              //30
					arl.add(NullCheck.isNotNull(rs.getString("NO_OF_CRD_MP_TRAN")));          
					arl.add(NullCheck.isNotNull(rs.getString("NO_OF_DBT_MP_TRAN")));
					arl.add(NullCheck.isNotNull(rs.getString("NO_OF_OTH_MP_TRAN")));
					arl.add(NullCheck.isNotNull(rs.getString("TOT_VAL_OF_MP_TRAN")));
					arl.add(NullCheck.isNotNull(rs.getString("VAL_OF_CRD_MP_TRAN")));
					arl.add(NullCheck.isNotNull(rs.getString("VAL_OF_DBT_MP_TRAN")));
					arl.add(NullCheck.isNotNull(rs.getString("VAL_OF_OTH_MP_TRAN")));
					arl.add(NullCheck.isNotNull(rs.getString("VAL_OF_OTH_MP_TRAN")));
					arl.add(NullCheck.isNotNull(rs.getString("TOT_NO_OF_IB_TRAN")));
				    arl.add(NullCheck.isNotNull(rs.getString("NO_OF_DBT_IB_TRAN")));                 //40
				    arl.add(NullCheck.isNotNull(rs.getString("NO_OF_CRD_IB_TRAN")));
				    arl.add(NullCheck.isNotNull(rs.getString("TOT_VAL_OF_IB_TRAN")));
				    arl.add(NullCheck.isNotNull(rs.getString("VAL_OF_DBT_IB_TRAN")));
				    arl.add(NullCheck.isNotNull(rs.getString("VAL_OF_CRD_IB_TRAN")));
				    arl.add(NullCheck.isNotNull(rs.getString("NO_OF_MB_CUST")));
				    arl.add(NullCheck.isNotNull(rs.getString("NO_OF_ACTIVE_MM_CUST")));
				    arl.add(NullCheck.isNotNull(rs.getString("NO_OF_MP_OUTLET")));
				    arl.add(NullCheck.isNotNull(rs.getString("NO_OF_ACTIVE_MP_OUTLET")));
				    arl.add(NullCheck.isNotNull(rs.getString("TOT_NO_OF_MB_MP_TRAN")));
				    arl.add(NullCheck.isNotNull(rs.getString("NO_OF_TRANSFER_TRAN")));                //50
				    arl.add(NullCheck.isNotNull(rs.getString("NO_OF_PAYMENT_TRAN")));
				    arl.add(NullCheck.isNotNull(rs.getString("NO_OF_CASH_BACK_TRAN")));
				    arl.add(NullCheck.isNotNull(rs.getString("NO_OF_CASH_WITHDRAW_TRAN")));
				    arl.add(NullCheck.isNotNull(rs.getString("NO_OF_MM_TRAN")));
				    arl.add(NullCheck.isNotNull(rs.getString("VALUE_OF_MB_MP_TRAN")));
				    arl.add(NullCheck.isNotNull(rs.getString("VALUE_OF_TRANSFER_TRAN")));
				    arl.add(NullCheck.isNotNull(rs.getString("VALUE_OF_PAYMENT_TRAN")));
				    arl.add(NullCheck.isNotNull(rs.getString("VALUE_OF_CASH_BACK_TRAN")));
				    arl.add(NullCheck.isNotNull(rs.getString("VALUE_OF_CASH_WITHDRAW_TRAN")));
				    arl.add(NullCheck.isNotNull(rs.getString("VALUE_OF_MM_TRAN")));                  //60
				    arl.add(NullCheck.isNotNull(rs.getString("TOT_OUTSTANDING_MM_ACCTS")));
				    arl.add(NullCheck.isNotNull(rs.getString("COMPLATS")));
				    arl.add(NullCheck.isNotNull(rs.getString("ACTION_ON_COMPLAINTS")));
				    arl.add(NullCheck.isNotNull(rs.getString("ACTION_OF_SERVICE_BREAK")));
				    arl.add(NullCheck.isNotNull(rs.getString("SECURITY_LAPSE")));
				    arl.add(NullCheck.isNotNull(rs.getString("LOSS_DETAILS")));
				    arl.add(NullCheck.isNotNull(rs.getString("LOSS_OF_CONFIDENTIAL_DATA")));
				    arl.add(NullCheck.isNotNull(rs.getString("BREACH_IN_GUIDE")));
				    arl.add(NullCheck.isNotNull(rs.getString("TOT_NO_OF_OTH_ELEC_MT")));
				    arl.add(NullCheck.isNotNull(rs.getString("NO_OF_DBT_TRAN")));                     //70
				    arl.add(NullCheck.isNotNull(rs.getString("NO_OF_CRD_TRAN")));
				    arl.add(NullCheck.isNotNull(rs.getString("TOT_VAL_OF_OTH_ELEC_MT")));
				    arl.add(NullCheck.isNotNull(rs.getString("VAL_OF_DBT_TRAN")));
				    arl.add(NullCheck.isNotNull(rs.getString("VAL_OF_CRD_TRAN")));
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

	public String sup0100Formins() {
		String status="";
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();
		DateFormat df=new DateFormat();		
		
		sql.append("INSERT INTO SUP0100_MAST_TABLE(NO_OF_ATMS,TOT_NO_OF_CARDS,NO_OF_CRD_CARDS,NO_OF_DBT_CARDS,NO_OF_OTH_CARDS,TOT_NO_OF_ATM_TRAN,NO_OF_CRD_ATM_TRAN,NO_OF_DBT_ATM_TRAN,NO_OF_OTH_ATM_TRAN,TOT_VAL_OF_ATM_TRAN,VAL_OF_CRD_ATM_TRAN,VAL_OF_DBT_ATM_TRAN,VAL_OF_CASH,VAL_OF_OTH,TOT_VAL_OF_ATM_TRAN_FC,VAL_OF_CRD_ATM_TRAN_FC,VAL_OF_DBT_ATM_TRAN_FC,VAL_OF_CASH_FC,VAL_OF_OTH_FC,TOT_NO_OF_SHRD_ATM_TRAN,TOT_VAL_OF_SHRD_ATM_TRAN,VAL_OF_CRD_SHRD_ATM_TRAN,VAL_OF_DBT_SHRD_ATM_TRAN,VAL_OF_OTH_SHRD_ATM_TRAN,TOT_VAL_OF_SHRD_ATM_TRAN_FC,VAL_OF_CRD_SHRD_ATM_TRAN_FC,VAL_OF_DBT_SHRD_ATM_TRAN_FC,VAL_OF_OTH_SHRD_ATM_TRAN_FC,TOT_NO_OF_MP,TOT_NO_OF_MP_TRAN,NO_OF_CRD_MP_TRAN,NO_OF_DBT_MP_TRAN,NO_OF_OTH_MP_TRAN,TOT_VAL_OF_MP_TRAN,VAL_OF_CRD_MP_TRAN,VAL_OF_DBT_MP_TRAN,VAL_OF_OTH_MP_TRAN,TOT_NO_OF_IB_CUST,TOT_NO_OF_IB_TRAN,NO_OF_DBT_IB_TRAN,NO_OF_CRD_IB_TRAN,TOT_VAL_OF_IB_TRAN,VAL_OF_DBT_IB_TRAN,VAL_OF_CRD_IB_TRAN,NO_OF_MB_CUST,NO_OF_ACTIVE_MM_CUST,NO_OF_MP_OUTLET,NO_OF_ACTIVE_MP_OUTLET,TOT_NO_OF_MB_MP_TRAN,NO_OF_TRANSFER_TRAN,NO_OF_PAYMENT_TRAN,NO_OF_CASH_BACK_TRAN,NO_OF_CASH_WITHDRAW_TRAN,NO_OF_MM_TRAN,VALUE_OF_MB_MP_TRAN,VALUE_OF_TRANSFER_TRAN,VALUE_OF_PAYMENT_TRAN,VALUE_OF_CASH_BACK_TRAN,VALUE_OF_CASH_WITHDRAW_TRAN,VALUE_OF_MM_TRAN,TOT_OUTSTANDING_MM_ACCTS,COMPLATS,ACTION_ON_COMPLAINTS,ACTION_OF_SERVICE_BREAK,SECURITY_LAPSE,LOSS_DETAILS,LOSS_OF_CONFIDENTIAL_DATA,BREACH_IN_GUIDE,TOT_NO_OF_OTH_ELEC_MT,NO_OF_DBT_TRAN,NO_OF_CRD_TRAN,TOT_VAL_OF_OTH_ELEC_MT,VAL_OF_DBT_TRAN,VAL_OF_CRD_TRAN,REPORT_DATE,RCRE_USER_ID,RCRE_TIME)  VALUES('"+request.getParameter("noatminopa")+"','"+request.getParameter("nocardsa")+"','"+request.getParameter("credtcarda")+"','"+request.getParameter("debtcarda")+"','"+request.getParameter("othra")+"','"+request.getParameter("nofatmtna")+"','"+request.getParameter("credtcarda2")+"','"+request.getParameter("debtcarda2")+"','"+request.getParameter("othra2")+"','"+request.getParameter("valfatmtna")+"','"+request.getParameter("credtcarda3")+"','"+request.getParameter("debtcarda3")+"','"+request.getParameter("amtcshwitha3")+"','"+request.getParameter("othra3")+"','"+request.getParameter("valfatmforga")+"','"+request.getParameter("credtcarda4")+"','"+request.getParameter("debtcarda4")+"','"+request.getParameter("amtcshwitha4")+"','"+request.getParameter("othra4")+"','"+request.getParameter("noftranss")+"','"+request.getParameter("valoftrns")+"','"+request.getParameter("credtcards")+"','"+request.getParameter("debtcards")+"','"+request.getParameter("othrs")+"','"+request.getParameter("valfatmforgs")+"','"+request.getParameter("credtcards1")+"','"+request.getParameter("debtcards1")+"','"+request.getParameter("othrs1")+"','"+request.getParameter("nomerchantntm")+"','"+request.getParameter("noftransm")+"','"+request.getParameter("credtcardm")+"','"+request.getParameter("debtcardm")+"','"+request.getParameter("othrm")+"','"+request.getParameter("valftransm")+"','"+request.getParameter("credtcardm1")+"','"+request.getParameter("debtcardm1")+"','"+request.getParameter("othrm1")+"','"+request.getParameter("nofintbnkcusi")+"','"+request.getParameter("nofintbnktrani")+"','"+request.getParameter("nofdbttrani")+"','"+request.getParameter("nofcrttrani")+"','"+request.getParameter("amtofintbnktrani")+"','"+request.getParameter("amtofdbttrani")+"','"+request.getParameter("amtofcrttrani")+"','"+request.getParameter("nofsubsserm")+"','"+request.getParameter("nofactmonactm")+"','"+request.getParameter("nofregagntsactmobpaym")+"','"+request.getParameter("nofactagoutm")+"','"+request.getParameter("nofmobpaytransm")+"','"+request.getParameter("noftranftransm")+"','"+request.getParameter("nofpaytransm")+"','"+request.getParameter("nofcashtransm")+"','"+request.getParameter("nofcashwithtransm")+"','"+request.getParameter("nofmobmnytransm")+"','"+request.getParameter("amtmobpaytranm")+"','"+request.getParameter("amttranstranm")+"','"+request.getParameter("amtpaytranm")+"','"+request.getParameter("amtcashbacktranm")+"','"+request.getParameter("amtcardcashwithtranm")+"','"+request.getParameter("amtmobmnytranm")+"','"+request.getParameter("outbalactmobactm")+"','"+request.getParameter("listicfailaa")+"','"+request.getParameter("detofactkbyidwab")+"','"+request.getParameter("serbrkdwreac")+"','"+request.getParameter("sysseclabactad")+"','"+request.getParameter("lsbybkcusae")+"','"+request.getParameter("lsofconfdtaf")+"','"+request.getParameter("brofguidag")+"','"+request.getParameter("nofelcmnytrno")+"','"+request.getParameter("nofdedttrno")+"','"+request.getParameter("nofcrttrno")+"','"+request.getParameter("nofotelctrno")+"','"+request.getParameter("ofwhcamtdbtro")+"','"+request.getParameter("nofcrttrno1")+"','"+df.formatdate(NullCheck.isNotNull(request.getParameter("dt2")))+"','"+NullCheck.isNotNull(session.getAttribute("userName").toString())+"',SYSDATE)");
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
	
	public String sup0100Formmod() {
		String status="";
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();
		DateFormat df=new DateFormat();		
		
		//sql.append("UPDATE  SUP0100_MAST_TABLE  SET NO_OF_ATMS='"+NullCheck.isNotNull(sbn.getNoatminopa())+"',TOT_NO_OF_CARDS='"+NullCheck.isNotNull(sbn.getNocardsa())+"' ,NO_OF_CRD_CARDS,NO_OF_DBT_CARDS,NO_OF_OTH_CARDS,TOT_NO_OF_ATM_TRAN,NO_OF_CRD_ATM_TRAN,NO_OF_DBT_ATM_TRAN,NO_OF_OTH_ATM_TRAN,TOT_VAL_OF_ATM_TRAN,VAL_OF_CRD_ATM_TRAN,VAL_OF_DBT_ATM_TRAN,VAL_OF_CASH,VAL_OF_OTH,TOT_VAL_OF_ATM_TRAN_FC,VAL_OF_CRD_ATM_TRAN_FC,VAL_OF_DBT_ATM_TRAN_FC,VAL_OF_CASH_FC,VAL_OF_OTH_FC,TOT_NO_OF_SHRD_ATM_TRAN,TOT_VAL_OF_SHRD_ATM_TRAN,VAL_OF_CRD_SHRD_ATM_TRAN,VAL_OF_DBT_SHRD_ATM_TRAN,VAL_OF_OTH_SHRD_ATM_TRAN,TOT_VAL_OF_SHRD_ATM_TRAN_FC,VAL_OF_CRD_SHRD_ATM_TRAN_FC,VAL_OF_DBT_SHRD_ATM_TRAN_FC,VAL_OF_OTH_SHRD_ATM_TRAN_FC,TOT_NO_OF_MP,TOT_NO_OF_MP_TRAN,NO_OF_CRD_MP_TRAN,NO_OF_DBT_MP_TRAN,NO_OF_OTH_MP_TRAN,TOT_VAL_OF_MP_TRAN,VAL_OF_CRD_MP_TRAN,VAL_OF_DBT_MP_TRAN,VAL_OF_OTH_MP_TRAN,TOT_NO_OF_IB_CUST,TOT_NO_OF_IB_TRAN,NO_OF_DBT_IB_TRAN,NO_OF_CRD_IB_TRAN,TOT_VAL_OF_IB_TRAN,VAL_OF_DBT_IB_TRAN,VAL_OF_CRD_IB_TRAN,NO_OF_MB_CUST,NO_OF_ACTIVE_MM_CUST,NO_OF_MP_OUTLET,NO_OF_ACTIVE_MP_OUTLET,TOT_NO_OF_MB_MP_TRAN,NO_OF_TRANSFER_TRAN,NO_OF_PAYMENT_TRAN,NO_OF_CASH_BACK_TRAN,NO_OF_CASH_WITHDRAW_TRAN,NO_OF_MM_TRAN,VALUE_OF_MB_MP_TRAN,VALUE_OF_TRANSFER_TRAN,VALUE_OF_PAYMENT_TRAN,VALUE_OF_CASH_BACK_TRAN,VALUE_OF_CASH_WITHDRAW_TRAN,VALUE_OF_MM_TRAN,TOT_OUTSTANDING_MM_ACCTS,COMPLATS,ACTION_ON_COMPLAINTS,ACTION_OF_SERVICE_BREAK,SECURITY_LAPSE,LOSS_DETAILS,LOSS_OF_CONFIDENTIAL_DATA,BREACH_IN_GUIDE,TOT_NO_OF_OTH_ELEC_MT,NO_OF_DBT_TRAN,NO_OF_CRD_TRAN,TOT_VAL_OF_OTH_ELEC_MT,VAL_OF_DBT_TRAN,VAL_OF_CRD_TRAN,REPORT_DATE");
		
		sql.append("UPDATE  SUP0100_MAST_TABLE  SET NO_OF_ATMS='"+request.getParameter("noatminopa")+"',TOT_NO_OF_CARDS='"+request.getParameter("nocardsa")+"',NO_OF_CRD_CARDS='"+request.getParameter("credtcarda")+"',NO_OF_DBT_CARDS='"+request.getParameter("debtcarda")+"',NO_OF_OTH_CARDS='"+request.getParameter("othra")+"',TOT_NO_OF_ATM_TRAN='"+request.getParameter("nofatmtna")+"',NO_OF_CRD_ATM_TRAN='"+request.getParameter("credtcarda2")+"',NO_OF_DBT_ATM_TRAN='"+request.getParameter("debtcarda2")+"',NO_OF_OTH_ATM_TRAN='"+request.getParameter("othra2")+"',TOT_VAL_OF_ATM_TRAN='"+request.getParameter("valfatmtna")+"',VAL_OF_CRD_ATM_TRAN='"+request.getParameter("credtcarda3")+"',VAL_OF_DBT_ATM_TRAN='"+request.getParameter("debtcarda3")+"',VAL_OF_CASH='"+request.getParameter("amtcshwitha3")+"',VAL_OF_OTH='"+request.getParameter("othra3")+"',TOT_VAL_OF_ATM_TRAN_FC='"+request.getParameter("valfatmforga")+"',VAL_OF_CRD_ATM_TRAN_FC='"+request.getParameter("credtcarda4")+"',VAL_OF_DBT_ATM_TRAN_FC='"+request.getParameter("debtcarda4")+"',VAL_OF_CASH_FC='"+request.getParameter("amtcshwitha4")+"',VAL_OF_OTH_FC='"+request.getParameter("othra4")+"',TOT_NO_OF_SHRD_ATM_TRAN='"+request.getParameter("noftranss")+"',TOT_VAL_OF_SHRD_ATM_TRAN='"+request.getParameter("valoftrns")+"',VAL_OF_CRD_SHRD_ATM_TRAN='"+request.getParameter("credtcards")+"',VAL_OF_DBT_SHRD_ATM_TRAN='"+request.getParameter("debtcards")+"',VAL_OF_OTH_SHRD_ATM_TRAN='"+request.getParameter("othrs")+"',TOT_VAL_OF_SHRD_ATM_TRAN_FC='"+request.getParameter("valfatmforgs")+"',VAL_OF_CRD_SHRD_ATM_TRAN_FC='"+request.getParameter("credtcards1")+"',VAL_OF_DBT_SHRD_ATM_TRAN_FC='"+request.getParameter("debtcards1")+"',VAL_OF_OTH_SHRD_ATM_TRAN_FC='"+request.getParameter("othrs1")+"',TOT_NO_OF_MP='"+request.getParameter("nomerchantntm")+"',TOT_NO_OF_MP_TRAN='"+request.getParameter("noftransm")+"',NO_OF_CRD_MP_TRAN='"+request.getParameter("credtcardm")+"',NO_OF_DBT_MP_TRAN='"+request.getParameter("debtcardm")+"',NO_OF_OTH_MP_TRAN='"+request.getParameter("othrm")+"',TOT_VAL_OF_MP_TRAN='"+request.getParameter("valftransm")+"',VAL_OF_CRD_MP_TRAN='"+request.getParameter("credtcardm1")+"',VAL_OF_DBT_MP_TRAN='"+request.getParameter("debtcardm1")+"',VAL_OF_OTH_MP_TRAN='"+request.getParameter("othrm1")+"',TOT_NO_OF_IB_CUST='"+request.getParameter("nofintbnkcusi")+"',TOT_NO_OF_IB_TRAN='"+request.getParameter("nofintbnktrani")+"',NO_OF_DBT_IB_TRAN='"+request.getParameter("nofdbttrani")+"',NO_OF_CRD_IB_TRAN='"+request.getParameter("nofcrttrani")+"',TOT_VAL_OF_IB_TRAN='"+request.getParameter("amtofintbnktrani")+"',VAL_OF_DBT_IB_TRAN='"+request.getParameter("amtofdbttrani")+"',VAL_OF_CRD_IB_TRAN='"+request.getParameter("amtofcrttrani")+"',NO_OF_MB_CUST='"+request.getParameter("nofsubsserm")+"',NO_OF_ACTIVE_MM_CUST='"+request.getParameter("nofactmonactm")+"',NO_OF_MP_OUTLET='"+request.getParameter("nofregagntsactmobpaym")+"',NO_OF_ACTIVE_MP_OUTLET='"+request.getParameter("nofactagoutm")+"',TOT_NO_OF_MB_MP_TRAN='"+request.getParameter("nofmobpaytransm")+"',NO_OF_TRANSFER_TRAN='"+request.getParameter("noftranftransm")+"',NO_OF_PAYMENT_TRAN='"+request.getParameter("nofpaytransm")+"',NO_OF_CASH_BACK_TRAN='"+request.getParameter("nofcashtransm")+"',NO_OF_CASH_WITHDRAW_TRAN='"+request.getParameter("nofcashwithtransm")+"',NO_OF_MM_TRAN='"+request.getParameter("nofmobmnytransm")+"',VALUE_OF_MB_MP_TRAN='"+request.getParameter("amtmobpaytranm")+"',VALUE_OF_TRANSFER_TRAN='"+request.getParameter("amttranstranm")+"',VALUE_OF_PAYMENT_TRAN='"+request.getParameter("amtpaytranm")+"',VALUE_OF_CASH_BACK_TRAN='"+request.getParameter("amtcashbacktranm")+"',VALUE_OF_CASH_WITHDRAW_TRAN='"+request.getParameter("amtcardcashwithtranm")+"',VALUE_OF_MM_TRAN='"+request.getParameter("amtmobmnytranm")+"',TOT_OUTSTANDING_MM_ACCTS='"+request.getParameter("outbalactmobactm")+"',COMPLATS='"+request.getParameter("listicfailaa")+"',ACTION_ON_COMPLAINTS='"+request.getParameter("detofactkbyidwab")+"',ACTION_OF_SERVICE_BREAK='"+request.getParameter("serbrkdwreac")+"',SECURITY_LAPSE='"+request.getParameter("sysseclabactad")+"',LOSS_DETAILS='"+request.getParameter("lsbybkcusae")+"',LOSS_OF_CONFIDENTIAL_DATA='"+request.getParameter("lsofconfdtaf")+"',BREACH_IN_GUIDE='"+request.getParameter("brofguidag")+"',TOT_NO_OF_OTH_ELEC_MT='"+request.getParameter("nofelcmnytrno")+"',NO_OF_DBT_TRAN='"+request.getParameter("nofdedttrno")+"',NO_OF_CRD_TRAN='"+request.getParameter("nofcrttrno")+"',TOT_VAL_OF_OTH_ELEC_MT='"+request.getParameter("nofotelctrno")+"',VAL_OF_DBT_TRAN='"+request.getParameter("ofwhcamtdbtro")+"',VAL_OF_CRD_TRAN='"+request.getParameter("nofcrttrno1")+"',REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("dt2")))+"',RCRE_USER_ID='"+NullCheck.isNotNull(session.getAttribute("userName").toString())+"',RCRE_TIME=SYSDATE,LCHG_USER_ID='"+NullCheck.isNotNull(session.getAttribute("userName").toString())+"',LCHG_TIME=SYSDATE where REPORT_DATE='"+df.formatdate(NullCheck.isNotNull(request.getParameter("dt2")))+"'");
		
		
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
	
	
	/*detailSUP0100saves*/
	
	
	public String detailSUP0100saves() {
		
		

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


	




