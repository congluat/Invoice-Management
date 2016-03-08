package scheduledtask;

import java.io.File;
import java.util.Date;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CleanupImages {

	@Autowired
	ServletContext application;
	
	
	
	public void run() {
		try {

			Date date = new Date();

			String path = application.getRealPath("/resources/images/");
			File folder = new File(path);
			File[] listOfFiles = folder.listFiles();

			for (int i = 0; i < listOfFiles.length; i++) {
				if (listOfFiles[i].isFile()) {
					System.out.println("File " + listOfFiles[i].getName());
				} 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
