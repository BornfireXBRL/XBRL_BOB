package utilities;

import org.apache.log4j.Logger;

public class NullCheck {
	private static final Logger log = Logger.getLogger(NullCheck.class);
	public static String isNotNull(String txt) {
		/*if (logger.isDebugEnabled()) {
			logger.debug("isNotNull()!");
		}*/

		return txt != null && txt.trim().length() > 0 ? txt.trim() : "";
	}
	
	//new BigDecimal("0.00").equals(BigDecimal.ZERO)
	
	public static String isNotZero(String txt) {
		/*if (logger.isDebugEnabled()) {
			logger.debug("isNotNull()!");
		}*/

		return txt != null && txt.trim().length() > 0 ? txt.trim() : "0.00";
	}
	public static String isEmpty(String txt) {
		/*if (logger.isDebugEnabled()) {
			logger.debug("isNotNull()!");
		}*/

		return txt != "" && txt.trim().length() > 0 ? txt.trim() : "";
	}public static String isEmptyForNone(String txt) {
		/*if (logger.isDebugEnabled()) {
			logger.debug("isNotNull()!");
		}*/

		return txt != "" && txt.trim().length() > 0 ? txt.trim() : " ";
	}
	public static Boolean isBooleanNull(String txt) {
		/*if (logger.isDebugEnabled()) {
			logger.debug("isBooleanNull()!");
		}*/
		return txt != null && txt.trim().length() > 0 ? true : false;

	}
	
	
	public String notZero(String inpt) {
String oup="";
		if(inpt.equals("") || inpt.equals("null") || inpt.equals(null) ) {
			oup= "0" ;
		}else {
			oup= inpt.trim();
		}
		log.info(oup);
		return oup;
	}
}
