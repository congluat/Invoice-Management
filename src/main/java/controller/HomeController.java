package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Invoice;
import service.CategoryService;
import service.InvoiceService;
import service.ReportService;

@Controller
public class HomeController {

	@Autowired
	@Qualifier("invoiceService")
	InvoiceService invoiceService;

	@Autowired
	@Qualifier("categoryService")
	CategoryService cateService;

	@Autowired
	@Qualifier("reportService")
	ReportService reportService;

	@RequestMapping(value = { "/", "/welcome", "/dashboard" }, method = RequestMethod.GET)
	public String welcome(ModelMap model) {
		model.addAttribute("title", "Dashboard");
		return "home";
	}
	


	@RequestMapping(value = "getAmountThisMonth/{time}", method = RequestMethod.GET)
	@ResponseBody
	public double getAmountThisMonth(@PathVariable String time) throws ParseException {
		SimpleDateFormat formatter = new SimpleDateFormat("MM-yyyy");
		Date date = formatter.parse(time);
		List<Invoice> invoices = invoiceService.getAllInvoicesByMonth(date);
		double amount = 0;
		for (Invoice invoice : invoices) {
			amount += Double.parseDouble(invoice.getAmount().toString());
		}
		return amount;
	}

	@RequestMapping(value = {
			"/getSearchValue/{attribute}" }, method = RequestMethod.POST, produces = "application/json")

	public @ResponseBody List<Invoice> getInvoices(@PathVariable String attribute, @RequestParam String term,
			HttpServletResponse response) {
		if (attribute.equals("Name") || attribute.equals("Place"))
			return invoiceService.suggestSearchResult(attribute, term);
		return null;

	}
	

}
