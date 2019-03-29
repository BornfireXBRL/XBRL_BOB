package action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import basecode.DateFormat;
import utilities.ConnectionManager;
import utilities.NullCheck;


/**
 * @companyName : 		 		Bonfire Innovation Private Limited Chennai
 * @project :    		 		Extensible Business Reporting Language (XBRL)
 * @name :       		 		XBRLCRR100ActionAC.java
 * @path :         		 		action
 * @author :       		 		D PraveenBabu
 * @version : 					1.0
 * @functionality :		 		It contains the action with multiple methods to create CRR0100 Reports.
 * @relatedScripts : 	 		bean.XBRLCRR0100Bean.java,dao.XBRLCRR0100Dao.java 
 * @creationDate :				
 * @lastModifiedDate :			
 * @modificationHistory : 		

*/
import org.apache.log4j.Logger;



public class XBRLCRR100ActionAC {
	
	static Logger log = Logger.getLogger(XBRLCRR100ActionAC.class);
	
	
	public String refno;
	public String refnoAD;
	public String refnoAI;
	public String refnoBB;
	public String refnoAE;
	public String refnoAG;
	public String refnoAF;
	public String refnoAH;
	public String refnoAB;
	public String refnoAC;
	



public String getRefnoAC() {
		return refnoAC;
	}



	public void setRefnoAC(String refnoAC) {
		this.refnoAC = refnoAC;
	}



public String getRefnoAB() {
		return refnoAB;
	}



	public void setRefnoAB(String refnoAB) {
		this.refnoAB = refnoAB;
	}
public String getRefnoAE() {
		return refnoAE;
	}





	public void setRefnoAE(String refnoAE) {
		this.refnoAE = refnoAE;
	}





	public String getRefnoAG() {
		return refnoAG;
	}





	public void setRefnoAG(String refnoAG) {
		this.refnoAG = refnoAG;
	}





	public String getRefnoAF() {
		return refnoAF;
	}





	public void setRefnoAF(String refnoAF) {
		this.refnoAF = refnoAF;
	}





	public String getRefnoAH() {
		return refnoAH;
	}





	public void setRefnoAH(String refnoAH) {
		this.refnoAH = refnoAH;
	}





public String getRefnoBB() {
		return refnoBB;
	}





	public void setRefnoBB(String refnoBB) {
		this.refnoBB = refnoBB;
	}





public String getRefnoAI() {
		return refnoAI;
	}





	public void setRefnoAI(String refnoAI) {
		this.refnoAI = refnoAI;
	}





public String getRefnoAD() {
		return refnoAD;
	}





	public void setRefnoAD(String refnoAD) {
		this.refnoAD = refnoAD;
	}













public String getRefno() {
		return refno;
	}





	public void setRefno(String refno) {
		this.refno = refno;
	}




public String modXbcrrCreateAC() throws SQLException {
		
		log.info("sowryyyyyyyyyyyyyyyyyy");
		
		String status="";
		String status1="";
		
		String ReporefSeq="";
		HttpServletRequest request = ServletActionContext.getRequest();
		log.info("rptdayAC_row--->"+request.getParameter("rptdayAC"));
		 DateFormat df=new DateFormat();
		 
		 NullCheck nc=new NullCheck();
		
		HttpSession session = request.getSession();  
		
		log.info("dt1--->"+request.getParameter("dt1"));
		log.info("dt2--->"+request.getParameter("dt2"));
		//log.info("reportrefno====>>>"+request.getParameter("reportrefno"));
		log.info("rptdayAC_row--->"+request.getParameter("rptdayAC"));
		log.info("rptdateAC_row--->"+request.getParameter("rptdateAC"));
		log.info("depamtmurAC_row1--->"+request.getParameter("depamtmurAC"));
		log.info("depdeneurAC_row1--->"+request.getParameter("depdeneurAC"));
		
		log.info("depdengbpAC_row--->"+request.getParameter("depdengbpAC"));
		log.info("depdenusdAC_row--->"+request.getParameter("depdenusdAC"));
		log.info("usdequforAC_row--->"+request.getParameter("usdequforAC"));
		
		
		
		log.info("reccodAC_row--->"+request.getParameter("reccodAC"));
		
		log.info("rcrusridAC_row--->"+request.getParameter("rcrusridAC"));
		log.info("rcrtmeAC_row--->"+request.getParameter("rcrtmeAC"));
		log.info("lchusridAC_row--->"+request.getParameter("lchusridAC"));
		log.info("lchtmeAC_row--->"+request.getParameter("lchtmeAC"));
		
		log.info("delAC--->"+request.getParameter("delAC"));
		
		
		
		
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		log.info("insert");
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		
		StringBuffer sql2 = new StringBuffer();
		PreparedStatement ps3 = null;
		PreparedStatement ps4 = null;
		
		StringBuffer sql3 = new StringBuffer();
		StringBuffer sql4 = new StringBuffer();
		
		DateFormat df1=new DateFormat();
		
		
		//String passexpdate=df.formatdate(xb.getAccopendate());
		log.info("==="+request.getParameter("reportrefno"));
		
		
		if(request.getParameter("reportrefno").startsWith("R")){
			
			log.info("else notttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt ");
			 ReporefSeq =request.getParameter("reportrefno");
				
		}else{
			

			
	log.info("nullllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll");

			utilities.SequenceNumber seqNo = new utilities.SequenceNumber();
		String reporefseqno = seqNo.reporefno();
		
	//log.info(" seqno  :=   " + seqno);
		
		 ReporefSeq = "RR01000" + reporefseqno;
			
		}
		log.info("===ReporefSeq==="+ReporefSeq);
		//log.info("<< EIDSeq >> " + EIDSeq); 
		session.setAttribute("ReprefSeq", ReporefSeq);
		
		//int rs=0;
		
		int count=0;
		
		StringBuffer sql = new StringBuffer();
		//HttpSession session = request.getSession();  
		log.info("insert Action modXbcrrCreateAC");
		
		
		
		
			try{
				
				
				//sql.append("SELECT Count (*) as cnt FROM   (SELECT DISTINCT RPT_DATE,REC_CODE FROM  CRR0100_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq+"' and RPT_DATE >='"+request.getParameter("dt1")+"' and RPT_DATE <= '"+request.getParameter("dt2")+"'  and REC_CODE='"+request.getParameter("reccod")+"') ");
				
				if(ReporefSeq.equals("null")){
				
					log.info("IFF");
					sql.append("SELECT Count (*) as cnt FROM   (SELECT DISTINCT RPT_DATE,REC_CODE FROM  CRR0100_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq.trim()+"' and DEL_FLG >='N' and RPT_DATE >='"+request.getParameter("dt1")+"' and RPT_DATE <= '"+request.getParameter("dt2")+"'  and REC_CODE='"+request.getParameter("reccodAC")+"') ");
				
				
				
					log.info("select count       .... NEW===  "+sql.toString());
					ps = conn.prepareStatement(sql.toString());
					
					log.info("count test  ");
					
					ResultSet rs = ps.executeQuery();
					//log.info(rs);
					if (rs.next()) {						
						count = rs.getInt("cnt"); 
						log.info("count"+count);
						
						if (count > 0) {
							log.info("UPDATE");
							log.info("dt1--->"+request.getParameter("dt1"));
							log.info("dt2--->"+request.getParameter("dt2"));
							log.info("reportrefno====>>>"+ReporefSeq);
							log.info("rptdayAC_row--->"+request.getParameter("rptdayAC"));
							log.info("rptdateAC_row--->"+df1.formatdate(request.getParameter("rptdateAC")));
							log.info("depamtmurAC_row1--->"+request.getParameter("depamtmurAC"));
							log.info("depdeneurAC_row1--->"+request.getParameter("depdeneurAC"));

							log.info("depdengbpAC_row--->"+request.getParameter("depdengbpAC"));
							log.info("depdenusdAC_row--->"+request.getParameter("depdenusdAC"));
							log.info("usdequforAC_row--->"+request.getParameter("usdequforAC"));
							
							log.info("reccodAC_row--->"+request.getParameter("reccodAC"));
							
							log.info("rcrusridAC_row--->"+request.getParameter("rcrusridAC"));
							log.info("rcrtmeAC_row--->"+request.getParameter("rcrtmeAC"));
							log.info("lchusridAC_row--->"+request.getParameter("lchusridAC"));
							log.info("lchtmeAC_row--->"+request.getParameter("lchtmeAC"));
							
							log.info("delAC_row--->"+request.getParameter("delAC"));
		    				/*sql2.append("update CRR0100_MOD_TABLE set "
		    						
		    												+ "REPORT_REF_NO ='"+ReporefSeq+"',"
		    												+ "RPT_DAY ='"+request.getParameter("rptday")+"',"
		    												+ "RPT_DATE ='"+df1.formatdate(request.getParameter("rptdate"))+"',"
		    												+ "DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmur")+"',"
		    												+ "DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneur")+"',"
		    												+ "DEPOSIT_DENOM_IN_GBP ='"+request.getParameter("depdengbp")+"',"
		    												+ "DEPOSIT_DENOM_IN_USD ='"+df1.formatdate(request.getParameter("depdenusd"))+"',"
		    												+ "USD_EQUIV_OTH_FCY_DEPOSIT ='"+request.getParameter("usdequfor")+"',"
		    												+ "REC_CODE ='"+request.getParameter("reccod")+"',"
		    												+ "RCRE_USER_ID ='"+request.getParameter("rcrusrid")+"',"
		    												+ "RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtme"))+"',"
								    						+ "LCHG_USER_ID ='"+request.getParameter("lchusrid")+"',"
								    						+ "LCHG_TIME ='"+df1.formatdate(request.getParameter("lchtme"))+"'   where REC_CODE='"+ request.getParameter("reccod") + "' "
								    						+ "RPT_DATE='"+ df1.formatdate(request.getParameter("rptdate")) + "' ");*/
		    				
		    				
		    				
		    				
		    				
		 // sql2.append("update CRR0100_MOD_TABLE set REPORT_REF_NO ='"+ReporefSeq+"',RPT_DAY ='"+request.getParameter("rptday")+"',RPT_DATE ='"+df1.formatdate(request.getParameter("rptdate"))+"',DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmur")+" ',DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneur")+" ',DEPOSIT_DENOM_IN_GBP ='"+request.getParameter("depdengbp")+"',DEPOSIT_DENOM_IN_USD ='"+df1.formatdate(request.getParameter("depdenusd"))+" ',USD_EQUIV_OTH_FCY_DEPOSIT ='"+request.getParameter("usdequfor")+"',REC_CODE ='"+request.getParameter("reccod")+"',RCRE_USER_ID ='"+request.getParameter("rcrusrid")+"',RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtme"))+"',LCHG_USER_ID ='"+request.getParameter("lchusrid")+"',LCHG_TIME ='"+df1.formatdate(request.getParameter("lchtme"))+"'   where REPORT_REF_NO = '"+ReporefSeq+"'");
		    				
		  log.info("hiiii Ganiiiiiii");
		  
		  sql4.append("update CRR0100_MOD_TABLE set REPORT_REF_NO ='"+ReporefSeq.trim()+"',RPT_DAY ='"+request.getParameter("rptdayAC")+"',RPT_DATE ='"+df1.formatdate(request.getParameter("rptdateAC"))+"',DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmurAC").trim()+"',DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneurAC").trim()+"',REC_CODE ='"+request.getParameter("reccodAC")+"',DEL_FLG ='"+request.getParameter("delAC")+"',RCRE_USER_ID ='"+request.getParameter("rcrusridAC")+"',RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtmeAC"))+"',LCHG_USER_ID ='"+request.getParameter("lchusridAC")+"',LCHG_TIME =current_timestamp where REPORT_REF_NO ='"+ReporefSeq+"'");
		  
		  
		  log.info("ghf");
		    				log.info("Update======>"+sql4.toString());
		    				
							ps4 = conn.prepareStatement(sql4.toString());
							int rs4 = ps4.executeUpdate();
							if (rs4>0) {
								log.info("<<==Update Success==>>");
								/*request.setAttribute("type", "update");
								request.setAttribute("alert","Report Ref No : "   +" "+EIDSeq+" "+   "Updated Successfully");*/
								status1 = "updated";
								status = "success";
								
								
							}
		    				
		    				
		    			}else{
		    				log.info("INSERT");
		    				
		    				
		    				
		    				sql3.append("INSERT INTO CRR0100_MOD_TABLE("
		    						+ "REPORT_REF_NO,"
		    						+ "RPT_DAY,"
		    						+ "RPT_DATE,"    						
		    						+ "DEPOSIT_AMT_IN_MUR,"
		    						+ "DEPOSIT_DENOM_IN_EUR,"	
		    						+ "DEPOSIT_DENOM_IN_GBP,"
		    						+ "DEPOSIT_DENOM_IN_USD,"
		    						+ "USD_EQUIV_OTH_FCY_DEPOSIT,"
		    						+ "REC_CODE,"
		    						+ "DEL_FLG,"
		    						+ "RCRE_USER_ID,"
		    						+ "RCRE_TIME,"
		    						+ "LCHG_USER_ID,"
		    						+ "LCHG_TIME)");
		    				
		    				sql3.append("values('"+ReporefSeq.trim()+"','"+request.getParameter("rptdayAC")
		    				+"','"+df1.formatdate(request.getParameter("rptdateAC"))
		    				+"','"+request.getParameter("depamtmurAC").trim()
		    				+"','"+request.getParameter("depdeneurAC").trim()
		    				+"','"+request.getParameter("depdengbpAC").trim()
		    				+"','"+request.getParameter("depdenusdAC")
		    				+"','"+request.getParameter("usdequforAC")		    				
		    				+"','"+request.getParameter("reccodAC")
		    				+"','"+request.getParameter("delAC")
		    				+"','"+request.getParameter("rcrusridAC")
		    				+"','"+df1.formatdate(request.getParameter("rcrtmeAC"))
		    				+"','"+request.getParameter("lchusridAC")
		    				+"',current_timestamp)");
		    				
		    				
		    				//log.info("loginUPDAT"+sql3.toString()+username);
		    				//+"','"+EIDSeq+"',             '"+df1.formatdate(request.getParameter("rptstart"))+"','"+df1.formatdate(request.getParameter("rptend"))+"','"+request.getParameter("rptcrncy")+"','"+request.getParameter("bnkcode")+"','"+request.getParameter("modcode")+"','"+request.getParameter("modtype")
		    				log.info("Insert"+sql3.toString());
		    				
		    				ps3 = conn.prepareStatement(sql3.toString());
		    				int rs3 = ps3.executeUpdate();
		    				
		    				if (rs3 > 0) {
		    					
		    					request.setAttribute("ReporefSeq", ReporefSeq);
		    					
		    					status1="inserted";
		    					
		    					
		    					status = "success";
		    						
		    				}
		    		    		
						
						
					}
						
					}
				
				
				
				
				
				
				
				
				}else{
					
					log.info("ELSEEEE");
					
					sql.append("SELECT Count (*) as cnt FROM   (SELECT DISTINCT RPT_DATE,REC_CODE FROM  CRR0100_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq.trim()+"' and RPT_DATE ='"+df.formatdate(request.getParameter("rptdateAC"))+"' and DEL_FLG='N'  and REC_CODE='"+request.getParameter("reccodAC")+"') ");
			
				
				
				
					log.info("select count       .... NEW===  "+sql.toString());
					ps = conn.prepareStatement(sql.toString());
					
					log.info("count test  ");
					
					ResultSet rs = ps.executeQuery();
					//log.info(rs);
					if (rs.next()) {						
						count = rs.getInt("cnt"); 
						log.info("count"+count);
						
						if (count > 0) {
							log.info("UPDATE");
							log.info("dt1--->"+request.getParameter("dt1"));
							log.info("dt2--->"+request.getParameter("dt2"));
							log.info("reportrefno====>>>"+ReporefSeq);
							log.info("rptdayAC_row--->"+request.getParameter("rptdayAC"));
							log.info("rptdateAC_row--->"+df1.formatdate(request.getParameter("rptdateAC")));
							log.info("depamtmurAC_row1--->"+request.getParameter("depamtmurAC"));
							log.info("depdeneurAC_row1--->"+request.getParameter("depdeneurAC"));

							log.info("depdengbpAC_row--->"+request.getParameter("depdengbpAC"));
							log.info("depdenusdAC_row--->"+request.getParameter("depdenusdAC"));
							log.info("usdequforAC_row--->"+request.getParameter("usdequforAC"));
							
							log.info("reccodAC_row--->"+request.getParameter("reccodAC"));
							
							log.info("rcrusridAC_row--->"+request.getParameter("rcrusridAC"));
							log.info("rcrtmeAC_row--->"+request.getParameter("rcrtmeAC"));
							log.info("lchusridAC_row--->"+request.getParameter("lchusridAC"));
							log.info("lchtmeAC_row--->"+request.getParameter("lchtmeAC"));
							
							log.info("delAC_row--->"+request.getParameter("delAC"));
							
		    				/*sql2.append("update CRR0100_MOD_TABLE set "
		    						
		    												+ "REPORT_REF_NO ='"+ReporefSeq+"',"
		    												+ "RPT_DAY ='"+request.getParameter("rptday")+"',"
		    												+ "RPT_DATE ='"+df1.formatdate(request.getParameter("rptdate"))+"',"
		    												+ "DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmur")+"',"
		    												+ "DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneur")+"',"
		    												+ "DEPOSIT_DENOM_IN_GBP ='"+request.getParameter("depdengbp")+"',"
		    												+ "DEPOSIT_DENOM_IN_USD ='"+df1.formatdate(request.getParameter("depdenusd"))+"',"
		    												+ "USD_EQUIV_OTH_FCY_DEPOSIT ='"+request.getParameter("usdequfor")+"',"
		    												+ "REC_CODE ='"+request.getParameter("reccod")+"',"
		    												+ "RCRE_USER_ID ='"+request.getParameter("rcrusrid")+"',"
		    												+ "RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtme"))+"',"
								    						+ "LCHG_USER_ID ='"+request.getParameter("lchusrid")+"',"
								    						+ "LCHG_TIME ='"+df1.formatdate(request.getParameter("lchtme"))+"'   where REC_CODE='"+ request.getParameter("reccod") + "' "
								    						+ "RPT_DATE='"+ df1.formatdate(request.getParameter("rptdate")) + "' ");*/
		    				
		    				
		    				
		    				
		    				
		 // sql2.append("update CRR0100_MOD_TABLE set REPORT_REF_NO ='"+ReporefSeq+"',RPT_DAY ='"+request.getParameter("rptday")+"',RPT_DATE ='"+df1.formatdate(request.getParameter("rptdate"))+"',DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmur")+" ',DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneur")+" ',DEPOSIT_DENOM_IN_GBP ='"+request.getParameter("depdengbp")+"',DEPOSIT_DENOM_IN_USD ='"+df1.formatdate(request.getParameter("depdenusd"))+" ',USD_EQUIV_OTH_FCY_DEPOSIT ='"+request.getParameter("usdequfor")+"',REC_CODE ='"+request.getParameter("reccod")+"',RCRE_USER_ID ='"+request.getParameter("rcrusrid")+"',RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtme"))+"',LCHG_USER_ID ='"+request.getParameter("lchusrid")+"',LCHG_TIME ='"+df1.formatdate(request.getParameter("lchtme"))+"'   where REPORT_REF_NO = '"+ReporefSeq+"'");
		    				
		  
		  
		  sql4.append("update CRR0100_MOD_TABLE set REPORT_REF_NO ='"+ReporefSeq.trim()+"',RPT_DAY ='"+request.getParameter("rptdayAC")+"',RPT_DATE ='"+df1.formatdate(request.getParameter("rptdateAC"))+"',DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmurAC").trim()+" ',DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneurAC").trim()+"',REC_CODE ='"+request.getParameter("reccodAC")+"',DEL_FLG ='"+request.getParameter("delAC")+"',RCRE_USER_ID ='"+request.getParameter("rcrusridAC")+"',RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtmeAC"))+"',LCHG_USER_ID ='"+request.getParameter("lchusridAC")+"',LCHG_TIME =current_timestamp where REPORT_REF_NO ='"+ReporefSeq+"' and RPT_DATE ='"+df1.formatdate(request.getParameter("rptdateAC"))+"'  and REC_CODE='"+request.getParameter("reccodAC")+"'");
		  
		  
		  log.info("ghf");
		    				log.info("Update======>"+sql4.toString());
		    				
							ps4 = conn.prepareStatement(sql4.toString());
							int rs4 = ps4.executeUpdate();
							if (rs4>0) {
								log.info("<<==Update Success==>>");
								/*request.setAttribute("type", "update");
								request.setAttribute("alert","Report Ref No : "   +" "+EIDSeq+" "+   "Updated Successfully");*/
								status1 = "updated";
								status = "success";
								
								
							}
		    				
		    				
		    			}else{
		    				log.info("INSERT");
		    				
		    				
		    				
		    				sql3.append("INSERT INTO CRR0100_MOD_TABLE("
		    						+ "REPORT_REF_NO,"
		    						+ "RPT_DAY,"
		    						+ "RPT_DATE,"    						
		    						+ "DEPOSIT_AMT_IN_MUR,"
		    						+ "DEPOSIT_DENOM_IN_EUR,"	
		    						+ "DEPOSIT_DENOM_IN_GBP,"
		    						+ "DEPOSIT_DENOM_IN_USD,"
		    						+ "USD_EQUIV_OTH_FCY_DEPOSIT,"

		    						+ "REC_CODE,"
		    						+ "DEL_FLG,"
		    						+ "RCRE_USER_ID,"
		    						+ "RCRE_TIME,"
		    						+ "LCHG_USER_ID,"
		    						+ "LCHG_TIME)");
		    				
		    				sql3.append("values('"+ReporefSeq.trim()+"','"+request.getParameter("rptdayAC")
		    				+"','"+df1.formatdate(request.getParameter("rptdateAC"))
		    				+"','"+request.getParameter("depamtmurAC").trim()
		    				+"','"+request.getParameter("depdeneurAC").trim()
		    				+"','"+request.getParameter("depdengbpAC").trim()
		    				+"','"+request.getParameter("depdenusdAC")
		    				+"','"+request.getParameter("usdequforAC")
		    				
		    				+"','"+request.getParameter("reccodAC")
		    				+"','"+request.getParameter("delAC")
		    				+"','"+request.getParameter("rcrusridAC")
		    				+"','"+df1.formatdate(request.getParameter("rcrtmeAC"))
		    				+"','"+request.getParameter("lchusridAC")
		    				+"',current_timestamp) ");
		    				
		    				
		    				//log.info("loginUPDAT"+sql3.toString()+username);
		    				//+"','"+EIDSeq+"',             '"+df1.formatdate(request.getParameter("rptstart"))+"','"+df1.formatdate(request.getParameter("rptend"))+"','"+request.getParameter("rptcrncy")+"','"+request.getParameter("bnkcode")+"','"+request.getParameter("modcode")+"','"+request.getParameter("modtype")
		    				log.info("Insert"+sql3.toString());
		    				
		    				ps3 = conn.prepareStatement(sql3.toString());
		    				int rs3 = ps3.executeUpdate();
		    				
		    				if (rs3 > 0) {
		    					
		    					request.setAttribute("ReporefSeq", ReporefSeq);
		    					
		    					status1="inserted";
		    					
		    					
		    					status = "success";
		    						
		    				}
		    		    		
						
						
					}
						
					}
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				}
				
				//sql.append("SELECT count(distinct RPT_DATE)as cnt,count(distinct REC_CODE) as cnt1 from CRR0100_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq+"' and RPT_DAY='"+request.getParameter("rptday")+"',REC_CODE='"+request.getParameter("reccod")+"' ");
				
				
				
				//sql.append("INSERT INTO BAM_ASSET_FLOWS(DAILY_AVG_AMT,WEIGHT_AVG_INT_RATE,INT_INC_EXP) VALUES ('"+daa_val[i]+"','"+wair_val[i]+"','"+iiie_val[i]+"')");
	    		
				
				
				 
			}
			
			catch (SQLException e) {
				status="error";
				e.printStackTrace();
			} 
		
			/*RepID Display Header*/
			
			refnoAC=ReporefSeq;
		
			if(status.equals("success") && status1.equals("inserted")){
	        	
	    		
		    	//	log.info("==insert Statusss==");
		    		//String next=lmd.insertRecord(arl,AC);
					//request.setAttribute("alert", "Report Ref No : "   +" "+EIDSeq+" "+   "Inserted Successfully.");
					request.setAttribute("type", "insertedAC");
					request.setAttribute("dt1AC", request.getParameter("dt1"));
					request.setAttribute("dt2AC", request.getParameter("dt2"));
					request.setAttribute("ReporefSeqAC", ReporefSeq);
					request.setAttribute("alert", "Report Ref No : "   +" "+ReporefSeq+" "+   "Created Successfully.");
		    		
					//XBRLCRR0100Dao dmd =new XBRLCRR0100Dao();
		    		//ArrayList<XBRLCRR0100Bean> list=dmd.xbrlcrrRR(ReporefSeq);
		    		
					return "success";
				}else if(status.equals("success") && status1.equals("updated")){
				//	log.info("==update Statusss==");
		    		//String next=lmd.insertRecord(arl,AC);
					
					request.setAttribute("type", "updatedAC");
					request.setAttribute("dt1AC", request.getParameter("dt1"));
					request.setAttribute("dt2AC", request.getParameter("dt2"));
					request.setAttribute("ReporefSeqAC", ReporefSeq);
					
					request.setAttribute("alert", "Report Ref No : "   +" "+ReporefSeq+" "+   "Updated Successfully.");
					//request.setAttribute("type", "AsstFlow");
					return "success";
				}	else{
				
					request.setAttribute("alert", "CRR Table  not updated successfully.");
					return "error";
				}
	}



