package dao;


import java.sql.CallableStatement;
import org.apache.log4j.Logger;

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
import utilities.ConnectionManager;
import utilities.NullCheck;
import bean.XBRLBLS0106Bean;
import bean.XBRLCRR0100Bean;
import bean.XBRLFIM0300Bean;
import bean.XBRLFIM0300Bean;
public class XBRLFIM0300Dao {
	
	static Logger log = Logger.getLogger(XBRLFIM0300Dao.class);

	private String currencycode;
	
	public String getCurrencycode() {
		return currencycode;
	}
	public void setCurrencycode(String currencycode) {
		this.currencycode = currencycode;
	}


	
	public String Reporef;
	
	public String getReporef() {
		return Reporef;
	}

	public void setReporef(String reporef) {
		Reporef = reporef;
	}
	
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
	
	/*************************Details fim0300***********************/
	
	public String detailFIM0300savecheck() {
		ConnectionManager connmgr=new ConnectionManager();
		Connection conn=connmgr.getConnection();
		ArrayList<String> arl = new ArrayList<String>();
				HttpServletRequest request = ServletActionContext.getRequest();
				DateFormat df = new DateFormat();
				StringBuffer sql = new StringBuffer();
				PreparedStatement ps = null;
				
				sql.append("SELECT COUNT(REPORT_DATE) as repdate FROM FIM0300_RPT_TB where REPORT_ID = '"+request.getParameter("reptype")+"' AND  REPORT_DATE = '"+df.formatdate(request.getParameter("dt2"))+"' ");
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
	
	public String detailFIM0300saves() {

		ConnectionManager connmgr=new ConnectionManager();
		Connection conn=connmgr.getConnection();
				HttpServletRequest request = ServletActionContext.getRequest();
				DateFormat df = new DateFormat();
				System.out.println("khjg");
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
	
		
	public ArrayList<XBRLFIM0300Bean> xbrlFIM0300ajaxdetails(String repname,String reprefno,String instno,String dt2,String curr) {
			
		
		log.info("+++++++++++++++==================================++++++++++++++++++++++++");
				
				
	log.info("repname    " + repname + "reprefno   "  + reprefno + "instno"+ instno +"dt2   " + dt2 +"currency" +curr);


			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			
			ArrayList<XBRLFIM0300Bean> arl = new ArrayList<XBRLFIM0300Bean>();
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
			
				
			//	log.info("AJAX DETAILS " + reprefno );
				
				sql.append("SELECT   COUNTRY_CODE,CURRENCY_CODE,to_char(UNITS, '9,999,999,999,990.99')UNITS,to_char(TTB_RATE, '9,999,999,999,990.99')TTB_RATE,to_char(TTS_RATE, '9,999,999,999,990.99')TTS_RATE,to_char(TCB_RATE, '9,999,999,999,990.99')TCB_RATE,to_char(NTB_RATE, '9,999,999,999,990.99')NTB_RATE,to_char(NTC_RATE, '9,999,999,999,990.99')NTC_RATE FROM TABLE(FIM0300_RPT_FUN('FIM0300','"+chk.notZero(reprefno)+"','"+dt2+"','"+dt2+"','"+dt2+"','"+curr+"'))");			
				
				log.info("BLS  "+sql.toString());
				
				ps=conn.prepareStatement(sql.toString());
				
			    ResultSet rs=ps.executeQuery();
			     

				while(rs.next()){
					//log.info("whileee");
									
					 
					XBRLFIM0300Bean xb=new XBRLFIM0300Bean();
					
					
					
					xb.setCountry(NullCheck.isNotNull(rs.getString("COUNTRY_CODE")));
					xb.setCurrencycode(NullCheck.isNotNull(rs.getString("CURRENCY_CODE")));
					xb.setUnits(NullCheck.isNotNull(rs.getString("UNITS")));	
					xb.setTtbrate(NullCheck.isNotNull(rs.getString("TTB_RATE")));
					
					xb.setTtsrate(NullCheck.isNotNull(rs.getString("TTS_RATE")));
					xb.setNtbrate(NullCheck.isNotNull(rs.getString("NTB_RATE")));
					
					xb.setTcbrate(NullCheck.isNotNull(rs.getString("TCB_RATE")));
					
					xb.setNtcrate(NullCheck.isNotNull(rs.getString("NTC_RATE")));
					
				
			
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



public String resalert;
public String getResalert() {
	return resalert;
}

public void setResalert(String resalert) {
	this.resalert = resalert;
}
public String modFIM0300cancel() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	
	sql.append("DELETE FROM FIM0300_MOD_TABLE WHERE  COUNTRY_CODE='"+NullCheck.isNotNull(request.getParameter("country"))+"'");
	
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


public String FIM0300chckmodified() {

	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	HttpSession session = request.getSession();
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	if(request.getParameter("type").equals("chkuser")) {
		sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM FIM0300_MOD_TABLE ");
		log.info("bj"+sql.toString());
		}else {
			sql.append("SELECT COUNT(REPORT_DATE)AS CNT FROM FIM0300_MOD_TABLE ");
			log.info("bh"+sql.toString());
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

public ArrayList<XBRLFIM0300Bean> FIM0300verify(){
	
	ArrayList<XBRLFIM0300Bean> arl = new ArrayList<XBRLFIM0300Bean>();
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();		
	sql.setLength(0);
	sql.append("SELECT COUNTRY_CODE,CURRENCY_CODE,to_char(UNITS, '9,999,999,999,990.99')UNITS,to_char(TTB_RATE, '9,999,999,999,990.99')TTB_RATE,to_char(TTS_RATE, '9,999,999,999,990.99')TTS_RATE,to_char(TCB_RATE, '9,999,999,999,990.99')TCB_RATE,to_char(NTB_RATE, '9,999,999,999,990.99')NTB_RATE,to_char(NTS_RATE, '9,999,999,999,990.99')NTS_RATE,DECODE(DEL_FLG,'A','Added','M','Modified','D','Deleted') as DEL_FLG ,LCHG_USER_ID FROM FIM0300_MOD_TABLE");
	log.info("GH"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		XBRLFIM0300Bean xb=new XBRLFIM0300Bean();

		
		xb.setCountry(NullCheck.isNotNull(rs.getString("COUNTRY_CODE")));
		xb.setCurrencycode(NullCheck.isNotNull(rs.getString("CURRENCY_CODE")));
		xb.setUnits(NullCheck.isNotNull(rs.getString("UNITS")));	
		xb.setTtbrate(NullCheck.isNotNull(rs.getString("TTB_RATE")));
		
		xb.setTtsrate(NullCheck.isNotNull(rs.getString("TTS_RATE")));
		xb.setNtbrate(NullCheck.isNotNull(rs.getString("NTB_RATE")));
		
		xb.setTcbrate(NullCheck.isNotNull(rs.getString("TCB_RATE")));
		
		xb.setNtcrate(NullCheck.isNotNull(rs.getString("NTS_RATE")));
	
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

public String FIM0300verifymaster() {
	String status="";
	HttpServletRequest request = ServletActionContext.getRequest();
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	PreparedStatement ps = null;
	HttpSession session = request.getSession();
	StringBuffer sql = new StringBuffer();
	DateFormat df=new DateFormat();	
	
	//------------------get data from mod table---------------------
	XBRLFIM0300Bean xb=new XBRLFIM0300Bean();
	System.out.println("fdjhf");
	sql.setLength(0);
	sql.append("SELECT  COUNTRY_CODE,CURRENCY_CODE,to_char(UNITS, '9,999,999,999,990.99')UNITS,to_char(TTB_RATE, '9,999,999,999,990.99')TTB_RATE,to_char(TTS_RATE, '9,999,999,999,990.99')TTS_RATE,to_char(TCB_RATE, '9,999,999,999,990.99')TCB_RATE,to_char(NTB_RATE, '9,999,999,999,990.99')NTB_RATE,to_char(NTS_RATE, '9,999,999,999,990.99')NTS_RATE,DEL_FLG,LCHG_USER_ID FROM FIM0300_MOD_TABLE "
			+ "WHERE COUNTRY_CODE='"+NullCheck.isNotNull(request.getParameter("country"))+"'  ");
	log.info("Gayu"+sql.toString());
	try {
	ps=conn.prepareStatement(sql.toString());
	
    ResultSet rs=ps.executeQuery();
     

	while(rs.next()){
		

		xb.setCountry(NullCheck.isNotNull(rs.getString("COUNTRY_CODE")));
		xb.setCurrencycode(NullCheck.isNotNull(rs.getString("CURRENCY_CODE")));
		xb.setUnits(NullCheck.isNotNull(rs.getString("UNITS")));	
		xb.setTtbrate(NullCheck.isNotNull(rs.getString("TTB_RATE")));
		
		xb.setTtsrate(NullCheck.isNotNull(rs.getString("TTS_RATE")));
		xb.setNtbrate(NullCheck.isNotNull(rs.getString("NTB_RATE")));
		
		xb.setTcbrate(NullCheck.isNotNull(rs.getString("TCB_RATE")));
		
		xb.setNtcrate(NullCheck.isNotNull(rs.getString("NTS_RATE")));
	
			
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
		sql.
		append("INSERT INTO FIM0300_MAST_TABLE(COUNTRY_CODE,CURRENCY_CODE,UNITS,TTB_RATE,TCB_RATE,NTB_RATE,TTS_RATE,NTS_RATE,DEL_FLG,LCHG_USER_ID,LCHG_TIME,VERIFY_USER_ID,VERIFY_TIME)" + "VALUES ('"
                +"values('" + request.getParameter("country")
		          + "','" + request.getParameter("currencycode") + "','" + request.getParameter("units") + "','"
		           + request.getParameter("ttbrate") + "','" + request.getParameter("tcbrate") + "','"
			      	+request.getParameter("ntbrate")+ "','"+ request.getParameter("ttsrate") + "','"
					+ request.getParameter("ntcrate") + "','"+xb.getModtyp()+"','" + session.getAttribute("userName")
													+ "',SYSDATE,'"+ session.getAttribute("userName")+"',SYSDATE)");
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("DELETE FROM FIM0300_MOD_TABLE WHERE  COUNTRY_CODE ='" + request.getParameter("country") +"' ");
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
		sql.append("UPDATE FIM0300_MAST_TABLE SET CURRENCY_CODE='" + request.getParameter("currencycode")
		+ "', UNITS ='" + request.getParameter("units")
		+ "', TTB_RATE='" + request.getParameter("ttbrate")
		+ "', TCB_RATE ='" + request.getParameter("tcbrate")
		+ "', NTB_RATE ='" + request.getParameter("ntbrate")
		+ "', TTS_RATE ='" +request.getParameter("ttsrate")
		+ "', NTS_RATE  ='" + request.getParameter("ntcrate") + "',VERIFY_USER_ID='"+session.getAttribute("userName")+"',VERIFY_TIME=SYSDATE WHERE COUNTRY_CODE='"+NullCheck.isNotNull(request.getParameter("country"))+"'  ");
		
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("DELETE FROM FIM0300_MOD_TABLE WHERE   COUNTRY_CODE='"+NullCheck.isNotNull(request.getParameter("country"))+"'");
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
		sql.append("DELETE FROM FIM0300_MAST_TABLE WHERE   COUNTRY_CODE='"+NullCheck.isNotNull(request.getParameter("country"))+"'");
		
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			
		    int rs=0;
		    rs=ps.executeUpdate();
		     
		    status="success";
		    
		    sql.setLength(0);
		    sql.append("UPDATE FIM0300_MOD_TABLE SET LCHG_USER_ID='"+session.getAttribute("userName")+"' WHERE   COUNTRY_CODE='"+NullCheck.isNotNull(request.getParameter("country"))+"'");
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
		    sql.append("DELETE FROM FIM0300_MOD_TABLE WHERE  COUNTRY_CODE='"+NullCheck.isNotNull(request.getParameter("country"))+"'");
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

	

