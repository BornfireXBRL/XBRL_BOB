
package bean;


/***************************************************************************************************************
*																												*
* 	* @companyName 			:	Bonfire Innovation Private Limited Chennai										*
* 	* @project 				:	Extensible Business Reporting Language (XBRL)									*
* 	* @name 				:	XBRLSUP1400Bean.java															*
* 	* @path 				:	action																			*
* 	* @author 				:	D PraveenBabu																	*
* 	* @version 				: 	1.0																				*
* 	* @functionality 		:	XBRLSUP1400																		*
* 	* @relatedScripts 		: 	bean.XBRLSUP1400Action.java,dao.XBRLSUP1400Dao.java 							*
* 	* @creationDate 		:																					*
* 	* @lastModifiedDate 	:																					*
* 	* @modificationHistory 	: 																					*
*																												*
 ***************************************************************************************************************/

public class XBRLSUP1300Bean {
	
	
	public String insname;
	public String inscode;
	
	public String individuals;

                      
	
	public String corporates;
	public String others;

	
	public String getInsname() {
		return insname;
	}
	public void setInsname(String insname) {
		this.insname = insname;
	}
	public String getInscode() {
		return inscode;
	}
	public void setInscode(String inscode) {
		this.inscode = inscode;
	}
	public String getIndividuals() {
		return individuals;
	}
	public void setIndividuals(String individuals) {
		this.individuals = individuals;
	}
	public String getCorporates() {
		return corporates;
	}
	public void setCorporates(String corporates) {
		this.corporates = corporates;
	}
	public String getOthers() {
		return others;
	}
	public void setOthers(String others) {
		this.others = others;
	}

	
	

}
