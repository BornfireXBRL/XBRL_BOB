package basecode;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

public class DateFormat {

	static Logger log = Logger.getLogger(DateFormat.class);
public String formatdate(String dateinput){
	
	if(dateinput.length() > 0) {
		String finalDate = dateinput.trim();		
		String splitDates[] = finalDate.split("-");
		String day = splitDates[0];
		String month = splitDates[1];
		String year = splitDates[2];
		if(month.equalsIgnoreCase("01") || month.equalsIgnoreCase("1") ) {
			dateinput = day+"-"+"JAN"+"-"+year;
		}
		if(month.equalsIgnoreCase("02") || month.equalsIgnoreCase("2")) {
			dateinput = day+"-"+"FEB"+"-"+year;
		}
		if(month.equalsIgnoreCase("03") || month.equalsIgnoreCase("3")) {
			dateinput = day+"-"+"MAR"+"-"+year;
		}
		if(month.equalsIgnoreCase("04") || month.equalsIgnoreCase("4")) {
			dateinput = day+"-"+"APR"+"-"+year;
		}
		if(month.equalsIgnoreCase("05") || month.equalsIgnoreCase("5")) {
			dateinput = day+"-"+"MAY"+"-"+year;
		}
		if(month.equalsIgnoreCase("06") || month.equalsIgnoreCase("6")) {
			dateinput = day+"-"+"JUN"+"-"+year;
		}
		if(month.equalsIgnoreCase("07") || month.equalsIgnoreCase("7")) {
			dateinput = day+"-"+"JUL"+"-"+year;
		}
		if(month.equalsIgnoreCase("08") || month.equalsIgnoreCase("8")) {
			dateinput = day+"-"+"AUG"+"-"+year;
		}
		if(month.equalsIgnoreCase("09") || month.equalsIgnoreCase("9")) {
			dateinput = day+"-"+"SEP"+"-"+year;
		}
		if(month.equalsIgnoreCase("10")) {
			dateinput = day+"-"+"OCT"+"-"+year;
		}
		if(month.equalsIgnoreCase("11")) {
			dateinput = day+"-"+"NOV"+"-"+year;
		}
		if(month.equalsIgnoreCase("12")) {
			dateinput = day+"-"+"DEC"+"-"+year;
		}
	}
	
	return dateinput;
}
public String dateformat(String dateinput){
	String value="";
	try{

	    SimpleDateFormat sourceDateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");

	    Date date = sourceDateFormat.parse(dateinput);


	    SimpleDateFormat targetDateFormat = new SimpleDateFormat("dd-MMM-yyyy");
	    //log.info("ddddddddddddddddddddddddddddddddddddddddddddddddddddddd"+targetDateFormat.format(date));
	    value=targetDateFormat.format(date);
	    }catch(ParseException e){
	        e.printStackTrace();
	    }
	return value;
	  } 


}
