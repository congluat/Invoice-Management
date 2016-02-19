package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import service.InvoiceService;

@Controller
public class HomeController {
	
	@Autowired
	@Qualifier("invoiceService")
	InvoiceService invoiceService;

	@RequestMapping(value = "/welcome" , method = RequestMethod.GET)
	public String welcome() {
		invoiceService.getAllInvoices();
		return "template";
	}
}
