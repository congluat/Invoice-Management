package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

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

@Controller
public class HomeController{

	@Autowired
	@Qualifier("invoiceService")
	InvoiceService invoiceService;

	@Autowired
	@Qualifier("categoryService")
	CategoryService cateService;

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

	// @RequestMapping(value = { "/getSearchValue" }, method =
	// RequestMethod.POST, produces = "application/json")
	//
	// public @ResponseBody List<Invoice> getEmployees(@RequestParam String
	// term, HttpServletResponse response) {
	// return suggestSearchResult(term);
	// }
	//
	// private List<Invoice> suggestSearchResult(String empName) {
	//
	// //List<Category> result = new ArrayList<Category>();
	// List<Invoice> result = new ArrayList<Invoice>();
	// result = invoiceService.getInvoiceAttribute(empName);
	// // iterate a list and filter by tagName
	// return result;
	// }

	public @ResponseBody List<Invoice> getInvoices(@RequestParam String term, HttpServletResponse response) {
		return suggestSearchResult(term);
	}

	private List<Invoice> suggestSearchResult(String empName) {

		// List<Category> result = new ArrayList<Category>();
		List<Invoice> result = new ArrayList<Invoice>();
		// result = invoiceService.getInvoiceAttribute(empName);
		
		for (int i = result.size()-2; i >= 0; i--) {
			   if (result.get(i).getName().equals(result.get(i+1).getName()))
			          result.remove(i+1);
			  }
		
		
		// iterate a list and filter by tagName
		return result;
	}

}