public String modXbcrrCreateAD() throws SQLException {
	
	log.info("sowryyyyyyyyyyyyyyyyyy");
	
	String status="";
	String status1="";
	
	String ReporefSeq="";
	HttpServletRequest request = ServletActionContext.getRequest();
	log.info("rptdayAD_row--->"+request.getParameter("rptdayAD"));
	 DateFormat df=new DateFormat();
	 
	 NullCheck nc=new NullCheck();
	
	HttpSession session = request.getSession();  
	
	log.info("dt1--->"+request.getParameter("dt1"));
	log.info("dt2--->"+request.getParameter("dt2"));
	//log.info("reportrefno====>>>"+request.getParameter("reportrefno"));
	log.info("rptdayAD_row--->"+request.getParameter("rptdayAD"));
	log.info("rptdateAD_row--->"+request.getParameter("rptdateAD"));
	log.info("depamtmurAD_row1--->"+request.getParameter("depamtmurAD"));
	log.info("depdeneurAD_row1--->"+request.getParameter("depdeneurAD"));
	
	log.info("depdengbpAD_row--->"+request.getParameter("depdengbpAD"));
	log.info("depdenusdAD_row--->"+request.getParameter("depdenusdAD"));
	log.info("usdequforAD_row--->"+request.getParameter("usdequforAD"));
	
	
	
	log.info("reccodAD_row--->"+request.getParameter("reccodAD"));
	
	log.info("rcrusridAD_row--->"+request.getParameter("rcrusridAD"));
	log.info("rcrtmeAD_row--->"+request.getParameter("rcrtmeAD"));
	log.info("lchusridAD_row--->"+request.getParameter("lchusridAD"));
	log.info("lchtmeAD_row--->"+request.getParameter("lchtmeAD"));
	
	log.info("delAD_row--->"+request.getParameter("delAD"));
	
	
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	log.info("insert");
	PreparedStatement ps = null;
	PreparedStatement ps2 = null;
	
	StringBuffer sql2 = new StringBuffer();
	PreparedStatement ps3 = null;
	PreparedStatement ps4 = null;
	
	StringBuffer sql3 = new StringBuffer();
	StringBuffer sql4 = new StringBuffer();
	
	DateFormat df1=new DateFormat();
	
	
	//String passexpdate=df.formatdate(xb.getADcopendate());
	log.info("==="+request.getParameter("reportrefno"));
	
	
	if(request.getParameter("reportrefno").startsWith("R")){
		
		log.info("else notttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt ");
		 ReporefSeq =request.getParameter("reportrefno");
			
	}else{
		

		
log.info("nullllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll");

		utilities.SequenceNumber seqNo = new utilities.SequenceNumber();
	String reporefseqno = seqNo.reporefno();
	
//log.info(" seqno  :=   " + seqno);
	
	 ReporefSeq = "RR01000" + reporefseqno;
		
	}
	log.info("===ReporefSeq==="+ReporefSeq);
	//log.info("<< EIDSeq >> " + EIDSeq); 
	session.setAttribute("ReprefSeq", ReporefSeq);
	
	//int rs=0;
	
	int count=0;
	
	StringBuffer sql = new StringBuffer();
	//HttpSession session = request.getSession();  
	log.info("insert ADtion modXbcrrCreateAD");
	
	
	
	
		try{
			
			
			//sql.append("SELECT Count (*) as cnt FROM   (SELECT DISTINCT RPT_DATE,REC_CODE FROM  CRR0100_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq+"' and RPT_DATE >='"+request.getParameter("dt1")+"' and RPT_DATE <= '"+request.getParameter("dt2")+"'  and REC_CODE='"+request.getParameter("reccod")+"') ");
			
			if(ReporefSeq.equals("null")){
			
				log.info("IFF");
				sql.append("SELECT Count (*) as cnt FROM   (SELECT DISTINCT RPT_DATE,REC_CODE FROM  CRR0100_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq.trim()+"' and RPT_DATE >='"+df1.formatdate(request.getParameter("dt1"))+"' and RPT_DATE <= '"+df1.formatdate(request.getParameter("dt2"))+"'  and DEL_FLG = 'N' and REC_CODE='"+request.getParameter("reccodAD")+"') ");
			
			
			
				log.info("select count       .... NEW===  "+sql.toString());
				ps = conn.prepareStatement(sql.toString());
				
				log.info("count test  ");
				
				ResultSet rs = ps.executeQuery();
				//log.info(rs);
				if (rs.next()) {						
					count = rs.getInt("cnt"); 
					log.info("count"+count);
					
					if (count > 0) {
						log.info("UPDATE");
						log.info("dt1--->"+request.getParameter("dt1"));
						log.info("dt2--->"+request.getParameter("dt2"));
						log.info("reportrefno====>>>"+ReporefSeq);
						log.info("rptdayAD_row--->"+request.getParameter("rptdayAD"));
						log.info("rptdateAD_row--->"+df1.formatdate(request.getParameter("rptdateAD")));
						log.info("depamtmurAD_row1--->"+request.getParameter("depamtmurAD"));
						log.info("depdeneurAD_row1--->"+request.getParameter("depdeneurAD"));

						log.info("depdengbpAD_row--->"+request.getParameter("depdengbpAD"));
						log.info("depdenusdAD_row--->"+request.getParameter("depdenusdAD"));
						log.info("usdequforAD_row--->"+request.getParameter("usdequforAD"));
						
						log.info("reccodAD_row--->"+request.getParameter("reccodAD"));
						
						log.info("rcrusridAD_row--->"+request.getParameter("rcrusridAD"));
						log.info("rcrtmeAD_row--->"+request.getParameter("rcrtmeAD"));
						log.info("lchusridAD_row--->"+request.getParameter("lchusridAD"));
						log.info("lchtmeAD_row--->"+request.getParameter("lchtmeAD"));
						
						log.info("delAD_row--->"+request.getParameter("delAD"));
	    				/*sql2.append("update CRR0100_MOD_TABLE set "
	    						
	    												+ "REPORT_REF_NO ='"+ReporefSeq+"',"
	    												+ "RPT_DAY ='"+request.getParameter("rptday")+"',"
	    												+ "RPT_DATE ='"+df1.formatdate(request.getParameter("rptdate"))+"',"
	    												+ "DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmur")+"',"
	    												+ "DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneur")+"',"
	    												+ "DEPOSIT_DENOM_IN_GBP ='"+request.getParameter("depdengbp")+"',"
	    												+ "DEPOSIT_DENOM_IN_USD ='"+df1.formatdate(request.getParameter("depdenusd"))+"',"
	    												+ "USD_EQUIV_OTH_FCY_DEPOSIT ='"+request.getParameter("usdequfor")+"',"
	    												+ "REC_CODE ='"+request.getParameter("reccod")+"',"
	    												+ "RCRE_USER_ID ='"+request.getParameter("rcrusrid")+"',"
	    												+ "RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtme"))+"',"
							    						+ "LCHG_USER_ID ='"+request.getParameter("lchusrid")+"',"
							    						+ "LCHG_TIME ='"+df1.formatdate(request.getParameter("lchtme"))+"'   where REC_CODE='"+ request.getParameter("reccod") + "' "
							    						+ "RPT_DATE='"+ df1.formatdate(request.getParameter("rptdate")) + "' ");*/
	    				
	    				
	    				
	    				
	    				
	 // sql2.append("update CRR0100_MOD_TABLE set REPORT_REF_NO ='"+ReporefSeq+"',RPT_DAY ='"+request.getParameter("rptday")+"',RPT_DATE ='"+df1.formatdate(request.getParameter("rptdate"))+"',DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmur")+" ',DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneur")+" ',DEPOSIT_DENOM_IN_GBP ='"+request.getParameter("depdengbp")+"',DEPOSIT_DENOM_IN_USD ='"+df1.formatdate(request.getParameter("depdenusd"))+" ',USD_EQUIV_OTH_FCY_DEPOSIT ='"+request.getParameter("usdequfor")+"',REC_CODE ='"+request.getParameter("reccod")+"',RCRE_USER_ID ='"+request.getParameter("rcrusrid")+"',RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtme"))+"',LCHG_USER_ID ='"+request.getParameter("lchusrid")+"',LCHG_TIME ='"+df1.formatdate(request.getParameter("lchtme"))+"'   where REPORT_REF_NO = '"+ReporefSeq+"'");
	    				
	  
	  
	  sql4.append("update CRR0100_MOD_TABLE set REPORT_REF_NO ='"+ReporefSeq.trim()+"',RPT_DAY ='"+request.getParameter("rptdayAD")+"',RPT_DATE ='"+df1.formatdate(request.getParameter("rptdateAD"))+"',DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmurAD").trim()+" ',DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneurAD").trim()+"',REC_CODE ='"+request.getParameter("reccodAD")+"',DEL_FLG ='"+request.getParameter("delAD")+"',RCRE_USER_ID ='"+request.getParameter("rcrusridAD")+"',RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtmeAD"))+"',LCHG_USER_ID ='"+request.getParameter("lchusridAD")+"',LCHG_TIME =current_timestamp where REPORT_REF_NO ='"+ReporefSeq+"'");
	  
	  
	  log.info("ghf");
	    				log.info("Update======>"+sql4.toString());
	    				
						ps4 = conn.prepareStatement(sql4.toString());
						int rs4 = ps4.executeUpdate();
						if (rs4>0) {
							log.info("<<==Update Success==>>");
							/*request.setAttribute("type", "update");
							request.setAttribute("alert","Report Ref No : "   +" "+EIDSeq+" "+   "Updated Successfully");*/
							status1 = "updated";
							status = "success";
							
							
						}
	    				
	    				
	    			}else{
	    				log.info("INSERT");
	    				
	    				
	    				
	    				sql3.append("INSERT INTO CRR0100_MOD_TABLE("
	    						+ "REPORT_REF_NO,"
	    						+ "RPT_DAY,"
	    						+ "RPT_DATE,"    						
	    						+ "DEPOSIT_AMT_IN_MUR,"
	    						+ "DEPOSIT_DENOM_IN_EUR,"	
	    						+ "DEPOSIT_DENOM_IN_GBP,"
	    						+ "DEPOSIT_DENOM_IN_USD,"
	    						+ "USD_EQUIV_OTH_FCY_DEPOSIT,"

	    						+ "REC_CODE,"
	    						+ "DEL_FLG,"
	    						+ "RCRE_USER_ID,"
	    						+ "RCRE_TIME,"
	    						+ "LCHG_USER_ID,"
	    						+ "LCHG_TIME)");
	    				
	    				sql3.append("values('"+ReporefSeq.trim()+"','"+request.getParameter("rptdayAD")
	    				+"','"+df1.formatdate(request.getParameter("rptdateAD"))
	    				+"','"+request.getParameter("depamtmurAD").trim()
	    				+"','"+request.getParameter("depdeneurAD").trim()	
	    				+"','"+request.getParameter("depdengbpAD").trim()
	    				+"','"+request.getParameter("depdenusdAD")
	    				+"','"+request.getParameter("usdequforAD")
	    				
	    				+"','"+request.getParameter("reccodAD")
	    				+"','"+request.getParameter("delAD")
	    				+"','"+request.getParameter("rcrusridAD")
	    				+"','"+df1.formatdate(request.getParameter("rcrtmeAD"))
	    				+"','"+request.getParameter("lchusridAD")
	    				+"',current_timestamp) ");
	    				
	    				
	    				//log.info("loginUPDAT"+sql3.toString()+username);
	    				//+"','"+EIDSeq+"',             '"+df1.formatdate(request.getParameter("rptstart"))+"','"+df1.formatdate(request.getParameter("rptend"))+"','"+request.getParameter("rptcrncy")+"','"+request.getParameter("bnkcode")+"','"+request.getParameter("modcode")+"','"+request.getParameter("modtype")
	    				log.info("Insert"+sql3.toString());
	    				
	    				ps3 = conn.prepareStatement(sql3.toString());
	    				int rs3 = ps3.executeUpdate();
	    				
	    				if (rs3 > 0) {
	    					
	    					request.setAttribute("ReporefSeq", ReporefSeq);
	    					
	    					status1="inserted";
	    					
	    					
	    					status = "success";
	    						
	    				}
	    		    		
					
					
				}
					
				}
			
			
			
			
			
			
			
			
			}else{
				
				log.info("ELSEEEE");
				
				sql.append("SELECT Count (*) as cnt FROM   (SELECT DISTINCT RPT_DATE,REC_CODE FROM  CRR0100_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq.trim()+"' and RPT_DATE ='"+request.getParameter("rptdateAD")+"' and DEL_FLG='N'  and REC_CODE='"+request.getParameter("reccodAD")+"') ");
		
			
			
			
				log.info("select count       .... NEW===  "+sql.toString());
				ps = conn.prepareStatement(sql.toString());
				
				log.info("count test  ");
				
				ResultSet rs = ps.executeQuery();
				//log.info(rs);
				if (rs.next()) {						
					count = rs.getInt("cnt"); 
					log.info("count"+count);
					
					if (count > 0) {
						log.info("UPDATE");
						log.info("dt1--->"+request.getParameter("dt1"));
						log.info("dt2--->"+request.getParameter("dt2"));
						log.info("reportrefno====>>>"+ReporefSeq);
						log.info("rptdayAD_row--->"+request.getParameter("rptdayAD"));
						log.info("rptdateAD_row--->"+df1.formatdate(request.getParameter("rptdateAD")));
						log.info("depamtmurAD_row1--->"+request.getParameter("depamtmurAD"));
						log.info("depdeneurAD_row1--->"+request.getParameter("depdeneurAD"));

						log.info("depdengbpAD_row--->"+request.getParameter("depdengbpAD"));
						log.info("depdenusdAD_row--->"+request.getParameter("depdenusdAD"));
						log.info("usdequforAD_row--->"+request.getParameter("usdequforAD"));
						
						log.info("reccodAD_row--->"+request.getParameter("reccodAD"));
						
						log.info("rcrusridAD_row--->"+request.getParameter("rcrusridAD"));
						log.info("rcrtmeAD_row--->"+request.getParameter("rcrtmeAD"));
						log.info("lchusridAD_row--->"+request.getParameter("lchusridAD"));
						log.info("lchtmeAD_row--->"+request.getParameter("lchtmeAD"));
						
						log.info("delAD_row--->"+request.getParameter("delAD"));
						
						
	    				/*sql2.append("update CRR0100_MOD_TABLE set "
	    						
	    												+ "REPORT_REF_NO ='"+ReporefSeq+"',"
	    												+ "RPT_DAY ='"+request.getParameter("rptday")+"',"
	    												+ "RPT_DATE ='"+df1.formatdate(request.getParameter("rptdate"))+"',"
	    												+ "DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmur")+"',"
	    												+ "DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneur")+"',"
	    												+ "DEPOSIT_DENOM_IN_GBP ='"+request.getParameter("depdengbp")+"',"
	    												+ "DEPOSIT_DENOM_IN_USD ='"+df1.formatdate(request.getParameter("depdenusd"))+"',"
	    												+ "USD_EQUIV_OTH_FCY_DEPOSIT ='"+request.getParameter("usdequfor")+"',"
	    												+ "REC_CODE ='"+request.getParameter("reccod")+"',"
	    												+ "RCRE_USER_ID ='"+request.getParameter("rcrusrid")+"',"
	    												+ "RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtme"))+"',"
							    						+ "LCHG_USER_ID ='"+request.getParameter("lchusrid")+"',"
							    						+ "LCHG_TIME ='"+df1.formatdate(request.getParameter("lchtme"))+"'   where REC_CODE='"+ request.getParameter("reccod") + "' "
							    						+ "RPT_DATE='"+ df1.formatdate(request.getParameter("rptdate")) + "' ");*/
	    				
	    				
	    				
	    				
	    				
	 // sql2.append("update CRR0100_MOD_TABLE set REPORT_REF_NO ='"+ReporefSeq+"',RPT_DAY ='"+request.getParameter("rptday")+"',RPT_DATE ='"+df1.formatdate(request.getParameter("rptdate"))+"',DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmur")+" ',DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneur")+" ',DEPOSIT_DENOM_IN_GBP ='"+request.getParameter("depdengbp")+"',DEPOSIT_DENOM_IN_USD ='"+df1.formatdate(request.getParameter("depdenusd"))+" ',USD_EQUIV_OTH_FCY_DEPOSIT ='"+request.getParameter("usdequfor")+"',REC_CODE ='"+request.getParameter("reccod")+"',RCRE_USER_ID ='"+request.getParameter("rcrusrid")+"',RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtme"))+"',LCHG_USER_ID ='"+request.getParameter("lchusrid")+"',LCHG_TIME ='"+df1.formatdate(request.getParameter("lchtme"))+"'   where REPORT_REF_NO = '"+ReporefSeq+"'");
	    				
	  
	  
	  sql4.append("update CRR0100_MOD_TABLE set REPORT_REF_NO ='"+ReporefSeq.trim()+"',RPT_DAY ='"+request.getParameter("rptdayAD")+"',RPT_DATE ='"+df1.formatdate(request.getParameter("rptdateAD"))+"',DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmurAD").trim()+" ',DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneurAD").trim()+"',REC_CODE ='"+request.getParameter("reccodAD")+"',DEL_FLG ='"+request.getParameter("delAD")+"',RCRE_USER_ID ='"+request.getParameter("rcrusridAD")+"',RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtmeAD"))+"',LCHG_USER_ID ='"+request.getParameter("lchusridAD")+"',LCHG_TIME =current_timestamp where REPORT_REF_NO ='"+ReporefSeq+"' and RPT_DATE ='"+df1.formatdate(request.getParameter("rptdateAD"))+"'  and REC_CODE='"+request.getParameter("reccodAD")+"'");
	  
	  
	  log.info("ghf");
	    				log.info("Update======>"+sql4.toString());
	    				
						ps4 = conn.prepareStatement(sql4.toString());
						int rs4 = ps4.executeUpdate();
						if (rs4>0) {
							log.info("<<==Update Success==>>");
							/*request.setAttribute("type", "update");
							request.setAttribute("alert","Report Ref No : "   +" "+EIDSeq+" "+   "Updated Successfully");*/
							status1 = "updated";
							status = "success";
							
							
						}
	    				
	    				
	    			}else{
	    				log.info("INSERT");
	    				
	    				
	    				
	    				sql3.append("INSERT INTO CRR0100_MOD_TABLE("
	    						+ "REPORT_REF_NO,"
	    						+ "RPT_DAY,"
	    						+ "RPT_DATE,"    						
	    						+ "DEPOSIT_AMT_IN_MUR,"
	    						+ "DEPOSIT_DENOM_IN_EUR,"	
	    						+ "DEPOSIT_DENOM_IN_GBP,"
	    						+ "DEPOSIT_DENOM_IN_USD,"
	    						+ "USD_EQUIV_OTH_FCY_DEPOSIT,"
	    						+ "REC_CODE,"
	    						+ "DEL_FLG,"
	    						+ "RCRE_USER_ID,"
	    						+ "RCRE_TIME,"
	    						+ "LCHG_USER_ID,"
	    						+ "LCHG_TIME)");
	    				
	    				sql3.append("values('"+ReporefSeq.trim()+"','"+request.getParameter("rptdayAD")
	    				+"','"+df1.formatdate(request.getParameter("rptdateAD"))
	    				+"','"+request.getParameter("depamtmurAD").trim()
	    				+"','"+request.getParameter("depdeneurAD").trim()
	    				+"','"+request.getParameter("depdengbpAD").trim()
	    				+"','"+request.getParameter("depdenusdAD")
	    				+"','"+request.getParameter("usdequforAD")
	    				
	    				+"','"+request.getParameter("reccodAD")
	    				+"','"+request.getParameter("delAD")
	    				+"','"+request.getParameter("rcrusridAD")
	    				+"','"+df1.formatdate(request.getParameter("rcrtmeAD"))
	    				+"','"+request.getParameter("lchusridAD")
	    				+"',current_timestamp) ");
	    				
	    				
	    				//log.info("loginUPDAT"+sql3.toString()+username);
	    				//+"','"+EIDSeq+"',             '"+df1.formatdate(request.getParameter("rptstart"))+"','"+df1.formatdate(request.getParameter("rptend"))+"','"+request.getParameter("rptcrncy")+"','"+request.getParameter("bnkcode")+"','"+request.getParameter("modcode")+"','"+request.getParameter("modtype")
	    				log.info("Insert"+sql3.toString());
	    				
	    				ps3 = conn.prepareStatement(sql3.toString());
	    				int rs3 = ps3.executeUpdate();
	    				
	    				if (rs3 > 0) {
	    					
	    					request.setAttribute("ReporefSeq", ReporefSeq);
	    					
	    					status1="inserted";
	    					
	    					
	    					status = "success";
	    						
	    				}
	    		    		
					
					
				}
					
				}
			
			
			
			}
			
			//sql.append("SELECT count(distinct RPT_DATE)as cnt,count(distinct REC_CODE) as cnt1 from CRR0100_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq+"' and RPT_DAY='"+request.getParameter("rptday")+"',REC_CODE='"+request.getParameter("reccod")+"' ");
			
			
			
			//sql.append("INSERT INTO BAM_ASSET_FLOWS(DAILY_AVG_AMT,WEIGHT_AVG_INT_RATE,INT_INC_EXP) VALUES ('"+daa_val[i]+"','"+wair_val[i]+"','"+iiie_val[i]+"')");
    		
			
			
			 
		}
		
		catch (SQLException e) {
			status="error";
			e.printStackTrace();
		} 
	
		/*RepID Display Header*/
		
		refnoAD=ReporefSeq;
	
		if(status.equals("success") && status1.equals("inserted")){
        	
    		
	    	//	log.info("==insert Statusss==");
	    		//String next=lmd.insertRecord(arl,AD);
				//request.setAttribute("alert", "Report Ref No : "   +" "+EIDSeq+" "+   "Inserted Successfully.");
				request.setAttribute("type", "insertedAD");
				request.setAttribute("dt1AD", request.getParameter("dt1"));
				request.setAttribute("dt2AD", request.getParameter("dt2"));
				request.setAttribute("ReporefSeqAD", ReporefSeq);
				request.setAttribute("alert", "Report Ref No : "   +" "+ReporefSeq+" "+   "Created Successfully.");
	    		
				//XBRLCRR0100Dao dmd =new XBRLCRR0100Dao();
	    		//ArrayList<XBRLCRR0100Bean> list=dmd.xbrlcrrRR(ReporefSeq);
	    		
				return "success";
			}else if(status.equals("success") && status1.equals("updated")){
			//	log.info("==update Statusss==");
	    		//String next=lmd.insertRecord(arl,AD);
				
				request.setAttribute("type", "updatedAD");
				request.setAttribute("dt1AD", request.getParameter("dt1"));
				request.setAttribute("dt2AD", request.getParameter("dt2"));
				request.setAttribute("ReporefSeqAD", ReporefSeq);
				
				request.setAttribute("alert", "Report Ref No : "   +" "+ReporefSeq+" "+   "Updated Successfully.");
				//request.setAttribute("type", "AsstFlow");
				return "success";
			}	else{
			
				request.setAttribute("alert", "CRR Table  not updated successfully.");
				return "error";
			}
}



