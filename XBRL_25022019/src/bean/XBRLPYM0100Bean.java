package bean;

/***************************************************************************************************************
*																												*
* 	* @companyName 			:	Bonfire Innovation Private Limited Chennai										*
* 	* @project 				:	Extensible Business Reporting Language (XBRL)									*
* 	* @name 				:	XBRLPYM0100Bean.java															*
* 	* @path 				:	action																			*
* 	* @author 				:	D PraveenBabu																	*
* 	* @version 				: 	1.0																				*
* 	* @functionality 		:	It contains bean class for PYM0100 Report.										*
* 	* @relatedScripts 		: 	bean.XBRLPYM0100Action.java,dao.XBRLPYM0100Dao.java 							*
* 	* @creationDate 		:																					*
* 	* @lastModifiedDate 	:																					*
* 	* @modificationHistory 	: 																					*
*																												*
 ***************************************************************************************************************/

public class XBRLPYM0100Bean {
	
	

	public String modes;
	public String ChequeAlpha;

	public String chequeNumber;
	public String accountNumber;

	public String accountName;
	public String transactionDate;

	public String valueDate;
	public String chequeAmount;

	public String currency;
	
	public String delflg;
	public String rcrusrid;
	public String rcrtime;
	public String lchgusrid;
	public String lchgtime;
	
	
	
	
	
	public String modesum1;	
	public String noofitems1;	
	public String amt1;
	
	public String modesum2;	
	public String noofitems2;	
	public String amt2;
	
	public String modesum3;	
	public String noofitems3;	
	public String amt3;
	
	public String reprefno;
	
	
	public String getReprefno() {
		return reprefno;
	}
	public void setReprefno(String reprefno) {
		this.reprefno = reprefno;
	}
	public String modez1;
	public String noofitemsz1;
	public String amtz1;
	
	public String modez2;
	public String noofitemsz2;
	public String amtz2;
	
	public String modez3;
	public String noofitemsz3;
	public String amtz3;
	
	public String repdate;
	
	public String getRepdate() {
		return repdate;
	}
	public void setRepdate(String repdate) {
		this.repdate = repdate;
	}
	public String getModes() {
		return modes;
	}
	public void setModes(String modes) {
		this.modes = modes;
	}
	public String getChequeAlpha() {
		return ChequeAlpha;
	}
	public void setChequeAlpha(String chequeAlpha) {
		ChequeAlpha = chequeAlpha;
	}
	public String getChequeNumber() {
		return chequeNumber;
	}
	public void setChequeNumber(String chequeNumber) {
		this.chequeNumber = chequeNumber;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	public String getTransactionDate() {
		return transactionDate;
	}
	public void setTransactionDate(String transactionDate) {
		this.transactionDate = transactionDate;
	}
	public String getValueDate() {
		return valueDate;
	}
	public void setValueDate(String valueDate) {
		this.valueDate = valueDate;
	}
	public String getChequeAmount() {
		return chequeAmount;
	}
	public void setChequeAmount(String chequeAmount) {
		this.chequeAmount = chequeAmount;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
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
	public String getModesum1() {
		return modesum1;
	}
	public void setModesum1(String modesum1) {
		this.modesum1 = modesum1;
	}
	public String getNoofitems1() {
		return noofitems1;
	}
	public void setNoofitems1(String noofitems1) {
		this.noofitems1 = noofitems1;
	}
	public String getAmt1() {
		return amt1;
	}
	public void setAmt1(String amt1) {
		this.amt1 = amt1;
	}
	public String getModesum2() {
		return modesum2;
	}
	public void setModesum2(String modesum2) {
		this.modesum2 = modesum2;
	}
	public String getNoofitems2() {
		return noofitems2;
	}
	public void setNoofitems2(String noofitems2) {
		this.noofitems2 = noofitems2;
	}
	public String getAmt2() {
		return amt2;
	}
	public void setAmt2(String amt2) {
		this.amt2 = amt2;
	}
	public String getModesum3() {
		return modesum3;
	}
	public void setModesum3(String modesum3) {
		this.modesum3 = modesum3;
	}
	public String getNoofitems3() {
		return noofitems3;
	}
	public void setNoofitems3(String noofitems3) {
		this.noofitems3 = noofitems3;
	}
	public String getAmt3() {
		return amt3;
	}
	public void setAmt3(String amt3) {
		this.amt3 = amt3;
	}
	public String getModez1() {
		return modez1;
	}
	public void setModez1(String modez1) {
		this.modez1 = modez1;
	}
	public String getNoofitemsz1() {
		return noofitemsz1;
	}
	public void setNoofitemsz1(String noofitemsz1) {
		this.noofitemsz1 = noofitemsz1;
	}
	public String getAmtz1() {
		return amtz1;
	}
	public void setAmtz1(String amtz1) {
		this.amtz1 = amtz1;
	}
	public String getModez2() {
		return modez2;
	}
	public void setModez2(String modez2) {
		this.modez2 = modez2;
	}
	public String getNoofitemsz2() {
		return noofitemsz2;
	}
	public void setNoofitemsz2(String noofitemsz2) {
		this.noofitemsz2 = noofitemsz2;
	}
	public String getAmtz2() {
		return amtz2;
	}
	public void setAmtz2(String amtz2) {
		this.amtz2 = amtz2;
	}
	public String getModez3() {
		return modez3;
	}
	public void setModez3(String modez3) {
		this.modez3 = modez3;
	}
	public String getNoofitemsz3() {
		return noofitemsz3;
	}
	public void setNoofitemsz3(String noofitemsz3) {
		this.noofitemsz3 = noofitemsz3;
	}
	public String getAmtz3() {
		return amtz3;
	}
	public void setAmtz3(String amtz3) {
		this.amtz3 = amtz3;
	}
	
	
	
	
	
	
	
	
	
	
	
	

}
