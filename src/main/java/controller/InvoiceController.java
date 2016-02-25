package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import service.CategoryService;
import service.InvoiceService;

@Controller
@RequestMapping("/Invoices")
public class InvoiceController {

	@Autowired
	@Qualifier("invoiceService")
	InvoiceService invoiceService;
	
	
	
}
