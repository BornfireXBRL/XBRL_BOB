package action;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.struts2.ServletActionContext;

import com.monitorjbl.xlsx.StreamingReader;
import com.opensymphony.xwork2.ActionSupport;

import au.com.bytecode.opencsv.CSVReader;
import basecode.DateFormat;
import oracle.sql.CLOB;
import utilities.ConnectionManager;
import utilities.NullCheck;

public class BulkUploadSup1500Action 
{
	private InputStream inputStream;
	private String fileName;
	private long contentLength;
	private File[] fileUpload;
	private String[] fileUploadFileName;
	private String[] fileUploadContentType;
	private String saveDirectory;
	
	public String sup1500Upload() throws SQLException, IOException 
	{
		System.out.println("xcel fn ");
		PreparedStatement stmt = null;
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		PreparedStatement ps1 = null;
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		int rs = 0;
		StringBuffer sql = new StringBuffer();
		StringBuffer sql1 = new StringBuffer();
		String Errormsg = "";
		String status = "";
		CallableStatement pstmt = null;
		String usr = session.getAttribute("userName").toString();

		if (Integer.parseInt(request.getParameter("cnt")) > 0) {
			System.out.println("before truncate");
			sql1.append("TRUNCATE  TABLE SUP1500_MANUAL_TABLE");

			try {
				System.out.println(sql1.toString());
				ps = conn.prepareStatement(sql1.toString());
				ResultSet rs1 = ps.executeQuery();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		DateFormat df = new DateFormat();

		for (int i = 0; i < fileUpload.length; i++) {

			String fileName = fileUploadFileName[i].substring(0, fileUploadFileName[i].lastIndexOf("."));

			System.out.println("fileUploadFileName" + fileUpload[i].getAbsolutePath());

			ArrayList<String> dataHolder = new ArrayList<String>();
			String cellval = "";

			System.out.println(fileUpload[i].getAbsolutePath());

			SimpleDateFormat Format = new SimpleDateFormat("dd-MM-yyyy");

			Date date = new Date();

			String findate = df.formatdate(Format.format(date));

			try (InputStream is = new FileInputStream(new File(fileUpload[i].getAbsolutePath()));
					Workbook workbook = StreamingReader.builder().rowCacheSize(100).bufferSize(4096).open(is)) {

				int i1 = 0;
				for (Sheet s : workbook) {
					System.out.println(s.getSheetName());
					for (Row r : s) 
					{
						cellval = "";
						String val;
						for (int j = 0; j < 5; j++) {
							Cell cell = r.getCell(j);
							if (cell == null || cell.getStringCellValue().length() == 0) {
								val = null;
							} else {
								val = cell.getStringCellValue();
							}
							dataHolder.add(val);
						}

						if (i1 % 49 == 0) {

							conn.close();
							conn = connMgr.getConnection();
						}

						if (i1 > 0) {

							System.out.println(dataHolder);
							String query = "Insert into SUP1500_MANUAL_TABLE(INSTANCE_CODE,RESIDENT,NON_RESIDENT,DEL_FLG,RCRE_USER_ID,RCRE_TIME,REPORT_DATE) values(?,?,?,?,?,?,?)";
						
							stmt = conn.prepareStatement(query);
						
							
							stmt.setString(1, dataHolder.get(1));
							stmt.setString(2,  dataHolder.get(2));
							stmt.setString(3, dataHolder.get(3));
							
							stmt.setString(4, "N");
							stmt.setString(5, session.getAttribute("userName").toString());
							stmt.setString(6, df.formatdate(Format.format(date)));
							stmt.setString(7, dataHolder.get(4));
							
							
							

							rs = stmt.executeUpdate();
							dataHolder.clear();
						}
						dataHolder.clear();

						i1++;
					}
				}

				stmt.close();
				conn.close();
			}

			catch (Exception e) {
				e.printStackTrace();

				System.out.println("inside the catch");
			}

			if (rs > 0) {
				ConnectionManager connMgr1 = new ConnectionManager();
				Connection conn1 = connMgr1.getConnection();
				pstmt = conn1.prepareCall("{call COMMON_VALIDATION_SP(?,?,?,?)}");

				pstmt.setString(1, "SUP1500_MANUAL");
				pstmt.setString(2, df.formatdate(NullCheck.isNotNull(request.getParameter("dt2"))));
				pstmt.registerOutParameter(3, java.sql.Types.VARCHAR);
				pstmt.registerOutParameter(4, java.sql.Types.CLOB);

				pstmt.executeUpdate();

				// String file = pstmt.getString(1);
				String validstat = pstmt.getString(3);
				// Clob errordetl = pstmt.getClob(4);
				CLOB notes = (CLOB) pstmt.getClob(4);

				System.out.println(Errormsg.trim());

				status = "success";
				request.setAttribute("Page", "bulkuploadsup1500");

				if (validstat.equals("Y")) {

					request.setAttribute("alert", "Uploaded successfully.");

				} else {
					System.out.println("inside elss");
					
					long len = notes.length();
					Errormsg = notes.getSubString(1, (int) len);
					System.out.println(Errormsg);
					request.setAttribute("alert", Errormsg.trim());

				}

			}
		}

		return "success";

	}
	
	
	public String sup1500Upload1() throws SQLException, IOException 
	{
		System.out.println("===uploadforcsv===");
		ConnectionManager connMgr = new ConnectionManager();
		Connection conn = connMgr.getConnection();
		PreparedStatement ps = null;
		PreparedStatement ps1 = null;
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		int rs = 0;
		StringBuffer sql = new StringBuffer();
		StringBuffer sql1 = new StringBuffer();
		String Errormsg = "";
		String status = "";
		CallableStatement pstmt = null;
		System.out.println(request.getParameter("cnt"));

		if (Integer.parseInt(request.getParameter("cnt")) > 0) {
			sql1.append("TRUNCATE  TABLE SUP1500_MANUAL_TABLE");

			try {
				System.out.println(sql1.toString());
				ps = conn.prepareStatement(sql1.toString());
				ResultSet rs1 = ps.executeQuery();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		DateFormat df = new DateFormat();

		for (int i = 0; i < fileUpload.length; i++) {

			String fileName = fileUploadFileName[i].substring(0, fileUploadFileName[i].lastIndexOf("."));

			// String filename="C:/Users/ADMIN/export.xlsx";

			System.out.println("fileUploadFileName" + fileName);

			ArrayList dataHolder = null;
			ArrayList cellStoreArrayList = null;

			String newdate = null;
			System.out.println(fileUpload[i].getAbsolutePath());
			SimpleDateFormat Format = new SimpleDateFormat("dd-MM-yyyy");

			try {
				PreparedStatement pstmt1 = conn.prepareStatement(
						"Insert into SUP1500_MANUAL_TABLE(INSTANCE_CODE,RESIDENT,NON_RESIDENT,DEL_FLG,RCRE_USER_ID,RCRE_TIME,REPORT_DATE) values(?,?,?,?,?,?,?)");
				@SuppressWarnings("resource")
				CSVReader reader = new CSVReader(new FileReader(fileUpload[i].getAbsolutePath()), ',');
				String[] nextLine;
				int i1 = 0;
				while ((nextLine = reader.readNext()) != null) {

					if (i1 > 0) {

						Date date = new Date();

						

						pstmt1.setString(1, nextLine[1]);
						pstmt1.setString(2, nextLine[2]);
						pstmt1.setString(3, nextLine[3]);
						
						pstmt1.setString(4, "N");
						pstmt1.setString(5, session.getAttribute("userName").toString());
						pstmt1.setString(6, df.formatdate(Format.format(date)));
						pstmt1.setString(7, nextLine[4]);

						System.out.println("afterdate");

						rs = pstmt1.executeUpdate();
					}

					i1++;

				}

				pstmt1.close();
				conn.commit();
				conn.close();
			}

			catch (Exception e) {
				e.printStackTrace();

				System.out.println("inside the catch");
			}

			if (rs > 0) {
				ConnectionManager connMgr1 = new ConnectionManager();
				Connection conn1 = connMgr1.getConnection();
				pstmt = conn1.prepareCall("{call COMMON_VALIDATION_SP(?,?,?,?)}");

				pstmt.setString(1, "SUP1500_MANUAL");
				pstmt.setString(2, df.formatdate(NullCheck.isNotNull(request.getParameter("dt2"))));
				pstmt.registerOutParameter(3, java.sql.Types.VARCHAR);
				pstmt.registerOutParameter(4, java.sql.Types.CLOB);

				pstmt.executeUpdate();

				// String file = pstmt.getString(1);
				String validstat = pstmt.getString(3);
				// Clob errordetl = pstmt.getClob(4);
				CLOB notes = (CLOB) pstmt.getClob(4);

				System.out.println(Errormsg.trim());

				status = "success";
				request.setAttribute("Page", "bulkuploadsup1500");

				if (validstat.equals("Y")) {

					request.setAttribute("alert", "Uploaded successfully.");

				} else {
					System.out.println("inside elss");
					long len = notes.length();
					Errormsg = notes.getSubString(1, (int) len);
					request.setAttribute("alert", Errormsg.trim());

				}

			}
		}

		return "success";
	}
	
	
	
	
	public InputStream getInputStream() {
		return inputStream;
	}
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public long getContentLength() {
		return contentLength;
	}
	public void setContentLength(long contentLength) {
		this.contentLength = contentLength;
	}
	public File[] getFileUpload() {
		return fileUpload;
	}
	public void setFileUpload(File[] fileUpload) {
		this.fileUpload = fileUpload;
	}
	public String[] getFileUploadFileName() {
		return fileUploadFileName;
	}
	public void setFileUploadFileName(String[] fileUploadFileName) {
		this.fileUploadFileName = fileUploadFileName;
	}
	public String[] getFileUploadContentType() {
		return fileUploadContentType;
	}
	public void setFileUploadContentType(String[] fileUploadContentType) {
		this.fileUploadContentType = fileUploadContentType;
	}
	public String getSaveDirectory() {
		return saveDirectory;
	}
	public void setSaveDirectory(String saveDirectory) {
		this.saveDirectory = saveDirectory;
	}
	
	

}
