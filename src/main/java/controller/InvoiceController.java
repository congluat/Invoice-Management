package controller;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import model.Category;
import model.FileUploadForm;
import model.Invoice;
import model.Photo;
import model.User;
import service.CategoryService;
import service.InvoiceService;

@Controller
@RequestMapping("/Invoice")
public class InvoiceController {

	@Autowired
	ServletContext application;
	
	@Autowired
	@Qualifier("categoryService")
	CategoryService cateService;

	@Autowired
	@Qualifier("invoiceService")
	InvoiceService invoiceService;

	@RequestMapping(value = { "/", "/get-all-invoices" }, method = RequestMethod.GET)
	public String getAllInvoices(HttpServletRequest request, ModelMap model) {
		User user = (User) request.getSession().getAttribute("user");
		model.addAttribute("invoices", invoiceService.getAllInvoices(user.getId()));
		return "invoices";
	}

	@RequestMapping(value = "/save", method = RequestMethod.GET)
	public String create(HttpSession session, ModelMap model) {
		Invoice invoice = new Invoice();

		User user = (User) session.getAttribute("user");
		invoice.setUser(user);

		List<Category> categories = cateService.getAllCategories();

		model.addAttribute("invoice", invoice);
		model.addAttribute("categories", categories);

		return "save-invoice";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String create(@Valid Invoice invoice, BindingResult result, ModelMap model,
			@ModelAttribute("uploadForm") FileUploadForm uploadForm) throws IllegalStateException, IOException {
		// System.out.println(invoice.getTime());
		if (result.hasErrors()) {
			model.addAttribute("categories", cateService.getAllCategories());
			return "save-invoice";
		}
		invoice.setIsWarning(false);
		if (invoiceService.create(invoice) == true) {
			List<MultipartFile> files = uploadForm.getFiles();

			List<String> fileNames = new ArrayList<String>();

			if (null != files && files.size() > 0) {
				for (MultipartFile multipartFile : files) {

					String fileName = multipartFile.getOriginalFilename();
					Photo photo = new Photo();
					photo.setPhoto(fileName);
					invoice.getPhotos().add(photo);
					fileNames.add(fileName);
					// Handle file content - multipartFile.getInputStream()

					String path = application.getRealPath("/resources/images/") + fileName;

					if (!fileName.equals("")) {
						multipartFile.transferTo(new File(path));
					}
				}
			}
			model.addAttribute("files", fileNames);
			return "file_upload_success";
		}
		return "home";
	}

	@RequestMapping(value = "/edit/{id}")
	public String update(HttpSession session, @PathVariable Integer id) {
		Category cate = cateService.getById(2);
		Invoice invoice = invoiceService.getById(id);
		invoice.setAmount(BigDecimal.valueOf(1000));
		invoice.setCategory(cate);
		invoice.setUser((User) session.getAttribute("user"));
		invoiceService.update(invoice);
		return "home";
	}
}
