package bean;

/***************************************************************************************************************
*																												*
* 	* @companyName 			:	Bonfire Innovation Private Limited Chennai										*
* 	* @project 				:	Extensible Business Reporting Language (XBRL)									*
* 	* @name 				:	XBRLDCG0100Bean.java															*
* 	* @path 				:	action																			*
* 	* @author 				:	D PraveenBabu																	*
* 	* @version 				: 	1.0																				*
* 	* @functionality 		:	It contains bean class for DCG0100 Report.										*
* 	* @relatedScripts 		: 	bean.XBRLDCG0100Action.java,dao.XBRLDCG0100Dao.java 							*
* 	* @creationDate 		:																					*
* 	* @lastModifiedDate 	:																					*
* 	* @modificationHistory 	: 																					*
*																												*
 ***************************************************************************************************************/

public class XBRLDCG0100Bean {
	
	

	public String Instancnam;
	
	public String Instancecode;
	public String Noofcoins;
	
	
	public String Reportdate;
	public String Typeofcoin;
	
	public String entryuser;
	public String entrytime;
	public String modtyp;
	
	
	
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
	public String getEntrytime() {
		return entrytime;
	}
	public void setEntrytime(String entrytime) {
		this.entrytime = entrytime;
	}
	public String getInstancnam() {
		return Instancnam;
	}
	public void setInstancnam(String instancnam) {
		Instancnam = instancnam;
	}

	public String getInstancecode() {
		return Instancecode;
	}
	public void setInstancecode(String instancecode) {
		Instancecode = instancecode;
	}
	public String getNoofcoins() {
		return Noofcoins;
	}
	public void setNoofcoins(String noofcoins) {
		Noofcoins = noofcoins;
	}
	
	public String getReportdate() {
		return Reportdate;
	}
	public void setReportdate(String reportdate) {
		Reportdate = reportdate;
	}
	public String getTypeofcoin() {
		return Typeofcoin;
	}
	public void setTypeofcoin(String typeofcoin) {
		Typeofcoin = typeofcoin;
	}
	
	
	
	
	
	
	
	
	

}