public String modXbcrrCreateAI() throws SQLException {
	
	log.info("sowryyyyyyyyyyyyyyyyyy");
	
	String status="";
	String status1="";
	
	String ReporefSeq="";
	HttpServletRequest request = ServletActionContext.getRequest();
	log.info("rptdayAI_row--->"+request.getParameter("rptdayAI"));
	 DateFormat df=new DateFormat();
	 
	 NullCheck nc=new NullCheck();
	
	HttpSession session = request.getSession();  
	
	log.info("dt1--->"+request.getParameter("dt1"));
	log.info("dt2--->"+request.getParameter("dt2"));
	//log.info("reportrefno====>>>"+request.getParameter("reportrefno"));
	log.info("rptdayAI_row--->"+request.getParameter("rptdayAI"));
	log.info("rptdateAI_row--->"+request.getParameter("rptdateAI"));
	log.info("depamtmurAI_row1--->"+request.getParameter("depamtmurAI"));
	log.info("depdeneurAI_row1--->"+request.getParameter("depdeneurAI"));
	log.info("depdengbpAI_row--->"+request.getParameter("depdengbpAI"));
	log.info("depdenusdAI_row--->"+request.getParameter("depdenusdAI"));
	log.info("usdequforAI_row--->"+request.getParameter("usdequforAI"));
	
	
	
	log.info("reccodAI_row--->"+request.getParameter("reccodAI"));
	
	log.info("rcrusridAI_row--->"+request.getParameter("rcrusridAI"));
	log.info("rcrtmeAI_row--->"+request.getParameter("rcrtmeAI"));
	log.info("lchusridAI_row--->"+request.getParameter("lchusridAI"));
	log.info("lchtmeAI_row--->"+request.getParameter("lchtmeAI"));
	
	log.info("lchtmeAI_row--->"+request.getParameter("lchtmeAI"));
	
	log.info("delAI_row--->"+request.getParameter("delAI"));
	
	
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	log.info("insert");
	PreparedStatement ps = null;
	PreparedStatement ps2 = null;
	
	StringBuffer sql2 = new StringBuffer();
	PreparedStatement ps3 = null;
	PreparedStatement ps4 = null;
	
	StringBuffer sql3 = new StringBuffer();
	StringBuffer sql4 = new StringBuffer();
	
	DateFormat df1=new DateFormat();
	
	
	//String passexpdate=df.formatdate(xb.getAccopendate());
	log.info("==="+request.getParameter("reportrefno"));
	
	
	if(request.getParameter("reportrefno").startsWith("R")){
		
		log.info("else notttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt ");
		 ReporefSeq =request.getParameter("reportrefno");
			
	}else{
		

		
log.info("nullllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll");

		utilities.SequenceNumber seqNo = new utilities.SequenceNumber();
	String reporefseqno = seqNo.reporefno();
	
//log.info(" seqno  :=   " + seqno);
	
	 ReporefSeq = "RR01000" + reporefseqno;
		
	}
	log.info("===ReporefSeq==="+ReporefSeq);
	//log.info("<< EIDSeq >> " + EIDSeq); 
	session.setAttribute("ReprefSeq", ReporefSeq);
	
	//int rs=0;
	
	int count=0;
	
	StringBuffer sql = new StringBuffer();
	//HttpSession session = request.getSession();  
	log.info("insert Action modXbcrrCreateAI");
	
	
	
	
		try{
			
			
			//sql.append("SELECT Count (*) as cnt FROM   (SELECT DISTINCT RPT_DATE,REC_CODE FROM  CRR0100_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq+"' and RPT_DATE >='"+request.getParameter("dt1")+"' and RPT_DATE <= '"+request.getParameter("dt2")+"'  and REC_CODE='"+request.getParameter("reccod")+"') ");
			
			if(ReporefSeq.equals("null")){
			
				log.info("IFF");
				sql.append("SELECT Count (*) as cnt FROM   (SELECT DISTINCT RPT_DATE,REC_CODE FROM  CRR0100_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq.trim()+"' and RPT_DATE >='"+request.getParameter("dt1")+"' and RPT_DATE <= '"+request.getParameter("dt2")+"'  and DEL_FLG='N'  and REC_CODE='"+request.getParameter("reccodAI")+"') ");
			
			
			
				log.info("select count       .... NEW===  "+sql.toString());
				ps = conn.prepareStatement(sql.toString());
				
				log.info("count test  ");
				
				ResultSet rs = ps.executeQuery();
				//log.info(rs);
				if (rs.next()) {						
					count = rs.getInt("cnt"); 
					log.info("count"+count);
					
					if (count > 0) {
						log.info("UPDATE");
						log.info("dt1--->"+request.getParameter("dt1"));
						log.info("dt2--->"+request.getParameter("dt2"));
						log.info("reportrefno====>>>"+ReporefSeq);
						log.info("rptdayAI_row--->"+request.getParameter("rptdayAI"));
						log.info("rptdateAI_row--->"+df1.formatdate(request.getParameter("rptdateAI")));
						log.info("depamtmurAI_row1--->"+request.getParameter("depamtmurAI"));
						log.info("depdeneurAI_row1--->"+request.getParameter("depdeneurAI"));
						log.info("depdengbpAI_row--->"+request.getParameter("depdengbpAI"));
						log.info("depdenusdAI_row--->"+request.getParameter("depdenusdAI"));
						log.info("usdequforAI_row--->"+request.getParameter("usdequforAI"));
						
						
						log.info("reccodAI_row--->"+request.getParameter("reccodAI"));
						
						log.info("rcrusridAI_row--->"+request.getParameter("rcrusridAI"));
						log.info("rcrtmeAI_row--->"+request.getParameter("rcrtmeAI"));
						log.info("lchusridAI_row--->"+request.getParameter("lchusridAI"));
						log.info("lchtmeAI_row--->"+request.getParameter("lchtmeAI"));
						
	    				/*sql2.append("update CRR0100_MOD_TABLE set "
	    						
	    												+ "REPORT_REF_NO ='"+ReporefSeq+"',"
	    												+ "RPT_DAY ='"+request.getParameter("rptday")+"',"
	    												+ "RPT_DATE ='"+df1.formatdate(request.getParameter("rptdate"))+"',"
	    												+ "DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmur")+"',"
	    												+ "DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneur")+"',"
	    												+ "DEPOSIT_DENOM_IN_GBP ='"+request.getParameter("depdengbp")+"',"
	    												+ "DEPOSIT_DENOM_IN_USD ='"+df1.formatdate(request.getParameter("depdenusd"))+"',"
	    												+ "USD_EQUIV_OTH_FCY_DEPOSIT ='"+request.getParameter("usdequfor")+"',"
	    												+ "REC_CODE ='"+request.getParameter("reccod")+"',"
	    												+ "RCRE_USER_ID ='"+request.getParameter("rcrusrid")+"',"
	    												+ "RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtme"))+"',"
							    						+ "LCHG_USER_ID ='"+request.getParameter("lchusrid")+"',"
							    						+ "LCHG_TIME ='"+df1.formatdate(request.getParameter("lchtme"))+"'   where REC_CODE='"+ request.getParameter("reccod") + "' "
							    						+ "RPT_DATE='"+ df1.formatdate(request.getParameter("rptdate")) + "' ");*/
	    				
	    				
	    				
	    				
	    				
	 // sql2.append("update CRR0100_MOD_TABLE set REPORT_REF_NO ='"+ReporefSeq+"',RPT_DAY ='"+request.getParameter("rptday")+"',RPT_DATE ='"+df1.formatdate(request.getParameter("rptdate"))+"',DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmur")+" ',DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneur")+" ',DEPOSIT_DENOM_IN_GBP ='"+request.getParameter("depdengbp")+"',DEPOSIT_DENOM_IN_USD ='"+df1.formatdate(request.getParameter("depdenusd"))+" ',USD_EQUIV_OTH_FCY_DEPOSIT ='"+request.getParameter("usdequfor")+"',REC_CODE ='"+request.getParameter("reccod")+"',RCRE_USER_ID ='"+request.getParameter("rcrusrid")+"',RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtme"))+"',LCHG_USER_ID ='"+request.getParameter("lchusrid")+"',LCHG_TIME ='"+df1.formatdate(request.getParameter("lchtme"))+"'   where REPORT_REF_NO = '"+ReporefSeq+"'");
	    				
	  
	  
	  sql4.append("update CRR0100_MOD_TABLE set REPORT_REF_NO ='"+ReporefSeq.trim()+"',RPT_DAY ='"+request.getParameter("rptdayAI")+"',RPT_DATE ='"+df1.formatdate(request.getParameter("rptdateAI"))+"',DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmurAI").trim()+" ',DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneurAI").trim()+" ',REC_CODE ='"+request.getParameter("reccodAI")+"',DEL_FLG ='"+request.getParameter("delAI")+"',RCRE_USER_ID ='"+request.getParameter("rcrusridAI")+"',RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtmeAI"))+"',LCHG_USER_ID ='"+request.getParameter("lchusridAI")+"',LCHG_TIME =current_timestamp where REPORT_REF_NO ='"+ReporefSeq+"'");
	  
	  
	  log.info("ghf");
	    				log.info("Update======>"+sql4.toString());
	    				
						ps4 = conn.prepareStatement(sql4.toString());
						int rs4 = ps4.executeUpdate();
						if (rs4>0) {
							log.info("<<==Update Success==>>");
							/*request.setAttribute("type", "update");
							request.setAttribute("alert","Report Ref No : "   +" "+EIDSeq+" "+   "Updated Successfully");*/
							status1 = "updated";
							status = "success";
							
							
						}
	    				
	    				
	    			}else{
	    				log.info("INSERT");
	    				
	    				
	    				
	    				sql3.append("INSERT INTO CRR0100_MOD_TABLE("
	    						+ "REPORT_REF_NO,"
	    						+ "RPT_DAY,"
	    						+ "RPT_DATE,"    						
	    						+ "DEPOSIT_AMT_IN_MUR,"
	    						+ "DEPOSIT_DENOM_IN_EUR,"	
	    						+ "DEPOSIT_DENOM_IN_GBP,"
	    						+ "DEPOSIT_DENOM_IN_USD,"
	    						+ "USD_EQUIV_OTH_FCY_DEPOSIT,"

	    						+ "REC_CODE,"
	    						+ "DEL_FLG,"
	    						+ "RCRE_USER_ID,"
	    						+ "RCRE_TIME,"
	    						+ "LCHG_USER_ID,"
	    						+ "LCHG_TIME)");
	    				
	    				sql3.append("values('"+ReporefSeq.trim()+"','"+request.getParameter("rptdayAI")
	    				+"','"+df1.formatdate(request.getParameter("rptdateAI"))
	    				+"','"+request.getParameter("depamtmurAI").trim()
	    				+"','"+request.getParameter("depdeneurAI").trim()	 
	    				+"','"+request.getParameter("depdengbpAI").trim()
	    				+"','"+request.getParameter("depdenusdAI")
	    				+"','"+request.getParameter("usdequforAI")
	    				+"','"+request.getParameter("reccodAI")
	    				+"','"+request.getParameter("delAI")
	    				+"','"+request.getParameter("rcrusridAI")
	    				+"','"+df1.formatdate(request.getParameter("rcrtmeAI"))
	    				+"','"+request.getParameter("lchusridAI")
	    				+"',current_timestamp) ");
	    				
	    				
	    				//log.info("loginUPDAT"+sql3.toString()+username);
	    				//+"','"+EIDSeq+"',             '"+df1.formatdate(request.getParameter("rptstart"))+"','"+df1.formatdate(request.getParameter("rptend"))+"','"+request.getParameter("rptcrncy")+"','"+request.getParameter("bnkcode")+"','"+request.getParameter("modcode")+"','"+request.getParameter("modtype")
	    				log.info("Insert"+sql3.toString());
	    				
	    				ps3 = conn.prepareStatement(sql3.toString());
	    				int rs3 = ps3.executeUpdate();
	    				
	    				if (rs3 > 0) {
	    					
	    					request.setAttribute("ReporefSeq", ReporefSeq);
	    					
	    					status1="inserted";
	    					
	    					
	    					status = "success";
	    						
	    				}
	    		    		
					
					
				}
					
				}
			
			
			
			
			
			
			
			
			}else{
				
				log.info("ELSEEEE");
				
				sql.append("SELECT Count (*) as cnt FROM   (SELECT DISTINCT RPT_DATE,REC_CODE FROM  CRR0100_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq.trim()+"' and RPT_DATE ='"+df1.formatdate(request.getParameter("rptdateAI"))+"' and DEL_FLG ='N'  and REC_CODE='"+request.getParameter("reccodAI")+"') ");
		
			
			
			
				log.info("select count       .... NEW===  "+sql.toString());
				ps = conn.prepareStatement(sql.toString());
				
				log.info("count test  ");
				
				ResultSet rs = ps.executeQuery();
				//log.info(rs);
				if (rs.next()) {						
					count = rs.getInt("cnt"); 
					log.info("count"+count);
					
					if (count > 0) {
						log.info("UPDATE");
						log.info("dt1--->"+request.getParameter("dt1"));
						log.info("dt2--->"+request.getParameter("dt2"));
						log.info("reportrefno====>>>"+ReporefSeq);
						log.info("rptdayAI_row--->"+request.getParameter("rptdayAI"));
						log.info("rptdateAI_row--->"+df1.formatdate(request.getParameter("rptdateAI")));
						log.info("depamtmurAI_row1--->"+request.getParameter("depamtmurAI"));
						log.info("depdeneurAI_row1--->"+request.getParameter("depdeneurAI"));
						log.info("depdengbpAI_row--->"+request.getParameter("depdengbpAI"));
						log.info("depdenusdAI_row--->"+request.getParameter("depdenusdAI"));
						log.info("usdequforAI_row--->"+request.getParameter("usdequforAI"));
						
						log.info("reccodAI_row--->"+request.getParameter("reccodAI"));
						
						log.info("rcrusridAI_row--->"+request.getParameter("rcrusridAI"));
						log.info("rcrtmeAI_row--->"+request.getParameter("rcrtmeAI"));
						log.info("lchusridAI_row--->"+request.getParameter("lchusridAI"));
						log.info("lchtmeAI_row--->"+request.getParameter("lchtmeAI"));
						
						log.info("delAI_row--->"+request.getParameter("delAI"));
						
	    				/*sql2.append("update CRR0100_MOD_TABLE set "
	    						
	    												+ "REPORT_REF_NO ='"+ReporefSeq+"',"
	    												+ "RPT_DAY ='"+request.getParameter("rptday")+"',"
	    												+ "RPT_DATE ='"+df1.formatdate(request.getParameter("rptdate"))+"',"
	    												+ "DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmur")+"',"
	    												+ "DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneur")+"',"
	    												+ "DEPOSIT_DENOM_IN_GBP ='"+request.getParameter("depdengbp")+"',"
	    												+ "DEPOSIT_DENOM_IN_USD ='"+df1.formatdate(request.getParameter("depdenusd"))+"',"
	    												+ "USD_EQUIV_OTH_FCY_DEPOSIT ='"+request.getParameter("usdequfor")+"',"
	    												+ "REC_CODE ='"+request.getParameter("reccod")+"',"
	    												+ "RCRE_USER_ID ='"+request.getParameter("rcrusrid")+"',"
	    												+ "RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtme"))+"',"
							    						+ "LCHG_USER_ID ='"+request.getParameter("lchusrid")+"',"
							    						+ "LCHG_TIME ='"+df1.formatdate(request.getParameter("lchtme"))+"'   where REC_CODE='"+ request.getParameter("reccod") + "' "
							    						+ "RPT_DATE='"+ df1.formatdate(request.getParameter("rptdate")) + "' ");*/
	    				
	    				
	    				
	    				
	    				
	 // sql2.append("update CRR0100_MOD_TABLE set REPORT_REF_NO ='"+ReporefSeq+"',RPT_DAY ='"+request.getParameter("rptday")+"',RPT_DATE ='"+df1.formatdate(request.getParameter("rptdate"))+"',DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmur")+" ',DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneur")+" ',DEPOSIT_DENOM_IN_GBP ='"+request.getParameter("depdengbp")+"',DEPOSIT_DENOM_IN_USD ='"+df1.formatdate(request.getParameter("depdenusd"))+" ',USD_EQUIV_OTH_FCY_DEPOSIT ='"+request.getParameter("usdequfor")+"',REC_CODE ='"+request.getParameter("reccod")+"',RCRE_USER_ID ='"+request.getParameter("rcrusrid")+"',RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtme"))+"',LCHG_USER_ID ='"+request.getParameter("lchusrid")+"',LCHG_TIME ='"+df1.formatdate(request.getParameter("lchtme"))+"'   where REPORT_REF_NO = '"+ReporefSeq+"'");
	    				
	  
	  
	  sql4.append("update CRR0100_MOD_TABLE set REPORT_REF_NO ='"+ReporefSeq.trim()+"',RPT_DAY ='"+request.getParameter("rptdayAI")+"',RPT_DATE ='"+df1.formatdate(request.getParameter("rptdateAI"))+"',DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmurAI").trim()+" ',DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneurAI").trim()+"',REC_CODE ='"+request.getParameter("reccodAI")+"',DEL_FLG ='"+request.getParameter("delAI")+"',RCRE_USER_ID ='"+request.getParameter("rcrusridAI")+"',RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtmeAI"))+"',LCHG_USER_ID ='"+request.getParameter("lchusridAI")+"',LCHG_TIME =current_timestamp where REPORT_REF_NO ='"+ReporefSeq+"' and RPT_DATE ='"+df1.formatdate(request.getParameter("rptdateAI"))+"'  and REC_CODE='"+request.getParameter("reccodAI")+"'");
	  
	  
	  log.info("ghf");
	    				log.info("Update======>"+sql4.toString());
	    				
						ps4 = conn.prepareStatement(sql4.toString());
						int rs4 = ps4.executeUpdate();
						if (rs4>0) {
							log.info("<<==Update Success==>>");
							/*request.setAttribute("type", "update");
							request.setAttribute("alert","Report Ref No : "   +" "+EIDSeq+" "+   "Updated Successfully");*/
							status1 = "updated";
							status = "success";
							
							
						}
	    				
	    				
	    			}else{
	    				log.info("INSERT");
	    				
	    				
	    				
	    				sql3.append("INSERT INTO CRR0100_MOD_TABLE("
	    						+ "REPORT_REF_NO,"
	    						+ "RPT_DAY,"
	    						+ "RPT_DATE,"    						
	    						+ "DEPOSIT_AMT_IN_MUR,"
	    						+ "DEPOSIT_DENOM_IN_EUR,"	
	    						+ "DEPOSIT_DENOM_IN_GBP,"
	    						+ "DEPOSIT_DENOM_IN_USD,"
	    						+ "USD_EQUIV_OTH_FCY_DEPOSIT,"

	    						+ "REC_CODE,"
	    						+ "DEL_FLG,"
	    						+ "RCRE_USER_ID,"
	    						+ "RCRE_TIME,"
	    						+ "LCHG_USER_ID,"
	    						+ "LCHG_TIME)");
	    				
	    				sql3.append("values('"+ReporefSeq.trim()+"','"+request.getParameter("rptdayAI")
	    				+"','"+df1.formatdate(request.getParameter("rptdateAI"))
	    				+"','"+request.getParameter("depamtmurAI").trim()
	    				+"','"+request.getParameter("depdeneurAI").trim()
	    				+"','"+request.getParameter("depdengbpAI").trim()
	    				+"','"+request.getParameter("depdenusdAI")
	    				+"','"+request.getParameter("usdequforAI")
	    				
	    				+"','"+request.getParameter("reccodAI")
	    				+"','"+request.getParameter("delAI")
	    				+"','"+request.getParameter("rcrusridAI")
	    				+"','"+df1.formatdate(request.getParameter("rcrtmeAI"))
	    				+"','"+request.getParameter("lchusridAI")
	    				+"',current_timestamp)");
	    				
	    				
	    				//log.info("loginUPDAT"+sql3.toString()+username);
	    				//+"','"+EIDSeq+"',             '"+df1.formatdate(request.getParameter("rptstart"))+"','"+df1.formatdate(request.getParameter("rptend"))+"','"+request.getParameter("rptcrncy")+"','"+request.getParameter("bnkcode")+"','"+request.getParameter("modcode")+"','"+request.getParameter("modtype")
	    				log.info("Insert"+sql3.toString());
	    				
	    				ps3 = conn.prepareStatement(sql3.toString());
	    				int rs3 = ps3.executeUpdate();
	    				
	    				if (rs3 > 0) {
	    					
	    					request.setAttribute("ReporefSeq", ReporefSeq);
	    					
	    					status1="inserted";
	    					
	    					
	    					status = "success";
	    						
	    				}
	    		    		
					
					
				}
					
				}
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			}
			
			//sql.append("SELECT count(distinct RPT_DATE)as cnt,count(distinct REC_CODE) as cnt1 from CRR0100_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq+"' and RPT_DAY='"+request.getParameter("rptday")+"',REC_CODE='"+request.getParameter("reccod")+"' ");
			
			
			
			//sql.append("INSERT INTO BAM_ASSET_FLOWS(DAILY_AVG_AMT,WEIGHT_AVG_INT_RATE,INT_INC_EXP) VALUES ('"+daa_val[i]+"','"+wair_val[i]+"','"+iiie_val[i]+"')");
    		
			
			
			 
		}
		
		catch (SQLException e) {
			status="error";
			e.printStackTrace();
		} 
	
		/*RepID Display HeAIer*/
		
		refnoAI=ReporefSeq;
	
		if(status.equals("success") && status1.equals("inserted")){
        	
    		
	    		log.info("==insert Statusss==");
	    		//String next=lmd.insertRecord(arl,af);
				//request.setAttribute("alert", "Report Ref No : "   +" "+EIDSeq+" "+   "Inserted Successfully.");
				request.setAttribute("type", "insertedAI");
				request.setAttribute("dt1AI", request.getParameter("dt1"));
				request.setAttribute("dt2AI", request.getParameter("dt2"));
				request.setAttribute("ReporefSeqAI", ReporefSeq);
				request.setAttribute("alert", "Report Ref No : "   +" "+ReporefSeq+" "+   "Created Successfully.");
	    		
				//XBRLCRR0100Dao dmd =new XBRLCRR0100Dao();
	    		//ArrayList<XBRLCRR0100Bean> list=dmd.xbrlcrrRR(ReporefSeq);
	    		
				return "success";
			}else if(status.equals("success") && status1.equals("updated")){
			//	log.info("==update Statusss==");
	    		//String next=lmd.insertRecord(arl,af);
				
				request.setAttribute("type", "updatedAI");
				request.setAttribute("dt1AI", request.getParameter("dt1"));
				request.setAttribute("dt2AI", request.getParameter("dt2"));
				request.setAttribute("ReporefSeqAI", ReporefSeq);
				
				request.setAttribute("alert", "Report Ref No : "   +" "+ReporefSeq+" "+   "Updated Successfully.");
				//request.setAttribute("type", "AsstFlow");
				return "success";
			}	else{
			
				request.setAttribute("alert", "CRR Table  not updated successfully.");
				return "error";
			}
}
public String modXbcrrCreateBB() throws SQLException {
	
	log.info("modXbcrrCreateBB");
	
	String status="";
	String status1="";
	
	String ReporefSeq="";
	HttpServletRequest request = ServletActionContext.getRequest();
	log.info("rptdayBB_row--->"+request.getParameter("rptdayBB"));
	 DateFormat df=new DateFormat();
	 
	 NullCheck nc=new NullCheck();
	
	HttpSession session = request.getSession();  
	
	log.info("dt1--->"+request.getParameter("dt1"));
	log.info("dt2--->"+request.getParameter("dt2"));
	//log.info("reportrefno====>>>"+request.getParameter("reportrefno"));
	log.info("rptdayBB_row--->"+request.getParameter("rptdayBB"));
	log.info("rptdateBB_row--->"+request.getParameter("rptdateBB"));
	log.info("depamtmurBB_row1--->"+request.getParameter("depamtmurBB"));
	log.info("depdeneurBB_row1--->"+request.getParameter("depdeneurBB"));
	
	log.info("reccodBB_row--->"+request.getParameter("reccodBB"));
	
	log.info("rcrusridBB_row--->"+request.getParameter("rcrusridBB"));
	log.info("rcrtmeBB_row--->"+request.getParameter("rcrtmeBB"));
	log.info("lchusridBB_row--->"+request.getParameter("lchusridBB"));
	log.info("lchtmeBB_row--->"+request.getParameter("lchtmeBB"));
	
	log.info("delBB_row--->"+request.getParameter("delBB"));
	
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	log.info("insert");
	PreparedStatement ps = null;
	PreparedStatement ps2 = null;
	
	StringBuffer sql2 = new StringBuffer();
	PreparedStatement ps3 = null;
	PreparedStatement ps4 = null;
	
	StringBuffer sql3 = new StringBuffer();
	StringBuffer sql4 = new StringBuffer();
	
	DateFormat df1=new DateFormat();
	
	
	//String passexpdate=df.formatdate(xb.getAccopendate());
	log.info("==="+request.getParameter("reportrefno"));
	
	
	if(request.getParameter("reportrefno").startsWith("R")){
		
		log.info("else notttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt ");
		 ReporefSeq =request.getParameter("reportrefno");
			
	}else{
		

		
log.info("nullllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll");

		utilities.SequenceNumber seqNo = new utilities.SequenceNumber();
	String reporefseqno = seqNo.reporefno();
	
//log.info(" seqno  :=   " + seqno);
	
	 ReporefSeq = "RR01000" + reporefseqno;
		
	}
	log.info("===ReporefSeq==="+ReporefSeq);
	//log.info("<< EIDSeq >> " + EIDSeq); 
	session.setAttribute("ReprefSeq", ReporefSeq);
	
	//int rs=0;
	
	int count=0;
	
	StringBuffer sql = new StringBuffer();
	//HttpSession session = request.getSession();  
	log.info("insert Action modXbcrrCreateBB");
	
	
	
	
		try{
			
			
			//sql.append("SELECT Count (*) as cnt FROM   (SELECT DISTINCT RPT_DATE,REC_CODE FROM  CRR0100_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq+"' and RPT_DATE >='"+request.getParameter("dt1")+"' and RPT_DATE <= '"+request.getParameter("dt2")+"'  and REC_CODE='"+request.getParameter("reccod")+"') ");
			
			if(ReporefSeq.equals("null")){
			
				log.info("IFF");
				sql.append("SELECT Count (*) as cnt FROM   (SELECT DISTINCT RPT_DATE,REC_CODE FROM  CRR0100_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq.trim()+"' and RPT_DATE >='"+request.getParameter("dt1")+"' and RPT_DATE <= '"+request.getParameter("dt2")+"'  and DEL_FLG = 'N'  and REC_CODE='"+request.getParameter("reccod")+"') ");
			
			
			
				log.info("select count       .... NEW===  "+sql.toString());
				ps = conn.prepareStatement(sql.toString());
				
				log.info("count test  ");
				
				ResultSet rs = ps.executeQuery();
				//log.info(rs);
				if (rs.next()) {						
					count = rs.getInt("cnt"); 
					log.info("count"+count);
					
					if (count > 0) {
						log.info("UPDATE");
						log.info("dt1--->"+request.getParameter("dt1"));
						log.info("dt2--->"+request.getParameter("dt2"));
						log.info("reportrefno====>>>"+ReporefSeq);
						log.info("rptdayBB_row--->"+request.getParameter("rptdayBB"));
						log.info("rptdateBB_row--->"+df1.formatdate(request.getParameter("rptdateBB")));
						log.info("depamtmurBB_row1--->"+request.getParameter("depamtmurBB"));
						log.info("depdeneurBB_row1--->"+request.getParameter("depdeneurBB"));
						
						log.info("reccodBB_row--->"+request.getParameter("reccodBB"));
						
						log.info("rcrusridBB_row--->"+request.getParameter("rcrusridBB"));
						log.info("rcrtmeBB_row--->"+request.getParameter("rcrtmeBB"));
						log.info("lchusridBB_row--->"+request.getParameter("lchusridBB"));
						log.info("lchtmeBB_row--->"+request.getParameter("lchtmeBB"));
						
						log.info("delBB_row--->"+request.getParameter("delBB"));
						
	    				/*sql2.append("update CRR0100_MOD_TABLE set "
	    						
	    												+ "REPORT_REF_NO ='"+ReporefSeq+"',"
	    												+ "RPT_DAY ='"+request.getParameter("rptday")+"',"
	    												+ "RPT_DATE ='"+df1.formatdate(request.getParameter("rptdate"))+"',"
	    												+ "DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmur")+"',"
	    												+ "DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneur")+"',"
	    												+ "DEPOSIT_DENOM_IN_GBP ='"+request.getParameter("depdengbp")+"',"
	    												+ "DEPOSIT_DENOM_IN_USD ='"+df1.formatdate(request.getParameter("depdenusd"))+"',"
	    												+ "USD_EQUIV_OTH_FCY_DEPOSIT ='"+request.getParameter("usdequfor")+"',"
	    												+ "REC_CODE ='"+request.getParameter("reccod")+"',"
	    												+ "RCRE_USER_ID ='"+request.getParameter("rcrusrid")+"',"
	    												+ "RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtme"))+"',"
							    						+ "LCHG_USER_ID ='"+request.getParameter("lchusrid")+"',"
							    						+ "LCHG_TIME ='"+df1.formatdate(request.getParameter("lchtme"))+"'   where REC_CODE='"+ request.getParameter("reccod") + "' "
							    						+ "RPT_DATE='"+ df1.formatdate(request.getParameter("rptdate")) + "' ");*/
	    				
	    				
	    				
	    				
	    				
	 // sql2.append("update CRR0100_MOD_TABLE set REPORT_REF_NO ='"+ReporefSeq+"',RPT_DAY ='"+request.getParameter("rptday")+"',RPT_DATE ='"+df1.formatdate(request.getParameter("rptdate"))+"',DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmur")+" ',DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneur")+" ',DEPOSIT_DENOM_IN_GBP ='"+request.getParameter("depdengbp")+"',DEPOSIT_DENOM_IN_USD ='"+df1.formatdate(request.getParameter("depdenusd"))+" ',USD_EQUIV_OTH_FCY_DEPOSIT ='"+request.getParameter("usdequfor")+"',REC_CODE ='"+request.getParameter("reccod")+"',RCRE_USER_ID ='"+request.getParameter("rcrusrid")+"',RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtme"))+"',LCHG_USER_ID ='"+request.getParameter("lchusrid")+"',LCHG_TIME ='"+df1.formatdate(request.getParameter("lchtme"))+"'   where REPORT_REF_NO = '"+ReporefSeq+"'");
	    				
	  
	  
	  sql4.append("update CRR0100_MOD_TABLE set REPORT_REF_NO ='"+ReporefSeq.trim()+"',RPT_DAY ='"+request.getParameter("rptdayBB")+"',RPT_DATE ='"+df1.formatdate(request.getParameter("rptdateBB"))+"',DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmurBB").trim()+" ',DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneurBB").trim()+"',REC_CODE ='"+request.getParameter("reccodBB")+"',DEL_FLG ='"+request.getParameter("delBB")+"',RCRE_USER_ID ='"+request.getParameter("rcrusridBB")+"',RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtmeBB"))+"',LCHG_USER_ID ='"+request.getParameter("lchusridBB")+"',LCHG_TIME ='"+df1.formatdate(request.getParameter("lchtmeBB"))+"' where REPORT_REF_NO ='"+ReporefSeq+"'");
	  
	  
	  log.info("ghf");
	    				log.info("Update======>"+sql4.toString());
	    				
						ps4 = conn.prepareStatement(sql4.toString());
						int rs4 = ps4.executeUpdate();
						if (rs4>0) {
							log.info("<<==Update Success==>>");
							/*request.setAttribute("type", "update");
							request.setAttribute("alert","Report Ref No : "   +" "+EIDSeq+" "+   "Updated Successfully");*/
							status1 = "updated";
							status = "success";
							
							
						}
	    				
	    				
	    			}else{
	    				log.info("INSERT");
	    				
	    				
	    				
	    				sql3.append("INSERT INTO CRR0100_MOD_TABLE("
	    						+ "REPORT_REF_NO,"
	    						+ "RPT_DAY,"
	    						+ "RPT_DATE,"    						
	    						+ "DEPOSIT_AMT_IN_MUR,"
	    						+ "DEPOSIT_DENOM_IN_EUR,"	    						
	    						+ "REC_CODE,"
	    						+ "DEL_FLG,"
	    						+ "RCRE_USER_ID,"
	    						+ "RCRE_TIME,"
	    						+ "LCHG_USER_ID,"
	    						+ "LCHG_TIME)");
	    				
	    				sql3.append("values('"+ReporefSeq.trim()+"','"+request.getParameter("rptdayBB")
	    				+"','"+df1.formatdate(request.getParameter("rptdateBB"))
	    				+"','"+request.getParameter("depamtmurBB").trim()
	    				+"','"+request.getParameter("depdeneurBB").trim()	    			
	    				+"','"+request.getParameter("reccodBB")
	    				+"','"+request.getParameter("delBB")
	    				+"','"+request.getParameter("rcrusridBB")
	    				+"','"+df1.formatdate(request.getParameter("rcrtmeBB"))
	    				+"','"+request.getParameter("lchusridBB")
	    				+"',current_timestamp)");
	    				
	    				
	    				//log.info("loginUPDAT"+sql3.toString()+username);
	    				//+"','"+EIDSeq+"',             '"+df1.formatdate(request.getParameter("rptstart"))+"','"+df1.formatdate(request.getParameter("rptend"))+"','"+request.getParameter("rptcrncy")+"','"+request.getParameter("bnkcode")+"','"+request.getParameter("modcode")+"','"+request.getParameter("modtype")
	    				log.info("Insert"+sql3.toString());
	    				
	    				ps3 = conn.prepareStatement(sql3.toString());
	    				int rs3 = ps3.executeUpdate();
	    				
	    				if (rs3 > 0) {
	    					
	    					request.setAttribute("ReporefSeq", ReporefSeq);
	    					
	    					status1="inserted";
	    					
	    					
	    					status = "success";
	    						
	    				}
	    		    		
					
					
				}
					
				}
			
			
			
			
			
			
			
			
			}else{
				
				log.info("ELSEEEE");
				
				sql.append("SELECT Count (*) as cnt FROM   (SELECT DISTINCT RPT_DATE,REC_CODE FROM  CRR0100_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq.trim()+"' and DEL_FLG ='N' and RPT_DATE ='"+request.getParameter("rptdateBB")+"') ");
		
			
			
			
				log.info("select count       .... NEW===  "+sql.toString());
				ps = conn.prepareStatement(sql.toString());
				
				log.info("count test  ");
				
				ResultSet rs = ps.executeQuery();
				//log.info(rs);
				if (rs.next()) {						
					count = rs.getInt("cnt"); 
					log.info("count"+count);
					
					if (count > 0) {
						log.info("UPDATE");
						log.info("dt1--->"+request.getParameter("dt1"));
						log.info("dt2--->"+request.getParameter("dt2"));
						log.info("reportrefno====>>>"+ReporefSeq);
						log.info("rptdayBB_row--->"+request.getParameter("rptdayBB"));
						log.info("rptdateBB_row--->"+df1.formatdate(request.getParameter("rptdateBB")));
						log.info("depamtmurBB_row1--->"+request.getParameter("depamtmurBB"));
						log.info("depdeneurBB_row1--->"+request.getParameter("depdeneurBB"));
						
						log.info("reccodBB_row--->"+request.getParameter("reccodBB"));
						
						log.info("rcrusridBB_row--->"+request.getParameter("rcrusridBB"));
						log.info("rcrtmeBB_row--->"+request.getParameter("rcrtmeBB"));
						log.info("lchusridBB_row--->"+request.getParameter("lchusridBB"));
						log.info("lchtmeBB_row--->"+request.getParameter("lchtmeBB"));
						
						log.info("delBB_row--->"+request.getParameter("delBB"));
						
						
	    				/*sql2.append("update CRR0100_MOD_TABLE set "
	    						
	    												+ "REPORT_REF_NO ='"+ReporefSeq+"',"
	    												+ "RPT_DAY ='"+request.getParameter("rptday")+"',"
	    												+ "RPT_DATE ='"+df1.formatdate(request.getParameter("rptdate"))+"',"
	    												+ "DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmur")+"',"
	    												+ "DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneur")+"',"
	    												+ "DEPOSIT_DENOM_IN_GBP ='"+request.getParameter("depdengbp")+"',"
	    												+ "DEPOSIT_DENOM_IN_USD ='"+df1.formatdate(request.getParameter("depdenusd"))+"',"
	    												+ "USD_EQUIV_OTH_FCY_DEPOSIT ='"+request.getParameter("usdequfor")+"',"
	    												+ "REC_CODE ='"+request.getParameter("reccod")+"',"
	    												+ "RCRE_USER_ID ='"+request.getParameter("rcrusrid")+"',"
	    												+ "RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtme"))+"',"
							    						+ "LCHG_USER_ID ='"+request.getParameter("lchusrid")+"',"
							    						+ "LCHG_TIME ='"+df1.formatdate(request.getParameter("lchtme"))+"'   where REC_CODE='"+ request.getParameter("reccod") + "' "
							    						+ "RPT_DATE='"+ df1.formatdate(request.getParameter("rptdate")) + "' ");*/
	    				
	    				
	    				
	    				
	    				
	 // sql2.append("update CRR0100_MOD_TABLE set REPORT_REF_NO ='"+ReporefSeq+"',RPT_DAY ='"+request.getParameter("rptday")+"',RPT_DATE ='"+df1.formatdate(request.getParameter("rptdate"))+"',DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmur")+" ',DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneur")+" ',DEPOSIT_DENOM_IN_GBP ='"+request.getParameter("depdengbp")+"',DEPOSIT_DENOM_IN_USD ='"+df1.formatdate(request.getParameter("depdenusd"))+" ',USD_EQUIV_OTH_FCY_DEPOSIT ='"+request.getParameter("usdequfor")+"',REC_CODE ='"+request.getParameter("reccod")+"',RCRE_USER_ID ='"+request.getParameter("rcrusrid")+"',RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtme"))+"',LCHG_USER_ID ='"+request.getParameter("lchusrid")+"',LCHG_TIME ='"+df1.formatdate(request.getParameter("lchtme"))+"'   where REPORT_REF_NO = '"+ReporefSeq+"'");
	    				
	  
	  
	  sql4.append("update CRR0100_MOD_TABLE set REPORT_REF_NO ='"+ReporefSeq.trim()+"',RPT_DAY ='"+request.getParameter("rptdayBB")+"',RPT_DATE ='"+df1.formatdate(request.getParameter("rptdateBB"))+"',DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmurBB").trim()+" ',DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneurBB").trim()+"',REC_CODE ='"+request.getParameter("reccodBB")+"',DEL_FLG ='"+request.getParameter("delBB")+"',RCRE_USER_ID ='"+request.getParameter("rcrusridBB")+"',RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtmeBB"))+"',LCHG_USER_ID ='"+request.getParameter("lchusridBB")+"',LCHG_TIME =current_timestamp where REPORT_REF_NO ='"+ReporefSeq+"' and RPT_DATE ='"+df1.formatdate(request.getParameter("rptdateBB"))+"'");
	  
	  
	  log.info("ghf");
	    				log.info("Update======>"+sql4.toString());
	    				
						ps4 = conn.prepareStatement(sql4.toString());
						int rs4 = ps4.executeUpdate();
						if (rs4>0) {
							log.info("<<==Update Success==>>");
							/*request.setAttribute("type", "update");
							request.setAttribute("alert","Report Ref No : "   +" "+EIDSeq+" "+   "Updated Successfully");*/
							status1 = "updated";
							status = "success";
							
							
						}
	    				
	    				
	    			}else{
	    				log.info("INSERT");
	    				
	    				
	    				
	    				sql3.append("INSERT INTO CRR0100_MOD_TABLE("
	    						+ "REPORT_REF_NO,"
	    						+ "RPT_DAY,"
	    						+ "RPT_DATE,"    						
	    						+ "DEPOSIT_AMT_IN_MUR,"
	    						+ "DEPOSIT_DENOM_IN_EUR,"	    						
	    						+ "REC_CODE,"
	    						+ "DEL_FLG,"
	    						+ "RCRE_USER_ID,"
	    						+ "RCRE_TIME,"
	    						+ "LCHG_USER_ID,"
	    						+ "LCHG_TIME)");
	    				
	    				sql3.append("values('"+ReporefSeq.trim()+"','"+request.getParameter("rptdayBB")
	    				+"','"+df1.formatdate(request.getParameter("rptdateBB"))
	    				+"','"+request.getParameter("depamtmurBB").trim()
	    				+"','"+request.getParameter("depdeneurBB").trim()	    				
	    				+"','"+request.getParameter("reccodBB")
	    				+"','"+request.getParameter("delBB")
	    				+"','"+request.getParameter("rcrusridBB")
	    				+"','"+df1.formatdate(request.getParameter("rcrtmeBB"))
	    				+"','"+request.getParameter("lchusridBB")
	    				+"',current_timestamp) ");
	    				
	    				
	    				//log.info("loginUPDAT"+sql3.toString()+username);
	    				//+"','"+EIDSeq+"',             '"+df1.formatdate(request.getParameter("rptstart"))+"','"+df1.formatdate(request.getParameter("rptend"))+"','"+request.getParameter("rptcrncy")+"','"+request.getParameter("bnkcode")+"','"+request.getParameter("modcode")+"','"+request.getParameter("modtype")
	    				log.info("Insert"+sql3.toString());
	    				
	    				ps3 = conn.prepareStatement(sql3.toString());
	    				int rs3 = ps3.executeUpdate();
	    				
	    				if (rs3 > 0) {
	    					
	    					request.setAttribute("ReporefSeq", ReporefSeq);
	    					
	    					status1="inserted";
	    					
	    					
	    					status = "success";
	    						
	    				}
	    		    		
					
					
				}
					
				}
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			}
			
			//sql.append("SELECT count(distinct RPT_DATE)as cnt,count(distinct REC_CODE) as cnt1 from CRR0100_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq+"' and RPT_DAY='"+request.getParameter("rptday")+"',REC_CODE='"+request.getParameter("reccod")+"' ");
			
			
			
			//sql.append("INSERT INTO BAM_ASSET_FLOWS(DBBLY_AVG_AMT,WEIGHT_AVG_INT_RATE,INT_INC_EXP) VALUES ('"+daa_val[i]+"','"+wBBr_val[i]+"','"+iiie_val[i]+"')");
    		
			
			
			 
		}
		
		catch (SQLException e) {
			status="error";
			e.printStackTrace();
		} 
	
		/*RepID Display HeBBer*/
		
		refnoBB=ReporefSeq;
	
		if(status.equals("success") && status1.equals("inserted")){
        	
    		
	    		log.info("==insert Statusss==");
	    		//String next=lmd.insertRecord(arl,af);
				//request.setAttribute("alert", "Report Ref No : "   +" "+EIDSeq+" "+   "Inserted Successfully.");
				request.setAttribute("type", "insertedBB");
				request.setAttribute("dt1BB", request.getParameter("dt1"));
				request.setAttribute("dt2BB", request.getParameter("dt2"));
				request.setAttribute("ReporefSeqBB", ReporefSeq);
				request.setAttribute("alert", "Report Ref No : "   +" "+ReporefSeq+" "+   "Created Successfully.");
	    		
				//XBRLCRR0100Dao dmd =new XBRLCRR0100Dao();
	    		//ArrayList<XBRLCRR0100Bean> list=dmd.xbrlcrrRR(ReporefSeq);
	    		
				return "success";
			}else if(status.equals("success") && status1.equals("updated")){
			//	log.info("==update Statusss==");
	    		//String next=lmd.insertRecord(arl,af);
				
				request.setAttribute("type", "updatedBB");
				request.setAttribute("dt1BB", request.getParameter("dt1"));
				request.setAttribute("dt2BB", request.getParameter("dt2"));
				request.setAttribute("ReporefSeqBB", ReporefSeq);
				
				request.setAttribute("alert", "Report Ref No : "   +" "+ReporefSeq+" "+   "Updated Successfully.");
				//request.setAttribute("type", "AsstFlow");
				return "success";
			}	else{
			
				request.setAttribute("alert", "CRR Table  not updated successfully.");
				return "error";
			}
}
public String modXbcrrCreateAE() throws SQLException {
	
	log.info("sowryyyyyyyyyyyyyyyyyy");
	
	String status="";
	String status1="";
	
	String ReporefSeq="";
	HttpServletRequest request = ServletActionContext.getRequest();
	log.info("rptdayAE_row--->"+request.getParameter("rptdayAE"));
	 DateFormat df=new DateFormat();
	 
	 NullCheck nc=new NullCheck();
	
	HttpSession session = request.getSession();  
	
	log.info("dt1--->"+request.getParameter("dt1"));
	log.info("dt2--->"+request.getParameter("dt2"));
	//log.info("reportrefno====>>>"+request.getParameter("reportrefno"));
	log.info("rptdayAE_row--->"+request.getParameter("rptdayAE"));
	log.info("rptdateAE_row--->"+request.getParameter("rptdateAE"));
	log.info("depamtmurAE_row1--->"+request.getParameter("depamtmurAE"));
	log.info("depdeneurAE_row1--->"+request.getParameter("depdeneurAE"));
	
	log.info("depdengbpAE_row--->"+request.getParameter("depdengbpAE"));
	log.info("depdenusdAE_row--->"+request.getParameter("depdenusdAE"));
	log.info("usdequforAE_row--->"+request.getParameter("usdequforAE"));
	
	
	
	
	log.info("reccodAE_row--->"+request.getParameter("reccodAE"));
	
	log.info("rcrusridAE_row--->"+request.getParameter("rcrusridAE"));
	log.info("rcrtmeAE_row--->"+request.getParameter("rcrtmeAE"));
	log.info("lchusridAE_row--->"+request.getParameter("lchusridAE"));
	log.info("lchtmeAE_row--->"+request.getParameter("lchtmeAE"));
	
	log.info("delAE_row--->"+request.getParameter("delAE"));
	
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	log.info("insert");
	PreparedStatement ps = null;
	PreparedStatement ps2 = null;
	
	StringBuffer sql2 = new StringBuffer();
	PreparedStatement ps3 = null;
	PreparedStatement ps4 = null;
	
	StringBuffer sql3 = new StringBuffer();
	StringBuffer sql4 = new StringBuffer();
	
	DateFormat df1=new DateFormat();
	
	
	//String passexpdate=df.formatdate(xb.getAEcopendate());
	log.info("==="+request.getParameter("reportrefno"));
	
	
	if(request.getParameter("reportrefno").startsWith("R")){
		
		log.info("else notttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt ");
		 ReporefSeq =request.getParameter("reportrefno");
			
	}else{
		

		
log.info("nullllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll");

		utilities.SequenceNumber seqNo = new utilities.SequenceNumber();
	String reporefseqno = seqNo.reporefno();
	
//log.info(" seqno  :=   " + seqno);
	
	 ReporefSeq = "RR01000" + reporefseqno;
		
	}
	log.info("===ReporefSeq==="+ReporefSeq);
	//log.info("<< EIDSeq >> " + EIDSeq); 
	session.setAttribute("ReprefSeq", ReporefSeq);
	
	//int rs=0;
	
	int count=0;
	
	StringBuffer sql = new StringBuffer();
	//HttpSession session = request.getSession();  
	log.info("insert AEtion modXbcrrCreateAE");
	
	
	
	
		try{
			
			
			//sql.append("SELECT Count (*) as cnt FROM   (SELECT DISTINCT RPT_DATE,REC_CODE FROM  CRR0100_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq+"' and RPT_DATE >='"+request.getParameter("dt1")+"' and RPT_DATE <= '"+request.getParameter("dt2")+"'  and REC_CODE='"+request.getParameter("reccod")+"') ");
			
			if(ReporefSeq.equals("null")){
			
				log.info("IFF");
				sql.append("SELECT Count (*) as cnt FROM   (SELECT DISTINCT RPT_DATE,REC_CODE FROM  CRR0100_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq.trim()+"' and RPT_DATE >='"+request.getParameter("dt1")+"' and RPT_DATE <= '"+request.getParameter("dt2")+"'  and DEL_FLG = 'N' and REC_CODE='"+request.getParameter("reccodAE")+"') ");
			
			
			
				log.info("select count       .... NEW===  "+sql.toString());
				ps = conn.prepareStatement(sql.toString());
				
				log.info("count test  ");
				
				ResultSet rs = ps.executeQuery();
				//log.info(rs);
				if (rs.next()) {						
					count = rs.getInt("cnt"); 
					log.info("count"+count);
					
					if (count > 0) {
						log.info("UPDATE");
						log.info("dt1--->"+request.getParameter("dt1"));
						log.info("dt2--->"+request.getParameter("dt2"));
						log.info("reportrefno====>>>"+ReporefSeq);
						log.info("rptdayAE_row--->"+request.getParameter("rptdayAE"));
						log.info("rptdateAE_row--->"+df1.formatdate(request.getParameter("rptdateAE")));
						log.info("depamtmurAE_row1--->"+request.getParameter("depamtmurAE"));
						log.info("depdeneurAE_row1--->"+request.getParameter("depdeneurAE"));

						log.info("depdengbpAE_row--->"+request.getParameter("depdengbpAE"));
						log.info("depdenusdAE_row--->"+request.getParameter("depdenusdAE"));
						log.info("usdequforAE_row--->"+request.getParameter("usdequforAE"));
						
						log.info("reccodAE_row--->"+request.getParameter("reccodAE"));
						
						log.info("rcrusridAE_row--->"+request.getParameter("rcrusridAE"));
						log.info("rcrtmeAE_row--->"+request.getParameter("rcrtmeAE"));
						log.info("lchusridAE_row--->"+request.getParameter("lchusridAE"));
						log.info("lchtmeAE_row--->"+request.getParameter("lchtmeAE"));
						
						log.info("delAE_row--->"+request.getParameter("delAE"));
						
						
	    				/*sql2.append("update CRR0100_MOD_TABLE set "
	    						
	    												+ "REPORT_REF_NO ='"+ReporefSeq+"',"
	    												+ "RPT_DAY ='"+request.getParameter("rptday")+"',"
	    												+ "RPT_DATE ='"+df1.formatdate(request.getParameter("rptdate"))+"',"
	    												+ "DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmur")+"',"
	    												+ "DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneur")+"',"
	    												+ "DEPOSIT_DENOM_IN_GBP ='"+request.getParameter("depdengbp")+"',"
	    												+ "DEPOSIT_DENOM_IN_USD ='"+df1.formatdate(request.getParameter("depdenusd"))+"',"
	    												+ "USD_EQUIV_OTH_FCY_DEPOSIT ='"+request.getParameter("usdequfor")+"',"
	    												+ "REC_CODE ='"+request.getParameter("reccod")+"',"
	    												+ "RCRE_USER_ID ='"+request.getParameter("rcrusrid")+"',"
	    												+ "RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtme"))+"',"
							    						+ "LCHG_USER_ID ='"+request.getParameter("lchusrid")+"',"
							    						+ "LCHG_TIME ='"+df1.formatdate(request.getParameter("lchtme"))+"'   where REC_CODE='"+ request.getParameter("reccod") + "' "
							    						+ "RPT_DATE='"+ df1.formatdate(request.getParameter("rptdate")) + "' ");*/
	    				
	    				
	    				
	    				
	    				
	 // sql2.append("update CRR0100_MOD_TABLE set REPORT_REF_NO ='"+ReporefSeq+"',RPT_DAY ='"+request.getParameter("rptday")+"',RPT_DATE ='"+df1.formatdate(request.getParameter("rptdate"))+"',DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmur")+" ',DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneur")+" ',DEPOSIT_DENOM_IN_GBP ='"+request.getParameter("depdengbp")+"',DEPOSIT_DENOM_IN_USD ='"+df1.formatdate(request.getParameter("depdenusd"))+" ',USD_EQUIV_OTH_FCY_DEPOSIT ='"+request.getParameter("usdequfor")+"',REC_CODE ='"+request.getParameter("reccod")+"',RCRE_USER_ID ='"+request.getParameter("rcrusrid")+"',RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtme"))+"',LCHG_USER_ID ='"+request.getParameter("lchusrid")+"',LCHG_TIME ='"+df1.formatdate(request.getParameter("lchtme"))+"'   where REPORT_REF_NO = '"+ReporefSeq+"'");
	    				
	  
	  
	  sql4.append("update CRR0100_MOD_TABLE set REPORT_REF_NO ='"+ReporefSeq+"',RPT_DAY ='"+request.getParameter("rptdayAE")+"',RPT_DATE ='"+df1.formatdate(request.getParameter("rptdateAE"))+"',DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmurAE")+"',DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneurAE")+"',REC_CODE ='"+request.getParameter("reccodAE")+"',DEL_FLG ='"+request.getParameter("delAE")+"',RCRE_USER_ID ='"+request.getParameter("rcrusridAE")+"',RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtmeAE"))+"',LCHG_USER_ID ='"+request.getParameter("lchusridAE")+"',LCHG_TIME =current_timestamp where REPORT_REF_NO ='"+ReporefSeq+"'");
	  
	  
	  log.info("ghf");
	    				log.info("Update======>"+sql4.toString());
	    				
						ps4 = conn.prepareStatement(sql4.toString());
						int rs4 = ps4.executeUpdate();
						if (rs4>0) {
							log.info("<<==Update Success==>>");
							/*request.setAttribute("type", "update");
							request.setAttribute("alert","Report Ref No : "   +" "+EIDSeq+" "+   "Updated Successfully");*/
							status1 = "updated";
							status = "success";
							
							
						}
	    				
	    				
	    			}else{
	    				log.info("INSERT");
	    				
	    				
	    				
	    				sql3.append("INSERT INTO CRR0100_MOD_TABLE("
	    						+ "REPORT_REF_NO,"
	    						+ "RPT_DAY,"
	    						+ "RPT_DATE,"    						
	    						+ "DEPOSIT_AMT_IN_MUR,"
	    						+ "DEPOSIT_DENOM_IN_EUR,"	
	    						+ "DEPOSIT_DENOM_IN_GBP,"
	    						+ "DEPOSIT_DENOM_IN_USD,"
	    						+ "USD_EQUIV_OTH_FCY_DEPOSIT,"

	    						+ "REC_CODE,"
	    						+ "DEL_FLG,"
	    						+ "RCRE_USER_ID,"
	    						+ "RCRE_TIME,"
	    						+ "LCHG_USER_ID,"
	    						+ "LCHG_TIME)");
	    				
	    				sql3.append("values('"+ReporefSeq.trim()+"','"+request.getParameter("rptdayAE")
	    				+"','"+df1.formatdate(request.getParameter("rptdateAE"))
	    				+"','"+request.getParameter("depamtmurAE").trim()
	    				+"','"+request.getParameter("depdeneurAE").trim()	
	    				+"','"+request.getParameter("depdengbpAE").trim()
	    				+"','"+request.getParameter("depdenusdAE")
	    				+"','"+request.getParameter("usdequforAE")
	    				
	    				+"','"+request.getParameter("reccodAE")
	    				+"','"+request.getParameter("delAE")
	    				+"','"+request.getParameter("rcrusridAE")
	    				+"','"+df1.formatdate(request.getParameter("rcrtmeAE"))
	    				+"','"+request.getParameter("lchusridAE")
	    				+"',current_timestamp) ");
	    				
	    				
	    				//log.info("loginUPDAT"+sql3.toString()+username);
	    				//+"','"+EIDSeq+"',             '"+df1.formatdate(request.getParameter("rptstart"))+"','"+df1.formatdate(request.getParameter("rptend"))+"','"+request.getParameter("rptcrncy")+"','"+request.getParameter("bnkcode")+"','"+request.getParameter("modcode")+"','"+request.getParameter("modtype")
	    				log.info("Insert"+sql3.toString());
	    				
	    				ps3 = conn.prepareStatement(sql3.toString());
	    				int rs3 = ps3.executeUpdate();
	    				
	    				if (rs3 > 0) {
	    					
	    					request.setAttribute("ReporefSeq", ReporefSeq);
	    					
	    					status1="inserted";
	    					
	    					
	    					status = "success";
	    						
	    				}
	    		    		
					
					
				}
					
				}
			
			
			
			
			
			
			
			
			}else{
				
				log.info("ELSEEEE");
				
				sql.append("SELECT Count (*) as cnt FROM   (SELECT DISTINCT RPT_DATE,REC_CODE FROM  CRR0100_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq.trim()+"' and RPT_DATE ='"+request.getParameter("rptdateAE")+"'   and DEL_FLG ='N'  and REC_CODE='"+request.getParameter("reccodAE")+"') ");
		
			
			
			
				log.info("select count       .... NEW===  "+sql.toString());
				ps = conn.prepareStatement(sql.toString());
				
				log.info("count test  ");
				
				ResultSet rs = ps.executeQuery();
				//log.info(rs);
				if (rs.next()) {						
					count = rs.getInt("cnt"); 
					log.info("count"+count);
					
					if (count > 0) {
						log.info("UPDATE");
						log.info("dt1--->"+request.getParameter("dt1"));
						log.info("dt2--->"+request.getParameter("dt2"));
						log.info("reportrefno====>>>"+ReporefSeq);
						log.info("rptdayAE_row--->"+request.getParameter("rptdayAE"));
						log.info("rptdateAE_row--->"+df1.formatdate(request.getParameter("rptdateAE")));
						log.info("depamtmurAE_row1--->"+request.getParameter("depamtmurAE"));
						log.info("depdeneurAE_row1--->"+request.getParameter("depdeneurAE"));

						log.info("depdengbpAE_row--->"+request.getParameter("depdengbpAE"));
						log.info("depdenusdAE_row--->"+request.getParameter("depdenusdAE"));
						log.info("usdequforAE_row--->"+request.getParameter("usdequforAE"));
						
						log.info("reccodAE_row--->"+request.getParameter("reccodAE"));
						
						log.info("rcrusridAE_row--->"+request.getParameter("rcrusridAE"));
						log.info("rcrtmeAE_row--->"+request.getParameter("rcrtmeAE"));
						log.info("lchusridAE_row--->"+request.getParameter("lchusridAE"));
						log.info("lchtmeAE_row--->"+request.getParameter("lchtmeAE"));
						
	    				/*sql2.append("update CRR0100_MOD_TABLE set "
	    						
	    												+ "REPORT_REF_NO ='"+ReporefSeq+"',"
	    												+ "RPT_DAY ='"+request.getParameter("rptday")+"',"
	    												+ "RPT_DATE ='"+df1.formatdate(request.getParameter("rptdate"))+"',"
	    												+ "DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmur")+"',"
	    												+ "DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneur")+"',"
	    												+ "DEPOSIT_DENOM_IN_GBP ='"+request.getParameter("depdengbp")+"',"
	    												+ "DEPOSIT_DENOM_IN_USD ='"+df1.formatdate(request.getParameter("depdenusd"))+"',"
	    												+ "USD_EQUIV_OTH_FCY_DEPOSIT ='"+request.getParameter("usdequfor")+"',"
	    												+ "REC_CODE ='"+request.getParameter("reccod")+"',"
	    												+ "RCRE_USER_ID ='"+request.getParameter("rcrusrid")+"',"
	    												+ "RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtme"))+"',"
							    						+ "LCHG_USER_ID ='"+request.getParameter("lchusrid")+"',"
							    						+ "LCHG_TIME ='"+df1.formatdate(request.getParameter("lchtme"))+"'   where REC_CODE='"+ request.getParameter("reccod") + "' "
							    						+ "RPT_DATE='"+ df1.formatdate(request.getParameter("rptdate")) + "' ");*/
	    				
	    				
	    				
	    				
	    				
	 // sql2.append("update CRR0100_MOD_TABLE set REPORT_REF_NO ='"+ReporefSeq+"',RPT_DAY ='"+request.getParameter("rptday")+"',RPT_DATE ='"+df1.formatdate(request.getParameter("rptdate"))+"',DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmur")+" ',DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneur")+" ',DEPOSIT_DENOM_IN_GBP ='"+request.getParameter("depdengbp")+"',DEPOSIT_DENOM_IN_USD ='"+df1.formatdate(request.getParameter("depdenusd"))+" ',USD_EQUIV_OTH_FCY_DEPOSIT ='"+request.getParameter("usdequfor")+"',REC_CODE ='"+request.getParameter("reccod")+"',RCRE_USER_ID ='"+request.getParameter("rcrusrid")+"',RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtme"))+"',LCHG_USER_ID ='"+request.getParameter("lchusrid")+"',LCHG_TIME ='"+df1.formatdate(request.getParameter("lchtme"))+"'   where REPORT_REF_NO = '"+ReporefSeq+"'");
	    				
	  
	  
	  sql4.append("update CRR0100_MOD_TABLE set REPORT_REF_NO ='"+ReporefSeq.trim()+"',RPT_DAY ='"+request.getParameter("rptdayAE")+"',RPT_DATE ='"+df1.formatdate(request.getParameter("rptdateAE"))+"',DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmurAE").trim()+"',DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneurAE").trim()+"',REC_CODE ='"+request.getParameter("reccodAE")+"',DEL_FLG ='"+request.getParameter("delAE")+"',RCRE_USER_ID ='"+request.getParameter("rcrusridAE")+"',RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtmeAE"))+"',LCHG_USER_ID ='"+request.getParameter("lchusridAE")+"',LCHG_TIME =current_timestamp where REPORT_REF_NO ='"+ReporefSeq.trim()+"' and RPT_DATE ='"+df1.formatdate(request.getParameter("rptdateAE"))+"'  and REC_CODE='"+request.getParameter("reccodAE")+"'");
	  
	  
	  log.info("ghf");
	    				log.info("Update======>"+sql4.toString());
	    				
						ps4 = conn.prepareStatement(sql4.toString());
						int rs4 = ps4.executeUpdate();
						if (rs4>0) {
							log.info("<<==Update Success==>>");
							/*request.setAttribute("type", "update");
							request.setAttribute("alert","Report Ref No : "   +" "+EIDSeq+" "+   "Updated Successfully");*/
							status1 = "updated";
							status = "success";
							
							
						}
	    				
	    				
	    			}else{
	    				log.info("INSERT");
	    				
	    				
	    				
	    				sql3.append("INSERT INTO CRR0100_MOD_TABLE("
	    						+ "REPORT_REF_NO,"
	    						+ "RPT_DAY,"
	    						+ "RPT_DATE,"    						
	    						+ "DEPOSIT_AMT_IN_MUR,"
	    						+ "DEPOSIT_DENOM_IN_EUR,"	
	    						+ "DEPOSIT_DENOM_IN_GBP,"
	    						+ "DEPOSIT_DENOM_IN_USD,"
	    						+ "USD_EQUIV_OTH_FCY_DEPOSIT,"

	    						+ "REC_CODE,"
	    						+ "DEL_FLG,"
	    						+ "RCRE_USER_ID,"
	    						+ "RCRE_TIME,"
	    						+ "LCHG_USER_ID,"
	    						+ "LCHG_TIME)");
	    				
	    				sql3.append("values('"+ReporefSeq.trim()+"','"+request.getParameter("rptdayAE")
	    				+"','"+df1.formatdate(request.getParameter("rptdateAE"))
	    				+"','"+request.getParameter("depamtmurAE").trim()
	    				+"','"+request.getParameter("depdeneurAE").trim()
	    				+"','"+request.getParameter("depdengbpAE").trim()
	    				+"','"+request.getParameter("depdenusdAE")
	    				+"','"+request.getParameter("usdequforAE")
	    				
	    				+"','"+request.getParameter("reccodAE")
	    				+"','"+request.getParameter("delAE")
	    				+"','"+request.getParameter("rcrusridAE")
	    				+"','"+df1.formatdate(request.getParameter("rcrtmeAE"))
	    				+"','"+request.getParameter("lchusridAE")
	    				+"',current_timestamp) ");
	    				
	    				
	    				//log.info("loginUPDAT"+sql3.toString()+username);
	    				//+"','"+EIDSeq+"',             '"+df1.formatdate(request.getParameter("rptstart"))+"','"+df1.formatdate(request.getParameter("rptend"))+"','"+request.getParameter("rptcrncy")+"','"+request.getParameter("bnkcode")+"','"+request.getParameter("modcode")+"','"+request.getParameter("modtype")
	    				log.info("Insert"+sql3.toString());
	    				
	    				ps3 = conn.prepareStatement(sql3.toString());
	    				int rs3 = ps3.executeUpdate();
	    				
	    				if (rs3 > 0) {
	    					
	    					request.setAttribute("ReporefSeq", ReporefSeq);
	    					
	    					status1="inserted";
	    					
	    					
	    					status = "success";
	    						
	    				}
	    		    		
					
					
				}
					
				}
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			}
			
			//sql.append("SELECT count(distinct RPT_DATE)as cnt,count(distinct REC_CODE) as cnt1 from CRR0100_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq+"' and RPT_DAY='"+request.getParameter("rptday")+"',REC_CODE='"+request.getParameter("reccod")+"' ");
			
			
			
			//sql.append("INSERT INTO BAM_ASSET_FLOWS(DAILY_AVG_AMT,WEIGHT_AVG_INT_RATE,INT_INC_EXP) VALUES ('"+daa_val[i]+"','"+wair_val[i]+"','"+iiie_val[i]+"')");
    		
			
			
			 
		}
		
		catch (SQLException e) {
			status="error";
			e.printStackTrace();
		} 
	
		/*RepID Display HeAEer*/
		
		refnoAE=ReporefSeq;
	
		if(status.equals("success") && status1.equals("inserted")){
        	
    		
	    	//	log.info("==insert Statusss==");
	    		//String next=lmd.insertRecord(arl,AE);
				//request.setAttribute("alert", "Report Ref No : "   +" "+EIDSeq+" "+   "Inserted Successfully.");
				request.setAttribute("type", "insertedAE");
				request.setAttribute("dt1AE", request.getParameter("dt1"));
				request.setAttribute("dt2AE", request.getParameter("dt2"));
				request.setAttribute("ReporefSeqAE", ReporefSeq);
				request.setAttribute("alert", "Report Ref No : "   +" "+ReporefSeq+" "+   "Created Successfully.");
	    		
				//XBRLCRR0100Dao dmd =new XBRLCRR0100Dao();
	    		//ArrayList<XBRLCRR0100Bean> list=dmd.xbrlcrrRR(ReporefSeq);
	    		
				return "success";
			}else if(status.equals("success") && status1.equals("updated")){
			//	log.info("==update Statusss==");
	    		//String next=lmd.insertRecord(arl,AE);
				
				request.setAttribute("type", "updatedAE");
				request.setAttribute("dt1AE", request.getParameter("dt1"));
				request.setAttribute("dt2AE", request.getParameter("dt2"));
				request.setAttribute("ReporefSeqAE", ReporefSeq);
				
				request.setAttribute("alert", "Report Ref No : "   +" "+ReporefSeq+" "+   "Updated Successfully.");
				//request.setAttribute("type", "AsstFlow");
				return "success";
			}	else{
			
				request.setAttribute("alert", "CRR Table  not updated successfully.");
				return "error";
			}
}

