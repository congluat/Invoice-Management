package controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Comparator;
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
import org.springframework.web.bind.annotation.RequestParam;
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

	@RequestMapping(value = "/getDangerByMonth/{time}")
	@ResponseBody
	public List<Invoice> getDangerByMonth(@PathVariable String time, HttpServletRequest request) throws ParseException {
		SimpleDateFormat formatter = new SimpleDateFormat("MM-yyyy");
		Date date = formatter.parse(time);
		System.out.println(time);
		System.out.println(date.toString());
		System.out.println("month: " + date.getMonth());
		System.out.println("year: " + date.getYear());
		return invoiceService.getAllDangerInvoicesByMonth(date);
	}

	@RequestMapping(value = "/searchAnyString/{keyword}", method = RequestMethod.GET)
	@ResponseBody
	public List<Invoice> searchAnyString(@PathVariable String keyword, HttpServletRequest request) {
		return invoiceService.searchAnyString(keyword);
	}

	@RequestMapping(value = "/getByMonth")
	@ResponseBody
	public List<Invoice> getByMonth(HttpServletRequest request) throws ParseException {

		Date date = new Date();
		date.setMonth(2 - 1);
		date.setYear(2016 - 1900);

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

	@RequestMapping(value = "/getAllInvoices")
	@ResponseBody
	public List<Invoice> getAllInvoices(HttpServletRequest request) throws ParseException {
		User user = (User) request.getSession().getAttribute("user");
		return invoiceService.getAllInvoices(user.getId());
	}

	@RequestMapping(value = { "/", "/get-all-invoices" }, method = RequestMethod.GET)
	public String getAllInvoices(HttpServletRequest request, ModelMap model) {
		User user = (User) request.getSession().getAttribute("user");
		model.addAttribute("invoices", invoiceService.getAllInvoices(user.getId()));
		model.addAttribute("title", "Invoices");
		return "invoices";
	}

	@RequestMapping(value = { "/warning" }, method = RequestMethod.GET)
	public String getDangerInvoices(HttpServletRequest request, ModelMap model) {
		return "invoices_danger";
	}
	

	@RequestMapping(value = { "/get-all-invoices/{amount}/{cateId}" }, method = RequestMethod.GET)
	@ResponseBody
	public boolean getAllInvoices(HttpServletRequest request, @PathVariable("amount") BigDecimal amount,
			@PathVariable("cateId") Integer cateId) {
		// User user = (User) request.getSession().getAttribute("user");
		Category category = cateService.getById(cateId);
		return invoiceService.checkIsWarning(amount, category);
	}

	@RequestMapping(value = "/save", method = RequestMethod.GET)
	public String create(ModelMap model) {
		Invoice invoice = new Invoice();
		model.addAttribute("invoice", invoice);
		model.addAttribute("edit", false);
		model.addAttribute("title", "Add Invoice");
		return "save-invoice";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String create(@Valid Invoice invoice, BindingResult result, ModelMap model, HttpSession session)
			throws IllegalStateException, IOException {
		if (result.hasErrors()) {
			return "save-invoice";
		}
		Category cate = invoice.getCategory();
		invoice.setCategory(cate);
		invoice.setUser((User) session.getAttribute("user"));
		invoice.setIsWarning(invoiceService.checkIsWarning(invoice.getAmount(), cate));
		invoiceService.create(invoice);
		model.addAttribute("edit", false);
		return "_modalAddImages";
	}

	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public String update(@PathVariable Integer id, ModelMap model, HttpSession session) {
		Invoice invoice = invoiceService.getById(id);
		model.addAttribute("invoice", invoice);
		model.addAttribute("edit", true);
		// session.setAttribute("invoice", invoice);
		model.addAttribute("title", invoice.getName());
		return "save-invoice";
	}

	@RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
	public String update(@ModelAttribute Invoice invoice, ModelMap model, BindingResult result) {
		if (result.hasErrors()) {
			return "save-invoice";
		}
		model.addAttribute("edit", true);
		invoice.setIsWarning(invoiceService.checkIsWarning(invoice.getAmount(), invoice.getCategory()));
		invoiceService.update(invoice);

		return "redirect:/Invoice/";
	}

	@RequestMapping(value = "/delete/{id}")
	public String delete(HttpSession session, @PathVariable Integer id) {
		Invoice invoice = invoiceService.getById(id);
		invoiceService.delete(invoice);
		return "redirect:/Invoice/";
	}

	@ModelAttribute("categories")
	public Collection<Category> getcategories() {
		List<Category> categories = cateService.getAllCategories();
		return categories;
	}

	@RequestMapping(value = "/search/{attribute}", method = RequestMethod.GET)
	public String Search(@RequestParam(value = "empname", required = false) String empname, @RequestParam(value = "page", required = false) String page, @PathVariable String attribute, ModelMap model) {		
		List<Invoice> invoices = new ArrayList<Invoice>();
		List<Invoice> invoiceTmp = new ArrayList<Invoice>();
		invoiceService.getDataInvoiceAndTemp(invoices, invoiceTmp, attribute, empname, page);
		int startpage = (int) (Integer.parseInt(page) - 5 > 0?Integer.parseInt(page) - 5:1);
	    double endpage = startpage + 10;
	    if(endpage > (invoiceTmp.size()/3))
	    	endpage = (int)(invoiceTmp.size()/3) + 1;
	    model.addAttribute("startpage",startpage);
	    model.addAttribute("endpage",endpage);
	    model.addAttribute("empname",empname);
	    model.addAttribute("attribute",attribute);
		model.addAttribute("invoices", invoices);
		model.addAttribute("title", "Invoices");
		return "invoices_new";
	}
}
