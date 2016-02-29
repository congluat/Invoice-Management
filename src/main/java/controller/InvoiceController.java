package controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.engine.spi.Mapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.Category;
import model.Invoice;
import model.User;
import service.CategoryService;
import service.InvoiceService;

@Controller
@RequestMapping("/Invoice")
public class InvoiceController {

	@Autowired
	@Qualifier("categoryService")
	CategoryService cateService;

	@Autowired
	@Qualifier("invoiceService")
	InvoiceService invoiceService;

	@RequestMapping(value = { "/", "/get-all-invoices" } ,method = RequestMethod.GET)
	public String getAllInvoices(HttpServletRequest request,ModelMap model ){
		User user = (User) request.getSession().getAttribute("user");
		model.addAttribute("invoices",invoiceService.getAllInvoices(user.getId()));
		return "invoices";
	}

	@RequestMapping(value="/save", method = RequestMethod.GET)
	public String create(HttpSession session, ModelMap model) {
		Invoice invoice = new Invoice();

		User user = (User) session.getAttribute("user");
		invoice.setUser(user);
		
		List<Category> categories = cateService.getAllCategories();
		
		model.addAttribute("invoice", invoice);
		model.addAttribute("categories", categories);
		
		return "save-invoice";
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
