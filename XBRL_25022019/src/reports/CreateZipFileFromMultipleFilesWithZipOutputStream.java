package reports;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
import org.apache.log4j.Logger;
public class CreateZipFileFromMultipleFilesWithZipOutputStream {
	
	static Logger log = Logger.getLogger(CreateZipFileFromMultipleFilesWithZipOutputStream.class);
	
	public static void main(String[] args) {
		
		String zipFile = "C:\\Users\\praveen\\Desktop\\ID\\archive.zip";
		
		String srcFiles =  "C:\\Users\\praveen\\Desktop\\ID\\23423.xml";
		
		try {
			
			// create byte buffer
			byte[] buffer = new byte[1024];

			FileOutputStream fos = new FileOutputStream(zipFile);

			ZipOutputStream zos = new ZipOutputStream(fos);
			
			
				
				File srcFile = new File(srcFiles);

				FileInputStream fis = new FileInputStream(srcFile);

				// begin writing a new ZIP entry, positions the stream to the start of the entry data
				zos.putNextEntry(new ZipEntry(srcFile.getName()));
				
				int length;

				while ((length = fis.read(buffer)) > 0) {
					zos.write(buffer, 0, length);
				}

				zos.closeEntry();

				// close the InputStream
				fis.close();
				
		

			// close the ZipOutputStream
			zos.close();
			
		}
		catch (IOException ioe) {
			log.info("Error creating zip file: " + ioe);
		}
		
	}

}