public String modXbcrrCreateAG() throws SQLException {
	
	log.info("sowryyyyyyyyyyyyyyyyyy");
	
	String status="";
	String status1="";
	
	String ReporefSeq="";
	HttpServletRequest request = ServletActionContext.getRequest();
	log.info("rptdayAG_row--->"+request.getParameter("rptdayAG"));
	 DateFormat df=new DateFormat();
	 
	 NullCheck nc=new NullCheck();
	
	HttpSession session = request.getSession();  
	
	log.info("dt1--->"+request.getParameter("dt1"));
	log.info("dt2--->"+request.getParameter("dt2"));
	//log.info("reportrefno====>>>"+request.getParameter("reportrefno"));
	log.info("rptdayAG_row--->"+request.getParameter("rptdayAG"));
	log.info("rptdateAG_row--->"+request.getParameter("rptdateAG"));
	log.info("depamtmurAG_row1--->"+request.getParameter("depamtmurAG"));
	log.info("depdeneurAG_row1--->"+request.getParameter("depdeneurAG"));
	log.info("depdengbpAG_row--->"+request.getParameter("depdengbpAG"));
	log.info("depdenusdAG_row--->"+request.getParameter("depdenusdAG"));
	log.info("usdequforAG_row--->"+request.getParameter("usdequforAG"));
	
	
	log.info("reccodAG_row--->"+request.getParameter("reccodAG"));
	
	log.info("rcrusridAG_row--->"+request.getParameter("rcrusridAG"));
	log.info("rcrtmeAG_row--->"+request.getParameter("rcrtmeAG"));
	log.info("lchusridAG_row--->"+request.getParameter("lchusridAG"));
	log.info("lchtmeAG_row--->"+request.getParameter("lchtmeAG"));
	
	log.info("delAG_row--->"+request.getParameter("delAG"));
	
	
	
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	log.info("insert");
	PreparedStatement ps = null;
	PreparedStatement ps2 = null;
	
	StringBuffer sql2 = new StringBuffer();
	PreparedStatement ps3 = null;
	PreparedStatement ps4 = null;
	
	StringBuffer sql3 = new StringBuffer();
	StringBuffer sql4 = new StringBuffer();
	
	DateFormat df1=new DateFormat();
	
	
	//String passexpdate=df.formatdate(xb.getAccopendate());
	log.info("==="+request.getParameter("reportrefno"));
	
	
	if(request.getParameter("reportrefno").startsWith("R")){
		
		log.info("else notttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt ");
		 ReporefSeq =request.getParameter("reportrefno");
			
	}else{
		

		
log.info("nullllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll");

		utilities.SequenceNumber seqNo = new utilities.SequenceNumber();
	String reporefseqno = seqNo.reporefno();
	
//log.info(" seqno  :=   " + seqno);
	
	 ReporefSeq = "RR01000" + reporefseqno;
		
	}
	log.info("===ReporefSeq==="+ReporefSeq);
	//log.info("<< EIDSeq >> " + EIDSeq); 
	session.setAttribute("ReprefSeq", ReporefSeq);
	
	//int rs=0;
	
	int count=0;
	
	StringBuffer sql = new StringBuffer();
	//HttpSession session = request.getSession();  
	log.info("insert Action modXbcrrCreateAG");
	
	
	
	
		try{
			
			
			//sql.append("SELECT Count (*) as cnt FROM   (SELECT DISTINCT RPT_DATE,REC_CODE FROM  CRR0100_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq+"' and RPT_DATE >='"+request.getParameter("dt1")+"' and RPT_DATE <= '"+request.getParameter("dt2")+"'  and REC_CODE='"+request.getParameter("reccod")+"') ");
			
			if(ReporefSeq.equals("null")){
			
				log.info("IFF");
				sql.append("SELECT Count (*) as cnt FROM   (SELECT DISTINCT RPT_DATE,REC_CODE FROM  CRR0100_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq.trim()+"' and RPT_DATE >='"+request.getParameter("dt1")+"' and RPT_DATE <= '"+request.getParameter("dt2")+"'  and DEL_FLG='N' and REC_CODE='"+request.getParameter("reccodAG")+"') ");
			
			
			
				log.info("select count       .... NEW===  "+sql.toString());
				ps = conn.prepareStatement(sql.toString());
				
				log.info("count test  ");
				
				ResultSet rs = ps.executeQuery();
				//log.info(rs);
				if (rs.next()) {						
					count = rs.getInt("cnt"); 
					log.info("count"+count);
					
					if (count > 0) {
						log.info("UPDATE");
						log.info("dt1--->"+request.getParameter("dt1"));
						log.info("dt2--->"+request.getParameter("dt2"));
						log.info("reportrefno====>>>"+ReporefSeq);
						log.info("rptdayAG_row--->"+request.getParameter("rptdayAG"));
						log.info("rptdateAG_row--->"+df1.formatdate(request.getParameter("rptdateAG")));
						log.info("depamtmurAG_row1--->"+request.getParameter("depamtmurAG"));
						log.info("depdeneurAG_row1--->"+request.getParameter("depdeneurAG"));
						log.info("depdengbpAG_row--->"+request.getParameter("depdengbpAG"));
						log.info("depdenusdAG_row--->"+request.getParameter("depdenusdAG"));
						log.info("usdequforAG_row--->"+request.getParameter("usdequforAG"));
						
						log.info("reccodAG_row--->"+request.getParameter("reccodAG"));
						
						log.info("rcrusridAG_row--->"+request.getParameter("rcrusridAG"));
						log.info("rcrtmeAG_row--->"+request.getParameter("rcrtmeAG"));
						log.info("lchusridAG_row--->"+request.getParameter("lchusridAG"));
						log.info("lchtmeAG_row--->"+request.getParameter("lchtmeAG"));
						
						log.info("delAG_row--->"+request.getParameter("delAG"));
						
	    				/*sql2.append("update CRR0100_MOD_TABLE set "
	    						
	    												+ "REPORT_REF_NO ='"+ReporefSeq+"',"
	    												+ "RPT_DAY ='"+request.getParameter("rptday")+"',"
	    												+ "RPT_DATE ='"+df1.formatdate(request.getParameter("rptdate"))+"',"
	    												+ "DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmur")+"',"
	    												+ "DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneur")+"',"
	    												+ "DEPOSIT_DENOM_IN_GBP ='"+request.getParameter("depdengbp")+"',"
	    												+ "DEPOSIT_DENOM_IN_USD ='"+df1.formatdate(request.getParameter("depdenusd"))+"',"
	    												+ "USD_EQUIV_OTH_FCY_DEPOSIT ='"+request.getParameter("usdequfor")+"',"
	    												+ "REC_CODE ='"+request.getParameter("reccod")+"',"
	    												+ "RCRE_USER_ID ='"+request.getParameter("rcrusrid")+"',"
	    												+ "RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtme"))+"',"
							    						+ "LCHG_USER_ID ='"+request.getParameter("lchusrid")+"',"
							    						+ "LCHG_TIME ='"+df1.formatdate(request.getParameter("lchtme"))+"'   where REC_CODE='"+ request.getParameter("reccod") + "' "
							    						+ "RPT_DATE='"+ df1.formatdate(request.getParameter("rptdate")) + "' ");*/
	    				
	    				
	    				
	    				
	    				
	 // sql2.append("update CRR0100_MOD_TABLE set REPORT_REF_NO ='"+ReporefSeq+"',RPT_DAY ='"+request.getParameter("rptday")+"',RPT_DATE ='"+df1.formatdate(request.getParameter("rptdate"))+"',DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmur")+" ',DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneur")+" ',DEPOSIT_DENOM_IN_GBP ='"+request.getParameter("depdengbp")+"',DEPOSIT_DENOM_IN_USD ='"+df1.formatdate(request.getParameter("depdenusd"))+" ',USD_EQUIV_OTH_FCY_DEPOSIT ='"+request.getParameter("usdequfor")+"',REC_CODE ='"+request.getParameter("reccod")+"',RCRE_USER_ID ='"+request.getParameter("rcrusrid")+"',RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtme"))+"',LCHG_USER_ID ='"+request.getParameter("lchusrid")+"',LCHG_TIME ='"+df1.formatdate(request.getParameter("lchtme"))+"'   where REPORT_REF_NO = '"+ReporefSeq+"'");
	    				
	  
	  
	  sql4.append("update CRR0100_MOD_TABLE set REPORT_REF_NO ='"+ReporefSeq.trim()+"',RPT_DAY ='"+request.getParameter("rptdayAG")+"',RPT_DATE ='"+df1.formatdate(request.getParameter("rptdateAG"))+"',DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmurAG").trim()+"',DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneurAG").trim()+"',REC_CODE ='"+request.getParameter("reccodAG")+"',DEL_FLG ='"+request.getParameter("delAG")+"',RCRE_USER_ID ='"+request.getParameter("rcrusridAG")+"',RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtmeAG"))+"',LCHG_USER_ID ='"+request.getParameter("lchusridAG")+"',LCHG_TIME =current_timestamp where REPORT_REF_NO ='"+ReporefSeq+"'");
	  
	  
	  log.info("ghf");
	    				log.info("Update======>"+sql4.toString());
	    				
						ps4 = conn.prepareStatement(sql4.toString());
						int rs4 = ps4.executeUpdate();
						if (rs4>0) {
							log.info("<<==Update Success==>>");
							/*request.setAttribute("type", "update");
							request.setAttribute("alert","Report Ref No : "   +" "+EIDSeq+" "+   "Updated Successfully");*/
							status1 = "updated";
							status = "success";
							
							
						}
	    				
	    				
	    			}else{
	    				log.info("INSERT");
	    				
	    				
	    				
	    				sql3.append("INSERT INTO CRR0100_MOD_TABLE("
	    						+ "REPORT_REF_NO,"
	    						+ "RPT_DAY,"
	    						+ "RPT_DATE,"    						
	    						+ "DEPOSIT_AMT_IN_MUR,"
	    						+ "DEPOSIT_DENOM_IN_EUR,"
	    						+ "DEPOSIT_DENOM_IN_GBP,"
	    						+ "DEPOSIT_DENOM_IN_USD,"
	    						+ "USD_EQUIV_OTH_FCY_DEPOSIT,"
	    						+ "REC_CODE,"
	    						+ "DEL_FLG,"
	    						+ "RCRE_USER_ID,"
	    						+ "RCRE_TIME,"
	    						+ "LCHG_USER_ID,"
	    						+ "LCHG_TIME)");
	    				
	    				
	    				
	    				
	    				sql3.append("values('"+ReporefSeq.trim()+"','"+request.getParameter("rptdayAG")
	    				+"','"+df1.formatdate(request.getParameter("rptdateAG"))
	    				+"','"+request.getParameter("depamtmurAG").trim()
	    				+"','"+request.getParameter("depdeneurAG").trim()
	    				
	    				+"','"+request.getParameter("depdengbpAG").trim()
	    				+"','"+request.getParameter("depdenusdAG").trim()
	    				+"','"+request.getParameter("usdequforAG")
	    				
	    				+"','"+request.getParameter("reccodAG")
	    				+"','"+request.getParameter("delAG")
	    				+"','"+request.getParameter("rcrusridAG")
	    				+"','"+df1.formatdate(request.getParameter("rcrtmeAG"))
	    				+"','"+request.getParameter("lchusridAG")
	    				+"',current_timestamp) ");
	    				
	    				
	    				//log.info("loginUPDAT"+sql3.toString()+username);
	    				//+"','"+EIDSeq+"',             '"+df1.formatdate(request.getParameter("rptstart"))+"','"+df1.formatdate(request.getParameter("rptend"))+"','"+request.getParameter("rptcrncy")+"','"+request.getParameter("bnkcode")+"','"+request.getParameter("modcode")+"','"+request.getParameter("modtype")
	    				log.info("Insert"+sql3.toString());
	    				
	    				ps3 = conn.prepareStatement(sql3.toString());
	    				int rs3 = ps3.executeUpdate();
	    				
	    				if (rs3 > 0) {
	    					
	    					request.setAttribute("ReporefSeq", ReporefSeq);
	    					
	    					status1="inserted";
	    					
	    					
	    					status = "success";
	    						
	    				}
	    		    		
					
					
				}
					
				}
			
			
			
			
			
			
			
			
			}else{
				
				log.info("ELSEEEE");
				
				sql.append("SELECT Count (*) as cnt FROM   (SELECT DISTINCT RPT_DATE,REC_CODE FROM  CRR0100_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq.trim()+"' and RPT_DATE ='"+request.getParameter("rptdateAG")+"'  and DEL_FLG='N' and REC_CODE='"+request.getParameter("reccodAG")+"') ");
		
			
			
			
				log.info("select count       .... NEW===  "+sql.toString());
				ps = conn.prepareStatement(sql.toString());
				
				log.info("count test  ");
				
				ResultSet rs = ps.executeQuery();
				//log.info(rs);
				if (rs.next()) {						
					count = rs.getInt("cnt"); 
					log.info("count"+count);
					
					if (count > 0) {
						log.info("UPDATE");
						log.info("dt1--->"+request.getParameter("dt1"));
						log.info("dt2--->"+request.getParameter("dt2"));
						log.info("reportrefno====>>>"+ReporefSeq);
						log.info("rptdayAG_row--->"+request.getParameter("rptdayAG"));
						log.info("rptdateAG_row--->"+df1.formatdate(request.getParameter("rptdateAG")));
						log.info("depamtmurAG_row1--->"+request.getParameter("depamtmurAG"));
						log.info("depdeneurAG_row1--->"+request.getParameter("depdeneurAG"));
						
						log.info("depdengbpAG_row--->"+request.getParameter("depdengbpAG"));
						log.info("depdenusdAG_row--->"+request.getParameter("depdenusdAG"));
						log.info("usdequforAG_row--->"+request.getParameter("usdequforAG"));
						
						log.info("reccodAG_row--->"+request.getParameter("reccodAG"));
						
						log.info("rcrusridAG_row--->"+request.getParameter("rcrusridAG"));
						log.info("rcrtmeAG_row--->"+request.getParameter("rcrtmeAG"));
						log.info("lchusridAG_row--->"+request.getParameter("lchusridAG"));
						log.info("lchtmeAG_row--->"+request.getParameter("lchtmeAG"));
						
						log.info("delAG_row--->"+request.getParameter("delAG"));
						
						
	    				/*sql2.append("update CRR0100_MOD_TABLE set "
	    						
	    												+ "REPORT_REF_NO ='"+ReporefSeq+"',"
	    												+ "RPT_DAY ='"+request.getParameter("rptday")+"',"
	    												+ "RPT_DATE ='"+df1.formatdate(request.getParameter("rptdate"))+"',"
	    												+ "DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmur")+"',"
	    												+ "DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneur")+"',"
	    												+ "DEPOSIT_DENOM_IN_GBP ='"+request.getParameter("depdengbp")+"',"
	    												+ "DEPOSIT_DENOM_IN_USD ='"+df1.formatdate(request.getParameter("depdenusd"))+"',"
	    												+ "USD_EQUIV_OTH_FCY_DEPOSIT ='"+request.getParameter("usdequfor")+"',"
	    												+ "REC_CODE ='"+request.getParameter("reccod")+"',"
	    												+ "RCRE_USER_ID ='"+request.getParameter("rcrusrid")+"',"
	    												+ "RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtme"))+"',"
							    						+ "LCHG_USER_ID ='"+request.getParameter("lchusrid")+"',"
							    						+ "LCHG_TIME ='"+df1.formatdate(request.getParameter("lchtme"))+"'   where REC_CODE='"+ request.getParameter("reccod") + "' "
							    						+ "RPT_DATE='"+ df1.formatdate(request.getParameter("rptdate")) + "' ");*/
	    				
	    				
	    				
	    				
	    				
	 // sql2.append("update CRR0100_MOD_TABLE set REPORT_REF_NO ='"+ReporefSeq+"',RPT_DAY ='"+request.getParameter("rptday")+"',RPT_DATE ='"+df1.formatdate(request.getParameter("rptdate"))+"',DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmur")+" ',DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneur")+" ',DEPOSIT_DENOM_IN_GBP ='"+request.getParameter("depdengbp")+"',DEPOSIT_DENOM_IN_USD ='"+df1.formatdate(request.getParameter("depdenusd"))+" ',USD_EQUIV_OTH_FCY_DEPOSIT ='"+request.getParameter("usdequfor")+"',REC_CODE ='"+request.getParameter("reccod")+"',RCRE_USER_ID ='"+request.getParameter("rcrusrid")+"',RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtme"))+"',LCHG_USER_ID ='"+request.getParameter("lchusrid")+"',LCHG_TIME ='"+df1.formatdate(request.getParameter("lchtme"))+"'   where REPORT_REF_NO = '"+ReporefSeq+"'");
	    				
	  
	  
	  sql4.append("update CRR0100_MOD_TABLE set REPORT_REF_NO ='"+ReporefSeq+"',RPT_DAY ='"+request.getParameter("rptdayAG")+"',RPT_DATE ='"+df1.formatdate(request.getParameter("rptdateAG"))+"',DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmurAG")+"',DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneurAG")+"',REC_CODE ='"+request.getParameter("reccodAG")+"',DEL_FLG ='"+request.getParameter("delAG")+"',RCRE_USER_ID ='"+request.getParameter("rcrusridAG")+"',RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtmeAG"))+"',LCHG_USER_ID ='"+request.getParameter("lchusridAG")+"',LCHG_TIME =current_timestamp where REPORT_REF_NO ='"+ReporefSeq+"' and RPT_DATE ='"+df1.formatdate(request.getParameter("rptdateAG"))+"'  and REC_CODE='"+request.getParameter("reccodAG")+"'");
	  
	  
	  log.info("ghf");
	    				log.info("Update======>"+sql4.toString());
	    				
						ps4 = conn.prepareStatement(sql4.toString());
						int rs4 = ps4.executeUpdate();
						if (rs4>0) {
							log.info("<<==Update Success==>>");
							/*request.setAttribute("type", "update");
							request.setAttribute("alert","Report Ref No : "   +" "+EIDSeq+" "+   "Updated Successfully");*/
							status1 = "updated";
							status = "success";
							
							
						}
	    				
	    				
	    			}else{
	    				log.info("INSERT");
	    				
	    				
	    				
	    				sql3.append("INSERT INTO CRR0100_MOD_TABLE("
	    						+ "REPORT_REF_NO,"
	    						+ "RPT_DAY,"
	    						+ "RPT_DATE,"    						
	    						+ "DEPOSIT_AMT_IN_MUR,"
	    						+ "DEPOSIT_DENOM_IN_EUR,"	
	    						+ "DEPOSIT_DENOM_IN_GBP,"
	    						+ "DEPOSIT_DENOM_IN_USD,"
	    						+ "USD_EQUIV_OTH_FCY_DEPOSIT,"
	    						+ "REC_CODE,"
	    						+ "DEL_FLG,"
	    						+ "RCRE_USER_ID,"
	    						+ "RCRE_TIME,"
	    						+ "LCHG_USER_ID,"
	    						+ "LCHG_TIME)");
	    				
	    				sql3.append("values('"+ReporefSeq.trim()+"','"+request.getParameter("rptdayAG")
	    				+"','"+df1.formatdate(request.getParameter("rptdateAG"))
	    				+"','"+request.getParameter("depamtmurAG").trim()
	    				+"','"+request.getParameter("depdeneurAG").trim()
	    				
	    				+"','"+request.getParameter("depdengbpAG").trim()
	    				+"','"+request.getParameter("depdenusdAG")
	    				+"','"+request.getParameter("usdequforAG")
	    				
	    				+"','"+request.getParameter("reccodAG")
	    				+"','"+request.getParameter("delAG")
	    				+"','"+request.getParameter("rcrusridAG")
	    				+"','"+df1.formatdate(request.getParameter("rcrtmeAG"))
	    				+"','"+request.getParameter("lchusridAG")
	    				+"',current_timestamp)");
	    				
	    				
	    				//log.info("loginUPDAT"+sql3.toString()+username);
	    				//+"','"+EIDSeq+"',             '"+df1.formatdate(request.getParameter("rptstart"))+"','"+df1.formatdate(request.getParameter("rptend"))+"','"+request.getParameter("rptcrncy")+"','"+request.getParameter("bnkcode")+"','"+request.getParameter("modcode")+"','"+request.getParameter("modtype")
	    				log.info("Insert"+sql3.toString());
	    				
	    				ps3 = conn.prepareStatement(sql3.toString());
	    				int rs3 = ps3.executeUpdate();
	    				
	    				if (rs3 > 0) {
	    					
	    					request.setAttribute("ReporefSeq", ReporefSeq);
	    					
	    					status1="inserted";
	    					
	    					
	    					status = "success";
	    						
	    				}
	    		    		
					
					
				}
					
				}
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			}
			
			//sql.append("SELECT count(distinct RPT_DATE)as cnt,count(distinct REC_CODE) as cnt1 from CRR0100_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq+"' and RPT_DAY='"+request.getParameter("rptday")+"',REC_CODE='"+request.getParameter("reccod")+"' ");
			
			
			
			//sql.append("INSERT INTO BAM_ASSET_FLOWS(DAILY_AVG_AMT,WEIGHT_AVG_INT_RATE,INT_INC_EXP) VALUES ('"+daa_val[i]+"','"+wair_val[i]+"','"+iiie_val[i]+"')");
    		
			
			
			 
		}
		
		catch (SQLException e) {
			status="error";
			e.printStackTrace();
		} 
	
		/*RepID Display Header*/
		
		refnoAG=ReporefSeq;
	
		if(status.equals("success") && status1.equals("inserted")){
        	
    		
	    	//	log.info("==insert Statusss==");
	    		//String next=lmd.insertRecord(arl,AG);
				//request.setAttribute("alert", "Report Ref No : "   +" "+EIDSeq+" "+   "Inserted Successfully.");
				request.setAttribute("type", "insertedAG");
				request.setAttribute("dt1AG", request.getParameter("dt1"));
				request.setAttribute("dt2AG", request.getParameter("dt2"));
				request.setAttribute("ReporefSeqAG", ReporefSeq);
				request.setAttribute("alert", "Report Ref No : "   +" "+ReporefSeq+" "+   "Created Successfully.");
	    		
				//XBRLCRR0100Dao dmd =new XBRLCRR0100Dao();
	    		//ArrayList<XBRLCRR0100Bean> list=dmd.xbrlcrrRR(ReporefSeq);
	    		
				return "success";
			}else if(status.equals("success") && status1.equals("updated")){
			//	log.info("==update Statusss==");
	    		//String next=lmd.insertRecord(arl,AG);
				
				request.setAttribute("type", "updatedAG");
				request.setAttribute("dt1AG", request.getParameter("dt1"));
				request.setAttribute("dt2AG", request.getParameter("dt2"));
				request.setAttribute("ReporefSeqAG", ReporefSeq);
				
				request.setAttribute("alert", "Report Ref No : "   +" "+ReporefSeq+" "+   "Updated Successfully.");
				//request.setAttribute("type", "AsstFlow");
				return "success";
			}	else{
			
				request.setAttribute("alert", "CRR Table  not updated successfully.");
				return "error";
			}
}




