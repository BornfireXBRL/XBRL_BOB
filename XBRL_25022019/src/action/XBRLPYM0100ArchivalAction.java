package action;

import java.util.ArrayList;
import org.apache.log4j.Logger;

import com.google.gson.Gson;

import bean.XBRLPYM0100Bean;
import dao.XBRLPYM0100ArchivalDao;

public class XBRLPYM0100ArchivalAction {
	
	static Logger log = Logger.getLogger(XBRLPYM0100ArchivalAction.class);

	public String repdate;
	
	public String getRepdate() {
		return repdate;
	}

	public void setRepdate(String repdate) {
		this.repdate = repdate;
	}

	public String repdate() {
		
		XBRLPYM0100ArchivalDao arcd=new XBRLPYM0100ArchivalDao();
		ArrayList<XBRLPYM0100Bean> arl=arcd.repdate();
		Gson gson=new Gson();
		
		repdate=gson.toJson(arl);
		return "success";
	}
}
