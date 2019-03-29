package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;


import bean.XBRL_REPREF_MAPPINGBean;
import utilities.ConnectionManager;
import utilities.NullCheck;
import org.apache.log4j.Logger;
public class XBRL_REPREF_MAPPINGDao {
	static Logger log = Logger.getLogger(XBRL_REPREF_MAPPINGDao.class);
	
	public ArrayList<XBRL_REPREF_MAPPINGBean> repdetails(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();  
		ArrayList<XBRL_REPREF_MAPPINGBean> arl= new ArrayList<XBRL_REPREF_MAPPINGBean> ();
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();
		
if(request.getParameter("typ").trim().toLowerCase().equals("repnum")) {
	
	sql.append("select distinct report_code from xbrl_rep_ref_code_table join all_tab_cols on report_code=column_name and owner=user and table_name='XBRL_RRC_MAP_TABLE' ");
}else if(request.getParameter("typ").trim().toLowerCase().equals("replvl")) {
	sql.append("SELECT DISTINCT (REF_LEVEL) FROM XBRL_REP_REF_CODE_TABLE WHERE REPORT_CODE='"+request.getParameter("repnum")+"'");
}else if(request.getParameter("typ").trim().toLowerCase().equals("refcode")) {
	sql.append("SELECT DISTINCT (REF_CODE),REPORT_NAME,REF_DESC_1,REF_DESC_2,REF_DESC_3 FROM XBRL_REP_REF_CODE_TABLE WHERE REPORT_CODE='"+request.getParameter("repnum")+"' AND REF_LEVEL='"+request.getParameter("replvl")+"'");
}else if(request.getParameter("typ").trim().toLowerCase().equals("repnumnew")) {
	
	sql.append("select distinct report_code from xbrl_rep_ref_code_table minus select column_name from all_tab_cols where owner=user and table_name='XBRL_RRC_MAP_TABLE' ");
}
	try{
		log.info(sql.toString());
		ps = conn.prepareStatement(sql.toString());
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			XBRL_REPREF_MAPPINGBean rmb=new XBRL_REPREF_MAPPINGBean();
			if(request.getParameter("typ").trim().toLowerCase().equals("repnum")) {
			rmb.setRepnum(NullCheck.isNotNull(rs.getString("REPORT_CODE")));
			}else if(request.getParameter("typ").trim().toLowerCase().equals("replvl")) {
				rmb.setReplvl(NullCheck.isNotNull(rs.getString("REF_LEVEL")));
			}else if(request.getParameter("typ").trim().toLowerCase().equals("refcode")) {
				rmb.setRefcode(NullCheck.isNotNull(rs.getString("REF_CODE")));
				rmb.setRepname(NullCheck.isNotNull(rs.getString("REPORT_NAME")));
				rmb.setRefdesc1(NullCheck.isNotNull(rs.getString("REF_DESC_1")));
				rmb.setRefdesc2(NullCheck.isNotNull(rs.getString("REF_DESC_2")));
				rmb.setRefdesc3(NullCheck.isNotNull(rs.getString("REF_DESC_3")));
			}else if(request.getParameter("typ").trim().toLowerCase().equals("repnumnew")) {
				rmb.setRepnum(NullCheck.isNotNull(rs.getString("REPORT_CODE")));
				}
			arl.add(rmb);
		}
	}catch(SQLException e) {
		e.printStackTrace();
	}
		return arl;
	}
	
	
	public int refcodeupdate(XBRL_REPREF_MAPPINGBean rmb,String type) {
		String status="";
		String cn1="";
		String cn2="";
		String cn3="";
		String cn4="";
		String cn5="";
	String cn6="";
	String cn7="";
	
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();
		if(type.equals("edit")) {
			rmb.setActno1(NullCheck.isNotNull(rmb.getActno1()));//
			rmb.setActno2(NullCheck.isNotNull(rmb.getActno2()));
			rmb.setCustid1(NullCheck.isNotNull(rmb.getCustid1()));//
			rmb.setCustid2(NullCheck.isNotNull(rmb.getCustid2()));
			rmb.setEntityflg(NullCheck.isNotNull(rmb.getEntityflg()));
			rmb.setFinrefcode1(NullCheck.isNotNull(rmb.getFinrefcode1()));
			rmb.setFinrefcode2(NullCheck.isNotNull(rmb.getFinrefcode2()));
			rmb.setGlhead1(NullCheck.isNotNull(rmb.getGlhead112()));//
			rmb.setGlhead2(NullCheck.isNotNull(rmb.getGlhead2()));
			rmb.setRefcode(NullCheck.isNotNull(rmb.getRefcode()));
			rmb.setReplvl(NullCheck.isNotNull(rmb.getReplvl2()));//
			rmb.setRepnum(NullCheck.isNotNull(rmb.getRepnum2()));//
			
			rmb.setSchmcode(NullCheck.isNotNull(rmb.getSchmcode12()));//
			rmb.setSchmtyp(NullCheck.isNotNull(rmb.getSymtyp12()));//
		}else {
			rmb.setActno1(NullCheck.isNotNull(rmb.getActno1()));
			rmb.setActno2(NullCheck.isNotNull(rmb.getActno2()));
			rmb.setCustid1(NullCheck.isNotNull(rmb.getCustid1()));
			rmb.setCustid2(NullCheck.isNotNull(rmb.getCustid2()));
			rmb.setEntityflg(NullCheck.isNotNull(rmb.getEntityflg()));
			rmb.setFinrefcode1(NullCheck.isNotNull(rmb.getFinrefcode1()));
			rmb.setFinrefcode2(NullCheck.isNotNull(rmb.getFinrefcode2()));
			rmb.setGlhead1(NullCheck.isNotNull(rmb.getGlhead1()));
			rmb.setGlhead2(NullCheck.isNotNull(rmb.getGlhead2()));
			rmb.setRefcode(NullCheck.isNotNull(rmb.getRefcode()));
			rmb.setReplvl(NullCheck.isNotNull(rmb.getReplvl()));
			if(rmb.getAddtype().equals("newreport")) {
				rmb.setRepnum(NullCheck.isNotNull(rmb.getRepnum2()));
			}else {
				rmb.setRepnum(NullCheck.isNotNull(rmb.getRepnum()));
			}
		
			rmb.setSchmcode(NullCheck.isNotNull(rmb.getSchmcode()));
			rmb.setSchmtyp(NullCheck.isNotNull(rmb.getSchmtyp()));
		}
		
		String entflg="";
		int rs =0;
		if(!rmb.getActno1().equals("")) {
			cn6=" and ACCT_NO='"+rmb.getActno1()+"'";
		}
		if(!rmb.getActno2().equals("")) {
			cn6=" and ACCT_NO BETWEEN '"+rmb.getActno1()+"' AND '"+rmb.getActno2()+"'";
		}
		
		if(rmb.getEntityflg().toLowerCase().equals("customer")) {
			entflg="C";
		}else {
			entflg="A";
		}
		
		if(!rmb.getSchmtyp().equals("")) {
			cn1=" and SCH_TYPE='"+rmb.getSchmtyp()+"'";
		}
		if(!rmb.getGlhead1().equals("")) {
			cn2=" and GLSL_CODE='"+rmb.getGlhead1()+"'  ";
		}if(!rmb.getGlhead2().equals("")) {
			cn2=" and GLSL_CODE='"+rmb.getGlhead2()+"'  ";
		}if(!rmb.getGlhead1().equals("") && !rmb.getGlhead2().equals("")) {
			cn2=" and GLSL_CODE BETWEEN '"+rmb.getGlhead1()+"' AND '"+rmb.getGlhead2()+"'";
		}
		if(!rmb.getSchmcode().equals("")) {
			cn4=" and SCH_CODE='"+rmb.getSchmcode()+"'";
		}
		if(!rmb.getFinrefcode1().equals("")) {
			cn5=" and FIN_REF_CODE='"+rmb.getFinrefcode1()+"'";
		}
		
		
		if(rmb.getEntityflg().toLowerCase().equals("customer")) {
		sql.append("UPDATE XBRL_RRC_MAP_TABLE SET "+rmb.getRepnum()+"='"+rmb.getRefcode().split("/")[0]+"' WHERE CUST_ID BETWEEN '"+rmb.getCustid1()+"' and '"+rmb.getCustid2()+"' AND ENTITY_FLG='"+entflg+"'");
		}else {
					sql.append("UPDATE XBRL_RRC_MAP_TABLE SET "+rmb.getRepnum()+"='"+rmb.getRefcode().split("/")[0]+"' WHERE ENTITY_FLG='A'"+cn1+cn2+cn3+cn4+cn5+cn6);	
					
				}
		try{
			log.info(sql.toString());
			ps = conn.prepareStatement(sql.toString());
			 rs = ps.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	
	public ArrayList<XBRL_REPREF_MAPPINGBean> entitydet(){
		HttpServletRequest request = ServletActionContext.getRequest();
		
		ArrayList<XBRL_REPREF_MAPPINGBean> arl= new ArrayList<XBRL_REPREF_MAPPINGBean> ();
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();
		String cn1="";
		String cn2="";
		String cn3="";
		String cn4="";
		String cn5="";
		String cn6="";
		String accno1=NullCheck.isNotNull(request.getParameter("acc1"));
		String accno2=NullCheck.isNotNull(request.getParameter("acc2"));
		String schmtype=NullCheck.isNotNull(request.getParameter("schmtyp"));
		String glhead1=NullCheck.isNotNull(request.getParameter("glhead1"));
		String glhead2=NullCheck.isNotNull(request.getParameter("glhead2"));
		String schmcode=NullCheck.isNotNull(request.getParameter("schmcode"));
		String finrefcode=NullCheck.isNotNull(request.getParameter("finrefcode"));
		
		if(!accno1.equals("")) {
			cn1=" ACCT_NO='"+accno1+"'";
			log.info(cn1);
		}
		if(!accno2.equals("")) {
			cn1=" ACCT_NO BETWEEN  '"+accno1+"' AND '"+accno2+"' ";
		}if(!glhead1.equals("")) {
			cn2=" and GLSL_CODE='"+glhead1+"'  ";
		}if(!glhead1.equals("") && !glhead2.equals("")) {
			cn2=" and GLSL_CODE BETWEEN '"+glhead1+"' AND '"+glhead2+"'";
		}
		if(!glhead1.equals("") && !glhead2.equals("") && request.getParameter("type").equals("schemecode3") ) {
			cn2=" GLSL_CODE BETWEEN '"+glhead1+"' AND '"+glhead2+"'";
		}
		if(!schmcode.equals("")) {
			cn4=" and SCH_CODE='"+schmcode+"'";
		}
		if(!finrefcode.equals("")) {
			cn5=" and FIN_REF_CODE='"+finrefcode+"'";
		}
		if(!schmtype.equals("")) {
			cn3="and SCH_TYPE='"+schmtype+"'";
		}
		if(request.getParameter("type").equals("schemetype")) {
		
			cn6="DISTINCT (SCH_TYPE) ";
		}else if(request.getParameter("type").equals("glheadcode1")) {
			cn6="DISTINCT (GLSL_CODE)";
		}else if(request.getParameter("type").equals("glheadcode2")) {
			cn6="DISTINCT (GLSL_CODE)";
		}else if(request.getParameter("type").equals("schemecode1") || request.getParameter("type").equals("schemecode2") || request.getParameter("type").equals("schemecode3")) {
			cn6="DISTINCT (SCH_CODE)";
		}else if(request.getParameter("type").equals("finaclefefcode")) {
			cn6="DISTINCT (FIN_REF_CODE)";
		}
		
if(request.getParameter("type").equals("schmtyp")) {
	sql.append("SELECT DISTINCT (SCH_TYPE) FROM XBRL_RRC_MAP_TABLE ");
}else if(request.getParameter("type").equals("glhead1")) {
	sql.append("SELECT DISTINCT (GLSL_CODE) FROM XBRL_RRC_MAP_TABLE WHERE SCH_TYPE='"+request.getParameter("schmtyp")+"' ORDER BY GLSL_CODE");
}else if(request.getParameter("type").equals("glhead2")) {
	sql.append("SELECT DISTINCT (GLSL_CODE) FROM XBRL_RRC_MAP_TABLE WHERE SCH_TYPE='"+request.getParameter("schmtyp")+"' AND GLSL_CODE > '"+request.getParameter("glhead1")+"' ORDER BY GLSL_CODE");
}else if(request.getParameter("type").equals("schcode1")) {
	sql.append("SELECT DISTINCT (SCH_CODE) FROM XBRL_RRC_MAP_TABLE WHERE SCH_TYPE='"+request.getParameter("schmtyp")+"' AND GLSL_CODE = '"+request.getParameter("glhead1")+"' ");
}else if(request.getParameter("type").equals("schcode2")) {
	sql.append("SELECT DISTINCT (SCH_CODE) FROM XBRL_RRC_MAP_TABLE WHERE SCH_TYPE='"+request.getParameter("schmtyp")+"' AND GLSL_CODE BETWEEN '"+request.getParameter("glhead1")+"' AND '"+request.getParameter("glhead2")+"'");
}else if(request.getParameter("type").equals("finrefcode1") && !request.getParameter("glhead2").equals("")) {
	sql.append("SELECT DISTINCT (FIN_REF_CODE) FROM XBRL_RRC_MAP_TABLE WHERE SCH_TYPE='"+request.getParameter("schmtyp")+"' AND GLSL_CODE BETWEEN '"+request.getParameter("glhead1")+"' AND '"+request.getParameter("glhead2")+"' AND SCH_CODE='"+request.getParameter("schcode")+"'");
}else if(request.getParameter("type").equals("finrefcode1") && request.getParameter("glhead2").equals("")) {
	sql.append("SELECT DISTINCT (FIN_REF_CODE) FROM XBRL_RRC_MAP_TABLE WHERE SCH_TYPE='"+request.getParameter("schmtyp")+"' AND GLSL_CODE ='"+request.getParameter("glhead1")+"' AND SCH_CODE='"+request.getParameter("schcode")+"'");
}else if(request.getParameter("type").equals("finrefcode")) {
	sql.append("SELECT DISTINCT (FIN_REF_CODE) FROM XBRL_RRC_MAP_TABLE ");
}else if(request.getParameter("type").equals("glhead")) {
	sql.append("SELECT DISTINCT (GLSL_CODE) FROM XBRL_RRC_MAP_TABLE ORDER BY GLSL_CODE");
}else if(request.getParameter("type").equals("schcode")) {
	sql.append("SELECT DISTINCT (SCH_CODE) FROM XBRL_RRC_MAP_TABLE ");
}else if(request.getParameter("type").equals("finrefcode")) {
	sql.append("SELECT DISTINCT (FIN_REF_CODE) FROM XBRL_RRC_MAP_TABLE WHERE SCH_CODE='"+request.getParameter("schcode")+"'");
}else if(request.getParameter("type").equals("glhead3")) {
	sql.append("SELECT DISTINCT (GLSL_CODE) FROM XBRL_RRC_MAP_TABLE WHERE GLSL_CODE > '"+request.getParameter("glhead1")+"' ORDER BY GLSL_CODE");
}else if(request.getParameter("type").equals("schcode3")) {
	sql.append("SELECT DISTINCT (SCH_CODE) FROM XBRL_RRC_MAP_TABLE WHERE  GLSL_CODE = '"+request.getParameter("glhead1")+"'");
}else  {
	
	sql.append("SELECT "+cn6+" FROM XBRL_RRC_MAP_TABLE WHERE "+cn1+cn2+cn3+cn4+cn5+"");
}

	try{
		log.info(sql.toString());
		ps = conn.prepareStatement(sql.toString());
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			XBRL_REPREF_MAPPINGBean rmb=new XBRL_REPREF_MAPPINGBean();
			if(request.getParameter("type").equals("schmtyp")) {
			rmb.setSchmtyp(NullCheck.isNotNull(rs.getString("SCH_TYPE")));
			}else if(request.getParameter("type").equals("glhead1")) {
				rmb.setGlhead1(NullCheck.isNotNull(rs.getString("GLSL_CODE")));
			}else if(request.getParameter("type").equals("glhead2")) {
				rmb.setGlhead2(NullCheck.isNotNull(rs.getString("GLSL_CODE")));
			}else if(request.getParameter("type").equals("schcode1")) {
				rmb.setSchmcode(NullCheck.isNotNull(rs.getString("SCH_CODE")));
			}else if(request.getParameter("type").equals("schcode2")) {
				rmb.setSchmcode(NullCheck.isNotNull(rs.getString("SCH_CODE")));
			}else if(request.getParameter("type").equals("schcode3")) {
				rmb.setSchmcode(NullCheck.isNotNull(rs.getString("SCH_CODE")));
			}else if(request.getParameter("type").equals("finrefcode1")) {
				rmb.setFinrefcode1(NullCheck.isNotNull(rs.getString("FIN_REF_CODE")));
			}else if(request.getParameter("type").equals("finrefcode")) {
				rmb.setFinrefcode1(NullCheck.isNotNull(rs.getString("FIN_REF_CODE")));
			}else if(request.getParameter("type").equals("glhead")) {
				rmb.setGlhead1(NullCheck.isNotNull(rs.getString("GLSL_CODE")));
			}else if(request.getParameter("type").equals("schcode")) {
				rmb.setSchmcode(NullCheck.isNotNull(rs.getString("SCH_CODE")));
			}else if(request.getParameter("type").equals("finrefcode")) {
				rmb.setFinrefcode1(NullCheck.isNotNull(rs.getString("FIN_REF_CODE")));
			}else if(request.getParameter("type").equals("glhead3")) {
				rmb.setGlhead2(NullCheck.isNotNull(rs.getString("GLSL_CODE")));
			}else if(request.getParameter("type").equals("schemetype")) {
				rmb.setSchmtyp(NullCheck.isNotNull(rs.getString("SCH_TYPE")));
			}else if(request.getParameter("type").equals("glheadcode1")) {
				rmb.setGlhead1(NullCheck.isNotNull(rs.getString("GLSL_CODE")));
				
			}else if(request.getParameter("type").equals("glheadcode2")) {
				rmb.setGlhead2(NullCheck.isNotNull(rs.getString("GLSL_CODE")));
			}else if(request.getParameter("type").equals("schemecode1")) {
				rmb.setSchmcode(NullCheck.isNotNull(rs.getString("SCH_CODE")));
			}else if(request.getParameter("type").equals("schemecode2") || request.getParameter("type").equals("schemecode3")) {
				rmb.setSchmcode(NullCheck.isNotNull(rs.getString("SCH_CODE")));
			}else if(request.getParameter("type").equals("finaclefefcode")) {
				rmb.setFinrefcode1(NullCheck.isNotNull(rs.getString("FIN_REF_CODE")));
			}
			arl.add(rmb);
		}
	}catch(SQLException e) {
		e.printStackTrace();
	}
		return arl;
	}
	
	
	
	
	public int actvali() {
		int cnt=0;
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();  
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();
		if(request.getParameter("acctyp").equals("acctyp1")) {
			sql.append("SELECT COUNT(*)as cnt FROM XBRL_RRC_MAP_TABLE WHERE ACCT_NO='"+request.getParameter("acct")+"'");
		}else {
		sql.append("SELECT COUNT(*)as cnt FROM XBRL_RRC_MAP_TABLE WHERE ACCT_NO='"+request.getParameter("acct")+"' and ACCT_NO > '"+request.getParameter("acct1")+"' ");
		}
		try{
			log.info(sql.toString());
			ps = conn.prepareStatement(sql.toString());
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
			cnt=Integer.parseInt(rs.getString("cnt"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	return cnt;	
	}
	
	public int custvali() {
		int cnt=0;
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();  
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();
		if(request.getParameter("custyp").equals("cust1")) {
			sql.append("SELECT COUNT(*)as cnt FROM XBRL_RRC_MAP_TABLE WHERE CUST_ID='"+request.getParameter("cust")+"'");
		}else {
		sql.append("SELECT COUNT(*)as cnt FROM XBRL_RRC_MAP_TABLE WHERE CUST_ID='"+request.getParameter("cust1")+"' and CUST_ID > '"+request.getParameter("cust")+"' ");
		}
		try{
			log.info(sql.toString());
			ps = conn.prepareStatement(sql.toString());
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
			cnt=Integer.parseInt(rs.getString("cnt"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	return cnt;	
	}
	
	
	
	public int upcount() {
		int cnt=0;
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();  
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();
		String cn1="";
		String cn2="";
		String cn3="";
		String cn4="";
		String cn5="";
		String cn6="";
		
		String cust1=NullCheck.isNotNull(request.getParameter("cust1"));
		String cust2=NullCheck.isNotNull(request.getParameter("cust2"));
		String accno1=NullCheck.isNotNull(request.getParameter("acc1"));
		String accno2=NullCheck.isNotNull(request.getParameter("acc2"));
		String schmtype=NullCheck.isNotNull(request.getParameter("schmtyp"));
		String glhead1=NullCheck.isNotNull(request.getParameter("glhead1"));
		String glhead2=NullCheck.isNotNull(request.getParameter("glhead2"));
		String schmcode=NullCheck.isNotNull(request.getParameter("schmcode"));
		String finrefcode=NullCheck.isNotNull(request.getParameter("finrefcode"));
		String entflg="";
		if(request.getParameter("entflg").toLowerCase().equals("customer")) {
			entflg="C";
		}else {
			entflg="A";
		}
		if(!cust1.equals("")) {
			cn6=" and CUST_ID='"+cust1+"'";
			log.info(cn1);
		}
		if(!cust2.equals("")) {
			cn6=" and CUST_ID BETWEEN  '"+cust1+"' AND '"+cust2+"' ";
		}
		if(!accno1.equals("")) {
			cn1=" and ACCT_NO='"+accno1+"'";
			log.info(cn1);
		}
		if(!accno2.equals("")) {
			cn1=" and ACCT_NO BETWEEN  '"+accno1+"' AND '"+accno2+"' ";
		}if(!glhead1.equals("")) {
			cn2=" and GLSL_CODE='"+glhead1+"'  ";
		}if(!glhead1.equals("") && !glhead2.equals("")) {
			cn2=" and GLSL_CODE BETWEEN '"+glhead1+"' AND '"+glhead2+"'";
		}
		if(!schmcode.equals("")) {
			cn4=" and SCH_CODE='"+schmcode+"'";
		}
		if(!finrefcode.equals("")) {
			cn5=" and FIN_REF_CODE='"+finrefcode+"'";
		}
		if(!schmtype.equals("")) {
			cn3=" and SCH_TYPE='"+schmtype+"'";
		}
		
			sql.append("SELECT COUNT(*)as cnt FROM XBRL_RRC_MAP_TABLE WHERE ENTITY_FLG='"+entflg+"' "+cn1+cn2+cn3+cn4+cn5+cn6+" ");
		
		try{
			log.info(sql.toString());
			ps = conn.prepareStatement(sql.toString());
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
			cnt=Integer.parseInt(rs.getString("cnt"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	return cnt;	
	}
	
	
	
	
	public String repupdatecol() {
		int rs=0;
		String status="";
		HttpServletRequest request = ServletActionContext.getRequest();
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();
		sql.append("ALTER TABLE XBRL_RRC_MAP_TABLE ADD "+request.getParameter("repnum")+" varchar2(15) ");
		try {
			log.info(sql.toString());
			ps=conn.prepareStatement(sql.toString());
			rs=ps.executeUpdate();
			status="success";
		}catch(SQLException e) {
			e.printStackTrace();
			status="error";
		}
		
		return status;
	}
	
	
	public ArrayList<XBRL_REPREF_MAPPINGBean> listDetails1(String repnum,String replvl,String repcode,String acclist,String finrefcode,String type ) {
		
		ArrayList<XBRL_REPREF_MAPPINGBean> arl = new ArrayList<XBRL_REPREF_MAPPINGBean>();

		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();
	String cn1="";
	String cn2="";
		if(!replvl.equals("")) {
			cn1="AND REP.REF_LEVEL='"+replvl+"'";
		}else if(!repcode.split("/")[0].equals("")) {
			cn1="AND REP.REF_CODE='"+repcode.split("/")[0]+"'";
		}else if(!replvl.equals("") && ! repcode.split("/")[0].equals("")) {
			
			cn1="AND REP.REF_LEVEL='"+replvl+"' AND REP.REF_CODE='"+repcode.split("/")[0]+"' ";
		}
		 if(! repcode.split("/")[0].equals("") && ! type.equals("listmapadd")) {
				cn2="WHERE "+repnum+"='"+repcode.split("/")[0]+"'";
			}else {
				cn2="WHERE "+repnum+" IS NOT NULL";
			}
		 
			
		
	if(type.equals("listmapadd")) {
		sql.append("SELECT CUST_ID, ACCT_NO, SCH_TYPE, SCH_CODE, GLSL_CODE, REP.REPORT_CODE, REPORT_NAME, REF_LEVEL, "+repnum.toUpperCase()+" , REP.REF_DESC_1 FROM XBRL_RRC_MAP_TABLE RRCM  LEFT JOIN XBRL_REP_REF_CODE_TABLE REP ON RRCM."+repnum+"=REP.REF_CODE AND REP.REPORT_CODE='"+repnum+"' "+cn1+" WHERE "+repnum.toUpperCase()+" IS  NULL");
	}else {
		sql.append("SELECT CUST_ID, ACCT_NO, SCH_TYPE, SCH_CODE, GLSL_CODE, REP.REPORT_CODE, REPORT_NAME, REF_LEVEL, "+repnum.toUpperCase()+" , REP.REF_DESC_1 FROM XBRL_RRC_MAP_TABLE RRCM  LEFT JOIN XBRL_REP_REF_CODE_TABLE REP ON RRCM."+repnum+"=REP.REF_CODE AND REP.REPORT_CODE='"+repnum+"' "+cn1+" "+cn2+"");
	}
		
			
		
		

		try {
			log.info(sql.toString());
			ps = conn.prepareStatement(sql.toString());
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				XBRL_REPREF_MAPPINGBean umb = new XBRL_REPREF_MAPPINGBean();
				umb.setCustid1(NullCheck.isNotNull(rs.getString("CUST_ID")));
				umb.setActno1(NullCheck.isNotNull(rs.getString("ACCT_NO")));
				umb.setSchmtyp(NullCheck.isNotNull(rs.getString("SCH_TYPE")));
				umb.setSchmcode(NullCheck.isNotNull(rs.getString("SCH_CODE")));
				umb.setGlhead1(NullCheck.isNotNull(rs.getString("GLSL_CODE")));
				umb.setRepcode(NullCheck.isNotNull(rs.getString("REPORT_CODE")));
				umb.setRepname(NullCheck.isNotNull(rs.getString("REPORT_NAME")));
				umb.setReplvl(NullCheck.isNotNull(rs.getString("REF_LEVEL")));
					umb.setRefcode(NullCheck.isNotNull(rs.getString(repnum.toUpperCase())));
					umb.setRefdesc1(NullCheck.isNotNull(rs.getString("REF_DESC_1")));
				
				
				arl.add(umb);

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
log.info(arl.size());
		return arl;

	}
	
	
	
	/********************* report  code details *********************/

	public ArrayList<XBRL_REPREF_MAPPINGBean> repdetails1(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();  
		ArrayList<XBRL_REPREF_MAPPINGBean> arl= new ArrayList<XBRL_REPREF_MAPPINGBean> ();
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		StringBuffer sql = new StringBuffer();
		
	if(request.getParameter("typ").trim().toLowerCase().equals("repnum")) {

	sql.append("SELECT DISTINCT (REPORT_CODE) FROM XBRL_REP_REF_CODE_TABLE ");
	}else if(request.getParameter("typ").trim().toLowerCase().equals("replvl")) {
	sql.append("SELECT DISTINCT (REF_LEVEL) FROM XBRL_REP_REF_CODE_TABLE WHERE REPORT_CODE='"+request.getParameter("repnum")+"'");
	}else if(request.getParameter("typ").trim().toLowerCase().equals("refcode")) {
	sql.append("SELECT DISTINCT (REF_CODE),REPORT_NAME,REF_DESC_1,REF_DESC_2,REF_DESC_3 FROM XBRL_REP_REF_CODE_TABLE WHERE REPORT_CODE='"+request.getParameter("repnum")+"' AND REF_LEVEL='"+request.getParameter("replvl")+"'");
	}else if(request.getParameter("typ").trim().toLowerCase().equals("repnumnew")) {

	sql.append("select distinct report_code from xbrl_rep_ref_code_table minus select column_name from all_tab_cols where owner=user and table_name='XBRL_RRC_MAP_TABLE' ");
	}
	try{
		log.info(sql.toString());
		ps = conn.prepareStatement(sql.toString());
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			XBRL_REPREF_MAPPINGBean rmb=new XBRL_REPREF_MAPPINGBean();
			if(request.getParameter("typ").trim().toLowerCase().equals("repnum")) {
			rmb.setRepnum(NullCheck.isNotNull(rs.getString("REPORT_CODE")));
			}else if(request.getParameter("typ").trim().toLowerCase().equals("replvl")) {
				rmb.setReplvl(NullCheck.isNotNull(rs.getString("REF_LEVEL")));
			}else if(request.getParameter("typ").trim().toLowerCase().equals("refcode")) {
				rmb.setRefcode(NullCheck.isNotNull(rs.getString("REF_CODE")));
				rmb.setRepname(NullCheck.isNotNull(rs.getString("REPORT_NAME")));
				rmb.setRefdesc1(NullCheck.isNotNull(rs.getString("REF_DESC_1")));
				rmb.setRefdesc2(NullCheck.isNotNull(rs.getString("REF_DESC_2")));
				rmb.setRefdesc3(NullCheck.isNotNull(rs.getString("REF_DESC_3")));
			}else if(request.getParameter("typ").trim().toLowerCase().equals("repnumnew")) {
				rmb.setRepnum(NullCheck.isNotNull(rs.getString("REPORT_CODE")));
				}
			arl.add(rmb);
		}
	}catch(SQLException e) {
		e.printStackTrace();
	}
		return arl;
	}
		
	/********************* report  code details *********************/
	/*****************************************repdetailslist**************************************/

	public ArrayList<XBRL_REPREF_MAPPINGBean> listDetails11(String repnum,String replvl,String refcode) {
			
			ArrayList<XBRL_REPREF_MAPPINGBean> arl = new ArrayList<XBRL_REPREF_MAPPINGBean>();

			ConnectionManager connMgr = new ConnectionManager();
			Connection conn = connMgr.getConnection();
			PreparedStatement ps = null;
			StringBuffer sql = new StringBuffer();
		String cn1="";
		String cn2="";
		if(!replvl.equals("")) {
			cn2=" AND REP.REF_LEVEL='"+replvl+"'";
		}else if(!refcode.equals("")) {
			cn2=" AND REP.REF_CODE='"+refcode+"'";
		}else if(!replvl.equals("") && ! refcode.equals("")) {
			cn2=" AND REP.REF_LEVEL='"+replvl+"' AND REP.REF_CODE='"+refcode+"'";
		}
		 if(! refcode.equals("")) {
			cn1="WHERE "+repnum+"='"+refcode+"'";
		}else {
			cn1="WHERE "+repnum+" IS NOT NULL";
		}
		
				sql.append("SELECT CUST_ID, ACCT_NO, SCH_TYPE, SCH_CODE, GLSL_CODE, REP.REPORT_CODE, REPORT_NAME, REF_LEVEL, "+repnum.toUpperCase()+" , REP.REF_DESC_1, REP.REF_DESC_2  FROM XBRL_RRC_MAP_TABLE RRCM  LEFT JOIN XBRL_REP_REF_CODE_TABLE REP ON RRCM."+repnum+"=REP.REF_CODE AND REP.REPORT_CODE='"+repnum+"' "+cn2+"   "+cn1+"");
			
			

			try {
				log.info(sql.toString());
				ps = conn.prepareStatement(sql.toString());
				ResultSet rs = ps.executeQuery();

				while (rs.next()) {
					XBRL_REPREF_MAPPINGBean umb = new XBRL_REPREF_MAPPINGBean();
					umb.setCustid1(NullCheck.isNotNull(rs.getString("CUST_ID")));
					umb.setActno1(NullCheck.isNotNull(rs.getString("ACCT_NO")));
					umb.setSchmtyp(NullCheck.isNotNull(rs.getString("SCH_TYPE")));
					umb.setSchmcode(NullCheck.isNotNull(rs.getString("SCH_CODE")));
					umb.setGlhead1(NullCheck.isNotNull(rs.getString("GLSL_CODE")));
					umb.setRepcode(NullCheck.isNotNull(rs.getString("REPORT_CODE")));
					umb.setRepname(NullCheck.isNotNull(rs.getString("REPORT_NAME")));
					umb.setReplvl(NullCheck.isNotNull(rs.getString("REF_LEVEL")));
						umb.setRefcode(NullCheck.isNotNull(rs.getString(repnum.toUpperCase())));
						umb.setRefdesc1(NullCheck.isNotNull(rs.getString("REF_DESC_1")));
						umb.setRefdesc2(NullCheck.isNotNull(rs.getString("REF_DESC_2")));
					
					arl.add(umb);

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
log.info(arl.size());
			return arl;

		}
	/*****************************************repdetailslist**************************************/	
}
