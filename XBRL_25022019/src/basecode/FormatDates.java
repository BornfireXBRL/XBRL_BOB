package basecode;



import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

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

public class FormatDates {
	
	static Logger log = Logger.getLogger(FormatDates.class);


    public static void main(String... args) throws InterruptedException {

        Date date = new Date();

        log.info("Custom format date strings");
        DateFormat df = new SimpleDateFormat("dd/MM/yy");
        log.info("Today is (dd/MM/yy): " + df.format(date));

        df = new SimpleDateFormat("dd/MM/yyyy");
        log.info("Today is (dd/MM/yyyy): " + df.format(date));

        df = new SimpleDateFormat("yyyy/MM/dd");
        log.info("Today is (yyyy/MM/dd): " + df.format(date));

        df = new SimpleDateFormat("d MMM, yyyy");
        log.info("Today is (d MMM, yyyy): " + df.format(date));

        df = new SimpleDateFormat("d MMMM, yyyy");
        log.info("Today is (d MMMM, yyyy): " + df.format(date));

        df = new SimpleDateFormat("d MMMM, yyyy", Locale.CHINESE);
        log.info("Today is (d MMMM, yyyy, CHINESE): " + df.format(date));

        df = new SimpleDateFormat("d MMMM, yyyy", Locale.ITALIAN);
        log.info("Today is (d MMMM, yyyy, ITALIAN): " + df.format(date));


        log.info("\nBuilt in date formats");
        df = DateFormat.getDateInstance(DateFormat.DEFAULT);
        log.info("Today is (DateFormat.DEFAULT): " + df.format(date));

        df = DateFormat.getDateInstance(DateFormat.SHORT);
        log.info("Today is (DateFormat.SHORT): " + df.format(date));

        df = DateFormat.getDateInstance(DateFormat.MEDIUM);
        log.info("Today is (DateFormat.MEDIUM): " + df.format(date));

        df = DateFormat.getDateInstance(DateFormat.LONG);
        log.info("Today is (DateFormat.LONG): " + df.format(date));

        df = DateFormat.getDateInstance(DateFormat.FULL);
        log.info("Today is (DateFormat.FULL): " + df.format(date));

        df = DateFormat.getDateInstance(DateFormat.FULL, Locale.CHINESE);
        log.info("Today is (DateFormat.FULL, CHINESE): " + df.format(date));

        df = DateFormat.getDateInstance(DateFormat.FULL, Locale.ITALIAN);
        log.info("Today is (DateFormat.FULL, ITALIAN): " + df.format(date));

    }
}