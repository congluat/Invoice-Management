package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
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

	@RequestMapping(value = "/searchAnyString", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	@ResponseBody
	public List<Invoice> searchAnyString(@RequestParam("keyword") String keyword, HttpServletRequest request) {
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

	/*
	 * @RequestMapping(value = { "/", "/get-all-danger-invoices" }, method =
	 * RequestMethod.GET) public String getAllDangerInvoices(HttpServletRequest
	 * request, ModelMap model) { User user = (User)
	 * request.getSession().getAttribute("user"); model.addAttribute("invoices",
	 * invoiceService.getAllInvoices(user.getId())); model.addAttribute("title",
	 * "Invoices"); return "invoices"; }
	 */

	@RequestMapping(value = { "/get-all-invoices/{amount}/{cateId}" }, method = RequestMethod.GET)
	@ResponseBody
	public boolean getAllInvoices(HttpServletRequest request, @PathVariable BigDecimal amount,
			@PathVariable int cateId) {
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

	@RequestMapping(value = "/search/{empname}/{attribute}", method = RequestMethod.GET)
	public String Search(@PathVariable String empname, @PathVariable String attribute, ModelMap model) {
		List<Invoice> invoices = new ArrayList<Invoice>();
		if (attribute.equals("Name") || attribute.equals("Place")) {
			invoices = sortList(invoiceService.getInvoiceAttribute(attribute, empname), empname, attribute);
		}
		if (attribute.equals("Amount") || attribute.equals("IsWarning") || attribute.equals("Time"))
			invoices = invoiceService.getInvoiceAttribute(attribute, empname);
		model.addAttribute("invoices", invoices);
		model.addAttribute("title", "Invoices");
		return "invoices_new";

	}

	private List<Invoice> sortList(List<Invoice> tmp, String empname, String attribute) {
		List<Invoice> invoices = new ArrayList<Invoice>();
		String[] str = new String[tmp.size()];
		int i = 0;
		for (Invoice t : tmp) {
			if (attribute.equals("Name"))
				str[i] = t.getName();
			if (attribute.equals("Place"))
				str[i] = t.getPlace();
			i++;
		}

		Arrays.sort(str, new Comparator<String>() {

			@Override
			public int compare(String o1, String o2) {

				boolean o1_has_keyWord = o1.indexOf(empname.charAt(0)) == 0 && o1.contains(empname);
				boolean o2_has_keyWord = o2.indexOf(empname.charAt(0)) == 0 && o2.contains(empname);

				if (o1_has_keyWord && o2_has_keyWord) {
					if (o1.length() == o2.length()) {
						if (o1.indexOf(empname.charAt(0)) > o2.indexOf(empname.charAt(0))) {
							return -1;
						} else if (o1.indexOf(empname.charAt(0)) == o2.indexOf(empname.charAt(0))) {
							return 0;
						} else {
							return 1;
						}
					} else if (o1.length() > o2.length()) {
						return 1;
					} else {
						return -1;
					}
				} else if (o1_has_keyWord && !o2_has_keyWord) {
					return -1;
				} else if (!o1_has_keyWord && o2_has_keyWord) {
					return 1;
				}

				return 0;

				// Code to sort array according to need

			}
		});

		for (int j = 0; j < str.length; j++) {
			for (Invoice t : tmp) {
				if (attribute.equals("Name")) {
					if (t.getName().equals(str[j])) {
						invoices.add(t);
						tmp.remove(t);
						break;
					}
				}
				if (attribute.equals("Place")) {
					if (t.getPlace().equals(str[j])) {
						invoices.add(t);
						tmp.remove(t);
						break;
					}
				}
			}
		}

		return invoices;
	}
}
