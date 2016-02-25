package controller;

import java.math.BigDecimal;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@RequestMapping("/save")
	public String create(HttpSession session) {
		Category cate = cateService.getById(1);
		Invoice invoice = new Invoice();
		invoice.setCategory(cate);
		invoice.setName("name");
		invoice.setUser((User) session.getAttribute("user"));
		invoice.setAmount(BigDecimal.valueOf(520.0));
		invoice.setComment("comment");
		invoice.setIsWarning(true);
		invoice.setPlace("place");
		invoice.setTime(new Date());
		
		invoiceService.create(invoice);
		return "home";
	}
	@RequestMapping(value = "/edit/{id}")
	public String update(HttpSession session,@PathVariable Integer id){
		Category cate = cateService.getById(2);
		Invoice invoice = invoiceService.getById(id);
		invoice.setAmount(BigDecimal.valueOf(1000));
		invoice.setCategory(cate);
		invoice.setUser((User) session.getAttribute("user"));
		invoiceService.update(invoice);
		return "home";
	}
}
