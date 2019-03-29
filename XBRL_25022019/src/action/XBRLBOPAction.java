package action;

import java.sql.Connection;
import org.apache.log4j.Logger;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;

import basecode.DateFormat;
import bean.XBRLBOPBean;
import dao.XBRLBOPDao;
import utilities.ConnectionManager;

/**
 * @companyName : Bonfire Innovation Private Limited Chennai
 * @project : Extensible Business Reporting Language (XBRL)
 * @name : XBRLBOPAction.java
 * @path : action
 * @author : D PraveenBabu
 * @version : 1.0
 * @functionality : It contains the action with multiple methods to create
 *                BOP0300 Reports.
 * @relatedScripts : bean.XBRLBOPBean.java,dao.XBRLBOPDao.java *
 * @creationDate : 23rd Nov 2017
 * @lastModifiedDate : 10th Jan 2018
 * @modificationHistory : Added header
 * @DateUser: Change Description
 * @remarks : None
 * @DateUser: Change Description
 */

public class XBRLBOPAction {
	
	static Logger log = Logger.getLogger(XBRLBOPAction.class);

	private String BOPFilter;
	private String bopdetails[];
	private String val;
	private String hnames[];
	private String xdata;
	public String domdetails;
	public String dom;

	private String dome;
	private String frmDate;
	private String toDate;
	private String detailsdata[];

	XBRLBOPBean xb;

	private String daa_val[];
	private String wair_val[];
	private String iiie_val[];
	private String srl_val[];

	private String name;

	private String accno;

	private String accprod;

	public String getDome() {
		return dome;
	}

	public void setDome(String dome) {
		this.dome = dome;
	}

	public String getBOPFilter() {
		return BOPFilter;
	}

	public void setBOPFilter(String bOPFilter) {
		BOPFilter = bOPFilter;
	}

	public String[] getBopdetails() {
		return bopdetails;
	}

	public void setBopdetails(String[] bopdetails) {
		this.bopdetails = bopdetails;
	}

	public String getVal() {
		return val;
	}

	public void setVal(String val) {
		this.val = val;
	}

	public String[] getHnames() {
		return hnames;
	}

	public void setHnames(String[] hnames) {
		this.hnames = hnames;
	}

	public String getXdata() {
		return xdata;
	}

	public void setXdata(String xdata) {
		this.xdata = xdata;
	}

	public String getDomdetails() {
		return domdetails;
	}

	public void setDomdetails(String domdetails) {
		this.domdetails = domdetails;
	}

	public String getDom() {
		return dom;
	}

	public void setDom(String dom) {
		this.dom = dom;
	}

	public String getFrmDate() {
		return frmDate;
	}

	public void setFrmDate(String frmDate) {
		this.frmDate = frmDate;
	}

	public String getToDate() {
		return toDate;
	}

	public void setToDate(String toDate) {
		this.toDate = toDate;
	}

	public String[] getDetailsdata() {
		return detailsdata;
	}

	public void setDetailsdata(String[] detailsdata) {
		this.detailsdata = detailsdata;
	}

	public XBRLBOPBean getXb() {
		return xb;
	}

	public void setXb(XBRLBOPBean xb) {
		this.xb = xb;
	}

	public String[] getDaa_val() {
		return daa_val;
	}

	public void setDaa_val(String[] daa_val) {
		this.daa_val = daa_val;
	}

	public String[] getWair_val() {
		return wair_val;
	}

	public void setWair_val(String[] wair_val) {
		this.wair_val = wair_val;
	}

	public String[] getIiie_val() {
		return iiie_val;
	}

	public void setIiie_val(String[] iiie_val) {
		this.iiie_val = iiie_val;
	}

	public String[] getSrl_val() {
		return srl_val;
	}

