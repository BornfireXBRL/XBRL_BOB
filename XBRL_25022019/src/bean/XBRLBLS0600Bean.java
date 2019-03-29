package bean;

/***************************************************************************************************************
*																												*
* 	* @companyName 			:	Bonfire Innovation Private Limited Chennai										*
* 	* @project 				:	Extensible Business Reporting Language (XBRL)									*
* 	* @name 				:	XBRLBLS0600Bean.java															*
* 	* @path 				:	action																			*
* 	* @author 				:	D PraveenBabu																	*
* 	* @version 				: 	1.0																				*
* 	* @functionality 		:	It contains bean class for BLS0600 Report.										*
* 	* @relatedScripts 		: 	bean.XBRLPYM0100Action.java,dao.XBRLBLS0600Dao.java 							*
* 	* @creationDate 		:																					*
* 	* @lastModifiedDate 	:																					*
* 	* @modificationHistory 	: 																					*
*																												*
 ***************************************************************************************************************/

public class XBRLBLS0600Bean {
	
	public String modtyp;
	public String entryuser;

	
public String getModtyp() {
		return modtyp;
	}
	public void setModtyp(String modtyp) {
		this.modtyp = modtyp;
	}
	public String getEntryuser() {
		return entryuser;
	}
	public void setEntryuser(String entryuser) {
		this.entryuser = entryuser;
	}
public String instname;
public String instcode;
	public String getInstname() {
	return instname;
}
public void setInstname(String instname) {
	this.instname = instname;
}
public String getInstcode() {
	return instcode;
}
public void setInstcode(String instcode) {
	this.instcode = instcode;
}
	public String min;
	public String max;
	public String weightedavg;
	public String overalmin;
	public String overalmax;
	public String overalwgtedavg;
	
	public String accountnumber;
	public String accountname;
	public String accntopndate;
	
	public String getAccntopndate() {
		return accntopndate;
	}
	public void setAccntopndate(String accntopndate) {
		this.accntopndate = accntopndate;
	}
	public String schemetype;
	public String interestperioddays;
	public String reportdate;
	
	public String getMin() {
		return min;
	}
	public void setMin(String min) {
		this.min = min;
	}
	public String getMax() {
		return max;
	}
	public void setMax(String max) {
		this.max = max;
	}
	public String getWeightedavg() {
		return weightedavg;
	}
	public void setWeightedavg(String weightedavg) {
		this.weightedavg = weightedavg;
	}
	public String getOveralmin() {
		return overalmin;
	}
	public void setOveralmin(String overalmin) {
		this.overalmin = overalmin;
	}
	public String getOveralmax() {
		return overalmax;
	}
	public void setOveralmax(String overalmax) {
		this.overalmax = overalmax;
	}
	public String getOveralwgtedavg() {
		return overalwgtedavg;
	}
	public void setOveralwgtedavg(String overalwgtedavg) {
		this.overalwgtedavg = overalwgtedavg;
	}
	
	
	public String getAccountnumber() {
		return accountnumber;
	}
	public void setAccountnumber(String accountnumber) {
		this.accountnumber = accountnumber;
	}
	public String getAccountname() {
		return accountname;
	}
	public void setAccountname(String accountname) {
		this.accountname = accountname;
	}
	public String getSchemetype() {
		return schemetype;
	}
	public void setSchemetype(String schemetype) {
		this.schemetype = schemetype;
	}
	public String getInterestperioddays() {
		return interestperioddays;
	}
	public void setInterestperioddays(String interestperioddays) {
		this.interestperioddays = interestperioddays;
	}
	public String getReportdate() {
		return reportdate;
	}
	public void setReportdate(String reportdate) {
		this.reportdate = reportdate;
	}
	
}