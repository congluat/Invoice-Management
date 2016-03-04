package controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;


import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Category;
import model.Invoice;
import service.CategoryService;
import service.ReportService;

@Controller
@RequestMapping("/Report")
public class ReportController {
	@Autowired
	@Qualifier("reportService")
	ReportService reportService;
	
	@Autowired
	@Qualifier("categoryService")
	CategoryService cateService;
	
	@Autowired
	SessionFactory sessionFactory;
	
	@RequestMapping("/by-CateMonths")
	public String pageGetCateMonths(ModelMap model) {
		List<Category> cateList = cateService.getAllCategories();
		model.addAttribute("categories", cateList);
		return "rCate-Months";
	}
	
	
	@RequestMapping(value="/cateM", method= RequestMethod.GET)
	@ResponseBody
	public List<Invoice> InvoiceCatebyMonths(HttpServletRequest request) {
		Integer category = Integer.parseInt(request.getParameter("category"));
		Integer month = Integer.parseInt(request.getParameter("month"));
		List<Invoice> list = reportService.getInoiveByCateMonths(category, month);
		return list;
	}
	
}
