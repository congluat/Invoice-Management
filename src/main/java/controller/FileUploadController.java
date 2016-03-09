package controller;

import java.io.IOException;
import java.util.Collection;
import java.util.Map;

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
	}

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