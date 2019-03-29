package action;

import java.util.ArrayList;

import com.google.gson.Gson;

import bean.XBRLBOP0300Bean;
import bean.XBRLPYM0100Bean;
import dao.XBRLBOP0300ArchivalDao;
import dao.XBRLPYM0100ArchivalDao;
import org.apache.log4j.Logger;
public class XBRLBOP0300ArchivalAction {
	
	static Logger log = Logger.getLogger(XBRLBOP0300ArchivalAction.class);

	public String repdate;
	
	public String getRepdate() {
		return repdate;
	}

	public void setRepdate(String repdate) {
		this.repdate = repdate;
	}

	public String repdatebop0300() {
		
		XBRLBOP0300ArchivalDao arcd=new XBRLBOP0300ArchivalDao();
		ArrayList<XBRLBOP0300Bean> arl=arcd.repdate();
		Gson gson=new Gson();
		
		repdate=gson.toJson(arl);
		return "success";
	}
}
