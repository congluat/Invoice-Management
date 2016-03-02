package controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import model.Invoice;
import model.Photo;
import service.PhotoService;

@Controller
@RequestMapping("/Upload")
public class FileUploadController {
	@Autowired
	ServletContext application;

	@Autowired
	@Qualifier("photoService")
	PhotoService photoService;

	/*@RequestMapping(value = "/show", method = RequestMethod.GET)
	public String displayForm() {
		return "fileUploader";
	}*/

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public void upload(MultipartHttpServletRequest request, HttpServletResponse response,
			 ModelMap model , HttpSession session) throws IOException {
		// Getting uploaded files from the request object
		Map<String, MultipartFile> fileMap = request.getFileMap();
		Invoice invoice = (Invoice) session.getAttribute("invoice");	
		// Iterate through the map
		for (MultipartFile multipartFile : fileMap.values()) {
			// Save the file to local disk
			saveFileToLocalDisk(multipartFile);

			Photo fileInfo = getUploadedFileInfo(multipartFile);
			
			// Save the file info to database
			saveFileToDatabase(fileInfo, invoice);
		}
		session.removeAttribute("invoice");		
	}

	private void saveFileToLocalDisk(MultipartFile multipartFile) throws IOException, FileNotFoundException {
		Date now = new Date();
		String name = now.toString().replaceAll(" ", "").replaceAll(":", "");
		String fileName = multipartFile.getOriginalFilename()+name;
		// Handle file content - multipartFile.getInputStream()
		String path = application.getRealPath("/resources/images/") + fileName;
		System.out.println(path);
		if (!fileName.equals(""))
			multipartFile.transferTo(new File(path));
	}

	private Photo getUploadedFileInfo(MultipartFile multipartFile) throws IOException {
		Photo photo = new Photo();
		photo.setPhoto(multipartFile.getOriginalFilename());
		return photo;
	}

	private void saveFileToDatabase(Photo uploadedFile, Invoice invoice) {
		uploadedFile.setInvoice(invoice);
		photoService.create(uploadedFile);
	}

}