public String modXbcrrCreateAF() throws SQLException {
	
	log.info("sowryyyyyyyyyyyyyyyyyy");
	
	String status="";
	String status1="";
	
	String ReporefSeq="";
	HttpServletRequest request = ServletActionContext.getRequest();
	log.info("rptdayAF_row--->"+request.getParameter("rptdayAF"));
	 DateFormat df=new DateFormat();
	 
	 NullCheck nc=new NullCheck();
	
	HttpSession session = request.getSession();  
	
	log.info("dt1--->"+request.getParameter("dt1"));
	log.info("dt2--->"+request.getParameter("dt2"));
	//log.info("reportrefno====>>>"+request.getParameter("reportrefno"));
	log.info("rptdayAF_row--->"+request.getParameter("rptdayAF"));
	log.info("rptdateAF_row--->"+request.getParameter("rptdateAF"));
	log.info("depamtmurAF_row1--->"+request.getParameter("depamtmurAF"));
	log.info("depdeneurAF_row1--->"+request.getParameter("depdeneurAF"));
	
	log.info("depdengbpAF_row--->"+request.getParameter("depdengbpAF"));
	log.info("depdenusdAF_row--->"+request.getParameter("depdenusdAF"));
	log.info("usdequforAF_row--->"+request.getParameter("usdequforAF"));
	
	
	
	log.info("reccodAF_row--->"+request.getParameter("reccodAF"));
	
	log.info("rcrusridAF_row--->"+request.getParameter("rcrusridAF"));
	log.info("rcrtmeAF_row--->"+request.getParameter("rcrtmeAF"));
	log.info("lchusridAF_row--->"+request.getParameter("lchusridAF"));
	log.info("lchtmeAF_row--->"+request.getParameter("lchtmeAF"));
	
	
	
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	log.info("insert");
	PreparedStatement ps = null;
	PreparedStatement ps2 = null;
	
	StringBuffer sql2 = new StringBuffer();
	PreparedStatement ps3 = null;
	PreparedStatement ps4 = null;
	
	StringBuffer sql3 = new StringBuffer();
	StringBuffer sql4 = new StringBuffer();
	
	DateFormat df1=new DateFormat();
	
	
	//String passexpdate=df.formatdate(xb.getAFcopendate());
	log.info("==="+request.getParameter("reportrefno"));
	
	
	if(request.getParameter("reportrefno").startsWith("R")){
		
		log.info("else notttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt ");
		 ReporefSeq =request.getParameter("reportrefno");
			
	}else{
		

		
log.info("nullllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll");

		utilities.SequenceNumber seqNo = new utilities.SequenceNumber();
	String reporefseqno = seqNo.reporefno();
	
//log.info(" seqno  :=   " + seqno);
	
	 ReporefSeq = "RR01000" + reporefseqno;
		
	}
	log.info("===ReporefSeq==="+ReporefSeq);
	//log.info("<< EIDSeq >> " + EIDSeq); 
	session.setAttribute("ReprefSeq", ReporefSeq);
	
	//int rs=0;
	
	int count=0;
	
	StringBuffer sql = new StringBuffer();
	//HttpSession session = request.getSession();  
	log.info("insert AFtion modXbcrrCreateAF");
	
	
	
	
		try{
			
			
			//sql.append("SELECT Count (*) as cnt FROM   (SELECT DISTINCT RPT_DATE,REC_CODE FROM  CRR0100_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq+"' and RPT_DATE >='"+request.getParameter("dt1")+"' and RPT_DATE <= '"+request.getParameter("dt2")+"'  and REC_CODE='"+request.getParameter("reccod")+"') ");
			
			if(ReporefSeq.equals("null")){
			
				log.info("IFF");
				sql.append("SELECT Count (*) as cnt FROM   (SELECT DISTINCT RPT_DATE,REC_CODE FROM  CRR0100_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq.trim()+"' and RPT_DATE >='"+request.getParameter("dt1")+"' and RPT_DATE <= '"+request.getParameter("dt2")+"'  and DEL_FLG = 'N'  and REC_CODE='"+request.getParameter("reccodAF")+"') ");
			
			
			
				log.info("select count       .... NEW===  "+sql.toString());
				ps = conn.prepareStatement(sql.toString());
				
				log.info("count test  ");
				
				ResultSet rs = ps.executeQuery();
				//log.info(rs);
				if (rs.next()) {						
					count = rs.getInt("cnt"); 
					log.info("count"+count);
					
					if (count > 0) {
						log.info("UPDATE");
						log.info("dt1--->"+request.getParameter("dt1"));
						log.info("dt2--->"+request.getParameter("dt2"));
						log.info("reportrefno====>>>"+ReporefSeq);
						log.info("rptdayAF_row--->"+request.getParameter("rptdayAF"));
						log.info("rptdateAF_row--->"+df1.formatdate(request.getParameter("rptdateAF")));
						log.info("depamtmurAF_row1--->"+request.getParameter("depamtmurAF"));
						log.info("depdeneurAF_row1--->"+request.getParameter("depdeneurAF"));

						log.info("depdengbpAF_row--->"+request.getParameter("depdengbpAF"));
						log.info("depdenusdAF_row--->"+request.getParameter("depdenusdAF"));
						log.info("usdequforAF_row--->"+request.getParameter("usdequforAF"));
						
						log.info("reccodAF_row--->"+request.getParameter("reccodAF"));
						
						log.info("rcrusridAF_row--->"+request.getParameter("rcrusridAF"));
						log.info("rcrtmeAF_row--->"+request.getParameter("rcrtmeAF"));
						log.info("lchusridAF_row--->"+request.getParameter("lchusridAF"));
						log.info("lchtmeAF_row--->"+request.getParameter("lchtmeAF"));
						
	    				/*sql2.append("update CRR0100_MOD_TABLE set "
	    						
	    												+ "REPORT_REF_NO ='"+ReporefSeq+"',"
	    												+ "RPT_DAY ='"+request.getParameter("rptday")+"',"
	    												+ "RPT_DATE ='"+df1.formatdate(request.getParameter("rptdate"))+"',"
	    												+ "DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmur")+"',"
	    												+ "DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneur")+"',"
	    												+ "DEPOSIT_DENOM_IN_GBP ='"+request.getParameter("depdengbp")+"',"
	    												+ "DEPOSIT_DENOM_IN_USD ='"+df1.formatdate(request.getParameter("depdenusd"))+"',"
	    												+ "USD_EQUIV_OTH_FCY_DEPOSIT ='"+request.getParameter("usdequfor")+"',"
	    												+ "REC_CODE ='"+request.getParameter("reccod")+"',"
	    												+ "RCRE_USER_ID ='"+request.getParameter("rcrusrid")+"',"
	    												+ "RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtme"))+"',"
							    						+ "LCHG_USER_ID ='"+request.getParameter("lchusrid")+"',"
							    						+ "LCHG_TIME ='"+df1.formatdate(request.getParameter("lchtme"))+"'   where REC_CODE='"+ request.getParameter("reccod") + "' "
							    						+ "RPT_DATE='"+ df1.formatdate(request.getParameter("rptdate")) + "' ");*/
	    				
	    				
	    				
	    				
	    				
	 // sql2.append("update CRR0100_MOD_TABLE set REPORT_REF_NO ='"+ReporefSeq+"',RPT_DAY ='"+request.getParameter("rptday")+"',RPT_DATE ='"+df1.formatdate(request.getParameter("rptdate"))+"',DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmur")+" ',DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneur")+" ',DEPOSIT_DENOM_IN_GBP ='"+request.getParameter("depdengbp")+"',DEPOSIT_DENOM_IN_USD ='"+df1.formatdate(request.getParameter("depdenusd"))+" ',USD_EQUIV_OTH_FCY_DEPOSIT ='"+request.getParameter("usdequfor")+"',REC_CODE ='"+request.getParameter("reccod")+"',RCRE_USER_ID ='"+request.getParameter("rcrusrid")+"',RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtme"))+"',LCHG_USER_ID ='"+request.getParameter("lchusrid")+"',LCHG_TIME ='"+df1.formatdate(request.getParameter("lchtme"))+"'   where REPORT_REF_NO = '"+ReporefSeq+"'");
	    				
	  
	  
	  sql4.append("update CRR0100_MOD_TABLE set REPORT_REF_NO ='"+ReporefSeq.trim()+"',RPT_DAY ='"+request.getParameter("rptdayAF")+"',RPT_DATE ='"+df1.formatdate(request.getParameter("rptdateAF"))+"',DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmurAF").trim()+"',DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneurAF").trim()+"',REC_CODE ='"+request.getParameter("reccodAF")+"',DEL_FLG ='"+request.getParameter("delAF")+"',RCRE_USER_ID ='"+request.getParameter("rcrusridAF")+"',RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtmeAF"))+"',LCHG_USER_ID ='"+request.getParameter("lchusridAF")+"',LCHG_TIME =current_timestamp where REPORT_REF_NO ='"+ReporefSeq+"'");
	  
	  
	  log.info("ghf");
	    				log.info("Update======>"+sql4.toString());
	    				
						ps4 = conn.prepareStatement(sql4.toString());
						int rs4 = ps4.executeUpdate();
						if (rs4>0) {
							log.info("<<==Update Success==>>");
							/*request.setAttribute("type", "update");
							request.setAttribute("alert","Report Ref No : "   +" "+EIDSeq+" "+   "Updated Successfully");*/
							status1 = "updated";
							status = "success";
							
							
						}
	    				
	    				
	    			}else{
	    				log.info("INSERT");
	    				
	    				
	    				
	    				sql3.append("INSERT INTO CRR0100_MOD_TABLE("
	    						+ "REPORT_REF_NO,"
	    						+ "RPT_DAY,"
	    						+ "RPT_DATE,"    						
	    						+ "DEPOSIT_AMT_IN_MUR,"
	    						+ "DEPOSIT_DENOM_IN_EUR,"	
	    						+ "DEPOSIT_DENOM_IN_GBP,"
	    						+ "DEPOSIT_DENOM_IN_USD,"
	    						+ "USD_EQUIV_OTH_FCY_DEPOSIT,"
	    						+ "REC_CODE,"
	    						+ "DEL_FLG,"
	    						+ "RCRE_USER_ID,"
	    						+ "RCRE_TIME,"
	    						+ "LCHG_USER_ID,"
	    						+ "LCHG_TIME)");
	    				
	    				sql3.append("values('"+ReporefSeq.trim()+"','"+request.getParameter("rptdayAF")
	    				+"','"+df1.formatdate(request.getParameter("rptdateAF"))
	    				+"','"+request.getParameter("depamtmurAF").trim()
	    				+"','"+request.getParameter("depdeneurAF").trim()	
	    				+"','"+request.getParameter("depdengbpAF").trim()
	    				+"','"+request.getParameter("depdenusdAF")
	    				+"','"+request.getParameter("usdequforAF")	    				
	    				+"','"+request.getParameter("reccodAF")
	    				+"','"+request.getParameter("delAF")
	    				+"','"+request.getParameter("rcrusridAF")
	    				+"','"+df1.formatdate(request.getParameter("rcrtmeAF"))
	    				+"','"+request.getParameter("lchusridAF")
	    				+"','"+df1.formatdate(request.getParameter("lchtmeAF"))+"') ");
	    				
	    				
	    				//log.info("loginUPDAT"+sql3.toString()+username);
	    				//+"','"+EIDSeq+"',             '"+df1.formatdate(request.getParameter("rptstart"))+"','"+df1.formatdate(request.getParameter("rptend"))+"','"+request.getParameter("rptcrncy")+"','"+request.getParameter("bnkcode")+"','"+request.getParameter("modcode")+"','"+request.getParameter("modtype")
	    				log.info("Insert"+sql3.toString());
	    				
	    				ps3 = conn.prepareStatement(sql3.toString());
	    				int rs3 = ps3.executeUpdate();
	    				
	    				if (rs3 > 0) {
	    					
	    					request.setAttribute("ReporefSeq", ReporefSeq);
	    					
	    					status1="inserted";
	    					
	    					
	    					status = "success";
	    						
	    				}
	    		    		
					
					
				}
					
				}
			
			
			
			
			
			
			
			
			}else{
				
				log.info("ELSEEEE");
				
				sql.append("SELECT Count (*) as cnt FROM   (SELECT DISTINCT RPT_DATE,REC_CODE FROM  CRR0100_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq+"' and RPT_DATE ='"+request.getParameter("rptdateAF")+"'  and DEL_FLG ='N'  and REC_CODE='"+request.getParameter("reccodAF")+"') ");
		
			
			
			
				log.info("select count       .... NEW===  "+sql.toString());
				ps = conn.prepareStatement(sql.toString());
				
				log.info("count test  ");
				
				ResultSet rs = ps.executeQuery();
				//log.info(rs);
				if (rs.next()) {						
					count = rs.getInt("cnt"); 
					log.info("count"+count);
					
					if (count > 0) {
						log.info("UPDATE");
						log.info("dt1--->"+request.getParameter("dt1"));
						log.info("dt2--->"+request.getParameter("dt2"));
						log.info("reportrefno====>>>"+ReporefSeq);
						log.info("rptdayAF_row--->"+request.getParameter("rptdayAF"));
						log.info("rptdateAF_row--->"+df1.formatdate(request.getParameter("rptdateAF")));
						log.info("depamtmurAF_row1--->"+request.getParameter("depamtmurAF"));
						log.info("depdeneurAF_row1--->"+request.getParameter("depdeneurAF"));

						log.info("depdengbpAF_row--->"+request.getParameter("depdengbpAF"));
						log.info("depdenusdAF_row--->"+request.getParameter("depdenusdAF"));
						log.info("usdequforAF_row--->"+request.getParameter("usdequforAF"));
						
						log.info("reccodAF_row--->"+request.getParameter("reccodAF"));
						
						log.info("rcrusridAF_row--->"+request.getParameter("rcrusridAF"));
						log.info("rcrtmeAF_row--->"+request.getParameter("rcrtmeAF"));
						log.info("lchusridAF_row--->"+request.getParameter("lchusridAF"));
						log.info("lchtmeAF_row--->"+request.getParameter("lchtmeAF"));
						
	    				/*sql2.append("update CRR0100_MOD_TABLE set "
	    						
	    												+ "REPORT_REF_NO ='"+ReporefSeq+"',"
	    												+ "RPT_DAY ='"+request.getParameter("rptday")+"',"
	    												+ "RPT_DATE ='"+df1.formatdate(request.getParameter("rptdate"))+"',"
	    												+ "DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmur")+"',"
	    												+ "DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneur")+"',"
	    												+ "DEPOSIT_DENOM_IN_GBP ='"+request.getParameter("depdengbp")+"',"
	    												+ "DEPOSIT_DENOM_IN_USD ='"+df1.formatdate(request.getParameter("depdenusd"))+"',"
	    												+ "USD_EQUIV_OTH_FCY_DEPOSIT ='"+request.getParameter("usdequfor")+"',"
	    												+ "REC_CODE ='"+request.getParameter("reccod")+"',"
	    												+ "RCRE_USER_ID ='"+request.getParameter("rcrusrid")+"',"
	    												+ "RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtme"))+"',"
							    						+ "LCHG_USER_ID ='"+request.getParameter("lchusrid")+"',"
							    						+ "LCHG_TIME ='"+df1.formatdate(request.getParameter("lchtme"))+"'   where REC_CODE='"+ request.getParameter("reccod") + "' "
							    						+ "RPT_DATE='"+ df1.formatdate(request.getParameter("rptdate")) + "' ");*/
	    				
	    				
	    				
	    				
	    				
	 // sql2.append("update CRR0100_MOD_TABLE set REPORT_REF_NO ='"+ReporefSeq+"',RPT_DAY ='"+request.getParameter("rptday")+"',RPT_DATE ='"+df1.formatdate(request.getParameter("rptdate"))+"',DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmur")+" ',DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneur")+" ',DEPOSIT_DENOM_IN_GBP ='"+request.getParameter("depdengbp")+"',DEPOSIT_DENOM_IN_USD ='"+df1.formatdate(request.getParameter("depdenusd"))+" ',USD_EQUIV_OTH_FCY_DEPOSIT ='"+request.getParameter("usdequfor")+"',REC_CODE ='"+request.getParameter("reccod")+"',RCRE_USER_ID ='"+request.getParameter("rcrusrid")+"',RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtme"))+"',LCHG_USER_ID ='"+request.getParameter("lchusrid")+"',LCHG_TIME ='"+df1.formatdate(request.getParameter("lchtme"))+"'   where REPORT_REF_NO = '"+ReporefSeq+"'");
	    				
	  
	  
	  sql4.append("update CRR0100_MOD_TABLE set REPORT_REF_NO ='"+ReporefSeq+"',RPT_DAY ='"+request.getParameter("rptdayAF")+"',RPT_DATE ='"+df1.formatdate(request.getParameter("rptdateAF"))+"',DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmurAF")+"',DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneurAF")+"',REC_CODE ='"+request.getParameter("reccodAF")+"',DEL_FLG ='"+request.getParameter("delAF")+"',RCRE_USER_ID ='"+request.getParameter("rcrusridAF")+"',RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtmeAF"))+"',LCHG_USER_ID ='"+request.getParameter("lchusridAF")+"',LCHG_TIME =current_timestamp where REPORT_REF_NO ='"+ReporefSeq+"' and RPT_DATE ='"+df1.formatdate(request.getParameter("rptdateAF"))+"'  and REC_CODE='"+request.getParameter("reccodAF")+"'");
	  
	  
	  log.info("ghf");
	    				log.info("Update======>"+sql4.toString());
	    				
						ps4 = conn.prepareStatement(sql4.toString());
						int rs4 = ps4.executeUpdate();
						if (rs4>0) {
							log.info("<<==Update Success==>>");
							/*request.setAttribute("type", "update");
							request.setAttribute("alert","Report Ref No : "   +" "+EIDSeq+" "+   "Updated Successfully");*/
							status1 = "updated";
							status = "success";
							
							
						}
	    				
	    				
	    			}else{
	    				log.info("INSERT");
	    				
	    				
	    				
	    				sql3.append("INSERT INTO CRR0100_MOD_TABLE("
	    						+ "REPORT_REF_NO,"
	    						+ "RPT_DAY,"
	    						+ "RPT_DATE,"    						
	    						+ "DEPOSIT_AMT_IN_MUR,"
	    						+ "DEPOSIT_DENOM_IN_EUR,"	
	    						+ "DEPOSIT_DENOM_IN_GBP,"
	    						+ "DEPOSIT_DENOM_IN_USD,"
	    						+ "USD_EQUIV_OTH_FCY_DEPOSIT,"
	    						+ "REC_CODE,"
	    						+ "DEL_FLG,"
	    						+ "RCRE_USER_ID,"
	    						+ "RCRE_TIME,"
	    						+ "LCHG_USER_ID,"
	    						+ "LCHG_TIME)");
	    				
	    				sql3.append("values('"+ReporefSeq.trim()+"','"+request.getParameter("rptdayAF")
	    				+"','"+df1.formatdate(request.getParameter("rptdateAF"))
	    				+"','"+request.getParameter("depamtmurAF").trim()
	    				+"','"+request.getParameter("depdeneurAF").trim()
	    				+"','"+request.getParameter("depdengbpAF").trim()
	    				+"','"+request.getParameter("depdenusdAF")
	    				+"','"+request.getParameter("usdequforAF")	    				
	    				+"','"+request.getParameter("reccodAF")
	    				+"','"+request.getParameter("delAF")
	    				+"','"+request.getParameter("rcrusridAF")
	    				+"','"+df1.formatdate(request.getParameter("rcrtmeAF"))
	    				+"','"+request.getParameter("lchusridAF")
	    				+"',current_timestamp) ");
	    				
	    				
	    				//log.info("loginUPDAT"+sql3.toString()+username);
	    				//+"','"+EIDSeq+"',             '"+df1.formatdate(request.getParameter("rptstart"))+"','"+df1.formatdate(request.getParameter("rptend"))+"','"+request.getParameter("rptcrncy")+"','"+request.getParameter("bnkcode")+"','"+request.getParameter("modcode")+"','"+request.getParameter("modtype")
	    				log.info("Insert"+sql3.toString());
	    				
	    				ps3 = conn.prepareStatement(sql3.toString());
	    				int rs3 = ps3.executeUpdate();
	    				
	    				if (rs3 > 0) {
	    					
	    					request.setAttribute("ReporefSeq", ReporefSeq);
	    					
	    					status1="inserted";
	    					
	    					
	    					status = "success";
	    						
	    				}
	    		    		
					
					
				}
					
				}
			
			}
			
			
			 
		}
		
		catch (SQLException e) {
			status="error";
			e.printStackTrace();
		} 
	
		/*RepID Display HeAFer*/
		
		refnoAF=ReporefSeq;
	
		if(status.equals("success") && status1.equals("inserted")){
        	
    		
	    	//	log.info("==insert Statusss==");
	    		//String next=lmd.insertRecord(arl,AF);
				//request.setAttribute("alert", "Report Ref No : "   +" "+EIDSeq+" "+   "Inserted Successfully.");
				request.setAttribute("type", "insertedAF");
				request.setAttribute("dt1AF", request.getParameter("dt1"));
				request.setAttribute("dt2AF", request.getParameter("dt2"));
				request.setAttribute("ReporefSeqAF", ReporefSeq);
				request.setAttribute("alert", "Report Ref No : "   +" "+ReporefSeq+" "+   "Created Successfully.");
	    		
				//XBRLCRR0100Dao dmd =new XBRLCRR0100Dao();
	    		//ArrayList<XBRLCRR0100Bean> list=dmd.xbrlcrrRR(ReporefSeq);
	    		
				return "success";
			}else if(status.equals("success") && status1.equals("updated")){
			//	log.info("==update Statusss==");
	    		//String next=lmd.insertRecord(arl,AF);
				
				request.setAttribute("type", "updatedAF");
				request.setAttribute("dt1AF", request.getParameter("dt1"));
				request.setAttribute("dt2AF", request.getParameter("dt2"));
				request.setAttribute("ReporefSeqAF", ReporefSeq);
				
				request.setAttribute("alert", "Report Ref No : "   +" "+ReporefSeq+" "+   "Updated Successfully.");
				//request.setAttribute("type", "AsstFlow");
				return "success";
			}	else{
			
				request.setAttribute("alert", "CRR Table  not updated successfully.");
				return "error";
			}
}

