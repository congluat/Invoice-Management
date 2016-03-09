package controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Collection;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import model.Invoice;
import model.Photo;
import service.InvoiceService;
import service.PhotoService;

@Controller
@RequestMapping("/Upload")
public class FileUploadController {
	@Autowired
	ServletContext application;

	@Autowired
	@Qualifier("invoiceService")
	InvoiceService invoiceService;
	
	@Autowired
	@Qualifier("photoService")
	PhotoService photoService;

	
		
	@RequestMapping(value = "/upload/{id}", method = RequestMethod.POST)
	public void upload(@PathVariable("id") Integer id , MultipartHttpServletRequest request, HttpServletResponse response,
			 ModelMap model , HttpSession session) throws IOException {
		// Getting uploaded files from the request object
		Map<String, MultipartFile> fileMap = request.getFileMap();
		//Invoice invoice = (Invoice) session.getAttribute("invoice");	
		Invoice invoice = invoiceService.getById(id);
		photoService.savePhoto(fileMap, invoice);
		// Iterate through the map
	/*	for (MultipartFile multipartFile : fileMap.values()) {
			// Save the file to local disk
			saveFileToLocalDisk(multipartFile,name);

			Photo fileInfo = getUploadedFileInfo(multipartFile,name);
			
			// Save the file info to database
			saveFileToDatabase(fileInfo, invoice);
		}
		//session.removeAttribute("invoice");		
*/	}

	/*private void saveFileToLocalDisk(MultipartFile multipartFile,String name) throws IOException, FileNotFoundException {	
		String fileName = name + multipartFile.getOriginalFilename();
		// Handle file content - multipartFile.getInputStream()
		String path = application.getRealPath("/resources/images/") + fileName;
		System.out.println(path);
		if (!fileName.equals(""))
			multipartFile.transferTo(new File(path));
	}

	private Photo getUploadedFileInfo(MultipartFile multipartFile,String name) throws IOException {
		Photo photo = new Photo();
		photo.setPhoto(name+multipartFile.getOriginalFilename());
		return photo;
	}

	private void saveFileToDatabase(Photo uploadedFile, Invoice invoice) {
		uploadedFile.setInvoice(invoice);
		photoService.create(uploadedFile);
	}*/
	
	@RequestMapping(value="/delete")
	@ResponseBody
	public void delete(@RequestParam("id") Integer id){
		Photo photo = photoService.findById(id);
		photoService.delete(photo);		
	}
	
	
	@RequestMapping(value="/getPhoto",method =RequestMethod.POST)
	@ResponseBody
	public Collection<Photo> getPhoto(@RequestParam("id") Integer id){
		Invoice invoice = invoiceService.getById(id);
		return invoice.getPhotos();
	}
	
}