	public void setSrl_val(String[] srl_val) {
		this.srl_val = srl_val;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAccno() {
		return accno;
	}

	public void setAccno(String accno) {
		this.accno = accno;
	}

	public String getAccprod() {
		return accprod;
	}

	public void setAccprod(String accprod) {
		this.accprod = accprod;
	}

	public String modXbCreate() throws SQLException {

		System.out.println("modXb");

		String status = "";
		String status1 = "";
		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();

		HttpSession session = request.getSession();

		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		System.out.println("insert");
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;

		StringBuffer sql2 = new StringBuffer();
		PreparedStatement ps3 = null;

		StringBuffer sql3 = new StringBuffer();

		DateFormat df1 = new DateFormat();

		int count = 0;

		StringBuffer sql = new StringBuffer();

		System.out.println("insert Action");

		utilities.SequenceNumber seqNo = new utilities.SequenceNumber();
		String seqno = seqNo.entityrecordno();

		// System.out.println(" seqno := " + seqno);

		String EIDSeq = "EID000" + seqno;

		// System.out.println("<< EIDSeq >> " + EIDSeq);
		session.setAttribute("EIDSeq", EIDSeq);

		sql3.append(
				"INSERT INTO BOP0300_MOD_TBL (SRL_NO,NAME_OF_CUST,CIF_ID,ACCT_NUM,ACCT_PRODUCTS,ACCT_OPN_DATE,ACCT_CRNCY,ACCT_BAL,RATE_OF_INT,DAILY_AVG_AMT,WEIGHT_AVG_INT_RATE,INT_INC_EXP,REPORT_REF_NO,RPT_START_DATE,RPT_END_DATE,RPT_CRNCY,BANK_CODE,MOD_TYPE,MOD_CODE)");
		sql3.append("values('" + request.getParameter("srl") + "','" + request.getParameter("name") + "','"
				+ request.getParameter("cif") + "','" + request.getParameter("accno") + "','"
				+ request.getParameter("accsch") + "','" + df1.formatdate(request.getParameter("datopn")) + "','"
				+ request.getParameter("curr") + "','" + request.getParameter("amt") + "','"
				+ request.getParameter("roi") + "','" + request.getParameter("daa") + "','"
				+ request.getParameter("wair") + "','" + request.getParameter("iiie") + "','" + EIDSeq + "','"
				+ df1.formatdate(request.getParameter("rptstart")) + "','"
				+ df1.formatdate(request.getParameter("rptend")) + "','" + request.getParameter("rptcrncy") + "','"
				+ request.getParameter("bnkcode") + "','" + request.getParameter("modcode") + "','"
				+ request.getParameter("modtype") + "') ");
		// System.out.println("loginUPDAT"+sql3.toString()+username);

		// System.out.println("Insert"+sql3.toString());

		ps3 = conn.prepareStatement(sql3.toString());
		int rs3 = ps3.executeUpdate();
		if (rs3 > 0) {

			request.setAttribute("eid", EIDSeq);

			status1 = "inserted";

			status = "success";

		}

		if (status.equals("success") && status1.equals("inserted")) {

			request.setAttribute("type", "inserted");

			request.setAttribute("eid", EIDSeq);
			request.setAttribute("alert", "Report Ref No : " + " " + EIDSeq + " " + "Created Successfully.");
			// XBRLBOPDao dmd =new XBRLBOPDao();
			// ArrayList<XBRLBOPBean> list=dmd.xbrlEID(EIDSeq);

			return "success";
		} else if (status.equals("success") && status1.equals("updated")) {

			request.setAttribute("alert", "Report Ref No : " + " " + EIDSeq + " " + "Updated Successfully.");

			return "success";
		} else {

			request.setAttribute("alert", "BOP Table  not updated successfully.");
			return "error";
		}

	}

	/******************* Modify data to modtable ***************/

	public String modXb() {

 System.out.println("modXb");

		String status = "";
		String status1 = "";
		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();

		HttpSession session = request.getSession();

		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		System.out.println("insert");
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;

		StringBuffer sql2 = new StringBuffer();
		PreparedStatement ps3 = null;

		StringBuffer sql3 = new StringBuffer();

		DateFormat df1 = new DateFormat();

		int count = 0;

		StringBuffer sql = new StringBuffer();

		System.out.println("insert Action");

		utilities.SequenceNumber seqNo = new utilities.SequenceNumber();
		String seqno = seqNo.entityrecordno();

		System.out.println(" seqno  :=   " + seqno);

		String EIDSeq = "EID000" + seqno;

		System.out.println("<< EIDSeq >> " + EIDSeq);
		session.setAttribute("EIDSeq", EIDSeq);

		try {

			sql.append("SELECT count(ACCT_NUM) as cnt from BOP0300_MOD_TBL where ACCT_NUM='"
					+ request.getParameter("accno") + "' ");

			
			System.out.println("select---ACCNUM---MODI" + sql.toString());
			ps = conn.prepareStatement(sql.toString());

			System.out.println("insert4");

			ResultSet rs = ps.executeQuery();
			// System.out.println(rs);
			if (rs.next()) {
				count = rs.getInt("cnt");
				System.out.println("count" + count);

				if (count > 0) {
					System.out.println("UPDATE");

					sql2.append("update BOP0300_MOD_TBL set SRL_NO ='" + request.getParameter("srl")
							+ "',NAME_OF_CUST ='" + request.getParameter("name") + "',CIF_ID ='"
							+ request.getParameter("cif") + "',ACCT_NUM ='" + request.getParameter("accno")
							+ "',ACCT_PRODUCTS ='" + request.getParameter("accsch") + "',ACCT_OPN_DATE ='"
							+ df1.formatdate(request.getParameter("datopn")) + "',ACCT_CRNCY ='"
							+ request.getParameter("curr") + "',ACCT_BAL ='" + request.getParameter("amt")
							+ "',RATE_OF_INT ='" + request.getParameter("roi") + "',DAILY_AVG_AMT ='"
							+ request.getParameter("daa") + "',WEIGHT_AVG_INT_RATE ='" + request.getParameter("wair")
							+ "',INT_INC_EXP ='" + request.getParameter("iiie") + "'   where ACCT_NUM='"
							+ request.getParameter("accno") + "'  ");

					System.out.println("Update" + sql2.toString());

					ps2 = conn.prepareStatement(sql2.toString());
					int rs2 = ps2.executeUpdate();
					if (rs2 > 0) {
						System.out.println("<<==Update Success==>>");

						status1 = "updated";
						status = "success";

					}

				} else {
					System.out.println("INSERT");

					sql3.append(
							"INSERT INTO BOP0300_MOD_TBL (REPORT_REF_NO,REPORT_DATE,ACCT_NUMBER,ACCT_NAME,CUST_ID,SCHM_TYPE,NRE_FLG,INT_RATE,ACCT_CRNCY_CODE,BALANCE_AMT,ASSET_LIAB_NR_FLG,INTEREST_AMOUNT_QTR,DEL_FLG,LCHG_USER_ID,LCHG_TIME)");
					sql3.append("values('" + request.getParameter("srl") + "','" + request.getParameter("name") + "','"
							+ request.getParameter("cif") + "','" + request.getParameter("accno") + "','"
							+ request.getParameter("accsch") + "','" + df1.formatdate(request.getParameter("datopn"))
							+ "','" + request.getParameter("curr") + "','" + request.getParameter("amt") + "','"
							+ request.getParameter("roi") + "','" + request.getParameter("daa") + "','"
							+ request.getParameter("wair") + "','" + request.getParameter("iiie") + "','" + EIDSeq
							+ "') ");
					// System.out.println("loginUPDAT"+sql3.toString()+username);

					System.out.println("Insert" + sql3.toString());

					ps3 = conn.prepareStatement(sql3.toString());
					int rs3 = ps3.executeUpdate();
					if (rs3 > 0) {
						System.out.println("<<==Insert Success==>>");
						request.setAttribute("eid", EIDSeq);
						System.out.println("haiii");
						status1 = "inserted";

						status = "success";

					}

				}

			}

		}

		catch (SQLException e) {
			status = "error";
			e.printStackTrace();
		}

		if (status.equals("success") && status1.equals("inserted")) {

			System.out.println("==insert Statusss==");
			request.setAttribute("type", "inserted");

			request.setAttribute("eid", EIDSeq);
			request.setAttribute("alert", "Report Ref No : " + " " + EIDSeq + " " + "Created Successfully.");
			// XBRLBOPDao dmd =new XBRLBOPDao();
			// ArrayList<XBRLBOPBean> list=dmd.xbrlEID(EIDSeq);

			return "success";
		} else if (status.equals("success") && status1.equals("updated")) {
			System.out.println("==update Statusss==");
			request.setAttribute("alert", "Report Ref No : " + " " + EIDSeq + " " + "Updated Successfully.");
			return "success";
		} else {

			request.setAttribute("alert", "BOP Table  not updated successfully.");
			return "error";
		}

	}

	/************************
	 * More than one records joined in one Report Ref No
	 *******************************/

	public String modXb1() {

		System.out.println("modXb");

		String status = "";
		String status1 = "";
		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();

		HttpSession session = request.getSession();
		System.out.println("SRLL--->" + request.getParameter("srl"));
		System.out.println("NAME--->" + request.getParameter("name"));
		System.out.println("CIF--->" + request.getParameter("cif"));
		System.out.println("ACCNO--->" + request.getParameter("accno"));
		System.out.println("DATOPN--->" + request.getParameter("datopn"));
		System.out.println("CURR--->" + request.getParameter("curr"));
		System.out.println("AMT--->" + request.getParameter("amt"));
		System.out.println("ROI--->" + request.getParameter("roi"));
		System.out.println("DAA--->" + request.getParameter("daa"));
		System.out.println("WAIR--->" + request.getParameter("wair"));
		System.out.println("IIIE--->" + request.getParameter("iiie"));
		System.out.println("accsch--->" + request.getParameter("accsch"));
		System.out.println("frmDate--->" + request.getParameter("frmDate"));
		System.out.println("toDate--->" + request.getParameter("toDate"));

		System.out.println("@@@@@@@--->" + df.formatdate(request.getParameter("rptstart")));
		System.out.println("!!!!!!!!!--->" + df.formatdate(request.getParameter("rptend")));
		System.out.println("#######--->" + request.getParameter("bnkcode"));
		System.out.println("$$$$$$$$--->" + request.getParameter("modcode"));
		System.out.println("%%%%%%%--->" + request.getParameter("toDate"));
		System.out.println("^^^^^^^--->" + request.getParameter("modtype"));

		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		System.out.println("insert");
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;

		StringBuffer sql2 = new StringBuffer();
		PreparedStatement ps3 = null;

		StringBuffer sql3 = new StringBuffer();

		DateFormat df1 = new DateFormat();
		// String passexpdate=df.formatdate(xb.getAccopendate());

		// int rs=0;

		int count = 0;

		StringBuffer sql = new StringBuffer();
		
		System.out.println("insert Action");

		try {

			sql.append("SELECT count(ACCT_NUM) as cnt from BOP0300_MOD_TBL where REPORT_REF_NO='"
					+ request.getParameter("eid") + "' and ACCT_NUM='" + request.getParameter("accno") + "' ");

			// sql.append("INSERT INTO
			// BAM_ASSET_FLOWS(DAILY_AVG_AMT,WEIGHT_AVG_INT_RATE,INT_INC_EXP) VALUES
			// ('"+daa_val[i]+"','"+wair_val[i]+"','"+iiie_val[i]+"')");
			System.out.println("select---ACCNUM---MODI" + sql.toString());
			ps = conn.prepareStatement(sql.toString());

			System.out.println("insert4");

			ResultSet rs = ps.executeQuery();
			// System.out.println(rs);
			if (rs.next()) {
				count = rs.getInt("cnt");
				System.out.println("count" + count);

				if (count > 0) {
					System.out.println("UPDATE");

					sql2.append("update BOP0300_MOD_TBL set REPORT_REF_NO ='" + request.getParameter("eid")
							+ "',SRL_NO ='" + request.getParameter("srl") + "',NAME_OF_CUST ='"
							+ request.getParameter("name") + "',CIF_ID ='" + request.getParameter("cif")
							+ "',ACCT_NUM ='" + request.getParameter("accno") + "',ACCT_PRODUCTS ='"
							+ request.getParameter("accsch") + "',ACCT_OPN_DATE ='"
							+ df1.formatdate(request.getParameter("datopn")) + "',ACCT_CRNCY ='"
							+ request.getParameter("curr") + "',ACCT_BAL ='" + request.getParameter("amt")
							+ "',RATE_OF_INT ='" + request.getParameter("roi") + "',DAILY_AVG_AMT ='"
							+ request.getParameter("daa") + "',WEIGHT_AVG_INT_RATE ='" + request.getParameter("wair")
							+ "',INT_INC_EXP ='" + request.getParameter("iiie") + "'   where ACCT_NUM='"
							+ request.getParameter("accno") + "'  ");

					System.out.println("Update" + sql2.toString());

					ps2 = conn.prepareStatement(sql2.toString());
					int rs2 = ps2.executeUpdate();
					if (rs2 > 0) {
						System.out.println("<<==Update Success==>>");
						/*
						 * request.setAttribute("type", "update");
						 * request.setAttribute("alert","Report Ref No : " +" "+EIDSeq+" "+
						 * "Updated Successfully");
						 */
						status1 = "updated";
						status = "success";

					}

				} else {
					System.out.println("INSERT");

					sql3.append(
							"INSERT INTO BOP0300_MOD_TBL (SRL_NO,NAME_OF_CUST,CIF_ID,ACCT_NUM,ACCT_PRODUCTS,ACCT_OPN_DATE,ACCT_CRNCY,ACCT_BAL,RATE_OF_INT,DAILY_AVG_AMT,WEIGHT_AVG_INT_RATE,INT_INC_EXP,REPORT_REF_NO,RPT_START_DATE,RPT_END_DATE,RPT_CRNCY,BANK_CODE,MOD_TYPE,MOD_CODE)");
					sql3.append("values('" + request.getParameter("srl") + "','" + request.getParameter("name") + "','"
							+ request.getParameter("cif") + "','" + request.getParameter("accno") + "','"
							+ request.getParameter("accsch") + "','" + df1.formatdate(request.getParameter("datopn"))
							+ "','" + request.getParameter("curr") + "','" + request.getParameter("amt") + "','"
							+ request.getParameter("roi") + "','" + request.getParameter("daa") + "','"
							+ request.getParameter("wair") + "','" + request.getParameter("iiie") + "','"
							+ request.getParameter("eid") + "','" + df1.formatdate(request.getParameter("rptstart"))
							+ "','" + df1.formatdate(request.getParameter("rptend")) + "','"
							+ request.getParameter("rptcrncy") + "','" + request.getParameter("bnkcode") + "','"
							+ request.getParameter("modcode") + "','" + request.getParameter("modtype") + "') ");
					// System.out.println("loginUPDAT"+sql3.toString()+username);

					System.out.println("Insert" + sql3.toString());

					ps3 = conn.prepareStatement(sql3.toString());
					int rs3 = ps3.executeUpdate();
					if (rs3 > 0) {
						System.out.println("<<==Insert Success==>>");
						request.setAttribute("eid", request.getParameter("eid"));
						System.out.println("haiii");
						status1 = "inserted";

						status = "success";

					}

				}

			}

		}

		catch (SQLException e) {
			status = "error";
			e.printStackTrace();
		}

		if (status.equals("success") && status1.equals("inserted")) {

			System.out.println("==insert Statusss==");
			// String next=lmd.insertRecord(arl,af);
			// request.setAttribute("alert", "Report Ref No : " +" "+EIDSeq+" "+ "Inserted
			// Successfully.");
			request.setAttribute("type", "inserted1");

			request.setAttribute("eid", request.getParameter("eid"));
			request.setAttribute("alert",
					"Report Ref No : " + " " + request.getParameter("eid") + " " + "Created Successfully.");
			// XBRLBOPDao dmd =new XBRLBOPDao();
			// ArrayList<XBRLBOPBean> list=dmd.xbrlEID(request.getParameter("eid"));

			return "success";
		} else if (status.equals("success") && status1.equals("updated")) {
			System.out.println("==update Statusss==");

			request.setAttribute("type", "updated");
			request.setAttribute("eid", request.getParameter("eid"));
			// String next=lmd.insertRecord(arl,af);
			request.setAttribute("alert",
					"Report Ref No : " + " " + request.getParameter("eid") + " " + "Updated Successfully.");
			// request.setAttribute("type", "AsstFlow");
			return "success";
		} else {

			request.setAttribute("alert", "BOP Table  not updated successfully.");
			return "error";
		}

	}

	public String modXbEdit() {

		System.out.println("Edit Report Ref No =============================>");

		String status = "";
		String status1 = "";
		HttpServletRequest request = ServletActionContext.getRequest();
		DateFormat df = new DateFormat();

		HttpSession session = request.getSession();
		/*
		 * System.out.println("SRLL--->"+request.getParameter("srl"));
		 * System.out.println("NAME--->"+request.getParameter("name"));
		 * System.out.println("CIF--->"+request.getParameter("cif"));
		 * System.out.println("ACCNO--->"+request.getParameter("accno"));
		 * System.out.println("DATOPN--->"+request.getParameter("datopn"));
		 * System.out.println("CURR--->"+request.getParameter("curr"));
		 * System.out.println("AMT--->"+request.getParameter("amt"));
		 * System.out.println("ROI--->"+request.getParameter("roi"));
		 * System.out.println("DAA--->"+request.getParameter("daa"));
		 * System.out.println("WAIR--->"+request.getParameter("wair"));
		 * System.out.println("IIIE--->"+request.getParameter("iiie"));
		 * System.out.println("accsch--->"+request.getParameter("accsch"));
		 * System.out.println("frmDate--->"+request.getParameter("frmDate"));
		 * System.out.println("toDate--->"+request.getParameter("toDate"));
		 */

		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		System.out.println("insert");
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;

		StringBuffer sql2 = new StringBuffer();
		PreparedStatement ps3 = null;

		StringBuffer sql3 = new StringBuffer();

		DateFormat df1 = new DateFormat();
		// String passexpdate=df.formatdate(xb.getAccopendate());

		// int rs=0;

		int count = 0;

		StringBuffer sql = new StringBuffer();
		// HttpSession session = request.getSession();
		System.out.println("insert Action");

		try {

			sql.append("SELECT count(ACCT_NUM) as cnt from BOP0300_MOD_TBL where REPORT_REF_NO='"
					+ request.getParameter("eid") + "' and ACCT_NUM='" + request.getParameter("accno") + "' ");

			// sql.append("INSERT INTO
			// BAM_ASSET_FLOWS(DAILY_AVG_AMT,WEIGHT_AVG_INT_RATE,INT_INC_EXP) VALUES
			// ('"+daa_val[i]+"','"+wair_val[i]+"','"+iiie_val[i]+"')");
			System.out.println("select---ACCNUM---MODI" + sql.toString());
			ps = conn.prepareStatement(sql.toString());

			System.out.println("insert4");

			ResultSet rs = ps.executeQuery();
			// System.out.println(rs);
			if (rs.next()) {
				count = rs.getInt("cnt");
				System.out.println("count" + count);

				if (count > 0) {
					System.out.println("UPDATE");

					sql2.append("update BOP0300_MOD_TBL set REPORT_REF_NO ='" + request.getParameter("eid")
							+ "',SRL_NO ='" + request.getParameter("srl") + "',NAME_OF_CUST ='"
							+ request.getParameter("name") + "',CIF_ID ='" + request.getParameter("cif")
							+ "',ACCT_NUM ='" + request.getParameter("accno") + "',ACCT_PRODUCTS ='"
							+ request.getParameter("accsch") + "',ACCT_OPN_DATE ='"
							+ df1.formatdate(request.getParameter("datopn")) + "',ACCT_CRNCY ='"
							+ request.getParameter("curr") + "',ACCT_BAL ='" + request.getParameter("amt")
							+ "',RATE_OF_INT ='" + request.getParameter("roi") + "',DAILY_AVG_AMT ='"
							+ request.getParameter("daa") + "',WEIGHT_AVG_INT_RATE ='" + request.getParameter("wair")
							+ "',INT_INC_EXP ='" + request.getParameter("iiie") + "'   where ACCT_NUM='"
							+ request.getParameter("accno") + "'  ");

					System.out.println("Update" + sql2.toString());

					ps2 = conn.prepareStatement(sql2.toString());
					int rs2 = ps2.executeUpdate();
					if (rs2 > 0) {
						System.out.println("<<==Update Success==>>");
						/*
						 * request.setAttribute("type", "update");
						 * request.setAttribute("alert","Report Ref No : " +" "+EIDSeq+" "+
						 * "Updated Successfully");
						 */
						status1 = "updated";
						status = "success";

						// SMS sms=new SMS();
						// String sc=sms.sms(" User " +"
						// "+session.getAttribute("userName")+"{"+empname+"}"+" "+ "Successfully Logged
						// in"+" "+session.getAttribute("logintime"),"9884298802");

					}

				} else {
					System.out.println("INSERT");

					sql3.append(
							"INSERT INTO BOP0300_MOD_TBL (SRL_NO,NAME_OF_CUST,CIF_ID,ACCT_NUM,ACCT_PRODUCTS,ACCT_OPN_DATE,ACCT_CRNCY,ACCT_BAL,RATE_OF_INT,DAILY_AVG_AMT,WEIGHT_AVG_INT_RATE,INT_INC_EXP,REPORT_REF_NO,RPT_START_DATE,RPT_END_DATE,RPT_CRNCY,BANK_CODE,MOD_TYPE,MOD_CODE)");
					sql3.append("values('" + request.getParameter("srl") + "','" + request.getParameter("name") + "','"
							+ request.getParameter("cif") + "','" + request.getParameter("accno") + "','"
							+ request.getParameter("accsch") + "','" + df1.formatdate(request.getParameter("datopn"))
							+ "','" + request.getParameter("curr") + "','" + request.getParameter("amt") + "','"
							+ request.getParameter("roi") + "','" + request.getParameter("daa") + "','"
							+ request.getParameter("wair") + "','" + request.getParameter("iiie") + "','"
							+ request.getParameter("eid") + "','" + df1.formatdate(request.getParameter("rptstart"))
							+ "','" + df1.formatdate(request.getParameter("rptend")) + "','"
							+ request.getParameter("rptcrncy") + "','" + request.getParameter("bnkcode") + "','"
							+ request.getParameter("modcode") + "','" + request.getParameter("modtype") + "') ");
					// System.out.println("loginUPDAT"+sql3.toString()+username);

					System.out.println("Insert" + sql3.toString());

					ps3 = conn.prepareStatement(sql3.toString());
					int rs3 = ps3.executeUpdate();
					if (rs3 > 0) {
						System.out.println("<<==Insert Success==>>");
						/*
						 * request.setAttribute("type", "insert");
						 * request.setAttribute("alert","Report Ref No : " +" "+EIDSeq+" "+
						 * "Inserted Successfully");
						 */
						request.setAttribute("eid", request.getParameter("eid"));
						System.out.println("haiii");
						status1 = "inserted";

						status = "success";

					}

				}

			}

		}

		catch (SQLException e) {
			status = "error";
			e.printStackTrace();
		}

		if (status.equals("success") && status1.equals("inserted")) {

			System.out.println("==insert Statusss==");
			// String next=lmd.insertRecord(arl,af);
			// request.setAttribute("alert", "Report Ref No : " +" "+EIDSeq+" "+ "Inserted
			// Successfully.");
			request.setAttribute("type", "inserted");

			request.setAttribute("eid", request.getParameter("eid"));
			request.setAttribute("alert",
					"Report Ref No : " + " " + request.getParameter("eid") + " " + "Created Successfully.");
			// XBRLBOPDao dmd =new XBRLBOPDao();
			// ArrayList<XBRLBOPBean> list=dmd.xbrlEntityId(request.getParameter("eid"));
			// ArrayList<XBRLBOPBean> list=dmd.xbrlEID(request.getParameter("eid"));
			return "success";
		} else if (status.equals("success") && status1.equals("updated")) {
			System.out.println("==update Statusss==");
			// String next=lmd.insertRecord(arl,af);
			request.setAttribute("eid", request.getParameter("eid"));
			request.setAttribute("alert",
					"Report Ref No : " + " " + request.getParameter("eid") + " " + "Updated Successfully.");
			// request.setAttribute("type", "AsstFlow");
			return "success";
		} else {

			request.setAttribute("alert", "BOP Table  not updated successfully.");
			return "error";
		}

	}

	/**********************************
	 * summary to details for domestic Currency
	 *****************************/

	public String DominqDetails() {

		HttpServletRequest request = ServletActionContext.getRequest();

		XBRLBOPDao tld = new XBRLBOPDao();
		// ArrayList<XBRLBOPBean>
		// arl=tld.Listdetails(request.getParameter("dome"),request.getParameter("dome1"),request.getParameter("dome2"),request.getParameter("eid"));
		Gson gson = new Gson();
		// domdetails =gson.toJson(arl);

		return "success";

	}

}