public String modXbcrrCreateAH() throws SQLException {
	
	log.info("sowryyyyyyyyyyyyyyyyyy");
	
	String status="";
	String status1="";
	
	String ReporefSeq="";
	HttpServletRequest request = ServletActionContext.getRequest();
	log.info("rptdayAH_row--->"+request.getParameter("rptdayAH"));
	 DateFormat df=new DateFormat();
	 
	 NullCheck nc=new NullCheck();
	
	HttpSession session = request.getSession();  
	
	log.info("dt1--->"+request.getParameter("dt1"));
	log.info("dt2--->"+request.getParameter("dt2"));
	//log.info("reportrefno====>>>"+request.getParameter("reportrefno"));
	log.info("rptdayAH_row--->"+request.getParameter("rptdayAH"));
	log.info("rptdateAH_row--->"+request.getParameter("rptdateAH"));
	log.info("depamtmurAH_row1--->"+request.getParameter("depamtmurAH"));
	log.info("depdeneurAH_row1--->"+request.getParameter("depdeneurAH"));
	
	log.info("depdengbpAH_row--->"+request.getParameter("depdengbpAH"));
	log.info("depdenusdAH_row--->"+request.getParameter("depdenusdAH"));
	log.info("usdequforAH_row--->"+request.getParameter("usdequforAH"));
	
	
	
	log.info("reccodAH_row--->"+request.getParameter("reccodAH"));
	
	log.info("rcrusridAH_row--->"+request.getParameter("rcrusridAH"));
	log.info("rcrtmeAH_row--->"+request.getParameter("rcrtmeAH"));
	log.info("lchusridAH_row--->"+request.getParameter("lchusridAH"));
	log.info("lchtmeAH_row--->"+request.getParameter("lchtmeAH"));
	
	
	
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	log.info("insert");
	PreparedStatement ps = null;
	PreparedStatement ps2 = null;
	
	StringBuffer sql2 = new StringBuffer();
	PreparedStatement ps3 = null;
	PreparedStatement ps4 = null;
	
	StringBuffer sql3 = new StringBuffer();
	StringBuffer sql4 = new StringBuffer();
	
	DateFormat df1=new DateFormat();
	
	
	//String passexpdate=df.formatdate(xb.getAccopendate());
	log.info("==="+request.getParameter("reportrefno"));
	
	
	if(request.getParameter("reportrefno").startsWith("R")){
		
		log.info("else notttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt ");
		 ReporefSeq =request.getParameter("reportrefno");
			
	}else{
		

		
log.info("nullllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll");

		utilities.SequenceNumber seqNo = new utilities.SequenceNumber();
	String reporefseqno = seqNo.reporefno();
	
//log.info(" seqno  :=   " + seqno);
	
	 ReporefSeq = "RR01000" + reporefseqno;
		
	}
	log.info("===ReporefSeq==="+ReporefSeq);
	//log.info("<< EIDSeq >> " + EIDSeq); 
	session.setAttribute("ReprefSeq", ReporefSeq);
	
	//int rs=0;
	
	int count=0;
	
	StringBuffer sql = new StringBuffer();
	//HttpSession session = request.getSession();  
	log.info("insert Action modXbcrrCreateAH");
	
	
	
	
		try{
			
			
			//sql.append("SELECT Count (*) as cnt FROM   (SELECT DISTINCT RPT_DATE,REC_CODE FROM  CRR0100_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq+"' and RPT_DATE >='"+request.getParameter("dt1")+"' and RPT_DATE <= '"+request.getParameter("dt2")+"'  and REC_CODE='"+request.getParameter("reccod")+"') ");
			
			if(ReporefSeq.equals("null")){
			
				log.info("IFF");
				sql.append("SELECT Count (*) as cnt FROM   (SELECT DISTINCT RPT_DATE,REC_CODE FROM  CRR0100_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq.trim()+"' and RPT_DATE >='"+request.getParameter("dt1")+"' and RPT_DATE <= '"+request.getParameter("dt2")+"' and DEL_FLG='N' and REC_CODE='"+request.getParameter("reccodAH")+"') ");
			
			
			
				log.info("select count       .... NEW===  "+sql.toString());
				ps = conn.prepareStatement(sql.toString());
				
				log.info("count test  ");
				
				ResultSet rs = ps.executeQuery();
				//log.info(rs);
				if (rs.next()) {						
					count = rs.getInt("cnt"); 
					log.info("count"+count);
					
					if (count > 0) {
						log.info("UPDATE");
						log.info("dt1--->"+request.getParameter("dt1"));
						log.info("dt2--->"+request.getParameter("dt2"));
						log.info("reportrefno====>>>"+ReporefSeq);
						log.info("rptdayAH_row--->"+request.getParameter("rptdayAH"));
						log.info("rptdateAH_row--->"+df1.formatdate(request.getParameter("rptdateAH")));
						log.info("depamtmurAH_row1--->"+request.getParameter("depamtmurAH"));
						log.info("depdeneurAH_row1--->"+request.getParameter("depdeneurAH"));

						log.info("depdengbpAH_row--->"+request.getParameter("depdengbpAH"));
						log.info("depdenusdAH_row--->"+request.getParameter("depdenusdAH"));
						log.info("usdequforAH_row--->"+request.getParameter("usdequforAH"));
						
						log.info("reccodAH_row--->"+request.getParameter("reccodAH"));
						
						log.info("rcrusridAH_row--->"+request.getParameter("rcrusridAH"));
						log.info("rcrtmeAH_row--->"+request.getParameter("rcrtmeAH"));
						log.info("lchusridAH_row--->"+request.getParameter("lchusridAH"));
						log.info("lchtmeAH_row--->"+request.getParameter("lchtmeAH"));
						
	    				/*sql2.append("update CRR0100_MOD_TABLE set "
	    						
	    												+ "REPORT_REF_NO ='"+ReporefSeq+"',"
	    												+ "RPT_DAY ='"+request.getParameter("rptday")+"',"
	    												+ "RPT_DATE ='"+df1.formatdate(request.getParameter("rptdate"))+"',"
	    												+ "DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmur")+"',"
	    												+ "DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneur")+"',"
	    												+ "DEPOSIT_DENOM_IN_GBP ='"+request.getParameter("depdengbp")+"',"
	    												+ "DEPOSIT_DENOM_IN_USD ='"+df1.formatdate(request.getParameter("depdenusd"))+"',"
	    												+ "USD_EQUIV_OTH_FCY_DEPOSIT ='"+request.getParameter("usdequfor")+"',"
	    												+ "REC_CODE ='"+request.getParameter("reccod")+"',"
	    												+ "RCRE_USER_ID ='"+request.getParameter("rcrusrid")+"',"
	    												+ "RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtme"))+"',"
							    						+ "LCHG_USER_ID ='"+request.getParameter("lchusrid")+"',"
							    						+ "LCHG_TIME ='"+df1.formatdate(request.getParameter("lchtme"))+"'   where REC_CODE='"+ request.getParameter("reccod") + "' "
							    						+ "RPT_DATE='"+ df1.formatdate(request.getParameter("rptdate")) + "' ");*/
	    				
	    				
	    				
	    				
	    				
	 // sql2.append("update CRR0100_MOD_TABLE set REPORT_REF_NO ='"+ReporefSeq+"',RPT_DAY ='"+request.getParameter("rptday")+"',RPT_DATE ='"+df1.formatdate(request.getParameter("rptdate"))+"',DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmur")+" ',DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneur")+" ',DEPOSIT_DENOM_IN_GBP ='"+request.getParameter("depdengbp")+"',DEPOSIT_DENOM_IN_USD ='"+df1.formatdate(request.getParameter("depdenusd"))+" ',USD_EQUIV_OTH_FCY_DEPOSIT ='"+request.getParameter("usdequfor")+"',REC_CODE ='"+request.getParameter("reccod")+"',RCRE_USER_ID ='"+request.getParameter("rcrusrid")+"',RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtme"))+"',LCHG_USER_ID ='"+request.getParameter("lchusrid")+"',LCHG_TIME ='"+df1.formatdate(request.getParameter("lchtme"))+"'   where REPORT_REF_NO = '"+ReporefSeq+"'");
	    				
	  
	  
	  sql4.append("update CRR0100_MOD_TABLE set REPORT_REF_NO ='"+ReporefSeq.trim()+"',RPT_DAY ='"+request.getParameter("rptdayAH")+"',RPT_DATE ='"+df1.formatdate(request.getParameter("rptdateAH"))+"',DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmurAH").trim()+"',DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneurAH").trim()+"',REC_CODE ='"+request.getParameter("reccodAH")+"',DEL_FLG ='"+request.getParameter("delAH")+"',RCRE_USER_ID ='"+request.getParameter("rcrusridAH")+"',RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtmeAH"))+"',LCHG_USER_ID ='"+request.getParameter("lchusridAH")+"',LCHG_TIME =current_timestamp where REPORT_REF_NO ='"+ReporefSeq+"'");
	  
	  
	  log.info("ghf");
	    				log.info("Update======>"+sql4.toString());
	    				
						ps4 = conn.prepareStatement(sql4.toString());
						int rs4 = ps4.executeUpdate();
						if (rs4>0) {
							log.info("<<==Update Success==>>");
							/*request.setAttribute("type", "update");
							request.setAttribute("alert","Report Ref No : "   +" "+EIDSeq+" "+   "Updated Successfully");*/
							status1 = "updated";
							status = "success";
							
							
						}
	    				
	    				
	    			}else{
	    				log.info("INSERT");
	    				
	    				
	    				
	    				sql3.append("INSERT INTO CRR0100_MOD_TABLE("
	    						+ "REPORT_REF_NO,"
	    						+ "RPT_DAY,"
	    						+ "RPT_DATE,"    						
	    						+ "DEPOSIT_AMT_IN_MUR,"
	    						+ "DEPOSIT_DENOM_IN_EUR,"	
	    						+ "DEPOSIT_DENOM_IN_GBP,"
	    						+ "DEPOSIT_DENOM_IN_USD,"
	    						+ "USD_EQUIV_OTH_FCY_DEPOSIT,"
	    						+ "REC_CODE,"
	    						+ "DEL_FLG,"
	    						+ "RCRE_USER_ID,"
	    						+ "RCRE_TIME,"
	    						+ "LCHG_USER_ID,"
	    						+ "LCHG_TIME)");
	    				
	    				sql3.append("values('"+ReporefSeq.trim()+"','"+request.getParameter("rptdayAH")
	    				+"','"+df1.formatdate(request.getParameter("rptdateAH"))
	    				+"','"+request.getParameter("depamtmurAH").trim()
	    				+"','"+request.getParameter("depdeneurAH").trim()	
	    				+"','"+request.getParameter("depdengbpAH").trim()
	    				+"','"+request.getParameter("depdenusdAH")
	    				+"','"+request.getParameter("usdequforAH")	    				
	    				+"','"+request.getParameter("reccodAH")
	    				+"','"+request.getParameter("delAH")
	    				+"','"+request.getParameter("rcrusridAH")
	    				+"','"+df1.formatdate(request.getParameter("rcrtmeAH"))
	    				+"','"+request.getParameter("lchusridAH")
	    				+"',current_timestamp) ");
	    				
	    				
	    				//log.info("loginUPDAT"+sql3.toString()+username);
	    				//+"','"+EIDSeq+"',             '"+df1.formatdate(request.getParameter("rptstart"))+"','"+df1.formatdate(request.getParameter("rptend"))+"','"+request.getParameter("rptcrncy")+"','"+request.getParameter("bnkcode")+"','"+request.getParameter("modcode")+"','"+request.getParameter("modtype")
	    				log.info("Insert"+sql3.toString());
	    				
	    				ps3 = conn.prepareStatement(sql3.toString());
	    				int rs3 = ps3.executeUpdate();
	    				
	    				if (rs3 > 0) {
	    					
	    					request.setAttribute("ReporefSeq", ReporefSeq);
	    					
	    					status1="inserted";
	    					
	    					
	    					status = "success";
	    						
	    				}
	    		    		
					
					
				}
					
				}
			
			
			
			
			
			
			
			
			}else{
				
				log.info("ELSEEEE");
				
				sql.append("SELECT Count (*) as cnt FROM   (SELECT DISTINCT RPT_DATE,REC_CODE FROM  CRR0100_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq.trim()+"' and RPT_DATE ='"+request.getParameter("rptdateAH")+"' and DEL_FLG='N' and REC_CODE='"+request.getParameter("reccodAH")+"') ");
		
			
			
			
				log.info("select count       .... NEW===  "+sql.toString());
				ps = conn.prepareStatement(sql.toString());
				
				log.info("count test  ");
				
				ResultSet rs = ps.executeQuery();
				//log.info(rs);
				if (rs.next()) {						
					count = rs.getInt("cnt"); 
					log.info("count"+count);
					
					if (count > 0) {
						log.info("UPDATE");
						log.info("dt1--->"+request.getParameter("dt1"));
						log.info("dt2--->"+request.getParameter("dt2"));
						log.info("reportrefno====>>>"+ReporefSeq);
						log.info("rptdayAH_row--->"+request.getParameter("rptdayAH"));
						log.info("rptdateAH_row--->"+df1.formatdate(request.getParameter("rptdateAH")));
						log.info("depamtmurAH_row1--->"+request.getParameter("depamtmurAH"));
						log.info("depdeneurAH_row1--->"+request.getParameter("depdeneurAH"));

						log.info("depdengbpAH_row--->"+request.getParameter("depdengbpAH"));
						log.info("depdenusdAH_row--->"+request.getParameter("depdenusdAH"));
						log.info("usdequforAH_row--->"+request.getParameter("usdequforAH"));
						
						log.info("reccodAH_row--->"+request.getParameter("reccodAH"));
						
						log.info("rcrusridAH_row--->"+request.getParameter("rcrusridAH"));
						log.info("rcrtmeAH_row--->"+request.getParameter("rcrtmeAH"));
						log.info("lchusridAH_row--->"+request.getParameter("lchusridAH"));
						log.info("lchtmeAH_row--->"+request.getParameter("lchtmeAH"));
						
	    				/*sql2.append("update CRR0100_MOD_TABLE set "
	    						
	    												+ "REPORT_REF_NO ='"+ReporefSeq+"',"
	    												+ "RPT_DAY ='"+request.getParameter("rptday")+"',"
	    												+ "RPT_DATE ='"+df1.formatdate(request.getParameter("rptdate"))+"',"
	    												+ "DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmur")+"',"
	    												+ "DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneur")+"',"
	    												+ "DEPOSIT_DENOM_IN_GBP ='"+request.getParameter("depdengbp")+"',"
	    												+ "DEPOSIT_DENOM_IN_USD ='"+df1.formatdate(request.getParameter("depdenusd"))+"',"
	    												+ "USD_EQUIV_OTH_FCY_DEPOSIT ='"+request.getParameter("usdequfor")+"',"
	    												+ "REC_CODE ='"+request.getParameter("reccod")+"',"
	    												+ "RCRE_USER_ID ='"+request.getParameter("rcrusrid")+"',"
	    												+ "RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtme"))+"',"
							    						+ "LCHG_USER_ID ='"+request.getParameter("lchusrid")+"',"
							    						+ "LCHG_TIME ='"+df1.formatdate(request.getParameter("lchtme"))+"'   where REC_CODE='"+ request.getParameter("reccod") + "' "
							    						+ "RPT_DATE='"+ df1.formatdate(request.getParameter("rptdate")) + "' ");*/
	    				
	    				
	    				
	    				
	    				
	 // sql2.append("update CRR0100_MOD_TABLE set REPORT_REF_NO ='"+ReporefSeq+"',RPT_DAY ='"+request.getParameter("rptday")+"',RPT_DATE ='"+df1.formatdate(request.getParameter("rptdate"))+"',DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmur")+" ',DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneur")+" ',DEPOSIT_DENOM_IN_GBP ='"+request.getParameter("depdengbp")+"',DEPOSIT_DENOM_IN_USD ='"+df1.formatdate(request.getParameter("depdenusd"))+" ',USD_EQUIV_OTH_FCY_DEPOSIT ='"+request.getParameter("usdequfor")+"',REC_CODE ='"+request.getParameter("reccod")+"',RCRE_USER_ID ='"+request.getParameter("rcrusrid")+"',RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtme"))+"',LCHG_USER_ID ='"+request.getParameter("lchusrid")+"',LCHG_TIME ='"+df1.formatdate(request.getParameter("lchtme"))+"'   where REPORT_REF_NO = '"+ReporefSeq+"'");
	    				
	  
	  
	  sql4.append("update CRR0100_MOD_TABLE set REPORT_REF_NO ='"+ReporefSeq+"',RPT_DAY ='"+request.getParameter("rptdayAH")+"',RPT_DATE ='"+df1.formatdate(request.getParameter("rptdateAH"))+"',DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmurAH")+" ',DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneurAH")+"',REC_CODE ='"+request.getParameter("reccodAH")+"',DEL_FLG ='"+request.getParameter("delAH")+"',RCRE_USER_ID ='"+request.getParameter("rcrusridAH")+"',RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtmeAH"))+"',LCHG_USER_ID ='"+request.getParameter("lchusridAH")+"',LCHG_TIME =current_timestamp where REPORT_REF_NO ='"+ReporefSeq+"' and RPT_DATE ='"+df1.formatdate(request.getParameter("rptdateAH"))+"'  and REC_CODE='"+request.getParameter("reccodAH")+"'");
	  
	  
	  log.info("ghf");
	    				log.info("Update======>"+sql4.toString());
	    				
						ps4 = conn.prepareStatement(sql4.toString());
						int rs4 = ps4.executeUpdate();
						if (rs4>0) {
							log.info("<<==Update Success==>>");
							/*request.setAttribute("type", "update");
							request.setAttribute("alert","Report Ref No : "   +" "+EIDSeq+" "+   "Updated Successfully");*/
							status1 = "updated";
							status = "success";
							
							
						}
	    				
	    				
	    			}else{
	    				log.info("INSERT");
	    				
	    				
	    				
	    				sql3.append("INSERT INTO CRR0100_MOD_TABLE("
	    						+ "REPORT_REF_NO,"
	    						+ "RPT_DAY,"
	    						+ "RPT_DATE,"    						
	    						+ "DEPOSIT_AMT_IN_MUR,"
	    						+ "DEPOSIT_DENOM_IN_EUR,"	
	    						+ "DEPOSIT_DENOM_IN_GBP,"
	    						+ "DEPOSIT_DENOM_IN_USD,"
	    						+ "USD_EQUIV_OTH_FCY_DEPOSIT,"
	    						+ "REC_CODE,"
	    						+ "DEL_FLG,"
	    						+ "RCRE_USER_ID,"
	    						+ "RCRE_TIME,"
	    						+ "LCHG_USER_ID,"
	    						+ "LCHG_TIME)");
	    				
	    				sql3.append("values('"+ReporefSeq.trim()+"','"+request.getParameter("rptdayAH")
	    				+"','"+df1.formatdate(request.getParameter("rptdateAH"))
	    				+"','"+request.getParameter("depamtmurAH").trim()
	    				+"','"+request.getParameter("depdeneurAH").trim()
	    				+"','"+request.getParameter("depdengbpAH").trim()
	    				+"','"+request.getParameter("depdenusdAH")
	    				+"','"+request.getParameter("usdequforAH")	    				
	    				+"','"+request.getParameter("reccodAH")
	    				+"','"+request.getParameter("delAH")
	    				+"','"+request.getParameter("rcrusridAH")
	    				+"','"+df1.formatdate(request.getParameter("rcrtmeAH"))
	    				+"','"+request.getParameter("lchusridAH")
	    				+"',current_timestamp) ");
	    				
	    				
	    				//log.info("loginUPDAT"+sql3.toString()+username);
	    				//+"','"+EIDSeq+"',             '"+df1.formatdate(request.getParameter("rptstart"))+"','"+df1.formatdate(request.getParameter("rptend"))+"','"+request.getParameter("rptcrncy")+"','"+request.getParameter("bnkcode")+"','"+request.getParameter("modcode")+"','"+request.getParameter("modtype")
	    				log.info("Insert"+sql3.toString());
	    				
	    				ps3 = conn.prepareStatement(sql3.toString());
	    				int rs3 = ps3.executeUpdate();
	    				
	    				if (rs3 > 0) {
	    					
	    					request.setAttribute("ReporefSeq", ReporefSeq);
	    					
	    					status1="inserted";
	    					
	    					
	    					status = "success";
	    						
	    				}
	    		    		
					
					
				}
					
				}
			}
			
			
			 
		}
		
		catch (SQLException e) {
			status="error";
			e.printStackTrace();
		} 
	
		/*RepID Display Header*/
		
		refnoAH=ReporefSeq;
	
		if(status.equals("success") && status1.equals("inserted")){
        	
    		
	    	//	log.info("==insert Statusss==");
	    		//String next=lmd.insertRecord(arl,AH);
				//request.setAttribute("alert", "Report Ref No : "   +" "+EIDSeq+" "+   "Inserted Successfully.");
				request.setAttribute("type", "insertedAH");
				request.setAttribute("dt1AH", request.getParameter("dt1"));
				request.setAttribute("dt2AH", request.getParameter("dt2"));
				request.setAttribute("ReporefSeqAH", ReporefSeq);
				request.setAttribute("alert", "Report Ref No : "   +" "+ReporefSeq+" "+   "Created Successfully.");
	    		
				//XBRLCRR0100Dao dmd =new XBRLCRR0100Dao();
	    		//ArrayList<XBRLCRR0100Bean> list=dmd.xbrlcrrRR(ReporefSeq);
	    		
				return "success";
			}else if(status.equals("success") && status1.equals("updated")){
			//	log.info("==update Statusss==");
	    		//String next=lmd.insertRecord(arl,AH);
				
				request.setAttribute("type", "updatedAH");
				request.setAttribute("dt1AH", request.getParameter("dt1"));
				request.setAttribute("dt2AH", request.getParameter("dt2"));
				request.setAttribute("ReporefSeqAH", ReporefSeq);
				
				request.setAttribute("alert", "Report Ref No : "   +" "+ReporefSeq+" "+   "Updated Successfully.");
				//request.setAttribute("type", "AsstFlow");
				return "success";
			}	else{
			
				request.setAttribute("alert", "CRR Table  not updated successfully.");
				return "error";
			}
}


