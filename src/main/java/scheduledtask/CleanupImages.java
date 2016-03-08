package scheduledtask;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import service.PhotoService;

@Component
public class CleanupImages {

	@Autowired
	ServletContext application;

	@Autowired
	@Qualifier("photoService")
	PhotoService photoService;
	/*
	 * http://www.mkyong.com/spring-batch/spring-batch-and-spring-taskscheduler-example/
	 * http://stackoverflow.com/questions/26147044/spring-cron-expression-for-every-day-101am
	 * http://www.mkyong.com/java/how-to-delete-file-in-java/
	 * 
	 */
	public void run() {
		try {

			Date date = new Date();
			List<String> photosOnDB = photoService.getAllPhotos();
			String path = application.getRealPath("/resources/images/");
			System.out.println("path" + path);
			File folder = new File(path);
			File[] listOfFiles = folder.listFiles();

			for (int i = 0; i < listOfFiles.length; i++) {
				if (listOfFiles[i].isFile()) {

					if (!photosOnDB.contains(listOfFiles[i].getName())) {
						System.out.println("File " + listOfFiles[i].getName());
						if (listOfFiles[i].delete()) {
							System.out.println(listOfFiles[i].getName() + " is deleted!");
						} else {
							System.out.println("Delete operation is failed.");
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
