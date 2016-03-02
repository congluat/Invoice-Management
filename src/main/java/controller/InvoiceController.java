 package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;

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

	@RequestMapping(value = "/getByMonth/{time}")
	@ResponseBody
	public List<Invoice> getByMonth(@PathVariable String time, HttpServletRequest request) throws ParseException {
		SimpleDateFormat formatter = new SimpleDateFormat("MM-yyyy");
		Date date = formatter.parse(time);
		System.out.println(time);
		System.out.println(date.toString());
		System.out.println("month: " + date.getMonth());
		System.out.println("year: " + date.getYear());
		return invoiceService.getAllInvoicesByMonth(date);
	}
	
	@RequestMapping(value = "/getByMonth")
	@ResponseBody
	public List<Invoice> getByMonth(HttpServletRequest request) throws ParseException {
		
		Date date = new Date();
		date.setMonth(2-1);
		date.setYear(2016-1900);
		
		return invoiceService.getAllInvoicesByMonth(date);
	}

	@RequestMapping(value = "/getGroupByMonth")
	@ResponseBody
	public Map<String, List<Invoice>> getGroupByMonth(HttpServletRequest request) throws ParseException {
		Map<String, List<Invoice>> map = invoiceService.getInvoicesGroupbyMonth();
		
		return invoiceService.getInvoicesGroupbyMonth();
	}
	
	@RequestMapping(value = "/getAllDayMonth")
	@ResponseBody
	public List<String> getAllDayMonth(HttpServletRequest request) throws ParseException {
	
		return invoiceService.getAllDayMonth();
	}

	@RequestMapping(value = { "/", "/get-all-invoices" }, method = RequestMethod.GET)
	public String getAllInvoices(HttpServletRequest request, ModelMap model) {
		User user = (User) request.getSession().getAttribute("user");
		model.addAttribute("invoices", invoiceService.getAllInvoices(user.getId()));
		return "invoices";
	}
	@RequestMapping(value ="/save" , method = RequestMethod.GET )
	public String create(ModelMap model){
		Invoice invoice = new Invoice();
		model.addAttribute("invoice",invoice);
		model.addAttribute("edit",false);
		return "save-invoice";
	}

	@RequestMapping(value = "/save" , method=RequestMethod.POST )
	public String create(@Valid Invoice invoice, BindingResult result, ModelMap model,HttpSession session) throws IllegalStateException, IOException {
		if (result.hasErrors()) {
			return "save-invoice";
		}	
		Category cate = cateService.getById(1);		
		invoice.setCategory(cate);
		invoice.setUser((User) session.getAttribute("user"));	
		invoiceService.create(invoice);
	    session.setAttribute("invoice", invoice);
	    model.addAttribute("edit",false);
		return "_modalAddImages";
	}
	
	@RequestMapping(value = "/edit/{id}" , method = RequestMethod.GET)
	public String update(@PathVariable Integer id, ModelMap model) {
		Invoice invoice = invoiceService.getById(id);
		model.addAttribute("invoice",invoice);
		model.addAttribute("edit",true);
		return "save-invoice";
	}

	@RequestMapping(value = "/edit/{id}",method=RequestMethod.POST)
	public String update(@ModelAttribute Invoice invoice , ModelMap model , BindingResult result) {
		if (result.hasErrors()) {
			return "save-invoice";
		}					
		model.addAttribute("edit",true);
		invoiceService.update(invoice);
		return "home";
	}
	
	@ModelAttribute("categories")
	public Collection<Category> getcategories() {
		List<Category> categories = cateService.getAllCategories();
		return categories;
	}
}