public String modXbcrrCreateAB() throws SQLException {
	
	log.info("sowryyyyyyyyyyyyyyyyyy");
	
	String status="";
	String status1="";
	
	String ReporefSeq="";
	HttpServletRequest request = ServletActionContext.getRequest();
	log.info("rptday_row--->"+request.getParameter("rptday"));
	 DateFormat df=new DateFormat();
	 
	 NullCheck nc=new NullCheck();
	
	HttpSession session = request.getSession();  
	
	log.info("dt1--->"+request.getParameter("dt1"));
	log.info("dt2--->"+request.getParameter("dt2"));	
	log.info("rptday_row--->"+request.getParameter("rptday"));
	log.info("rptdate_row--->"+request.getParameter("rptdate"));
	log.info("depamtmur_row1--->"+request.getParameter("depamtmur"));
	log.info("depdeneur_row1--->"+request.getParameter("depdeneur"));	
	log.info("depdengbp_row--->"+request.getParameter("depdengbp"));
	log.info("depdenusd_row--->"+request.getParameter("depdenusd"));
	log.info("usdequfor_row--->"+request.getParameter("usdequfor"));	
	log.info("reccod_row--->"+request.getParameter("reccod"));	
	log.info("rcrusrid_row--->"+request.getParameter("rcrusrid"));
	log.info("rcrtme_row--->"+request.getParameter("rcrtme"));
	log.info("lchusrid_row--->"+request.getParameter("lchusrid"));
	log.info("lchtme_row--->"+request.getParameter("lchtme"));	
	log.info("reportrefnos--->"+request.getParameter("reportrefnos")+"123");
	
	log.info("DELLLLLLLLLLLLLLLL--->"+request.getParameter("del"));	
	
	
	ConnectionManager connMgr = new ConnectionManager();
	Connection conn = connMgr.getConnection();
	log.info("insert");
	PreparedStatement ps = null;
	PreparedStatement ps2 = null;
	
	StringBuffer sql2 = new StringBuffer();
	PreparedStatement ps3 = null;
	PreparedStatement ps4 = null;
	
	StringBuffer sql3 = new StringBuffer();
	StringBuffer sql4 = new StringBuffer();
	
	DateFormat df1=new DateFormat();
	
	
	
	if(request.getParameter("reportrefnos").startsWith("R")){
		
		log.info("else notttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt// ");
		 ReporefSeq =request.getParameter("reportrefnos");
			
	}else{
		
		log.info("New Sequence number");
		utilities.SequenceNumber seqNo = new utilities.SequenceNumber();
		String reporefseqno = seqNo.reporefno();		
		ReporefSeq = "RR01000" + reporefseqno;
		
	}
	
	log.info("===ReporefSeq==="+ReporefSeq);
	
	session.setAttribute("ReprefSeq", ReporefSeq);
	

	
	int count=0;
	
	StringBuffer sql = new StringBuffer();
	//HttpSession session = request.getSession();  
	log.info("insert Action modXbcrrCreate");
	
	
	
	
		try{
			
			
			//sql.append("SELECT Count (*) as cnt FROM   (SELECT DISTINCT RPT_DATE,REC_CODE FROM  CRR0100_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq+"' and RPT_DATE >='"+request.getParameter("dt1")+"' and RPT_DATE <= '"+request.getParameter("dt2")+"'  and REC_CODE='"+request.getParameter("reccod")+"') ");
			
			if(ReporefSeq.equals("null")){
			
				log.info("IFF");
				sql.append("SELECT Count (*) as cnt FROM   (SELECT DISTINCT RPT_DATE,REC_CODE FROM  CRR0100_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq.trim()+"' and RPT_DATE >='"+request.getParameter("dt1")+"' and RPT_DATE <= '"+request.getParameter("dt2")+"' and DEL_FLG='N'  and REC_CODE='"+request.getParameter("reccod")+"') ");
			
			
			
				log.info("select count       .... NEW===  "+sql.toString());
				ps = conn.prepareStatement(sql.toString());
				
				log.info("count test  ");
				
				ResultSet rs = ps.executeQuery();
				//log.info(rs);
				if (rs.next()) {						
					count = rs.getInt("cnt"); 
					log.info("count"+count);
					
					if (count > 0) {
						log.info("UPDATE");
						log.info("dt1--->"+request.getParameter("dt1"));
						log.info("dt2--->"+request.getParameter("dt2"));
						//log.info("reportrefno====>>>"+request.getParameter("reportrefno"));
						log.info("rptday_row--->"+request.getParameter("rptday"));
						log.info("rptdate_row--->"+request.getParameter("rptdate"));
						log.info("depamtmur_row1--->"+request.getParameter("depamtmur"));
						log.info("depdeneur_row1--->"+request.getParameter("depdeneur"));
						
						log.info("depdengbp_row--->"+request.getParameter("depdengbp"));
						log.info("depdenusd_row--->"+request.getParameter("depdenusd"));
						log.info("usdequfor_row--->"+request.getParameter("usdequfor"));
						
						
						
						log.info("reccod_row--->"+request.getParameter("reccod"));
						
						log.info("rcrusrid_row--->"+request.getParameter("rcrusrid"));
						log.info("rcrtme_row--->"+request.getParameter("rcrtme"));
						log.info("lchusrid_row--->"+request.getParameter("lchusrid"));
						log.info("hiiii Ganiiidsdddddddddddddddddiiii");
						log.info("lchtme_row--->"+request.getParameter("lchtme"));
						
						
						log.info("hiiii Ganiiiiiii");
						
	  sql4.append("update CRR0100_MOD_TABLE set REPORT_REF_NO ='"+ReporefSeq.trim()+"',RPT_DAY ='"+request.getParameter("rptday")+"',RPT_DATE ='"+df1.formatdate(request.getParameter("rptdate"))+"',DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmur").trim()+"',DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneur").trim()+"',REC_CODE ='"+request.getParameter("reccod")+"',DEL_FLG ='"+request.getParameter("delAB")+"',RCRE_USER_ID ='"+request.getParameter("rcrusrid")+"',RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtme"))+"',LCHG_USER_ID ='"+request.getParameter("lchusrid")+"',LCHG_TIME =current_timestamp where REPORT_REF_NO ='"+ReporefSeq+"'");
	  
	  
	  log.info("ghf");
	    				log.info("Update======>"+sql4.toString());
	    				
						ps4 = conn.prepareStatement(sql4.toString());
						int rs4 = ps4.executeUpdate();
						if (rs4>0) {
							log.info("<<==Update Success==>>");
							/*request.setAttribute("type", "update");
							request.setAttribute("alert","Report Ref No : "   +" "+EIDSeq+" "+   "Updated Successfully");*/
							status1 = "updated";
							status = "success";
							
							
						}
	    				
	    				
	    			}else{
	    				log.info("INSERT");
	    				
	    				sql3.append("INSERT INTO CRR0100_MOD_TABLE(REPORT_REF_NO,RPT_DAY,RPT_DATE,DEPOSIT_AMT_IN_MUR,DEPOSIT_DENOM_IN_EUR,DEPOSIT_DENOM_IN_GBP,DEPOSIT_DENOM_IN_USD,USD_EQUIV_OTH_FCY_DEPOSIT,REC_CODE,DEL_FLG,RCRE_USER_ID,RCRE_TIME,LCHG_USER_ID,LCHG_TIME)");
	    				
	    				sql3.append("values('"+ReporefSeq.trim()+"','"+request.getParameter("rptday")+"','"+df1.formatdate(request.getParameter("rptdate"))+"','"+request.getParameter("depamtmur").trim()+"','"+request.getParameter("depdeneur").trim()+"','"+request.getParameter("depdengbp").trim()+"','"+request.getParameter("depdenusd").trim()+"','"+request.getParameter("usdequfor")+"','"+request.getParameter("reccod")+"','"+request.getParameter("delAB")+"','"+request.getParameter("rcrusrid")+"','"+df1.formatdate(request.getParameter("rcrtme"))+"','"+request.getParameter("lchusrid")+"',current_timestamp)");  				
	    				
	    				//log.info("loginUPDAT"+sql3.toString()+username);
	    				//+"','"+EIDSeq+"',             '"+df1.formatdate(request.getParameter("rptstart"))+"','"+df1.formatdate(request.getParameter("rptend"))+"','"+request.getParameter("rptcrncy")+"','"+request.getParameter("bnkcode")+"','"+request.getParameter("modcode")+"','"+request.getParameter("modtype")
	    				log.info("Insert"+sql3.toString());
	    				
	    				ps3 = conn.prepareStatement(sql3.toString());
	    				int rs3 = ps3.executeUpdate();
	    				
	    				if (rs3 > 0) {
	    					
	    					request.setAttribute("ReporefSeq", ReporefSeq);
	    					
	    					status1="inserted";
	    					
	    					
	    					status = "success";
	    						
	    				}
	    		    		
					
					
				}
					
				}
			
			
			
			
			
			
			
			
			}else{
				
				log.info("ELSEEEE");
				
				sql.append("SELECT Count (*) as cnt FROM   (SELECT DISTINCT RPT_DATE,REC_CODE FROM  CRR0100_MOD_TABLE where REPORT_REF_NO='"+ReporefSeq.trim()+"' and RPT_DATE ='"+df.formatdate(request.getParameter("rptdate"))+"'  and DEL_FLG ='N'  and REC_CODE='"+request.getParameter("reccod")+"') ");
		
			
			
			
				log.info("select count       .... NEW===  "+sql.toString());
				ps = conn.prepareStatement(sql.toString());
				
				log.info("count test  ");
				
				ResultSet rs = ps.executeQuery();
				//log.info(rs);
				if (rs.next()) {						
					count = rs.getInt("cnt"); 
					log.info("count"+count);
					
					if (count > 0) {
						log.info("UPDATE");
						log.info("dt1--->"+request.getParameter("dt1"));
						log.info("dt2--->"+request.getParameter("dt2"));
						//log.info("reportrefno====>>>"+request.getParameter("reportrefno"));
						log.info("rptday_row--->"+request.getParameter("rptday"));
						log.info("rptdate_row--->"+request.getParameter("rptdate"));
						log.info("depamtmur_row1--->"+request.getParameter("depamtmur"));
						log.info("depdeneur_row1--->"+request.getParameter("depdeneur"));
						
						log.info("depdengbp_row--->"+request.getParameter("depdengbp"));
						log.info("depdenusd_row--->"+request.getParameter("depdenusd"));
						log.info("usdequfor_row--->"+request.getParameter("usdequfor"));
						
						
						
						log.info("reccod_row--->"+request.getParameter("reccod"));
						
						log.info("rcrusrid_row--->"+request.getParameter("rcrusrid"));
						log.info("rcrtme_row--->"+request.getParameter("rcrtme"));
						log.info("lchusrid_row--->"+request.getParameter("lchusrid"));
						log.info("lchtme_row--->"+request.getParameter("lchtme"));
						
						log.info("ReporefSeq.trim()--->"+ReporefSeq.trim());
						
						
						log.info("hiiii Ganiiiiiii");
						
	    				
	  
	  
	  sql4.append("update CRR0100_MOD_TABLE set REPORT_REF_NO ='"+ReporefSeq.trim()+"',RPT_DAY ='"+request.getParameter("rptday")+"',RPT_DATE ='"+df1.formatdate(request.getParameter("rptdate"))+"',DEPOSIT_AMT_IN_MUR ='"+request.getParameter("depamtmur").trim()+"',DEPOSIT_DENOM_IN_EUR ='"+request.getParameter("depdeneur").trim()+"',REC_CODE ='"+request.getParameter("reccod")+"',DEL_FLG ='"+request.getParameter("delAB")+"',RCRE_USER_ID ='"+request.getParameter("rcrusrid")+"',RCRE_TIME ='"+df1.formatdate(request.getParameter("rcrtme"))+"',LCHG_USER_ID ='"+request.getParameter("lchusrid")+"',LCHG_TIME =current_timestamp where REPORT_REF_NO ='"+ReporefSeq+"' and RPT_DATE ='"+df1.formatdate(request.getParameter("rptdate"))+"'  and REC_CODE='"+request.getParameter("reccod")+"'");
	  
	  
	  log.info("draszfgaDSGVDSGDFSGDFSG");
	  
	    				log.info("Update======>"+sql4.toString());
	    				
						ps4 = conn.prepareStatement(sql4.toString());
						int rs4 = ps4.executeUpdate();
						if (rs4>0) {
							log.info("<<==Update Success==>>");
							/*request.setAttribute("type", "update");
							request.setAttribute("alert","Report Ref No : "   +" "+EIDSeq+" "+   "Updated Successfully");*/
							status1 = "updated";
							status = "success";
							
							
						}
	    				
	    				
	    			}else{
	    				log.info("INSERT");
	    				
	    				
	    				
	    				sql3.append("INSERT INTO CRR0100_MOD_TABLE("
	    						+ "REPORT_REF_NO,"
	    						+ "RPT_DAY,"
	    						+ "RPT_DATE,"    						
	    						+ "DEPOSIT_AMT_IN_MUR,"
	    						+ "DEPOSIT_DENOM_IN_EUR,"	
	    						+ "DEPOSIT_DENOM_IN_GBP,"
	    						+ "DEPOSIT_DENOM_IN_USD,"
	    						+ "USD_EQUIV_OTH_FCY_DEPOSIT,"
	    						+ "REC_CODE,"
	    						+ "DEL_FLG,"
	    						+ "RCRE_USER_ID,"
	    						+ "RCRE_TIME,"
	    						+ "LCHG_USER_ID,"
	    						+ "LCHG_TIME)");
	    				
	    				sql3.append("values('"+ReporefSeq.trim()+"','"+request.getParameter("rptday")
	    				+"','"+df1.formatdate(request.getParameter("rptdate"))
	    				+"','"+request.getParameter("depamtmur").trim()
	    				+"','"+request.getParameter("depdeneur").trim()	
	    				+"','"+request.getParameter("depdengbp").trim()
	    				+"','"+request.getParameter("depdenusd")
	    				+"','"+request.getParameter("usdequfor")
	    				
	    				+"','"+request.getParameter("reccod")
	    				+"','"+request.getParameter("delAB")
	    				+"','"+request.getParameter("rcrusrid")
	    				+"','"+df1.formatdate(request.getParameter("rcrtme"))
	    				+"','"+request.getParameter("lchusrid")
	    				+"',current_timestamp) ");
	    				
	    				//log.info("loginUPDAT"+sql3.toString()+username);
	    				//+"','"+EIDSeq+"',             '"+df1.formatdate(request.getParameter("rptstart"))+"','"+df1.formatdate(request.getParameter("rptend"))+"','"+request.getParameter("rptcrncy")+"','"+request.getParameter("bnkcode")+"','"+request.getParameter("modcode")+"','"+request.getParameter("modtype")
	    				log.info("Insert"+sql3.toString());
	    				
	    				ps3 = conn.prepareStatement(sql3.toString());
	    				int rs3 = ps3.executeUpdate();
	    				
	    				if (rs3 > 0) {
	    					
	    					request.setAttribute("ReporefSeq", ReporefSeq);
	    					
	    					status1="inserted";
	    					
	    					
	    					status = "success";
	    						
	    				}
	    		    		
					
					
				}
					
				}
				}
			
			 
		}
		
		catch (SQLException e) {
			status="error";
			e.printStackTrace();
		} 
	
		/*RepID Display Header*/
		
		refnoAB=ReporefSeq;
	
		if(status.equals("success") && status1.equals("inserted")){
        	
    		
	    	//	log.info("==insert Statusss==");
	    		//String next=lmd.insertRecord(arl,AH);
				//request.setAttribute("alert", "Report Ref No : "   +" "+EIDSeq+" "+   "Inserted Successfully.");
				request.setAttribute("type", "inserted");
				request.setAttribute("dt1", request.getParameter("dt1"));
				request.setAttribute("dt2", request.getParameter("dt2"));
				request.setAttribute("ReporefSeq", ReporefSeq);
				request.setAttribute("alert", "Report Ref No : "   +" "+ReporefSeq+" "+   "Created Successfully.");
	    		
				//XBRLCRR0100Dao dmd =new XBRLCRR0100Dao();
	    		//ArrayList<XBRLCRR0100Bean> list=dmd.xbrlcrrRR(ReporefSeq);
	    		
				return "success";
			}else if(status.equals("success") && status1.equals("updated")){
			//	log.info("==update Statusss==");
	    		//String next=lmd.insertRecord(arl,AH);
				
				request.setAttribute("type", "updatedAH");
				request.setAttribute("dt1", request.getParameter("dt1"));
				request.setAttribute("dt2", request.getParameter("dt2"));
				request.setAttribute("ReporefSeq", ReporefSeq);
				
				request.setAttribute("alert", "Report Ref No : "   +" "+ReporefSeq+" "+   "Updated Successfully.");
				//request.setAttribute("type", "AsstFlow");
				return "success";
			}	else{
			
				request.setAttribute("alert", "CRR Table  not updated successfully.");
				return "error";
			}
}



}
