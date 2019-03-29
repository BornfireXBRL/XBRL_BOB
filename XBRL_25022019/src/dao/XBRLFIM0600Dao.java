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
import bean.XBRLFIM0600Bean;
import bean.XBRLFIM0600Bean;
import bean.XBRLPSC0106Bean;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRLFIM0600Dao {
	
	static Logger log = Logger.getLogger(XBRLFIM0600Dao.class);
	public String Reporef;

	public String getReporef() {
		return Reporef;
	}

	public void setReporef(String reporef) {
		Reporef = reporef;
	}
	
	public ArrayList<XBRLFIM0600Dao> ReporefSeq(String dt1, String dt2) {

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

		ArrayList<XBRLFIM0600Dao> arl = new ArrayList<XBRLFIM0600Dao>();
		sql.append("select REPORT_REF_NO from ( select REPORT_REF_NO from FIM0600_S1_MOD_TABLE where REPORT_DATE BETWEEN '"+dt1+"' AND '"+dt2+"') union all ( select REPORT_REF_NO from FIM0600_S3_MOD_TABLE where REPORT_DATE BETWEEN '"+dt1+"' AND '"+dt2+"' )");

		log.info("SELECTPROFILE" + sql.toString());

		try {
			ps = conn.prepareStatement(sql.toString());

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				XBRLFIM0600Dao xel = new XBRLFIM0600Dao();
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
	

public ArrayList<XBRLFIM0600Bean> xbrlfim0600s1(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
		
		
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		ArrayList<XBRLFIM0600Bean> arl = new ArrayList<XBRLFIM0600Bean>();
		
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
		
				
				sql.append("select INSTANCE_NAME,INSTANCE_CODE,VALUE from table(FIM0600_S1_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','MUR'))");
				
		
			log.info("fim0600s1 "+sql.toString());
			
			ps=conn.prepareStatement(sql.toString());
			
		    ResultSet rs=ps.executeQuery();
		     

			while(rs.next()){
				XBRLFIM0600Bean xb=new XBRLFIM0600Bean();
				
					xb.setInstanceName(NullCheck.isNotNull(rs.getString("INSTANCE_NAME")));
					xb.setInstanceCode(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
					xb.setValue(NullCheck.isNotNull(rs.getString("VALUE")));
					
			
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

public ArrayList<XBRLFIM0600Bean> xbrlfim0600s2(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLFIM0600Bean> arl = new ArrayList<XBRLFIM0600Bean>();
	
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
	
			
			sql.append("select INSTANCE_NAME,INSTANCE_CODE,to_char(MID_EXCH_RATE,'9,999,999,999,990.99')MID_EXCH_RATE,to_char(NOTES_COINS,'9,999,999,999,990.99')NOTES_COINS,to_char(LIQUID_BALANCE,'9,999,999,999,990.99')LIQUID_BALANCE,to_char(BALANCE_SALES,'9,999,999,999,990.99')BALANCE_SALES,to_char(BALANCE_ABROAD_BNK,'9,999,999,999,990.99')BALANCE_ABROAD_BNK,to_char(OTH_BALANCE_SALES,'9,999,999,999,990.99')OTH_BALANCE_SALES,to_char(OTH_ASSET,'9,999,999,999,990.99')OTH_ASSET,to_char(SPOT_PURCHASE,'9,999,999,999,990.99')SPOT_PURCHASE,to_char(FORWARD_PURCHASE,'9,999,999,999,990.99')FORWARD_PURCHASE,to_char(OFF_OTH_ASSET,'9,999,999,999,990.99')OFF_OTH_ASSET,to_char(TOTAL_ASSET,'9,999,999,999,990.99')TOTAL_ASSET,to_char(SHORT_TERM_LIAB,'9,999,999,999,990.99')SHORT_TERM_LIAB,to_char(DEP_FC,'9,999,999,999,990.99')DEP_FC,to_char(OTH_LIAB,'9,999,999,999,990.99')OTH_LIAB,to_char(SPOT_SALES,'9,999,999,999,990.99')SPOT_SALES,to_char(FORWARD_SALES,'9,999,999,999,990.99')FORWARD_SALES,to_char(OFF_OTH_LIAB,'9,999,999,999,990.99')OFF_OTH_LIAB,to_char(TOTAL_LIAB,'9,999,999,999,990.99')TOTAL_LIAB,to_char(OPEN_POSITION,'9,999,999,999,990.99')OPEN_POSITION,to_char(OPEN_POSITION_PERCENT,'9,999,999,999,990.99')OPEN_POSITION_PERCENT from table(FIM0600_S2_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','MUR'))");
			
	
		log.info("fim0600s2 "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLFIM0600Bean xb=new XBRLFIM0600Bean();
			
				xb.setInstanceName(NullCheck.isNotNull(rs.getString("INSTANCE_NAME")));
				xb.setInstanceCode(NullCheck.isNotNull(rs.getString("INSTANCE_CODE")));
				xb.setMidExchRate(NullCheck.isNotNull(rs.getString("MID_EXCH_RATE")));
				xb.setNotesCoins(NullCheck.isNotNull(rs.getString("NOTES_COINS")));
				xb.setLiquidBalance(NullCheck.isNotNull(rs.getString("LIQUID_BALANCE")));
				xb.setBalanceSales(NullCheck.isNotNull(rs.getString("BALANCE_SALES")));
				xb.setBalanceAbroadbnk(NullCheck.isNotNull(rs.getString("BALANCE_ABROAD_BNK")));
				xb.setOtherBalanceSales(NullCheck.isNotNull(rs.getString("OTH_BALANCE_SALES")));
				xb.setOtherAsset(NullCheck.isNotNull(rs.getString("OTH_ASSET")));
				xb.setSpotPurchase(NullCheck.isNotNull(rs.getString("SPOT_PURCHASE")));
				xb.setForwardPurchase(NullCheck.isNotNull(rs.getString("FORWARD_PURCHASE")));
				xb.setOffOtherAsset(NullCheck.isNotNull(rs.getString("OFF_OTH_ASSET")));
				xb.setTotalAsset(NullCheck.isNotNull(rs.getString("TOTAL_ASSET")));
				xb.setShortTermLiab(NullCheck.isNotNull(rs.getString("SHORT_TERM_LIAB")));
				xb.setDepFC(NullCheck.isNotNull(rs.getString("DEP_FC")));
				xb.setOtherLiab(NullCheck.isNotNull(rs.getString("OTH_LIAB")));
				xb.setSpotSale(NullCheck.isNotNull(rs.getString("SPOT_SALES")));
				xb.setForwardSale(NullCheck.isNotNull(rs.getString("FORWARD_SALES")));
				xb.setOffOtherLiab(NullCheck.isNotNull(rs.getString("OFF_OTH_LIAB")));
				xb.setTotalLiab(NullCheck.isNotNull(rs.getString("TOTAL_LIAB")));
				xb.setOpenPosition(NullCheck.isNotNull(rs.getString("OPEN_POSITION")));
				xb.setOpenPositionPercent(NullCheck.isNotNull(rs.getString("OPEN_POSITION_PERCENT")));
				
		
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

public ArrayList<XBRLFIM0600Bean> xbrlfim0600s3(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLFIM0600Bean> arl = new ArrayList<XBRLFIM0600Bean>();
	
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
	
			
			sql.append("select SL_NO,INSTITUTE_TYPE,NATURE_OF_TRAN,PURPOSE,ACCT_CRNCY,to_char(OUT_AMT,'9,999,999,999,990.99')OUT_AMT,to_char(EXCHANGE_RATE,'9,999,999,999,990.99')EXCHANGE_RATE,to_char(OUT_AMT_BC,'9,999,999,999,990.99')OUT_AMT_BC from table(FIM0600_S3_RPT_FUN('"+reptype+"','"+ReporefSeq+"','"+dt2+"','"+dt2+"','"+dt2+"','MUR'))");
			
	
		log.info("fim0600s3 "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLFIM0600Bean xb=new XBRLFIM0600Bean();
			
				xb.setSlNo(NullCheck.isNotNull(rs.getString("SL_NO")));
				xb.setInstituteType(NullCheck.isNotNull(rs.getString("INSTITUTE_TYPE")));
				xb.setNatureofTran(NullCheck.isNotNull(rs.getString("NATURE_OF_TRAN")));
				xb.setPurpose(NullCheck.isNotNull(rs.getString("PURPOSE")));
				xb.setAcctCurrency(NullCheck.isNotNull(rs.getString("ACCT_CRNCY")));
				xb.setOutAmt(NullCheck.isNotNull(rs.getString("OUT_AMT")));
				xb.setExchgRate(NullCheck.isNotNull(rs.getString("EXCHANGE_RATE")));
				xb.setOutamtBC(NullCheck.isNotNull(rs.getString("OUT_AMT_BC")));
		
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

public ArrayList<XBRLFIM0600Bean> xbrlfim0600details(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLFIM0600Bean> arl = new ArrayList<XBRLFIM0600Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	 

	try {
	
			
			sql.append("select to_char(REPORT_DATE,'dd-mm-yyyy')REPORT_DATE,CRNCY_CODE,to_char(MID_EXCH_RATE,'9,999,999,999,990.99')MID_EXCH_RATE,to_char(NOTES_COINS,'9,999,999,999,990.99')NOTES_COINS,to_char(LIQUID_BALANCE,'9,999,999,999,990.99')LIQUID_BALANCE,to_char(BALANCE_SALES,'9,999,999,999,990.99')BALANCE_SALES,to_char(BALANCE_ABROAD_BNK,'9,999,999,999,990.99')BALANCE_ABROAD_BNK,to_char(OTH_BALANCE_SALES,'9,999,999,999,990.99')OTH_BALANCE_SALES,to_char(OTH_ASSET,'9,999,999,999,990.99')OTH_ASSET,to_char(SPOT_PURCHASE,'9,999,999,999,990.99')SPOT_PURCHASE,to_char(FORWARD_PURCHASE,'9,999,999,999,990.99')FORWARD_PURCHASE,to_char(OFF_OTH_ASSET,'9,999,999,999,990.99')OFF_OTH_ASSET,to_char(SHORT_TERM_LIAB,'9,999,999,999,990.99')SHORT_TERM_LIAB,to_char(DEP_FC,'9,999,999,999,990.99')DEP_FC,to_char(OTH_LIAB,'9,999,999,999,990.99')OTH_LIAB,to_char(SPOT_SALES,'9,999,999,999,990.99')SPOT_SALES,to_char(FORWARD_SALES,'9,999,999,999,990.99')FORWARD_SALES,to_char(OFF_OTH_LIAB,'9,999,999,999,990.99')OFF_OTH_LIAB from table(FIM0600_S2_DTL_FUN('FIM0600','"+ReporefSeq+"','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','MUR'))");
			
	
		log.info("fim0600detail "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLFIM0600Bean xb=new XBRLFIM0600Bean();
			 xb.setReportDate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
	         xb.setCrncyCode(NullCheck.isNotNull(rs.getString("CRNCY_CODE")));
			 xb.setRate(NullCheck.isNotNull(rs.getString("MID_EXCH_RATE")));
			 xb.setCrncynotesBal(NullCheck.isNotNull(rs.getString("NOTES_COINS")));
			 xb.setNostroacctBal(NullCheck.isNotNull(rs.getString("LIQUID_BALANCE")));
			 xb.setFrwdSalesBal(NullCheck.isNotNull(rs.getString("BALANCE_SALES")));
			 xb.setFcrncyAbroadBal(NullCheck.isNotNull(rs.getString("BALANCE_ABROAD_BNK")));
			 xb.setFcrncyobsastBal(NullCheck.isNotNull(rs.getString("OTH_BALANCE_SALES")));
			 xb.setObsastBal(NullCheck.isNotNull(rs.getString("OTH_ASSET")));
			 xb.setUndlrspotpurBal(NullCheck.isNotNull(rs.getString("SPOT_PURCHASE")));
			 xb.setFrwdPurBal(NullCheck.isNotNull(rs.getString("FORWARD_PURCHASE")));
			 xb.setOobsastBal(NullCheck.isNotNull(rs.getString("OFF_OTH_ASSET")));
			 xb.setShrtTermLiabBal(NullCheck.isNotNull(rs.getString("SHORT_TERM_LIAB")));
			 xb.setFcrncyDepositBal(NullCheck.isNotNull(rs.getString("DEP_FC")));
			 xb.setObsliabBal(NullCheck.isNotNull(rs.getString("OTH_LIAB")));
			 xb.setUbdlrspotsalesBal(NullCheck.isNotNull(rs.getString("SPOT_SALES")));
			 xb.setFrwdSales(NullCheck.isNotNull(rs.getString("FORWARD_SALES")));
			 xb.setOobsliabBal(NullCheck.isNotNull(rs.getString("OFF_OTH_LIAB")));
				
		
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


public ArrayList<XBRLFIM0600Bean> xbrlfim0600details2(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLFIM0600Bean> arl = new ArrayList<XBRLFIM0600Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	 

	try {
	
			
			sql.append("select to_char(REPORT_DATE,'dd-mm-yyyy')REPORT_DATE,CRNCY_CODE,to_char(MID_EXCH_RATE,'9,999,999,999,990.99')MID_EXCH_RATE,to_char(NOTES_COINS,'9,999,999,999,990.99')NOTES_COINS,to_char(LIQUID_BALANCE,'9,999,999,999,990.99')LIQUID_BALANCE,to_char(BALANCE_SALES,'9,999,999,999,990.99')BALANCE_SALES,to_char(BALANCE_ABROAD_BNK,'9,999,999,999,990.99')BALANCE_ABROAD_BNK,to_char(OTH_BALANCE_SALES,'9,999,999,999,990.99')OTH_BALANCE_SALES,to_char(OTH_ASSET,'9,999,999,999,990.99')OTH_ASSET,to_char(SPOT_PURCHASE,'9,999,999,999,990.99')SPOT_PURCHASE,to_char(FORWARD_PURCHASE,'9,999,999,999,990.99')FORWARD_PURCHASE,to_char(OFF_OTH_ASSET,'9,999,999,999,990.99')OFF_OTH_ASSET,to_char(SHORT_TERM_LIAB,'9,999,999,999,990.99')SHORT_TERM_LIAB,to_char(DEP_FC,'9,999,999,999,990.99')DEP_FC,to_char(OTH_LIAB,'9,999,999,999,990.99')OTH_LIAB,to_char(SPOT_SALES,'9,999,999,999,990.99')SPOT_SALES,to_char(FORWARD_SALES,'9,999,999,999,990.99')FORWARD_SALES,to_char(OFF_OTH_LIAB,'9,999,999,999,990.99')OFF_OTH_LIAB from table(FIM0600_S2_DTL_FUN('FIM0600','"+ReporefSeq+"','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','MUR'))");
			
	
		log.info("fim0600detail "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLFIM0600Bean xb=new XBRLFIM0600Bean();
			 xb.setReportDate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
	         xb.setCrncyCode(NullCheck.isNotNull(rs.getString("CRNCY_CODE")));
			 xb.setRate(NullCheck.isNotNull(rs.getString("MID_EXCH_RATE")));
			 xb.setCrncynotesBal(NullCheck.isNotNull(rs.getString("NOTES_COINS")));
			 xb.setNostroacctBal(NullCheck.isNotNull(rs.getString("LIQUID_BALANCE")));
			 xb.setFrwdSalesBal(NullCheck.isNotNull(rs.getString("BALANCE_SALES")));
			 xb.setFcrncyAbroadBal(NullCheck.isNotNull(rs.getString("BALANCE_ABROAD_BNK")));
			 xb.setFcrncyobsastBal(NullCheck.isNotNull(rs.getString("OTH_BALANCE_SALES")));
			 xb.setObsastBal(NullCheck.isNotNull(rs.getString("OTH_ASSET")));
			 xb.setUndlrspotpurBal(NullCheck.isNotNull(rs.getString("SPOT_PURCHASE")));
			 xb.setFrwdPurBal(NullCheck.isNotNull(rs.getString("FORWARD_PURCHASE")));
			 xb.setOobsastBal(NullCheck.isNotNull(rs.getString("OFF_OTH_ASSET")));
			 xb.setShrtTermLiabBal(NullCheck.isNotNull(rs.getString("SHORT_TERM_LIAB")));
			 xb.setFcrncyDepositBal(NullCheck.isNotNull(rs.getString("DEP_FC")));
			 xb.setObsliabBal(NullCheck.isNotNull(rs.getString("OTH_LIAB")));
			 xb.setUbdlrspotsalesBal(NullCheck.isNotNull(rs.getString("SPOT_SALES")));
			 xb.setFrwdSales(NullCheck.isNotNull(rs.getString("FORWARD_SALES")));
			 xb.setOobsliabBal(NullCheck.isNotNull(rs.getString("OFF_OTH_LIAB")));
				
		
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
public ArrayList<XBRLFIM0600Bean> xbrlfim0600details3(String reptype,String instno,String ReporefSeq,String dt2,String dt1,String curr) {
	
	
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	ArrayList<XBRLFIM0600Bean> arl = new ArrayList<XBRLFIM0600Bean>();
	
	String status = "";
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	
	PreparedStatement ps = null;
	
	StringBuffer sql = new StringBuffer();
	
	
	DateFormat df=new DateFormat();		
	dt1 =df.formatdate(dt1);
	dt2 =df.formatdate(dt2);
	
	 

	try {
	
			
			sql.append("select INSTITUTE_TYPE,NATURE_OF_TRANS,PURPOSE,ORG_CRNCY,to_char(AMT_OS_IN_OC,'9,999,999,999,990.99')AMT_OS_IN_OC,EXCG_RATE,to_char(REPORT_DATE,'dd-mm-yyyy')REPORT_DATE from table(FIM0600_S3_DTL_FUN('FIM0600','"+ReporefSeq+"','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','MUR'))");
			
	
		log.info("fim0600detail "+sql.toString());
		
		ps=conn.prepareStatement(sql.toString());
		
	    ResultSet rs=ps.executeQuery();
	     

		while(rs.next()){
			XBRLFIM0600Bean xb=new XBRLFIM0600Bean();
			 xb.setInstype(NullCheck.isNotNull(rs.getString("INSTITUTE_TYPE")));
	         xb.setTrnnat(NullCheck.isNotNull(rs.getString("NATURE_OF_TRANS")));
			 xb.setPrps(NullCheck.isNotNull(rs.getString("PURPOSE")));
			 xb.setOrgcrncy(NullCheck.isNotNull(rs.getString("ORG_CRNCY")));
			 xb.setAmt(NullCheck.isNotNull(rs.getString("AMT_OS_IN_OC")));
			 xb.setExchgrtd(NullCheck.isNotNull(rs.getString("EXCG_RATE")));
			 xb.setRepdt(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
			 
				
		
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
public ArrayList<XBRLFIM0600Bean> xbrlfim4RR(String dt1,String dt2,String reprefno,String instno,String curr) {

HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();

ArrayList<XBRLFIM0600Bean> arl = new ArrayList<XBRLFIM0600Bean>();
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

sql.append("SELECT ACCT_NUMBER,CUST_ID,CUST_NAME,CUST_NRE_FLG,ACCT_CRNCY_CODE,to_char(BAL_LAST_MON_AC, '9,999,999,999,990.99')BAL_LAST_MON_AC,to_char(BAL_CUR_MON_AC, '9,999,999,999,990.99')BAL_CUR_MON_AC,to_char(ACCRU_INT, '9,999,999,999,990.99')ACCRU_INT,ACCT_TYPE,to_char(REPORT_DATE,'DD-MM-YYYY')REPORT_DATE FROM TABLE(FIM0600_S2_DTL_FUN('FIM0600','0','"+instno+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");	
log.info("DOC&&&&SELECT Gayu"+sql.toString());
try {
ps=conn.prepareStatement(sql.toString());

    ResultSet rs=ps.executeQuery();
     

while(rs.next()){

XBRLFIM0600Bean xb=new XBRLFIM0600Bean();

/*xb.setActnum(NullCheck.isNotNull(rs.getString("ACCT_NUMBER")));
xb.setCusid(NullCheck.isNotNull(rs.getString("CUST_ID")));
xb.setCusnam(NullCheck.isNotNull(rs.getString("CUST_NAME")));
xb.setCusnrflg(NullCheck.isNotNull(rs.getString("CUST_NRE_FLG")));
xb.setAccurcode(NullCheck.isNotNull(rs.getString("ACCT_CRNCY_CODE")));
xb.setBalastmon(NullCheck.isNotNull(rs.getString("BAL_LAST_MON_AC")));
xb.setBalcurmon(NullCheck.isNotNull(rs.getString("BAL_CUR_MON_AC")));
xb.setAccrint(NullCheck.isNotNull(rs.getString("ACCRU_INT")));
xb.setAccrtyp(NullCheck.isNotNull(rs.getString("ACCT_TYPE")));
	
xb.setReportdate(NullCheck.isNotNull(rs.getString("REPORT_DATE")));
*/



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





public String detailFIM0600saves() {

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
