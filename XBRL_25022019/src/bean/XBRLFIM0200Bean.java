package bean;


/***************************************************************************************************************
*																												*
* 	* @companyName 			:	Bonfire Innovation Private Limited Chennai										*
* 	* @project 				:	Extensible Business Reporting Language (XBRL)									*
* 	* @name 				:	XBRLFIM0200Bean.java															*
* 	* @path 				:	action																			*
* 	* @author 				:	D PraveenBabu																	*
* 	* @version 				: 	1.0																				*
* 	* @functionality 		:	It contains bean class for FIM0200 Report.										*
* 	* @relatedScripts 		: 	bean.XBRLFIM0200Action.java,dao.XBRLFIM0200Dao.java 							*
* 	* @creationDate 		:																					*
* 	* @lastModifiedDate 	:																					*
* 	* @modificationHistory 	: 																					*
*																												*
 ***************************************************************************************************************/

public class XBRLFIM0200Bean {
	
	
	public String srlno;
	public String repid;
	public String fmdt;
	public String todt;
	
	public String instslno;
	public String instnam;
	public String instcd;
public String modtyp;
	
public String entryuser;
public String entrytime;
	
	public String getEntryuser() {
	return entryuser;
}
public void setEntryuser(String entryuser) {
	this.entryuser = entryuser;
}
public String getEntrytime() {
	return entrytime;
}
public void setEntrytime(String entrytime) {
	this.entrytime = entrytime;
}
	public String getModtyp() {
		return modtyp;
	}
	public void setModtyp(String modtyp) {
		this.modtyp = modtyp;
	}
	public String getInstslno() {
		return instslno;
	}
	public void setInstslno(String instslno) {
		this.instslno = instslno;
	}
	public String getInstnam() {
		return instnam;
	}
	public void setInstnam(String instnam) {
		this.instnam = instnam;
	}
	public String getInstcd() {
		return instcd;
	}
	public void setInstcd(String instcd) {
		this.instcd = instcd;
	}
	public String versnno;

	public String curr;
	
	public String repdate;
	public String instiid;
	public String tranid;
	public String instiname;
	public String insticode;
	public String purcrncy;
	public String puramt;
	public String salecrncy;
	public String saleamt;
	public String rate;
	public String valuedate;
	public String delflg;
	public String rcrusrid;
	public String rcrtime;
	public String lchgusrid;
	public String lchgtime;
	
	
	
	public String instiidd;
	public String tranidd;
	public String instinamed;
	public String insticoded;
	public String purcrncyd;
	public String puramtd;
	public String salecrncyd;
	public String saleamtd;
	public String rated;
	public String valuedated;
	
	
	
	public String getInstiidd() {
		return instiidd;
	}
	public void setInstiidd(String instiidd) {
		this.instiidd = instiidd;
	}
	public String getTranidd() {
		return tranidd;
	}
	public void setTranidd(String tranidd) {
		this.tranidd = tranidd;
	}
	public String getInstinamed() {
		return instinamed;
	}
	public void setInstinamed(String instinamed) {
		this.instinamed = instinamed;
	}
	public String getInsticoded() {
		return insticoded;
	}
	public void setInsticoded(String insticoded) {
		this.insticoded = insticoded;
	}
	public String getPurcrncyd() {
		return purcrncyd;
	}
	public void setPurcrncyd(String purcrncyd) {
		this.purcrncyd = purcrncyd;
	}
	public String getPuramtd() {
		return puramtd;
	}
	public void setPuramtd(String puramtd) {
		this.puramtd = puramtd;
	}
	public String getSalecrncyd() {
		return salecrncyd;
	}
	public void setSalecrncyd(String salecrncyd) {
		this.salecrncyd = salecrncyd;
	}
	public String getSaleamtd() {
		return saleamtd;
	}
	public void setSaleamtd(String saleamtd) {
		this.saleamtd = saleamtd;
	}
	public String getRated() {
		return rated;
	}
	public void setRated(String rated) {
		this.rated = rated;
	}
	public String getValuedated() {
		return valuedated;
	}
	public void setValuedated(String valuedated) {
		this.valuedated = valuedated;
	}
	public String getCurr() {
		return curr;
	}
	public void setCurr(String curr) {
		this.curr = curr;
	}



	
	public String getFmdt() {
		return fmdt;
	}
	public void setFmdt(String fmdt) {
		this.fmdt = fmdt;
	}
	public String getTodt() {
		return todt;
	}
	public void setTodt(String todt) {
		this.todt = todt;
	}
	public String getVersnno() {
		return versnno;
	}
	public void setVersnno(String versnno) {
		this.versnno = versnno;
	}
	public String getRepid() {
		return repid;
	}
	public void setRepid(String repid) {
		this.repid = repid;
	}
	
	public String getSrlno() {
		return srlno;
	}
	public void setSrlno(String srlno) {
		this.srlno = srlno;
	}
	
	public String getRepdate() {
		return repdate;
	}
	public void setRepdate(String repdate) {
		this.repdate = repdate;
	}
	public String getInstiid() {
		return instiid;
	}
	public void setInstiid(String instiid) {
		this.instiid = instiid;
	}
	public String getTranid() {
		return tranid;
	}
	public void setTranid(String tranid) {
		this.tranid = tranid;
	}
	public String getInstiname() {
		return instiname;
	}
	public void setInstiname(String instiname) {
		this.instiname = instiname;
	}
	public String getInsticode() {
		return insticode;
	}
	public void setInsticode(String insticode) {
		this.insticode = insticode;
	}
	public String getPurcrncy() {
		return purcrncy;
	}
	public void setPurcrncy(String purcrncy) {
		this.purcrncy = purcrncy;
	}
	public String getPuramt() {
		return puramt;
	}
	public void setPuramt(String puramt) {
		this.puramt = puramt;
	}
	public String getSalecrncy() {
		return salecrncy;
	}
	public void setSalecrncy(String salecrncy) {
		this.salecrncy = salecrncy;
	}
	public String getSaleamt() {
		return saleamt;
	}
	public void setSaleamt(String saleamt) {
		this.saleamt = saleamt;
	}
	public String getRate() {
		return rate;
	}
	public void setRate(String rate) {
		this.rate = rate;
	}
	public String getValuedate() {
		return valuedate;
	}
	public void setValuedate(String valuedate) {
		this.valuedate = valuedate;
	}
	public String getDelflg() {
		return delflg;
	}
	public void setDelflg(String delflg) {
		this.delflg = delflg;
	}
	public String getRcrusrid() {
		return rcrusrid;
	}
	public void setRcrusrid(String rcrusrid) {
		this.rcrusrid = rcrusrid;
	}
	public String getRcrtime() {
		return rcrtime;
	}
	public void setRcrtime(String rcrtime) {
		this.rcrtime = rcrtime;
	}
	public String getLchgusrid() {
		return lchgusrid;
	}
	public void setLchgusrid(String lchgusrid) {
		this.lchgusrid = lchgusrid;
	}
	public String getLchgtime() {
		return lchgtime;
	}
	public void setLchgtime(String lchgtime) {
		this.lchgtime = lchgtime;
	}
	
	
	
	
	
	
}