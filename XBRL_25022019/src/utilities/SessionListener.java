package utilities;

import org.apache.log4j.Logger;


import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;


import action.XBRLLoginAction;




public class SessionListener implements HttpSessionListener {
	
	static Logger log = Logger.getLogger(SessionListener.class);
	private  int sessionCount = 0;


	public void sessionCreated(HttpSessionEvent event) {
		synchronized (this) {
			sessionCount++;
		}
		//log.info("Session Created: " + event.getSession().getId());
		//log.info("Total Sessions: " + sessionCount);
	}

	public void sessionDestroyed(HttpSessionEvent event) {
		synchronized (this) {
			sessionCount--;
		}
		/*boolean status=XBRLLoginAction.expiryUpdate(event.getSession().getId());*/
		log.info("Session Destroyed: " + event.getSession().getId());
		//log.info("Total Sessions: " + sessionCount);
	}
	
	
	
}



