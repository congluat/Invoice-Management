package controller;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.engine.spi.Mapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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

	@RequestMapping("/save")
	public String create(@ModelAttribute Invoice invoice,HttpSession session) {
		invoice = new Invoice();
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
