package controller;



import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping("/page")
	public String pageGetCateMonths(ModelMap model) {
		List<Object[]> list = reportService.getReportDataEveryMonth();
		model.addAttribute("datalist", list);
		return "rCate-Months-ng";
	}
	
	
	@RequestMapping(value="/cateM", method= RequestMethod.GET)
	@ResponseBody
	public List<Invoice> InvoiceCatebyMonths(HttpServletRequest request) {
		Integer cateId = Integer.parseInt(request.getParameter("category"));
		Integer month = Integer.parseInt(request.getParameter("month"));
		List<Invoice> list = reportService.getInoiveByCateMonths(cateId, month);
		return list;
	}
	
	@RequestMapping(value="/cateMd2d", method= RequestMethod.GET)
	@ResponseBody
	public List<Invoice> getInvoiced2d(HttpServletRequest request,
							@RequestParam String startdate,
							@RequestParam String endate) throws ParseException {
		Integer cateId = Integer.parseInt(request.getParameter("cateId"));
		List<Invoice> list = reportService.getInvoiceD2D(cateId, startdate, endate);
		return list;
	}
	
	@RequestMapping(value="/getReportByMonth", method= RequestMethod.GET)
	@ResponseBody
	public List<Object[]> getReportByMonth(@RequestParam String selectdate) {
		int month = Integer.parseInt(selectdate.substring(0,2));
		int year = Integer.parseInt(selectdate.substring(3));
		return reportService.getReportDataByMonth(month, year);
	}
	
	@RequestMapping(value="/getReportByYear", method= RequestMethod.GET)
	@ResponseBody
	public List<Object[]> getReportByYear(@RequestParam String selectyear) {
		int year = Integer.parseInt(selectyear);
		return reportService.getReportDataByYear(year);
	}
	
	@ModelAttribute("categories")
	public List<Category> listcates(){
		List<Category> cateList = cateService.getAllCategories();
		return cateList;
	}
	
}
