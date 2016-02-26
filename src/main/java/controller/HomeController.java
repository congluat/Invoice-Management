package controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.Category;
import service.CategoryService;
import service.InvoiceService;

@Controller
public class HomeController {

	@Autowired
	@Qualifier("invoiceService")
	InvoiceService invoiceService;

	@Autowired
	@Qualifier("categoryService")
	CategoryService cateService;

	@RequestMapping(value = { "/", "/welcome","/dashboard" }, method = RequestMethod.GET)
	public String welcome(ModelMap model) {
		model.addAttribute("title", "Dashboard");
		return "home";
	}

}
