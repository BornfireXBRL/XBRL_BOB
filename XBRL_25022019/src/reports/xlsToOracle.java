package reports;

import java.io.*;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.ss.usermodel.*;
import java.util.*;
import java.sql.*; 
public class xlsToOracle {  
	static Logger log = Logger.getLogger(xlsToOracle.class);
        public static void main(String[] args) throws Exception{                
                /* Create Connection objects */
        		Class.forName("oracle.jdbc.driver.OracleDriver");			
                Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@192.168.1.22:1521:orcl","xbrl","xbrl1");
                PreparedStatement sql_statement = null;
                String jdbc_insert_sql = "INSERT INTO XLS_POI"
                                + "(KEYWORD, TOTAL_COUNT) VALUES"
                                + "(?,?)";
                sql_statement = conn.prepareStatement(jdbc_insert_sql);
                /* We should now load excel objects and loop through the worksheet data */
                FileInputStream input_document = new FileInputStream(new File("C:\\Users\\praveen\\Desktop\\ID\\xls_to_oracle.xls"));
                /* Load workbook */
                HSSFWorkbook my_xls_workbook = new HSSFWorkbook(input_document);
                /* Load worksheet */
                HSSFSheet my_worksheet = my_xls_workbook.getSheetAt(0);
                // we loop through and insert data
                Iterator<Row> rowIterator = my_worksheet.iterator(); 
                while(rowIterator.hasNext()) {
                        Row row = rowIterator.next(); 
                        Iterator<Cell> cellIterator = row.cellIterator();
                                while(cellIterator.hasNext()) {
                                        Cell cell = cellIterator.next();
                                        switch(cell.getCellType()) { 
                                        case Cell.CELL_TYPE_STRING: //handle string columns
                                                sql_statement.setString(1, cell.getStringCellValue());                                                                                     
                                                break;
                                        case Cell.CELL_TYPE_NUMERIC: //handle double data
                                                sql_statement.setDouble(2,cell.getNumericCellValue() );
                                                break;
                                        }
                                       
                                }
                //we can execute the statement before reading the next row
                sql_statement.executeUpdate();
                }
                /* Close input stream */
                input_document.close();
                /* Close prepared statement */
                sql_statement.close();
                /* COMMIT transaction */
                conn.commit();
                /* Close connection */
                conn.close();
        }
}